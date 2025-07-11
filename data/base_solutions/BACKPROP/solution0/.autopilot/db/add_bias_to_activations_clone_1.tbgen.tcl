set moduleName add_bias_to_activations_clone_1
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
set C_modelName {add_bias_to_activations.clone.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ biases2 int 64 regular {array 64 { 1 3 } 1 1 }  }
	{ activations double 64 regular {array 64 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ biases2_address0 sc_out sc_lv 6 signal 0 } 
	{ biases2_ce0 sc_out sc_logic 1 signal 0 } 
	{ biases2_q0 sc_in sc_lv 64 signal 0 } 
	{ activations_address0 sc_out sc_lv 6 signal 1 } 
	{ activations_ce0 sc_out sc_logic 1 signal 1 } 
	{ activations_we0 sc_out sc_logic 1 signal 1 } 
	{ activations_d0 sc_out sc_lv 64 signal 1 } 
	{ activations_q0 sc_in sc_lv 64 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases2", "role": "address0" }} , 
 	{ "name": "biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "ce0" }} , 
 	{ "name": "biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "q0" }} , 
 	{ "name": "activations_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "activations", "role": "address0" }} , 
 	{ "name": "activations_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations", "role": "ce0" }} , 
 	{ "name": "activations_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations", "role": "we0" }} , 
 	{ "name": "activations_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations", "role": "d0" }} , 
 	{ "name": "activations_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "add_bias_to_activations_clone_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "321", "EstimateLatencyMax" : "321",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_4_full_dsp_1_U1", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	add_bias_to_activations_clone_1 {
		biases2 {Type I LastRead 1 FirstWrite -1}
		activations {Type IO LastRead 1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "321", "Max" : "321"}
	, {"Name" : "Interval", "Min" : "321", "Max" : "321"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	biases2 { ap_memory {  { biases2_address0 mem_address 1 6 }  { biases2_ce0 mem_ce 1 1 }  { biases2_q0 in_data 0 64 } } }
	activations { ap_memory {  { activations_address0 mem_address 1 6 }  { activations_ce0 mem_ce 1 1 }  { activations_we0 mem_we 1 1 }  { activations_d0 mem_din 1 64 }  { activations_q0 in_data 0 64 } } }
}
