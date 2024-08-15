# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 114 \
    name C \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename C \
    op interface \
    ports { C_address0 { O 10 vector } C_ce0 { O 1 bit } C_we0 { O 1 bit } C_d0 { O 32 vector } C_address1 { O 10 vector } C_ce1 { O 1 bit } C_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'C'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 115 \
    name A \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename A \
    op interface \
    ports { A_address0 { O 10 vector } A_ce0 { O 1 bit } A_q0 { I 32 vector } A_address1 { O 10 vector } A_ce1 { O 1 bit } A_q1 { I 32 vector } A_address2 { O 10 vector } A_ce2 { O 1 bit } A_q2 { I 32 vector } A_address3 { O 10 vector } A_ce3 { O 1 bit } A_q3 { I 32 vector } A_address4 { O 10 vector } A_ce4 { O 1 bit } A_q4 { I 32 vector } A_address5 { O 10 vector } A_ce5 { O 1 bit } A_q5 { I 32 vector } A_address6 { O 10 vector } A_ce6 { O 1 bit } A_q6 { I 32 vector } A_address7 { O 10 vector } A_ce7 { O 1 bit } A_q7 { I 32 vector } A_address8 { O 10 vector } A_ce8 { O 1 bit } A_q8 { I 32 vector } A_address9 { O 10 vector } A_ce9 { O 1 bit } A_q9 { I 32 vector } A_address10 { O 10 vector } A_ce10 { O 1 bit } A_q10 { I 32 vector } A_address11 { O 10 vector } A_ce11 { O 1 bit } A_q11 { I 32 vector } A_address12 { O 10 vector } A_ce12 { O 1 bit } A_q12 { I 32 vector } A_address13 { O 10 vector } A_ce13 { O 1 bit } A_q13 { I 32 vector } A_address14 { O 10 vector } A_ce14 { O 1 bit } A_q14 { I 32 vector } A_address15 { O 10 vector } A_ce15 { O 1 bit } A_q15 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 117 \
    name B \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename B \
    op interface \
    ports { B_address0 { O 10 vector } B_ce0 { O 1 bit } B_q0 { I 32 vector } B_address1 { O 10 vector } B_ce1 { O 1 bit } B_q1 { I 32 vector } B_address2 { O 10 vector } B_ce2 { O 1 bit } B_q2 { I 32 vector } B_address3 { O 10 vector } B_ce3 { O 1 bit } B_q3 { I 32 vector } B_address4 { O 10 vector } B_ce4 { O 1 bit } B_q4 { I 32 vector } B_address5 { O 10 vector } B_ce5 { O 1 bit } B_q5 { I 32 vector } B_address6 { O 10 vector } B_ce6 { O 1 bit } B_q6 { I 32 vector } B_address7 { O 10 vector } B_ce7 { O 1 bit } B_q7 { I 32 vector } B_address8 { O 10 vector } B_ce8 { O 1 bit } B_q8 { I 32 vector } B_address9 { O 10 vector } B_ce9 { O 1 bit } B_q9 { I 32 vector } B_address10 { O 10 vector } B_ce10 { O 1 bit } B_q10 { I 32 vector } B_address11 { O 10 vector } B_ce11 { O 1 bit } B_q11 { I 32 vector } B_address12 { O 10 vector } B_ce12 { O 1 bit } B_q12 { I 32 vector } B_address13 { O 10 vector } B_ce13 { O 1 bit } B_q13 { I 32 vector } B_address14 { O 10 vector } B_ce14 { O 1 bit } B_q14 { I 32 vector } B_address15 { O 10 vector } B_ce15 { O 1 bit } B_q15 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'B'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name indvars_iv17_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_indvars_iv17_i \
    op interface \
    ports { indvars_iv17_i { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name B_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_B_load \
    op interface \
    ports { B_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name A_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_A_load_1 \
    op interface \
    ports { A_load_1 { I 32 vector } } \
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
set InstName main_flow_control_loop_pipe_sequential_init_U
set CompName main_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix main_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


