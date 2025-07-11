set moduleName get_oracle_activations2_1
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
set C_modelName {get_oracle_activations2.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights3 int 64 regular {array 192 { 1 3 } 1 1 }  }
	{ p_read double 64 regular  }
	{ p_read1 double 64 regular  }
	{ p_read2 double 64 regular  }
	{ oracle_activations double 64 regular {array 64 { 0 3 } 0 1 }  }
	{ dactivations double 64 regular {array 64 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "oracle_activations", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dactivations", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weights3_address0 sc_out sc_lv 8 signal 0 } 
	{ weights3_ce0 sc_out sc_logic 1 signal 0 } 
	{ weights3_q0 sc_in sc_lv 64 signal 0 } 
	{ p_read sc_in sc_lv 64 signal 1 } 
	{ p_read1 sc_in sc_lv 64 signal 2 } 
	{ p_read2 sc_in sc_lv 64 signal 3 } 
	{ oracle_activations_address0 sc_out sc_lv 6 signal 4 } 
	{ oracle_activations_ce0 sc_out sc_logic 1 signal 4 } 
	{ oracle_activations_we0 sc_out sc_logic 1 signal 4 } 
	{ oracle_activations_d0 sc_out sc_lv 64 signal 4 } 
	{ dactivations_address0 sc_out sc_lv 6 signal 5 } 
	{ dactivations_ce0 sc_out sc_logic 1 signal 5 } 
	{ dactivations_q0 sc_in sc_lv 64 signal 5 } 
	{ grp_fu_990_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_990_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_990_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "weights3", "role": "address0" }} , 
 	{ "name": "weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "ce0" }} , 
 	{ "name": "weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "q0" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
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
 	{ "name": "grp_fu_990_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_990_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "get_oracle_activations2_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2113", "EstimateLatencyMax" : "2113",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "oracle_activations", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dactivations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_oracle_activations2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U86", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U87", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	get_oracle_activations2_1 {
		weights3 {Type I LastRead 2 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		oracle_activations {Type O LastRead -1 FirstWrite 6}
		dactivations {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2113", "Max" : "2113"}
	, {"Name" : "Interval", "Min" : "2113", "Max" : "2113"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights3 { ap_memory {  { weights3_address0 mem_address 1 8 }  { weights3_ce0 mem_ce 1 1 }  { weights3_q0 in_data 0 64 } } }
	p_read { ap_none {  { p_read in_data 0 64 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 64 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 64 } } }
	oracle_activations { ap_memory {  { oracle_activations_address0 mem_address 1 6 }  { oracle_activations_ce0 mem_ce 1 1 }  { oracle_activations_we0 mem_we 1 1 }  { oracle_activations_d0 mem_din 1 64 } } }
	dactivations { ap_memory {  { dactivations_address0 mem_address 1 6 }  { dactivations_ce0 mem_ce 1 1 }  { dactivations_q0 in_data 0 64 } } }
}
