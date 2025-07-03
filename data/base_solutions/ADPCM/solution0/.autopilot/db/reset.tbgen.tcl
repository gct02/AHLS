set moduleName reset
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
set C_modelName {reset}
set C_modelType { void 0 }
set C_modelArgList {
	{ dec_detl int 15 regular {pointer 1} {global 1}  }
	{ detl int 15 regular {pointer 1} {global 1}  }
	{ dec_deth int 15 regular {pointer 1} {global 1}  }
	{ deth int 15 regular {pointer 1} {global 1}  }
	{ rlt2 int 31 regular {pointer 1} {global 1}  }
	{ rlt1 int 31 regular {pointer 1} {global 1}  }
	{ plt2 int 32 regular {pointer 1} {global 1}  }
	{ plt1 int 32 regular {pointer 1} {global 1}  }
	{ al2 int 15 regular {pointer 1} {global 1}  }
	{ al1 int 16 regular {pointer 1} {global 1}  }
	{ nbl int 15 regular {pointer 1} {global 1}  }
	{ rh2 int 31 regular {pointer 1} {global 1}  }
	{ rh1 int 31 regular {pointer 1} {global 1}  }
	{ ph2 int 32 regular {pointer 1} {global 1}  }
	{ ph1 int 32 regular {pointer 1} {global 1}  }
	{ ah2 int 15 regular {pointer 1} {global 1}  }
	{ ah1 int 16 regular {pointer 1} {global 1}  }
	{ nbh int 15 regular {pointer 1} {global 1}  }
	{ dec_rlt2 int 31 regular {pointer 1} {global 1}  }
	{ dec_rlt1 int 31 regular {pointer 1} {global 1}  }
	{ dec_plt2 int 32 regular {pointer 1} {global 1}  }
	{ dec_plt1 int 32 regular {pointer 1} {global 1}  }
	{ dec_al2 int 15 regular {pointer 1} {global 1}  }
	{ dec_al1 int 16 regular {pointer 1} {global 1}  }
	{ dec_nbl int 15 regular {pointer 1} {global 1}  }
	{ dec_rh2 int 31 regular {pointer 1} {global 1}  }
	{ dec_rh1 int 31 regular {pointer 1} {global 1}  }
	{ dec_ph2 int 32 regular {pointer 1} {global 1}  }
	{ dec_ph1 int 32 regular {pointer 1} {global 1}  }
	{ dec_ah2 int 15 regular {pointer 1} {global 1}  }
	{ dec_ah1 int 16 regular {pointer 1} {global 1}  }
	{ dec_nbh int 15 regular {pointer 1} {global 1}  }
	{ delay_dltx int 16 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ delay_dhx int 16 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ dec_del_dltx int 16 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ dec_del_dhx int 16 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ delay_bpl int 32 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ delay_bph int 32 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ dec_del_bpl int 32 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ dec_del_bph int 32 regular {array 6 { 0 3 } 0 1 } {global 1}  }
	{ tqmf int 32 regular {array 24 { 0 3 } 0 1 } {global 1}  }
	{ accumc int 32 regular {array 11 { 0 3 } 0 1 } {global 1}  }
	{ accumd int 32 regular {array 11 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "dec_detl", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "detl", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_deth", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "deth", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "al2", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "al1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_plt2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_plt1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_al2", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_al1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_nbl", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_rh2", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_rh1", "interface" : "wire", "bitwidth" : 31, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_ph2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_ph1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_ah2", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_ah1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_nbh", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "delay_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "delay_dhx", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_del_dltx", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_del_dhx", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "delay_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "delay_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_del_bpl", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "dec_del_bph", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tqmf", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "accumc", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "accumd", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 114
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ dec_detl sc_out sc_lv 15 signal 0 } 
	{ dec_detl_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ detl sc_out sc_lv 15 signal 1 } 
	{ detl_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ dec_deth sc_out sc_lv 15 signal 2 } 
	{ dec_deth_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ deth sc_out sc_lv 15 signal 3 } 
	{ deth_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ rlt2 sc_out sc_lv 31 signal 4 } 
	{ rlt2_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ rlt1 sc_out sc_lv 31 signal 5 } 
	{ rlt1_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ plt2 sc_out sc_lv 32 signal 6 } 
	{ plt2_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ plt1 sc_out sc_lv 32 signal 7 } 
	{ plt1_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ al2 sc_out sc_lv 15 signal 8 } 
	{ al2_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ al1 sc_out sc_lv 16 signal 9 } 
	{ al1_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ nbl sc_out sc_lv 15 signal 10 } 
	{ nbl_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ rh2 sc_out sc_lv 31 signal 11 } 
	{ rh2_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ rh1 sc_out sc_lv 31 signal 12 } 
	{ rh1_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ ph2 sc_out sc_lv 32 signal 13 } 
	{ ph2_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ ph1 sc_out sc_lv 32 signal 14 } 
	{ ph1_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ ah2 sc_out sc_lv 15 signal 15 } 
	{ ah2_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ ah1 sc_out sc_lv 16 signal 16 } 
	{ ah1_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ nbh sc_out sc_lv 15 signal 17 } 
	{ nbh_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ dec_rlt2 sc_out sc_lv 31 signal 18 } 
	{ dec_rlt2_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ dec_rlt1 sc_out sc_lv 31 signal 19 } 
	{ dec_rlt1_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ dec_plt2 sc_out sc_lv 32 signal 20 } 
	{ dec_plt2_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ dec_plt1 sc_out sc_lv 32 signal 21 } 
	{ dec_plt1_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ dec_al2 sc_out sc_lv 15 signal 22 } 
	{ dec_al2_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ dec_al1 sc_out sc_lv 16 signal 23 } 
	{ dec_al1_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ dec_nbl sc_out sc_lv 15 signal 24 } 
	{ dec_nbl_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ dec_rh2 sc_out sc_lv 31 signal 25 } 
	{ dec_rh2_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ dec_rh1 sc_out sc_lv 31 signal 26 } 
	{ dec_rh1_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ dec_ph2 sc_out sc_lv 32 signal 27 } 
	{ dec_ph2_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ dec_ph1 sc_out sc_lv 32 signal 28 } 
	{ dec_ph1_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ dec_ah2 sc_out sc_lv 15 signal 29 } 
	{ dec_ah2_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ dec_ah1 sc_out sc_lv 16 signal 30 } 
	{ dec_ah1_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ dec_nbh sc_out sc_lv 15 signal 31 } 
	{ dec_nbh_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ delay_dltx_address0 sc_out sc_lv 3 signal 32 } 
	{ delay_dltx_ce0 sc_out sc_logic 1 signal 32 } 
	{ delay_dltx_we0 sc_out sc_logic 1 signal 32 } 
	{ delay_dltx_d0 sc_out sc_lv 16 signal 32 } 
	{ delay_dhx_address0 sc_out sc_lv 3 signal 33 } 
	{ delay_dhx_ce0 sc_out sc_logic 1 signal 33 } 
	{ delay_dhx_we0 sc_out sc_logic 1 signal 33 } 
	{ delay_dhx_d0 sc_out sc_lv 16 signal 33 } 
	{ dec_del_dltx_address0 sc_out sc_lv 3 signal 34 } 
	{ dec_del_dltx_ce0 sc_out sc_logic 1 signal 34 } 
	{ dec_del_dltx_we0 sc_out sc_logic 1 signal 34 } 
	{ dec_del_dltx_d0 sc_out sc_lv 16 signal 34 } 
	{ dec_del_dhx_address0 sc_out sc_lv 3 signal 35 } 
	{ dec_del_dhx_ce0 sc_out sc_logic 1 signal 35 } 
	{ dec_del_dhx_we0 sc_out sc_logic 1 signal 35 } 
	{ dec_del_dhx_d0 sc_out sc_lv 16 signal 35 } 
	{ delay_bpl_address0 sc_out sc_lv 3 signal 36 } 
	{ delay_bpl_ce0 sc_out sc_logic 1 signal 36 } 
	{ delay_bpl_we0 sc_out sc_logic 1 signal 36 } 
	{ delay_bpl_d0 sc_out sc_lv 32 signal 36 } 
	{ delay_bph_address0 sc_out sc_lv 3 signal 37 } 
	{ delay_bph_ce0 sc_out sc_logic 1 signal 37 } 
	{ delay_bph_we0 sc_out sc_logic 1 signal 37 } 
	{ delay_bph_d0 sc_out sc_lv 32 signal 37 } 
	{ dec_del_bpl_address0 sc_out sc_lv 3 signal 38 } 
	{ dec_del_bpl_ce0 sc_out sc_logic 1 signal 38 } 
	{ dec_del_bpl_we0 sc_out sc_logic 1 signal 38 } 
	{ dec_del_bpl_d0 sc_out sc_lv 32 signal 38 } 
	{ dec_del_bph_address0 sc_out sc_lv 3 signal 39 } 
	{ dec_del_bph_ce0 sc_out sc_logic 1 signal 39 } 
	{ dec_del_bph_we0 sc_out sc_logic 1 signal 39 } 
	{ dec_del_bph_d0 sc_out sc_lv 32 signal 39 } 
	{ tqmf_address0 sc_out sc_lv 5 signal 40 } 
	{ tqmf_ce0 sc_out sc_logic 1 signal 40 } 
	{ tqmf_we0 sc_out sc_logic 1 signal 40 } 
	{ tqmf_d0 sc_out sc_lv 32 signal 40 } 
	{ accumc_address0 sc_out sc_lv 4 signal 41 } 
	{ accumc_ce0 sc_out sc_logic 1 signal 41 } 
	{ accumc_we0 sc_out sc_logic 1 signal 41 } 
	{ accumc_d0 sc_out sc_lv 32 signal 41 } 
	{ accumd_address0 sc_out sc_lv 4 signal 42 } 
	{ accumd_ce0 sc_out sc_logic 1 signal 42 } 
	{ accumd_we0 sc_out sc_logic 1 signal 42 } 
	{ accumd_d0 sc_out sc_lv 32 signal 42 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "dec_detl", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_detl", "role": "default" }} , 
 	{ "name": "dec_detl_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_detl", "role": "ap_vld" }} , 
 	{ "name": "detl", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "detl", "role": "default" }} , 
 	{ "name": "detl_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "detl", "role": "ap_vld" }} , 
 	{ "name": "dec_deth", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_deth", "role": "default" }} , 
 	{ "name": "dec_deth_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_deth", "role": "ap_vld" }} , 
 	{ "name": "deth", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "deth", "role": "default" }} , 
 	{ "name": "deth_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "deth", "role": "ap_vld" }} , 
 	{ "name": "rlt2", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt2", "role": "default" }} , 
 	{ "name": "rlt2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rlt2", "role": "ap_vld" }} , 
 	{ "name": "rlt1", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt1", "role": "default" }} , 
 	{ "name": "rlt1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rlt1", "role": "ap_vld" }} , 
 	{ "name": "plt2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt2", "role": "default" }} , 
 	{ "name": "plt2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt2", "role": "ap_vld" }} , 
 	{ "name": "plt1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "plt1", "role": "default" }} , 
 	{ "name": "plt1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "plt1", "role": "ap_vld" }} , 
 	{ "name": "al2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "al2", "role": "default" }} , 
 	{ "name": "al2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "al2", "role": "ap_vld" }} , 
 	{ "name": "al1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "al1", "role": "default" }} , 
 	{ "name": "al1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "al1", "role": "ap_vld" }} , 
 	{ "name": "nbl", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbl", "role": "default" }} , 
 	{ "name": "nbl_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nbl", "role": "ap_vld" }} , 
 	{ "name": "rh2", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh2", "role": "default" }} , 
 	{ "name": "rh2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rh2", "role": "ap_vld" }} , 
 	{ "name": "rh1", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rh1", "role": "default" }} , 
 	{ "name": "rh1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rh1", "role": "ap_vld" }} , 
 	{ "name": "ph2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph2", "role": "default" }} , 
 	{ "name": "ph2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph2", "role": "ap_vld" }} , 
 	{ "name": "ph1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ph1", "role": "default" }} , 
 	{ "name": "ph1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph1", "role": "ap_vld" }} , 
 	{ "name": "ah2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "ah2", "role": "default" }} , 
 	{ "name": "ah2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ah2", "role": "ap_vld" }} , 
 	{ "name": "ah1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ah1", "role": "default" }} , 
 	{ "name": "ah1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ah1", "role": "ap_vld" }} , 
 	{ "name": "nbh", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "nbh", "role": "default" }} , 
 	{ "name": "nbh_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nbh", "role": "ap_vld" }} , 
 	{ "name": "dec_rlt2", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt2", "role": "default" }} , 
 	{ "name": "dec_rlt2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rlt2", "role": "ap_vld" }} , 
 	{ "name": "dec_rlt1", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rlt1", "role": "default" }} , 
 	{ "name": "dec_rlt1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rlt1", "role": "ap_vld" }} , 
 	{ "name": "dec_plt2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt2", "role": "default" }} , 
 	{ "name": "dec_plt2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_plt2", "role": "ap_vld" }} , 
 	{ "name": "dec_plt1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_plt1", "role": "default" }} , 
 	{ "name": "dec_plt1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_plt1", "role": "ap_vld" }} , 
 	{ "name": "dec_al2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_al2", "role": "default" }} , 
 	{ "name": "dec_al2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_al2", "role": "ap_vld" }} , 
 	{ "name": "dec_al1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_al1", "role": "default" }} , 
 	{ "name": "dec_al1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_al1", "role": "ap_vld" }} , 
 	{ "name": "dec_nbl", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbl", "role": "default" }} , 
 	{ "name": "dec_nbl_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_nbl", "role": "ap_vld" }} , 
 	{ "name": "dec_rh2", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh2", "role": "default" }} , 
 	{ "name": "dec_rh2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rh2", "role": "ap_vld" }} , 
 	{ "name": "dec_rh1", "direction": "out", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "dec_rh1", "role": "default" }} , 
 	{ "name": "dec_rh1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_rh1", "role": "ap_vld" }} , 
 	{ "name": "dec_ph2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph2", "role": "default" }} , 
 	{ "name": "dec_ph2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ph2", "role": "ap_vld" }} , 
 	{ "name": "dec_ph1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_ph1", "role": "default" }} , 
 	{ "name": "dec_ph1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ph1", "role": "ap_vld" }} , 
 	{ "name": "dec_ah2", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_ah2", "role": "default" }} , 
 	{ "name": "dec_ah2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ah2", "role": "ap_vld" }} , 
 	{ "name": "dec_ah1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_ah1", "role": "default" }} , 
 	{ "name": "dec_ah1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_ah1", "role": "ap_vld" }} , 
 	{ "name": "dec_nbh", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "dec_nbh", "role": "default" }} , 
 	{ "name": "dec_nbh_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dec_nbh", "role": "ap_vld" }} , 
 	{ "name": "delay_dltx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dltx", "role": "address0" }} , 
 	{ "name": "delay_dltx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "ce0" }} , 
 	{ "name": "delay_dltx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dltx", "role": "we0" }} , 
 	{ "name": "delay_dltx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dltx", "role": "d0" }} , 
 	{ "name": "delay_dhx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_dhx", "role": "address0" }} , 
 	{ "name": "delay_dhx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "ce0" }} , 
 	{ "name": "delay_dhx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_dhx", "role": "we0" }} , 
 	{ "name": "delay_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "delay_dhx", "role": "d0" }} , 
 	{ "name": "dec_del_dltx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "address0" }} , 
 	{ "name": "dec_del_dltx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "ce0" }} , 
 	{ "name": "dec_del_dltx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "we0" }} , 
 	{ "name": "dec_del_dltx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dltx", "role": "d0" }} , 
 	{ "name": "dec_del_dhx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "address0" }} , 
 	{ "name": "dec_del_dhx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "ce0" }} , 
 	{ "name": "dec_del_dhx_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "we0" }} , 
 	{ "name": "dec_del_dhx_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dec_del_dhx", "role": "d0" }} , 
 	{ "name": "delay_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bpl", "role": "address0" }} , 
 	{ "name": "delay_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "ce0" }} , 
 	{ "name": "delay_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bpl", "role": "we0" }} , 
 	{ "name": "delay_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bpl", "role": "d0" }} , 
 	{ "name": "delay_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "delay_bph", "role": "address0" }} , 
 	{ "name": "delay_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "ce0" }} , 
 	{ "name": "delay_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delay_bph", "role": "we0" }} , 
 	{ "name": "delay_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_bph", "role": "d0" }} , 
 	{ "name": "dec_del_bpl_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "address0" }} , 
 	{ "name": "dec_del_bpl_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "ce0" }} , 
 	{ "name": "dec_del_bpl_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "we0" }} , 
 	{ "name": "dec_del_bpl_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bpl", "role": "d0" }} , 
 	{ "name": "dec_del_bph_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "address0" }} , 
 	{ "name": "dec_del_bph_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "ce0" }} , 
 	{ "name": "dec_del_bph_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "we0" }} , 
 	{ "name": "dec_del_bph_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dec_del_bph", "role": "d0" }} , 
 	{ "name": "tqmf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tqmf", "role": "address0" }} , 
 	{ "name": "tqmf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "ce0" }} , 
 	{ "name": "tqmf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tqmf", "role": "we0" }} , 
 	{ "name": "tqmf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tqmf", "role": "d0" }} , 
 	{ "name": "accumc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumc", "role": "address0" }} , 
 	{ "name": "accumc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "ce0" }} , 
 	{ "name": "accumc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumc", "role": "we0" }} , 
 	{ "name": "accumc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumc", "role": "d0" }} , 
 	{ "name": "accumd_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "accumd", "role": "address0" }} , 
 	{ "name": "accumd_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "ce0" }} , 
 	{ "name": "accumd_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accumd", "role": "we0" }} , 
 	{ "name": "accumd_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accumd", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "reset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "51",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dec_detl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "detl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_deth", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "deth", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rlt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rlt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "plt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "plt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "al2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "al1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "nbl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rh2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rh1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ph2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ph1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ah2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ah1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "nbh", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rlt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rlt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_plt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_plt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_al2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_al1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_nbl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rh2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rh1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ph2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ph1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ah2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ah1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_nbh", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "reset_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "reset_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}},
			{"Name" : "reset_label7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state5_blk"}}]}]}


set ArgLastReadFirstWriteLatency {
	reset {
		dec_detl {Type O LastRead -1 FirstWrite 0}
		detl {Type O LastRead -1 FirstWrite 0}
		dec_deth {Type O LastRead -1 FirstWrite 0}
		deth {Type O LastRead -1 FirstWrite 0}
		rlt2 {Type O LastRead -1 FirstWrite 0}
		rlt1 {Type O LastRead -1 FirstWrite 0}
		plt2 {Type O LastRead -1 FirstWrite 0}
		plt1 {Type O LastRead -1 FirstWrite 0}
		al2 {Type O LastRead -1 FirstWrite 0}
		al1 {Type O LastRead -1 FirstWrite 0}
		nbl {Type O LastRead -1 FirstWrite 0}
		rh2 {Type O LastRead -1 FirstWrite 0}
		rh1 {Type O LastRead -1 FirstWrite 0}
		ph2 {Type O LastRead -1 FirstWrite 0}
		ph1 {Type O LastRead -1 FirstWrite 0}
		ah2 {Type O LastRead -1 FirstWrite 0}
		ah1 {Type O LastRead -1 FirstWrite 0}
		nbh {Type O LastRead -1 FirstWrite 0}
		dec_rlt2 {Type O LastRead -1 FirstWrite 0}
		dec_rlt1 {Type O LastRead -1 FirstWrite 0}
		dec_plt2 {Type O LastRead -1 FirstWrite 0}
		dec_plt1 {Type O LastRead -1 FirstWrite 0}
		dec_al2 {Type O LastRead -1 FirstWrite 0}
		dec_al1 {Type O LastRead -1 FirstWrite 0}
		dec_nbl {Type O LastRead -1 FirstWrite 0}
		dec_rh2 {Type O LastRead -1 FirstWrite 0}
		dec_rh1 {Type O LastRead -1 FirstWrite 0}
		dec_ph2 {Type O LastRead -1 FirstWrite 0}
		dec_ph1 {Type O LastRead -1 FirstWrite 0}
		dec_ah2 {Type O LastRead -1 FirstWrite 0}
		dec_ah1 {Type O LastRead -1 FirstWrite 0}
		dec_nbh {Type O LastRead -1 FirstWrite 0}
		delay_dltx {Type O LastRead -1 FirstWrite 1}
		delay_dhx {Type O LastRead -1 FirstWrite 1}
		dec_del_dltx {Type O LastRead -1 FirstWrite 1}
		dec_del_dhx {Type O LastRead -1 FirstWrite 1}
		delay_bpl {Type O LastRead -1 FirstWrite 2}
		delay_bph {Type O LastRead -1 FirstWrite 2}
		dec_del_bpl {Type O LastRead -1 FirstWrite 2}
		dec_del_bph {Type O LastRead -1 FirstWrite 2}
		tqmf {Type O LastRead -1 FirstWrite 3}
		accumc {Type O LastRead -1 FirstWrite 4}
		accumd {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "51", "Max" : "51"}
	, {"Name" : "Interval", "Min" : "51", "Max" : "51"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	dec_detl { ap_vld {  { dec_detl out_data 1 15 }  { dec_detl_ap_vld out_vld 1 1 } } }
	detl { ap_vld {  { detl out_data 1 15 }  { detl_ap_vld out_vld 1 1 } } }
	dec_deth { ap_vld {  { dec_deth out_data 1 15 }  { dec_deth_ap_vld out_vld 1 1 } } }
	deth { ap_vld {  { deth out_data 1 15 }  { deth_ap_vld out_vld 1 1 } } }
	rlt2 { ap_vld {  { rlt2 out_data 1 31 }  { rlt2_ap_vld out_vld 1 1 } } }
	rlt1 { ap_vld {  { rlt1 out_data 1 31 }  { rlt1_ap_vld out_vld 1 1 } } }
	plt2 { ap_vld {  { plt2 out_data 1 32 }  { plt2_ap_vld out_vld 1 1 } } }
	plt1 { ap_vld {  { plt1 out_data 1 32 }  { plt1_ap_vld out_vld 1 1 } } }
	al2 { ap_vld {  { al2 out_data 1 15 }  { al2_ap_vld out_vld 1 1 } } }
	al1 { ap_vld {  { al1 out_data 1 16 }  { al1_ap_vld out_vld 1 1 } } }
	nbl { ap_vld {  { nbl out_data 1 15 }  { nbl_ap_vld out_vld 1 1 } } }
	rh2 { ap_vld {  { rh2 out_data 1 31 }  { rh2_ap_vld out_vld 1 1 } } }
	rh1 { ap_vld {  { rh1 out_data 1 31 }  { rh1_ap_vld out_vld 1 1 } } }
	ph2 { ap_vld {  { ph2 out_data 1 32 }  { ph2_ap_vld out_vld 1 1 } } }
	ph1 { ap_vld {  { ph1 out_data 1 32 }  { ph1_ap_vld out_vld 1 1 } } }
	ah2 { ap_vld {  { ah2 out_data 1 15 }  { ah2_ap_vld out_vld 1 1 } } }
	ah1 { ap_vld {  { ah1 out_data 1 16 }  { ah1_ap_vld out_vld 1 1 } } }
	nbh { ap_vld {  { nbh out_data 1 15 }  { nbh_ap_vld out_vld 1 1 } } }
	dec_rlt2 { ap_vld {  { dec_rlt2 out_data 1 31 }  { dec_rlt2_ap_vld out_vld 1 1 } } }
	dec_rlt1 { ap_vld {  { dec_rlt1 out_data 1 31 }  { dec_rlt1_ap_vld out_vld 1 1 } } }
	dec_plt2 { ap_vld {  { dec_plt2 out_data 1 32 }  { dec_plt2_ap_vld out_vld 1 1 } } }
	dec_plt1 { ap_vld {  { dec_plt1 out_data 1 32 }  { dec_plt1_ap_vld out_vld 1 1 } } }
	dec_al2 { ap_vld {  { dec_al2 out_data 1 15 }  { dec_al2_ap_vld out_vld 1 1 } } }
	dec_al1 { ap_vld {  { dec_al1 out_data 1 16 }  { dec_al1_ap_vld out_vld 1 1 } } }
	dec_nbl { ap_vld {  { dec_nbl out_data 1 15 }  { dec_nbl_ap_vld out_vld 1 1 } } }
	dec_rh2 { ap_vld {  { dec_rh2 out_data 1 31 }  { dec_rh2_ap_vld out_vld 1 1 } } }
	dec_rh1 { ap_vld {  { dec_rh1 out_data 1 31 }  { dec_rh1_ap_vld out_vld 1 1 } } }
	dec_ph2 { ap_vld {  { dec_ph2 out_data 1 32 }  { dec_ph2_ap_vld out_vld 1 1 } } }
	dec_ph1 { ap_vld {  { dec_ph1 out_data 1 32 }  { dec_ph1_ap_vld out_vld 1 1 } } }
	dec_ah2 { ap_vld {  { dec_ah2 out_data 1 15 }  { dec_ah2_ap_vld out_vld 1 1 } } }
	dec_ah1 { ap_vld {  { dec_ah1 out_data 1 16 }  { dec_ah1_ap_vld out_vld 1 1 } } }
	dec_nbh { ap_vld {  { dec_nbh out_data 1 15 }  { dec_nbh_ap_vld out_vld 1 1 } } }
	delay_dltx { ap_memory {  { delay_dltx_address0 mem_address 1 3 }  { delay_dltx_ce0 mem_ce 1 1 }  { delay_dltx_we0 mem_we 1 1 }  { delay_dltx_d0 mem_din 1 16 } } }
	delay_dhx { ap_memory {  { delay_dhx_address0 mem_address 1 3 }  { delay_dhx_ce0 mem_ce 1 1 }  { delay_dhx_we0 mem_we 1 1 }  { delay_dhx_d0 mem_din 1 16 } } }
	dec_del_dltx { ap_memory {  { dec_del_dltx_address0 mem_address 1 3 }  { dec_del_dltx_ce0 mem_ce 1 1 }  { dec_del_dltx_we0 mem_we 1 1 }  { dec_del_dltx_d0 mem_din 1 16 } } }
	dec_del_dhx { ap_memory {  { dec_del_dhx_address0 mem_address 1 3 }  { dec_del_dhx_ce0 mem_ce 1 1 }  { dec_del_dhx_we0 mem_we 1 1 }  { dec_del_dhx_d0 mem_din 1 16 } } }
	delay_bpl { ap_memory {  { delay_bpl_address0 mem_address 1 3 }  { delay_bpl_ce0 mem_ce 1 1 }  { delay_bpl_we0 mem_we 1 1 }  { delay_bpl_d0 mem_din 1 32 } } }
	delay_bph { ap_memory {  { delay_bph_address0 mem_address 1 3 }  { delay_bph_ce0 mem_ce 1 1 }  { delay_bph_we0 mem_we 1 1 }  { delay_bph_d0 mem_din 1 32 } } }
	dec_del_bpl { ap_memory {  { dec_del_bpl_address0 mem_address 1 3 }  { dec_del_bpl_ce0 mem_ce 1 1 }  { dec_del_bpl_we0 mem_we 1 1 }  { dec_del_bpl_d0 mem_din 1 32 } } }
	dec_del_bph { ap_memory {  { dec_del_bph_address0 mem_address 1 3 }  { dec_del_bph_ce0 mem_ce 1 1 }  { dec_del_bph_we0 mem_we 1 1 }  { dec_del_bph_d0 mem_din 1 32 } } }
	tqmf { ap_memory {  { tqmf_address0 mem_address 1 5 }  { tqmf_ce0 mem_ce 1 1 }  { tqmf_we0 mem_we 1 1 }  { tqmf_d0 mem_din 1 32 } } }
	accumc { ap_memory {  { accumc_address0 mem_address 1 4 }  { accumc_ce0 mem_ce 1 1 }  { accumc_we0 mem_we 1 1 }  { accumc_d0 mem_din 1 32 } } }
	accumd { ap_memory {  { accumd_address0 mem_address 1 4 }  { accumd_ce0 mem_ce 1 1 }  { accumd_we0 mem_we 1 1 }  { accumd_d0 mem_din 1 32 } } }
}
