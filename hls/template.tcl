open_project hls/vitis_projects/$b/$p -reset
add_files { $f }
set_top main
open_solution -reset solution1 -flow_target vivado
set_part { xc7z020clg400-1 }
create_clock -period 5 -name default
csynth_design
exit