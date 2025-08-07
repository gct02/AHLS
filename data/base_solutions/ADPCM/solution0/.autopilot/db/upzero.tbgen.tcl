set moduleName upzero
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
set C_modelName {upzero}
set C_modelType { void 0 }
set C_modelArgList {
	{ dlt int 16 regular  }
	{ dlti int 16 regular {array 6 { 2 2 } 1 1 }  }
	{ bli int 32 regular {array 6 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "dlt", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "dlti", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "bli", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ dlt sc_in sc_lv 16 signal 0 } 
	{ dlti_address0 sc_out sc_lv 3 signal 1 } 
	{ dlti_ce0 sc_out sc_logic 1 signal 1 } 
	{ dlti_we0 sc_out sc_logic 1 signal 1 } 
	{ dlti_d0 sc_out sc_lv 16 signal 1 } 
	{ dlti_q0 sc_in sc_lv 16 signal 1 } 
	{ dlti_address1 sc_out sc_lv 3 signal 1 } 
	{ dlti_ce1 sc_out sc_logic 1 signal 1 } 
	{ dlti_we1 sc_out sc_logic 1 signal 1 } 
	{ dlti_d1 sc_out sc_lv 16 signal 1 } 
	{ dlti_q1 sc_in sc_lv 16 signal 1 } 
	{ bli_address0 sc_out sc_lv 3 signal 2 } 
	{ bli_ce0 sc_out sc_logic 1 signal 2 } 
	{ bli_we0 sc_out sc_logic 1 signal 2 } 
	{ bli_d0 sc_out sc_lv 32 signal 2 } 
	{ bli_q0 sc_in sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "dlt", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dlt", "role": "default" }} , 
 	{ "name": "dlti_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dlti", "role": "address0" }} , 
 	{ "name": "dlti_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dlti", "role": "ce0" }} , 
 	{ "name": "dlti_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dlti", "role": "we0" }} , 
 	{ "name": "dlti_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dlti", "role": "d0" }} , 
 	{ "name": "dlti_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dlti", "role": "q0" }} , 
 	{ "name": "dlti_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dlti", "role": "address1" }} , 
 	{ "name": "dlti_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dlti", "role": "ce1" }} , 
 	{ "name": "dlti_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dlti", "role": "we1" }} , 
 	{ "name": "dlti_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dlti", "role": "d1" }} , 
 	{ "name": "dlti_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dlti", "role": "q1" }} , 
 	{ "name": "bli_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bli", "role": "address0" }} , 
 	{ "name": "bli_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bli", "role": "ce0" }} , 
 	{ "name": "bli_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bli", "role": "we0" }} , 
 	{ "name": "bli_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bli", "role": "d0" }} , 
 	{ "name": "bli_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bli", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "upzero",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dlt", "Type" : "None", "Direction" : "I"},
			{"Name" : "dlti", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bli", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U55", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "17", "Max" : "17"}
	, {"Name" : "Interval", "Min" : "17", "Max" : "17"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	dlt { ap_none {  { dlt in_data 0 16 } } }
	dlti { ap_memory {  { dlti_address0 mem_address 1 3 }  { dlti_ce0 mem_ce 1 1 }  { dlti_we0 mem_we 1 1 }  { dlti_d0 mem_din 1 16 }  { dlti_q0 in_data 0 16 }  { dlti_address1 MemPortADDR2 1 3 }  { dlti_ce1 MemPortCE2 1 1 }  { dlti_we1 MemPortWE2 1 1 }  { dlti_d1 MemPortDIN2 1 16 }  { dlti_q1 MemPortDOUT2 0 16 } } }
	bli { ap_memory {  { bli_address0 mem_address 1 3 }  { bli_ce0 mem_ce 1 1 }  { bli_we0 mem_we 1 1 }  { bli_d0 mem_din 1 32 }  { bli_q0 in_data 0 32 } } }
}
