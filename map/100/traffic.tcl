proc RandomInteger {max} {
     return [expr {int(rand()*($max-1))}]
}	

for {set i 0} {$i < $val(nn) } {incr i} {
	#Random time
	set stime [RandomInteger $val(stop)]


	#Pick Random Node
	set randomNode [RandomInteger $val(nn)]

	#choisir random node <> to the source (i)
	while { $randomNode== $i } {
		set randomNode [RandomInteger $val(nn)]
	} 

	 #puts "$i connect to $randomNode at $stime"

	set udp_($i) [new Agent/UDP]
	$ns_ attach-agent $node_($i) $udp_($i)
	set null_($i) [new Agent/Null]
	$ns_ attach-agent $node_($randomNode) $null_($i)
	set cbr_($i) [new Application/Traffic/CBR]
	$cbr_($i) set packetSize_ 512
	$cbr_($i) set interval_ 0.2
	$cbr_($i) set random_ 0
	$cbr_($i) set maxpkts_ 20
	$cbr_($i) attach-agent $udp_($i)
	$ns_ connect $udp_($i) $null_($i)
	$ns_ at $stime "$cbr_($i) start"
}
