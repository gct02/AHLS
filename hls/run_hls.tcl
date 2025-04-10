open_project SHA
add_files { data/benchmarks/sha/sha.c }
set_top sha_stream
open_solution -reset solution0
config_array_partition -throughput_driven off
config_compile -pipeline_loops 9999999
config_unroll -tripcount_threshold 0
set_part xcu50-fsvh2104-2-e
create_clock -period 8 -name default
source data/base_directives/sha.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
