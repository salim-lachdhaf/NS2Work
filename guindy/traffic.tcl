#
# nodes: 10, max conn: 8, send rate: 50kb, seed: 1.0
#
#
# 1 connecting to 2 at time 2.5568388786897245
#
#$ns_ duplex-link $node_(1) $node_(2) 1Mb 10ms DropTail
set udp_(0) [new Agent/UDP]
$ns_ attach-agent $node_(1) $udp_(0)
set null_(0) [new Agent/Null]
$ns_ attach-agent $node_(2) $null_(0)
set cbr_(0) [new Application/Traffic/CBR]
$cbr_(0) set packetSize_ 512
$cbr_(0) set random_ false
$cbr_(0) set interval_ 1
$cbr_(0) set rate_ 50kb
$cbr_(0) set maxpkts_ 10000
$cbr_(0) attach-agent $udp_(0)
$ns_ connect $udp_(0) $null_(0)
$ns_ at 2 "$cbr_(0) start"
#
# 4 connecting to 5 at time 56.333118917575632
#
#$ns_ duplex-link $node_(4) $node_(5) 1Mb 10ms DropTail
set udp_(1) [new Agent/UDP]
$ns_ attach-agent $node_(4) $udp_(1)
set null_(1) [new Agent/Null]
$ns_ attach-agent $node_(5) $null_(1)
set cbr_(1) [new Application/Traffic/CBR]
$cbr_(1) set packetSize_ 512
$cbr_(1) set random_ false
$cbr_(1) set rate_ 50kb
$cbr_(1) set interval_ 1
$cbr_(1) set maxpkts_ 10000
$cbr_(1) attach-agent $udp_(1)
$ns_ connect $udp_(1) $null_(1)
$ns_ at 56 "$cbr_(1) start"
#
# 4 connecting to 6 at time 146.96568928983328
#
#$ns_ duplex-link $node_(4) $node_(6) 1Mb 10ms DropTail
set udp_(2) [new Agent/UDP]
$ns_ attach-agent $node_(4) $udp_(2)
set null_(2) [new Agent/Null]
$ns_ attach-agent $node_(6) $null_(2)
set cbr_(2) [new Application/Traffic/CBR]
$cbr_(2) set packetSize_ 512
$cbr_(2) set random_ false
$cbr_(2) set interval_ 0.01
$cbr_(2) set rate_ 50kb
$cbr_(2) set maxpkts_ 10000
$cbr_(2) attach-agent $udp_(2)
$ns_ connect $udp_(2) $null_(2)
$ns_ at 14 "$cbr_(2) start"
#
# 6 connecting to 7 at time 55.634230382570173
#
#$ns_ duplex-link $node_(6) $node_(7) 1Mb 10ms DropTail
set udp_(3) [new Agent/UDP]
$ns_ attach-agent $node_(6) $udp_(3)
set null_(3) [new Agent/Null]
$ns_ attach-agent $node_(15) $null_(3)
set cbr_(3) [new Application/Traffic/CBR]
$cbr_(3) set packetSize_ 512
$cbr_(3) set random_ false
$cbr_(3) set interval_ 1
$cbr_(3) set rate_ 50kb
$cbr_(3) set maxpkts_ 10000
$cbr_(3) attach-agent $udp_(3)
$ns_ connect $udp_(3) $null_(3)
$ns_ at 55 "$cbr_(3) start"
#
# 7 connecting to 8 at time 29.546173154165118
#
#$ns_ duplex-link $node_(7) $node_(8) 1Mb 10ms DropTail
set udp_(4) [new Agent/UDP]
$ns_ attach-agent $node_(7) $udp_(4)
set null_(4) [new Agent/Null]
$ns_ attach-agent $node_(8) $null_(4)
set cbr_(4) [new Application/Traffic/CBR]
$cbr_(4) set packetSize_ 512
$cbr_(4) set random_ false
$cbr_(4) set interval_ 1
$cbr_(4) set rate_ 50kb
$cbr_(4) set maxpkts_ 10000
$cbr_(4) attach-agent $udp_(4)
$ns_ connect $udp_(4) $null_(4)
$ns_ at 29 "$cbr_(4) start"
#
# 7 connecting to 9 at time 7.7030203154790309
#
#$ns_ duplex-link $node_(7) $node_(9) 1Mb 10ms DropTail
set udp_(5) [new Agent/UDP]
$ns_ attach-agent $node_(7) $udp_(5)
set null_(5) [new Agent/Null]
$ns_ attach-agent $node_(9) $null_(5)
set cbr_(5) [new Application/Traffic/CBR]
$cbr_(5) set packetSize_ 512
$cbr_(5) set random_ false
$cbr_(5) set interval_ 1
$cbr_(5) set rate_ 50kb
$cbr_(5) set maxpkts_ 10000
$cbr_(5) attach-agent $udp_(5)
$ns_ connect $udp_(5) $null_(5)
$ns_ at 7 "$cbr_(5) start"
#
# 8 connecting to 9 at time 20.48548468411224
#
#$ns_ duplex-link $node_(8) $node_(9) 1Mb 10ms DropTail
set udp_(6) [new Agent/UDP]
$ns_ attach-agent $node_(8) $udp_(6)
set null_(6) [new Agent/Null]
$ns_ attach-agent $node_(9) $null_(6)
set cbr_(6) [new Application/Traffic/CBR]
$cbr_(6) set packetSize_ 512
$cbr_(6) set random_ false
$cbr_(6) set interval_ 1
$cbr_(6) set rate_ 50kb
$cbr_(6) set maxpkts_ 10000
$cbr_(6) attach-agent $udp_(6)
$ns_ connect $udp_(6) $null_(6)
$ns_ at 20 "$cbr_(6) start"
#
# 9 connecting to 10 at time 76.258212521792487
#
#$ns_ duplex-link $node_(9) $node_(10) 1Mb 10ms DropTail
set udp_(7) [new Agent/UDP]
$ns_ attach-agent $node_(11) $udp_(7)
set null_(7) [new Agent/Null]
$ns_ attach-agent $node_(10) $null_(7)
set cbr_(7) [new Application/Traffic/CBR]
$cbr_(7) set packetSize_ 512
$cbr_(7) set random_ false
$cbr_(7) set interval_ 1
$cbr_(7) set rate_ 50kb
$cbr_(7) set maxpkts_ 10000
$cbr_(7) attach-agent $udp_(7)
$ns_ connect $udp_(7) $null_(7)
$ns_ at 76 "$cbr_(7) start"
#
#Total sources/connections: 6/8
#
