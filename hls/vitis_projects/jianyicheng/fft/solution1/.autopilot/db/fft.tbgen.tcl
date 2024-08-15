set moduleName fft
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
set C_modelName {fft}
set C_modelType { void 0 }
set C_modelArgList {
	{ X_R_0 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_1 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_2 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_3 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_4 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_5 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_6 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_R_7 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_0 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_1 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_2 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_3 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_4 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_5 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_6 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_7 float 32 regular {array 1024 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "X_R_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_R_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 166
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ X_R_0_address0 sc_out sc_lv 10 signal 0 } 
	{ X_R_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ X_R_0_we0 sc_out sc_logic 1 signal 0 } 
	{ X_R_0_d0 sc_out sc_lv 32 signal 0 } 
	{ X_R_0_q0 sc_in sc_lv 32 signal 0 } 
	{ X_R_0_address1 sc_out sc_lv 10 signal 0 } 
	{ X_R_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ X_R_0_we1 sc_out sc_logic 1 signal 0 } 
	{ X_R_0_d1 sc_out sc_lv 32 signal 0 } 
	{ X_R_0_q1 sc_in sc_lv 32 signal 0 } 
	{ X_R_1_address0 sc_out sc_lv 10 signal 1 } 
	{ X_R_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ X_R_1_we0 sc_out sc_logic 1 signal 1 } 
	{ X_R_1_d0 sc_out sc_lv 32 signal 1 } 
	{ X_R_1_q0 sc_in sc_lv 32 signal 1 } 
	{ X_R_1_address1 sc_out sc_lv 10 signal 1 } 
	{ X_R_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ X_R_1_we1 sc_out sc_logic 1 signal 1 } 
	{ X_R_1_d1 sc_out sc_lv 32 signal 1 } 
	{ X_R_1_q1 sc_in sc_lv 32 signal 1 } 
	{ X_R_2_address0 sc_out sc_lv 10 signal 2 } 
	{ X_R_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ X_R_2_we0 sc_out sc_logic 1 signal 2 } 
	{ X_R_2_d0 sc_out sc_lv 32 signal 2 } 
	{ X_R_2_q0 sc_in sc_lv 32 signal 2 } 
	{ X_R_2_address1 sc_out sc_lv 10 signal 2 } 
	{ X_R_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ X_R_2_we1 sc_out sc_logic 1 signal 2 } 
	{ X_R_2_d1 sc_out sc_lv 32 signal 2 } 
	{ X_R_2_q1 sc_in sc_lv 32 signal 2 } 
	{ X_R_3_address0 sc_out sc_lv 10 signal 3 } 
	{ X_R_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ X_R_3_we0 sc_out sc_logic 1 signal 3 } 
	{ X_R_3_d0 sc_out sc_lv 32 signal 3 } 
	{ X_R_3_q0 sc_in sc_lv 32 signal 3 } 
	{ X_R_3_address1 sc_out sc_lv 10 signal 3 } 
	{ X_R_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ X_R_3_we1 sc_out sc_logic 1 signal 3 } 
	{ X_R_3_d1 sc_out sc_lv 32 signal 3 } 
	{ X_R_3_q1 sc_in sc_lv 32 signal 3 } 
	{ X_R_4_address0 sc_out sc_lv 10 signal 4 } 
	{ X_R_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ X_R_4_we0 sc_out sc_logic 1 signal 4 } 
	{ X_R_4_d0 sc_out sc_lv 32 signal 4 } 
	{ X_R_4_q0 sc_in sc_lv 32 signal 4 } 
	{ X_R_4_address1 sc_out sc_lv 10 signal 4 } 
	{ X_R_4_ce1 sc_out sc_logic 1 signal 4 } 
	{ X_R_4_we1 sc_out sc_logic 1 signal 4 } 
	{ X_R_4_d1 sc_out sc_lv 32 signal 4 } 
	{ X_R_4_q1 sc_in sc_lv 32 signal 4 } 
	{ X_R_5_address0 sc_out sc_lv 10 signal 5 } 
	{ X_R_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ X_R_5_we0 sc_out sc_logic 1 signal 5 } 
	{ X_R_5_d0 sc_out sc_lv 32 signal 5 } 
	{ X_R_5_q0 sc_in sc_lv 32 signal 5 } 
	{ X_R_5_address1 sc_out sc_lv 10 signal 5 } 
	{ X_R_5_ce1 sc_out sc_logic 1 signal 5 } 
	{ X_R_5_we1 sc_out sc_logic 1 signal 5 } 
	{ X_R_5_d1 sc_out sc_lv 32 signal 5 } 
	{ X_R_5_q1 sc_in sc_lv 32 signal 5 } 
	{ X_R_6_address0 sc_out sc_lv 10 signal 6 } 
	{ X_R_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ X_R_6_we0 sc_out sc_logic 1 signal 6 } 
	{ X_R_6_d0 sc_out sc_lv 32 signal 6 } 
	{ X_R_6_q0 sc_in sc_lv 32 signal 6 } 
	{ X_R_6_address1 sc_out sc_lv 10 signal 6 } 
	{ X_R_6_ce1 sc_out sc_logic 1 signal 6 } 
	{ X_R_6_we1 sc_out sc_logic 1 signal 6 } 
	{ X_R_6_d1 sc_out sc_lv 32 signal 6 } 
	{ X_R_6_q1 sc_in sc_lv 32 signal 6 } 
	{ X_R_7_address0 sc_out sc_lv 10 signal 7 } 
	{ X_R_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ X_R_7_we0 sc_out sc_logic 1 signal 7 } 
	{ X_R_7_d0 sc_out sc_lv 32 signal 7 } 
	{ X_R_7_q0 sc_in sc_lv 32 signal 7 } 
	{ X_R_7_address1 sc_out sc_lv 10 signal 7 } 
	{ X_R_7_ce1 sc_out sc_logic 1 signal 7 } 
	{ X_R_7_we1 sc_out sc_logic 1 signal 7 } 
	{ X_R_7_d1 sc_out sc_lv 32 signal 7 } 
	{ X_R_7_q1 sc_in sc_lv 32 signal 7 } 
	{ X_I_0_address0 sc_out sc_lv 10 signal 8 } 
	{ X_I_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ X_I_0_we0 sc_out sc_logic 1 signal 8 } 
	{ X_I_0_d0 sc_out sc_lv 32 signal 8 } 
	{ X_I_0_q0 sc_in sc_lv 32 signal 8 } 
	{ X_I_0_address1 sc_out sc_lv 10 signal 8 } 
	{ X_I_0_ce1 sc_out sc_logic 1 signal 8 } 
	{ X_I_0_we1 sc_out sc_logic 1 signal 8 } 
	{ X_I_0_d1 sc_out sc_lv 32 signal 8 } 
	{ X_I_0_q1 sc_in sc_lv 32 signal 8 } 
	{ X_I_1_address0 sc_out sc_lv 10 signal 9 } 
	{ X_I_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ X_I_1_we0 sc_out sc_logic 1 signal 9 } 
	{ X_I_1_d0 sc_out sc_lv 32 signal 9 } 
	{ X_I_1_q0 sc_in sc_lv 32 signal 9 } 
	{ X_I_1_address1 sc_out sc_lv 10 signal 9 } 
	{ X_I_1_ce1 sc_out sc_logic 1 signal 9 } 
	{ X_I_1_we1 sc_out sc_logic 1 signal 9 } 
	{ X_I_1_d1 sc_out sc_lv 32 signal 9 } 
	{ X_I_1_q1 sc_in sc_lv 32 signal 9 } 
	{ X_I_2_address0 sc_out sc_lv 10 signal 10 } 
	{ X_I_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ X_I_2_we0 sc_out sc_logic 1 signal 10 } 
	{ X_I_2_d0 sc_out sc_lv 32 signal 10 } 
	{ X_I_2_q0 sc_in sc_lv 32 signal 10 } 
	{ X_I_2_address1 sc_out sc_lv 10 signal 10 } 
	{ X_I_2_ce1 sc_out sc_logic 1 signal 10 } 
	{ X_I_2_we1 sc_out sc_logic 1 signal 10 } 
	{ X_I_2_d1 sc_out sc_lv 32 signal 10 } 
	{ X_I_2_q1 sc_in sc_lv 32 signal 10 } 
	{ X_I_3_address0 sc_out sc_lv 10 signal 11 } 
	{ X_I_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ X_I_3_we0 sc_out sc_logic 1 signal 11 } 
	{ X_I_3_d0 sc_out sc_lv 32 signal 11 } 
	{ X_I_3_q0 sc_in sc_lv 32 signal 11 } 
	{ X_I_3_address1 sc_out sc_lv 10 signal 11 } 
	{ X_I_3_ce1 sc_out sc_logic 1 signal 11 } 
	{ X_I_3_we1 sc_out sc_logic 1 signal 11 } 
	{ X_I_3_d1 sc_out sc_lv 32 signal 11 } 
	{ X_I_3_q1 sc_in sc_lv 32 signal 11 } 
	{ X_I_4_address0 sc_out sc_lv 10 signal 12 } 
	{ X_I_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ X_I_4_we0 sc_out sc_logic 1 signal 12 } 
	{ X_I_4_d0 sc_out sc_lv 32 signal 12 } 
	{ X_I_4_q0 sc_in sc_lv 32 signal 12 } 
	{ X_I_4_address1 sc_out sc_lv 10 signal 12 } 
	{ X_I_4_ce1 sc_out sc_logic 1 signal 12 } 
	{ X_I_4_we1 sc_out sc_logic 1 signal 12 } 
	{ X_I_4_d1 sc_out sc_lv 32 signal 12 } 
	{ X_I_4_q1 sc_in sc_lv 32 signal 12 } 
	{ X_I_5_address0 sc_out sc_lv 10 signal 13 } 
	{ X_I_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ X_I_5_we0 sc_out sc_logic 1 signal 13 } 
	{ X_I_5_d0 sc_out sc_lv 32 signal 13 } 
	{ X_I_5_q0 sc_in sc_lv 32 signal 13 } 
	{ X_I_5_address1 sc_out sc_lv 10 signal 13 } 
	{ X_I_5_ce1 sc_out sc_logic 1 signal 13 } 
	{ X_I_5_we1 sc_out sc_logic 1 signal 13 } 
	{ X_I_5_d1 sc_out sc_lv 32 signal 13 } 
	{ X_I_5_q1 sc_in sc_lv 32 signal 13 } 
	{ X_I_6_address0 sc_out sc_lv 10 signal 14 } 
	{ X_I_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ X_I_6_we0 sc_out sc_logic 1 signal 14 } 
	{ X_I_6_d0 sc_out sc_lv 32 signal 14 } 
	{ X_I_6_q0 sc_in sc_lv 32 signal 14 } 
	{ X_I_6_address1 sc_out sc_lv 10 signal 14 } 
	{ X_I_6_ce1 sc_out sc_logic 1 signal 14 } 
	{ X_I_6_we1 sc_out sc_logic 1 signal 14 } 
	{ X_I_6_d1 sc_out sc_lv 32 signal 14 } 
	{ X_I_6_q1 sc_in sc_lv 32 signal 14 } 
	{ X_I_7_address0 sc_out sc_lv 10 signal 15 } 
	{ X_I_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ X_I_7_we0 sc_out sc_logic 1 signal 15 } 
	{ X_I_7_d0 sc_out sc_lv 32 signal 15 } 
	{ X_I_7_q0 sc_in sc_lv 32 signal 15 } 
	{ X_I_7_address1 sc_out sc_lv 10 signal 15 } 
	{ X_I_7_ce1 sc_out sc_logic 1 signal 15 } 
	{ X_I_7_we1 sc_out sc_logic 1 signal 15 } 
	{ X_I_7_d1 sc_out sc_lv 32 signal 15 } 
	{ X_I_7_q1 sc_in sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "X_R_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_0", "role": "address0" }} , 
 	{ "name": "X_R_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "ce0" }} , 
 	{ "name": "X_R_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "we0" }} , 
 	{ "name": "X_R_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "d0" }} , 
 	{ "name": "X_R_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "q0" }} , 
 	{ "name": "X_R_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_0", "role": "address1" }} , 
 	{ "name": "X_R_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "ce1" }} , 
 	{ "name": "X_R_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "we1" }} , 
 	{ "name": "X_R_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "d1" }} , 
 	{ "name": "X_R_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "q1" }} , 
 	{ "name": "X_R_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_1", "role": "address0" }} , 
 	{ "name": "X_R_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_1", "role": "ce0" }} , 
 	{ "name": "X_R_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_1", "role": "we0" }} , 
 	{ "name": "X_R_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_1", "role": "d0" }} , 
 	{ "name": "X_R_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_1", "role": "q0" }} , 
 	{ "name": "X_R_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_1", "role": "address1" }} , 
 	{ "name": "X_R_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_1", "role": "ce1" }} , 
 	{ "name": "X_R_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_1", "role": "we1" }} , 
 	{ "name": "X_R_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_1", "role": "d1" }} , 
 	{ "name": "X_R_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_1", "role": "q1" }} , 
 	{ "name": "X_R_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_2", "role": "address0" }} , 
 	{ "name": "X_R_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_2", "role": "ce0" }} , 
 	{ "name": "X_R_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_2", "role": "we0" }} , 
 	{ "name": "X_R_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_2", "role": "d0" }} , 
 	{ "name": "X_R_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_2", "role": "q0" }} , 
 	{ "name": "X_R_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_2", "role": "address1" }} , 
 	{ "name": "X_R_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_2", "role": "ce1" }} , 
 	{ "name": "X_R_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_2", "role": "we1" }} , 
 	{ "name": "X_R_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_2", "role": "d1" }} , 
 	{ "name": "X_R_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_2", "role": "q1" }} , 
 	{ "name": "X_R_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_3", "role": "address0" }} , 
 	{ "name": "X_R_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_3", "role": "ce0" }} , 
 	{ "name": "X_R_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_3", "role": "we0" }} , 
 	{ "name": "X_R_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_3", "role": "d0" }} , 
 	{ "name": "X_R_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_3", "role": "q0" }} , 
 	{ "name": "X_R_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_3", "role": "address1" }} , 
 	{ "name": "X_R_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_3", "role": "ce1" }} , 
 	{ "name": "X_R_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_3", "role": "we1" }} , 
 	{ "name": "X_R_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_3", "role": "d1" }} , 
 	{ "name": "X_R_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_3", "role": "q1" }} , 
 	{ "name": "X_R_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_4", "role": "address0" }} , 
 	{ "name": "X_R_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_4", "role": "ce0" }} , 
 	{ "name": "X_R_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_4", "role": "we0" }} , 
 	{ "name": "X_R_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_4", "role": "d0" }} , 
 	{ "name": "X_R_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_4", "role": "q0" }} , 
 	{ "name": "X_R_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_4", "role": "address1" }} , 
 	{ "name": "X_R_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_4", "role": "ce1" }} , 
 	{ "name": "X_R_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_4", "role": "we1" }} , 
 	{ "name": "X_R_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_4", "role": "d1" }} , 
 	{ "name": "X_R_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_4", "role": "q1" }} , 
 	{ "name": "X_R_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_5", "role": "address0" }} , 
 	{ "name": "X_R_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_5", "role": "ce0" }} , 
 	{ "name": "X_R_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_5", "role": "we0" }} , 
 	{ "name": "X_R_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_5", "role": "d0" }} , 
 	{ "name": "X_R_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_5", "role": "q0" }} , 
 	{ "name": "X_R_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_5", "role": "address1" }} , 
 	{ "name": "X_R_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_5", "role": "ce1" }} , 
 	{ "name": "X_R_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_5", "role": "we1" }} , 
 	{ "name": "X_R_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_5", "role": "d1" }} , 
 	{ "name": "X_R_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_5", "role": "q1" }} , 
 	{ "name": "X_R_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_6", "role": "address0" }} , 
 	{ "name": "X_R_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_6", "role": "ce0" }} , 
 	{ "name": "X_R_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_6", "role": "we0" }} , 
 	{ "name": "X_R_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_6", "role": "d0" }} , 
 	{ "name": "X_R_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_6", "role": "q0" }} , 
 	{ "name": "X_R_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_6", "role": "address1" }} , 
 	{ "name": "X_R_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_6", "role": "ce1" }} , 
 	{ "name": "X_R_6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_6", "role": "we1" }} , 
 	{ "name": "X_R_6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_6", "role": "d1" }} , 
 	{ "name": "X_R_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_6", "role": "q1" }} , 
 	{ "name": "X_R_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_7", "role": "address0" }} , 
 	{ "name": "X_R_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "ce0" }} , 
 	{ "name": "X_R_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "we0" }} , 
 	{ "name": "X_R_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "d0" }} , 
 	{ "name": "X_R_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "q0" }} , 
 	{ "name": "X_R_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_7", "role": "address1" }} , 
 	{ "name": "X_R_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "ce1" }} , 
 	{ "name": "X_R_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "we1" }} , 
 	{ "name": "X_R_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "d1" }} , 
 	{ "name": "X_R_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "q1" }} , 
 	{ "name": "X_I_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_0", "role": "address0" }} , 
 	{ "name": "X_I_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "ce0" }} , 
 	{ "name": "X_I_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "we0" }} , 
 	{ "name": "X_I_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "d0" }} , 
 	{ "name": "X_I_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "q0" }} , 
 	{ "name": "X_I_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_0", "role": "address1" }} , 
 	{ "name": "X_I_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "ce1" }} , 
 	{ "name": "X_I_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "we1" }} , 
 	{ "name": "X_I_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "d1" }} , 
 	{ "name": "X_I_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "q1" }} , 
 	{ "name": "X_I_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_1", "role": "address0" }} , 
 	{ "name": "X_I_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_1", "role": "ce0" }} , 
 	{ "name": "X_I_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_1", "role": "we0" }} , 
 	{ "name": "X_I_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_1", "role": "d0" }} , 
 	{ "name": "X_I_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_1", "role": "q0" }} , 
 	{ "name": "X_I_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_1", "role": "address1" }} , 
 	{ "name": "X_I_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_1", "role": "ce1" }} , 
 	{ "name": "X_I_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_1", "role": "we1" }} , 
 	{ "name": "X_I_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_1", "role": "d1" }} , 
 	{ "name": "X_I_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_1", "role": "q1" }} , 
 	{ "name": "X_I_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_2", "role": "address0" }} , 
 	{ "name": "X_I_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_2", "role": "ce0" }} , 
 	{ "name": "X_I_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_2", "role": "we0" }} , 
 	{ "name": "X_I_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_2", "role": "d0" }} , 
 	{ "name": "X_I_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_2", "role": "q0" }} , 
 	{ "name": "X_I_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_2", "role": "address1" }} , 
 	{ "name": "X_I_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_2", "role": "ce1" }} , 
 	{ "name": "X_I_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_2", "role": "we1" }} , 
 	{ "name": "X_I_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_2", "role": "d1" }} , 
 	{ "name": "X_I_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_2", "role": "q1" }} , 
 	{ "name": "X_I_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_3", "role": "address0" }} , 
 	{ "name": "X_I_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_3", "role": "ce0" }} , 
 	{ "name": "X_I_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_3", "role": "we0" }} , 
 	{ "name": "X_I_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_3", "role": "d0" }} , 
 	{ "name": "X_I_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_3", "role": "q0" }} , 
 	{ "name": "X_I_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_3", "role": "address1" }} , 
 	{ "name": "X_I_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_3", "role": "ce1" }} , 
 	{ "name": "X_I_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_3", "role": "we1" }} , 
 	{ "name": "X_I_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_3", "role": "d1" }} , 
 	{ "name": "X_I_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_3", "role": "q1" }} , 
 	{ "name": "X_I_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_4", "role": "address0" }} , 
 	{ "name": "X_I_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_4", "role": "ce0" }} , 
 	{ "name": "X_I_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_4", "role": "we0" }} , 
 	{ "name": "X_I_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_4", "role": "d0" }} , 
 	{ "name": "X_I_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_4", "role": "q0" }} , 
 	{ "name": "X_I_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_4", "role": "address1" }} , 
 	{ "name": "X_I_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_4", "role": "ce1" }} , 
 	{ "name": "X_I_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_4", "role": "we1" }} , 
 	{ "name": "X_I_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_4", "role": "d1" }} , 
 	{ "name": "X_I_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_4", "role": "q1" }} , 
 	{ "name": "X_I_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_5", "role": "address0" }} , 
 	{ "name": "X_I_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_5", "role": "ce0" }} , 
 	{ "name": "X_I_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_5", "role": "we0" }} , 
 	{ "name": "X_I_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_5", "role": "d0" }} , 
 	{ "name": "X_I_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_5", "role": "q0" }} , 
 	{ "name": "X_I_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_5", "role": "address1" }} , 
 	{ "name": "X_I_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_5", "role": "ce1" }} , 
 	{ "name": "X_I_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_5", "role": "we1" }} , 
 	{ "name": "X_I_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_5", "role": "d1" }} , 
 	{ "name": "X_I_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_5", "role": "q1" }} , 
 	{ "name": "X_I_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_6", "role": "address0" }} , 
 	{ "name": "X_I_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_6", "role": "ce0" }} , 
 	{ "name": "X_I_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_6", "role": "we0" }} , 
 	{ "name": "X_I_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_6", "role": "d0" }} , 
 	{ "name": "X_I_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_6", "role": "q0" }} , 
 	{ "name": "X_I_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_6", "role": "address1" }} , 
 	{ "name": "X_I_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_6", "role": "ce1" }} , 
 	{ "name": "X_I_6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_6", "role": "we1" }} , 
 	{ "name": "X_I_6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_6", "role": "d1" }} , 
 	{ "name": "X_I_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_6", "role": "q1" }} , 
 	{ "name": "X_I_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_7", "role": "address0" }} , 
 	{ "name": "X_I_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "ce0" }} , 
 	{ "name": "X_I_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "we0" }} , 
 	{ "name": "X_I_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "d0" }} , 
 	{ "name": "X_I_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "q0" }} , 
 	{ "name": "X_I_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_7", "role": "address1" }} , 
 	{ "name": "X_I_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "ce1" }} , 
 	{ "name": "X_I_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "we1" }} , 
 	{ "name": "X_I_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "d1" }} , 
 	{ "name": "X_I_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "5", "7", "9", "11", "13", "15", "17", "19", "20", "21", "22", "23", "24"],
		"CDFG" : "fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6664", "EstimateLatencyMax" : "721928",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "X_R_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "X_R_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "X_R_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "X_R_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "X_R_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "X_R_2", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "X_R_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "X_R_3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "X_R_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "X_R_4", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "X_R_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "X_R_5", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "X_R_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "X_R_6", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "X_R_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "X_R_7", "Inst_start_state" : "40", "Inst_end_state" : "41"}]},
			{"Name" : "X_I_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "X_I_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "X_I_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "X_I_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "X_I_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "X_I_2", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "X_I_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "X_I_3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "X_I_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "X_I_4", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "X_I_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "X_I_5", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "X_I_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "X_I_6", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "X_I_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "X_I_7", "Inst_start_state" : "40", "Inst_end_state" : "41"}]},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "cos_coefficients_table", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "11", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "cos_coefficients_table", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "13", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "cos_coefficients_table", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "9", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "cos_coefficients_table", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "15", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "cos_coefficients_table", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "5", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "cos_coefficients_table", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "17", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "cos_coefficients_table", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "3", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "cos_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "sin_coefficients_table", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "11", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "sin_coefficients_table", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "13", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "sin_coefficients_table", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "9", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "sin_coefficients_table", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "15", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "sin_coefficients_table", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "5", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "sin_coefficients_table", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "17", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "sin_coefficients_table", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "3", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "sin_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "loop_0_VITIS_LOOP_39_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_1_VITIS_LOOP_58_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_2_VITIS_LOOP_77_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state7"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_3_VITIS_LOOP_96_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state22"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_4_VITIS_LOOP_115_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state26"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state27"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_5_VITIS_LOOP_134_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state27", "LastState" : ["ap_ST_fsm_state31"], "QuitState" : ["ap_ST_fsm_state27"], "PreState" : ["ap_ST_fsm_state22"], "PostState" : ["ap_ST_fsm_state32"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_6_VITIS_LOOP_153_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state32", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state32"], "PreState" : ["ap_ST_fsm_state27"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_7_VITIS_LOOP_172_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state37", "LastState" : ["ap_ST_fsm_state41"], "QuitState" : ["ap_ST_fsm_state37"], "PreState" : ["ap_ST_fsm_state32"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cos_coefficients_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sin_coefficients_table_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_41_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln38_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_60_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln60", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln57_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_60_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_79_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln79", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln76_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_79_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_98_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln98", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln95_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_98_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_117_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln114_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_117_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_136_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln136", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln133_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_155_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln155", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln152_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_155_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln171_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_10_full_dsp_1_U105", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_10_full_dsp_1_U106", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_8_max_dsp_1_U107", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_8_max_dsp_1_U108", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_8_max_dsp_1_U109", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_8_max_dsp_1_U110", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft {
		X_R_0 {Type IO LastRead 32 FirstWrite 31}
		X_R_1 {Type IO LastRead 32 FirstWrite 31}
		X_R_2 {Type IO LastRead 32 FirstWrite 31}
		X_R_3 {Type IO LastRead 32 FirstWrite 31}
		X_R_4 {Type IO LastRead 32 FirstWrite 31}
		X_R_5 {Type IO LastRead 32 FirstWrite 31}
		X_R_6 {Type IO LastRead 32 FirstWrite 31}
		X_R_7 {Type IO LastRead 32 FirstWrite 31}
		X_I_0 {Type IO LastRead 32 FirstWrite 31}
		X_I_1 {Type IO LastRead 32 FirstWrite 31}
		X_I_2 {Type IO LastRead 32 FirstWrite 31}
		X_I_3 {Type IO LastRead 32 FirstWrite 31}
		X_I_4 {Type IO LastRead 32 FirstWrite 31}
		X_I_5 {Type IO LastRead 32 FirstWrite 31}
		X_I_6 {Type IO LastRead 32 FirstWrite 31}
		X_I_7 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_41_2 {
		numBF {Type I LastRead 0 FirstWrite -1}
		zext_ln41 {Type I LastRead 0 FirstWrite -1}
		select_ln38_1 {Type I LastRead 0 FirstWrite -1}
		X_R_0 {Type IO LastRead 32 FirstWrite 31}
		X_I_0 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_60_4 {
		numBF_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln60 {Type I LastRead 0 FirstWrite -1}
		select_ln57_1 {Type I LastRead 0 FirstWrite -1}
		X_R_1 {Type IO LastRead 32 FirstWrite 31}
		X_I_1 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_79_6 {
		numBF_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln79 {Type I LastRead 0 FirstWrite -1}
		select_ln76_1 {Type I LastRead 0 FirstWrite -1}
		X_R_2 {Type IO LastRead 32 FirstWrite 31}
		X_I_2 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_98_8 {
		numBF_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln98 {Type I LastRead 0 FirstWrite -1}
		select_ln95_1 {Type I LastRead 0 FirstWrite -1}
		X_R_3 {Type IO LastRead 32 FirstWrite 31}
		X_I_3 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_117_10 {
		numBF_4 {Type I LastRead 0 FirstWrite -1}
		zext_ln117 {Type I LastRead 0 FirstWrite -1}
		select_ln114_1 {Type I LastRead 0 FirstWrite -1}
		X_R_4 {Type IO LastRead 32 FirstWrite 31}
		X_I_4 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_136_12 {
		numBF_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln136 {Type I LastRead 0 FirstWrite -1}
		select_ln133_1 {Type I LastRead 0 FirstWrite -1}
		X_R_5 {Type IO LastRead 32 FirstWrite 31}
		X_I_5 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_155_14 {
		numBF_6 {Type I LastRead 0 FirstWrite -1}
		zext_ln155 {Type I LastRead 0 FirstWrite -1}
		select_ln152_1 {Type I LastRead 0 FirstWrite -1}
		X_R_6 {Type IO LastRead 32 FirstWrite 31}
		X_I_6 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_174_16 {
		numBF_7 {Type I LastRead 0 FirstWrite -1}
		zext_ln174 {Type I LastRead 0 FirstWrite -1}
		select_ln171_1 {Type I LastRead 0 FirstWrite -1}
		X_R_7 {Type IO LastRead 32 FirstWrite 31}
		X_I_7 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6664", "Max" : "721928"}
	, {"Name" : "Interval", "Min" : "6664", "Max" : "721928"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	X_R_0 { ap_memory {  { X_R_0_address0 mem_address 1 10 }  { X_R_0_ce0 mem_ce 1 1 }  { X_R_0_we0 mem_we 1 1 }  { X_R_0_d0 mem_din 1 32 }  { X_R_0_q0 mem_dout 0 32 }  { X_R_0_address1 MemPortADDR2 1 10 }  { X_R_0_ce1 MemPortCE2 1 1 }  { X_R_0_we1 MemPortWE2 1 1 }  { X_R_0_d1 MemPortDIN2 1 32 }  { X_R_0_q1 MemPortDOUT2 0 32 } } }
	X_R_1 { ap_memory {  { X_R_1_address0 mem_address 1 10 }  { X_R_1_ce0 mem_ce 1 1 }  { X_R_1_we0 mem_we 1 1 }  { X_R_1_d0 mem_din 1 32 }  { X_R_1_q0 mem_dout 0 32 }  { X_R_1_address1 MemPortADDR2 1 10 }  { X_R_1_ce1 MemPortCE2 1 1 }  { X_R_1_we1 MemPortWE2 1 1 }  { X_R_1_d1 MemPortDIN2 1 32 }  { X_R_1_q1 MemPortDOUT2 0 32 } } }
	X_R_2 { ap_memory {  { X_R_2_address0 mem_address 1 10 }  { X_R_2_ce0 mem_ce 1 1 }  { X_R_2_we0 mem_we 1 1 }  { X_R_2_d0 mem_din 1 32 }  { X_R_2_q0 mem_dout 0 32 }  { X_R_2_address1 MemPortADDR2 1 10 }  { X_R_2_ce1 MemPortCE2 1 1 }  { X_R_2_we1 MemPortWE2 1 1 }  { X_R_2_d1 MemPortDIN2 1 32 }  { X_R_2_q1 MemPortDOUT2 0 32 } } }
	X_R_3 { ap_memory {  { X_R_3_address0 mem_address 1 10 }  { X_R_3_ce0 mem_ce 1 1 }  { X_R_3_we0 mem_we 1 1 }  { X_R_3_d0 mem_din 1 32 }  { X_R_3_q0 mem_dout 0 32 }  { X_R_3_address1 MemPortADDR2 1 10 }  { X_R_3_ce1 MemPortCE2 1 1 }  { X_R_3_we1 MemPortWE2 1 1 }  { X_R_3_d1 MemPortDIN2 1 32 }  { X_R_3_q1 MemPortDOUT2 0 32 } } }
	X_R_4 { ap_memory {  { X_R_4_address0 mem_address 1 10 }  { X_R_4_ce0 mem_ce 1 1 }  { X_R_4_we0 mem_we 1 1 }  { X_R_4_d0 mem_din 1 32 }  { X_R_4_q0 mem_dout 0 32 }  { X_R_4_address1 MemPortADDR2 1 10 }  { X_R_4_ce1 MemPortCE2 1 1 }  { X_R_4_we1 MemPortWE2 1 1 }  { X_R_4_d1 MemPortDIN2 1 32 }  { X_R_4_q1 MemPortDOUT2 0 32 } } }
	X_R_5 { ap_memory {  { X_R_5_address0 mem_address 1 10 }  { X_R_5_ce0 mem_ce 1 1 }  { X_R_5_we0 mem_we 1 1 }  { X_R_5_d0 mem_din 1 32 }  { X_R_5_q0 mem_dout 0 32 }  { X_R_5_address1 MemPortADDR2 1 10 }  { X_R_5_ce1 MemPortCE2 1 1 }  { X_R_5_we1 MemPortWE2 1 1 }  { X_R_5_d1 MemPortDIN2 1 32 }  { X_R_5_q1 MemPortDOUT2 0 32 } } }
	X_R_6 { ap_memory {  { X_R_6_address0 mem_address 1 10 }  { X_R_6_ce0 mem_ce 1 1 }  { X_R_6_we0 mem_we 1 1 }  { X_R_6_d0 mem_din 1 32 }  { X_R_6_q0 mem_dout 0 32 }  { X_R_6_address1 MemPortADDR2 1 10 }  { X_R_6_ce1 MemPortCE2 1 1 }  { X_R_6_we1 MemPortWE2 1 1 }  { X_R_6_d1 MemPortDIN2 1 32 }  { X_R_6_q1 MemPortDOUT2 0 32 } } }
	X_R_7 { ap_memory {  { X_R_7_address0 mem_address 1 10 }  { X_R_7_ce0 mem_ce 1 1 }  { X_R_7_we0 mem_we 1 1 }  { X_R_7_d0 mem_din 1 32 }  { X_R_7_q0 mem_dout 0 32 }  { X_R_7_address1 MemPortADDR2 1 10 }  { X_R_7_ce1 MemPortCE2 1 1 }  { X_R_7_we1 MemPortWE2 1 1 }  { X_R_7_d1 MemPortDIN2 1 32 }  { X_R_7_q1 MemPortDOUT2 0 32 } } }
	X_I_0 { ap_memory {  { X_I_0_address0 mem_address 1 10 }  { X_I_0_ce0 mem_ce 1 1 }  { X_I_0_we0 mem_we 1 1 }  { X_I_0_d0 mem_din 1 32 }  { X_I_0_q0 mem_dout 0 32 }  { X_I_0_address1 MemPortADDR2 1 10 }  { X_I_0_ce1 MemPortCE2 1 1 }  { X_I_0_we1 MemPortWE2 1 1 }  { X_I_0_d1 MemPortDIN2 1 32 }  { X_I_0_q1 MemPortDOUT2 0 32 } } }
	X_I_1 { ap_memory {  { X_I_1_address0 mem_address 1 10 }  { X_I_1_ce0 mem_ce 1 1 }  { X_I_1_we0 mem_we 1 1 }  { X_I_1_d0 mem_din 1 32 }  { X_I_1_q0 mem_dout 0 32 }  { X_I_1_address1 MemPortADDR2 1 10 }  { X_I_1_ce1 MemPortCE2 1 1 }  { X_I_1_we1 MemPortWE2 1 1 }  { X_I_1_d1 MemPortDIN2 1 32 }  { X_I_1_q1 MemPortDOUT2 0 32 } } }
	X_I_2 { ap_memory {  { X_I_2_address0 mem_address 1 10 }  { X_I_2_ce0 mem_ce 1 1 }  { X_I_2_we0 mem_we 1 1 }  { X_I_2_d0 mem_din 1 32 }  { X_I_2_q0 mem_dout 0 32 }  { X_I_2_address1 MemPortADDR2 1 10 }  { X_I_2_ce1 MemPortCE2 1 1 }  { X_I_2_we1 MemPortWE2 1 1 }  { X_I_2_d1 MemPortDIN2 1 32 }  { X_I_2_q1 MemPortDOUT2 0 32 } } }
	X_I_3 { ap_memory {  { X_I_3_address0 mem_address 1 10 }  { X_I_3_ce0 mem_ce 1 1 }  { X_I_3_we0 mem_we 1 1 }  { X_I_3_d0 mem_din 1 32 }  { X_I_3_q0 mem_dout 0 32 }  { X_I_3_address1 MemPortADDR2 1 10 }  { X_I_3_ce1 MemPortCE2 1 1 }  { X_I_3_we1 MemPortWE2 1 1 }  { X_I_3_d1 MemPortDIN2 1 32 }  { X_I_3_q1 MemPortDOUT2 0 32 } } }
	X_I_4 { ap_memory {  { X_I_4_address0 mem_address 1 10 }  { X_I_4_ce0 mem_ce 1 1 }  { X_I_4_we0 mem_we 1 1 }  { X_I_4_d0 mem_din 1 32 }  { X_I_4_q0 mem_dout 0 32 }  { X_I_4_address1 MemPortADDR2 1 10 }  { X_I_4_ce1 MemPortCE2 1 1 }  { X_I_4_we1 MemPortWE2 1 1 }  { X_I_4_d1 MemPortDIN2 1 32 }  { X_I_4_q1 MemPortDOUT2 0 32 } } }
	X_I_5 { ap_memory {  { X_I_5_address0 mem_address 1 10 }  { X_I_5_ce0 mem_ce 1 1 }  { X_I_5_we0 mem_we 1 1 }  { X_I_5_d0 mem_din 1 32 }  { X_I_5_q0 mem_dout 0 32 }  { X_I_5_address1 MemPortADDR2 1 10 }  { X_I_5_ce1 MemPortCE2 1 1 }  { X_I_5_we1 MemPortWE2 1 1 }  { X_I_5_d1 MemPortDIN2 1 32 }  { X_I_5_q1 MemPortDOUT2 0 32 } } }
	X_I_6 { ap_memory {  { X_I_6_address0 mem_address 1 10 }  { X_I_6_ce0 mem_ce 1 1 }  { X_I_6_we0 mem_we 1 1 }  { X_I_6_d0 mem_din 1 32 }  { X_I_6_q0 mem_dout 0 32 }  { X_I_6_address1 MemPortADDR2 1 10 }  { X_I_6_ce1 MemPortCE2 1 1 }  { X_I_6_we1 MemPortWE2 1 1 }  { X_I_6_d1 MemPortDIN2 1 32 }  { X_I_6_q1 MemPortDOUT2 0 32 } } }
	X_I_7 { ap_memory {  { X_I_7_address0 mem_address 1 10 }  { X_I_7_ce0 mem_ce 1 1 }  { X_I_7_we0 mem_we 1 1 }  { X_I_7_d0 mem_din 1 32 }  { X_I_7_q0 mem_dout 0 32 }  { X_I_7_address1 MemPortADDR2 1 10 }  { X_I_7_ce1 MemPortCE2 1 1 }  { X_I_7_we1 MemPortWE2 1 1 }  { X_I_7_d1 MemPortDIN2 1 32 }  { X_I_7_q1 MemPortDOUT2 0 32 } } }
}
