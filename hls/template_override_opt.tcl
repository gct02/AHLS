open_project $proj -reset

add_files { $src }

set_top $top

open_solution -reset solution1 -flow_target vivado

set_part { xcu50-fsvh2104-2-e }
create_clock -period 5 -name default

set ::LLVM_CUSTOM_OPT $OPT
set ::LLVM_CUSTOM_INPUT $input_ir
set ::LLVM_CUSTOM_OUTPUT $output_ir
set ::LLVM_CUSTOM_CMD { $LLVM_CUSTOM_OPT -load $AHLS_LLVM_LIB -remove-iof < $LLVM_CUSTOM_INPUT > $LLVM_CUSTOM_OUTPUT }

# Run HLS
csynth_design

# Run RTL implementation
export_design -evaluate verilog -format ip_catalog

exit