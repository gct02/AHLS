set moduleName histogram
set isTopModule 1
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
set C_modelName {histogram}
set C_modelType { void 0 }
set C_modelArgList {
	{ array_0 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_1 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_2 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_3 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_4 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_5 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_6 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ array_7 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ results_0 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_1 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_2 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_3 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_4 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_5 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_6 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results_7 int 32 regular {array 5 { 2 3 } 1 1 }  }
	{ results int 32 regular {array 5 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "array_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "results_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "results", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ array_0_address0 sc_out sc_lv 12 signal 0 } 
	{ array_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ array_0_q0 sc_in sc_lv 32 signal 0 } 
	{ array_1_address0 sc_out sc_lv 12 signal 1 } 
	{ array_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ array_1_q0 sc_in sc_lv 32 signal 1 } 
	{ array_2_address0 sc_out sc_lv 12 signal 2 } 
	{ array_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ array_2_q0 sc_in sc_lv 32 signal 2 } 
	{ array_3_address0 sc_out sc_lv 12 signal 3 } 
	{ array_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ array_3_q0 sc_in sc_lv 32 signal 3 } 
	{ array_4_address0 sc_out sc_lv 12 signal 4 } 
	{ array_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ array_4_q0 sc_in sc_lv 32 signal 4 } 
	{ array_5_address0 sc_out sc_lv 12 signal 5 } 
	{ array_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ array_5_q0 sc_in sc_lv 32 signal 5 } 
	{ array_6_address0 sc_out sc_lv 12 signal 6 } 
	{ array_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ array_6_q0 sc_in sc_lv 32 signal 6 } 
	{ array_7_address0 sc_out sc_lv 12 signal 7 } 
	{ array_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ array_7_q0 sc_in sc_lv 32 signal 7 } 
	{ results_0_address0 sc_out sc_lv 3 signal 8 } 
	{ results_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ results_0_we0 sc_out sc_logic 1 signal 8 } 
	{ results_0_d0 sc_out sc_lv 32 signal 8 } 
	{ results_0_q0 sc_in sc_lv 32 signal 8 } 
	{ results_1_address0 sc_out sc_lv 3 signal 9 } 
	{ results_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ results_1_we0 sc_out sc_logic 1 signal 9 } 
	{ results_1_d0 sc_out sc_lv 32 signal 9 } 
	{ results_1_q0 sc_in sc_lv 32 signal 9 } 
	{ results_2_address0 sc_out sc_lv 3 signal 10 } 
	{ results_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ results_2_we0 sc_out sc_logic 1 signal 10 } 
	{ results_2_d0 sc_out sc_lv 32 signal 10 } 
	{ results_2_q0 sc_in sc_lv 32 signal 10 } 
	{ results_3_address0 sc_out sc_lv 3 signal 11 } 
	{ results_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ results_3_we0 sc_out sc_logic 1 signal 11 } 
	{ results_3_d0 sc_out sc_lv 32 signal 11 } 
	{ results_3_q0 sc_in sc_lv 32 signal 11 } 
	{ results_4_address0 sc_out sc_lv 3 signal 12 } 
	{ results_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ results_4_we0 sc_out sc_logic 1 signal 12 } 
	{ results_4_d0 sc_out sc_lv 32 signal 12 } 
	{ results_4_q0 sc_in sc_lv 32 signal 12 } 
	{ results_5_address0 sc_out sc_lv 3 signal 13 } 
	{ results_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ results_5_we0 sc_out sc_logic 1 signal 13 } 
	{ results_5_d0 sc_out sc_lv 32 signal 13 } 
	{ results_5_q0 sc_in sc_lv 32 signal 13 } 
	{ results_6_address0 sc_out sc_lv 3 signal 14 } 
	{ results_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ results_6_we0 sc_out sc_logic 1 signal 14 } 
	{ results_6_d0 sc_out sc_lv 32 signal 14 } 
	{ results_6_q0 sc_in sc_lv 32 signal 14 } 
	{ results_7_address0 sc_out sc_lv 3 signal 15 } 
	{ results_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ results_7_we0 sc_out sc_logic 1 signal 15 } 
	{ results_7_d0 sc_out sc_lv 32 signal 15 } 
	{ results_7_q0 sc_in sc_lv 32 signal 15 } 
	{ results_address0 sc_out sc_lv 3 signal 16 } 
	{ results_ce0 sc_out sc_logic 1 signal 16 } 
	{ results_we0 sc_out sc_logic 1 signal 16 } 
	{ results_d0 sc_out sc_lv 32 signal 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "array_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_0", "role": "address0" }} , 
 	{ "name": "array_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_0", "role": "ce0" }} , 
 	{ "name": "array_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_0", "role": "q0" }} , 
 	{ "name": "array_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_1", "role": "address0" }} , 
 	{ "name": "array_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_1", "role": "ce0" }} , 
 	{ "name": "array_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_1", "role": "q0" }} , 
 	{ "name": "array_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_2", "role": "address0" }} , 
 	{ "name": "array_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_2", "role": "ce0" }} , 
 	{ "name": "array_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_2", "role": "q0" }} , 
 	{ "name": "array_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_3", "role": "address0" }} , 
 	{ "name": "array_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "ce0" }} , 
 	{ "name": "array_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "q0" }} , 
 	{ "name": "array_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_4", "role": "address0" }} , 
 	{ "name": "array_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_4", "role": "ce0" }} , 
 	{ "name": "array_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_4", "role": "q0" }} , 
 	{ "name": "array_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_5", "role": "address0" }} , 
 	{ "name": "array_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "ce0" }} , 
 	{ "name": "array_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "q0" }} , 
 	{ "name": "array_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_6", "role": "address0" }} , 
 	{ "name": "array_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_6", "role": "ce0" }} , 
 	{ "name": "array_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_6", "role": "q0" }} , 
 	{ "name": "array_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_7", "role": "address0" }} , 
 	{ "name": "array_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_7", "role": "ce0" }} , 
 	{ "name": "array_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_7", "role": "q0" }} , 
 	{ "name": "results_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_0", "role": "address0" }} , 
 	{ "name": "results_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "ce0" }} , 
 	{ "name": "results_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "we0" }} , 
 	{ "name": "results_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_0", "role": "d0" }} , 
 	{ "name": "results_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_0", "role": "q0" }} , 
 	{ "name": "results_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_1", "role": "address0" }} , 
 	{ "name": "results_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "ce0" }} , 
 	{ "name": "results_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "we0" }} , 
 	{ "name": "results_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_1", "role": "d0" }} , 
 	{ "name": "results_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_1", "role": "q0" }} , 
 	{ "name": "results_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_2", "role": "address0" }} , 
 	{ "name": "results_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "ce0" }} , 
 	{ "name": "results_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "we0" }} , 
 	{ "name": "results_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_2", "role": "d0" }} , 
 	{ "name": "results_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_2", "role": "q0" }} , 
 	{ "name": "results_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_3", "role": "address0" }} , 
 	{ "name": "results_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "ce0" }} , 
 	{ "name": "results_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "we0" }} , 
 	{ "name": "results_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_3", "role": "d0" }} , 
 	{ "name": "results_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_3", "role": "q0" }} , 
 	{ "name": "results_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_4", "role": "address0" }} , 
 	{ "name": "results_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "ce0" }} , 
 	{ "name": "results_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "we0" }} , 
 	{ "name": "results_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_4", "role": "d0" }} , 
 	{ "name": "results_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_4", "role": "q0" }} , 
 	{ "name": "results_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_5", "role": "address0" }} , 
 	{ "name": "results_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "ce0" }} , 
 	{ "name": "results_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "we0" }} , 
 	{ "name": "results_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_5", "role": "d0" }} , 
 	{ "name": "results_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_5", "role": "q0" }} , 
 	{ "name": "results_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_6", "role": "address0" }} , 
 	{ "name": "results_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "ce0" }} , 
 	{ "name": "results_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "we0" }} , 
 	{ "name": "results_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_6", "role": "d0" }} , 
 	{ "name": "results_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_6", "role": "q0" }} , 
 	{ "name": "results_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_7", "role": "address0" }} , 
 	{ "name": "results_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "ce0" }} , 
 	{ "name": "results_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "we0" }} , 
 	{ "name": "results_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_7", "role": "d0" }} , 
 	{ "name": "results_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_7", "role": "q0" }} , 
 	{ "name": "results_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results", "role": "address0" }} , 
 	{ "name": "results_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "ce0" }} , 
 	{ "name": "results_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "we0" }} , 
 	{ "name": "results_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15", "17"],
		"CDFG" : "histogram",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8205", "EstimateLatencyMax" : "8205",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_histogram_Pipeline_loop_0_fu_68", "Port" : "array_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_histogram_Pipeline_loop_1_fu_76", "Port" : "array_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_histogram_Pipeline_loop_2_fu_84", "Port" : "array_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_histogram_Pipeline_loop_3_fu_92", "Port" : "array_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_histogram_Pipeline_loop_4_fu_100", "Port" : "array_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_histogram_Pipeline_loop_5_fu_108", "Port" : "array_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_histogram_Pipeline_loop_6_fu_116", "Port" : "array_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_histogram_Pipeline_loop_7_fu_124", "Port" : "array_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_histogram_Pipeline_loop_0_fu_68", "Port" : "results_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_histogram_Pipeline_loop_1_fu_76", "Port" : "results_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_histogram_Pipeline_loop_2_fu_84", "Port" : "results_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_histogram_Pipeline_loop_3_fu_92", "Port" : "results_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_4", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "9", "SubInstance" : "grp_histogram_Pipeline_loop_4_fu_100", "Port" : "results_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_5", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "11", "SubInstance" : "grp_histogram_Pipeline_loop_5_fu_108", "Port" : "results_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_6", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "13", "SubInstance" : "grp_histogram_Pipeline_loop_6_fu_116", "Port" : "results_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results_7", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "15", "SubInstance" : "grp_histogram_Pipeline_loop_7_fu_124", "Port" : "results_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_histogram_Pipeline_loop_8_fu_132", "Port" : "results", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_0_fu_68", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "histogram_Pipeline_loop_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_0_fu_68.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_1_fu_76", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "histogram_Pipeline_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_1_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_2_fu_84", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "histogram_Pipeline_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_2_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_3_fu_92", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "histogram_Pipeline_loop_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_3_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_4_fu_100", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "histogram_Pipeline_loop_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_4_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_5_fu_108", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "histogram_Pipeline_loop_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_5_fu_108.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_6_fu_116", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "histogram_Pipeline_loop_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_6_fu_116.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_7_fu_124", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "histogram_Pipeline_loop_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8194", "EstimateLatencyMax" : "8194",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_7_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_8_fu_132", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "histogram_Pipeline_loop_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_histogram_Pipeline_loop_8_fu_132.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"}]}


set ArgLastReadFirstWriteLatency {
	histogram {
		array_0 {Type I LastRead 0 FirstWrite -1}
		array_1 {Type I LastRead 0 FirstWrite -1}
		array_2 {Type I LastRead 0 FirstWrite -1}
		array_3 {Type I LastRead 0 FirstWrite -1}
		array_4 {Type I LastRead 0 FirstWrite -1}
		array_5 {Type I LastRead 0 FirstWrite -1}
		array_6 {Type I LastRead 0 FirstWrite -1}
		array_7 {Type I LastRead 0 FirstWrite -1}
		results_0 {Type IO LastRead 2 FirstWrite -1}
		results_1 {Type IO LastRead 2 FirstWrite -1}
		results_2 {Type IO LastRead 2 FirstWrite -1}
		results_3 {Type IO LastRead 2 FirstWrite -1}
		results_4 {Type IO LastRead 2 FirstWrite -1}
		results_5 {Type IO LastRead 2 FirstWrite -1}
		results_6 {Type IO LastRead 2 FirstWrite -1}
		results_7 {Type IO LastRead 2 FirstWrite -1}
		results {Type O LastRead -1 FirstWrite 2}}
	histogram_Pipeline_loop_0 {
		results_0 {Type IO LastRead 2 FirstWrite 2}
		array_0 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_1 {
		results_1 {Type IO LastRead 2 FirstWrite 2}
		array_1 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_2 {
		results_2 {Type IO LastRead 2 FirstWrite 2}
		array_2 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_3 {
		results_3 {Type IO LastRead 2 FirstWrite 2}
		array_3 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_4 {
		results_4 {Type IO LastRead 2 FirstWrite 2}
		array_4 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_5 {
		results_5 {Type IO LastRead 2 FirstWrite 2}
		array_5 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_6 {
		results_6 {Type IO LastRead 2 FirstWrite 2}
		array_6 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_7 {
		results_7 {Type IO LastRead 2 FirstWrite 2}
		array_7 {Type I LastRead 0 FirstWrite -1}}
	histogram_Pipeline_loop_8 {
		results_0 {Type I LastRead 1 FirstWrite -1}
		results_1 {Type I LastRead 1 FirstWrite -1}
		results_2 {Type I LastRead 1 FirstWrite -1}
		results_3 {Type I LastRead 1 FirstWrite -1}
		results_4 {Type I LastRead 1 FirstWrite -1}
		results_5 {Type I LastRead 1 FirstWrite -1}
		results_6 {Type I LastRead 0 FirstWrite -1}
		results_7 {Type I LastRead 0 FirstWrite -1}
		results {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8205", "Max" : "8205"}
	, {"Name" : "Interval", "Min" : "8206", "Max" : "8206"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	array_0 { ap_memory {  { array_0_address0 mem_address 1 12 }  { array_0_ce0 mem_ce 1 1 }  { array_0_q0 mem_dout 0 32 } } }
	array_1 { ap_memory {  { array_1_address0 mem_address 1 12 }  { array_1_ce0 mem_ce 1 1 }  { array_1_q0 mem_dout 0 32 } } }
	array_2 { ap_memory {  { array_2_address0 mem_address 1 12 }  { array_2_ce0 mem_ce 1 1 }  { array_2_q0 mem_dout 0 32 } } }
	array_3 { ap_memory {  { array_3_address0 mem_address 1 12 }  { array_3_ce0 mem_ce 1 1 }  { array_3_q0 mem_dout 0 32 } } }
	array_4 { ap_memory {  { array_4_address0 mem_address 1 12 }  { array_4_ce0 mem_ce 1 1 }  { array_4_q0 mem_dout 0 32 } } }
	array_5 { ap_memory {  { array_5_address0 mem_address 1 12 }  { array_5_ce0 mem_ce 1 1 }  { array_5_q0 mem_dout 0 32 } } }
	array_6 { ap_memory {  { array_6_address0 mem_address 1 12 }  { array_6_ce0 mem_ce 1 1 }  { array_6_q0 mem_dout 0 32 } } }
	array_7 { ap_memory {  { array_7_address0 mem_address 1 12 }  { array_7_ce0 mem_ce 1 1 }  { array_7_q0 mem_dout 0 32 } } }
	results_0 { ap_memory {  { results_0_address0 mem_address 1 3 }  { results_0_ce0 mem_ce 1 1 }  { results_0_we0 mem_we 1 1 }  { results_0_d0 mem_din 1 32 }  { results_0_q0 mem_dout 0 32 } } }
	results_1 { ap_memory {  { results_1_address0 mem_address 1 3 }  { results_1_ce0 mem_ce 1 1 }  { results_1_we0 mem_we 1 1 }  { results_1_d0 mem_din 1 32 }  { results_1_q0 mem_dout 0 32 } } }
	results_2 { ap_memory {  { results_2_address0 mem_address 1 3 }  { results_2_ce0 mem_ce 1 1 }  { results_2_we0 mem_we 1 1 }  { results_2_d0 mem_din 1 32 }  { results_2_q0 mem_dout 0 32 } } }
	results_3 { ap_memory {  { results_3_address0 mem_address 1 3 }  { results_3_ce0 mem_ce 1 1 }  { results_3_we0 mem_we 1 1 }  { results_3_d0 mem_din 1 32 }  { results_3_q0 mem_dout 0 32 } } }
	results_4 { ap_memory {  { results_4_address0 mem_address 1 3 }  { results_4_ce0 mem_ce 1 1 }  { results_4_we0 mem_we 1 1 }  { results_4_d0 mem_din 1 32 }  { results_4_q0 mem_dout 0 32 } } }
	results_5 { ap_memory {  { results_5_address0 mem_address 1 3 }  { results_5_ce0 mem_ce 1 1 }  { results_5_we0 mem_we 1 1 }  { results_5_d0 mem_din 1 32 }  { results_5_q0 mem_dout 0 32 } } }
	results_6 { ap_memory {  { results_6_address0 mem_address 1 3 }  { results_6_ce0 mem_ce 1 1 }  { results_6_we0 mem_we 1 1 }  { results_6_d0 mem_din 1 32 }  { results_6_q0 mem_dout 0 32 } } }
	results_7 { ap_memory {  { results_7_address0 mem_address 1 3 }  { results_7_ce0 mem_ce 1 1 }  { results_7_we0 mem_we 1 1 }  { results_7_d0 mem_din 1 32 }  { results_7_q0 mem_dout 0 32 } } }
	results { ap_memory {  { results_address0 mem_address 1 3 }  { results_ce0 mem_ce 1 1 }  { results_we0 mem_we 1 1 }  { results_d0 mem_din 1 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
