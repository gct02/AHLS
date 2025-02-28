# This script segment is generated automatically by AutoPilot

set name adpcm_main_mul_14s_32s_46_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_15s_32s_47_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_16s_32s_47_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_16s_32s_48_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_32s_32s_64_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_32s_7s_39_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_15ns_15ns_30_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_16s_15ns_31_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_16s_16s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name adpcm_main_mul_15ns_11ns_25_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 13
set name adpcm_main_mux_4_2_14_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 14
set din0_signed 1
set din1_width 14
set din1_signed 1
set din2_width 14
set din2_signed 0
set din3_width 14
set din3_signed 0
set din4_width 2
set din4_signed 0
set dout_width 14
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


set name adpcm_main_mul_14s_15ns_29_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 15
set name adpcm_main_mux_4_2_11_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 11
set din0_signed 0
set din1_width 11
set din1_signed 1
set din2_width 11
set din2_signed 0
set din3_width 11
set din3_signed 1
set din4_width 2
set din4_signed 0
set dout_width 11
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


set name adpcm_main_mul_14s_14s_28_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler adpcm_main_encode_decis_levl_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler adpcm_main_encode_quant26bt_pos_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler adpcm_main_encode_quant26bt_neg_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 36 \
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
    id 37 \
    name h \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename h \
    op interface \
    ports { h_address0 { O 5 vector } h_ce0 { O 1 bit } h_q0 { I 15 vector } h_address1 { O 5 vector } h_ce1 { O 1 bit } h_q1 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'h'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name delay_bpl \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_bpl \
    op interface \
    ports { delay_bpl_address0 { O 3 vector } delay_bpl_ce0 { O 1 bit } delay_bpl_we0 { O 1 bit } delay_bpl_d0 { O 32 vector } delay_bpl_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bpl'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
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
    id 46 \
    name qq4_code4_table \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qq4_code4_table \
    op interface \
    ports { qq4_code4_table_address0 { O 4 vector } qq4_code4_table_ce0 { O 1 bit } qq4_code4_table_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qq4_code4_table'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
    name wl_code_table \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename wl_code_table \
    op interface \
    ports { wl_code_table_address0 { O 4 vector } wl_code_table_ce0 { O 1 bit } wl_code_table_q0 { I 13 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'wl_code_table'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name ilb_table \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ilb_table \
    op interface \
    ports { ilb_table_address0 { O 5 vector } ilb_table_ce0 { O 1 bit } ilb_table_q0 { I 12 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ilb_table'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 52 \
    name delay_bph \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename delay_bph \
    op interface \
    ports { delay_bph_address0 { O 3 vector } delay_bph_ce0 { O 1 bit } delay_bph_we0 { O 1 bit } delay_bph_d0 { O 32 vector } delay_bph_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'delay_bph'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 53 \
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
    id 34 \
    name xin1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_xin1 \
    op interface \
    ports { xin1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name xin2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_xin2 \
    op interface \
    ports { xin2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
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
    id 41 \
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
    id 42 \
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
    id 43 \
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
    id 44 \
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
    id 45 \
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
    id 47 \
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
    id 50 \
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
    id 51 \
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
    id 54 \
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
    id 55 \
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
    id 56 \
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
    id 57 \
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
    id 58 \
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
    id 59 \
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
    id 60 \
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
    id 61 \
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
    ports { ap_return { O 8 vector } } \
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


