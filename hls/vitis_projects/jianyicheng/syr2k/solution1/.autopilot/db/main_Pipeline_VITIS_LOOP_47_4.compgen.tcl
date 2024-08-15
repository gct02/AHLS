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
    id 58 \
    name C_s \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename C_s \
    op interface \
    ports { C_s_address0 { O 10 vector } C_s_ce0 { O 1 bit } C_s_we0 { O 1 bit } C_s_d0 { O 32 vector } C_s_address1 { O 10 vector } C_s_ce1 { O 1 bit } C_s_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'C_s'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 59 \
    name A_s \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename A_s \
    op interface \
    ports { A_s_address0 { O 10 vector } A_s_ce0 { O 1 bit } A_s_q0 { I 32 vector } A_s_address1 { O 10 vector } A_s_ce1 { O 1 bit } A_s_q1 { I 32 vector } A_s_address2 { O 10 vector } A_s_ce2 { O 1 bit } A_s_q2 { I 32 vector } A_s_address3 { O 10 vector } A_s_ce3 { O 1 bit } A_s_q3 { I 32 vector } A_s_address4 { O 10 vector } A_s_ce4 { O 1 bit } A_s_q4 { I 32 vector } A_s_address5 { O 10 vector } A_s_ce5 { O 1 bit } A_s_q5 { I 32 vector } A_s_address6 { O 10 vector } A_s_ce6 { O 1 bit } A_s_q6 { I 32 vector } A_s_address7 { O 10 vector } A_s_ce7 { O 1 bit } A_s_q7 { I 32 vector } A_s_address8 { O 10 vector } A_s_ce8 { O 1 bit } A_s_q8 { I 32 vector } A_s_address9 { O 10 vector } A_s_ce9 { O 1 bit } A_s_q9 { I 32 vector } A_s_address10 { O 10 vector } A_s_ce10 { O 1 bit } A_s_q10 { I 32 vector } A_s_address11 { O 10 vector } A_s_ce11 { O 1 bit } A_s_q11 { I 32 vector } A_s_address12 { O 10 vector } A_s_ce12 { O 1 bit } A_s_q12 { I 32 vector } A_s_address13 { O 10 vector } A_s_ce13 { O 1 bit } A_s_q13 { I 32 vector } A_s_address14 { O 10 vector } A_s_ce14 { O 1 bit } A_s_q14 { I 32 vector } A_s_address15 { O 10 vector } A_s_ce15 { O 1 bit } A_s_q15 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A_s'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 61 \
    name B_s \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename B_s \
    op interface \
    ports { B_s_address0 { O 10 vector } B_s_ce0 { O 1 bit } B_s_q0 { I 32 vector } B_s_address1 { O 10 vector } B_s_ce1 { O 1 bit } B_s_q1 { I 32 vector } B_s_address2 { O 10 vector } B_s_ce2 { O 1 bit } B_s_q2 { I 32 vector } B_s_address3 { O 10 vector } B_s_ce3 { O 1 bit } B_s_q3 { I 32 vector } B_s_address4 { O 10 vector } B_s_ce4 { O 1 bit } B_s_q4 { I 32 vector } B_s_address5 { O 10 vector } B_s_ce5 { O 1 bit } B_s_q5 { I 32 vector } B_s_address6 { O 10 vector } B_s_ce6 { O 1 bit } B_s_q6 { I 32 vector } B_s_address7 { O 10 vector } B_s_ce7 { O 1 bit } B_s_q7 { I 32 vector } B_s_address8 { O 10 vector } B_s_ce8 { O 1 bit } B_s_q8 { I 32 vector } B_s_address9 { O 10 vector } B_s_ce9 { O 1 bit } B_s_q9 { I 32 vector } B_s_address10 { O 10 vector } B_s_ce10 { O 1 bit } B_s_q10 { I 32 vector } B_s_address11 { O 10 vector } B_s_ce11 { O 1 bit } B_s_q11 { I 32 vector } B_s_address12 { O 10 vector } B_s_ce12 { O 1 bit } B_s_q12 { I 32 vector } B_s_address13 { O 10 vector } B_s_ce13 { O 1 bit } B_s_q13 { I 32 vector } B_s_address14 { O 10 vector } B_s_ce14 { O 1 bit } B_s_q14 { I 32 vector } B_s_address15 { O 10 vector } B_s_ce15 { O 1 bit } B_s_q15 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'B_s'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name indvars_iv19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_indvars_iv19 \
    op interface \
    ports { indvars_iv19 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
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
    id 60 \
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
    id 62 \
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


