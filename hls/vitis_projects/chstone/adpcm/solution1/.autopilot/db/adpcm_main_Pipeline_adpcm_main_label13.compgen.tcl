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
    id 219 \
    name compressed \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename compressed \
    op interface \
    ports { compressed_address0 { O 12 vector } compressed_ce0 { O 1 bit } compressed_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'compressed'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 220 \
    name result \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename result \
    op interface \
    ports { result_address0 { O 13 vector } result_ce0 { O 1 bit } result_we0 { O 1 bit } result_d0 { O 32 vector } result_address1 { O 13 vector } result_ce1 { O 1 bit } result_we1 { O 1 bit } result_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'result'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 238 \
    name dec_del_bpl \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dec_del_bpl \
    op interface \
    ports { dec_del_bpl_address0 { O 3 vector } dec_del_bpl_ce0 { O 1 bit } dec_del_bpl_we0 { O 1 bit } dec_del_bpl_d0 { O 32 vector } dec_del_bpl_q0 { I 32 vector } dec_del_bpl_address1 { O 3 vector } dec_del_bpl_ce1 { O 1 bit } dec_del_bpl_we1 { O 1 bit } dec_del_bpl_d1 { O 32 vector } dec_del_bpl_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_bpl'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 239 \
    name dec_del_dltx \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dec_del_dltx \
    op interface \
    ports { dec_del_dltx_address0 { O 3 vector } dec_del_dltx_ce0 { O 1 bit } dec_del_dltx_we0 { O 1 bit } dec_del_dltx_d0 { O 16 vector } dec_del_dltx_q0 { I 16 vector } dec_del_dltx_address1 { O 3 vector } dec_del_dltx_ce1 { O 1 bit } dec_del_dltx_we1 { O 1 bit } dec_del_dltx_d1 { O 16 vector } dec_del_dltx_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_dltx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 240 \
    name dec_del_bph \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dec_del_bph \
    op interface \
    ports { dec_del_bph_address0 { O 3 vector } dec_del_bph_ce0 { O 1 bit } dec_del_bph_we0 { O 1 bit } dec_del_bph_d0 { O 32 vector } dec_del_bph_q0 { I 32 vector } dec_del_bph_address1 { O 3 vector } dec_del_bph_ce1 { O 1 bit } dec_del_bph_we1 { O 1 bit } dec_del_bph_d1 { O 32 vector } dec_del_bph_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_bph'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 241 \
    name dec_del_dhx \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename dec_del_dhx \
    op interface \
    ports { dec_del_dhx_address0 { O 3 vector } dec_del_dhx_ce0 { O 1 bit } dec_del_dhx_we0 { O 1 bit } dec_del_dhx_d0 { O 14 vector } dec_del_dhx_q0 { I 14 vector } dec_del_dhx_address1 { O 3 vector } dec_del_dhx_ce1 { O 1 bit } dec_del_dhx_we1 { O 1 bit } dec_del_dhx_d1 { O 14 vector } dec_del_dhx_q1 { I 14 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'dec_del_dhx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 242 \
    name accumc \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename accumc \
    op interface \
    ports { accumc_address0 { O 4 vector } accumc_ce0 { O 1 bit } accumc_we0 { O 1 bit } accumc_d0 { O 32 vector } accumc_q0 { I 32 vector } accumc_address1 { O 4 vector } accumc_ce1 { O 1 bit } accumc_we1 { O 1 bit } accumc_d1 { O 32 vector } accumc_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'accumc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 243 \
    name accumd \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename accumd \
    op interface \
    ports { accumd_address0 { O 4 vector } accumd_ce0 { O 1 bit } accumd_we0 { O 1 bit } accumd_d0 { O 32 vector } accumd_q0 { I 32 vector } accumd_address1 { O 4 vector } accumd_ce1 { O 1 bit } accumd_we1 { O 1 bit } accumd_d1 { O 32 vector } accumd_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'accumd'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name dec_rlt1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rlt1 \
    op interface \
    ports { dec_rlt1_i { I 31 vector } dec_rlt1_o { O 31 vector } dec_rlt1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name dec_al1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_al1 \
    op interface \
    ports { dec_al1_i { I 16 vector } dec_al1_o { O 16 vector } dec_al1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name dec_rlt2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rlt2 \
    op interface \
    ports { dec_rlt2_i { I 31 vector } dec_rlt2_o { O 31 vector } dec_rlt2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name dec_al2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_al2 \
    op interface \
    ports { dec_al2_i { I 15 vector } dec_al2_o { O 15 vector } dec_al2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name dec_detl \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_detl \
    op interface \
    ports { dec_detl_i { I 15 vector } dec_detl_o { O 15 vector } dec_detl_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name il \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_il \
    op interface \
    ports { il { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name dec_nbl \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_nbl \
    op interface \
    ports { dec_nbl_i { I 15 vector } dec_nbl_o { O 15 vector } dec_nbl_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name dec_plt1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_plt1 \
    op interface \
    ports { dec_plt1_i { I 32 vector } dec_plt1_o { O 32 vector } dec_plt1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name dec_plt2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_plt2 \
    op interface \
    ports { dec_plt2_i { I 32 vector } dec_plt2_o { O 32 vector } dec_plt2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name dec_rh1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rh1 \
    op interface \
    ports { dec_rh1_i { I 31 vector } dec_rh1_o { O 31 vector } dec_rh1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name dec_ah1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ah1 \
    op interface \
    ports { dec_ah1_i { I 16 vector } dec_ah1_o { O 16 vector } dec_ah1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name dec_rh2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_rh2 \
    op interface \
    ports { dec_rh2_i { I 31 vector } dec_rh2_o { O 31 vector } dec_rh2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name dec_ah2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ah2 \
    op interface \
    ports { dec_ah2_i { I 15 vector } dec_ah2_o { O 15 vector } dec_ah2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name dec_deth \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_deth \
    op interface \
    ports { dec_deth_i { I 15 vector } dec_deth_o { O 15 vector } dec_deth_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name dec_nbh \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_nbh \
    op interface \
    ports { dec_nbh_i { I 15 vector } dec_nbh_o { O 15 vector } dec_nbh_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name dec_ph1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ph1 \
    op interface \
    ports { dec_ph1_i { I 32 vector } dec_ph1_o { O 32 vector } dec_ph1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name dec_ph2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dec_ph2 \
    op interface \
    ports { dec_ph2_i { I 32 vector } dec_ph2_o { O 32 vector } dec_ph2_o_ap_vld { O 1 bit } } \
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
set InstName adpcm_main_flow_control_loop_pipe_sequential_init_U
set CompName adpcm_main_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix adpcm_main_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}

