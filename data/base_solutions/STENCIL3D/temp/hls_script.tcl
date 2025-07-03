
open_project "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/STENCIL3D"
set_top "stencil3d"
add_files {/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/stencil3d/stencil.c}
open_solution -reset "solution0"
set_part {xcu50-fsvh2104-2-e}
create_clock -period 8 -name default
config_array_partition -throughput_driven off
source /home/gabriel/Documents/RAISE/dataset_gen/base_solutions/STENCIL3D/temp/directives.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
