set moduleName matrixmult
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
set C_modelName {matrixmult}
set C_modelType { void 0 }
set C_modelArgList {
	{ A_0 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_1 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_2 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_3 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_4 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_5 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_6 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ A_7 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_0 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_1 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_2 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_3 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_4 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_5 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_6 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_7 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ C_0 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_1 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_2 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_3 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_4 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_5 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_6 float 32 regular {array 32 { 0 3 } 0 1 }  }
	{ C_7 float 32 regular {array 32 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "C_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "C_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_0_address0 sc_out sc_lv 13 signal 0 } 
	{ A_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_0_q0 sc_in sc_lv 32 signal 0 } 
	{ A_1_address0 sc_out sc_lv 13 signal 1 } 
	{ A_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ A_1_q0 sc_in sc_lv 32 signal 1 } 
	{ A_2_address0 sc_out sc_lv 13 signal 2 } 
	{ A_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_2_q0 sc_in sc_lv 32 signal 2 } 
	{ A_3_address0 sc_out sc_lv 13 signal 3 } 
	{ A_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ A_3_q0 sc_in sc_lv 32 signal 3 } 
	{ A_4_address0 sc_out sc_lv 13 signal 4 } 
	{ A_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ A_4_q0 sc_in sc_lv 32 signal 4 } 
	{ A_5_address0 sc_out sc_lv 13 signal 5 } 
	{ A_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ A_5_q0 sc_in sc_lv 32 signal 5 } 
	{ A_6_address0 sc_out sc_lv 13 signal 6 } 
	{ A_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ A_6_q0 sc_in sc_lv 32 signal 6 } 
	{ A_7_address0 sc_out sc_lv 13 signal 7 } 
	{ A_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ A_7_q0 sc_in sc_lv 32 signal 7 } 
	{ B_0_address0 sc_out sc_lv 13 signal 8 } 
	{ B_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ B_0_q0 sc_in sc_lv 32 signal 8 } 
	{ B_1_address0 sc_out sc_lv 13 signal 9 } 
	{ B_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ B_1_q0 sc_in sc_lv 32 signal 9 } 
	{ B_2_address0 sc_out sc_lv 13 signal 10 } 
	{ B_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ B_2_q0 sc_in sc_lv 32 signal 10 } 
	{ B_3_address0 sc_out sc_lv 13 signal 11 } 
	{ B_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ B_3_q0 sc_in sc_lv 32 signal 11 } 
	{ B_4_address0 sc_out sc_lv 13 signal 12 } 
	{ B_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ B_4_q0 sc_in sc_lv 32 signal 12 } 
	{ B_5_address0 sc_out sc_lv 13 signal 13 } 
	{ B_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ B_5_q0 sc_in sc_lv 32 signal 13 } 
	{ B_6_address0 sc_out sc_lv 13 signal 14 } 
	{ B_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ B_6_q0 sc_in sc_lv 32 signal 14 } 
	{ B_7_address0 sc_out sc_lv 13 signal 15 } 
	{ B_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ B_7_q0 sc_in sc_lv 32 signal 15 } 
	{ C_0_address0 sc_out sc_lv 5 signal 16 } 
	{ C_0_ce0 sc_out sc_logic 1 signal 16 } 
	{ C_0_we0 sc_out sc_logic 1 signal 16 } 
	{ C_0_d0 sc_out sc_lv 32 signal 16 } 
	{ C_1_address0 sc_out sc_lv 5 signal 17 } 
	{ C_1_ce0 sc_out sc_logic 1 signal 17 } 
	{ C_1_we0 sc_out sc_logic 1 signal 17 } 
	{ C_1_d0 sc_out sc_lv 32 signal 17 } 
	{ C_2_address0 sc_out sc_lv 5 signal 18 } 
	{ C_2_ce0 sc_out sc_logic 1 signal 18 } 
	{ C_2_we0 sc_out sc_logic 1 signal 18 } 
	{ C_2_d0 sc_out sc_lv 32 signal 18 } 
	{ C_3_address0 sc_out sc_lv 5 signal 19 } 
	{ C_3_ce0 sc_out sc_logic 1 signal 19 } 
	{ C_3_we0 sc_out sc_logic 1 signal 19 } 
	{ C_3_d0 sc_out sc_lv 32 signal 19 } 
	{ C_4_address0 sc_out sc_lv 5 signal 20 } 
	{ C_4_ce0 sc_out sc_logic 1 signal 20 } 
	{ C_4_we0 sc_out sc_logic 1 signal 20 } 
	{ C_4_d0 sc_out sc_lv 32 signal 20 } 
	{ C_5_address0 sc_out sc_lv 5 signal 21 } 
	{ C_5_ce0 sc_out sc_logic 1 signal 21 } 
	{ C_5_we0 sc_out sc_logic 1 signal 21 } 
	{ C_5_d0 sc_out sc_lv 32 signal 21 } 
	{ C_6_address0 sc_out sc_lv 5 signal 22 } 
	{ C_6_ce0 sc_out sc_logic 1 signal 22 } 
	{ C_6_we0 sc_out sc_logic 1 signal 22 } 
	{ C_6_d0 sc_out sc_lv 32 signal 22 } 
	{ C_7_address0 sc_out sc_lv 5 signal 23 } 
	{ C_7_ce0 sc_out sc_logic 1 signal 23 } 
	{ C_7_we0 sc_out sc_logic 1 signal 23 } 
	{ C_7_d0 sc_out sc_lv 32 signal 23 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_0", "role": "address0" }} , 
 	{ "name": "A_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_0", "role": "ce0" }} , 
 	{ "name": "A_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_0", "role": "q0" }} , 
 	{ "name": "A_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_1", "role": "address0" }} , 
 	{ "name": "A_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_1", "role": "ce0" }} , 
 	{ "name": "A_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_1", "role": "q0" }} , 
 	{ "name": "A_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_2", "role": "address0" }} , 
 	{ "name": "A_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_2", "role": "ce0" }} , 
 	{ "name": "A_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_2", "role": "q0" }} , 
 	{ "name": "A_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_3", "role": "address0" }} , 
 	{ "name": "A_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_3", "role": "ce0" }} , 
 	{ "name": "A_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_3", "role": "q0" }} , 
 	{ "name": "A_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_4", "role": "address0" }} , 
 	{ "name": "A_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_4", "role": "ce0" }} , 
 	{ "name": "A_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_4", "role": "q0" }} , 
 	{ "name": "A_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_5", "role": "address0" }} , 
 	{ "name": "A_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_5", "role": "ce0" }} , 
 	{ "name": "A_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_5", "role": "q0" }} , 
 	{ "name": "A_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_6", "role": "address0" }} , 
 	{ "name": "A_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_6", "role": "ce0" }} , 
 	{ "name": "A_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_6", "role": "q0" }} , 
 	{ "name": "A_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_7", "role": "address0" }} , 
 	{ "name": "A_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_7", "role": "ce0" }} , 
 	{ "name": "A_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_7", "role": "q0" }} , 
 	{ "name": "B_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_0", "role": "address0" }} , 
 	{ "name": "B_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_0", "role": "ce0" }} , 
 	{ "name": "B_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_0", "role": "q0" }} , 
 	{ "name": "B_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_1", "role": "address0" }} , 
 	{ "name": "B_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_1", "role": "ce0" }} , 
 	{ "name": "B_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_1", "role": "q0" }} , 
 	{ "name": "B_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_2", "role": "address0" }} , 
 	{ "name": "B_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_2", "role": "ce0" }} , 
 	{ "name": "B_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_2", "role": "q0" }} , 
 	{ "name": "B_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_3", "role": "address0" }} , 
 	{ "name": "B_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_3", "role": "ce0" }} , 
 	{ "name": "B_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_3", "role": "q0" }} , 
 	{ "name": "B_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_4", "role": "address0" }} , 
 	{ "name": "B_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_4", "role": "ce0" }} , 
 	{ "name": "B_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_4", "role": "q0" }} , 
 	{ "name": "B_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_5", "role": "address0" }} , 
 	{ "name": "B_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_5", "role": "ce0" }} , 
 	{ "name": "B_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_5", "role": "q0" }} , 
 	{ "name": "B_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_6", "role": "address0" }} , 
 	{ "name": "B_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_6", "role": "ce0" }} , 
 	{ "name": "B_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_6", "role": "q0" }} , 
 	{ "name": "B_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_7", "role": "address0" }} , 
 	{ "name": "B_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_7", "role": "ce0" }} , 
 	{ "name": "B_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_7", "role": "q0" }} , 
 	{ "name": "C_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_0", "role": "address0" }} , 
 	{ "name": "C_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_0", "role": "ce0" }} , 
 	{ "name": "C_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_0", "role": "we0" }} , 
 	{ "name": "C_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_0", "role": "d0" }} , 
 	{ "name": "C_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_1", "role": "address0" }} , 
 	{ "name": "C_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_1", "role": "ce0" }} , 
 	{ "name": "C_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_1", "role": "we0" }} , 
 	{ "name": "C_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_1", "role": "d0" }} , 
 	{ "name": "C_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_2", "role": "address0" }} , 
 	{ "name": "C_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_2", "role": "ce0" }} , 
 	{ "name": "C_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_2", "role": "we0" }} , 
 	{ "name": "C_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_2", "role": "d0" }} , 
 	{ "name": "C_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_3", "role": "address0" }} , 
 	{ "name": "C_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_3", "role": "ce0" }} , 
 	{ "name": "C_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_3", "role": "we0" }} , 
 	{ "name": "C_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_3", "role": "d0" }} , 
 	{ "name": "C_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_4", "role": "address0" }} , 
 	{ "name": "C_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_4", "role": "ce0" }} , 
 	{ "name": "C_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_4", "role": "we0" }} , 
 	{ "name": "C_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_4", "role": "d0" }} , 
 	{ "name": "C_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_5", "role": "address0" }} , 
 	{ "name": "C_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_5", "role": "ce0" }} , 
 	{ "name": "C_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_5", "role": "we0" }} , 
 	{ "name": "C_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_5", "role": "d0" }} , 
 	{ "name": "C_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_6", "role": "address0" }} , 
 	{ "name": "C_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_6", "role": "ce0" }} , 
 	{ "name": "C_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_6", "role": "we0" }} , 
 	{ "name": "C_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_6", "role": "d0" }} , 
 	{ "name": "C_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "C_7", "role": "address0" }} , 
 	{ "name": "C_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_7", "role": "ce0" }} , 
 	{ "name": "C_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_7", "role": "we0" }} , 
 	{ "name": "C_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_7", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35", "37", "39", "41", "43", "45", "47", "49", "51", "53", "55", "57", "59", "61", "63", "65", "67", "69", "71", "73", "75", "77", "79", "81", "83", "85", "87", "89", "91", "93", "95", "97", "99", "101", "103", "105", "107", "109", "111", "113", "115", "117", "119", "121", "123", "125", "127", "129", "130", "131"],
		"CDFG" : "matrixmult",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11536152", "EstimateLatencyMax" : "11536152",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "49", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_244_25_fu_1308", "Port" : "A_0", "Inst_start_state" : "53", "Inst_end_state" : "54"},
					{"ID" : "33", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_176_17_fu_1228", "Port" : "A_0", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "17", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_108_9_fu_1148", "Port" : "A_0", "Inst_start_state" : "19", "Inst_end_state" : "20"},
					{"ID" : "97", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_448_49_fu_1548", "Port" : "A_0", "Inst_start_state" : "104", "Inst_end_state" : "105"},
					{"ID" : "1", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_40_1_fu_1068", "Port" : "A_0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "113", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_516_57_fu_1628", "Port" : "A_0", "Inst_start_state" : "121", "Inst_end_state" : "122"},
					{"ID" : "81", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_380_41_fu_1468", "Port" : "A_0", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "65", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_312_33_fu_1388", "Port" : "A_0", "Inst_start_state" : "70", "Inst_end_state" : "71"}]},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_320_34_fu_1398", "Port" : "A_1", "Inst_start_state" : "72", "Inst_end_state" : "73"},
					{"ID" : "19", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_116_10_fu_1158", "Port" : "A_1", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "35", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_184_18_fu_1238", "Port" : "A_1", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "83", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_388_42_fu_1478", "Port" : "A_1", "Inst_start_state" : "89", "Inst_end_state" : "90"},
					{"ID" : "3", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_48_2_fu_1078", "Port" : "A_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "99", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_456_50_fu_1558", "Port" : "A_1", "Inst_start_state" : "106", "Inst_end_state" : "107"},
					{"ID" : "115", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_524_58_fu_1638", "Port" : "A_1", "Inst_start_state" : "123", "Inst_end_state" : "124"},
					{"ID" : "51", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_252_26_fu_1318", "Port" : "A_1", "Inst_start_state" : "55", "Inst_end_state" : "56"}]},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_124_11_fu_1168", "Port" : "A_2", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "69", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_328_35_fu_1408", "Port" : "A_2", "Inst_start_state" : "74", "Inst_end_state" : "75"},
					{"ID" : "85", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_396_43_fu_1488", "Port" : "A_2", "Inst_start_state" : "91", "Inst_end_state" : "92"},
					{"ID" : "101", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_464_51_fu_1568", "Port" : "A_2", "Inst_start_state" : "108", "Inst_end_state" : "109"},
					{"ID" : "5", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_56_3_fu_1088", "Port" : "A_2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "37", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_192_19_fu_1248", "Port" : "A_2", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "53", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_260_27_fu_1328", "Port" : "A_2", "Inst_start_state" : "57", "Inst_end_state" : "58"},
					{"ID" : "117", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_532_59_fu_1648", "Port" : "A_2", "Inst_start_state" : "125", "Inst_end_state" : "126"}]},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_336_36_fu_1418", "Port" : "A_3", "Inst_start_state" : "76", "Inst_end_state" : "77"},
					{"ID" : "103", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_472_52_fu_1578", "Port" : "A_3", "Inst_start_state" : "110", "Inst_end_state" : "111"},
					{"ID" : "39", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_200_20_fu_1258", "Port" : "A_3", "Inst_start_state" : "42", "Inst_end_state" : "43"},
					{"ID" : "55", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_268_28_fu_1338", "Port" : "A_3", "Inst_start_state" : "59", "Inst_end_state" : "60"},
					{"ID" : "23", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_132_12_fu_1178", "Port" : "A_3", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "7", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_64_4_fu_1098", "Port" : "A_3", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "119", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_540_60_fu_1658", "Port" : "A_3", "Inst_start_state" : "127", "Inst_end_state" : "128"},
					{"ID" : "87", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_404_44_fu_1498", "Port" : "A_3", "Inst_start_state" : "93", "Inst_end_state" : "94"}]},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_412_45_fu_1508", "Port" : "A_4", "Inst_start_state" : "95", "Inst_end_state" : "96"},
					{"ID" : "73", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_344_37_fu_1428", "Port" : "A_4", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "41", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_208_21_fu_1268", "Port" : "A_4", "Inst_start_state" : "44", "Inst_end_state" : "45"},
					{"ID" : "105", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_480_53_fu_1588", "Port" : "A_4", "Inst_start_state" : "112", "Inst_end_state" : "113"},
					{"ID" : "9", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_72_5_fu_1108", "Port" : "A_4", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "25", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_140_13_fu_1188", "Port" : "A_4", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "57", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_276_29_fu_1348", "Port" : "A_4", "Inst_start_state" : "61", "Inst_end_state" : "62"},
					{"ID" : "121", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_548_61_fu_1668", "Port" : "A_4", "Inst_start_state" : "129", "Inst_end_state" : "130"}]},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "59", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_284_30_fu_1358", "Port" : "A_5", "Inst_start_state" : "63", "Inst_end_state" : "64"},
					{"ID" : "27", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_148_14_fu_1198", "Port" : "A_5", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "91", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_420_46_fu_1518", "Port" : "A_5", "Inst_start_state" : "97", "Inst_end_state" : "98"},
					{"ID" : "43", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_216_22_fu_1278", "Port" : "A_5", "Inst_start_state" : "46", "Inst_end_state" : "47"},
					{"ID" : "75", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_352_38_fu_1438", "Port" : "A_5", "Inst_start_state" : "80", "Inst_end_state" : "81"},
					{"ID" : "11", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_80_6_fu_1118", "Port" : "A_5", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "107", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_488_54_fu_1598", "Port" : "A_5", "Inst_start_state" : "114", "Inst_end_state" : "115"},
					{"ID" : "123", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_556_62_fu_1678", "Port" : "A_5", "Inst_start_state" : "131", "Inst_end_state" : "132"}]},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_88_7_fu_1128", "Port" : "A_6", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "93", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_428_47_fu_1528", "Port" : "A_6", "Inst_start_state" : "99", "Inst_end_state" : "100"},
					{"ID" : "77", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_360_39_fu_1448", "Port" : "A_6", "Inst_start_state" : "82", "Inst_end_state" : "83"},
					{"ID" : "61", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_292_31_fu_1368", "Port" : "A_6", "Inst_start_state" : "65", "Inst_end_state" : "66"},
					{"ID" : "109", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_496_55_fu_1608", "Port" : "A_6", "Inst_start_state" : "116", "Inst_end_state" : "117"},
					{"ID" : "45", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_224_23_fu_1288", "Port" : "A_6", "Inst_start_state" : "48", "Inst_end_state" : "49"},
					{"ID" : "125", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_564_63_fu_1688", "Port" : "A_6", "Inst_start_state" : "133", "Inst_end_state" : "134"},
					{"ID" : "29", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_156_15_fu_1208", "Port" : "A_6", "Inst_start_state" : "31", "Inst_end_state" : "32"}]},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_368_40_fu_1458", "Port" : "A_7", "Inst_start_state" : "84", "Inst_end_state" : "85"},
					{"ID" : "15", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_96_8_fu_1138", "Port" : "A_7", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "47", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_232_24_fu_1298", "Port" : "A_7", "Inst_start_state" : "50", "Inst_end_state" : "51"},
					{"ID" : "111", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_504_56_fu_1618", "Port" : "A_7", "Inst_start_state" : "118", "Inst_end_state" : "119"},
					{"ID" : "63", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_300_32_fu_1378", "Port" : "A_7", "Inst_start_state" : "67", "Inst_end_state" : "68"},
					{"ID" : "31", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_164_16_fu_1218", "Port" : "A_7", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "95", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_436_48_fu_1538", "Port" : "A_7", "Inst_start_state" : "101", "Inst_end_state" : "102"},
					{"ID" : "127", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_572_64_fu_1698", "Port" : "A_7", "Inst_start_state" : "135", "Inst_end_state" : "136"}]},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_96_8_fu_1138", "Port" : "B_0", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "13", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_88_7_fu_1128", "Port" : "B_0", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "3", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_48_2_fu_1078", "Port" : "B_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "9", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_72_5_fu_1108", "Port" : "B_0", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "5", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_56_3_fu_1088", "Port" : "B_0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "7", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_64_4_fu_1098", "Port" : "B_0", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "11", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_80_6_fu_1118", "Port" : "B_0", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "1", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_40_1_fu_1068", "Port" : "B_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_124_11_fu_1168", "Port" : "B_1", "Inst_start_state" : "23", "Inst_end_state" : "24"},
					{"ID" : "19", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_116_10_fu_1158", "Port" : "B_1", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "27", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_148_14_fu_1198", "Port" : "B_1", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "17", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_108_9_fu_1148", "Port" : "B_1", "Inst_start_state" : "19", "Inst_end_state" : "20"},
					{"ID" : "31", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_164_16_fu_1218", "Port" : "B_1", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "25", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_140_13_fu_1188", "Port" : "B_1", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "23", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_132_12_fu_1178", "Port" : "B_1", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "29", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_156_15_fu_1208", "Port" : "B_1", "Inst_start_state" : "31", "Inst_end_state" : "32"}]},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_232_24_fu_1298", "Port" : "B_2", "Inst_start_state" : "50", "Inst_end_state" : "51"},
					{"ID" : "35", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_184_18_fu_1238", "Port" : "B_2", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "33", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_176_17_fu_1228", "Port" : "B_2", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "39", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_200_20_fu_1258", "Port" : "B_2", "Inst_start_state" : "42", "Inst_end_state" : "43"},
					{"ID" : "41", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_208_21_fu_1268", "Port" : "B_2", "Inst_start_state" : "44", "Inst_end_state" : "45"},
					{"ID" : "43", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_216_22_fu_1278", "Port" : "B_2", "Inst_start_state" : "46", "Inst_end_state" : "47"},
					{"ID" : "37", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_192_19_fu_1248", "Port" : "B_2", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "45", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_224_23_fu_1288", "Port" : "B_2", "Inst_start_state" : "48", "Inst_end_state" : "49"}]},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "59", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_284_30_fu_1358", "Port" : "B_3", "Inst_start_state" : "63", "Inst_end_state" : "64"},
					{"ID" : "49", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_244_25_fu_1308", "Port" : "B_3", "Inst_start_state" : "53", "Inst_end_state" : "54"},
					{"ID" : "63", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_300_32_fu_1378", "Port" : "B_3", "Inst_start_state" : "67", "Inst_end_state" : "68"},
					{"ID" : "61", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_292_31_fu_1368", "Port" : "B_3", "Inst_start_state" : "65", "Inst_end_state" : "66"},
					{"ID" : "55", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_268_28_fu_1338", "Port" : "B_3", "Inst_start_state" : "59", "Inst_end_state" : "60"},
					{"ID" : "57", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_276_29_fu_1348", "Port" : "B_3", "Inst_start_state" : "61", "Inst_end_state" : "62"},
					{"ID" : "51", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_252_26_fu_1318", "Port" : "B_3", "Inst_start_state" : "55", "Inst_end_state" : "56"},
					{"ID" : "53", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_260_27_fu_1328", "Port" : "B_3", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_368_40_fu_1458", "Port" : "B_4", "Inst_start_state" : "84", "Inst_end_state" : "85"},
					{"ID" : "67", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_320_34_fu_1398", "Port" : "B_4", "Inst_start_state" : "72", "Inst_end_state" : "73"},
					{"ID" : "69", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_328_35_fu_1408", "Port" : "B_4", "Inst_start_state" : "74", "Inst_end_state" : "75"},
					{"ID" : "73", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_344_37_fu_1428", "Port" : "B_4", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "71", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_336_36_fu_1418", "Port" : "B_4", "Inst_start_state" : "76", "Inst_end_state" : "77"},
					{"ID" : "77", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_360_39_fu_1448", "Port" : "B_4", "Inst_start_state" : "82", "Inst_end_state" : "83"},
					{"ID" : "75", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_352_38_fu_1438", "Port" : "B_4", "Inst_start_state" : "80", "Inst_end_state" : "81"},
					{"ID" : "65", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_312_33_fu_1388", "Port" : "B_4", "Inst_start_state" : "70", "Inst_end_state" : "71"}]},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_412_45_fu_1508", "Port" : "B_5", "Inst_start_state" : "95", "Inst_end_state" : "96"},
					{"ID" : "91", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_420_46_fu_1518", "Port" : "B_5", "Inst_start_state" : "97", "Inst_end_state" : "98"},
					{"ID" : "93", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_428_47_fu_1528", "Port" : "B_5", "Inst_start_state" : "99", "Inst_end_state" : "100"},
					{"ID" : "83", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_388_42_fu_1478", "Port" : "B_5", "Inst_start_state" : "89", "Inst_end_state" : "90"},
					{"ID" : "85", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_396_43_fu_1488", "Port" : "B_5", "Inst_start_state" : "91", "Inst_end_state" : "92"},
					{"ID" : "95", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_436_48_fu_1538", "Port" : "B_5", "Inst_start_state" : "101", "Inst_end_state" : "102"},
					{"ID" : "87", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_404_44_fu_1498", "Port" : "B_5", "Inst_start_state" : "93", "Inst_end_state" : "94"},
					{"ID" : "81", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_380_41_fu_1468", "Port" : "B_5", "Inst_start_state" : "87", "Inst_end_state" : "88"}]},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "111", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_504_56_fu_1618", "Port" : "B_6", "Inst_start_state" : "118", "Inst_end_state" : "119"},
					{"ID" : "97", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_448_49_fu_1548", "Port" : "B_6", "Inst_start_state" : "104", "Inst_end_state" : "105"},
					{"ID" : "103", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_472_52_fu_1578", "Port" : "B_6", "Inst_start_state" : "110", "Inst_end_state" : "111"},
					{"ID" : "105", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_480_53_fu_1588", "Port" : "B_6", "Inst_start_state" : "112", "Inst_end_state" : "113"},
					{"ID" : "101", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_464_51_fu_1568", "Port" : "B_6", "Inst_start_state" : "108", "Inst_end_state" : "109"},
					{"ID" : "99", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_456_50_fu_1558", "Port" : "B_6", "Inst_start_state" : "106", "Inst_end_state" : "107"},
					{"ID" : "109", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_496_55_fu_1608", "Port" : "B_6", "Inst_start_state" : "116", "Inst_end_state" : "117"},
					{"ID" : "107", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_488_54_fu_1598", "Port" : "B_6", "Inst_start_state" : "114", "Inst_end_state" : "115"}]},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "115", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_524_58_fu_1638", "Port" : "B_7", "Inst_start_state" : "123", "Inst_end_state" : "124"},
					{"ID" : "127", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_572_64_fu_1698", "Port" : "B_7", "Inst_start_state" : "135", "Inst_end_state" : "136"},
					{"ID" : "125", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_564_63_fu_1688", "Port" : "B_7", "Inst_start_state" : "133", "Inst_end_state" : "134"},
					{"ID" : "123", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_556_62_fu_1678", "Port" : "B_7", "Inst_start_state" : "131", "Inst_end_state" : "132"},
					{"ID" : "121", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_548_61_fu_1668", "Port" : "B_7", "Inst_start_state" : "129", "Inst_end_state" : "130"},
					{"ID" : "119", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_540_60_fu_1658", "Port" : "B_7", "Inst_start_state" : "127", "Inst_end_state" : "128"},
					{"ID" : "117", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_532_59_fu_1648", "Port" : "B_7", "Inst_start_state" : "125", "Inst_end_state" : "126"},
					{"ID" : "113", "SubInstance" : "grp_matrixmult_Pipeline_VITIS_LOOP_516_57_fu_1628", "Port" : "B_7", "Inst_start_state" : "121", "Inst_end_state" : "122"}]},
			{"Name" : "C_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "C_7", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state19"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state19", "LastState" : ["ap_ST_fsm_state35"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state36"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state36", "LastState" : ["ap_ST_fsm_state52"], "QuitState" : ["ap_ST_fsm_state36"], "PreState" : ["ap_ST_fsm_state19"], "PostState" : ["ap_ST_fsm_state53"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state53", "LastState" : ["ap_ST_fsm_state69"], "QuitState" : ["ap_ST_fsm_state53"], "PreState" : ["ap_ST_fsm_state36"], "PostState" : ["ap_ST_fsm_state70"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state70", "LastState" : ["ap_ST_fsm_state86"], "QuitState" : ["ap_ST_fsm_state70"], "PreState" : ["ap_ST_fsm_state53"], "PostState" : ["ap_ST_fsm_state87"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state87", "LastState" : ["ap_ST_fsm_state103"], "QuitState" : ["ap_ST_fsm_state87"], "PreState" : ["ap_ST_fsm_state70"], "PostState" : ["ap_ST_fsm_state104"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state104", "LastState" : ["ap_ST_fsm_state120"], "QuitState" : ["ap_ST_fsm_state104"], "PreState" : ["ap_ST_fsm_state87"], "PostState" : ["ap_ST_fsm_state121"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "137", "FirstState" : "ap_ST_fsm_state121", "LastState" : ["ap_ST_fsm_state137"], "QuitState" : ["ap_ST_fsm_state121"], "PreState" : ["ap_ST_fsm_state104"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_40_1_fu_1068", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_40_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_40_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_40_1_fu_1068.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_48_2_fu_1078", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_48_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_48_2_fu_1078.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_56_3_fu_1088", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_56_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_56_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_56_3_fu_1088.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_64_4_fu_1098", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_64_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_64_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_64_4_fu_1098.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_72_5_fu_1108", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_72_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_72_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_72_5_fu_1108.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_80_6_fu_1118", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_80_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_80_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_80_6_fu_1118.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_88_7_fu_1128", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_88_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_88_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_88_7_fu_1128.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_96_8_fu_1138", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_96_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_96_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_96_8_fu_1138.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_108_9_fu_1148", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_108_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_108_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_108_9_fu_1148.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_116_10_fu_1158", "Parent" : "0", "Child" : ["20"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_116_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_116_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_116_10_fu_1158.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_124_11_fu_1168", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_124_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_124_11", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_124_11_fu_1168.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_132_12_fu_1178", "Parent" : "0", "Child" : ["24"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_132_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_132_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_132_12_fu_1178.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_140_13_fu_1188", "Parent" : "0", "Child" : ["26"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_140_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_140_13", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_140_13_fu_1188.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_148_14_fu_1198", "Parent" : "0", "Child" : ["28"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_148_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_148_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_148_14_fu_1198.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_156_15_fu_1208", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_156_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_156_15", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_156_15_fu_1208.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_164_16_fu_1218", "Parent" : "0", "Child" : ["32"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_164_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln108_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_164_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_164_16_fu_1218.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_176_17_fu_1228", "Parent" : "0", "Child" : ["34"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_176_17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_176_17", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_176_17_fu_1228.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_184_18_fu_1238", "Parent" : "0", "Child" : ["36"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_184_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_184_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_184_18_fu_1238.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_192_19_fu_1248", "Parent" : "0", "Child" : ["38"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_192_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_192_19", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_192_19_fu_1248.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_200_20_fu_1258", "Parent" : "0", "Child" : ["40"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_200_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_200_20", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_200_20_fu_1258.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_208_21_fu_1268", "Parent" : "0", "Child" : ["42"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_208_21",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_208_21", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_208_21_fu_1268.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_216_22_fu_1278", "Parent" : "0", "Child" : ["44"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_216_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_216_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_216_22_fu_1278.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_224_23_fu_1288", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_224_23",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_224_23", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_224_23_fu_1288.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_232_24_fu_1298", "Parent" : "0", "Child" : ["48"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_232_24",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_232_24", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_232_24_fu_1298.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_244_25_fu_1308", "Parent" : "0", "Child" : ["50"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_244_25",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_244_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_244_25_fu_1308.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_252_26_fu_1318", "Parent" : "0", "Child" : ["52"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_252_26",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_252_26", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_252_26_fu_1318.flow_control_loop_pipe_sequential_init_U", "Parent" : "51"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_260_27_fu_1328", "Parent" : "0", "Child" : ["54"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_260_27",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_260_27", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_260_27_fu_1328.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_268_28_fu_1338", "Parent" : "0", "Child" : ["56"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_268_28",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_268_28", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_268_28_fu_1338.flow_control_loop_pipe_sequential_init_U", "Parent" : "55"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_276_29_fu_1348", "Parent" : "0", "Child" : ["58"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_276_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_276_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_276_29_fu_1348.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_284_30_fu_1358", "Parent" : "0", "Child" : ["60"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_284_30",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_284_30", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_284_30_fu_1358.flow_control_loop_pipe_sequential_init_U", "Parent" : "59"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_292_31_fu_1368", "Parent" : "0", "Child" : ["62"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_292_31",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_292_31", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_292_31_fu_1368.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_300_32_fu_1378", "Parent" : "0", "Child" : ["64"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_300_32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln244_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_300_32", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_300_32_fu_1378.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_312_33_fu_1388", "Parent" : "0", "Child" : ["66"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_312_33",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_312_33", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_312_33_fu_1388.flow_control_loop_pipe_sequential_init_U", "Parent" : "65"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_320_34_fu_1398", "Parent" : "0", "Child" : ["68"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_320_34",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_320_34", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_320_34_fu_1398.flow_control_loop_pipe_sequential_init_U", "Parent" : "67"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_328_35_fu_1408", "Parent" : "0", "Child" : ["70"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_328_35",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_328_35", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_328_35_fu_1408.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_336_36_fu_1418", "Parent" : "0", "Child" : ["72"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_336_36",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_336_36", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_336_36_fu_1418.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_344_37_fu_1428", "Parent" : "0", "Child" : ["74"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_344_37",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_344_37", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_344_37_fu_1428.flow_control_loop_pipe_sequential_init_U", "Parent" : "73"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_352_38_fu_1438", "Parent" : "0", "Child" : ["76"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_352_38",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_352_38", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_352_38_fu_1438.flow_control_loop_pipe_sequential_init_U", "Parent" : "75"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_360_39_fu_1448", "Parent" : "0", "Child" : ["78"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_360_39",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_360_39", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_360_39_fu_1448.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_368_40_fu_1458", "Parent" : "0", "Child" : ["80"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_368_40",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln312_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_368_40", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_368_40_fu_1458.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_380_41_fu_1468", "Parent" : "0", "Child" : ["82"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_380_41",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_380_41", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_380_41_fu_1468.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_388_42_fu_1478", "Parent" : "0", "Child" : ["84"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_388_42",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_388_42", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_388_42_fu_1478.flow_control_loop_pipe_sequential_init_U", "Parent" : "83"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_396_43_fu_1488", "Parent" : "0", "Child" : ["86"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_396_43",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_396_43", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_396_43_fu_1488.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_404_44_fu_1498", "Parent" : "0", "Child" : ["88"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_404_44",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_404_44", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_404_44_fu_1498.flow_control_loop_pipe_sequential_init_U", "Parent" : "87"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_412_45_fu_1508", "Parent" : "0", "Child" : ["90"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_412_45",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_412_45", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_412_45_fu_1508.flow_control_loop_pipe_sequential_init_U", "Parent" : "89"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_420_46_fu_1518", "Parent" : "0", "Child" : ["92"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_420_46",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_420_46", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_420_46_fu_1518.flow_control_loop_pipe_sequential_init_U", "Parent" : "91"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_428_47_fu_1528", "Parent" : "0", "Child" : ["94"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_428_47",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_428_47", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_428_47_fu_1528.flow_control_loop_pipe_sequential_init_U", "Parent" : "93"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_436_48_fu_1538", "Parent" : "0", "Child" : ["96"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_436_48",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln380_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_436_48", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_436_48_fu_1538.flow_control_loop_pipe_sequential_init_U", "Parent" : "95"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_448_49_fu_1548", "Parent" : "0", "Child" : ["98"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_448_49",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_448_49", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_448_49_fu_1548.flow_control_loop_pipe_sequential_init_U", "Parent" : "97"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_456_50_fu_1558", "Parent" : "0", "Child" : ["100"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_456_50",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_456_50", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_456_50_fu_1558.flow_control_loop_pipe_sequential_init_U", "Parent" : "99"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_464_51_fu_1568", "Parent" : "0", "Child" : ["102"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_464_51",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_464_51", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_464_51_fu_1568.flow_control_loop_pipe_sequential_init_U", "Parent" : "101"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_472_52_fu_1578", "Parent" : "0", "Child" : ["104"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_472_52",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_472_52", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_472_52_fu_1578.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_480_53_fu_1588", "Parent" : "0", "Child" : ["106"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_480_53",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_480_53", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_480_53_fu_1588.flow_control_loop_pipe_sequential_init_U", "Parent" : "105"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_488_54_fu_1598", "Parent" : "0", "Child" : ["108"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_488_54",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_488_54", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_488_54_fu_1598.flow_control_loop_pipe_sequential_init_U", "Parent" : "107"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_496_55_fu_1608", "Parent" : "0", "Child" : ["110"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_496_55",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_496_55", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_496_55_fu_1608.flow_control_loop_pipe_sequential_init_U", "Parent" : "109"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_504_56_fu_1618", "Parent" : "0", "Child" : ["112"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_504_56",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln448_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_504_56", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_504_56_fu_1618.flow_control_loop_pipe_sequential_init_U", "Parent" : "111"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_516_57_fu_1628", "Parent" : "0", "Child" : ["114"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_516_57",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_516_57", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_516_57_fu_1628.flow_control_loop_pipe_sequential_init_U", "Parent" : "113"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_524_58_fu_1638", "Parent" : "0", "Child" : ["116"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_524_58",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_524_58", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_524_58_fu_1638.flow_control_loop_pipe_sequential_init_U", "Parent" : "115"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_532_59_fu_1648", "Parent" : "0", "Child" : ["118"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_532_59",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_532_59", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_532_59_fu_1648.flow_control_loop_pipe_sequential_init_U", "Parent" : "117"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_540_60_fu_1658", "Parent" : "0", "Child" : ["120"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_540_60",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_540_60", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_540_60_fu_1658.flow_control_loop_pipe_sequential_init_U", "Parent" : "119"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_548_61_fu_1668", "Parent" : "0", "Child" : ["122"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_548_61",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_548_61", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_548_61_fu_1668.flow_control_loop_pipe_sequential_init_U", "Parent" : "121"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_556_62_fu_1678", "Parent" : "0", "Child" : ["124"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_556_62",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_556_62", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_556_62_fu_1678.flow_control_loop_pipe_sequential_init_U", "Parent" : "123"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_564_63_fu_1688", "Parent" : "0", "Child" : ["126"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_564_63",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_564_63", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_564_63_fu_1688.flow_control_loop_pipe_sequential_init_U", "Parent" : "125"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_572_64_fu_1698", "Parent" : "0", "Child" : ["128"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_572_64",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln516_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_572_64", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixmult_Pipeline_VITIS_LOOP_572_64_fu_1698.flow_control_loop_pipe_sequential_init_U", "Parent" : "127"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_8_max_dsp_1_U475", "Parent" : "0"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_4_no_dsp_1_U476", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_10_full_dsp_1_U477", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matrixmult {
		A_0 {Type I LastRead 1 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		C_0 {Type O LastRead -1 FirstWrite 3}
		C_1 {Type O LastRead -1 FirstWrite 4}
		C_2 {Type O LastRead -1 FirstWrite 5}
		C_3 {Type O LastRead -1 FirstWrite 6}
		C_4 {Type O LastRead -1 FirstWrite 7}
		C_5 {Type O LastRead -1 FirstWrite 8}
		C_6 {Type O LastRead -1 FirstWrite 9}
		C_7 {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_40_1 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_0_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_48_2 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_1_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_56_3 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_2_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_64_4 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_72_5 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_4_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_80_6 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_5_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_88_7 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_96_8 {
		zext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_0 {Type I LastRead 1 FirstWrite -1}
		s_7_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_108_9 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_0_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_116_10 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_1_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_124_11 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_2_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_132_12 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_3_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_140_13 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_4_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_148_14 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_5_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_156_15 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_6_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_164_16 {
		zext_ln108_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_1 {Type I LastRead 1 FirstWrite -1}
		s_7_3_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_176_17 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_0_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_184_18 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_1_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_192_19 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_2_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_200_20 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_3_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_208_21 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_4_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_216_22 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_5_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_224_23 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_6_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_232_24 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_7_6_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_244_25 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_0_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_252_26 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_1_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_260_27 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_2_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_268_28 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_3_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_276_29 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_4_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_284_30 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_5_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_292_31 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_6_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_300_32 {
		zext_ln244_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_3 {Type I LastRead 1 FirstWrite -1}
		s_7_9_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_312_33 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_0_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_320_34 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_1_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_328_35 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_2_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_336_36 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_3_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_344_37 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_4_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_352_38 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_5_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_360_39 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_6_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_368_40 {
		zext_ln312_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_4 {Type I LastRead 1 FirstWrite -1}
		s_7_12_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_380_41 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_0_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_388_42 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_1_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_396_43 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_2_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_404_44 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_3_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_412_45 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_4_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_420_46 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_5_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_428_47 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_6_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_436_48 {
		zext_ln380_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_5 {Type I LastRead 1 FirstWrite -1}
		s_7_15_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_448_49 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_0_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_456_50 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_1_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_464_51 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_2_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_472_52 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_3_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_480_53 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_4_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_488_54 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_5_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_496_55 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_6_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_504_56 {
		zext_ln448_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_6 {Type I LastRead 1 FirstWrite -1}
		s_7_18_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_516_57 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_0 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_0_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_524_58 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_1 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_1_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_532_59 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_2 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_2_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_540_60 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_3 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_3_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_548_61 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_4_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_556_62 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_5 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_5_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_564_63 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_6 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_6_21_out {Type O LastRead -1 FirstWrite 10}}
	matrixmult_Pipeline_VITIS_LOOP_572_64 {
		zext_ln516_1 {Type I LastRead 0 FirstWrite -1}
		A_7 {Type I LastRead 1 FirstWrite -1}
		B_7 {Type I LastRead 1 FirstWrite -1}
		s_7_21_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11536152", "Max" : "11536152"}
	, {"Name" : "Interval", "Min" : "11536152", "Max" : "11536152"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A_0 { ap_memory {  { A_0_address0 mem_address 1 13 }  { A_0_ce0 mem_ce 1 1 }  { A_0_q0 mem_dout 0 32 } } }
	A_1 { ap_memory {  { A_1_address0 mem_address 1 13 }  { A_1_ce0 mem_ce 1 1 }  { A_1_q0 mem_dout 0 32 } } }
	A_2 { ap_memory {  { A_2_address0 mem_address 1 13 }  { A_2_ce0 mem_ce 1 1 }  { A_2_q0 mem_dout 0 32 } } }
	A_3 { ap_memory {  { A_3_address0 mem_address 1 13 }  { A_3_ce0 mem_ce 1 1 }  { A_3_q0 mem_dout 0 32 } } }
	A_4 { ap_memory {  { A_4_address0 mem_address 1 13 }  { A_4_ce0 mem_ce 1 1 }  { A_4_q0 mem_dout 0 32 } } }
	A_5 { ap_memory {  { A_5_address0 mem_address 1 13 }  { A_5_ce0 mem_ce 1 1 }  { A_5_q0 mem_dout 0 32 } } }
	A_6 { ap_memory {  { A_6_address0 mem_address 1 13 }  { A_6_ce0 mem_ce 1 1 }  { A_6_q0 mem_dout 0 32 } } }
	A_7 { ap_memory {  { A_7_address0 mem_address 1 13 }  { A_7_ce0 mem_ce 1 1 }  { A_7_q0 mem_dout 0 32 } } }
	B_0 { ap_memory {  { B_0_address0 mem_address 1 13 }  { B_0_ce0 mem_ce 1 1 }  { B_0_q0 mem_dout 0 32 } } }
	B_1 { ap_memory {  { B_1_address0 mem_address 1 13 }  { B_1_ce0 mem_ce 1 1 }  { B_1_q0 mem_dout 0 32 } } }
	B_2 { ap_memory {  { B_2_address0 mem_address 1 13 }  { B_2_ce0 mem_ce 1 1 }  { B_2_q0 mem_dout 0 32 } } }
	B_3 { ap_memory {  { B_3_address0 mem_address 1 13 }  { B_3_ce0 mem_ce 1 1 }  { B_3_q0 mem_dout 0 32 } } }
	B_4 { ap_memory {  { B_4_address0 mem_address 1 13 }  { B_4_ce0 mem_ce 1 1 }  { B_4_q0 mem_dout 0 32 } } }
	B_5 { ap_memory {  { B_5_address0 mem_address 1 13 }  { B_5_ce0 mem_ce 1 1 }  { B_5_q0 mem_dout 0 32 } } }
	B_6 { ap_memory {  { B_6_address0 mem_address 1 13 }  { B_6_ce0 mem_ce 1 1 }  { B_6_q0 mem_dout 0 32 } } }
	B_7 { ap_memory {  { B_7_address0 mem_address 1 13 }  { B_7_ce0 mem_ce 1 1 }  { B_7_q0 mem_dout 0 32 } } }
	C_0 { ap_memory {  { C_0_address0 mem_address 1 5 }  { C_0_ce0 mem_ce 1 1 }  { C_0_we0 mem_we 1 1 }  { C_0_d0 mem_din 1 32 } } }
	C_1 { ap_memory {  { C_1_address0 mem_address 1 5 }  { C_1_ce0 mem_ce 1 1 }  { C_1_we0 mem_we 1 1 }  { C_1_d0 mem_din 1 32 } } }
	C_2 { ap_memory {  { C_2_address0 mem_address 1 5 }  { C_2_ce0 mem_ce 1 1 }  { C_2_we0 mem_we 1 1 }  { C_2_d0 mem_din 1 32 } } }
	C_3 { ap_memory {  { C_3_address0 mem_address 1 5 }  { C_3_ce0 mem_ce 1 1 }  { C_3_we0 mem_we 1 1 }  { C_3_d0 mem_din 1 32 } } }
	C_4 { ap_memory {  { C_4_address0 mem_address 1 5 }  { C_4_ce0 mem_ce 1 1 }  { C_4_we0 mem_we 1 1 }  { C_4_d0 mem_din 1 32 } } }
	C_5 { ap_memory {  { C_5_address0 mem_address 1 5 }  { C_5_ce0 mem_ce 1 1 }  { C_5_we0 mem_we 1 1 }  { C_5_d0 mem_din 1 32 } } }
	C_6 { ap_memory {  { C_6_address0 mem_address 1 5 }  { C_6_ce0 mem_ce 1 1 }  { C_6_we0 mem_we 1 1 }  { C_6_d0 mem_din 1 32 } } }
	C_7 { ap_memory {  { C_7_address0 mem_address 1 5 }  { C_7_ce0 mem_ce 1 1 }  { C_7_we0 mem_we 1 1 }  { C_7_d0 mem_din 1 32 } } }
}
