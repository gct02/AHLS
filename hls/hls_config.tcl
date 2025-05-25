open_project data/base_instances/ADPCM
add_files { data/benchmarks/adpcm/adpcm.c }
set_top adpcm_main
open_solution -reset solution0
config_array_partition -throughput_driven off
set_part xcu50-fsvh2104-2-e
create_clock -period 8 -name default
source data/base_directives/adpcm.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit