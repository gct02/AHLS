# This script segment is generated automatically by AutoPilot

set name fft_faddfsub_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fsub} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name fft_faddfsub_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name fft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name fft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name fft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name fft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 117 \
    name X_R_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_0 \
    op interface \
    ports { X_R_0_address0 { O 10 vector } X_R_0_ce0 { O 1 bit } X_R_0_we0 { O 1 bit } X_R_0_d0 { O 32 vector } X_R_0_q0 { I 32 vector } X_R_0_address1 { O 10 vector } X_R_0_ce1 { O 1 bit } X_R_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 118 \
    name X_R_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_1 \
    op interface \
    ports { X_R_1_address0 { O 10 vector } X_R_1_ce0 { O 1 bit } X_R_1_we0 { O 1 bit } X_R_1_d0 { O 32 vector } X_R_1_q0 { I 32 vector } X_R_1_address1 { O 10 vector } X_R_1_ce1 { O 1 bit } X_R_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 119 \
    name X_R_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_2 \
    op interface \
    ports { X_R_2_address0 { O 10 vector } X_R_2_ce0 { O 1 bit } X_R_2_we0 { O 1 bit } X_R_2_d0 { O 32 vector } X_R_2_q0 { I 32 vector } X_R_2_address1 { O 10 vector } X_R_2_ce1 { O 1 bit } X_R_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 120 \
    name X_R_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_3 \
    op interface \
    ports { X_R_3_address0 { O 10 vector } X_R_3_ce0 { O 1 bit } X_R_3_we0 { O 1 bit } X_R_3_d0 { O 32 vector } X_R_3_q0 { I 32 vector } X_R_3_address1 { O 10 vector } X_R_3_ce1 { O 1 bit } X_R_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 121 \
    name X_R_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_4 \
    op interface \
    ports { X_R_4_address0 { O 10 vector } X_R_4_ce0 { O 1 bit } X_R_4_we0 { O 1 bit } X_R_4_d0 { O 32 vector } X_R_4_q0 { I 32 vector } X_R_4_address1 { O 10 vector } X_R_4_ce1 { O 1 bit } X_R_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 122 \
    name X_R_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_5 \
    op interface \
    ports { X_R_5_address0 { O 10 vector } X_R_5_ce0 { O 1 bit } X_R_5_we0 { O 1 bit } X_R_5_d0 { O 32 vector } X_R_5_q0 { I 32 vector } X_R_5_address1 { O 10 vector } X_R_5_ce1 { O 1 bit } X_R_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 123 \
    name X_R_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_6 \
    op interface \
    ports { X_R_6_address0 { O 10 vector } X_R_6_ce0 { O 1 bit } X_R_6_we0 { O 1 bit } X_R_6_d0 { O 32 vector } X_R_6_q0 { I 32 vector } X_R_6_address1 { O 10 vector } X_R_6_ce1 { O 1 bit } X_R_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 124 \
    name X_R_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_R_7 \
    op interface \
    ports { X_R_7_address0 { O 10 vector } X_R_7_ce0 { O 1 bit } X_R_7_we0 { O 1 bit } X_R_7_d0 { O 32 vector } X_R_7_q0 { I 32 vector } X_R_7_address1 { O 10 vector } X_R_7_ce1 { O 1 bit } X_R_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_R_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 125 \
    name X_I_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_0 \
    op interface \
    ports { X_I_0_address0 { O 10 vector } X_I_0_ce0 { O 1 bit } X_I_0_we0 { O 1 bit } X_I_0_d0 { O 32 vector } X_I_0_q0 { I 32 vector } X_I_0_address1 { O 10 vector } X_I_0_ce1 { O 1 bit } X_I_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 126 \
    name X_I_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_1 \
    op interface \
    ports { X_I_1_address0 { O 10 vector } X_I_1_ce0 { O 1 bit } X_I_1_we0 { O 1 bit } X_I_1_d0 { O 32 vector } X_I_1_q0 { I 32 vector } X_I_1_address1 { O 10 vector } X_I_1_ce1 { O 1 bit } X_I_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 127 \
    name X_I_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_2 \
    op interface \
    ports { X_I_2_address0 { O 10 vector } X_I_2_ce0 { O 1 bit } X_I_2_we0 { O 1 bit } X_I_2_d0 { O 32 vector } X_I_2_q0 { I 32 vector } X_I_2_address1 { O 10 vector } X_I_2_ce1 { O 1 bit } X_I_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 128 \
    name X_I_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_3 \
    op interface \
    ports { X_I_3_address0 { O 10 vector } X_I_3_ce0 { O 1 bit } X_I_3_we0 { O 1 bit } X_I_3_d0 { O 32 vector } X_I_3_q0 { I 32 vector } X_I_3_address1 { O 10 vector } X_I_3_ce1 { O 1 bit } X_I_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 129 \
    name X_I_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_4 \
    op interface \
    ports { X_I_4_address0 { O 10 vector } X_I_4_ce0 { O 1 bit } X_I_4_we0 { O 1 bit } X_I_4_d0 { O 32 vector } X_I_4_q0 { I 32 vector } X_I_4_address1 { O 10 vector } X_I_4_ce1 { O 1 bit } X_I_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 130 \
    name X_I_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_5 \
    op interface \
    ports { X_I_5_address0 { O 10 vector } X_I_5_ce0 { O 1 bit } X_I_5_we0 { O 1 bit } X_I_5_d0 { O 32 vector } X_I_5_q0 { I 32 vector } X_I_5_address1 { O 10 vector } X_I_5_ce1 { O 1 bit } X_I_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 131 \
    name X_I_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_6 \
    op interface \
    ports { X_I_6_address0 { O 10 vector } X_I_6_ce0 { O 1 bit } X_I_6_we0 { O 1 bit } X_I_6_d0 { O 32 vector } X_I_6_q0 { I 32 vector } X_I_6_address1 { O 10 vector } X_I_6_ce1 { O 1 bit } X_I_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 132 \
    name X_I_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename X_I_7 \
    op interface \
    ports { X_I_7_address0 { O 10 vector } X_I_7_ce0 { O 1 bit } X_I_7_we0 { O 1 bit } X_I_7_d0 { O 32 vector } X_I_7_q0 { I 32 vector } X_I_7_address1 { O 10 vector } X_I_7_ce1 { O 1 bit } X_I_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X_I_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 133 \
    name cos_coefficients_table \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cos_coefficients_table \
    op interface \
    ports { cos_coefficients_table_address0 { O 9 vector } cos_coefficients_table_ce0 { O 1 bit } cos_coefficients_table_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cos_coefficients_table'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 134 \
    name sin_coefficients_table \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename sin_coefficients_table \
    op interface \
    ports { sin_coefficients_table_address0 { O 9 vector } sin_coefficients_table_ce0 { O 1 bit } sin_coefficients_table_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sin_coefficients_table'"
}
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


