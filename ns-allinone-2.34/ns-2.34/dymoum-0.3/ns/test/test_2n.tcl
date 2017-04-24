# ======================================================================
# Define options
# ======================================================================
set opt(chan)           Channel/WirelessChannel  ;# channel type
set opt(prop)           Propagation/TwoRayGround ;# radio-propagation model
set opt(netif)          Phy/WirelessPhy          ;# network interface type
set opt(mac)            Mac/802_11               ;# MAC type
set opt(ifq)            Queue/DropTail/PriQueue  ;# interface queue type
set opt(ll)             LL                       ;# link layer type
set opt(ant)            Antenna/OmniAntenna      ;# antenna model
set opt(ifqlen)         50                       ;# max packet in ifq
set opt(nn)             2                        ;# number of mobilenodes
set opt(adhocRouting)   DYMOUM                   ;# routing protocol

set opt(cp)             ""                       ;# connection pattern file
set opt(sc)             ""                       ;# node movement file. 

set opt(x)              400                      ;# x coordinate of topology
set opt(y)              600                      ;# y coordinate of topology
set opt(seed)           0.0                      ;# seed for random number gen.
set opt(stop)           40                       ;# time to stop simulation

set opt(cbr-start)      10.0
# ============================================================================

#
# check for random seed
#
if {$opt(seed) > 0} {
    puts "Seeding Random number generator with $opt(seed)\n"
    ns-random $opt(seed)
}

#
# create simulator instance
#
set ns_ [new Simulator]

#
# control DYMOUM behaviour from this script
#
Agent/DYMOUM set debug_ true
Agent/DYMOUM set no_path_acc_ true
Agent/DYMOUM set reissue_rreq_ false
Agent/DYMOUM set s_bit_ true
Agent/DYMOUM set hello_ival_ 1

#
# open traces
#
set tracefd  [open test_2n.tr w]
set namtrace [open test_2n.nam w]
$ns_ trace-all $tracefd
$ns_ namtrace-all-wireless $namtrace $opt(x) $opt(y)

#
# create topography object
#
set topo [new Topography]

#
# define topology
#
$topo load_flatgrid $opt(x) $opt(y)

#
# create God
#
create-god $opt(nn)

#
# configure mobile nodes
#
$ns_ node-config -adhocRouting $opt(adhocRouting) \
                 -llType $opt(ll) \
                 -macType $opt(mac) \
                 -ifqType $opt(ifq) \
                 -ifqLen $opt(ifqlen) \
                 -antType $opt(ant) \
                 -propType $opt(prop) \
                 -phyType $opt(netif) \
                 -channelType $opt(chan) \
                 -topoInstance $topo \
                 -wiredRouting OFF \
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace OFF

for {set i 0} {$i < $opt(nn)} {incr i} {
    set node_($i) [$ns_ node]
}

#
# positions
#
$node_(0) set X_ 200.0
$node_(0) set Y_ 200.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 300.0
$node_(1) set Y_ 200.0
$node_(1) set Z_ 0.0

#
# setup UDP connection
#
set udp [new Agent/UDP]
set null [new Agent/Null]
$ns_ attach-agent $node_(0) $udp
$ns_ attach-agent $node_(1) $null
$ns_ connect $udp $null
set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 512
$cbr set rate_ 20Kb
$cbr attach-agent $udp
$ns_ at $opt(cbr-start) "$cbr start"

#
# print (in the trace file) routing table and other
# internal data structures on a per-node basis
# TODO: implement this
#$ns_ at 15.0 "[$node_(0) agent 255] print_rtable"

#
# source connection-pattern and node-movement scripts
#
if { $opt(cp) == "" } {
    puts "*** NOTE: no connection pattern specified."
    set opt(cp) "none"
} else {
    puts "Loading connection pattern..."
    source $opt(cp)
}
if { $opt(sc) == "" } {
    puts "*** NOTE: no scenario file specified."
    set opt(sc) "none"
} else {
    puts "Loading scenario file..."
    source $opt(sc)
    puts "Load complete..."
}

#
# define initial node position in nam
#
for {set i 0} {$i < $opt(nn)} {incr i} {
    $ns_ initial_node_pos $node_($i) 20
}     

#
# tell all nodes when the simulation ends
#
for {set i 0} {$i < $opt(nn) } {incr i} {
    $ns_ at $opt(stop).0 "$node_($i) reset";
}

$ns_ at $opt(stop).0002 "puts \"NS EXITING...\" ; $ns_ halt"
$ns_ at $opt(stop).0001 "stop"

proc stop {} {
    global ns_ tracefd namtrace
    $ns_ flush-trace
    close $tracefd
    close $namtrace
}

#
# begin simulation
#
puts "Starting Simulation..."

$ns_ run
