
open_project "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES"
set_top "aes_main"
add_files {/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_dec.c /home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_enc.c /home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes.c /home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c}
open_solution -reset "solution0"
set_part {xcu50-fsvh2104-2-e}
create_clock -period 8 -name default
config_array_partition -throughput_driven off
source /home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
