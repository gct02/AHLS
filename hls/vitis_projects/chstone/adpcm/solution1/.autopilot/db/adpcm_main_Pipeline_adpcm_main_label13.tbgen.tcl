set moduleName adpcm_main_Pipeline_adpcm_main_label13
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {adpcm_main_Pipeline_adpcm_main_label13}
set C_modelType { void 0 }
set C_modelArgList {
	{ compressed int 32 regular {array 4000 { 1 3 } 1 1 }  }
	{ result int 32 regular {array 8000 { 0 0 } 0 1 }  }
	{ dec_rlt1 int 31 regular {pointer 2} {global 2}  }
	{ dec_al1 int 16 regular {pointer 2} {global 2}  }
	{ dec_rlt2 int 31 regular {pointer 2} {global 2}  }
	{ dec_al2 int 15 regular {pointer 2} {global 2}  }
	{ dec_detl int 15 regular {pointer 2} {global 2}  }
	{ il int 6 regular {pointer 0} {global 0}  }
	{ dec_nbl int 15 regular {pointer 2} {global 2}  }
	{ dec_plt1 int 32 regular {pointer 2} {global 2}  }
	{ dec_plt2 int 32 regular {pointer 2} {global 2}  }
	{ dec_rh1 int 31 regular {pointer 2} {global 2}  }
	{ dec_ah1 int 16 regular {pointer 2} {global 2}  }
	{ dec_rh2 int 31 regular {pointer 2} {global 2}  }
	{ dec_ah2 int 15 regular {pointer 2} {global 2}  }
	{ dec_deth int 15 regular {pointer 2} {global 2}  }
	{ dec_nbh int 15 regular {pointer 2} {global 2}  }
	{ dec_ph1 int 32 regular {pointer 2} {global 2}  }
	{ dec_ph2 int 32 regular {pointer 2} {global 2}  }
	{ dec_del_bpl int 32 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ dec_del_dltx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ dec_del_bph int 32 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ dec_del_dhx int 14 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ accumc int 32 regular {array 11 { 2 2 } 1 1 } {global 2}  }
	{ accumd int 32 regular {array 11 { 2 2 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "compressed", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "result", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dec_rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_al1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_al2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_detl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "il", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "dec_nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_deth", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "dec_del_dhx", "interface" : "memory", "bitwidth" : 14, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "accumc", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "accumd", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 126
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ compressed_address0 sc_out sc_lv 12 signal 0 } 
	{ compressed_ce0 sc_out sc_logic 1 signal 0 } 
	{ compressed_q0 sc_in sc_lv 32 signal 0 } 
	{ result_address0 sc_out sc_lv 13 signal 1 } 
	{ result_ce0 sc_out sc_logic 1 signal 1 } 
	{ result_we0 sc_out sc_logic 1 signal 1 } 
	{ result_d0 sc_out sc_lv 32 signal 1 } 
	{ result_address1 sc_out sc_lv 13 signal 1 } 
	{ result_ce1 sc_out sc_logic 1 signal 1 } 
	{ result_we1 sc_out sc_logic 1 signal 1 } 
	{ result_d1 sc_out sc_lv 32 signal 1 } 
	{ dec_rlt1_i sc_in sc_lv 31 signal 2 } 
	{ dec_rlt1_o sc_out sc_lv 31 signal 2 } 
	{ dec_rlt1_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ dec_al1_i sc_in sc_lv 16 signal 3 } 
	{ dec_al1_o sc_out sc_lv 16 signal 3 } 
	{ dec_al1_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ dec_rlt2_i sc_in sc_lv 31 signal 4 } 
	{ dec_rlt2_o sc_out sc_lv 31 signal 4 } 
	{ dec_rlt2_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ dec_al2_i sc_in sc_lv 15 signal 5 } 
	{ dec_al2_o sc_out sc_lv 15 signal 5 } 
	{ dec_al2_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ dec_detl_i sc_in sc_lv 15 signal 6 } 
	{ dec_detl_o sc_out sc_lv 15 signal 6 } 
	{ dec_detl_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ il sc_in sc_lv 6 signal 7 } 
	{ dec_nbl_i sc_in sc_lv 15 signal 8 } 
	{ dec_nbl_o sc_out sc_lv 15 signal 8 } 
	{ dec_nbl_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ dec_plt1_i sc_in sc_lv 32 signal 9 } 
	{ dec_plt1_o sc_out sc_lv 32 signal 9 } 
	{ dec_plt1_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ dec_plt2_i sc_in sc_lv 32 signal 10 } 
	{ dec_plt2_o sc_out sc_lv 32 signal 10 } 
	{ dec_plt2_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ dec_rh1_i sc_in sc_lv 31 signal 11 } 
	{ dec_rh1_o sc_out sc_lv 31 signal 11 } 
	{ dec_rh1_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ dec_ah1_i sc_in sc_lv 16 signal 12 } 
	{ dec_ah1_o sc_out sc_lv 16 signal 12 } 
	{ dec_ah1_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ dec_rh2_i sc_in sc_lv 31 signal 13 } 
	{ dec_rh2_o sc_out sc_lv 31 signal 13 } 
	{ dec_rh2_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ dec_ah2_i sc_in sc_lv 15 signal 14 } 
	{ dec_ah2_o sc_out sc_lv 15 signal 14 } 
	{ dec_ah2_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ dec_deth_i sc_in sc_lv 15 signal 15 } 
	{ dec_deth_o sc_out sc_lv 15 signal 15 } 
	{ dec_deth_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ dec_nbh_i sc_in sc_lv 15 signal 16 } 
	{ dec_nbh_o sc_out sc_lv 15 signal 16 } 
	{ dec_nbh_o_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ dec_ph1_i sc_in sc_lv 32 signal 17 } 
	{ dec_ph1_o sc_out sc_lv 32 signal 17 } 
	{ dec_ph1_o_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ dec_ph2_i sc_in sc_lv 32 signal 18 } 
	{ dec_ph2_o sc_out sc_lv 32 signal 18 } 
	{ dec_ph2_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ dec_del_bpl_address0 sc_out sc_lv 3 signal 19 } 
	{ dec_del_bpl_ce0 sc_out sc_logic 1 signal 19 } 
	{ dec_del_bpl_we0 sc_out sc_logic 1 signal 19 } 
	{ dec_del_bpl_d0 sc_out sc_lv 32 signal 19 } 
	{ dec_del_bpl_q0 sc_in sc_lv 32 signal 19 } 
	{ dec_del_bpl_address1 sc_out sc_lv 3 signal 19 } 
	{ dec_del_bpl_ce1 sc_out sc_logic 1 signal 19 } 
	{ dec_del_bpl_we1 sc_out sc_logic 1 signal 19 } 
	{ dec_del_bpl_d1 sc_out sc_lv 32 signal 19 } 
	{ dec_del_bpl_q1 sc_in sc_lv 32 signal 19 } 
	{ dec_del_dltx_address0 sc_out sc_lv 3 signal 20 } 
	{ dec_del_dltx_ce0 sc_out sc_logic 1 signal 20 } 
	{ dec_del_dltx_we0 sc_out sc_logic 1 signal 20 } 
	{ dec_del_dltx_d0 sc_out sc_lv 16 signal 20 } 
	{ dec_del_dltx_q0 sc_in sc_lv 16 signal 20 } 
	{ dec_del_dltx_address1 sc_out sc_lv 3 signal 20 } 
	{ dec_del_dltx_ce1 sc_out sc_logic 1 signal 20 } 
	{ dec_del_dltx_we1 sc_out sc_logic 1 signal 20 } 
	{ dec_del_dltx_d1 sc_out sc_lv 16 signal 20 } 
	{ dec_del_dltx_q1 sc_in sc_lv 16 signal 20 } 
	{ dec_del_bph_address0 sc_out sc_lv 3 signal 21 } 
	{ dec_del_bph_ce0 sc_out sc_logic 1 signal 21 } 
	{ dec_del_bph_we0 sc_out sc_logic 1 signal 21 } 
	{ dec_del_bph_d0 sc_out sc_lv 32 signal 21 } 
	{ dec_del_bph_q0 sc_in sc_lv 32 signal 21 } 
	{ dec_del_bph_address1 sc_out sc_lv 3 signal 21 } 
	{ dec_del_bph_ce1 sc_out sc_logic 1 signal 21 } 
	{ dec_del_bph_we1 sc_out sc_logic 1 signal 21 } 
	{ dec_del_bph_d1 sc_out sc_lv 32 signal 21 } 
	{ dec_del_bph_q1 sc_in sc_lv 32 signal 21 } 
	{ dec_del_dhx_address0 sc_out sc_lv 3 signal 22 } 
	{ dec_del_dhx_ce0 sc_out sc_logic 1 signal 22 } 
	{ dec_del_dhx_we0 sc_out sc_logic 1 signal 22 } 
	{ dec_del_dhx_d0 sc_out sc_lv 14 signal 22 } 
	{ dec_del_dhx_q0 sc_in sc_lv 14 signal 22 } 
	{ dec_del_dhx_address1 sc_out sc_lv 3 signal 22 } 
	{ dec_del_dhx_ce1 sc_out sc_logic 1 signal 22 } 
	{ dec_del_dhx_we1 sc_out sc_logic 1 signal 22 } 
	{ dec_del_dhx_d1 sc_out sc_lv 14 signal 22 } 
	{ dec_del_dhx_q1 sc_in sc_lv 14 signal 22 } 
	{ accumc_address0 sc_out sc_lv 4 signal 23 } 
	{ accumc_ce0 sc_out sc_logic 1 signal 23 } 
	{ accumc_we0 sc_out sc_logic 1 signal 23 } 
	{ accumc_d0 sc_out sc_lv 32 signal 23 } 
	{ accumc_q0 sc_in sc_lv 32 signal 23 } 
	{ accumc_address1 sc_out sc_lv 4 signal 23 } 
	{ accumc_ce1 sc_out sc_logic 1 signal 23 } 
	{ accumc_we1 sc_out sc_logic 1 signal 23 } 
	{ accumc_d1 sc_out sc_lv 32 signal 23 } 
	{ accumc_q1 sc_in sc_lv 32 signal 23 } 
	{ accumd_address0 sc_out sc_lv 4 signal 24 } 
	{ accumd_ce0 sc_out sc_logic 1 signal 24 } 
	{ accumd_we0 sc_out sc_logic 1 signal 24 } 
	{ accumd_d0 sc_out sc_lv 32 signal 24 } 
	{ accumd_q0 sc_in sc_lv 32 signal 24 } 
	{ accumd_address1 sc_out sc_lv 4 signal 24 } 
	{ accumd_ce1 sc_out sc_logic 1 signal 24 } 
	{ accumd_we1 sc_out sc_logic 1 signal 24 } 
	{ accumd_d1 sc_out sc_lv 32 signal 24 } 
	{ accumd_q1 sc_in sc_lv 32 signal 24 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "compressed_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "compressed", "role": "address0" }} , 
 	{ "name": "compressed_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compressed", "role": "ce0" }} , 
 	{ "name": "compressed_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compressed", "role": "q0" }} , 
 	{ "name": "result_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "result", "role": "address0" }} , 
 	{ "name": "result_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "ce0" }} , 
 	{ "name": "result_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "we0" }} , 
 	{ "name": "result_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result", "role": "d0" }} , 
 	{ "name": "result_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "result", "role": "address1" }} , 
 	{ "name": "result_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "ce1" }} , 
 	{ "name": "result_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "we1" }} , 
 	{ "name": "result_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result", "role": "d1" }} , 
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
 	{ "name": "dec_del_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "address0" }} , 
 	{ "name": "dec_del_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "ce0" }} , 
 	{ "name": "dec_del_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "we0" }} , 
 	{ "name": "dec_del_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "d0" }} , 
 	{ "name": "dec_del_bpl_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "q0" }} , 
 	{ "name": "dec_del_bpl_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "address1" }} , 
 	{ "name": "dec_del_bpl_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "ce1" }} , 
 	{ "name": "dec_del_bpl_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "we1" }} , 
 	{ "name": "dec_del_bpl_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "d1" }} , 
 	{ "name": "dec_del_bpl_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "q1" }} , 
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
 	{ "name": "dec_del_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "address0" }} , 
 	{ "name": "dec_del_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "ce0" }} , 
 	{ "name": "dec_del_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "we0" }} , 
 	{ "name": "dec_del_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "d0" }} , 
 	{ "name": "dec_del_bph_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "q0" }} , 
 	{ "name": "dec_del_bph_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "address1" }} , 
 	{ "name": "dec_del_bph_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "ce1" }} , 
 	{ "name": "dec_del_bph_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "we1" }} , 
 	{ "name": "dec_del_bph_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "d1" }} , 
 	{ "name": "dec_del_bph_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "q1" }} , 
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
 	{ "name": "accumc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumc", "role": "address0" }} , 
 	{ "name": "accumc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "ce0" }} , 
 	{ "name": "accumc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "we0" }} , 
 	{ "name": "accumc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "d0" }} , 
 	{ "name": "accumc_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "q0" }} , 
 	{ "name": "accumc_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumc", "role": "address1" }} , 
 	{ "name": "accumc_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "ce1" }} , 
 	{ "name": "accumc_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "we1" }} , 
 	{ "name": "accumc_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "d1" }} , 
 	{ "name": "accumc_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "q1" }} , 
 	{ "name": "accumd_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumd", "role": "address0" }} , 
 	{ "name": "accumd_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "ce0" }} , 
 	{ "name": "accumd_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "we0" }} , 
 	{ "name": "accumd_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "d0" }} , 
 	{ "name": "accumd_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "q0" }} , 
 	{ "name": "accumd_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumd", "role": "address1" }} , 
 	{ "name": "accumd_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "ce1" }} , 
 	{ "name": "accumd_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "we1" }} , 
 	{ "name": "accumd_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "d1" }} , 
 	{ "name": "accumd_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "42"],
		"CDFG" : "adpcm_main_Pipeline_adpcm_main_label13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "144003", "EstimateLatencyMax" : "144003",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "compressed", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "result", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rlt1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_al1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rlt2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_al2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_detl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "qq4_code4_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "il", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "il", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "qq6_code6_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_nbl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "wl_code_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "ilb_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_plt1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_plt2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rh1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ah1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rh2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ah2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_deth", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_nbh", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ph1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ph2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "xout1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "xout2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_bpl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_dltx", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_bph", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_dhx", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "accumc", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_decode_fu_142", "Port" : "accumd", "Inst_start_state" : "3", "Inst_end_state" : "37"}]}],
		"Loop" : [
			{"Name" : "adpcm_main_label13", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "36", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "10",
		"VariableLatency" : "0", "ExactLatency" : "34", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
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
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "xout1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xout2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.qq4_code4_table_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.qq6_code6_table_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.wl_code_table_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.ilb_table_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_32s_46_5_1_U154", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_32s_46_5_1_U155", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_15s_32s_47_5_1_U156", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_32s_46_5_1_U157", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_32s_46_5_1_U158", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_32s_47_5_1_U159", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_32s_64_5_1_U160", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_32s_64_5_1_U161", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_9ns_41_5_1_U162", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_12ns_44_5_1_U163", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_12ns_44_5_1_U164", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_13ns_45_5_1_U165", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_15ns_46_5_1_U166", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_11s_42_5_1_U167", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_11s_43_5_1_U168", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_13s_45_5_1_U169", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_32s_13s_45_5_1_U170", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_33s_7s_39_5_1_U171", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_33s_7s_40_5_1_U172", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mux_4_2_14_1_1_U173", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_15ns_29_2_1_U174", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mux_4_2_11_1_1_U175", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_15ns_31_2_1_U176", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_15ns_31_2_1_U177", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U178", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U179", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U180", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U181", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U182", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U183", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U184", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U185", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U186", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_16s_16s_32_2_1_U187", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U188", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_142.mul_14s_14s_28_2_1_U189", "Parent" : "1"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	adpcm_main_Pipeline_adpcm_main_label13 {
		compressed {Type I LastRead 0 FirstWrite -1}
		result {Type O LastRead -1 FirstWrite 37}
		dec_rlt1 {Type IO LastRead 14 FirstWrite 21}
		dec_al1 {Type IO LastRead 14 FirstWrite 23}
		dec_rlt2 {Type IO LastRead 11 FirstWrite 14}
		dec_al2 {Type IO LastRead 11 FirstWrite 20}
		dec_detl {Type IO LastRead 2 FirstWrite 6}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		il {Type I LastRead 0 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 1 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 12 FirstWrite 12}
		dec_plt2 {Type IO LastRead 12 FirstWrite 12}
		dec_rh1 {Type IO LastRead 15 FirstWrite 21}
		dec_ah1 {Type IO LastRead 15 FirstWrite 24}
		dec_rh2 {Type IO LastRead 14 FirstWrite 15}
		dec_ah2 {Type IO LastRead 14 FirstWrite 21}
		dec_deth {Type IO LastRead 1 FirstWrite 5}
		dec_nbh {Type IO LastRead 0 FirstWrite 2}
		dec_ph1 {Type IO LastRead 13 FirstWrite 13}
		dec_ph2 {Type IO LastRead 13 FirstWrite 13}
		xout1 {Type IO LastRead -1 FirstWrite -1}
		xout2 {Type IO LastRead -1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 3 FirstWrite 5}
		dec_del_dltx {Type IO LastRead 3 FirstWrite 2}
		dec_del_bph {Type IO LastRead 3 FirstWrite 4}
		dec_del_dhx {Type IO LastRead 3 FirstWrite 2}
		accumc {Type IO LastRead 14 FirstWrite 3}
		accumd {Type IO LastRead 14 FirstWrite 3}}
	decode {
		input_r {Type I LastRead 0 FirstWrite -1}
		dec_rlt1 {Type IO LastRead 14 FirstWrite 21}
		dec_al1 {Type IO LastRead 14 FirstWrite 23}
		dec_rlt2 {Type IO LastRead 11 FirstWrite 14}
		dec_al2 {Type IO LastRead 11 FirstWrite 20}
		dec_detl {Type IO LastRead 2 FirstWrite 6}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		il {Type I LastRead 0 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 1 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 12 FirstWrite 12}
		dec_plt2 {Type IO LastRead 12 FirstWrite 12}
		dec_rh1 {Type IO LastRead 15 FirstWrite 21}
		dec_ah1 {Type IO LastRead 15 FirstWrite 24}
		dec_rh2 {Type IO LastRead 14 FirstWrite 15}
		dec_ah2 {Type IO LastRead 14 FirstWrite 21}
		dec_deth {Type IO LastRead 1 FirstWrite 5}
		dec_nbh {Type IO LastRead 0 FirstWrite 2}
		dec_ph1 {Type IO LastRead 13 FirstWrite 13}
		dec_ph2 {Type IO LastRead 13 FirstWrite 13}
		xout1 {Type O LastRead -1 FirstWrite 34}
		xout2 {Type O LastRead -1 FirstWrite 34}
		dec_del_bpl {Type IO LastRead 3 FirstWrite 5}
		dec_del_dltx {Type IO LastRead 3 FirstWrite 2}
		dec_del_bph {Type IO LastRead 3 FirstWrite 4}
		dec_del_dhx {Type IO LastRead 3 FirstWrite 2}
		accumc {Type IO LastRead 14 FirstWrite 3}
		accumd {Type IO LastRead 14 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "144003", "Max" : "144003"}
	, {"Name" : "Interval", "Min" : "144003", "Max" : "144003"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	compressed { ap_memory {  { compressed_address0 mem_address 1 12 }  { compressed_ce0 mem_ce 1 1 }  { compressed_q0 in_data 0 32 } } }
	result { ap_memory {  { result_address0 mem_address 1 13 }  { result_ce0 mem_ce 1 1 }  { result_we0 mem_we 1 1 }  { result_d0 mem_din 1 32 }  { result_address1 MemPortADDR2 1 13 }  { result_ce1 MemPortCE2 1 1 }  { result_we1 MemPortWE2 1 1 }  { result_d1 MemPortDIN2 1 32 } } }
	dec_rlt1 { ap_ovld {  { dec_rlt1_i in_data 0 31 }  { dec_rlt1_o out_data 1 31 }  { dec_rlt1_o_ap_vld out_vld 1 1 } } }
	dec_al1 { ap_ovld {  { dec_al1_i in_data 0 16 }  { dec_al1_o out_data 1 16 }  { dec_al1_o_ap_vld out_vld 1 1 } } }
	dec_rlt2 { ap_ovld {  { dec_rlt2_i in_data 0 31 }  { dec_rlt2_o out_data 1 31 }  { dec_rlt2_o_ap_vld out_vld 1 1 } } }
	dec_al2 { ap_ovld {  { dec_al2_i in_data 0 15 }  { dec_al2_o out_data 1 15 }  { dec_al2_o_ap_vld out_vld 1 1 } } }
	dec_detl { ap_ovld {  { dec_detl_i in_data 0 15 }  { dec_detl_o out_data 1 15 }  { dec_detl_o_ap_vld out_vld 1 1 } } }
	il { ap_none {  { il in_data 0 6 } } }
	dec_nbl { ap_ovld {  { dec_nbl_i in_data 0 15 }  { dec_nbl_o out_data 1 15 }  { dec_nbl_o_ap_vld out_vld 1 1 } } }
	dec_plt1 { ap_ovld {  { dec_plt1_i in_data 0 32 }  { dec_plt1_o out_data 1 32 }  { dec_plt1_o_ap_vld out_vld 1 1 } } }
	dec_plt2 { ap_ovld {  { dec_plt2_i in_data 0 32 }  { dec_plt2_o out_data 1 32 }  { dec_plt2_o_ap_vld out_vld 1 1 } } }
	dec_rh1 { ap_ovld {  { dec_rh1_i in_data 0 31 }  { dec_rh1_o out_data 1 31 }  { dec_rh1_o_ap_vld out_vld 1 1 } } }
	dec_ah1 { ap_ovld {  { dec_ah1_i in_data 0 16 }  { dec_ah1_o out_data 1 16 }  { dec_ah1_o_ap_vld out_vld 1 1 } } }
	dec_rh2 { ap_ovld {  { dec_rh2_i in_data 0 31 }  { dec_rh2_o out_data 1 31 }  { dec_rh2_o_ap_vld out_vld 1 1 } } }
	dec_ah2 { ap_ovld {  { dec_ah2_i in_data 0 15 }  { dec_ah2_o out_data 1 15 }  { dec_ah2_o_ap_vld out_vld 1 1 } } }
	dec_deth { ap_ovld {  { dec_deth_i in_data 0 15 }  { dec_deth_o out_data 1 15 }  { dec_deth_o_ap_vld out_vld 1 1 } } }
	dec_nbh { ap_ovld {  { dec_nbh_i in_data 0 15 }  { dec_nbh_o out_data 1 15 }  { dec_nbh_o_ap_vld out_vld 1 1 } } }
	dec_ph1 { ap_ovld {  { dec_ph1_i in_data 0 32 }  { dec_ph1_o out_data 1 32 }  { dec_ph1_o_ap_vld out_vld 1 1 } } }
	dec_ph2 { ap_ovld {  { dec_ph2_i in_data 0 32 }  { dec_ph2_o out_data 1 32 }  { dec_ph2_o_ap_vld out_vld 1 1 } } }
	dec_del_bpl { ap_memory {  { dec_del_bpl_address0 mem_address 1 3 }  { dec_del_bpl_ce0 mem_ce 1 1 }  { dec_del_bpl_we0 mem_we 1 1 }  { dec_del_bpl_d0 mem_din 1 32 }  { dec_del_bpl_q0 mem_dout 0 32 }  { dec_del_bpl_address1 MemPortADDR2 1 3 }  { dec_del_bpl_ce1 MemPortCE2 1 1 }  { dec_del_bpl_we1 MemPortWE2 1 1 }  { dec_del_bpl_d1 MemPortDIN2 1 32 }  { dec_del_bpl_q1 MemPortDOUT2 0 32 } } }
	dec_del_dltx { ap_memory {  { dec_del_dltx_address0 mem_address 1 3 }  { dec_del_dltx_ce0 mem_ce 1 1 }  { dec_del_dltx_we0 mem_we 1 1 }  { dec_del_dltx_d0 mem_din 1 16 }  { dec_del_dltx_q0 mem_dout 0 16 }  { dec_del_dltx_address1 MemPortADDR2 1 3 }  { dec_del_dltx_ce1 MemPortCE2 1 1 }  { dec_del_dltx_we1 MemPortWE2 1 1 }  { dec_del_dltx_d1 MemPortDIN2 1 16 }  { dec_del_dltx_q1 MemPortDOUT2 0 16 } } }
	dec_del_bph { ap_memory {  { dec_del_bph_address0 mem_address 1 3 }  { dec_del_bph_ce0 mem_ce 1 1 }  { dec_del_bph_we0 mem_we 1 1 }  { dec_del_bph_d0 mem_din 1 32 }  { dec_del_bph_q0 mem_dout 0 32 }  { dec_del_bph_address1 MemPortADDR2 1 3 }  { dec_del_bph_ce1 MemPortCE2 1 1 }  { dec_del_bph_we1 MemPortWE2 1 1 }  { dec_del_bph_d1 MemPortDIN2 1 32 }  { dec_del_bph_q1 MemPortDOUT2 0 32 } } }
	dec_del_dhx { ap_memory {  { dec_del_dhx_address0 mem_address 1 3 }  { dec_del_dhx_ce0 mem_ce 1 1 }  { dec_del_dhx_we0 mem_we 1 1 }  { dec_del_dhx_d0 mem_din 1 14 }  { dec_del_dhx_q0 mem_dout 0 14 }  { dec_del_dhx_address1 MemPortADDR2 1 3 }  { dec_del_dhx_ce1 MemPortCE2 1 1 }  { dec_del_dhx_we1 MemPortWE2 1 1 }  { dec_del_dhx_d1 MemPortDIN2 1 14 }  { dec_del_dhx_q1 MemPortDOUT2 0 14 } } }
	accumc { ap_memory {  { accumc_address0 mem_address 1 4 }  { accumc_ce0 mem_ce 1 1 }  { accumc_we0 mem_we 1 1 }  { accumc_d0 mem_din 1 32 }  { accumc_q0 mem_dout 0 32 }  { accumc_address1 MemPortADDR2 1 4 }  { accumc_ce1 MemPortCE2 1 1 }  { accumc_we1 MemPortWE2 1 1 }  { accumc_d1 MemPortDIN2 1 32 }  { accumc_q1 MemPortDOUT2 0 32 } } }
	accumd { ap_memory {  { accumd_address0 mem_address 1 4 }  { accumd_ce0 mem_ce 1 1 }  { accumd_we0 mem_we 1 1 }  { accumd_d0 mem_din 1 32 }  { accumd_q0 mem_dout 0 32 }  { accumd_address1 MemPortADDR2 1 4 }  { accumd_ce1 MemPortCE2 1 1 }  { accumd_we1 MemPortWE2 1 1 }  { accumd_d1 MemPortDIN2 1 32 }  { accumd_q1 MemPortDOUT2 0 32 } } }
}
