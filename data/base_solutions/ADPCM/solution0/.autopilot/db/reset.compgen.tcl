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
    id 33 \
    name delay_dltx \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename delay_dltx \
    op interface \
    ports { delay_dltx_address0 { O 3 vector } delay_dltx_ce0 { O 1 bit } delay_dltx_we0 { O 1 bit } delay_dltx_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_dltx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name delay_dhx \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename delay_dhx \
    op interface \
    ports { delay_dhx_address0 { O 3 vector } delay_dhx_ce0 { O 1 bit } delay_dhx_we0 { O 1 bit } delay_dhx_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_dhx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name dec_del_dltx \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dec_del_dltx \
    op interface \
    ports { dec_del_dltx_address0 { O 3 vector } dec_del_dltx_ce0 { O 1 bit } dec_del_dltx_we0 { O 1 bit } dec_del_dltx_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_dltx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name dec_del_dhx \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dec_del_dhx \
    op interface \
    ports { dec_del_dhx_address0 { O 3 vector } dec_del_dhx_ce0 { O 1 bit } dec_del_dhx_we0 { O 1 bit } dec_del_dhx_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_dhx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name delay_bpl \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename delay_bpl \
    op interface \
    ports { delay_bpl_address0 { O 3 vector } delay_bpl_ce0 { O 1 bit } delay_bpl_we0 { O 1 bit } delay_bpl_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bpl'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name delay_bph \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename delay_bph \
    op interface \
    ports { delay_bph_address0 { O 3 vector } delay_bph_ce0 { O 1 bit } delay_bph_we0 { O 1 bit } delay_bph_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bph'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name dec_del_bpl \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dec_del_bpl \
    op interface \
    ports { dec_del_bpl_address0 { O 3 vector } dec_del_bpl_ce0 { O 1 bit } dec_del_bpl_we0 { O 1 bit } dec_del_bpl_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_bpl'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name dec_del_bph \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename dec_del_bph \
    op interface \
    ports { dec_del_bph_address0 { O 3 vector } dec_del_bph_ce0 { O 1 bit } dec_del_bph_we0 { O 1 bit } dec_del_bph_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_bph'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 41 \
    name tqmf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename tqmf \
    op interface \
    ports { tqmf_address0 { O 5 vector } tqmf_ce0 { O 1 bit } tqmf_we0 { O 1 bit } tqmf_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'tqmf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name accumc \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename accumc \
    op interface \
    ports { accumc_address0 { O 4 vector } accumc_ce0 { O 1 bit } accumc_we0 { O 1 bit } accumc_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'accumc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name accumd \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename accumd \
    op interface \
    ports { accumd_address0 { O 4 vector } accumd_ce0 { O 1 bit } accumd_we0 { O 1 bit } accumd_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'accumd'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name dec_detl \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_detl \
    op interface \
    ports { dec_detl { O 15 vector } dec_detl_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name detl \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_detl \
    op interface \
    ports { detl { O 15 vector } detl_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name dec_deth \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_deth \
    op interface \
    ports { dec_deth { O 15 vector } dec_deth_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name deth \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_deth \
    op interface \
    ports { deth { O 15 vector } deth_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name rlt2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rlt2 \
    op interface \
    ports { rlt2 { O 31 vector } rlt2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name rlt1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rlt1 \
    op interface \
    ports { rlt1 { O 31 vector } rlt1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name plt2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_plt2 \
    op interface \
    ports { plt2 { O 32 vector } plt2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name plt1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_plt1 \
    op interface \
    ports { plt1 { O 32 vector } plt1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name al2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_al2 \
    op interface \
    ports { al2 { O 15 vector } al2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name al1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_al1 \
    op interface \
    ports { al1 { O 16 vector } al1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name nbl \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_nbl \
    op interface \
    ports { nbl { O 15 vector } nbl_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name rh2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rh2 \
    op interface \
    ports { rh2 { O 31 vector } rh2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name rh1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rh1 \
    op interface \
    ports { rh1 { O 31 vector } rh1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name ph2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ph2 \
    op interface \
    ports { ph2 { O 32 vector } ph2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name ph1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ph1 \
    op interface \
    ports { ph1 { O 32 vector } ph1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name ah2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ah2 \
    op interface \
    ports { ah2 { O 15 vector } ah2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name ah1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ah1 \
    op interface \
    ports { ah1 { O 16 vector } ah1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name nbh \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_nbh \
    op interface \
    ports { nbh { O 15 vector } nbh_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name dec_rlt2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rlt2 \
    op interface \
    ports { dec_rlt2 { O 31 vector } dec_rlt2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name dec_rlt1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rlt1 \
    op interface \
    ports { dec_rlt1 { O 31 vector } dec_rlt1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name dec_plt2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_plt2 \
    op interface \
    ports { dec_plt2 { O 32 vector } dec_plt2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name dec_plt1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_plt1 \
    op interface \
    ports { dec_plt1 { O 32 vector } dec_plt1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name dec_al2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_al2 \
    op interface \
    ports { dec_al2 { O 15 vector } dec_al2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name dec_al1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_al1 \
    op interface \
    ports { dec_al1 { O 16 vector } dec_al1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name dec_nbl \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_nbl \
    op interface \
    ports { dec_nbl { O 15 vector } dec_nbl_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name dec_rh2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rh2 \
    op interface \
    ports { dec_rh2 { O 31 vector } dec_rh2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name dec_rh1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rh1 \
    op interface \
    ports { dec_rh1 { O 31 vector } dec_rh1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name dec_ph2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ph2 \
    op interface \
    ports { dec_ph2 { O 32 vector } dec_ph2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name dec_ph1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ph1 \
    op interface \
    ports { dec_ph1 { O 32 vector } dec_ph1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name dec_ah2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ah2 \
    op interface \
    ports { dec_ah2 { O 15 vector } dec_ah2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name dec_ah1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ah1 \
    op interface \
    ports { dec_ah1 { O 16 vector } dec_ah1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name dec_nbh \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_nbh \
    op interface \
    ports { dec_nbh { O 15 vector } dec_nbh_ap_vld { O 1 bit } } \
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


