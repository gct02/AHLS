set moduleName encode
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
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
	{ rlt1 int 31 regular {pointer 2} {global 2}  }
	{ al1 int 16 regular {pointer 2} {global 2}  }
	{ rlt2 int 31 regular {pointer 2} {global 2}  }
	{ al2 int 15 regular {pointer 2} {global 2}  }
	{ detl int 15 regular {pointer 2} {global 2}  }
	{ il int 6 regular {pointer 1} {global 1}  }
	{ nbl int 15 regular {pointer 2} {global 2}  }
	{ plt1 int 32 regular {pointer 2} {global 2}  }
	{ plt2 int 32 regular {pointer 2} {global 2}  }
	{ rh1 int 31 regular {pointer 2} {global 2}  }
	{ ah1 int 16 regular {pointer 2} {global 2}  }
	{ rh2 int 31 regular {pointer 2} {global 2}  }
	{ ah2 int 15 regular {pointer 2} {global 2}  }
	{ deth int 15 regular {pointer 2} {global 2}  }
	{ nbh int 15 regular {pointer 2} {global 2}  }
	{ ph1 int 32 regular {pointer 2} {global 2}  }
	{ ph2 int 32 regular {pointer 2} {global 2}  }
	{ tqmf int 32 regular {array 24 { 2 2 } 1 1 } {global 2}  }
	{ delay_bpl int 32 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ delay_dltx int 16 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ delay_bph int 32 regular {array 6 { 2 2 } 1 1 } {global 2}  }
	{ delay_dhx int 14 regular {array 6 { 2 2 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "xin1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "xin2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "al1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "al2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "detl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "il", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "deth", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "tqmf", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "delay_dhx", "interface" : "memory", "bitwidth" : 14, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 8} ]}
# RTL Port declarations: 
set portNum 109
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ xin1 sc_in sc_lv 32 signal 0 } 
	{ xin2 sc_in sc_lv 32 signal 1 } 
	{ rlt1_i sc_in sc_lv 31 signal 2 } 
	{ rlt1_o sc_out sc_lv 31 signal 2 } 
	{ rlt1_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ al1_i sc_in sc_lv 16 signal 3 } 
	{ al1_o sc_out sc_lv 16 signal 3 } 
	{ al1_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ rlt2_i sc_in sc_lv 31 signal 4 } 
	{ rlt2_o sc_out sc_lv 31 signal 4 } 
	{ rlt2_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ al2_i sc_in sc_lv 15 signal 5 } 
	{ al2_o sc_out sc_lv 15 signal 5 } 
	{ al2_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ detl_i sc_in sc_lv 15 signal 6 } 
	{ detl_o sc_out sc_lv 15 signal 6 } 
	{ detl_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ il sc_out sc_lv 6 signal 7 } 
	{ il_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ nbl_i sc_in sc_lv 15 signal 8 } 
	{ nbl_o sc_out sc_lv 15 signal 8 } 
	{ nbl_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ plt1_i sc_in sc_lv 32 signal 9 } 
	{ plt1_o sc_out sc_lv 32 signal 9 } 
	{ plt1_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ plt2_i sc_in sc_lv 32 signal 10 } 
	{ plt2_o sc_out sc_lv 32 signal 10 } 
	{ plt2_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ rh1_i sc_in sc_lv 31 signal 11 } 
	{ rh1_o sc_out sc_lv 31 signal 11 } 
	{ rh1_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ ah1_i sc_in sc_lv 16 signal 12 } 
	{ ah1_o sc_out sc_lv 16 signal 12 } 
	{ ah1_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ rh2_i sc_in sc_lv 31 signal 13 } 
	{ rh2_o sc_out sc_lv 31 signal 13 } 
	{ rh2_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ ah2_i sc_in sc_lv 15 signal 14 } 
	{ ah2_o sc_out sc_lv 15 signal 14 } 
	{ ah2_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ deth_i sc_in sc_lv 15 signal 15 } 
	{ deth_o sc_out sc_lv 15 signal 15 } 
	{ deth_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ nbh_i sc_in sc_lv 15 signal 16 } 
	{ nbh_o sc_out sc_lv 15 signal 16 } 
	{ nbh_o_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ ph1_i sc_in sc_lv 32 signal 17 } 
	{ ph1_o sc_out sc_lv 32 signal 17 } 
	{ ph1_o_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ ph2_i sc_in sc_lv 32 signal 18 } 
	{ ph2_o sc_out sc_lv 32 signal 18 } 
	{ ph2_o_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ tqmf_address0 sc_out sc_lv 5 signal 19 } 
	{ tqmf_ce0 sc_out sc_logic 1 signal 19 } 
	{ tqmf_we0 sc_out sc_logic 1 signal 19 } 
	{ tqmf_d0 sc_out sc_lv 32 signal 19 } 
	{ tqmf_q0 sc_in sc_lv 32 signal 19 } 
	{ tqmf_address1 sc_out sc_lv 5 signal 19 } 
	{ tqmf_ce1 sc_out sc_logic 1 signal 19 } 
	{ tqmf_we1 sc_out sc_logic 1 signal 19 } 
	{ tqmf_d1 sc_out sc_lv 32 signal 19 } 
	{ tqmf_q1 sc_in sc_lv 32 signal 19 } 
	{ delay_bpl_address0 sc_out sc_lv 3 signal 20 } 
	{ delay_bpl_ce0 sc_out sc_logic 1 signal 20 } 
	{ delay_bpl_we0 sc_out sc_logic 1 signal 20 } 
	{ delay_bpl_d0 sc_out sc_lv 32 signal 20 } 
	{ delay_bpl_q0 sc_in sc_lv 32 signal 20 } 
	{ delay_bpl_address1 sc_out sc_lv 3 signal 20 } 
	{ delay_bpl_ce1 sc_out sc_logic 1 signal 20 } 
	{ delay_bpl_we1 sc_out sc_logic 1 signal 20 } 
	{ delay_bpl_d1 sc_out sc_lv 32 signal 20 } 
	{ delay_bpl_q1 sc_in sc_lv 32 signal 20 } 
	{ delay_dltx_address0 sc_out sc_lv 3 signal 21 } 
	{ delay_dltx_ce0 sc_out sc_logic 1 signal 21 } 
	{ delay_dltx_we0 sc_out sc_logic 1 signal 21 } 
	{ delay_dltx_d0 sc_out sc_lv 16 signal 21 } 
	{ delay_dltx_q0 sc_in sc_lv 16 signal 21 } 
	{ delay_dltx_address1 sc_out sc_lv 3 signal 21 } 
	{ delay_dltx_ce1 sc_out sc_logic 1 signal 21 } 
	{ delay_dltx_we1 sc_out sc_logic 1 signal 21 } 
	{ delay_dltx_d1 sc_out sc_lv 16 signal 21 } 
	{ delay_dltx_q1 sc_in sc_lv 16 signal 21 } 
	{ delay_bph_address0 sc_out sc_lv 3 signal 22 } 
	{ delay_bph_ce0 sc_out sc_logic 1 signal 22 } 
	{ delay_bph_we0 sc_out sc_logic 1 signal 22 } 
	{ delay_bph_d0 sc_out sc_lv 32 signal 22 } 
	{ delay_bph_q0 sc_in sc_lv 32 signal 22 } 
	{ delay_bph_address1 sc_out sc_lv 3 signal 22 } 
	{ delay_bph_ce1 sc_out sc_logic 1 signal 22 } 
	{ delay_bph_we1 sc_out sc_logic 1 signal 22 } 
	{ delay_bph_d1 sc_out sc_lv 32 signal 22 } 
	{ delay_bph_q1 sc_in sc_lv 32 signal 22 } 
	{ delay_dhx_address0 sc_out sc_lv 3 signal 23 } 
	{ delay_dhx_ce0 sc_out sc_logic 1 signal 23 } 
	{ delay_dhx_we0 sc_out sc_logic 1 signal 23 } 
	{ delay_dhx_d0 sc_out sc_lv 14 signal 23 } 
	{ delay_dhx_q0 sc_in sc_lv 14 signal 23 } 
	{ delay_dhx_address1 sc_out sc_lv 3 signal 23 } 
	{ delay_dhx_ce1 sc_out sc_logic 1 signal 23 } 
	{ delay_dhx_we1 sc_out sc_logic 1 signal 23 } 
	{ delay_dhx_d1 sc_out sc_lv 14 signal 23 } 
	{ delay_dhx_q1 sc_in sc_lv 14 signal 23 } 
	{ ap_return sc_out sc_lv 8 signal -1 } 
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
 	{ "name": "nbl_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbl", "role": "i" }} , 
 	{ "name": "nbl_o", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbl", "role": "o" }} , 
 	{ "name": "nbl_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nbl", "role": "o_ap_vld" }} , 
 	{ "name": "plt1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt1", "role": "i" }} , 
 	{ "name": "plt1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt1", "role": "o" }} , 
 	{ "name": "plt1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt1", "role": "o_ap_vld" }} , 
 	{ "name": "plt2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt2", "role": "i" }} , 
 	{ "name": "plt2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt2", "role": "o" }} , 
 	{ "name": "plt2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt2", "role": "o_ap_vld" }} , 
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
 	{ "name": "delay_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bpl", "role": "address0" }} , 
 	{ "name": "delay_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "ce0" }} , 
 	{ "name": "delay_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "we0" }} , 
 	{ "name": "delay_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "d0" }} , 
 	{ "name": "delay_bpl_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "q0" }} , 
 	{ "name": "delay_bpl_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bpl", "role": "address1" }} , 
 	{ "name": "delay_bpl_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "ce1" }} , 
 	{ "name": "delay_bpl_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "we1" }} , 
 	{ "name": "delay_bpl_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "d1" }} , 
 	{ "name": "delay_bpl_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "q1" }} , 
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
 	{ "name": "delay_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bph", "role": "address0" }} , 
 	{ "name": "delay_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "ce0" }} , 
 	{ "name": "delay_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "we0" }} , 
 	{ "name": "delay_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "d0" }} , 
 	{ "name": "delay_bph_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "q0" }} , 
 	{ "name": "delay_bph_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bph", "role": "address1" }} , 
 	{ "name": "delay_bph_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "ce1" }} , 
 	{ "name": "delay_bph_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "we1" }} , 
 	{ "name": "delay_bph_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "d1" }} , 
 	{ "name": "delay_bph_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "q1" }} , 
 	{ "name": "delay_dhx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dhx", "role": "address0" }} , 
 	{ "name": "delay_dhx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "ce0" }} , 
 	{ "name": "delay_dhx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "we0" }} , 
 	{ "name": "delay_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "delay_dhx", "role": "d0" }} , 
 	{ "name": "delay_dhx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "delay_dhx", "role": "q0" }} , 
 	{ "name": "delay_dhx_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dhx", "role": "address1" }} , 
 	{ "name": "delay_dhx_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "ce1" }} , 
 	{ "name": "delay_dhx_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "we1" }} , 
 	{ "name": "delay_dhx_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "delay_dhx", "role": "d1" }} , 
 	{ "name": "delay_dhx_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "delay_dhx", "role": "q1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "85",
		"VariableLatency" : "0", "ExactLatency" : "97", "EstimateLatencyMin" : "97", "EstimateLatencyMax" : "97",
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
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quant26bt_pos_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quant26bt_neg_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.qq4_code4_table_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.wl_code_table_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ilb_table_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_32s_46_5_1_U12", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_32s_46_5_1_U13", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_5_1_U14", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_46_5_1_U15", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_46_5_1_U16", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_47_5_1_U17", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_5_1_U18", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_5_1_U19", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_9ns_41_5_1_U20", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_9ns_41_5_1_U21", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_12ns_44_5_1_U22", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_13ns_45_5_1_U23", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_15ns_47_5_1_U24", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_11s_42_5_1_U25", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_11s_43_5_1_U26", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_13s_44_5_1_U27", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_13s_45_5_1_U28", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33s_7s_40_5_1_U29", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_11ns_25_2_1_U30", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_10ns_24_2_1_U31", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_11ns_25_2_1_U32", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_14_1_1_U33", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_11_1_1_U34", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_15ns_29_2_1_U35", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_12ns_26_2_1_U36", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U37", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U38", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U39", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U40", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U41", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14s_14s_28_2_1_U42", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_12ns_26_2_1_U43", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_12ns_26_2_1_U44", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_13ns_27_2_1_U45", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_13ns_27_2_1_U46", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_13ns_27_2_1_U47", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_13ns_27_2_1_U48", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_13ns_27_2_1_U49", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U50", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U51", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U52", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U53", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U54", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U55", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_14ns_28_2_1_U56", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U57", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U58", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U59", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U60", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U61", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U62", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_15ns_29_2_1_U63", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_16ns_30_2_1_U64", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_16ns_30_2_1_U65", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15ns_16ns_30_2_1_U66", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_15ns_31_2_1_U67", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U68", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U69", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U70", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U71", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U72", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_2_1_U73", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	encode {
		xin1 {Type I LastRead 5 FirstWrite -1}
		xin2 {Type I LastRead 10 FirstWrite -1}
		rlt1 {Type IO LastRead 12 FirstWrite 85}
		al1 {Type IO LastRead 12 FirstWrite 97}
		rlt2 {Type IO LastRead 11 FirstWrite 12}
		al2 {Type IO LastRead 11 FirstWrite 94}
		detl {Type IO LastRead 3 FirstWrite 87}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 81}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		nbl {Type IO LastRead 82 FirstWrite 84}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead 86 FirstWrite 86}
		plt2 {Type IO LastRead 86 FirstWrite 86}
		rh1 {Type IO LastRead 0 FirstWrite 25}
		ah1 {Type IO LastRead 0 FirstWrite 37}
		rh2 {Type IO LastRead 0 FirstWrite 0}
		ah2 {Type IO LastRead 0 FirstWrite 34}
		deth {Type IO LastRead 0 FirstWrite 26}
		nbh {Type IO LastRead 21 FirstWrite 23}
		ph1 {Type IO LastRead 26 FirstWrite 26}
		ph2 {Type IO LastRead 26 FirstWrite 26}
		tqmf {Type IO LastRead 12 FirstWrite 2}
		delay_bpl {Type IO LastRead 9 FirstWrite 86}
		delay_dltx {Type IO LastRead 3 FirstWrite 3}
		delay_bph {Type IO LastRead 3 FirstWrite 26}
		delay_dhx {Type IO LastRead 3 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "97", "Max" : "97"}
	, {"Name" : "Interval", "Min" : "85", "Max" : "85"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	xin1 { ap_none {  { xin1 in_data 0 32 } } }
	xin2 { ap_none {  { xin2 in_data 0 32 } } }
	rlt1 { ap_ovld {  { rlt1_i in_data 0 31 }  { rlt1_o out_data 1 31 }  { rlt1_o_ap_vld out_vld 1 1 } } }
	al1 { ap_ovld {  { al1_i in_data 0 16 }  { al1_o out_data 1 16 }  { al1_o_ap_vld out_vld 1 1 } } }
	rlt2 { ap_ovld {  { rlt2_i in_data 0 31 }  { rlt2_o out_data 1 31 }  { rlt2_o_ap_vld out_vld 1 1 } } }
	al2 { ap_ovld {  { al2_i in_data 0 15 }  { al2_o out_data 1 15 }  { al2_o_ap_vld out_vld 1 1 } } }
	detl { ap_ovld {  { detl_i in_data 0 15 }  { detl_o out_data 1 15 }  { detl_o_ap_vld out_vld 1 1 } } }
	il { ap_vld {  { il out_data 1 6 }  { il_ap_vld out_vld 1 1 } } }
	nbl { ap_ovld {  { nbl_i in_data 0 15 }  { nbl_o out_data 1 15 }  { nbl_o_ap_vld out_vld 1 1 } } }
	plt1 { ap_ovld {  { plt1_i in_data 0 32 }  { plt1_o out_data 1 32 }  { plt1_o_ap_vld out_vld 1 1 } } }
	plt2 { ap_ovld {  { plt2_i in_data 0 32 }  { plt2_o out_data 1 32 }  { plt2_o_ap_vld out_vld 1 1 } } }
	rh1 { ap_ovld {  { rh1_i in_data 0 31 }  { rh1_o out_data 1 31 }  { rh1_o_ap_vld out_vld 1 1 } } }
	ah1 { ap_ovld {  { ah1_i in_data 0 16 }  { ah1_o out_data 1 16 }  { ah1_o_ap_vld out_vld 1 1 } } }
	rh2 { ap_ovld {  { rh2_i in_data 0 31 }  { rh2_o out_data 1 31 }  { rh2_o_ap_vld out_vld 1 1 } } }
	ah2 { ap_ovld {  { ah2_i in_data 0 15 }  { ah2_o out_data 1 15 }  { ah2_o_ap_vld out_vld 1 1 } } }
	deth { ap_ovld {  { deth_i in_data 0 15 }  { deth_o out_data 1 15 }  { deth_o_ap_vld out_vld 1 1 } } }
	nbh { ap_ovld {  { nbh_i in_data 0 15 }  { nbh_o out_data 1 15 }  { nbh_o_ap_vld out_vld 1 1 } } }
	ph1 { ap_ovld {  { ph1_i in_data 0 32 }  { ph1_o out_data 1 32 }  { ph1_o_ap_vld out_vld 1 1 } } }
	ph2 { ap_ovld {  { ph2_i in_data 0 32 }  { ph2_o out_data 1 32 }  { ph2_o_ap_vld out_vld 1 1 } } }
	tqmf { ap_memory {  { tqmf_address0 mem_address 1 5 }  { tqmf_ce0 mem_ce 1 1 }  { tqmf_we0 mem_we 1 1 }  { tqmf_d0 mem_din 1 32 }  { tqmf_q0 mem_dout 0 32 }  { tqmf_address1 MemPortADDR2 1 5 }  { tqmf_ce1 MemPortCE2 1 1 }  { tqmf_we1 MemPortWE2 1 1 }  { tqmf_d1 MemPortDIN2 1 32 }  { tqmf_q1 MemPortDOUT2 0 32 } } }
	delay_bpl { ap_memory {  { delay_bpl_address0 mem_address 1 3 }  { delay_bpl_ce0 mem_ce 1 1 }  { delay_bpl_we0 mem_we 1 1 }  { delay_bpl_d0 mem_din 1 32 }  { delay_bpl_q0 mem_dout 0 32 }  { delay_bpl_address1 MemPortADDR2 1 3 }  { delay_bpl_ce1 MemPortCE2 1 1 }  { delay_bpl_we1 MemPortWE2 1 1 }  { delay_bpl_d1 MemPortDIN2 1 32 }  { delay_bpl_q1 MemPortDOUT2 0 32 } } }
	delay_dltx { ap_memory {  { delay_dltx_address0 mem_address 1 3 }  { delay_dltx_ce0 mem_ce 1 1 }  { delay_dltx_we0 mem_we 1 1 }  { delay_dltx_d0 mem_din 1 16 }  { delay_dltx_q0 mem_dout 0 16 }  { delay_dltx_address1 MemPortADDR2 1 3 }  { delay_dltx_ce1 MemPortCE2 1 1 }  { delay_dltx_we1 MemPortWE2 1 1 }  { delay_dltx_d1 MemPortDIN2 1 16 }  { delay_dltx_q1 MemPortDOUT2 0 16 } } }
	delay_bph { ap_memory {  { delay_bph_address0 mem_address 1 3 }  { delay_bph_ce0 mem_ce 1 1 }  { delay_bph_we0 mem_we 1 1 }  { delay_bph_d0 mem_din 1 32 }  { delay_bph_q0 mem_dout 0 32 }  { delay_bph_address1 MemPortADDR2 1 3 }  { delay_bph_ce1 MemPortCE2 1 1 }  { delay_bph_we1 MemPortWE2 1 1 }  { delay_bph_d1 MemPortDIN2 1 32 }  { delay_bph_q1 MemPortDOUT2 0 32 } } }
	delay_dhx { ap_memory {  { delay_dhx_address0 mem_address 1 3 }  { delay_dhx_ce0 mem_ce 1 1 }  { delay_dhx_we0 mem_we 1 1 }  { delay_dhx_d0 mem_din 1 14 }  { delay_dhx_q0 mem_dout 0 14 }  { delay_dhx_address1 MemPortADDR2 1 3 }  { delay_dhx_ce1 MemPortCE2 1 1 }  { delay_dhx_we1 MemPortWE2 1 1 }  { delay_dhx_d1 MemPortDIN2 1 14 }  { delay_dhx_q1 MemPortDOUT2 0 14 } } }
}
