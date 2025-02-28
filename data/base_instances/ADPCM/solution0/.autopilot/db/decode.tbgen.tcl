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
	{ wl_code_table int 13 regular {array 16 { 1 } 1 1 } {global 0}  }
	{ ilb_table int 12 regular {array 32 { 1 } 1 1 } {global 0}  }
	{ dec_plt1 int 32 regular {pointer 2} {global 2}  }
	{ dec_plt2 int 32 regular {pointer 2} {global 2}  }
	{ dec_del_bph int 32 regular {array 6 { 2 3 } 1 1 } {global 2}  }
	{ dec_del_dhx int 14 regular {array 6 { 2 2 } 1 1 } {global 2}  }
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
 	{ "Name" : "wl_code_table", "interface" : "memory", "bitwidth" : 13, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ilb_table", "interface" : "memory", "bitwidth" : 12, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dec_plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_dhx", "interface" : "memory", "bitwidth" : 14, "direction" : "READWRITE", "extern" : 0} , 
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
set portNum 115
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
	{ wl_code_table_address0 sc_out sc_lv 4 signal 11 } 
	{ wl_code_table_ce0 sc_out sc_logic 1 signal 11 } 
	{ wl_code_table_q0 sc_in sc_lv 13 signal 11 } 
	{ ilb_table_address0 sc_out sc_lv 5 signal 12 } 
	{ ilb_table_ce0 sc_out sc_logic 1 signal 12 } 
	{ ilb_table_q0 sc_in sc_lv 12 signal 12 } 
	{ dec_plt1_i sc_in sc_lv 32 signal 13 } 
	{ dec_plt1_o sc_out sc_lv 32 signal 13 } 
	{ dec_plt1_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ dec_plt2_i sc_in sc_lv 32 signal 14 } 
	{ dec_plt2_o sc_out sc_lv 32 signal 14 } 
	{ dec_plt2_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ dec_del_bph_address0 sc_out sc_lv 3 signal 15 } 
	{ dec_del_bph_ce0 sc_out sc_logic 1 signal 15 } 
	{ dec_del_bph_we0 sc_out sc_logic 1 signal 15 } 
	{ dec_del_bph_d0 sc_out sc_lv 32 signal 15 } 
	{ dec_del_bph_q0 sc_in sc_lv 32 signal 15 } 
	{ dec_del_dhx_address0 sc_out sc_lv 3 signal 16 } 
	{ dec_del_dhx_ce0 sc_out sc_logic 1 signal 16 } 
	{ dec_del_dhx_we0 sc_out sc_logic 1 signal 16 } 
	{ dec_del_dhx_d0 sc_out sc_lv 14 signal 16 } 
	{ dec_del_dhx_q0 sc_in sc_lv 14 signal 16 } 
	{ dec_del_dhx_address1 sc_out sc_lv 3 signal 16 } 
	{ dec_del_dhx_ce1 sc_out sc_logic 1 signal 16 } 
	{ dec_del_dhx_we1 sc_out sc_logic 1 signal 16 } 
	{ dec_del_dhx_d1 sc_out sc_lv 14 signal 16 } 
	{ dec_del_dhx_q1 sc_in sc_lv 14 signal 16 } 
	{ dec_rh1_i sc_in sc_lv 31 signal 17 } 
	{ dec_rh1_o sc_out sc_lv 31 signal 17 } 
	{ dec_rh1_o_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ dec_ah1_i sc_in sc_lv 16 signal 18 } 
	{ dec_ah1_o sc_out sc_lv 16 signal 18 } 
	{ dec_ah1_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ dec_rh2_i sc_in sc_lv 31 signal 19 } 
	{ dec_rh2_o sc_out sc_lv 31 signal 19 } 
	{ dec_rh2_o_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ dec_ah2_i sc_in sc_lv 15 signal 20 } 
	{ dec_ah2_o sc_out sc_lv 15 signal 20 } 
	{ dec_ah2_o_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ dec_deth_i sc_in sc_lv 15 signal 21 } 
	{ dec_deth_o sc_out sc_lv 15 signal 21 } 
	{ dec_deth_o_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ dec_nbh_i sc_in sc_lv 15 signal 22 } 
	{ dec_nbh_o sc_out sc_lv 15 signal 22 } 
	{ dec_nbh_o_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ dec_ph1_i sc_in sc_lv 32 signal 23 } 
	{ dec_ph1_o sc_out sc_lv 32 signal 23 } 
	{ dec_ph1_o_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ dec_ph2_i sc_in sc_lv 32 signal 24 } 
	{ dec_ph2_o sc_out sc_lv 32 signal 24 } 
	{ dec_ph2_o_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ accumc_address0 sc_out sc_lv 4 signal 25 } 
	{ accumc_ce0 sc_out sc_logic 1 signal 25 } 
	{ accumc_we0 sc_out sc_logic 1 signal 25 } 
	{ accumc_d0 sc_out sc_lv 32 signal 25 } 
	{ accumc_q0 sc_in sc_lv 32 signal 25 } 
	{ h_address0 sc_out sc_lv 5 signal 26 } 
	{ h_ce0 sc_out sc_logic 1 signal 26 } 
	{ h_q0 sc_in sc_lv 15 signal 26 } 
	{ h_address1 sc_out sc_lv 5 signal 26 } 
	{ h_ce1 sc_out sc_logic 1 signal 26 } 
	{ h_q1 sc_in sc_lv 15 signal 26 } 
	{ accumd_address0 sc_out sc_lv 4 signal 27 } 
	{ accumd_ce0 sc_out sc_logic 1 signal 27 } 
	{ accumd_we0 sc_out sc_logic 1 signal 27 } 
	{ accumd_d0 sc_out sc_lv 32 signal 27 } 
	{ accumd_q0 sc_in sc_lv 32 signal 27 } 
	{ xout1 sc_out sc_lv 32 signal 28 } 
	{ xout1_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ xout2 sc_out sc_lv 32 signal 29 } 
	{ xout2_ap_vld sc_out sc_logic 1 outvld 29 } 
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
 	{ "name": "wl_code_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "wl_code_table", "role": "address0" }} , 
 	{ "name": "wl_code_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "wl_code_table", "role": "ce0" }} , 
 	{ "name": "wl_code_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "wl_code_table", "role": "q0" }} , 
 	{ "name": "ilb_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ilb_table", "role": "address0" }} , 
 	{ "name": "ilb_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ilb_table", "role": "ce0" }} , 
 	{ "name": "ilb_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ilb_table", "role": "q0" }} , 
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
 	{ "name": "dec_del_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "d0" }} , 
 	{ "name": "dec_del_dhx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "q0" }} , 
 	{ "name": "dec_del_dhx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "address1" }} , 
 	{ "name": "dec_del_dhx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "ce1" }} , 
 	{ "name": "dec_del_dhx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "we1" }} , 
 	{ "name": "dec_del_dhx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "d1" }} , 
 	{ "name": "dec_del_dhx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "q1" }} , 
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
 	{ "name": "xout2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xout2", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "103", "EstimateLatencyMax" : "103",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO"},
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
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO"},
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
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6", "ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state8", "ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6", "ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state10", "ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state13"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18", "ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state19"], "PostState" : ["ap_ST_fsm_state20", "ap_ST_fsm_state19"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state24", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state24"], "PreState" : ["ap_ST_fsm_state23"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state27", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state27"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.qq6_code6_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_32s_46_1_1_U62", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U63", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U64", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_47_1_1_U65", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_48_1_1_U66", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_1_1_U67", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_1_1_U68", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_7s_39_1_1_U69", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_1_1_U70", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_1_1_U71", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U72", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_11_1_1_U73", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_14_1_1_U74", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_15ns_29_1_1_U75", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_1_1_U76", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	decode {
		input_r {Type I LastRead 1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 6 FirstWrite 6}
		dec_del_dltx {Type IO LastRead 7 FirstWrite 6}
		dec_rlt1 {Type IO LastRead 3 FirstWrite 5}
		dec_al1 {Type IO LastRead 3 FirstWrite 6}
		dec_rlt2 {Type IO LastRead 3 FirstWrite 5}
		dec_al2 {Type IO LastRead 3 FirstWrite 6}
		dec_detl {Type IO LastRead 4 FirstWrite 4}
		qq4_code4_table {Type I LastRead 2 FirstWrite -1}
		il {Type I LastRead 3 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 3 FirstWrite 3}
		wl_code_table {Type I LastRead 2 FirstWrite -1}
		ilb_table {Type I LastRead 10 FirstWrite -1}
		dec_plt1 {Type IO LastRead 5 FirstWrite 5}
		dec_plt2 {Type IO LastRead 5 FirstWrite 5}
		dec_del_bph {Type IO LastRead 13 FirstWrite 13}
		dec_del_dhx {Type IO LastRead 14 FirstWrite 13}
		dec_rh1 {Type IO LastRead 11 FirstWrite 12}
		dec_ah1 {Type IO LastRead 11 FirstWrite 13}
		dec_rh2 {Type IO LastRead 11 FirstWrite 12}
		dec_ah2 {Type IO LastRead 11 FirstWrite 13}
		dec_deth {Type IO LastRead 11 FirstWrite 11}
		dec_nbh {Type IO LastRead 10 FirstWrite 10}
		dec_ph1 {Type IO LastRead 12 FirstWrite 12}
		dec_ph2 {Type IO LastRead 12 FirstWrite 12}
		accumc {Type IO LastRead 19 FirstWrite 19}
		h {Type I LastRead 18 FirstWrite -1}
		accumd {Type IO LastRead 19 FirstWrite 19}
		xout1 {Type O LastRead -1 FirstWrite 18}
		xout2 {Type O LastRead -1 FirstWrite 18}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "103", "Max" : "103"}
	, {"Name" : "Interval", "Min" : "103", "Max" : "103"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_none {  { input_r in_data 0 8 } } }
	dec_del_bpl { ap_memory {  { dec_del_bpl_address0 mem_address 1 3 }  { dec_del_bpl_ce0 mem_ce 1 1 }  { dec_del_bpl_we0 mem_we 1 1 }  { dec_del_bpl_d0 mem_din 1 32 }  { dec_del_bpl_q0 in_data 0 32 } } }
	dec_del_dltx { ap_memory {  { dec_del_dltx_address0 mem_address 1 3 }  { dec_del_dltx_ce0 mem_ce 1 1 }  { dec_del_dltx_we0 mem_we 1 1 }  { dec_del_dltx_d0 mem_din 1 16 }  { dec_del_dltx_q0 in_data 0 16 }  { dec_del_dltx_address1 MemPortADDR2 1 3 }  { dec_del_dltx_ce1 MemPortCE2 1 1 }  { dec_del_dltx_we1 MemPortWE2 1 1 }  { dec_del_dltx_d1 MemPortDIN2 1 16 }  { dec_del_dltx_q1 MemPortDOUT2 0 16 } } }
	dec_rlt1 { ap_ovld {  { dec_rlt1_i in_data 0 31 }  { dec_rlt1_o out_data 1 31 }  { dec_rlt1_o_ap_vld out_vld 1 1 } } }
	dec_al1 { ap_ovld {  { dec_al1_i in_data 0 16 }  { dec_al1_o out_data 1 16 }  { dec_al1_o_ap_vld out_vld 1 1 } } }
	dec_rlt2 { ap_ovld {  { dec_rlt2_i in_data 0 31 }  { dec_rlt2_o out_data 1 31 }  { dec_rlt2_o_ap_vld out_vld 1 1 } } }
	dec_al2 { ap_ovld {  { dec_al2_i in_data 0 15 }  { dec_al2_o out_data 1 15 }  { dec_al2_o_ap_vld out_vld 1 1 } } }
	dec_detl { ap_ovld {  { dec_detl_i in_data 0 15 }  { dec_detl_o out_data 1 15 }  { dec_detl_o_ap_vld out_vld 1 1 } } }
	qq4_code4_table { ap_memory {  { qq4_code4_table_address0 mem_address 1 4 }  { qq4_code4_table_ce0 mem_ce 1 1 }  { qq4_code4_table_q0 mem_dout 0 16 } } }
	il { ap_none {  { il in_data 0 6 } } }
	dec_nbl { ap_ovld {  { dec_nbl_i in_data 0 15 }  { dec_nbl_o out_data 1 15 }  { dec_nbl_o_ap_vld out_vld 1 1 } } }
	wl_code_table { ap_memory {  { wl_code_table_address0 mem_address 1 4 }  { wl_code_table_ce0 mem_ce 1 1 }  { wl_code_table_q0 in_data 0 13 } } }
	ilb_table { ap_memory {  { ilb_table_address0 mem_address 1 5 }  { ilb_table_ce0 mem_ce 1 1 }  { ilb_table_q0 in_data 0 12 } } }
	dec_plt1 { ap_ovld {  { dec_plt1_i in_data 0 32 }  { dec_plt1_o out_data 1 32 }  { dec_plt1_o_ap_vld out_vld 1 1 } } }
	dec_plt2 { ap_ovld {  { dec_plt2_i in_data 0 32 }  { dec_plt2_o out_data 1 32 }  { dec_plt2_o_ap_vld out_vld 1 1 } } }
	dec_del_bph { ap_memory {  { dec_del_bph_address0 mem_address 1 3 }  { dec_del_bph_ce0 mem_ce 1 1 }  { dec_del_bph_we0 mem_we 1 1 }  { dec_del_bph_d0 mem_din 1 32 }  { dec_del_bph_q0 in_data 0 32 } } }
	dec_del_dhx { ap_memory {  { dec_del_dhx_address0 mem_address 1 3 }  { dec_del_dhx_ce0 mem_ce 1 1 }  { dec_del_dhx_we0 mem_we 1 1 }  { dec_del_dhx_d0 mem_din 1 14 }  { dec_del_dhx_q0 in_data 0 14 }  { dec_del_dhx_address1 MemPortADDR2 1 3 }  { dec_del_dhx_ce1 MemPortCE2 1 1 }  { dec_del_dhx_we1 MemPortWE2 1 1 }  { dec_del_dhx_d1 MemPortDIN2 1 14 }  { dec_del_dhx_q1 MemPortDOUT2 0 14 } } }
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
