# set number of nodes
set opt(nn) 101

# set activity file
set opt(af) $opt(config-path)
append opt(af) /activity.tcl

# set mobility file
set opt(mf) $opt(config-path)
append opt(mf) /mobility.tcl

# set start/stop time
set opt(start) 0.0
set opt(stop) 200.0

# set floor size
set opt(x) 2304.77
set opt(y) 2439.11
set opt(min-x) 39.0
set opt(min-y) 491.45

