set moduleName encode
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
set C_modelName {encode}
set C_modelType { int 8 }
set C_modelArgList {
	{ xin1 int 32 regular  }
	{ xin2 int 32 regular  }
	{ tqmf int 32 regular {array 24 { 2 2 } 1 1 } {global 2}  }
	{ h int 15 regular {array 24 { 1 1 } 1 1 } {global 0}  }
	{ delay_bpl int 32 regular {array 6 { 2 3 } 1 1 } {global 2}  }
	{ delay_dltx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ rlt1 int 31 regular {pointer 2} {global 2}  }
	{ al1 int 16 regular {pointer 2} {global 2}  }
	{ rlt2 int 31 regular {pointer 2} {global 2}  }
	{ al2 int 15 regular {pointer 2} {global 2}  }
	{ detl int 15 regular {pointer 2} {global 2}  }
	{ il int 6 regular {pointer 1} {global 1}  }
	{ qq4_code4_table int 16 regular {array 16 { 1 } 1 1 } {global 0}  }
	{ nbl int 15 regular {pointer 2} {global 2}  }
	{ plt1 int 32 regular {pointer 2} {global 2}  }
	{ plt2 int 32 regular {pointer 2} {global 2}  }
	{ delay_bph int 32 regular {array 6 { 2 3 } 1 1 } {global 2}  }
	{ delay_dhx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ rh1 int 31 regular {pointer 2} {global 2}  }
	{ ah1 int 16 regular {pointer 2} {global 2}  }
	{ rh2 int 31 regular {pointer 2} {global 2}  }
	{ ah2 int 15 regular {pointer 2} {global 2}  }
	{ deth int 15 regular {pointer 2} {global 2}  }
	{ nbh int 15 regular {pointer 2} {global 2}  }
	{ ph1 int 32 regular {pointer 2} {global 2}  }
	{ ph2 int 32 regular {pointer 2} {global 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "xin1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "xin2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "tqmf", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "h", "interface" : "memory", "bitwidth" : 15, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "delay_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "al1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "al2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "detl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "il", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "qq4_code4_table", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_dhx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "deth", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 8} ]}
# RTL Port declarations: 
set portNum 151
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ xin1 sc_in sc_lv 32 signal 0 } 
	{ xin2 sc_in sc_lv 32 signal 1 } 
	{ tqmf_address0 sc_out sc_lv 5 signal 2 } 
	{ tqmf_ce0 sc_out sc_logic 1 signal 2 } 
	{ tqmf_we0 sc_out sc_logic 1 signal 2 } 
	{ tqmf_d0 sc_out sc_lv 32 signal 2 } 
	{ tqmf_q0 sc_in sc_lv 32 signal 2 } 
	{ tqmf_address1 sc_out sc_lv 5 signal 2 } 
	{ tqmf_ce1 sc_out sc_logic 1 signal 2 } 
	{ tqmf_we1 sc_out sc_logic 1 signal 2 } 
	{ tqmf_d1 sc_out sc_lv 32 signal 2 } 
	{ tqmf_q1 sc_in sc_lv 32 signal 2 } 
	{ h_address0 sc_out sc_lv 5 signal 3 } 
	{ h_ce0 sc_out sc_logic 1 signal 3 } 
	{ h_q0 sc_in sc_lv 15 signal 3 } 
	{ h_address1 sc_out sc_lv 5 signal 3 } 
	{ h_ce1 sc_out sc_logic 1 signal 3 } 
	{ h_q1 sc_in sc_lv 15 signal 3 } 
	{ delay_bpl_address0 sc_out sc_lv 3 signal 4 } 
	{ delay_bpl_ce0 sc_out sc_logic 1 signal 4 } 
	{ delay_bpl_we0 sc_out sc_logic 1 signal 4 } 
	{ delay_bpl_d0 sc_out sc_lv 32 signal 4 } 
	{ delay_bpl_q0 sc_in sc_lv 32 signal 4 } 
	{ delay_dltx_address0 sc_out sc_lv 3 signal 5 } 
	{ delay_dltx_ce0 sc_out sc_logic 1 signal 5 } 
	{ delay_dltx_we0 sc_out sc_logic 1 signal 5 } 
	{ delay_dltx_d0 sc_out sc_lv 16 signal 5 } 
	{ delay_dltx_q0 sc_in sc_lv 16 signal 5 } 
	{ delay_dltx_address1 sc_out sc_lv 3 signal 5 } 
	{ delay_dltx_ce1 sc_out sc_logic 1 signal 5 } 
	{ delay_dltx_we1 sc_out sc_logic 1 signal 5 } 
	{ delay_dltx_d1 sc_out sc_lv 16 signal 5 } 
	{ delay_dltx_q1 sc_in sc_lv 16 signal 5 } 
	{ rlt1_i sc_in sc_lv 31 signal 6 } 
	{ rlt1_o sc_out sc_lv 31 signal 6 } 
	{ rlt1_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ al1_i sc_in sc_lv 16 signal 7 } 
	{ al1_o sc_out sc_lv 16 signal 7 } 
	{ al1_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ rlt2_i sc_in sc_lv 31 signal 8 } 
	{ rlt2_o sc_out sc_lv 31 signal 8 } 
	{ rlt2_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ al2_i sc_in sc_lv 15 signal 9 } 
	{ al2_o sc_out sc_lv 15 signal 9 } 
	{ al2_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ detl_i sc_in sc_lv 15 signal 10 } 
	{ detl_o sc_out sc_lv 15 signal 10 } 
	{ detl_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ il sc_out sc_lv 6 signal 11 } 
	{ il_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ qq4_code4_table_address0 sc_out sc_lv 4 signal 12 } 
	{ qq4_code4_table_ce0 sc_out sc_logic 1 signal 12 } 
	{ qq4_code4_table_q0 sc_in sc_lv 16 signal 12 } 
	{ nbl_i sc_in sc_lv 15 signal 13 } 
	{ nbl_o sc_out sc_lv 15 signal 13 } 
	{ nbl_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ plt1_i sc_in sc_lv 32 signal 14 } 
	{ plt1_o sc_out sc_lv 32 signal 14 } 
	{ plt1_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ plt2_i sc_in sc_lv 32 signal 15 } 
	{ plt2_o sc_out sc_lv 32 signal 15 } 
	{ plt2_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ delay_bph_address0 sc_out sc_lv 3 signal 16 } 
	{ delay_bph_ce0 sc_out sc_logic 1 signal 16 } 
	{ delay_bph_we0 sc_out sc_logic 1 signal 16 } 
	{ delay_bph_d0 sc_out sc_lv 32 signal 16 } 
	{ delay_bph_q0 sc_in sc_lv 32 signal 16 } 
	{ delay_dhx_address0 sc_out sc_lv 3 signal 17 } 
	{ delay_dhx_ce0 sc_out sc_logic 1 signal 17 } 
	{ delay_dhx_we0 sc_out sc_logic 1 signal 17 } 
	{ delay_dhx_d0 sc_out sc_lv 16 signal 17 } 
	{ delay_dhx_q0 sc_in sc_lv 16 signal 17 } 
	{ delay_dhx_address1 sc_out sc_lv 3 signal 17 } 
	{ delay_dhx_ce1 sc_out sc_logic 1 signal 17 } 
	{ delay_dhx_we1 sc_out sc_logic 1 signal 17 } 
	{ delay_dhx_d1 sc_out sc_lv 16 signal 17 } 
	{ delay_dhx_q1 sc_in sc_lv 16 signal 17 } 
	{ rh1_i sc_in sc_lv 31 signal 18 } 
	{ rh1_o sc_out sc_lv 31 signal 18 } 
	{ rh1_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ ah1_i sc_in sc_lv 16 signal 19 } 
	{ ah1_o sc_out sc_lv 16 signal 19 } 
	{ ah1_o_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ rh2_i sc_in sc_lv 31 signal 20 } 
	{ rh2_o sc_out sc_lv 31 signal 20 } 
	{ rh2_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ ah2_i sc_in sc_lv 15 signal 21 } 
	{ ah2_o sc_out sc_lv 15 signal 21 } 
	{ ah2_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ deth_i sc_in sc_lv 15 signal 22 } 
	{ deth_o sc_out sc_lv 15 signal 22 } 
	{ deth_o_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ nbh_i sc_in sc_lv 15 signal 23 } 
	{ nbh_o sc_out sc_lv 15 signal 23 } 
	{ nbh_o_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ ph1_i sc_in sc_lv 32 signal 24 } 
	{ ph1_o sc_out sc_lv 32 signal 24 } 
	{ ph1_o_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ ph2_i sc_in sc_lv 32 signal 25 } 
	{ ph2_o sc_out sc_lv 32 signal 25 } 
	{ ph2_o_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ ap_return sc_out sc_lv 8 signal -1 } 
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
 	{ "name": "xin1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xin1", "role": "default" }} , 
 	{ "name": "xin2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xin2", "role": "default" }} , 
 	{ "name": "tqmf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tqmf", "role": "address0" }} , 
 	{ "name": "tqmf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "ce0" }} , 
 	{ "name": "tqmf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "we0" }} , 
 	{ "name": "tqmf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tqmf", "role": "d0" }} , 
 	{ "name": "tqmf_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tqmf", "role": "q0" }} , 
 	{ "name": "tqmf_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tqmf", "role": "address1" }} , 
 	{ "name": "tqmf_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "ce1" }} , 
 	{ "name": "tqmf_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "we1" }} , 
 	{ "name": "tqmf_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tqmf", "role": "d1" }} , 
 	{ "name": "tqmf_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tqmf", "role": "q1" }} , 
 	{ "name": "h_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "h", "role": "address0" }} , 
 	{ "name": "h_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce0" }} , 
 	{ "name": "h_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "h", "role": "q0" }} , 
 	{ "name": "h_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "h", "role": "address1" }} , 
 	{ "name": "h_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce1" }} , 
 	{ "name": "h_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "h", "role": "q1" }} , 
 	{ "name": "delay_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bpl", "role": "address0" }} , 
 	{ "name": "delay_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "ce0" }} , 
 	{ "name": "delay_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "we0" }} , 
 	{ "name": "delay_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "d0" }} , 
 	{ "name": "delay_bpl_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "q0" }} , 
 	{ "name": "delay_dltx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dltx", "role": "address0" }} , 
 	{ "name": "delay_dltx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "ce0" }} , 
 	{ "name": "delay_dltx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "we0" }} , 
 	{ "name": "delay_dltx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dltx", "role": "d0" }} , 
 	{ "name": "delay_dltx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dltx", "role": "q0" }} , 
 	{ "name": "delay_dltx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dltx", "role": "address1" }} , 
 	{ "name": "delay_dltx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "ce1" }} , 
 	{ "name": "delay_dltx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "we1" }} , 
 	{ "name": "delay_dltx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dltx", "role": "d1" }} , 
 	{ "name": "delay_dltx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dltx", "role": "q1" }} , 
 	{ "name": "rlt1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt1", "role": "i" }} , 
 	{ "name": "rlt1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt1", "role": "o" }} , 
 	{ "name": "rlt1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rlt1", "role": "o_ap_vld" }} , 
 	{ "name": "al1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "al1", "role": "i" }} , 
 	{ "name": "al1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "al1", "role": "o" }} , 
 	{ "name": "al1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "al1", "role": "o_ap_vld" }} , 
 	{ "name": "rlt2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt2", "role": "i" }} , 
 	{ "name": "rlt2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt2", "role": "o" }} , 
 	{ "name": "rlt2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rlt2", "role": "o_ap_vld" }} , 
 	{ "name": "al2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "al2", "role": "i" }} , 
 	{ "name": "al2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "al2", "role": "o" }} , 
 	{ "name": "al2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "al2", "role": "o_ap_vld" }} , 
 	{ "name": "detl_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "detl", "role": "i" }} , 
 	{ "name": "detl_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "detl", "role": "o" }} , 
 	{ "name": "detl_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "detl", "role": "o_ap_vld" }} , 
 	{ "name": "il", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "il", "role": "default" }} , 
 	{ "name": "il_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "il", "role": "ap_vld" }} , 
 	{ "name": "qq4_code4_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "address0" }} , 
 	{ "name": "qq4_code4_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "ce0" }} , 
 	{ "name": "qq4_code4_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "qq4_code4_table", "role": "q0" }} , 
 	{ "name": "nbl_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbl", "role": "i" }} , 
 	{ "name": "nbl_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbl", "role": "o" }} , 
 	{ "name": "nbl_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nbl", "role": "o_ap_vld" }} , 
 	{ "name": "plt1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt1", "role": "i" }} , 
 	{ "name": "plt1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt1", "role": "o" }} , 
 	{ "name": "plt1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt1", "role": "o_ap_vld" }} , 
 	{ "name": "plt2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt2", "role": "i" }} , 
 	{ "name": "plt2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt2", "role": "o" }} , 
 	{ "name": "plt2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt2", "role": "o_ap_vld" }} , 
 	{ "name": "delay_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bph", "role": "address0" }} , 
 	{ "name": "delay_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "ce0" }} , 
 	{ "name": "delay_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "we0" }} , 
 	{ "name": "delay_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "d0" }} , 
 	{ "name": "delay_bph_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "q0" }} , 
 	{ "name": "delay_dhx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dhx", "role": "address0" }} , 
 	{ "name": "delay_dhx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "ce0" }} , 
 	{ "name": "delay_dhx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "we0" }} , 
 	{ "name": "delay_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dhx", "role": "d0" }} , 
 	{ "name": "delay_dhx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dhx", "role": "q0" }} , 
 	{ "name": "delay_dhx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dhx", "role": "address1" }} , 
 	{ "name": "delay_dhx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "ce1" }} , 
 	{ "name": "delay_dhx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "we1" }} , 
 	{ "name": "delay_dhx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dhx", "role": "d1" }} , 
 	{ "name": "delay_dhx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dhx", "role": "q1" }} , 
 	{ "name": "rh1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh1", "role": "i" }} , 
 	{ "name": "rh1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh1", "role": "o" }} , 
 	{ "name": "rh1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rh1", "role": "o_ap_vld" }} , 
 	{ "name": "ah1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ah1", "role": "i" }} , 
 	{ "name": "ah1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ah1", "role": "o" }} , 
 	{ "name": "ah1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ah1", "role": "o_ap_vld" }} , 
 	{ "name": "rh2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh2", "role": "i" }} , 
 	{ "name": "rh2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh2", "role": "o" }} , 
 	{ "name": "rh2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rh2", "role": "o_ap_vld" }} , 
 	{ "name": "ah2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "ah2", "role": "i" }} , 
 	{ "name": "ah2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "ah2", "role": "o" }} , 
 	{ "name": "ah2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ah2", "role": "o_ap_vld" }} , 
 	{ "name": "deth_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "deth", "role": "i" }} , 
 	{ "name": "deth_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "deth", "role": "o" }} , 
 	{ "name": "deth_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "deth", "role": "o_ap_vld" }} , 
 	{ "name": "nbh_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbh", "role": "i" }} , 
 	{ "name": "nbh_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbh", "role": "o" }} , 
 	{ "name": "nbh_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nbh", "role": "o_ap_vld" }} , 
 	{ "name": "ph1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph1", "role": "i" }} , 
 	{ "name": "ph1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph1", "role": "o" }} , 
 	{ "name": "ph1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph1", "role": "o_ap_vld" }} , 
 	{ "name": "ph2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph2", "role": "i" }} , 
 	{ "name": "ph2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph2", "role": "o" }} , 
 	{ "name": "ph2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph2", "role": "o_ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "9", "10", "12", "14", "17", "19", "20", "21", "22", "23", "24", "25"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "168", "EstimateLatencyMax" : "170",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "xin1", "Type" : "None", "Direction" : "I"},
			{"Name" : "xin2", "Type" : "None", "Direction" : "I"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_filtez_fu_318", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "10", "SubInstance" : "grp_upzero_fu_361", "Port" : "bli", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_filtez_fu_318", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "10", "SubInstance" : "grp_upzero_fu_361", "Port" : "dlti", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_quantl_fu_336", "Port" : "decis_levl", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_quantl_fu_336", "Port" : "quant26bt_pos", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_quantl_fu_336", "Port" : "quant26bt_neg", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_filtez_fu_318", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "12", "SubInstance" : "grp_upzero_fu_370", "Port" : "bli", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_filtez_fu_318", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "12", "SubInstance" : "grp_upzero_fu_370", "Port" : "dlti", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "encode_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "encode_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_filtez_fu_318", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_filtez_fu_318.mul_16s_32s_48_1_1_U44", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8"],
		"CDFG" : "quantl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "62", "EstimateLatencyMax" : "64",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "el", "Type" : "None", "Direction" : "I"},
			{"Name" : "detl", "Type" : "None", "Direction" : "I"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "quantl_label9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336.decis_levl_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336.quant26bt_pos_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336.quant26bt_neg_U", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336.wd_abs_r_fu_116", "Parent" : "3",
		"CDFG" : "abs_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "n", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_quantl_fu_336.mul_15ns_15ns_30_1_1_U57", "Parent" : "3"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tmp_9_abs_r_fu_348", "Parent" : "0",
		"CDFG" : "abs_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "n", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_361", "Parent" : "0", "Child" : ["11"],
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
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_361.mul_16s_16s_32_1_1_U70", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_370", "Parent" : "0", "Child" : ["13"],
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
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_upzero_fu_370.mul_16s_16s_32_1_1_U70", "Parent" : "12"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_388", "Parent" : "0", "Child" : ["15", "16"],
		"CDFG" : "uppol2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "al2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt2", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_388.mul_32s_32s_64_1_1_U75", "Parent" : "14"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_388.mul_32s_32s_64_1_1_U76", "Parent" : "14"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_uppol1_fu_422", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "uppol1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "apl2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol1_fu_422.mul_32s_32s_64_1_1_U83", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U92", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U93", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_7s_39_1_1_U94", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_11ns_25_1_1_U95", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_1_1_U96", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_14_1_1_U97", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_15ns_29_1_1_U98", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	encode {
		xin1 {Type I LastRead 1 FirstWrite -1}
		xin2 {Type I LastRead 1 FirstWrite -1}
		tqmf {Type IO LastRead 4 FirstWrite 4}
		h {Type I LastRead 3 FirstWrite -1}
		delay_bpl {Type IO LastRead 2 FirstWrite -1}
		delay_dltx {Type IO LastRead 3 FirstWrite -1}
		rlt1 {Type IO LastRead 4 FirstWrite 7}
		al1 {Type IO LastRead 4 FirstWrite 11}
		rlt2 {Type IO LastRead 4 FirstWrite 4}
		al2 {Type IO LastRead 4 FirstWrite 9}
		detl {Type IO LastRead 5 FirstWrite 11}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 6}
		qq4_code4_table {Type I LastRead 6 FirstWrite -1}
		nbl {Type IO LastRead 8 FirstWrite 9}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead 8 FirstWrite 8}
		plt2 {Type IO LastRead 8 FirstWrite 8}
		delay_bph {Type IO LastRead 2 FirstWrite -1}
		delay_dhx {Type IO LastRead 3 FirstWrite -1}
		rh1 {Type IO LastRead 5 FirstWrite 7}
		ah1 {Type IO LastRead 5 FirstWrite 11}
		rh2 {Type IO LastRead 5 FirstWrite 5}
		ah2 {Type IO LastRead 5 FirstWrite 9}
		deth {Type IO LastRead 6 FirstWrite 9}
		nbh {Type IO LastRead 8 FirstWrite 8}
		ph1 {Type IO LastRead 8 FirstWrite 8}
		ph2 {Type IO LastRead 8 FirstWrite 8}}
	filtez {
		bpl {Type I LastRead 2 FirstWrite -1}
		dlt {Type I LastRead 2 FirstWrite -1}}
	quantl {
		el {Type I LastRead 0 FirstWrite -1}
		detl {Type I LastRead 0 FirstWrite -1}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}}
	abs_r {
		n {Type I LastRead 0 FirstWrite -1}}
	abs_r {
		n {Type I LastRead 0 FirstWrite -1}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	uppol2 {
		al1 {Type I LastRead 1 FirstWrite -1}
		al2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}
		plt2 {Type I LastRead 0 FirstWrite -1}}
	uppol1 {
		al1 {Type I LastRead 0 FirstWrite -1}
		apl2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "168", "Max" : "170"}
	, {"Name" : "Interval", "Min" : "168", "Max" : "170"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	xin1 { ap_none {  { xin1 in_data 0 32 } } }
	xin2 { ap_none {  { xin2 in_data 0 32 } } }
	tqmf { ap_memory {  { tqmf_address0 mem_address 1 5 }  { tqmf_ce0 mem_ce 1 1 }  { tqmf_we0 mem_we 1 1 }  { tqmf_d0 mem_din 1 32 }  { tqmf_q0 in_data 0 32 }  { tqmf_address1 MemPortADDR2 1 5 }  { tqmf_ce1 MemPortCE2 1 1 }  { tqmf_we1 MemPortWE2 1 1 }  { tqmf_d1 MemPortDIN2 1 32 }  { tqmf_q1 in_data 0 32 } } }
	h { ap_memory {  { h_address0 mem_address 1 5 }  { h_ce0 mem_ce 1 1 }  { h_q0 in_data 0 15 }  { h_address1 MemPortADDR2 1 5 }  { h_ce1 MemPortCE2 1 1 }  { h_q1 in_data 0 15 } } }
	delay_bpl { ap_memory {  { delay_bpl_address0 mem_address 1 3 }  { delay_bpl_ce0 mem_ce 1 1 }  { delay_bpl_we0 mem_we 1 1 }  { delay_bpl_d0 mem_din 1 32 }  { delay_bpl_q0 mem_dout 0 32 } } }
	delay_dltx { ap_memory {  { delay_dltx_address0 mem_address 1 3 }  { delay_dltx_ce0 mem_ce 1 1 }  { delay_dltx_we0 mem_we 1 1 }  { delay_dltx_d0 mem_din 1 16 }  { delay_dltx_q0 mem_dout 0 16 }  { delay_dltx_address1 MemPortADDR2 1 3 }  { delay_dltx_ce1 MemPortCE2 1 1 }  { delay_dltx_we1 MemPortWE2 1 1 }  { delay_dltx_d1 MemPortDIN2 1 16 }  { delay_dltx_q1 MemPortDOUT2 0 16 } } }
	rlt1 { ap_ovld {  { rlt1_i in_data 0 31 }  { rlt1_o out_data 1 31 }  { rlt1_o_ap_vld out_vld 1 1 } } }
	al1 { ap_ovld {  { al1_i in_data 0 16 }  { al1_o out_data 1 16 }  { al1_o_ap_vld out_vld 1 1 } } }
	rlt2 { ap_ovld {  { rlt2_i in_data 0 31 }  { rlt2_o out_data 1 31 }  { rlt2_o_ap_vld out_vld 1 1 } } }
	al2 { ap_ovld {  { al2_i in_data 0 15 }  { al2_o out_data 1 15 }  { al2_o_ap_vld out_vld 1 1 } } }
	detl { ap_ovld {  { detl_i in_data 0 15 }  { detl_o out_data 1 15 }  { detl_o_ap_vld out_vld 1 1 } } }
	il { ap_vld {  { il out_data 1 6 }  { il_ap_vld out_vld 1 1 } } }
	qq4_code4_table { ap_memory {  { qq4_code4_table_address0 mem_address 1 4 }  { qq4_code4_table_ce0 mem_ce 1 1 }  { qq4_code4_table_q0 in_data 0 16 } } }
	nbl { ap_ovld {  { nbl_i in_data 0 15 }  { nbl_o out_data 1 15 }  { nbl_o_ap_vld out_vld 1 1 } } }
	plt1 { ap_ovld {  { plt1_i in_data 0 32 }  { plt1_o out_data 1 32 }  { plt1_o_ap_vld out_vld 1 1 } } }
	plt2 { ap_ovld {  { plt2_i in_data 0 32 }  { plt2_o out_data 1 32 }  { plt2_o_ap_vld out_vld 1 1 } } }
	delay_bph { ap_memory {  { delay_bph_address0 mem_address 1 3 }  { delay_bph_ce0 mem_ce 1 1 }  { delay_bph_we0 mem_we 1 1 }  { delay_bph_d0 mem_din 1 32 }  { delay_bph_q0 mem_dout 0 32 } } }
	delay_dhx { ap_memory {  { delay_dhx_address0 mem_address 1 3 }  { delay_dhx_ce0 mem_ce 1 1 }  { delay_dhx_we0 mem_we 1 1 }  { delay_dhx_d0 mem_din 1 16 }  { delay_dhx_q0 mem_dout 0 16 }  { delay_dhx_address1 MemPortADDR2 1 3 }  { delay_dhx_ce1 MemPortCE2 1 1 }  { delay_dhx_we1 MemPortWE2 1 1 }  { delay_dhx_d1 MemPortDIN2 1 16 }  { delay_dhx_q1 MemPortDOUT2 0 16 } } }
	rh1 { ap_ovld {  { rh1_i in_data 0 31 }  { rh1_o out_data 1 31 }  { rh1_o_ap_vld out_vld 1 1 } } }
	ah1 { ap_ovld {  { ah1_i in_data 0 16 }  { ah1_o out_data 1 16 }  { ah1_o_ap_vld out_vld 1 1 } } }
	rh2 { ap_ovld {  { rh2_i in_data 0 31 }  { rh2_o out_data 1 31 }  { rh2_o_ap_vld out_vld 1 1 } } }
	ah2 { ap_ovld {  { ah2_i in_data 0 15 }  { ah2_o out_data 1 15 }  { ah2_o_ap_vld out_vld 1 1 } } }
	deth { ap_ovld {  { deth_i in_data 0 15 }  { deth_o out_data 1 15 }  { deth_o_ap_vld out_vld 1 1 } } }
	nbh { ap_ovld {  { nbh_i in_data 0 15 }  { nbh_o out_data 1 15 }  { nbh_o_ap_vld out_vld 1 1 } } }
	ph1 { ap_ovld {  { ph1_i in_data 0 32 }  { ph1_o out_data 1 32 }  { ph1_o_ap_vld out_vld 1 1 } } }
	ph2 { ap_ovld {  { ph2_i in_data 0 32 }  { ph2_o out_data 1 32 }  { ph2_o_ap_vld out_vld 1 1 } } }
}
