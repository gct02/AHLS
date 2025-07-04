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
    id 11 \
    name buffer_r \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename buffer_r \
    op interface \
    ports { buffer_r_address0 { O 14 vector } buffer_r_ce0 { O 1 bit } buffer_r_q0 { I 8 vector } buffer_r_address1 { O 14 vector } buffer_r_ce1 { O 1 bit } buffer_r_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'buffer_r'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 16 \
    name sha_info_data \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename sha_info_data \
    op interface \
    ports { sha_info_data_address0 { O 4 vector } sha_info_data_ce0 { O 1 bit } sha_info_data_we0 { O 1 bit } sha_info_data_d0 { O 32 vector } sha_info_data_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sha_info_data'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 17 \
    name sha_info_digest \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename sha_info_digest \
    op interface \
    ports { sha_info_digest_address0 { O 3 vector } sha_info_digest_ce0 { O 1 bit } sha_info_digest_we0 { O 1 bit } sha_info_digest_d0 { O 32 vector } sha_info_digest_q0 { I 32 vector } sha_info_digest_address1 { O 3 vector } sha_info_digest_ce1 { O 1 bit } sha_info_digest_we1 { O 1 bit } sha_info_digest_d1 { O 32 vector } sha_info_digest_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sha_info_digest'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name buffer_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_offset \
    op interface \
    ports { buffer_offset { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name count \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_count \
    op interface \
    ports { count { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name sha_info_count_lo \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_sha_info_count_lo \
    op interface \
    ports { sha_info_count_lo_i { I 32 vector } sha_info_count_lo_o { O 32 vector } sha_info_count_lo_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name sha_info_count_hi \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_sha_info_count_hi \
    op interface \
    ports { sha_info_count_hi_i { I 32 vector } sha_info_count_hi_o { O 32 vector } sha_info_count_hi_o_ap_vld { O 1 bit } } \
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


