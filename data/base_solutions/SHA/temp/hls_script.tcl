
open_project "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/SHA"
set_top "sha_stream"
add_files {/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/sha/sha.c}
open_solution -reset "solution0"
set_part {xcu50-fsvh2104-2-e}
create_clock -period 8 -name default
config_array_partition -throughput_driven off
source /home/gabriel/Documents/RAISE/dataset_gen/base_solutions/SHA/temp/directives.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
