set moduleName main_Pipeline_VITIS_LOOP_188_2
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
set C_modelName {main_Pipeline_VITIS_LOOP_188_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ results_0 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_1 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_2 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_3 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_4 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_5 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_6 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results_7 int 32 regular {array 5 { 0 3 } 0 1 }  }
	{ results int 32 regular {array 5 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "results_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "results", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ results_0_address0 sc_out sc_lv 3 signal 0 } 
	{ results_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ results_0_we0 sc_out sc_logic 1 signal 0 } 
	{ results_0_d0 sc_out sc_lv 32 signal 0 } 
	{ results_1_address0 sc_out sc_lv 3 signal 1 } 
	{ results_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ results_1_we0 sc_out sc_logic 1 signal 1 } 
	{ results_1_d0 sc_out sc_lv 32 signal 1 } 
	{ results_2_address0 sc_out sc_lv 3 signal 2 } 
	{ results_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ results_2_we0 sc_out sc_logic 1 signal 2 } 
	{ results_2_d0 sc_out sc_lv 32 signal 2 } 
	{ results_3_address0 sc_out sc_lv 3 signal 3 } 
	{ results_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ results_3_we0 sc_out sc_logic 1 signal 3 } 
	{ results_3_d0 sc_out sc_lv 32 signal 3 } 
	{ results_4_address0 sc_out sc_lv 3 signal 4 } 
	{ results_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ results_4_we0 sc_out sc_logic 1 signal 4 } 
	{ results_4_d0 sc_out sc_lv 32 signal 4 } 
	{ results_5_address0 sc_out sc_lv 3 signal 5 } 
	{ results_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ results_5_we0 sc_out sc_logic 1 signal 5 } 
	{ results_5_d0 sc_out sc_lv 32 signal 5 } 
	{ results_6_address0 sc_out sc_lv 3 signal 6 } 
	{ results_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ results_6_we0 sc_out sc_logic 1 signal 6 } 
	{ results_6_d0 sc_out sc_lv 32 signal 6 } 
	{ results_7_address0 sc_out sc_lv 3 signal 7 } 
	{ results_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ results_7_we0 sc_out sc_logic 1 signal 7 } 
	{ results_7_d0 sc_out sc_lv 32 signal 7 } 
	{ results_address0 sc_out sc_lv 3 signal 8 } 
	{ results_ce0 sc_out sc_logic 1 signal 8 } 
	{ results_we0 sc_out sc_logic 1 signal 8 } 
	{ results_d0 sc_out sc_lv 32 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "results_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_0", "role": "address0" }} , 
 	{ "name": "results_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "ce0" }} , 
 	{ "name": "results_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_0", "role": "we0" }} , 
 	{ "name": "results_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_0", "role": "d0" }} , 
 	{ "name": "results_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_1", "role": "address0" }} , 
 	{ "name": "results_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "ce0" }} , 
 	{ "name": "results_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_1", "role": "we0" }} , 
 	{ "name": "results_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_1", "role": "d0" }} , 
 	{ "name": "results_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_2", "role": "address0" }} , 
 	{ "name": "results_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "ce0" }} , 
 	{ "name": "results_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_2", "role": "we0" }} , 
 	{ "name": "results_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_2", "role": "d0" }} , 
 	{ "name": "results_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_3", "role": "address0" }} , 
 	{ "name": "results_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "ce0" }} , 
 	{ "name": "results_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_3", "role": "we0" }} , 
 	{ "name": "results_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_3", "role": "d0" }} , 
 	{ "name": "results_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_4", "role": "address0" }} , 
 	{ "name": "results_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "ce0" }} , 
 	{ "name": "results_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_4", "role": "we0" }} , 
 	{ "name": "results_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_4", "role": "d0" }} , 
 	{ "name": "results_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_5", "role": "address0" }} , 
 	{ "name": "results_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "ce0" }} , 
 	{ "name": "results_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_5", "role": "we0" }} , 
 	{ "name": "results_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_5", "role": "d0" }} , 
 	{ "name": "results_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_6", "role": "address0" }} , 
 	{ "name": "results_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "ce0" }} , 
 	{ "name": "results_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_6", "role": "we0" }} , 
 	{ "name": "results_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_6", "role": "d0" }} , 
 	{ "name": "results_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results_7", "role": "address0" }} , 
 	{ "name": "results_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "ce0" }} , 
 	{ "name": "results_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results_7", "role": "we0" }} , 
 	{ "name": "results_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results_7", "role": "d0" }} , 
 	{ "name": "results_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "results", "role": "address0" }} , 
 	{ "name": "results_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "ce0" }} , 
 	{ "name": "results_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "we0" }} , 
 	{ "name": "results_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "results", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_188_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "results_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "results", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_188_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_188_2 {
		results_0 {Type O LastRead -1 FirstWrite 1}
		results_1 {Type O LastRead -1 FirstWrite 1}
		results_2 {Type O LastRead -1 FirstWrite 1}
		results_3 {Type O LastRead -1 FirstWrite 1}
		results_4 {Type O LastRead -1 FirstWrite 1}
		results_5 {Type O LastRead -1 FirstWrite 1}
		results_6 {Type O LastRead -1 FirstWrite 1}
		results_7 {Type O LastRead -1 FirstWrite 1}
		results {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	results_0 { ap_memory {  { results_0_address0 mem_address 1 3 }  { results_0_ce0 mem_ce 1 1 }  { results_0_we0 mem_we 1 1 }  { results_0_d0 mem_din 1 32 } } }
	results_1 { ap_memory {  { results_1_address0 mem_address 1 3 }  { results_1_ce0 mem_ce 1 1 }  { results_1_we0 mem_we 1 1 }  { results_1_d0 mem_din 1 32 } } }
	results_2 { ap_memory {  { results_2_address0 mem_address 1 3 }  { results_2_ce0 mem_ce 1 1 }  { results_2_we0 mem_we 1 1 }  { results_2_d0 mem_din 1 32 } } }
	results_3 { ap_memory {  { results_3_address0 mem_address 1 3 }  { results_3_ce0 mem_ce 1 1 }  { results_3_we0 mem_we 1 1 }  { results_3_d0 mem_din 1 32 } } }
	results_4 { ap_memory {  { results_4_address0 mem_address 1 3 }  { results_4_ce0 mem_ce 1 1 }  { results_4_we0 mem_we 1 1 }  { results_4_d0 mem_din 1 32 } } }
	results_5 { ap_memory {  { results_5_address0 mem_address 1 3 }  { results_5_ce0 mem_ce 1 1 }  { results_5_we0 mem_we 1 1 }  { results_5_d0 mem_din 1 32 } } }
	results_6 { ap_memory {  { results_6_address0 mem_address 1 3 }  { results_6_ce0 mem_ce 1 1 }  { results_6_we0 mem_we 1 1 }  { results_6_d0 mem_din 1 32 } } }
	results_7 { ap_memory {  { results_7_address0 mem_address 1 3 }  { results_7_ce0 mem_ce 1 1 }  { results_7_we0 mem_we 1 1 }  { results_7_d0 mem_din 1 32 } } }
	results { ap_memory {  { results_address0 mem_address 1 3 }  { results_ce0 mem_ce 1 1 }  { results_we0 mem_we 1 1 }  { results_d0 mem_din 1 32 } } }
}
