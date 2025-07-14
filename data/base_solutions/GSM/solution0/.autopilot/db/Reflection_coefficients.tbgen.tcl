set moduleName Reflection_coefficients
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
set C_modelName {Reflection_coefficients}
set C_modelType { void 0 }
set C_modelArgList {
	{ L_ACF int 64 regular {array 9 { 1 3 } 1 1 }  }
	{ LARc int 16 regular {array 8 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "L_ACF", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "LARc", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ L_ACF_address0 sc_out sc_lv 4 signal 0 } 
	{ L_ACF_ce0 sc_out sc_logic 1 signal 0 } 
	{ L_ACF_q0 sc_in sc_lv 64 signal 0 } 
	{ LARc_address0 sc_out sc_lv 3 signal 1 } 
	{ LARc_ce0 sc_out sc_logic 1 signal 1 } 
	{ LARc_we0 sc_out sc_logic 1 signal 1 } 
	{ LARc_d0 sc_out sc_lv 16 signal 1 } 
	{ grp_gsm_add_fu_310_p_din1 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_din2 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_din1 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_din2 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_mult_r_fu_300_p_idle sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_norm_fu_305_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_gsm_norm_fu_305_p_dout0 sc_in sc_lv 6 signal -1 } 
	{ grp_gsm_norm_fu_305_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_gsm_norm_fu_305_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_norm_fu_305_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_gsm_norm_fu_305_p_idle sc_in sc_logic 1 signal -1 } 
	{ temp_37_gsm_abs_fu_120_p_din1 sc_out sc_lv 16 signal -1 } 
	{ temp_37_gsm_abs_fu_120_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ temp_37_gsm_abs_fu_120_p_ready sc_in sc_logic 1 signal -1 } 
	{ tmp_6_gsm_add_fu_315_p_din1 sc_out sc_lv 16 signal -1 } 
	{ tmp_6_gsm_add_fu_315_p_din2 sc_out sc_lv 16 signal -1 } 
	{ tmp_6_gsm_add_fu_315_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ tmp_6_gsm_add_fu_315_p_ready sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "L_ACF_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "L_ACF", "role": "address0" }} , 
 	{ "name": "L_ACF_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "L_ACF", "role": "ce0" }} , 
 	{ "name": "L_ACF_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "L_ACF", "role": "q0" }} , 
 	{ "name": "LARc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "LARc", "role": "address0" }} , 
 	{ "name": "LARc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "ce0" }} , 
 	{ "name": "LARc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "we0" }} , 
 	{ "name": "LARc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "d0" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_din1", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_din2", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_dout0", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_ready", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_din1", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_din2", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_dout0", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_start", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_ready", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_done", "role": "default" }} , 
 	{ "name": "grp_gsm_mult_r_fu_300_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_mult_r_fu_300_p_idle", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_din1", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_dout0", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_start", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_ready", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_done", "role": "default" }} , 
 	{ "name": "grp_gsm_norm_fu_305_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_norm_fu_305_p_idle", "role": "default" }} , 
 	{ "name": "temp_37_gsm_abs_fu_120_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "temp_37_gsm_abs_fu_120_p_din1", "role": "default" }} , 
 	{ "name": "temp_37_gsm_abs_fu_120_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "temp_37_gsm_abs_fu_120_p_dout0", "role": "default" }} , 
 	{ "name": "temp_37_gsm_abs_fu_120_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_37_gsm_abs_fu_120_p_ready", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_din1", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_din2", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_dout0", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_ready", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "Reflection_coefficients",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "588",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Reflection_coefficients_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state17_blk"}},
			{"Name" : "Reflection_coefficients_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state13"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state10", "ap_ST_fsm_state11", "ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state12_blk"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ACF_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_div_fu_290", "Parent" : "0",
		"CDFG" : "gsm_div",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "15",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "num", "Type" : "None", "Direction" : "I"},
			{"Name" : "denum", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "gsm_div_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_r_fu_305", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "gsm_mult_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_r_fu_305.mac_muladd_16s_16s_15ns_31_4_1_U4", "Parent" : "5"}]}


set ArgLastReadFirstWriteLatency {
	Reflection_coefficients {
		L_ACF {Type I LastRead 3 FirstWrite -1}
		LARc {Type O LastRead -1 FirstWrite 2}
		bitoff {Type I LastRead -1 FirstWrite -1}}
	gsm_div {
		num {Type I LastRead 0 FirstWrite -1}
		denum {Type I LastRead 0 FirstWrite -1}}
	gsm_mult_r {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "588"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "588"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	L_ACF { ap_memory {  { L_ACF_address0 mem_address 1 4 }  { L_ACF_ce0 mem_ce 1 1 }  { L_ACF_q0 in_data 0 64 } } }
	LARc { ap_memory {  { LARc_address0 mem_address 1 3 }  { LARc_ce0 mem_ce 1 1 }  { LARc_we0 mem_we 1 1 }  { LARc_d0 mem_din 1 16 } } }
}
