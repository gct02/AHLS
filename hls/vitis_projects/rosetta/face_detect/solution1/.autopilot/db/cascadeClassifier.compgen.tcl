# This script segment is generated automatically by AutoPilot

set name face_detect_dmul_64ns_64ns_64_14_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {fulldsp} LATENCY 13 ALLOW_PRAGMA 1
}


set name face_detect_dcmp_64ns_64ns_1_4_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dcmp} IMPL {auto} LATENCY 3 ALLOW_PRAGMA 1
}


set name face_detect_sitodp_64s_64_7_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sitodp} IMPL {auto} LATENCY 6 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler face_detect_cascadeClassifier_stages_array_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler face_detect_cascadeClassifier_stages_thresh_array_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


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
    id 59 \
    name SUM1_data \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SUM1_data \
    op interface \
    ports { SUM1_data_address0 { O 17 vector } SUM1_data_ce0 { O 1 bit } SUM1_data_q0 { I 32 vector } SUM1_data_address1 { O 17 vector } SUM1_data_ce1 { O 1 bit } SUM1_data_q1 { I 32 vector } SUM1_data_address2 { O 17 vector } SUM1_data_ce2 { O 1 bit } SUM1_data_q2 { I 32 vector } SUM1_data_address3 { O 17 vector } SUM1_data_ce3 { O 1 bit } SUM1_data_q3 { I 32 vector } SUM1_data_address4 { O 17 vector } SUM1_data_ce4 { O 1 bit } SUM1_data_q4 { I 32 vector } SUM1_data_address5 { O 17 vector } SUM1_data_ce5 { O 1 bit } SUM1_data_q5 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SUM1_data'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 60 \
    name SQSUM1_data \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SQSUM1_data \
    op interface \
    ports { SQSUM1_data_address0 { O 17 vector } SQSUM1_data_ce0 { O 1 bit } SQSUM1_data_q0 { I 32 vector } SQSUM1_data_address1 { O 17 vector } SQSUM1_data_ce1 { O 1 bit } SQSUM1_data_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SQSUM1_data'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name pt_x_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pt_x_val \
    op interface \
    ports { pt_x_val { I 17 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name pt_y_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pt_y_val \
    op interface \
    ports { pt_y_val { I 8 vector } } \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 6 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


