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
    id 130 \
    name input_samples \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_samples \
    op interface \
    ports { input_samples_address0 { O 13 vector } input_samples_ce0 { O 1 bit } input_samples_q0 { I 32 vector } input_samples_address1 { O 13 vector } input_samples_ce1 { O 1 bit } input_samples_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_samples'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 131 \
    name compressed \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename compressed \
    op interface \
    ports { compressed_address0 { O 12 vector } compressed_ce0 { O 1 bit } compressed_we0 { O 1 bit } compressed_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'compressed'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 149 \
    name tqmf \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename tqmf \
    op interface \
    ports { tqmf_address0 { O 5 vector } tqmf_ce0 { O 1 bit } tqmf_we0 { O 1 bit } tqmf_d0 { O 32 vector } tqmf_q0 { I 32 vector } tqmf_address1 { O 5 vector } tqmf_ce1 { O 1 bit } tqmf_we1 { O 1 bit } tqmf_d1 { O 32 vector } tqmf_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'tqmf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 150 \
    name delay_bpl \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_bpl \
    op interface \
    ports { delay_bpl_address0 { O 3 vector } delay_bpl_ce0 { O 1 bit } delay_bpl_we0 { O 1 bit } delay_bpl_d0 { O 32 vector } delay_bpl_q0 { I 32 vector } delay_bpl_address1 { O 3 vector } delay_bpl_ce1 { O 1 bit } delay_bpl_we1 { O 1 bit } delay_bpl_d1 { O 32 vector } delay_bpl_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bpl'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 151 \
    name delay_dltx \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_dltx \
    op interface \
    ports { delay_dltx_address0 { O 3 vector } delay_dltx_ce0 { O 1 bit } delay_dltx_we0 { O 1 bit } delay_dltx_d0 { O 16 vector } delay_dltx_q0 { I 16 vector } delay_dltx_address1 { O 3 vector } delay_dltx_ce1 { O 1 bit } delay_dltx_we1 { O 1 bit } delay_dltx_d1 { O 16 vector } delay_dltx_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_dltx'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 152 \
    name delay_bph \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_bph \
    op interface \
    ports { delay_bph_address0 { O 3 vector } delay_bph_ce0 { O 1 bit } delay_bph_we0 { O 1 bit } delay_bph_d0 { O 32 vector } delay_bph_q0 { I 32 vector } delay_bph_address1 { O 3 vector } delay_bph_ce1 { O 1 bit } delay_bph_we1 { O 1 bit } delay_bph_d1 { O 32 vector } delay_bph_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bph'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 153 \
    name delay_dhx \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_dhx \
    op interface \
    ports { delay_dhx_address0 { O 3 vector } delay_dhx_ce0 { O 1 bit } delay_dhx_we0 { O 1 bit } delay_dhx_d0 { O 14 vector } delay_dhx_q0 { I 14 vector } delay_dhx_address1 { O 3 vector } delay_dhx_ce1 { O 1 bit } delay_dhx_we1 { O 1 bit } delay_dhx_d1 { O 14 vector } delay_dhx_q1 { I 14 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_dhx'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name rlt1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_rlt1 \
    op interface \
    ports { rlt1_i { I 31 vector } rlt1_o { O 31 vector } rlt1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name al1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_al1 \
    op interface \
    ports { al1_i { I 16 vector } al1_o { O 16 vector } al1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name rlt2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_rlt2 \
    op interface \
    ports { rlt2_i { I 31 vector } rlt2_o { O 31 vector } rlt2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name al2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_al2 \
    op interface \
    ports { al2_i { I 15 vector } al2_o { O 15 vector } al2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name detl \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_detl \
    op interface \
    ports { detl_i { I 15 vector } detl_o { O 15 vector } detl_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name il \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_il \
    op interface \
    ports { il { O 6 vector } il_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name nbl \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_nbl \
    op interface \
    ports { nbl_i { I 15 vector } nbl_o { O 15 vector } nbl_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name plt1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_plt1 \
    op interface \
    ports { plt1_i { I 32 vector } plt1_o { O 32 vector } plt1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name plt2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_plt2 \
    op interface \
    ports { plt2_i { I 32 vector } plt2_o { O 32 vector } plt2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name rh1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_rh1 \
    op interface \
    ports { rh1_i { I 31 vector } rh1_o { O 31 vector } rh1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name ah1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ah1 \
    op interface \
    ports { ah1_i { I 16 vector } ah1_o { O 16 vector } ah1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name rh2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_rh2 \
    op interface \
    ports { rh2_i { I 31 vector } rh2_o { O 31 vector } rh2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name ah2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ah2 \
    op interface \
    ports { ah2_i { I 15 vector } ah2_o { O 15 vector } ah2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name deth \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_deth \
    op interface \
    ports { deth_i { I 15 vector } deth_o { O 15 vector } deth_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name nbh \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_nbh \
    op interface \
    ports { nbh_i { I 15 vector } nbh_o { O 15 vector } nbh_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name ph1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ph1 \
    op interface \
    ports { ph1_i { I 32 vector } ph1_o { O 32 vector } ph1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name ph2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ph2 \
    op interface \
    ports { ph2_i { I 32 vector } ph2_o { O 32 vector } ph2_o_ap_vld { O 1 bit } } \
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


