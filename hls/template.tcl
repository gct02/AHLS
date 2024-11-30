open_project $proj -reset
add_files { $src }
set_top $top
open_solution -reset solution1 -flow_target vivado
set_part { xcu50-fsvh2104-2-e }
create_clock -period 5 -name default
csynth_design
exit