open_project data/base_instances/AES
add_files { data/benchmarks/aes/aes_dec.c data/benchmarks/aes/aes_enc.c data/benchmarks/aes/aes_enc.c data/benchmarks/aes/aes_key.c data/benchmarks/aes/aes.c }
set_top aes_main
open_solution -reset solution0
config_array_partition -throughput_driven off
set_part xcu50-fsvh2104-2-e
create_clock -period 8 -name default
source data/base_directives/aes.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit