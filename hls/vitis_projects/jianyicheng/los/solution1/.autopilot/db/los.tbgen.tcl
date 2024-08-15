set moduleName los
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
set C_modelName {los}
set C_modelType { void 0 }
set C_modelArgList {
	{ obstacles_0 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_1 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_2 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_3 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_4 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_5 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_6 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ obstacles_7 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ results_0 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_1 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_2 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_3 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_4 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_5 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_6 int 1 regular {array 1024 { 0 3 } 0 1 }  }
	{ results_7 int 1 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "obstacles_0", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_2", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_4", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_5", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_6", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_7", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "results_0", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_2", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_4", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_5", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_6", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_7", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
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
	{ obstacles_0_q0 sc_in sc_lv 1 signal 0 } 
	{ obstacles_1_address0 sc_out sc_lv 10 signal 1 } 
	{ obstacles_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ obstacles_1_q0 sc_in sc_lv 1 signal 1 } 
	{ obstacles_2_address0 sc_out sc_lv 10 signal 2 } 
	{ obstacles_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ obstacles_2_q0 sc_in sc_lv 1 signal 2 } 
	{ obstacles_3_address0 sc_out sc_lv 10 signal 3 } 
	{ obstacles_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ obstacles_3_q0 sc_in sc_lv 1 signal 3 } 
	{ obstacles_4_address0 sc_out sc_lv 10 signal 4 } 
	{ obstacles_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ obstacles_4_q0 sc_in sc_lv 1 signal 4 } 
	{ obstacles_5_address0 sc_out sc_lv 10 signal 5 } 
	{ obstacles_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ obstacles_5_q0 sc_in sc_lv 1 signal 5 } 
	{ obstacles_6_address0 sc_out sc_lv 10 signal 6 } 
	{ obstacles_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ obstacles_6_q0 sc_in sc_lv 1 signal 6 } 
	{ obstacles_7_address0 sc_out sc_lv 10 signal 7 } 
	{ obstacles_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ obstacles_7_q0 sc_in sc_lv 1 signal 7 } 
	{ results_0_address0 sc_out sc_lv 10 signal 8 } 
	{ results_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ results_0_we0 sc_out sc_logic 1 signal 8 } 
	{ results_0_d0 sc_out sc_lv 1 signal 8 } 
	{ results_1_address0 sc_out sc_lv 10 signal 9 } 
	{ results_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ results_1_we0 sc_out sc_logic 1 signal 9 } 
	{ results_1_d0 sc_out sc_lv 1 signal 9 } 
	{ results_2_address0 sc_out sc_lv 10 signal 10 } 
	{ results_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ results_2_we0 sc_out sc_logic 1 signal 10 } 
	{ results_2_d0 sc_out sc_lv 1 signal 10 } 
	{ results_3_address0 sc_out sc_lv 10 signal 11 } 
	{ results_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ results_3_we0 sc_out sc_logic 1 signal 11 } 
	{ results_3_d0 sc_out sc_lv 1 signal 11 } 
	{ results_4_address0 sc_out sc_lv 10 signal 12 } 
	{ results_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ results_4_we0 sc_out sc_logic 1 signal 12 } 
	{ results_4_d0 sc_out sc_lv 1 signal 12 } 
	{ results_5_address0 sc_out sc_lv 10 signal 13 } 
	{ results_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ results_5_we0 sc_out sc_logic 1 signal 13 } 
	{ results_5_d0 sc_out sc_lv 1 signal 13 } 
	{ results_6_address0 sc_out sc_lv 10 signal 14 } 
	{ results_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ results_6_we0 sc_out sc_logic 1 signal 14 } 
	{ results_6_d0 sc_out sc_lv 1 signal 14 } 
	{ results_7_address0 sc_out sc_lv 10 signal 15 } 
	{ results_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ results_7_we0 sc_out sc_logic 1 signal 15 } 
	{ results_7_d0 sc_out sc_lv 1 signal 15 } 
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
 	{ "name": "obstacles_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_0", "role": "q0" }} , 
 	{ "name": "obstacles_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_1", "role": "address0" }} , 
 	{ "name": "obstacles_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_1", "role": "ce0" }} , 
 	{ "name": "obstacles_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_1", "role": "q0" }} , 
 	{ "name": "obstacles_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_2", "role": "address0" }} , 
 	{ "name": "obstacles_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_2", "role": "ce0" }} , 
 	{ "name": "obstacles_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_2", "role": "q0" }} , 
 	{ "name": "obstacles_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_3", "role": "address0" }} , 
 	{ "name": "obstacles_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_3", "role": "ce0" }} , 
 	{ "name": "obstacles_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_3", "role": "q0" }} , 
 	{ "name": "obstacles_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_4", "role": "address0" }} , 
 	{ "name": "obstacles_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_4", "role": "ce0" }} , 
 	{ "name": "obstacles_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_4", "role": "q0" }} , 
 	{ "name": "obstacles_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_5", "role": "address0" }} , 
 	{ "name": "obstacles_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_5", "role": "ce0" }} , 
 	{ "name": "obstacles_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_5", "role": "q0" }} , 
 	{ "name": "obstacles_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_6", "role": "address0" }} , 
 	{ "name": "obstacles_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_6", "role": "ce0" }} , 
 	{ "name": "obstacles_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_6", "role": "q0" }} , 
 	{ "name": "obstacles_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_7", "role": "address0" }} , 
 	{ "name": "obstacles_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_7", "role": "ce0" }} , 
 	{ "name": "obstacles_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_7", "role": "q0" }} , 
 	{ "name": "results_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_0", "role": "address0" }} , 
 	{ "name": "results_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "ce0" }} , 
 	{ "name": "results_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "we0" }} , 
 	{ "name": "results_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "d0" }} , 
 	{ "name": "results_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_1", "role": "address0" }} , 
 	{ "name": "results_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "ce0" }} , 
 	{ "name": "results_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "we0" }} , 
 	{ "name": "results_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "d0" }} , 
 	{ "name": "results_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_2", "role": "address0" }} , 
 	{ "name": "results_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "ce0" }} , 
 	{ "name": "results_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "we0" }} , 
 	{ "name": "results_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "d0" }} , 
 	{ "name": "results_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_3", "role": "address0" }} , 
 	{ "name": "results_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "ce0" }} , 
 	{ "name": "results_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "we0" }} , 
 	{ "name": "results_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "d0" }} , 
 	{ "name": "results_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_4", "role": "address0" }} , 
 	{ "name": "results_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "ce0" }} , 
 	{ "name": "results_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "we0" }} , 
 	{ "name": "results_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "d0" }} , 
 	{ "name": "results_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_5", "role": "address0" }} , 
 	{ "name": "results_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "ce0" }} , 
 	{ "name": "results_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "we0" }} , 
 	{ "name": "results_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "d0" }} , 
 	{ "name": "results_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_6", "role": "address0" }} , 
 	{ "name": "results_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "ce0" }} , 
 	{ "name": "results_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "we0" }} , 
 	{ "name": "results_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "d0" }} , 
 	{ "name": "results_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "results_7", "role": "address0" }} , 
 	{ "name": "results_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "ce0" }} , 
 	{ "name": "results_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "we0" }} , 
 	{ "name": "results_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "d0" }}  ]}

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
					{"ID" : "1", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_58_2_fu_354", "Port" : "obstacles_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "obstacles_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_104_4_fu_368", "Port" : "obstacles_1", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "obstacles_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_151_6_fu_382", "Port" : "obstacles_2", "Inst_start_state" : "19", "Inst_end_state" : "20"}]},
			{"Name" : "obstacles_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_198_8_fu_396", "Port" : "obstacles_3", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "obstacles_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_245_10_fu_410", "Port" : "obstacles_4", "Inst_start_state" : "33", "Inst_end_state" : "34"}]},
			{"Name" : "obstacles_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_292_12_fu_424", "Port" : "obstacles_5", "Inst_start_state" : "40", "Inst_end_state" : "41"}]},
			{"Name" : "obstacles_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_339_14_fu_438", "Port" : "obstacles_6", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "obstacles_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_los_Pipeline_VITIS_LOOP_386_16_fu_452", "Port" : "obstacles_7", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0_VITIS_LOOP_35_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_1_VITIS_LOOP_81_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_2_VITIS_LOOP_128_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_3_VITIS_LOOP_175_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state23", "LastState" : ["ap_ST_fsm_state29"], "QuitState" : ["ap_ST_fsm_state23"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state30"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_4_VITIS_LOOP_222_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state30", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state30"], "PreState" : ["ap_ST_fsm_state23"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_5_VITIS_LOOP_269_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state37", "LastState" : ["ap_ST_fsm_state43"], "QuitState" : ["ap_ST_fsm_state37"], "PreState" : ["ap_ST_fsm_state30"], "PostState" : ["ap_ST_fsm_state44"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_6_VITIS_LOOP_316_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state44", "LastState" : ["ap_ST_fsm_state50"], "QuitState" : ["ap_ST_fsm_state44"], "PreState" : ["ap_ST_fsm_state37"], "PostState" : ["ap_ST_fsm_state51"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_7_VITIS_LOOP_363_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state51", "LastState" : ["ap_ST_fsm_state57"], "QuitState" : ["ap_ST_fsm_state51"], "PreState" : ["ap_ST_fsm_state44"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_58_2_fu_354", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_58_2",
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
			{"Name" : "sext_ln56", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln34_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln45", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln34", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln34_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln39", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln40_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_58_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_58_2_fu_354.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_104_4_fu_368", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_104_4",
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
			{"Name" : "sext_ln102", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln80_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln91", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln80", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln80_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln85", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln86_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_1_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_104_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_104_4_fu_368.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_151_6_fu_382", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_151_6",
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
			{"Name" : "sext_ln149", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln127_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln138", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln127", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln127_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln132", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln133_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_2_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_151_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_151_6_fu_382.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_198_8_fu_396", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_198_8",
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
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln185", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln179", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln180_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_3_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_198_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_198_8_fu_396.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_245_10_fu_410", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_245_10",
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
			{"Name" : "sext_ln243", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln221_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln232", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln221", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln221_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln226", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln227_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_4_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_245_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_245_10_fu_410.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_292_12_fu_424", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_292_12",
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
			{"Name" : "zext_ln268_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln279", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln290", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln268", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln268_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln273", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln274_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_5_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_292_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_292_12_fu_424.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_339_14_fu_438", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_339_14",
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
			{"Name" : "zext_ln326", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln315_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln337", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln315", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln315_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln321", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln320", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_6_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_339_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_339_14_fu_438.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_386_16_fu_452", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_386_16",
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
			{"Name" : "zext_ln373", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln362_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln384", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln362", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln362_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln368", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln367", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_7_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_386_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_los_Pipeline_VITIS_LOOP_386_16_fu_452.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"}]}


set ArgLastReadFirstWriteLatency {
	los {
		obstacles_0 {Type I LastRead 1 FirstWrite -1}
		obstacles_1 {Type I LastRead 1 FirstWrite -1}
		obstacles_2 {Type I LastRead 1 FirstWrite -1}
		obstacles_3 {Type I LastRead 1 FirstWrite -1}
		obstacles_4 {Type I LastRead 1 FirstWrite -1}
		obstacles_5 {Type I LastRead 1 FirstWrite -1}
		obstacles_6 {Type I LastRead 1 FirstWrite -1}
		obstacles_7 {Type I LastRead 1 FirstWrite -1}
		results_0 {Type O LastRead -1 FirstWrite 7}
		results_1 {Type O LastRead -1 FirstWrite 8}
		results_2 {Type O LastRead -1 FirstWrite 9}
		results_3 {Type O LastRead -1 FirstWrite 10}
		results_4 {Type O LastRead -1 FirstWrite 11}
		results_5 {Type O LastRead -1 FirstWrite 12}
		results_6 {Type O LastRead -1 FirstWrite 13}
		results_7 {Type O LastRead -1 FirstWrite 14}}
	los_Pipeline_VITIS_LOOP_58_2 {
		sext_ln56 {Type I LastRead 0 FirstWrite -1}
		zext_ln34_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln45 {Type I LastRead 0 FirstWrite -1}
		sext_ln34 {Type I LastRead 0 FirstWrite -1}
		zext_ln34_1 {Type I LastRead 0 FirstWrite -1}
		select_ln39 {Type I LastRead 0 FirstWrite -1}
		sext_ln40_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_0 {Type I LastRead 1 FirstWrite -1}
		sight_0_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_104_4 {
		sext_ln102 {Type I LastRead 0 FirstWrite -1}
		zext_ln80_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln91 {Type I LastRead 0 FirstWrite -1}
		sext_ln80 {Type I LastRead 0 FirstWrite -1}
		zext_ln80_1 {Type I LastRead 0 FirstWrite -1}
		select_ln85 {Type I LastRead 0 FirstWrite -1}
		sext_ln86_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_1 {Type I LastRead 1 FirstWrite -1}
		sight_1_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_151_6 {
		sext_ln149 {Type I LastRead 0 FirstWrite -1}
		zext_ln127_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln138 {Type I LastRead 0 FirstWrite -1}
		sext_ln127 {Type I LastRead 0 FirstWrite -1}
		zext_ln127_1 {Type I LastRead 0 FirstWrite -1}
		select_ln132 {Type I LastRead 0 FirstWrite -1}
		sext_ln133_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_2 {Type I LastRead 1 FirstWrite -1}
		sight_2_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_198_8 {
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		zext_ln174_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln185 {Type I LastRead 0 FirstWrite -1}
		sext_ln174 {Type I LastRead 0 FirstWrite -1}
		zext_ln174_1 {Type I LastRead 0 FirstWrite -1}
		select_ln179 {Type I LastRead 0 FirstWrite -1}
		sext_ln180_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_3 {Type I LastRead 1 FirstWrite -1}
		sight_3_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_245_10 {
		sext_ln243 {Type I LastRead 0 FirstWrite -1}
		zext_ln221_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln232 {Type I LastRead 0 FirstWrite -1}
		sext_ln221 {Type I LastRead 0 FirstWrite -1}
		zext_ln221_1 {Type I LastRead 0 FirstWrite -1}
		select_ln226 {Type I LastRead 0 FirstWrite -1}
		sext_ln227_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_4 {Type I LastRead 1 FirstWrite -1}
		sight_4_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_292_12 {
		zext_ln268_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln279 {Type I LastRead 0 FirstWrite -1}
		sext_ln290 {Type I LastRead 0 FirstWrite -1}
		sext_ln268 {Type I LastRead 0 FirstWrite -1}
		zext_ln268_1 {Type I LastRead 0 FirstWrite -1}
		select_ln273 {Type I LastRead 0 FirstWrite -1}
		sext_ln274_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_5 {Type I LastRead 1 FirstWrite -1}
		sight_5_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_339_14 {
		zext_ln326 {Type I LastRead 0 FirstWrite -1}
		zext_ln315_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln337 {Type I LastRead 0 FirstWrite -1}
		sext_ln315 {Type I LastRead 0 FirstWrite -1}
		zext_ln315_1 {Type I LastRead 0 FirstWrite -1}
		select_ln321 {Type I LastRead 0 FirstWrite -1}
		sext_ln320 {Type I LastRead 0 FirstWrite -1}
		obstacles_6 {Type I LastRead 1 FirstWrite -1}
		sight_6_1_out {Type O LastRead -1 FirstWrite 4}}
	los_Pipeline_VITIS_LOOP_386_16 {
		zext_ln373 {Type I LastRead 0 FirstWrite -1}
		zext_ln362_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln384 {Type I LastRead 0 FirstWrite -1}
		sext_ln362 {Type I LastRead 0 FirstWrite -1}
		zext_ln362_1 {Type I LastRead 0 FirstWrite -1}
		select_ln368 {Type I LastRead 0 FirstWrite -1}
		sext_ln367 {Type I LastRead 0 FirstWrite -1}
		obstacles_7 {Type I LastRead 1 FirstWrite -1}
		sight_7_1_out {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	obstacles_0 { ap_memory {  { obstacles_0_address0 mem_address 1 10 }  { obstacles_0_ce0 mem_ce 1 1 }  { obstacles_0_q0 mem_dout 0 1 } } }
	obstacles_1 { ap_memory {  { obstacles_1_address0 mem_address 1 10 }  { obstacles_1_ce0 mem_ce 1 1 }  { obstacles_1_q0 mem_dout 0 1 } } }
	obstacles_2 { ap_memory {  { obstacles_2_address0 mem_address 1 10 }  { obstacles_2_ce0 mem_ce 1 1 }  { obstacles_2_q0 mem_dout 0 1 } } }
	obstacles_3 { ap_memory {  { obstacles_3_address0 mem_address 1 10 }  { obstacles_3_ce0 mem_ce 1 1 }  { obstacles_3_q0 mem_dout 0 1 } } }
	obstacles_4 { ap_memory {  { obstacles_4_address0 mem_address 1 10 }  { obstacles_4_ce0 mem_ce 1 1 }  { obstacles_4_q0 mem_dout 0 1 } } }
	obstacles_5 { ap_memory {  { obstacles_5_address0 mem_address 1 10 }  { obstacles_5_ce0 mem_ce 1 1 }  { obstacles_5_q0 mem_dout 0 1 } } }
	obstacles_6 { ap_memory {  { obstacles_6_address0 mem_address 1 10 }  { obstacles_6_ce0 mem_ce 1 1 }  { obstacles_6_q0 mem_dout 0 1 } } }
	obstacles_7 { ap_memory {  { obstacles_7_address0 mem_address 1 10 }  { obstacles_7_ce0 mem_ce 1 1 }  { obstacles_7_q0 mem_dout 0 1 } } }
	results_0 { ap_memory {  { results_0_address0 mem_address 1 10 }  { results_0_ce0 mem_ce 1 1 }  { results_0_we0 mem_we 1 1 }  { results_0_d0 mem_din 1 1 } } }
	results_1 { ap_memory {  { results_1_address0 mem_address 1 10 }  { results_1_ce0 mem_ce 1 1 }  { results_1_we0 mem_we 1 1 }  { results_1_d0 mem_din 1 1 } } }
	results_2 { ap_memory {  { results_2_address0 mem_address 1 10 }  { results_2_ce0 mem_ce 1 1 }  { results_2_we0 mem_we 1 1 }  { results_2_d0 mem_din 1 1 } } }
	results_3 { ap_memory {  { results_3_address0 mem_address 1 10 }  { results_3_ce0 mem_ce 1 1 }  { results_3_we0 mem_we 1 1 }  { results_3_d0 mem_din 1 1 } } }
	results_4 { ap_memory {  { results_4_address0 mem_address 1 10 }  { results_4_ce0 mem_ce 1 1 }  { results_4_we0 mem_we 1 1 }  { results_4_d0 mem_din 1 1 } } }
	results_5 { ap_memory {  { results_5_address0 mem_address 1 10 }  { results_5_ce0 mem_ce 1 1 }  { results_5_we0 mem_we 1 1 }  { results_5_d0 mem_din 1 1 } } }
	results_6 { ap_memory {  { results_6_address0 mem_address 1 10 }  { results_6_ce0 mem_ce 1 1 }  { results_6_we0 mem_we 1 1 }  { results_6_d0 mem_din 1 1 } } }
	results_7 { ap_memory {  { results_7_address0 mem_address 1 10 }  { results_7_ce0 mem_ce 1 1 }  { results_7_we0 mem_we 1 1 }  { results_7_d0 mem_din 1 1 } } }
}
