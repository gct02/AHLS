set moduleName kernel_gramschmidt
set isTopModule 1
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
set C_modelName {kernel_gramschmidt}
set C_modelType { void 0 }
set C_modelArgList {
	{ ni int 32 regular  }
	{ nj int 32 regular  }
	{ A int 64 regular {array 262144 { 2 3 } 1 1 }  }
	{ R int 64 regular {array 262144 { 0 3 } 0 1 }  }
	{ Q int 64 regular {array 262144 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "ni", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "nj", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "R", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Q", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ni sc_in sc_lv 32 signal 0 } 
	{ nj sc_in sc_lv 32 signal 1 } 
	{ A_address0 sc_out sc_lv 18 signal 2 } 
	{ A_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_we0 sc_out sc_logic 1 signal 2 } 
	{ A_d0 sc_out sc_lv 64 signal 2 } 
	{ A_q0 sc_in sc_lv 64 signal 2 } 
	{ R_address0 sc_out sc_lv 18 signal 3 } 
	{ R_ce0 sc_out sc_logic 1 signal 3 } 
	{ R_we0 sc_out sc_logic 1 signal 3 } 
	{ R_d0 sc_out sc_lv 64 signal 3 } 
	{ Q_address0 sc_out sc_lv 18 signal 4 } 
	{ Q_ce0 sc_out sc_logic 1 signal 4 } 
	{ Q_we0 sc_out sc_logic 1 signal 4 } 
	{ Q_d0 sc_out sc_lv 64 signal 4 } 
	{ Q_q0 sc_in sc_lv 64 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ni", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ni", "role": "default" }} , 
 	{ "name": "nj", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nj", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "R_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "R", "role": "address0" }} , 
 	{ "name": "R_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "R", "role": "ce0" }} , 
 	{ "name": "R_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "R", "role": "we0" }} , 
 	{ "name": "R_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "R", "role": "d0" }} , 
 	{ "name": "Q_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "Q", "role": "address0" }} , 
 	{ "name": "Q_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Q", "role": "ce0" }} , 
 	{ "name": "Q_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Q", "role": "we0" }} , 
 	{ "name": "Q_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Q", "role": "d0" }} , 
 	{ "name": "Q_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Q", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "kernel_gramschmidt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12592641", "EstimateLatencyMax" : "2820938241",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ni", "Type" : "None", "Direction" : "I"},
			{"Name" : "nj", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "R", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "Q", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state25", "LastState" : ["ap_ST_fsm_state41"], "QuitState" : ["ap_ST_fsm_state25"], "PreState" : ["ap_ST_fsm_state24"], "PostState" : ["ap_ST_fsm_state42"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state43", "LastState" : ["ap_ST_fsm_state52"], "QuitState" : ["ap_ST_fsm_state43"], "PreState" : ["ap_ST_fsm_state42"], "PostState" : ["ap_ST_fsm_state53"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state53", "LastState" : ["ap_ST_fsm_state63"], "QuitState" : ["ap_ST_fsm_state53"], "PreState" : ["ap_ST_fsm_state43"], "PostState" : ["ap_ST_fsm_state42"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state42", "LastState" : ["ap_ST_fsm_state53"], "QuitState" : ["ap_ST_fsm_state42"], "PreState" : ["ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "63", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state42"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsqrt_64ns_64ns_64_12_no_dsp_1_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	kernel_gramschmidt {
		ni {Type I LastRead 0 FirstWrite -1}
		nj {Type I LastRead 0 FirstWrite -1}
		A {Type IO LastRead 22 FirstWrite 28}
		R {Type O LastRead -1 FirstWrite 14}
		Q {Type IO LastRead 18 FirstWrite 31}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12592641", "Max" : "2820938241"}
	, {"Name" : "Interval", "Min" : "12592642", "Max" : "-1474029054"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ni { ap_none {  { ni in_data 0 32 } } }
	nj { ap_none {  { nj in_data 0 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 18 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 64 }  { A_q0 mem_dout 0 64 } } }
	R { ap_memory {  { R_address0 mem_address 1 18 }  { R_ce0 mem_ce 1 1 }  { R_we0 mem_we 1 1 }  { R_d0 mem_din 1 64 } } }
	Q { ap_memory {  { Q_address0 mem_address 1 18 }  { Q_ce0 mem_ce 1 1 }  { Q_we0 mem_we 1 1 }  { Q_d0 mem_din 1 64 }  { Q_q0 mem_dout 0 64 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
