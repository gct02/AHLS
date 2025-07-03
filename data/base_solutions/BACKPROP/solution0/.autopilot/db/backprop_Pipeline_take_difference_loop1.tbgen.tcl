set moduleName backprop_Pipeline_take_difference_loop1
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
set C_modelName {backprop_Pipeline_take_difference_loop1}
set C_modelType { void 0 }
set C_modelArgList {
	{ output_difference_2_022 double 64 regular  }
	{ output_difference_1_021 double 64 regular  }
	{ output_difference_0_020 double 64 regular  }
	{ net_outputs_0_1_reload double 64 regular  }
	{ net_outputs_1_1_reload double 64 regular  }
	{ net_outputs_2_1_reload double 64 regular  }
	{ sub_ln374 int 9 regular  }
	{ training_targets int 64 regular {array 489 { 1 3 } 1 1 }  }
	{ dactivations3_0_1_reload double 64 regular  }
	{ dactivations3_1_1_reload double 64 regular  }
	{ dactivations3_2_1_reload double 64 regular  }
	{ output_difference_2_1_out double 64 regular {pointer 1}  }
	{ output_difference_1_1_out double 64 regular {pointer 1}  }
	{ output_difference_0_1_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "output_difference_2_022", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_difference_1_021", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_difference_0_020", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_0_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_1_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_2_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln374", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "training_targets", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_0_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_1_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_2_1_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_difference_2_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_difference_1_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_difference_0_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ output_difference_2_022 sc_in sc_lv 64 signal 0 } 
	{ output_difference_1_021 sc_in sc_lv 64 signal 1 } 
	{ output_difference_0_020 sc_in sc_lv 64 signal 2 } 
	{ net_outputs_0_1_reload sc_in sc_lv 64 signal 3 } 
	{ net_outputs_1_1_reload sc_in sc_lv 64 signal 4 } 
	{ net_outputs_2_1_reload sc_in sc_lv 64 signal 5 } 
	{ sub_ln374 sc_in sc_lv 9 signal 6 } 
	{ training_targets_address0 sc_out sc_lv 9 signal 7 } 
	{ training_targets_ce0 sc_out sc_logic 1 signal 7 } 
	{ training_targets_q0 sc_in sc_lv 64 signal 7 } 
	{ dactivations3_0_1_reload sc_in sc_lv 64 signal 8 } 
	{ dactivations3_1_1_reload sc_in sc_lv 64 signal 9 } 
	{ dactivations3_2_1_reload sc_in sc_lv 64 signal 10 } 
	{ output_difference_2_1_out sc_out sc_lv 64 signal 11 } 
	{ output_difference_2_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ output_difference_1_1_out sc_out sc_lv 64 signal 12 } 
	{ output_difference_1_1_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ output_difference_0_1_out sc_out sc_lv 64 signal 13 } 
	{ output_difference_0_1_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ grp_fu_988_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_988_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_988_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_988_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_988_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "output_difference_2_022", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_2_022", "role": "default" }} , 
 	{ "name": "output_difference_1_021", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_1_021", "role": "default" }} , 
 	{ "name": "output_difference_0_020", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_0_020", "role": "default" }} , 
 	{ "name": "net_outputs_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_0_1_reload", "role": "default" }} , 
 	{ "name": "net_outputs_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_1_1_reload", "role": "default" }} , 
 	{ "name": "net_outputs_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_2_1_reload", "role": "default" }} , 
 	{ "name": "sub_ln374", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "sub_ln374", "role": "default" }} , 
 	{ "name": "training_targets_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "training_targets", "role": "address0" }} , 
 	{ "name": "training_targets_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_targets", "role": "ce0" }} , 
 	{ "name": "training_targets_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_targets", "role": "q0" }} , 
 	{ "name": "dactivations3_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_0_1_reload", "role": "default" }} , 
 	{ "name": "dactivations3_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_1_1_reload", "role": "default" }} , 
 	{ "name": "dactivations3_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_2_1_reload", "role": "default" }} , 
 	{ "name": "output_difference_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_2_1_out", "role": "default" }} , 
 	{ "name": "output_difference_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_difference_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "output_difference_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_1_1_out", "role": "default" }} , 
 	{ "name": "output_difference_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_difference_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "output_difference_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_difference_0_1_out", "role": "default" }} , 
 	{ "name": "output_difference_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_difference_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_988_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_988_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_988_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_992_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "backprop_Pipeline_take_difference_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12", "EstimateLatencyMax" : "12",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_difference_2_022", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_1_021", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_0_020", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln374", "Type" : "None", "Direction" : "I"},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dactivations3_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "output_difference_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "output_difference_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "take_difference_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U99", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U100", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop_Pipeline_take_difference_loop1 {
		output_difference_2_022 {Type I LastRead 0 FirstWrite -1}
		output_difference_1_021 {Type I LastRead 0 FirstWrite -1}
		output_difference_0_020 {Type I LastRead 0 FirstWrite -1}
		net_outputs_0_1_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_1_1_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_2_1_reload {Type I LastRead 0 FirstWrite -1}
		sub_ln374 {Type I LastRead 0 FirstWrite -1}
		training_targets {Type I LastRead 0 FirstWrite -1}
		dactivations3_0_1_reload {Type I LastRead 0 FirstWrite -1}
		dactivations3_1_1_reload {Type I LastRead 0 FirstWrite -1}
		dactivations3_2_1_reload {Type I LastRead 0 FirstWrite -1}
		output_difference_2_1_out {Type O LastRead -1 FirstWrite 7}
		output_difference_1_1_out {Type O LastRead -1 FirstWrite 7}
		output_difference_0_1_out {Type O LastRead -1 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12", "Max" : "12"}
	, {"Name" : "Interval", "Min" : "12", "Max" : "12"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	output_difference_2_022 { ap_none {  { output_difference_2_022 in_data 0 64 } } }
	output_difference_1_021 { ap_none {  { output_difference_1_021 in_data 0 64 } } }
	output_difference_0_020 { ap_none {  { output_difference_0_020 in_data 0 64 } } }
	net_outputs_0_1_reload { ap_none {  { net_outputs_0_1_reload in_data 0 64 } } }
	net_outputs_1_1_reload { ap_none {  { net_outputs_1_1_reload in_data 0 64 } } }
	net_outputs_2_1_reload { ap_none {  { net_outputs_2_1_reload in_data 0 64 } } }
	sub_ln374 { ap_none {  { sub_ln374 in_data 0 9 } } }
	training_targets { ap_memory {  { training_targets_address0 mem_address 1 9 }  { training_targets_ce0 mem_ce 1 1 }  { training_targets_q0 in_data 0 64 } } }
	dactivations3_0_1_reload { ap_none {  { dactivations3_0_1_reload in_data 0 64 } } }
	dactivations3_1_1_reload { ap_none {  { dactivations3_1_1_reload in_data 0 64 } } }
	dactivations3_2_1_reload { ap_none {  { dactivations3_2_1_reload in_data 0 64 } } }
	output_difference_2_1_out { ap_vld {  { output_difference_2_1_out out_data 1 64 }  { output_difference_2_1_out_ap_vld out_vld 1 1 } } }
	output_difference_1_1_out { ap_vld {  { output_difference_1_1_out out_data 1 64 }  { output_difference_1_1_out_ap_vld out_vld 1 1 } } }
	output_difference_0_1_out { ap_vld {  { output_difference_0_1_out out_data 1 64 }  { output_difference_0_1_out_ap_vld out_vld 1 1 } } }
}
