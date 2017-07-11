# set number of nodes
set opt(nn) 140

# set activity file
set opt(af) $opt(config-path)
append opt(af) /activity.tcl

# set mobility file
set opt(mf) $opt(config-path)
append opt(mf) /mobility.tcl

# set start/stop time
set opt(start) 0.0
set opt(stop) 300.0

# set floor size
set opt(x) 2102.54
set opt(y) 2582.97
set opt(min-x) 22.22
set opt(min-y) 231.07

