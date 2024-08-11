set moduleName matrixtrans
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
set C_modelName {matrixtrans}
set C_modelType { void 0 }
set C_modelArgList {
	{ array_0 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_1 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_2 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_3 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_4 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_5 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_6 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_7 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ results_0 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_1 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_2 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_3 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_4 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_5 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_6 int 32 regular {array 8192 { 0 3 } 0 1 }  }
	{ results_7 int 32 regular {array 8192 { 0 3 } 0 1 }  }
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
	{ array_0_address0 sc_out sc_lv 13 signal 0 } 
	{ array_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ array_0_q0 sc_in sc_lv 32 signal 0 } 
	{ array_1_address0 sc_out sc_lv 13 signal 1 } 
	{ array_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ array_1_q0 sc_in sc_lv 32 signal 1 } 
	{ array_2_address0 sc_out sc_lv 13 signal 2 } 
	{ array_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ array_2_q0 sc_in sc_lv 32 signal 2 } 
	{ array_3_address0 sc_out sc_lv 13 signal 3 } 
	{ array_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ array_3_q0 sc_in sc_lv 32 signal 3 } 
	{ array_4_address0 sc_out sc_lv 13 signal 4 } 
	{ array_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ array_4_q0 sc_in sc_lv 32 signal 4 } 
	{ array_5_address0 sc_out sc_lv 13 signal 5 } 
	{ array_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ array_5_q0 sc_in sc_lv 32 signal 5 } 
	{ array_6_address0 sc_out sc_lv 13 signal 6 } 
	{ array_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ array_6_q0 sc_in sc_lv 32 signal 6 } 
	{ array_7_address0 sc_out sc_lv 13 signal 7 } 
	{ array_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ array_7_q0 sc_in sc_lv 32 signal 7 } 
	{ results_0_address0 sc_out sc_lv 13 signal 8 } 
	{ results_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ results_0_we0 sc_out sc_logic 1 signal 8 } 
	{ results_0_d0 sc_out sc_lv 32 signal 8 } 
	{ results_1_address0 sc_out sc_lv 13 signal 9 } 
	{ results_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ results_1_we0 sc_out sc_logic 1 signal 9 } 
	{ results_1_d0 sc_out sc_lv 32 signal 9 } 
	{ results_2_address0 sc_out sc_lv 13 signal 10 } 
	{ results_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ results_2_we0 sc_out sc_logic 1 signal 10 } 
	{ results_2_d0 sc_out sc_lv 32 signal 10 } 
	{ results_3_address0 sc_out sc_lv 13 signal 11 } 
	{ results_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ results_3_we0 sc_out sc_logic 1 signal 11 } 
	{ results_3_d0 sc_out sc_lv 32 signal 11 } 
	{ results_4_address0 sc_out sc_lv 13 signal 12 } 
	{ results_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ results_4_we0 sc_out sc_logic 1 signal 12 } 
	{ results_4_d0 sc_out sc_lv 32 signal 12 } 
	{ results_5_address0 sc_out sc_lv 13 signal 13 } 
	{ results_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ results_5_we0 sc_out sc_logic 1 signal 13 } 
	{ results_5_d0 sc_out sc_lv 32 signal 13 } 
	{ results_6_address0 sc_out sc_lv 13 signal 14 } 
	{ results_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ results_6_we0 sc_out sc_logic 1 signal 14 } 
	{ results_6_d0 sc_out sc_lv 32 signal 14 } 
	{ results_7_address0 sc_out sc_lv 13 signal 15 } 
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
 	{ "name": "array_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_0", "role": "address0" }} , 
 	{ "name": "array_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_0", "role": "ce0" }} , 
 	{ "name": "array_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_0", "role": "q0" }} , 
 	{ "name": "array_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_1", "role": "address0" }} , 
 	{ "name": "array_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_1", "role": "ce0" }} , 
 	{ "name": "array_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_1", "role": "q0" }} , 
 	{ "name": "array_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_2", "role": "address0" }} , 
 	{ "name": "array_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_2", "role": "ce0" }} , 
 	{ "name": "array_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_2", "role": "q0" }} , 
 	{ "name": "array_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_3", "role": "address0" }} , 
 	{ "name": "array_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "ce0" }} , 
 	{ "name": "array_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "q0" }} , 
 	{ "name": "array_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_4", "role": "address0" }} , 
 	{ "name": "array_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_4", "role": "ce0" }} , 
 	{ "name": "array_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_4", "role": "q0" }} , 
 	{ "name": "array_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_5", "role": "address0" }} , 
 	{ "name": "array_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "ce0" }} , 
 	{ "name": "array_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "q0" }} , 
 	{ "name": "array_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_6", "role": "address0" }} , 
 	{ "name": "array_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_6", "role": "ce0" }} , 
 	{ "name": "array_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_6", "role": "q0" }} , 
 	{ "name": "array_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_7", "role": "address0" }} , 
 	{ "name": "array_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_7", "role": "ce0" }} , 
 	{ "name": "array_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_7", "role": "q0" }} , 
 	{ "name": "results_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_0", "role": "address0" }} , 
 	{ "name": "results_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "ce0" }} , 
 	{ "name": "results_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "we0" }} , 
 	{ "name": "results_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_0", "role": "d0" }} , 
 	{ "name": "results_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_1", "role": "address0" }} , 
 	{ "name": "results_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "ce0" }} , 
 	{ "name": "results_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "we0" }} , 
 	{ "name": "results_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_1", "role": "d0" }} , 
 	{ "name": "results_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_2", "role": "address0" }} , 
 	{ "name": "results_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "ce0" }} , 
 	{ "name": "results_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "we0" }} , 
 	{ "name": "results_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_2", "role": "d0" }} , 
 	{ "name": "results_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_3", "role": "address0" }} , 
 	{ "name": "results_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "ce0" }} , 
 	{ "name": "results_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "we0" }} , 
 	{ "name": "results_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_3", "role": "d0" }} , 
 	{ "name": "results_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_4", "role": "address0" }} , 
 	{ "name": "results_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "ce0" }} , 
 	{ "name": "results_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "we0" }} , 
 	{ "name": "results_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_4", "role": "d0" }} , 
 	{ "name": "results_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_5", "role": "address0" }} , 
 	{ "name": "results_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "ce0" }} , 
 	{ "name": "results_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "we0" }} , 
 	{ "name": "results_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_5", "role": "d0" }} , 
 	{ "name": "results_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_6", "role": "address0" }} , 
 	{ "name": "results_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "ce0" }} , 
 	{ "name": "results_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "we0" }} , 
 	{ "name": "results_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_6", "role": "d0" }} , 
 	{ "name": "results_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "results_7", "role": "address0" }} , 
 	{ "name": "results_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "ce0" }} , 
 	{ "name": "results_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "we0" }} , 
 	{ "name": "results_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_7", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15"],
		"CDFG" : "matrixtrans",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8195", "EstimateLatencyMax" : "8195",
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
					{"ID" : "1", "SubInstance" : "grp_matrixtrans_Pipeline_loop_0_fu_64", "Port" : "array_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_matrixtrans_Pipeline_loop_1_fu_72", "Port" : "array_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_matrixtrans_Pipeline_loop_2_fu_80", "Port" : "array_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_matrixtrans_Pipeline_loop_3_fu_88", "Port" : "array_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_matrixtrans_Pipeline_loop_4_fu_96", "Port" : "array_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_matrixtrans_Pipeline_loop_5_fu_104", "Port" : "array_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_matrixtrans_Pipeline_loop_6_fu_112", "Port" : "array_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_matrixtrans_Pipeline_loop_7_fu_120", "Port" : "array_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_matrixtrans_Pipeline_loop_0_fu_64", "Port" : "results_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_matrixtrans_Pipeline_loop_1_fu_72", "Port" : "results_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_matrixtrans_Pipeline_loop_2_fu_80", "Port" : "results_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_matrixtrans_Pipeline_loop_3_fu_88", "Port" : "results_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_matrixtrans_Pipeline_loop_4_fu_96", "Port" : "results_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_matrixtrans_Pipeline_loop_5_fu_104", "Port" : "results_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_matrixtrans_Pipeline_loop_6_fu_112", "Port" : "results_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_matrixtrans_Pipeline_loop_7_fu_120", "Port" : "results_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_0_fu_64", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "matrixtrans_Pipeline_loop_0",
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
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_0_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_1_fu_72", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "matrixtrans_Pipeline_loop_1",
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
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_1_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_2_fu_80", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "matrixtrans_Pipeline_loop_2",
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
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_2_fu_80.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_3_fu_88", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "matrixtrans_Pipeline_loop_3",
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
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_3_fu_88.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_4_fu_96", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "matrixtrans_Pipeline_loop_4",
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
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_4_fu_96.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_5_fu_104", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "matrixtrans_Pipeline_loop_5",
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
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_5_fu_104.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_6_fu_112", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "matrixtrans_Pipeline_loop_6",
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
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_6_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_7_fu_120", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "matrixtrans_Pipeline_loop_7",
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
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixtrans_Pipeline_loop_7_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"}]}


set ArgLastReadFirstWriteLatency {
	matrixtrans {
		array_0 {Type I LastRead 0 FirstWrite -1}
		array_1 {Type I LastRead 0 FirstWrite -1}
		array_2 {Type I LastRead 0 FirstWrite -1}
		array_3 {Type I LastRead 0 FirstWrite -1}
		array_4 {Type I LastRead 0 FirstWrite -1}
		array_5 {Type I LastRead 0 FirstWrite -1}
		array_6 {Type I LastRead 0 FirstWrite -1}
		array_7 {Type I LastRead 0 FirstWrite -1}
		results_0 {Type O LastRead -1 FirstWrite 1}
		results_1 {Type O LastRead -1 FirstWrite 1}
		results_2 {Type O LastRead -1 FirstWrite 1}
		results_3 {Type O LastRead -1 FirstWrite 1}
		results_4 {Type O LastRead -1 FirstWrite 1}
		results_5 {Type O LastRead -1 FirstWrite 1}
		results_6 {Type O LastRead -1 FirstWrite 1}
		results_7 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_0 {
		array_0 {Type I LastRead 0 FirstWrite -1}
		results_0 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_1 {
		array_1 {Type I LastRead 0 FirstWrite -1}
		results_1 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_2 {
		array_2 {Type I LastRead 0 FirstWrite -1}
		results_2 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_3 {
		array_3 {Type I LastRead 0 FirstWrite -1}
		results_3 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_4 {
		array_4 {Type I LastRead 0 FirstWrite -1}
		results_4 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_5 {
		array_5 {Type I LastRead 0 FirstWrite -1}
		results_5 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_6 {
		array_6 {Type I LastRead 0 FirstWrite -1}
		results_6 {Type O LastRead -1 FirstWrite 1}}
	matrixtrans_Pipeline_loop_7 {
		array_7 {Type I LastRead 0 FirstWrite -1}
		results_7 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8195", "Max" : "8195"}
	, {"Name" : "Interval", "Min" : "8196", "Max" : "8196"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	array_0 { ap_memory {  { array_0_address0 mem_address 1 13 }  { array_0_ce0 mem_ce 1 1 }  { array_0_q0 mem_dout 0 32 } } }
	array_1 { ap_memory {  { array_1_address0 mem_address 1 13 }  { array_1_ce0 mem_ce 1 1 }  { array_1_q0 mem_dout 0 32 } } }
	array_2 { ap_memory {  { array_2_address0 mem_address 1 13 }  { array_2_ce0 mem_ce 1 1 }  { array_2_q0 mem_dout 0 32 } } }
	array_3 { ap_memory {  { array_3_address0 mem_address 1 13 }  { array_3_ce0 mem_ce 1 1 }  { array_3_q0 mem_dout 0 32 } } }
	array_4 { ap_memory {  { array_4_address0 mem_address 1 13 }  { array_4_ce0 mem_ce 1 1 }  { array_4_q0 mem_dout 0 32 } } }
	array_5 { ap_memory {  { array_5_address0 mem_address 1 13 }  { array_5_ce0 mem_ce 1 1 }  { array_5_q0 mem_dout 0 32 } } }
	array_6 { ap_memory {  { array_6_address0 mem_address 1 13 }  { array_6_ce0 mem_ce 1 1 }  { array_6_q0 mem_dout 0 32 } } }
	array_7 { ap_memory {  { array_7_address0 mem_address 1 13 }  { array_7_ce0 mem_ce 1 1 }  { array_7_q0 mem_dout 0 32 } } }
	results_0 { ap_memory {  { results_0_address0 mem_address 1 13 }  { results_0_ce0 mem_ce 1 1 }  { results_0_we0 mem_we 1 1 }  { results_0_d0 mem_din 1 32 } } }
	results_1 { ap_memory {  { results_1_address0 mem_address 1 13 }  { results_1_ce0 mem_ce 1 1 }  { results_1_we0 mem_we 1 1 }  { results_1_d0 mem_din 1 32 } } }
	results_2 { ap_memory {  { results_2_address0 mem_address 1 13 }  { results_2_ce0 mem_ce 1 1 }  { results_2_we0 mem_we 1 1 }  { results_2_d0 mem_din 1 32 } } }
	results_3 { ap_memory {  { results_3_address0 mem_address 1 13 }  { results_3_ce0 mem_ce 1 1 }  { results_3_we0 mem_we 1 1 }  { results_3_d0 mem_din 1 32 } } }
	results_4 { ap_memory {  { results_4_address0 mem_address 1 13 }  { results_4_ce0 mem_ce 1 1 }  { results_4_we0 mem_we 1 1 }  { results_4_d0 mem_din 1 32 } } }
	results_5 { ap_memory {  { results_5_address0 mem_address 1 13 }  { results_5_ce0 mem_ce 1 1 }  { results_5_we0 mem_we 1 1 }  { results_5_d0 mem_din 1 32 } } }
	results_6 { ap_memory {  { results_6_address0 mem_address 1 13 }  { results_6_ce0 mem_ce 1 1 }  { results_6_we0 mem_we 1 1 }  { results_6_d0 mem_din 1 32 } } }
	results_7 { ap_memory {  { results_7_address0 mem_address 1 13 }  { results_7_ce0 mem_ce 1 1 }  { results_7_we0 mem_we 1 1 }  { results_7_d0 mem_din 1 32 } } }
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
