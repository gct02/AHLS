set moduleName md_kernel
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
set C_modelName {md_kernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ force_x int 64 regular {array 256 { 0 3 } 0 1 }  }
	{ force_y int 64 regular {array 256 { 0 3 } 0 1 }  }
	{ force_z int 64 regular {array 256 { 0 3 } 0 1 }  }
	{ position_x int 64 regular {array 256 { 1 3 } 1 1 }  }
	{ position_y int 64 regular {array 256 { 1 3 } 1 1 }  }
	{ position_z int 64 regular {array 256 { 1 3 } 1 1 }  }
	{ NL int 32 regular {array 4096 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "force_x", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "force_y", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "force_z", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "position_x", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "position_y", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "position_z", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "NL", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ force_x_address0 sc_out sc_lv 8 signal 0 } 
	{ force_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ force_x_we0 sc_out sc_logic 1 signal 0 } 
	{ force_x_d0 sc_out sc_lv 64 signal 0 } 
	{ force_y_address0 sc_out sc_lv 8 signal 1 } 
	{ force_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ force_y_we0 sc_out sc_logic 1 signal 1 } 
	{ force_y_d0 sc_out sc_lv 64 signal 1 } 
	{ force_z_address0 sc_out sc_lv 8 signal 2 } 
	{ force_z_ce0 sc_out sc_logic 1 signal 2 } 
	{ force_z_we0 sc_out sc_logic 1 signal 2 } 
	{ force_z_d0 sc_out sc_lv 64 signal 2 } 
	{ position_x_address0 sc_out sc_lv 8 signal 3 } 
	{ position_x_ce0 sc_out sc_logic 1 signal 3 } 
	{ position_x_q0 sc_in sc_lv 64 signal 3 } 
	{ position_y_address0 sc_out sc_lv 8 signal 4 } 
	{ position_y_ce0 sc_out sc_logic 1 signal 4 } 
	{ position_y_q0 sc_in sc_lv 64 signal 4 } 
	{ position_z_address0 sc_out sc_lv 8 signal 5 } 
	{ position_z_ce0 sc_out sc_logic 1 signal 5 } 
	{ position_z_q0 sc_in sc_lv 64 signal 5 } 
	{ NL_address0 sc_out sc_lv 12 signal 6 } 
	{ NL_ce0 sc_out sc_logic 1 signal 6 } 
	{ NL_q0 sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "force_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "force_x", "role": "address0" }} , 
 	{ "name": "force_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x", "role": "ce0" }} , 
 	{ "name": "force_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x", "role": "we0" }} , 
 	{ "name": "force_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "force_x", "role": "d0" }} , 
 	{ "name": "force_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "force_y", "role": "address0" }} , 
 	{ "name": "force_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y", "role": "ce0" }} , 
 	{ "name": "force_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y", "role": "we0" }} , 
 	{ "name": "force_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "force_y", "role": "d0" }} , 
 	{ "name": "force_z_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "force_z", "role": "address0" }} , 
 	{ "name": "force_z_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z", "role": "ce0" }} , 
 	{ "name": "force_z_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z", "role": "we0" }} , 
 	{ "name": "force_z_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "force_z", "role": "d0" }} , 
 	{ "name": "position_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "position_x", "role": "address0" }} , 
 	{ "name": "position_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_x", "role": "ce0" }} , 
 	{ "name": "position_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "position_x", "role": "q0" }} , 
 	{ "name": "position_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "position_y", "role": "address0" }} , 
 	{ "name": "position_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_y", "role": "ce0" }} , 
 	{ "name": "position_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "position_y", "role": "q0" }} , 
 	{ "name": "position_z_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "position_z", "role": "address0" }} , 
 	{ "name": "position_z_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_z", "role": "ce0" }} , 
 	{ "name": "position_z_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "position_z", "role": "q0" }} , 
 	{ "name": "NL_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "NL", "role": "address0" }} , 
 	{ "name": "NL_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NL", "role": "ce0" }} , 
 	{ "name": "NL_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "NL", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "md_kernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "262913", "EstimateLatencyMax" : "262913",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "force_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "force_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "force_z", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "position_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_z", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "NL", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_j", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state67"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_i", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U7", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	md_kernel {
		force_x {Type O LastRead -1 FirstWrite 3}
		force_y {Type O LastRead -1 FirstWrite 3}
		force_z {Type O LastRead -1 FirstWrite 3}
		position_x {Type I LastRead 4 FirstWrite -1}
		position_y {Type I LastRead 4 FirstWrite -1}
		position_z {Type I LastRead 4 FirstWrite -1}
		NL {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "262913", "Max" : "262913"}
	, {"Name" : "Interval", "Min" : "262914", "Max" : "262914"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	force_x { ap_memory {  { force_x_address0 mem_address 1 8 }  { force_x_ce0 mem_ce 1 1 }  { force_x_we0 mem_we 1 1 }  { force_x_d0 mem_din 1 64 } } }
	force_y { ap_memory {  { force_y_address0 mem_address 1 8 }  { force_y_ce0 mem_ce 1 1 }  { force_y_we0 mem_we 1 1 }  { force_y_d0 mem_din 1 64 } } }
	force_z { ap_memory {  { force_z_address0 mem_address 1 8 }  { force_z_ce0 mem_ce 1 1 }  { force_z_we0 mem_we 1 1 }  { force_z_d0 mem_din 1 64 } } }
	position_x { ap_memory {  { position_x_address0 mem_address 1 8 }  { position_x_ce0 mem_ce 1 1 }  { position_x_q0 in_data 0 64 } } }
	position_y { ap_memory {  { position_y_address0 mem_address 1 8 }  { position_y_ce0 mem_ce 1 1 }  { position_y_q0 in_data 0 64 } } }
	position_z { ap_memory {  { position_z_address0 mem_address 1 8 }  { position_z_ce0 mem_ce 1 1 }  { position_z_q0 in_data 0 64 } } }
	NL { ap_memory {  { NL_address0 mem_address 1 12 }  { NL_ce0 mem_ce 1 1 }  { NL_q0 in_data 0 32 } } }
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
