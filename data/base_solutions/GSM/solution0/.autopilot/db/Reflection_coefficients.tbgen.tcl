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
	{ bitoff int 4 regular {array 256 { 1 1 1 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "L_ACF", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "LARc", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bitoff", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
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
	{ bitoff_address0 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce0 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q0 sc_in sc_lv 4 signal 2 } 
	{ bitoff_address1 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce1 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q1 sc_in sc_lv 4 signal 2 } 
	{ bitoff_address2 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce2 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q2 sc_in sc_lv 4 signal 2 } 
	{ bitoff_address3 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce3 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q3 sc_in sc_lv 4 signal 2 } 
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
 	{ "name": "bitoff_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address0" }} , 
 	{ "name": "bitoff_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce0" }} , 
 	{ "name": "bitoff_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q0" }} , 
 	{ "name": "bitoff_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address1" }} , 
 	{ "name": "bitoff_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce1" }} , 
 	{ "name": "bitoff_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q1" }} , 
 	{ "name": "bitoff_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address2" }} , 
 	{ "name": "bitoff_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce2" }} , 
 	{ "name": "bitoff_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q2" }} , 
 	{ "name": "bitoff_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address3" }} , 
 	{ "name": "bitoff_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce3" }} , 
 	{ "name": "bitoff_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q3" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "Reflection_coefficients",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "532",
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
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state22_blk"}},
			{"Name" : "Reflection_coefficients_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state13"], "PreState" : ["ap_ST_fsm_state10", "ap_ST_fsm_state12", "ap_ST_fsm_state22"], "PostState" : ["ap_ST_fsm_state14"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state13_blk"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ACF_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_div_fu_389", "Parent" : "0",
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
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_15ns_31_4_1_U52", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_15ns_31_4_1_U53", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_15ns_31_4_1_U54", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Reflection_coefficients {
		L_ACF {Type I LastRead 3 FirstWrite -1}
		LARc {Type O LastRead -1 FirstWrite 2}
		bitoff {Type I LastRead 2 FirstWrite -1}}
	gsm_div {
		num {Type I LastRead 0 FirstWrite -1}
		denum {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "532"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "532"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	L_ACF { ap_memory {  { L_ACF_address0 mem_address 1 4 }  { L_ACF_ce0 mem_ce 1 1 }  { L_ACF_q0 in_data 0 64 } } }
	LARc { ap_memory {  { LARc_address0 mem_address 1 3 }  { LARc_ce0 mem_ce 1 1 }  { LARc_we0 mem_we 1 1 }  { LARc_d0 mem_din 1 16 } } }
	bitoff { ap_memory {  { bitoff_address0 mem_address 1 8 }  { bitoff_ce0 mem_ce 1 1 }  { bitoff_q0 in_data 0 4 }  { bitoff_address1 MemPortADDR2 1 8 }  { bitoff_ce1 MemPortCE2 1 1 }  { bitoff_q1 in_data 0 4 }  { bitoff_address2 MemPortADDR2 1 8 }  { bitoff_ce2 MemPortCE2 1 1 }  { bitoff_q2 in_data 0 4 }  { bitoff_address3 MemPortADDR2 1 8 }  { bitoff_ce3 MemPortCE2 1 1 }  { bitoff_q3 in_data 0 4 } } }
}
