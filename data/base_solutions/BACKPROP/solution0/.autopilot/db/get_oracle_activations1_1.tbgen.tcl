set moduleName get_oracle_activations1_1
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
set C_modelName {get_oracle_activations1.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights2 int 64 regular {array 4096 { 1 3 } 1 1 }  }
	{ output_differences double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ oracle_activations double 64 regular {array 64 { 0 3 } 0 1 }  }
	{ dactivations double 64 regular {array 64 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_differences", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "oracle_activations", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dactivations", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weights2_address0 sc_out sc_lv 12 signal 0 } 
	{ weights2_ce0 sc_out sc_logic 1 signal 0 } 
	{ weights2_q0 sc_in sc_lv 64 signal 0 } 
	{ output_differences_address0 sc_out sc_lv 6 signal 1 } 
	{ output_differences_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_differences_q0 sc_in sc_lv 64 signal 1 } 
	{ oracle_activations_address0 sc_out sc_lv 6 signal 2 } 
	{ oracle_activations_ce0 sc_out sc_logic 1 signal 2 } 
	{ oracle_activations_we0 sc_out sc_logic 1 signal 2 } 
	{ oracle_activations_d0 sc_out sc_lv 64 signal 2 } 
	{ dactivations_address0 sc_out sc_lv 6 signal 3 } 
	{ dactivations_ce0 sc_out sc_logic 1 signal 3 } 
	{ dactivations_q0 sc_in sc_lv 64 signal 3 } 
	{ grp_fu_990_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_990_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_990_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_994_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_994_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_994_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_994_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "weights2", "role": "address0" }} , 
 	{ "name": "weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "ce0" }} , 
 	{ "name": "weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "q0" }} , 
 	{ "name": "output_differences_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output_differences", "role": "address0" }} , 
 	{ "name": "output_differences_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_differences", "role": "ce0" }} , 
 	{ "name": "output_differences_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_differences", "role": "q0" }} , 
 	{ "name": "oracle_activations_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "oracle_activations", "role": "address0" }} , 
 	{ "name": "oracle_activations_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "oracle_activations", "role": "ce0" }} , 
 	{ "name": "oracle_activations_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "oracle_activations", "role": "we0" }} , 
 	{ "name": "oracle_activations_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "oracle_activations", "role": "d0" }} , 
 	{ "name": "dactivations_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "dactivations", "role": "address0" }} , 
 	{ "name": "dactivations_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dactivations", "role": "ce0" }} , 
 	{ "name": "dactivations_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations", "role": "q0" }} , 
 	{ "name": "grp_fu_990_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_990_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_990_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_994_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_994_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_994_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_994_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_994_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_994_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_994_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_994_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "get_oracle_activations1_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41345", "EstimateLatencyMax" : "41345",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_differences", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "oracle_activations", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dactivations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_oracle_activations1_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations1_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	get_oracle_activations1_1 {
		weights2 {Type I LastRead 2 FirstWrite -1}
		output_differences {Type I LastRead 3 FirstWrite -1}
		oracle_activations {Type O LastRead -1 FirstWrite 6}
		dactivations {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "41345", "Max" : "41345"}
	, {"Name" : "Interval", "Min" : "41345", "Max" : "41345"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights2 { ap_memory {  { weights2_address0 mem_address 1 12 }  { weights2_ce0 mem_ce 1 1 }  { weights2_q0 mem_dout 0 64 } } }
	output_differences { ap_memory {  { output_differences_address0 mem_address 1 6 }  { output_differences_ce0 mem_ce 1 1 }  { output_differences_q0 in_data 0 64 } } }
	oracle_activations { ap_memory {  { oracle_activations_address0 mem_address 1 6 }  { oracle_activations_ce0 mem_ce 1 1 }  { oracle_activations_we0 mem_we 1 1 }  { oracle_activations_d0 mem_din 1 64 } } }
	dactivations { ap_memory {  { dactivations_address0 mem_address 1 6 }  { dactivations_ce0 mem_ce 1 1 }  { dactivations_q0 in_data 0 64 } } }
}
