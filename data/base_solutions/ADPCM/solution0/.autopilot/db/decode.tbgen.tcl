set moduleName decode
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {decode}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 8 regular  }
	{ dec_del_bpl int 32 regular {array 6 { 2 3 } 1 1 } {global 2}  }
	{ dec_del_dltx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ dec_rlt1 int 31 regular {pointer 2} {global 2}  }
	{ dec_al1 int 16 regular {pointer 2} {global 2}  }
	{ dec_rlt2 int 31 regular {pointer 2} {global 2}  }
	{ dec_al2 int 15 regular {pointer 2} {global 2}  }
	{ dec_detl int 15 regular {pointer 2} {global 2}  }
	{ qq4_code4_table int 16 regular {array 16 { 1 } 1 1 } {global 0}  }
	{ il int 6 regular {pointer 0} {global 0}  }
	{ dec_nbl int 15 regular {pointer 2} {global 2}  }
	{ dec_plt1 int 32 regular {pointer 2} {global 2}  }
	{ dec_plt2 int 32 regular {pointer 2} {global 2}  }
	{ dec_del_bph int 32 regular {array 6 { 2 3 } 1 1 } {global 2}  }
	{ dec_del_dhx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ dec_rh1 int 31 regular {pointer 2} {global 2}  }
	{ dec_ah1 int 16 regular {pointer 2} {global 2}  }
	{ dec_rh2 int 31 regular {pointer 2} {global 2}  }
	{ dec_ah2 int 15 regular {pointer 2} {global 2}  }
	{ dec_deth int 15 regular {pointer 2} {global 2}  }
	{ dec_nbh int 15 regular {pointer 2} {global 2}  }
	{ dec_ph1 int 32 regular {pointer 2} {global 2}  }
	{ dec_ph2 int 32 regular {pointer 2} {global 2}  }
	{ accumc int 32 regular {array 11 { 2 3 } 1 1 } {global 2}  }
	{ h int 15 regular {array 24 { 1 1 } 1 1 } {global 0}  }
	{ accumd int 32 regular {array 11 { 2 3 } 1 1 } {global 2}  }
	{ xout1 int 32 regular {pointer 1} {global 1}  }
	{ xout2 int 32 regular {pointer 1} {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "dec_del_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_al1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_al2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_detl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "qq4_code4_table", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "il", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dec_nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_dhx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_deth", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "accumc", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "h", "interface" : "memory", "bitwidth" : 15, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "accumd", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "xout1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "xout2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 152
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r sc_in sc_lv 8 signal 0 } 
	{ dec_del_bpl_address0 sc_out sc_lv 3 signal 1 } 
	{ dec_del_bpl_ce0 sc_out sc_logic 1 signal 1 } 
	{ dec_del_bpl_we0 sc_out sc_logic 1 signal 1 } 
	{ dec_del_bpl_d0 sc_out sc_lv 32 signal 1 } 
	{ dec_del_bpl_q0 sc_in sc_lv 32 signal 1 } 
	{ dec_del_dltx_address0 sc_out sc_lv 3 signal 2 } 
	{ dec_del_dltx_ce0 sc_out sc_logic 1 signal 2 } 
	{ dec_del_dltx_we0 sc_out sc_logic 1 signal 2 } 
	{ dec_del_dltx_d0 sc_out sc_lv 16 signal 2 } 
	{ dec_del_dltx_q0 sc_in sc_lv 16 signal 2 } 
	{ dec_del_dltx_address1 sc_out sc_lv 3 signal 2 } 
	{ dec_del_dltx_ce1 sc_out sc_logic 1 signal 2 } 
	{ dec_del_dltx_we1 sc_out sc_logic 1 signal 2 } 
	{ dec_del_dltx_d1 sc_out sc_lv 16 signal 2 } 
	{ dec_del_dltx_q1 sc_in sc_lv 16 signal 2 } 
	{ dec_rlt1_i sc_in sc_lv 31 signal 3 } 
	{ dec_rlt1_o sc_out sc_lv 31 signal 3 } 
	{ dec_rlt1_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ dec_al1_i sc_in sc_lv 16 signal 4 } 
	{ dec_al1_o sc_out sc_lv 16 signal 4 } 
	{ dec_al1_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ dec_rlt2_i sc_in sc_lv 31 signal 5 } 
	{ dec_rlt2_o sc_out sc_lv 31 signal 5 } 
	{ dec_rlt2_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ dec_al2_i sc_in sc_lv 15 signal 6 } 
	{ dec_al2_o sc_out sc_lv 15 signal 6 } 
	{ dec_al2_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ dec_detl_i sc_in sc_lv 15 signal 7 } 
	{ dec_detl_o sc_out sc_lv 15 signal 7 } 
	{ dec_detl_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ qq4_code4_table_address0 sc_out sc_lv 4 signal 8 } 
	{ qq4_code4_table_ce0 sc_out sc_logic 1 signal 8 } 
	{ qq4_code4_table_q0 sc_in sc_lv 16 signal 8 } 
	{ il sc_in sc_lv 6 signal 9 } 
	{ dec_nbl_i sc_in sc_lv 15 signal 10 } 
	{ dec_nbl_o sc_out sc_lv 15 signal 10 } 
	{ dec_nbl_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ dec_plt1_i sc_in sc_lv 32 signal 11 } 
	{ dec_plt1_o sc_out sc_lv 32 signal 11 } 
	{ dec_plt1_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ dec_plt2_i sc_in sc_lv 32 signal 12 } 
	{ dec_plt2_o sc_out sc_lv 32 signal 12 } 
	{ dec_plt2_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ dec_del_bph_address0 sc_out sc_lv 3 signal 13 } 
	{ dec_del_bph_ce0 sc_out sc_logic 1 signal 13 } 
	{ dec_del_bph_we0 sc_out sc_logic 1 signal 13 } 
	{ dec_del_bph_d0 sc_out sc_lv 32 signal 13 } 
	{ dec_del_bph_q0 sc_in sc_lv 32 signal 13 } 
	{ dec_del_dhx_address0 sc_out sc_lv 3 signal 14 } 
	{ dec_del_dhx_ce0 sc_out sc_logic 1 signal 14 } 
	{ dec_del_dhx_we0 sc_out sc_logic 1 signal 14 } 
	{ dec_del_dhx_d0 sc_out sc_lv 16 signal 14 } 
	{ dec_del_dhx_q0 sc_in sc_lv 16 signal 14 } 
	{ dec_del_dhx_address1 sc_out sc_lv 3 signal 14 } 
	{ dec_del_dhx_ce1 sc_out sc_logic 1 signal 14 } 
	{ dec_del_dhx_we1 sc_out sc_logic 1 signal 14 } 
	{ dec_del_dhx_d1 sc_out sc_lv 16 signal 14 } 
	{ dec_del_dhx_q1 sc_in sc_lv 16 signal 14 } 
	{ dec_rh1_i sc_in sc_lv 31 signal 15 } 
	{ dec_rh1_o sc_out sc_lv 31 signal 15 } 
	{ dec_rh1_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ dec_ah1_i sc_in sc_lv 16 signal 16 } 
	{ dec_ah1_o sc_out sc_lv 16 signal 16 } 
	{ dec_ah1_o_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ dec_rh2_i sc_in sc_lv 31 signal 17 } 
	{ dec_rh2_o sc_out sc_lv 31 signal 17 } 
	{ dec_rh2_o_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ dec_ah2_i sc_in sc_lv 15 signal 18 } 
	{ dec_ah2_o sc_out sc_lv 15 signal 18 } 
	{ dec_ah2_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ dec_deth_i sc_in sc_lv 15 signal 19 } 
	{ dec_deth_o sc_out sc_lv 15 signal 19 } 
	{ dec_deth_o_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ dec_nbh_i sc_in sc_lv 15 signal 20 } 
	{ dec_nbh_o sc_out sc_lv 15 signal 20 } 
	{ dec_nbh_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ dec_ph1_i sc_in sc_lv 32 signal 21 } 
	{ dec_ph1_o sc_out sc_lv 32 signal 21 } 
	{ dec_ph1_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ dec_ph2_i sc_in sc_lv 32 signal 22 } 
	{ dec_ph2_o sc_out sc_lv 32 signal 22 } 
	{ dec_ph2_o_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ accumc_address0 sc_out sc_lv 4 signal 23 } 
	{ accumc_ce0 sc_out sc_logic 1 signal 23 } 
	{ accumc_we0 sc_out sc_logic 1 signal 23 } 
	{ accumc_d0 sc_out sc_lv 32 signal 23 } 
	{ accumc_q0 sc_in sc_lv 32 signal 23 } 
	{ h_address0 sc_out sc_lv 5 signal 24 } 
	{ h_ce0 sc_out sc_logic 1 signal 24 } 
	{ h_q0 sc_in sc_lv 15 signal 24 } 
	{ h_address1 sc_out sc_lv 5 signal 24 } 
	{ h_ce1 sc_out sc_logic 1 signal 24 } 
	{ h_q1 sc_in sc_lv 15 signal 24 } 
	{ accumd_address0 sc_out sc_lv 4 signal 25 } 
	{ accumd_ce0 sc_out sc_logic 1 signal 25 } 
	{ accumd_we0 sc_out sc_logic 1 signal 25 } 
	{ accumd_d0 sc_out sc_lv 32 signal 25 } 
	{ accumd_q0 sc_in sc_lv 32 signal 25 } 
	{ xout1 sc_out sc_lv 32 signal 26 } 
	{ xout1_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ xout2 sc_out sc_lv 32 signal 27 } 
	{ xout2_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ grp_filtep_fu_650_p_din1 sc_out sc_lv 31 signal -1 } 
	{ grp_filtep_fu_650_p_din2 sc_out sc_lv 16 signal -1 } 
	{ grp_filtep_fu_650_p_din3 sc_out sc_lv 31 signal -1 } 
	{ grp_filtep_fu_650_p_din4 sc_out sc_lv 15 signal -1 } 
	{ grp_filtep_fu_650_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_filtep_fu_650_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_logscl_fu_657_p_din1 sc_out sc_lv 6 signal -1 } 
	{ grp_logscl_fu_657_p_din2 sc_out sc_lv 15 signal -1 } 
	{ grp_logscl_fu_657_p_dout0 sc_in sc_lv 15 signal -1 } 
	{ grp_logscl_fu_657_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_logscl_fu_657_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_logscl_fu_657_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_logscl_fu_657_p_idle sc_in sc_logic 1 signal -1 } 
	{ grp_scalel_fu_663_p_din1 sc_out sc_lv 15 signal -1 } 
	{ grp_scalel_fu_663_p_din2 sc_out sc_lv 4 signal -1 } 
	{ grp_scalel_fu_663_p_dout0 sc_in sc_lv 15 signal -1 } 
	{ grp_scalel_fu_663_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_scalel_fu_663_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_scalel_fu_663_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_scalel_fu_663_p_idle sc_in sc_logic 1 signal -1 } 
	{ grp_uppol1_fu_669_p_din1 sc_out sc_lv 16 signal -1 } 
	{ grp_uppol1_fu_669_p_din2 sc_out sc_lv 15 signal -1 } 
	{ grp_uppol1_fu_669_p_din3 sc_out sc_lv 32 signal -1 } 
	{ grp_uppol1_fu_669_p_din4 sc_out sc_lv 32 signal -1 } 
	{ grp_uppol1_fu_669_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ grp_uppol1_fu_669_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_uppol1_fu_669_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_uppol1_fu_669_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_uppol1_fu_669_p_idle sc_in sc_logic 1 signal -1 } 
	{ grp_uppol2_fu_676_p_din1 sc_out sc_lv 16 signal -1 } 
	{ grp_uppol2_fu_676_p_din2 sc_out sc_lv 15 signal -1 } 
	{ grp_uppol2_fu_676_p_din3 sc_out sc_lv 32 signal -1 } 
	{ grp_uppol2_fu_676_p_din4 sc_out sc_lv 32 signal -1 } 
	{ grp_uppol2_fu_676_p_din5 sc_out sc_lv 32 signal -1 } 
	{ grp_uppol2_fu_676_p_dout0 sc_in sc_lv 15 signal -1 } 
	{ grp_uppol2_fu_676_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_uppol2_fu_676_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_uppol2_fu_676_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_uppol2_fu_676_p_idle sc_in sc_logic 1 signal -1 } 
	{ tmp_s_logsch_fu_684_p_din1 sc_out sc_lv 2 signal -1 } 
	{ tmp_s_logsch_fu_684_p_din2 sc_out sc_lv 15 signal -1 } 
	{ tmp_s_logsch_fu_684_p_dout0 sc_in sc_lv 15 signal -1 } 
	{ tmp_s_logsch_fu_684_p_ready sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "dec_del_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "address0" }} , 
 	{ "name": "dec_del_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "ce0" }} , 
 	{ "name": "dec_del_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "we0" }} , 
 	{ "name": "dec_del_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "d0" }} , 
 	{ "name": "dec_del_bpl_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "q0" }} , 
 	{ "name": "dec_del_dltx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "address0" }} , 
 	{ "name": "dec_del_dltx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "ce0" }} , 
 	{ "name": "dec_del_dltx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "we0" }} , 
 	{ "name": "dec_del_dltx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "d0" }} , 
 	{ "name": "dec_del_dltx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "q0" }} , 
 	{ "name": "dec_del_dltx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "address1" }} , 
 	{ "name": "dec_del_dltx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "ce1" }} , 
 	{ "name": "dec_del_dltx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "we1" }} , 
 	{ "name": "dec_del_dltx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "d1" }} , 
 	{ "name": "dec_del_dltx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "q1" }} , 
 	{ "name": "dec_rlt1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt1", "role": "i" }} , 
 	{ "name": "dec_rlt1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt1", "role": "o" }} , 
 	{ "name": "dec_rlt1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rlt1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_al1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_al1", "role": "i" }} , 
 	{ "name": "dec_al1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_al1", "role": "o" }} , 
 	{ "name": "dec_al1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_al1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_rlt2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt2", "role": "i" }} , 
 	{ "name": "dec_rlt2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt2", "role": "o" }} , 
 	{ "name": "dec_rlt2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rlt2", "role": "o_ap_vld" }} , 
 	{ "name": "dec_al2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_al2", "role": "i" }} , 
 	{ "name": "dec_al2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_al2", "role": "o" }} , 
 	{ "name": "dec_al2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_al2", "role": "o_ap_vld" }} , 
 	{ "name": "dec_detl_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_detl", "role": "i" }} , 
 	{ "name": "dec_detl_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_detl", "role": "o" }} , 
 	{ "name": "dec_detl_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_detl", "role": "o_ap_vld" }} , 
 	{ "name": "qq4_code4_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "address0" }} , 
 	{ "name": "qq4_code4_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "ce0" }} , 
 	{ "name": "qq4_code4_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "q0" }} , 
 	{ "name": "il", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "il", "role": "default" }} , 
 	{ "name": "dec_nbl_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbl", "role": "i" }} , 
 	{ "name": "dec_nbl_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbl", "role": "o" }} , 
 	{ "name": "dec_nbl_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_nbl", "role": "o_ap_vld" }} , 
 	{ "name": "dec_plt1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt1", "role": "i" }} , 
 	{ "name": "dec_plt1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt1", "role": "o" }} , 
 	{ "name": "dec_plt1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_plt1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_plt2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt2", "role": "i" }} , 
 	{ "name": "dec_plt2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt2", "role": "o" }} , 
 	{ "name": "dec_plt2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_plt2", "role": "o_ap_vld" }} , 
 	{ "name": "dec_del_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "address0" }} , 
 	{ "name": "dec_del_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "ce0" }} , 
 	{ "name": "dec_del_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "we0" }} , 
 	{ "name": "dec_del_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "d0" }} , 
 	{ "name": "dec_del_bph_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "q0" }} , 
 	{ "name": "dec_del_dhx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "address0" }} , 
 	{ "name": "dec_del_dhx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "ce0" }} , 
 	{ "name": "dec_del_dhx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "we0" }} , 
 	{ "name": "dec_del_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "d0" }} , 
 	{ "name": "dec_del_dhx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "q0" }} , 
 	{ "name": "dec_del_dhx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "address1" }} , 
 	{ "name": "dec_del_dhx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "ce1" }} , 
 	{ "name": "dec_del_dhx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "we1" }} , 
 	{ "name": "dec_del_dhx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "d1" }} , 
 	{ "name": "dec_del_dhx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "q1" }} , 
 	{ "name": "dec_rh1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh1", "role": "i" }} , 
 	{ "name": "dec_rh1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh1", "role": "o" }} , 
 	{ "name": "dec_rh1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rh1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_ah1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_ah1", "role": "i" }} , 
 	{ "name": "dec_ah1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_ah1", "role": "o" }} , 
 	{ "name": "dec_ah1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ah1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_rh2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh2", "role": "i" }} , 
 	{ "name": "dec_rh2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh2", "role": "o" }} , 
 	{ "name": "dec_rh2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rh2", "role": "o_ap_vld" }} , 
 	{ "name": "dec_ah2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_ah2", "role": "i" }} , 
 	{ "name": "dec_ah2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_ah2", "role": "o" }} , 
 	{ "name": "dec_ah2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ah2", "role": "o_ap_vld" }} , 
 	{ "name": "dec_deth_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_deth", "role": "i" }} , 
 	{ "name": "dec_deth_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_deth", "role": "o" }} , 
 	{ "name": "dec_deth_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_deth", "role": "o_ap_vld" }} , 
 	{ "name": "dec_nbh_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbh", "role": "i" }} , 
 	{ "name": "dec_nbh_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbh", "role": "o" }} , 
 	{ "name": "dec_nbh_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_nbh", "role": "o_ap_vld" }} , 
 	{ "name": "dec_ph1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph1", "role": "i" }} , 
 	{ "name": "dec_ph1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph1", "role": "o" }} , 
 	{ "name": "dec_ph1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ph1", "role": "o_ap_vld" }} , 
 	{ "name": "dec_ph2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph2", "role": "i" }} , 
 	{ "name": "dec_ph2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph2", "role": "o" }} , 
 	{ "name": "dec_ph2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ph2", "role": "o_ap_vld" }} , 
 	{ "name": "accumc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumc", "role": "address0" }} , 
 	{ "name": "accumc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "ce0" }} , 
 	{ "name": "accumc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "we0" }} , 
 	{ "name": "accumc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "d0" }} , 
 	{ "name": "accumc_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "q0" }} , 
 	{ "name": "h_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "h", "role": "address0" }} , 
 	{ "name": "h_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce0" }} , 
 	{ "name": "h_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "h", "role": "q0" }} , 
 	{ "name": "h_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "h", "role": "address1" }} , 
 	{ "name": "h_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce1" }} , 
 	{ "name": "h_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "h", "role": "q1" }} , 
 	{ "name": "accumd_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumd", "role": "address0" }} , 
 	{ "name": "accumd_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "ce0" }} , 
 	{ "name": "accumd_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "we0" }} , 
 	{ "name": "accumd_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "d0" }} , 
 	{ "name": "accumd_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "q0" }} , 
 	{ "name": "xout1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xout1", "role": "default" }} , 
 	{ "name": "xout1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xout1", "role": "ap_vld" }} , 
 	{ "name": "xout2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xout2", "role": "default" }} , 
 	{ "name": "xout2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xout2", "role": "ap_vld" }} , 
 	{ "name": "grp_filtep_fu_650_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_din1", "role": "default" }} , 
 	{ "name": "grp_filtep_fu_650_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_din2", "role": "default" }} , 
 	{ "name": "grp_filtep_fu_650_p_din3", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_din3", "role": "default" }} , 
 	{ "name": "grp_filtep_fu_650_p_din4", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_din4", "role": "default" }} , 
 	{ "name": "grp_filtep_fu_650_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_dout0", "role": "default" }} , 
 	{ "name": "grp_filtep_fu_650_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_filtep_fu_650_p_ready", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_din1", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_din2", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_dout0", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_start", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_ready", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_done", "role": "default" }} , 
 	{ "name": "grp_logscl_fu_657_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_logscl_fu_657_p_idle", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_din1", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_din2", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_dout0", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_start", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_ready", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_done", "role": "default" }} , 
 	{ "name": "grp_scalel_fu_663_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_scalel_fu_663_p_idle", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_din1", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_din2", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_din3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_din3", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_din4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_din4", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_dout0", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_start", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_ready", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_done", "role": "default" }} , 
 	{ "name": "grp_uppol1_fu_669_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol1_fu_669_p_idle", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_din1", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_din2", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_din3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_din3", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_din4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_din4", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_din5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_din5", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_dout0", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_start", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_ready", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_done", "role": "default" }} , 
 	{ "name": "grp_uppol2_fu_676_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_uppol2_fu_676_p_idle", "role": "default" }} , 
 	{ "name": "tmp_s_logsch_fu_684_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tmp_s_logsch_fu_684_p_din1", "role": "default" }} , 
 	{ "name": "tmp_s_logsch_fu_684_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "tmp_s_logsch_fu_684_p_din2", "role": "default" }} , 
 	{ "name": "tmp_s_logsch_fu_684_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "tmp_s_logsch_fu_684_p_dout0", "role": "default" }} , 
 	{ "name": "tmp_s_logsch_fu_684_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp_s_logsch_fu_684_p_ready", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "6", "7", "8", "9", "10", "11", "12"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "98", "EstimateLatencyMax" : "98",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_filtez_fu_317", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "4", "SubInstance" : "grp_upzero_fu_352", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_filtez_fu_317", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "4", "SubInstance" : "grp_upzero_fu_352", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "il", "Type" : "None", "Direction" : "I"},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_filtez_fu_317", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "4", "SubInstance" : "grp_upzero_fu_352", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_filtez_fu_317", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "4", "SubInstance" : "grp_upzero_fu_352", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "xout1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xout2", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "decode_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.qq6_code6_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_filtez_fu_317", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "filtez",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bpl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dlt", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_filtez_fu_317.mul_16s_32s_48_1_1_U44", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_352", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "upzero",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dlt", "Type" : "None", "Direction" : "I"},
			{"Name" : "dlti", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bli", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_352.mul_16s_16s_32_1_1_U70", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U130", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U131", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_7s_39_1_1_U132", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_14_1_1_U133", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_15ns_29_1_1_U134", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_1_1_U135", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_1_1_U136", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	decode {
		input_r {Type I LastRead 1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 2 FirstWrite -1}
		dec_del_dltx {Type IO LastRead 3 FirstWrite -1}
		dec_rlt1 {Type IO LastRead 3 FirstWrite 4}
		dec_al1 {Type IO LastRead 3 FirstWrite 7}
		dec_rlt2 {Type IO LastRead 3 FirstWrite 3}
		dec_al2 {Type IO LastRead 3 FirstWrite 5}
		dec_detl {Type IO LastRead 3 FirstWrite 5}
		qq4_code4_table {Type I LastRead 2 FirstWrite -1}
		il {Type I LastRead 2 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 2 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 4 FirstWrite 4}
		dec_plt2 {Type IO LastRead 4 FirstWrite 4}
		dec_del_bph {Type IO LastRead 2 FirstWrite -1}
		dec_del_dhx {Type IO LastRead 3 FirstWrite -1}
		dec_rh1 {Type IO LastRead 4 FirstWrite 4}
		dec_ah1 {Type IO LastRead 2 FirstWrite 5}
		dec_rh2 {Type IO LastRead 4 FirstWrite 4}
		dec_ah2 {Type IO LastRead 2 FirstWrite 3}
		dec_deth {Type IO LastRead 1 FirstWrite 3}
		dec_nbh {Type IO LastRead 2 FirstWrite 2}
		dec_ph1 {Type IO LastRead 2 FirstWrite 2}
		dec_ph2 {Type IO LastRead 2 FirstWrite 2}
		accumc {Type IO LastRead 10 FirstWrite 10}
		h {Type I LastRead 9 FirstWrite -1}
		accumd {Type IO LastRead 10 FirstWrite 10}
		xout1 {Type O LastRead -1 FirstWrite 9}
		xout2 {Type O LastRead -1 FirstWrite 9}}
	filtez {
		bpl {Type I LastRead 2 FirstWrite -1}
		dlt {Type I LastRead 2 FirstWrite -1}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "98", "Max" : "98"}
	, {"Name" : "Interval", "Min" : "98", "Max" : "98"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_none {  { input_r in_data 0 8 } } }
	dec_del_bpl { ap_memory {  { dec_del_bpl_address0 mem_address 1 3 }  { dec_del_bpl_ce0 mem_ce 1 1 }  { dec_del_bpl_we0 mem_we 1 1 }  { dec_del_bpl_d0 mem_din 1 32 }  { dec_del_bpl_q0 mem_dout 0 32 } } }
	dec_del_dltx { ap_memory {  { dec_del_dltx_address0 mem_address 1 3 }  { dec_del_dltx_ce0 mem_ce 1 1 }  { dec_del_dltx_we0 mem_we 1 1 }  { dec_del_dltx_d0 mem_din 1 16 }  { dec_del_dltx_q0 mem_dout 0 16 }  { dec_del_dltx_address1 MemPortADDR2 1 3 }  { dec_del_dltx_ce1 MemPortCE2 1 1 }  { dec_del_dltx_we1 MemPortWE2 1 1 }  { dec_del_dltx_d1 MemPortDIN2 1 16 }  { dec_del_dltx_q1 MemPortDOUT2 0 16 } } }
	dec_rlt1 { ap_ovld {  { dec_rlt1_i in_data 0 31 }  { dec_rlt1_o out_data 1 31 }  { dec_rlt1_o_ap_vld out_vld 1 1 } } }
	dec_al1 { ap_ovld {  { dec_al1_i in_data 0 16 }  { dec_al1_o out_data 1 16 }  { dec_al1_o_ap_vld out_vld 1 1 } } }
	dec_rlt2 { ap_ovld {  { dec_rlt2_i in_data 0 31 }  { dec_rlt2_o out_data 1 31 }  { dec_rlt2_o_ap_vld out_vld 1 1 } } }
	dec_al2 { ap_ovld {  { dec_al2_i in_data 0 15 }  { dec_al2_o out_data 1 15 }  { dec_al2_o_ap_vld out_vld 1 1 } } }
	dec_detl { ap_ovld {  { dec_detl_i in_data 0 15 }  { dec_detl_o out_data 1 15 }  { dec_detl_o_ap_vld out_vld 1 1 } } }
	qq4_code4_table { ap_memory {  { qq4_code4_table_address0 mem_address 1 4 }  { qq4_code4_table_ce0 mem_ce 1 1 }  { qq4_code4_table_q0 in_data 0 16 } } }
	il { ap_none {  { il in_data 0 6 } } }
	dec_nbl { ap_ovld {  { dec_nbl_i in_data 0 15 }  { dec_nbl_o out_data 1 15 }  { dec_nbl_o_ap_vld out_vld 1 1 } } }
	dec_plt1 { ap_ovld {  { dec_plt1_i in_data 0 32 }  { dec_plt1_o out_data 1 32 }  { dec_plt1_o_ap_vld out_vld 1 1 } } }
	dec_plt2 { ap_ovld {  { dec_plt2_i in_data 0 32 }  { dec_plt2_o out_data 1 32 }  { dec_plt2_o_ap_vld out_vld 1 1 } } }
	dec_del_bph { ap_memory {  { dec_del_bph_address0 mem_address 1 3 }  { dec_del_bph_ce0 mem_ce 1 1 }  { dec_del_bph_we0 mem_we 1 1 }  { dec_del_bph_d0 mem_din 1 32 }  { dec_del_bph_q0 mem_dout 0 32 } } }
	dec_del_dhx { ap_memory {  { dec_del_dhx_address0 mem_address 1 3 }  { dec_del_dhx_ce0 mem_ce 1 1 }  { dec_del_dhx_we0 mem_we 1 1 }  { dec_del_dhx_d0 mem_din 1 16 }  { dec_del_dhx_q0 mem_dout 0 16 }  { dec_del_dhx_address1 MemPortADDR2 1 3 }  { dec_del_dhx_ce1 MemPortCE2 1 1 }  { dec_del_dhx_we1 MemPortWE2 1 1 }  { dec_del_dhx_d1 MemPortDIN2 1 16 }  { dec_del_dhx_q1 MemPortDOUT2 0 16 } } }
	dec_rh1 { ap_ovld {  { dec_rh1_i in_data 0 31 }  { dec_rh1_o out_data 1 31 }  { dec_rh1_o_ap_vld out_vld 1 1 } } }
	dec_ah1 { ap_ovld {  { dec_ah1_i in_data 0 16 }  { dec_ah1_o out_data 1 16 }  { dec_ah1_o_ap_vld out_vld 1 1 } } }
	dec_rh2 { ap_ovld {  { dec_rh2_i in_data 0 31 }  { dec_rh2_o out_data 1 31 }  { dec_rh2_o_ap_vld out_vld 1 1 } } }
	dec_ah2 { ap_ovld {  { dec_ah2_i in_data 0 15 }  { dec_ah2_o out_data 1 15 }  { dec_ah2_o_ap_vld out_vld 1 1 } } }
	dec_deth { ap_ovld {  { dec_deth_i in_data 0 15 }  { dec_deth_o out_data 1 15 }  { dec_deth_o_ap_vld out_vld 1 1 } } }
	dec_nbh { ap_ovld {  { dec_nbh_i in_data 0 15 }  { dec_nbh_o out_data 1 15 }  { dec_nbh_o_ap_vld out_vld 1 1 } } }
	dec_ph1 { ap_ovld {  { dec_ph1_i in_data 0 32 }  { dec_ph1_o out_data 1 32 }  { dec_ph1_o_ap_vld out_vld 1 1 } } }
	dec_ph2 { ap_ovld {  { dec_ph2_i in_data 0 32 }  { dec_ph2_o out_data 1 32 }  { dec_ph2_o_ap_vld out_vld 1 1 } } }
	accumc { ap_memory {  { accumc_address0 mem_address 1 4 }  { accumc_ce0 mem_ce 1 1 }  { accumc_we0 mem_we 1 1 }  { accumc_d0 mem_din 1 32 }  { accumc_q0 in_data 0 32 } } }
	h { ap_memory {  { h_address0 mem_address 1 5 }  { h_ce0 mem_ce 1 1 }  { h_q0 in_data 0 15 }  { h_address1 MemPortADDR2 1 5 }  { h_ce1 MemPortCE2 1 1 }  { h_q1 in_data 0 15 } } }
	accumd { ap_memory {  { accumd_address0 mem_address 1 4 }  { accumd_ce0 mem_ce 1 1 }  { accumd_we0 mem_we 1 1 }  { accumd_d0 mem_din 1 32 }  { accumd_q0 in_data 0 32 } } }
	xout1 { ap_vld {  { xout1 out_data 1 32 }  { xout1_ap_vld out_vld 1 1 } } }
	xout2 { ap_vld {  { xout2 out_data 1 32 }  { xout2_ap_vld out_vld 1 1 } } }
}
