set moduleName los
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
set C_modelName {los}
set C_modelType { void 0 }
set C_modelArgList {
	{ obstacles_0 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_1 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_2 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_3 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_4 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_5 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_6 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_7 int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ results_0 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_1 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_2 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_3 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_4 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_5 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_6 int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_7 int 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "obstacles_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "results_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 62
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ obstacles_0_address0 sc_out sc_lv 10 signal 0 } 
	{ obstacles_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ obstacles_0_q0 sc_in sc_lv 32 signal 0 } 
	{ obstacles_1_address0 sc_out sc_lv 10 signal 1 } 
	{ obstacles_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ obstacles_1_q0 sc_in sc_lv 32 signal 1 } 
	{ obstacles_2_address0 sc_out sc_lv 10 signal 2 } 
	{ obstacles_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ obstacles_2_q0 sc_in sc_lv 32 signal 2 } 
	{ obstacles_3_address0 sc_out sc_lv 10 signal 3 } 
	{ obstacles_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ obstacles_3_q0 sc_in sc_lv 32 signal 3 } 
	{ obstacles_4_address0 sc_out sc_lv 10 signal 4 } 
	{ obstacles_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ obstacles_4_q0 sc_in sc_lv 32 signal 4 } 
	{ obstacles_5_address0 sc_out sc_lv 10 signal 5 } 
	{ obstacles_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ obstacles_5_q0 sc_in sc_lv 32 signal 5 } 
	{ obstacles_6_address0 sc_out sc_lv 10 signal 6 } 
	{ obstacles_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ obstacles_6_q0 sc_in sc_lv 32 signal 6 } 
	{ obstacles_7_address0 sc_out sc_lv 10 signal 7 } 
	{ obstacles_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ obstacles_7_q0 sc_in sc_lv 32 signal 7 } 
	{ results_0_address0 sc_out sc_lv 10 signal 8 } 
	{ results_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ results_0_we0 sc_out sc_logic 1 signal 8 } 
	{ results_0_d0 sc_out sc_lv 32 signal 8 } 
	{ results_1_address0 sc_out sc_lv 10 signal 9 } 
	{ results_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ results_1_we0 sc_out sc_logic 1 signal 9 } 
	{ results_1_d0 sc_out sc_lv 32 signal 9 } 
	{ results_2_address0 sc_out sc_lv 10 signal 10 } 
	{ results_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ results_2_we0 sc_out sc_logic 1 signal 10 } 
	{ results_2_d0 sc_out sc_lv 32 signal 10 } 
	{ results_3_address0 sc_out sc_lv 10 signal 11 } 
	{ results_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ results_3_we0 sc_out sc_logic 1 signal 11 } 
	{ results_3_d0 sc_out sc_lv 32 signal 11 } 
	{ results_4_address0 sc_out sc_lv 10 signal 12 } 
	{ results_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ results_4_we0 sc_out sc_logic 1 signal 12 } 
	{ results_4_d0 sc_out sc_lv 32 signal 12 } 
	{ results_5_address0 sc_out sc_lv 10 signal 13 } 
	{ results_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ results_5_we0 sc_out sc_logic 1 signal 13 } 
	{ results_5_d0 sc_out sc_lv 32 signal 13 } 
	{ results_6_address0 sc_out sc_lv 10 signal 14 } 
	{ results_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ results_6_we0 sc_out sc_logic 1 signal 14 } 
	{ results_6_d0 sc_out sc_lv 32 signal 14 } 
	{ results_7_address0 sc_out sc_lv 10 signal 15 } 
	{ results_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ results_7_we0 sc_out sc_logic 1 signal 15 } 
	{ results_7_d0 sc_out sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "obstacles_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_0", "role": "address0" }} , 
 	{ "name": "obstacles_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_0", "role": "ce0" }} , 
 	{ "name": "obstacles_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_0", "role": "q0" }} , 
 	{ "name": "obstacles_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_1", "role": "address0" }} , 
 	{ "name": "obstacles_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_1", "role": "ce0" }} , 
 	{ "name": "obstacles_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_1", "role": "q0" }} , 
 	{ "name": "obstacles_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_2", "role": "address0" }} , 
 	{ "name": "obstacles_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_2", "role": "ce0" }} , 
 	{ "name": "obstacles_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_2", "role": "q0" }} , 
 	{ "name": "obstacles_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_3", "role": "address0" }} , 
 	{ "name": "obstacles_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_3", "role": "ce0" }} , 
 	{ "name": "obstacles_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_3", "role": "q0" }} , 
 	{ "name": "obstacles_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_4", "role": "address0" }} , 
 	{ "name": "obstacles_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_4", "role": "ce0" }} , 
 	{ "name": "obstacles_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_4", "role": "q0" }} , 
 	{ "name": "obstacles_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_5", "role": "address0" }} , 
 	{ "name": "obstacles_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_5", "role": "ce0" }} , 
 	{ "name": "obstacles_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_5", "role": "q0" }} , 
 	{ "name": "obstacles_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_6", "role": "address0" }} , 
 	{ "name": "obstacles_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_6", "role": "ce0" }} , 
 	{ "name": "obstacles_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_6", "role": "q0" }} , 
 	{ "name": "obstacles_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_7", "role": "address0" }} , 
 	{ "name": "obstacles_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_7", "role": "ce0" }} , 
 	{ "name": "obstacles_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "obstacles_7", "role": "q0" }} , 
 	{ "name": "results_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_0", "role": "address0" }} , 
 	{ "name": "results_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "ce0" }} , 
 	{ "name": "results_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "we0" }} , 
 	{ "name": "results_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_0", "role": "d0" }} , 
 	{ "name": "results_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_1", "role": "address0" }} , 
 	{ "name": "results_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "ce0" }} , 
 	{ "name": "results_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "we0" }} , 
 	{ "name": "results_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_1", "role": "d0" }} , 
 	{ "name": "results_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_2", "role": "address0" }} , 
 	{ "name": "results_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "ce0" }} , 
 	{ "name": "results_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "we0" }} , 
 	{ "name": "results_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_2", "role": "d0" }} , 
 	{ "name": "results_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_3", "role": "address0" }} , 
 	{ "name": "results_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "ce0" }} , 
 	{ "name": "results_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "we0" }} , 
 	{ "name": "results_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_3", "role": "d0" }} , 
 	{ "name": "results_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_4", "role": "address0" }} , 
 	{ "name": "results_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "ce0" }} , 
 	{ "name": "results_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "we0" }} , 
 	{ "name": "results_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_4", "role": "d0" }} , 
 	{ "name": "results_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_5", "role": "address0" }} , 
 	{ "name": "results_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "ce0" }} , 
 	{ "name": "results_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "we0" }} , 
 	{ "name": "results_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_5", "role": "d0" }} , 
 	{ "name": "results_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_6", "role": "address0" }} , 
 	{ "name": "results_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "ce0" }} , 
 	{ "name": "results_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "we0" }} , 
 	{ "name": "results_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_6", "role": "d0" }} , 
 	{ "name": "results_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_7", "role": "address0" }} , 
 	{ "name": "results_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "ce0" }} , 
 	{ "name": "results_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "we0" }} , 
 	{ "name": "results_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_7", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15"],
		"CDFG" : "los",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "obstacles_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_48_2_fu_368", "Port" : "obstacles_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "obstacles_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_94_4_fu_382", "Port" : "obstacles_1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "obstacles_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_141_6_fu_396", "Port" : "obstacles_2", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "obstacles_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_188_8_fu_410", "Port" : "obstacles_3", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "obstacles_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_235_10_fu_424", "Port" : "obstacles_4", "Inst_start_state" : "19", "Inst_end_state" : "20"}]},
			{"Name" : "obstacles_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_282_12_fu_438", "Port" : "obstacles_5", "Inst_start_state" : "23", "Inst_end_state" : "24"}]},
			{"Name" : "obstacles_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_329_14_fu_452", "Port" : "obstacles_6", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "obstacles_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_376_16_fu_466", "Port" : "obstacles_7", "Inst_start_state" : "31", "Inst_end_state" : "32"}]},
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0_VITIS_LOOP_25_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_1_VITIS_LOOP_71_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_2_VITIS_LOOP_118_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state14"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_3_VITIS_LOOP_165_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_4_VITIS_LOOP_212_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state14"], "PostState" : ["ap_ST_fsm_state22"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_5_VITIS_LOOP_259_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_6_VITIS_LOOP_306_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state29"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state22"], "PostState" : ["ap_ST_fsm_state30"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_7_VITIS_LOOP_353_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "33", "FirstState" : "ap_ST_fsm_state30", "LastState" : ["ap_ST_fsm_state33"], "QuitState" : ["ap_ST_fsm_state30"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_48_2_fu_368", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_48_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln46", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln24_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln35", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln24", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln24_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln29", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln30_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_48_2_fu_368.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_94_4_fu_382", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_94_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln92", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln70_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln81", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln70", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln70_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln75", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln76_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_1_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_94_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_94_4_fu_382.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_141_6_fu_396", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_141_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln139", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln117_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln128", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln117_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln122", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln123_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_2_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_141_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_141_6_fu_396.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_188_8_fu_410", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_188_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln186", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln164_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln175", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln164", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln164_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln169", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln170_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_3_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_188_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_188_8_fu_410.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_235_10_fu_424", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_235_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln233", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln211_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln222", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln211", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln211_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln216", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln217_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_4_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_235_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_235_10_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_282_12_fu_438", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_282_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln258_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln269", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln280", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln258", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln258_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln263", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln264_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_5_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_282_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_282_12_fu_438.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_329_14_fu_452", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_329_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln316", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln305_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln327", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln305", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln305_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln311", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln310", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_6_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_329_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_329_14_fu_452.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_376_16_fu_466", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_376_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln363", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln352_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln374", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln352", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln352_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln358", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln357", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_7_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_376_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state3", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state3_blk", "QuitState" : "ap_ST_fsm_state3", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state3_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_376_16_fu_466.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"}]}


set ArgLastReadFirstWriteLatency {
	los {
		obstacles_0 {Type I LastRead 0 FirstWrite -1}
		obstacles_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_2 {Type I LastRead 0 FirstWrite -1}
		obstacles_3 {Type I LastRead 0 FirstWrite -1}
		obstacles_4 {Type I LastRead 0 FirstWrite -1}
		obstacles_5 {Type I LastRead 0 FirstWrite -1}
		obstacles_6 {Type I LastRead 0 FirstWrite -1}
		obstacles_7 {Type I LastRead 0 FirstWrite -1}
		results_0 {Type O LastRead -1 FirstWrite 4}
		results_1 {Type O LastRead -1 FirstWrite 5}
		results_2 {Type O LastRead -1 FirstWrite 6}
		results_3 {Type O LastRead -1 FirstWrite 7}
		results_4 {Type O LastRead -1 FirstWrite 8}
		results_5 {Type O LastRead -1 FirstWrite 9}
		results_6 {Type O LastRead -1 FirstWrite 10}
		results_7 {Type O LastRead -1 FirstWrite 11}}
	los_Pipeline_VITIS_LOOP_48_2 {
		sext_ln46 {Type I LastRead 0 FirstWrite -1}
		zext_ln24_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln35 {Type I LastRead 0 FirstWrite -1}
		sext_ln24 {Type I LastRead 0 FirstWrite -1}
		zext_ln24_1 {Type I LastRead 0 FirstWrite -1}
		select_ln29 {Type I LastRead 0 FirstWrite -1}
		sext_ln30_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_0 {Type I LastRead 0 FirstWrite -1}
		sight_0_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_94_4 {
		sext_ln92 {Type I LastRead 0 FirstWrite -1}
		zext_ln70_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln81 {Type I LastRead 0 FirstWrite -1}
		sext_ln70 {Type I LastRead 0 FirstWrite -1}
		zext_ln70_1 {Type I LastRead 0 FirstWrite -1}
		select_ln75 {Type I LastRead 0 FirstWrite -1}
		sext_ln76_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_1 {Type I LastRead 0 FirstWrite -1}
		sight_1_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_141_6 {
		sext_ln139 {Type I LastRead 0 FirstWrite -1}
		zext_ln117_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln128 {Type I LastRead 0 FirstWrite -1}
		sext_ln117 {Type I LastRead 0 FirstWrite -1}
		zext_ln117_1 {Type I LastRead 0 FirstWrite -1}
		select_ln122 {Type I LastRead 0 FirstWrite -1}
		sext_ln123_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_2 {Type I LastRead 0 FirstWrite -1}
		sight_2_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_188_8 {
		sext_ln186 {Type I LastRead 0 FirstWrite -1}
		zext_ln164_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln175 {Type I LastRead 0 FirstWrite -1}
		sext_ln164 {Type I LastRead 0 FirstWrite -1}
		zext_ln164_1 {Type I LastRead 0 FirstWrite -1}
		select_ln169 {Type I LastRead 0 FirstWrite -1}
		sext_ln170_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_3 {Type I LastRead 0 FirstWrite -1}
		sight_3_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_235_10 {
		sext_ln233 {Type I LastRead 0 FirstWrite -1}
		zext_ln211_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln222 {Type I LastRead 0 FirstWrite -1}
		sext_ln211 {Type I LastRead 0 FirstWrite -1}
		zext_ln211_1 {Type I LastRead 0 FirstWrite -1}
		select_ln216 {Type I LastRead 0 FirstWrite -1}
		sext_ln217_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_4 {Type I LastRead 0 FirstWrite -1}
		sight_4_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_282_12 {
		zext_ln258_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln269 {Type I LastRead 0 FirstWrite -1}
		sext_ln280 {Type I LastRead 0 FirstWrite -1}
		sext_ln258 {Type I LastRead 0 FirstWrite -1}
		zext_ln258_1 {Type I LastRead 0 FirstWrite -1}
		select_ln263 {Type I LastRead 0 FirstWrite -1}
		sext_ln264_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_5 {Type I LastRead 0 FirstWrite -1}
		sight_5_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_329_14 {
		zext_ln316 {Type I LastRead 0 FirstWrite -1}
		zext_ln305_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln327 {Type I LastRead 0 FirstWrite -1}
		sext_ln305 {Type I LastRead 0 FirstWrite -1}
		zext_ln305_1 {Type I LastRead 0 FirstWrite -1}
		select_ln311 {Type I LastRead 0 FirstWrite -1}
		sext_ln310 {Type I LastRead 0 FirstWrite -1}
		obstacles_6 {Type I LastRead 0 FirstWrite -1}
		sight_6_1_out {Type O LastRead -1 FirstWrite 2}}
	los_Pipeline_VITIS_LOOP_376_16 {
		zext_ln363 {Type I LastRead 0 FirstWrite -1}
		zext_ln352_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln374 {Type I LastRead 0 FirstWrite -1}
		sext_ln352 {Type I LastRead 0 FirstWrite -1}
		zext_ln352_1 {Type I LastRead 0 FirstWrite -1}
		select_ln358 {Type I LastRead 0 FirstWrite -1}
		sext_ln357 {Type I LastRead 0 FirstWrite -1}
		obstacles_7 {Type I LastRead 0 FirstWrite -1}
		sight_7_1_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	obstacles_0 { ap_memory {  { obstacles_0_address0 mem_address 1 10 }  { obstacles_0_ce0 mem_ce 1 1 }  { obstacles_0_q0 mem_dout 0 32 } } }
	obstacles_1 { ap_memory {  { obstacles_1_address0 mem_address 1 10 }  { obstacles_1_ce0 mem_ce 1 1 }  { obstacles_1_q0 mem_dout 0 32 } } }
	obstacles_2 { ap_memory {  { obstacles_2_address0 mem_address 1 10 }  { obstacles_2_ce0 mem_ce 1 1 }  { obstacles_2_q0 mem_dout 0 32 } } }
	obstacles_3 { ap_memory {  { obstacles_3_address0 mem_address 1 10 }  { obstacles_3_ce0 mem_ce 1 1 }  { obstacles_3_q0 mem_dout 0 32 } } }
	obstacles_4 { ap_memory {  { obstacles_4_address0 mem_address 1 10 }  { obstacles_4_ce0 mem_ce 1 1 }  { obstacles_4_q0 mem_dout 0 32 } } }
	obstacles_5 { ap_memory {  { obstacles_5_address0 mem_address 1 10 }  { obstacles_5_ce0 mem_ce 1 1 }  { obstacles_5_q0 mem_dout 0 32 } } }
	obstacles_6 { ap_memory {  { obstacles_6_address0 mem_address 1 10 }  { obstacles_6_ce0 mem_ce 1 1 }  { obstacles_6_q0 mem_dout 0 32 } } }
	obstacles_7 { ap_memory {  { obstacles_7_address0 mem_address 1 10 }  { obstacles_7_ce0 mem_ce 1 1 }  { obstacles_7_q0 mem_dout 0 32 } } }
	results_0 { ap_memory {  { results_0_address0 mem_address 1 10 }  { results_0_ce0 mem_ce 1 1 }  { results_0_we0 mem_we 1 1 }  { results_0_d0 mem_din 1 32 } } }
	results_1 { ap_memory {  { results_1_address0 mem_address 1 10 }  { results_1_ce0 mem_ce 1 1 }  { results_1_we0 mem_we 1 1 }  { results_1_d0 mem_din 1 32 } } }
	results_2 { ap_memory {  { results_2_address0 mem_address 1 10 }  { results_2_ce0 mem_ce 1 1 }  { results_2_we0 mem_we 1 1 }  { results_2_d0 mem_din 1 32 } } }
	results_3 { ap_memory {  { results_3_address0 mem_address 1 10 }  { results_3_ce0 mem_ce 1 1 }  { results_3_we0 mem_we 1 1 }  { results_3_d0 mem_din 1 32 } } }
	results_4 { ap_memory {  { results_4_address0 mem_address 1 10 }  { results_4_ce0 mem_ce 1 1 }  { results_4_we0 mem_we 1 1 }  { results_4_d0 mem_din 1 32 } } }
	results_5 { ap_memory {  { results_5_address0 mem_address 1 10 }  { results_5_ce0 mem_ce 1 1 }  { results_5_we0 mem_we 1 1 }  { results_5_d0 mem_din 1 32 } } }
	results_6 { ap_memory {  { results_6_address0 mem_address 1 10 }  { results_6_ce0 mem_ce 1 1 }  { results_6_we0 mem_we 1 1 }  { results_6_d0 mem_din 1 32 } } }
	results_7 { ap_memory {  { results_7_address0 mem_address 1 10 }  { results_7_ce0 mem_ce 1 1 }  { results_7_we0 mem_we 1 1 }  { results_7_d0 mem_din 1 32 } } }
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
