set moduleName get_delta_matrix_weights2
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
set C_modelName {get_delta_matrix_weights2}
set C_modelType { void 0 }
set C_modelArgList {
	{ delta_weights2 double 64 regular {array 4096 { 0 3 } 0 1 }  }
	{ output_difference double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ last_activations double 64 regular {array 64 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "delta_weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_difference", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "last_activations", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ delta_weights2_address0 sc_out sc_lv 12 signal 0 } 
	{ delta_weights2_ce0 sc_out sc_logic 1 signal 0 } 
	{ delta_weights2_we0 sc_out sc_logic 1 signal 0 } 
	{ delta_weights2_d0 sc_out sc_lv 64 signal 0 } 
	{ output_difference_address0 sc_out sc_lv 6 signal 1 } 
	{ output_difference_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_difference_q0 sc_in sc_lv 64 signal 1 } 
	{ last_activations_address0 sc_out sc_lv 6 signal 2 } 
	{ last_activations_ce0 sc_out sc_logic 1 signal 2 } 
	{ last_activations_q0 sc_in sc_lv 64 signal 2 } 
	{ grp_fu_992_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_992_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_992_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_992_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "delta_weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "delta_weights2", "role": "address0" }} , 
 	{ "name": "delta_weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delta_weights2", "role": "ce0" }} , 
 	{ "name": "delta_weights2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "delta_weights2", "role": "we0" }} , 
 	{ "name": "delta_weights2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "delta_weights2", "role": "d0" }} , 
 	{ "name": "output_difference_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output_difference", "role": "address0" }} , 
 	{ "name": "output_difference_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_difference", "role": "ce0" }} , 
 	{ "name": "output_difference_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference", "role": "q0" }} , 
 	{ "name": "last_activations_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "last_activations", "role": "address0" }} , 
 	{ "name": "last_activations_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "last_activations", "role": "ce0" }} , 
 	{ "name": "last_activations_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "last_activations", "role": "q0" }} , 
 	{ "name": "grp_fu_992_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_992_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "get_delta_matrix_weights2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24769", "EstimateLatencyMax" : "24769",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delta_weights2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output_difference", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "last_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_delta_matrix_weights2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	get_delta_matrix_weights2 {
		delta_weights2 {Type O LastRead -1 FirstWrite 8}
		output_difference {Type I LastRead 3 FirstWrite -1}
		last_activations {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "24769", "Max" : "24769"}
	, {"Name" : "Interval", "Min" : "24769", "Max" : "24769"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	delta_weights2 { ap_memory {  { delta_weights2_address0 mem_address 1 12 }  { delta_weights2_ce0 mem_ce 1 1 }  { delta_weights2_we0 mem_we 1 1 }  { delta_weights2_d0 mem_din 1 64 } } }
	output_difference { ap_memory {  { output_difference_address0 mem_address 1 6 }  { output_difference_ce0 mem_ce 1 1 }  { output_difference_q0 in_data 0 64 } } }
	last_activations { ap_memory {  { last_activations_address0 mem_address 1 6 }  { last_activations_ce0 mem_ce 1 1 }  { last_activations_q0 mem_dout 0 64 } } }
}
