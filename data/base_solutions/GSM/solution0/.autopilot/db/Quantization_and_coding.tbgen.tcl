set moduleName Quantization_and_coding
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
set C_modelName {Quantization_and_coding}
set C_modelType { void 0 }
set C_modelArgList {
	{ LARc int 16 regular {array 8 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "LARc", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ LARc_address0 sc_out sc_lv 3 signal 0 } 
	{ LARc_ce0 sc_out sc_logic 1 signal 0 } 
	{ LARc_we0 sc_out sc_logic 1 signal 0 } 
	{ LARc_d0 sc_out sc_lv 16 signal 0 } 
	{ LARc_q0 sc_in sc_lv 16 signal 0 } 
	{ LARc_address1 sc_out sc_lv 3 signal 0 } 
	{ LARc_ce1 sc_out sc_logic 1 signal 0 } 
	{ LARc_we1 sc_out sc_logic 1 signal 0 } 
	{ LARc_d1 sc_out sc_lv 16 signal 0 } 
	{ LARc_q1 sc_in sc_lv 16 signal 0 } 
	{ grp_gsm_add_fu_310_p_din1 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_din2 sc_out sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_dout0 sc_in sc_lv 16 signal -1 } 
	{ grp_gsm_add_fu_310_p_ready sc_in sc_logic 1 signal -1 } 
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
 	{ "name": "LARc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "LARc", "role": "address0" }} , 
 	{ "name": "LARc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "ce0" }} , 
 	{ "name": "LARc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "we0" }} , 
 	{ "name": "LARc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "d0" }} , 
 	{ "name": "LARc_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "q0" }} , 
 	{ "name": "LARc_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "LARc", "role": "address1" }} , 
 	{ "name": "LARc_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "ce1" }} , 
 	{ "name": "LARc_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "we1" }} , 
 	{ "name": "LARc_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "d1" }} , 
 	{ "name": "LARc_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "q1" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_din1", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_din2", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_dout0", "role": "default" }} , 
 	{ "name": "grp_gsm_add_fu_310_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_gsm_add_fu_310_p_ready", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_din1", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_din2", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_dout0", "role": "default" }} , 
 	{ "name": "tmp_6_gsm_add_fu_315_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp_6_gsm_add_fu_315_p_ready", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6"],
		"CDFG" : "Quantization_and_coding",
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
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_fu_195", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "gsm_mult",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_fu_195.mul_16s_15ns_31_1_1_U62", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_fu_203", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "gsm_mult",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gsm_mult_fu_203.mul_16s_15ns_31_1_1_U62", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_add_fu_230", "Parent" : "0",
		"CDFG" : "gsm_add",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_add_fu_237", "Parent" : "0",
		"CDFG" : "gsm_add",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	Quantization_and_coding {
		LARc {Type IO LastRead 4 FirstWrite 4}}
	gsm_mult {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}
	gsm_mult {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}
	gsm_add {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}
	gsm_add {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	LARc { ap_memory {  { LARc_address0 mem_address 1 3 }  { LARc_ce0 mem_ce 1 1 }  { LARc_we0 mem_we 1 1 }  { LARc_d0 mem_din 1 16 }  { LARc_q0 in_data 0 16 }  { LARc_address1 MemPortADDR2 1 3 }  { LARc_ce1 MemPortCE2 1 1 }  { LARc_we1 MemPortWE2 1 1 }  { LARc_d1 MemPortDIN2 1 16 }  { LARc_q1 in_data 0 16 } } }
}
