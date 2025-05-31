# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name activations3_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_2 \
    op interface \
    ports { activations3_2 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name activations3_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_1 \
    op interface \
    ports { activations3_1 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name activations3_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_0 \
    op interface \
    ports { activations3_0 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name dactivations3_2_03 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_2_03 \
    op interface \
    ports { dactivations3_2_03 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name dactivations3_1_02 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_1_02 \
    op interface \
    ports { dactivations3_1_02 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name dactivations3_0_01 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_0_01 \
    op interface \
    ports { dactivations3_0_01 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name activations3_2_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_2_4_out \
    op interface \
    ports { activations3_2_4_out { O 64 vector } activations3_2_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name activations3_1_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_1_4_out \
    op interface \
    ports { activations3_1_4_out { O 64 vector } activations3_1_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name activations3_0_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activations3_0_4_out \
    op interface \
    ports { activations3_0_4_out { O 64 vector } activations3_0_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name dactivations3_2_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_2_1_out \
    op interface \
    ports { dactivations3_2_1_out { O 64 vector } dactivations3_2_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name dactivations3_1_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_1_1_out \
    op interface \
    ports { dactivations3_1_1_out { O 64 vector } dactivations3_1_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name dactivations3_0_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dactivations3_0_1_out \
    op interface \
    ports { dactivations3_0_1_out { O 64 vector } dactivations3_0_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName backprop_flow_control_loop_pipe_sequential_init_U
set CompName backprop_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix backprop_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


