set moduleName getTanh_Pipeline_VITIS_LOOP_27_1
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
set C_modelName {getTanh_Pipeline_VITIS_LOOP_27_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ addr_out int 32 regular {array 1000 { 1 3 } 1 1 }  }
	{ A int 32 regular {array 1000 { 2 3 } 1 1 }  }
	{ addr_in int 32 regular {array 1000 { 1 3 } 1 1 }  }
	{ atanh_load int 32 regular  }
	{ atanh_load_1 int 32 regular  }
	{ atanh_load_2 int 32 regular  }
	{ atanh_load_3 int 32 regular  }
	{ atanh_load_4 int 32 regular  }
	{ atanh_load_5 int 32 regular  }
	{ atanh_load_6 int 32 regular  }
	{ atanh_load_7 int 32 regular  }
	{ atanh_load_8 int 32 regular  }
	{ atanh_load_9 int 32 regular  }
	{ atanh_load_10 int 32 regular  }
	{ sinh int 32 regular {array 5 { 1 3 } 1 1 }  }
	{ cosh int 32 regular {array 5 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "addr_out", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "addr_in", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "atanh_load_10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sinh", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cosh", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ addr_out_address0 sc_out sc_lv 10 signal 0 } 
	{ addr_out_ce0 sc_out sc_logic 1 signal 0 } 
	{ addr_out_q0 sc_in sc_lv 32 signal 0 } 
	{ A_address0 sc_out sc_lv 10 signal 1 } 
	{ A_ce0 sc_out sc_logic 1 signal 1 } 
	{ A_we0 sc_out sc_logic 1 signal 1 } 
	{ A_d0 sc_out sc_lv 32 signal 1 } 
	{ A_q0 sc_in sc_lv 32 signal 1 } 
	{ addr_in_address0 sc_out sc_lv 10 signal 2 } 
	{ addr_in_ce0 sc_out sc_logic 1 signal 2 } 
	{ addr_in_q0 sc_in sc_lv 32 signal 2 } 
	{ atanh_load sc_in sc_lv 32 signal 3 } 
	{ atanh_load_1 sc_in sc_lv 32 signal 4 } 
	{ atanh_load_2 sc_in sc_lv 32 signal 5 } 
	{ atanh_load_3 sc_in sc_lv 32 signal 6 } 
	{ atanh_load_4 sc_in sc_lv 32 signal 7 } 
	{ atanh_load_5 sc_in sc_lv 32 signal 8 } 
	{ atanh_load_6 sc_in sc_lv 32 signal 9 } 
	{ atanh_load_7 sc_in sc_lv 32 signal 10 } 
	{ atanh_load_8 sc_in sc_lv 32 signal 11 } 
	{ atanh_load_9 sc_in sc_lv 32 signal 12 } 
	{ atanh_load_10 sc_in sc_lv 32 signal 13 } 
	{ sinh_address0 sc_out sc_lv 3 signal 14 } 
	{ sinh_ce0 sc_out sc_logic 1 signal 14 } 
	{ sinh_q0 sc_in sc_lv 32 signal 14 } 
	{ cosh_address0 sc_out sc_lv 3 signal 15 } 
	{ cosh_ce0 sc_out sc_logic 1 signal 15 } 
	{ cosh_q0 sc_in sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "addr_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "address0" }} , 
 	{ "name": "addr_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_out", "role": "ce0" }} , 
 	{ "name": "addr_out_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "addr_out", "role": "q0" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "addr_in_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "address0" }} , 
 	{ "name": "addr_in_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_in", "role": "ce0" }} , 
 	{ "name": "addr_in_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "addr_in", "role": "q0" }} , 
 	{ "name": "atanh_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load", "role": "default" }} , 
 	{ "name": "atanh_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_1", "role": "default" }} , 
 	{ "name": "atanh_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_2", "role": "default" }} , 
 	{ "name": "atanh_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_3", "role": "default" }} , 
 	{ "name": "atanh_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_4", "role": "default" }} , 
 	{ "name": "atanh_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_5", "role": "default" }} , 
 	{ "name": "atanh_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_6", "role": "default" }} , 
 	{ "name": "atanh_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_7", "role": "default" }} , 
 	{ "name": "atanh_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_8", "role": "default" }} , 
 	{ "name": "atanh_load_9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_9", "role": "default" }} , 
 	{ "name": "atanh_load_10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "atanh_load_10", "role": "default" }} , 
 	{ "name": "sinh_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sinh", "role": "address0" }} , 
 	{ "name": "sinh_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sinh", "role": "ce0" }} , 
 	{ "name": "sinh_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sinh", "role": "q0" }} , 
 	{ "name": "cosh_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cosh", "role": "address0" }} , 
 	{ "name": "cosh_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cosh", "role": "ce0" }} , 
 	{ "name": "cosh_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cosh", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "getTanh_Pipeline_VITIS_LOOP_27_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "46004", "EstimateLatencyMax" : "46004",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "addr_out", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "addr_in", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "atanh_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "atanh_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sinh", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cosh", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_27_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "46", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_27s_32_2_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_27s_32_2_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_28s_32_2_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_28s_32_2_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_32ns_20s_32_36_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	getTanh_Pipeline_VITIS_LOOP_27_1 {
		addr_out {Type I LastRead 46 FirstWrite -1}
		A {Type IO LastRead 1 FirstWrite 48}
		addr_in {Type I LastRead 0 FirstWrite -1}
		atanh_load {Type I LastRead 0 FirstWrite -1}
		atanh_load_1 {Type I LastRead 0 FirstWrite -1}
		atanh_load_2 {Type I LastRead 0 FirstWrite -1}
		atanh_load_3 {Type I LastRead 0 FirstWrite -1}
		atanh_load_4 {Type I LastRead 0 FirstWrite -1}
		atanh_load_5 {Type I LastRead 0 FirstWrite -1}
		atanh_load_6 {Type I LastRead 0 FirstWrite -1}
		atanh_load_7 {Type I LastRead 0 FirstWrite -1}
		atanh_load_8 {Type I LastRead 0 FirstWrite -1}
		atanh_load_9 {Type I LastRead 0 FirstWrite -1}
		atanh_load_10 {Type I LastRead 0 FirstWrite -1}
		sinh {Type I LastRead 3 FirstWrite -1}
		cosh {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "46004", "Max" : "46004"}
	, {"Name" : "Interval", "Min" : "46004", "Max" : "46004"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	addr_out { ap_memory {  { addr_out_address0 mem_address 1 10 }  { addr_out_ce0 mem_ce 1 1 }  { addr_out_q0 in_data 0 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 }  { A_q0 mem_dout 0 32 } } }
	addr_in { ap_memory {  { addr_in_address0 mem_address 1 10 }  { addr_in_ce0 mem_ce 1 1 }  { addr_in_q0 in_data 0 32 } } }
	atanh_load { ap_none {  { atanh_load in_data 0 32 } } }
	atanh_load_1 { ap_none {  { atanh_load_1 in_data 0 32 } } }
	atanh_load_2 { ap_none {  { atanh_load_2 in_data 0 32 } } }
	atanh_load_3 { ap_none {  { atanh_load_3 in_data 0 32 } } }
	atanh_load_4 { ap_none {  { atanh_load_4 in_data 0 32 } } }
	atanh_load_5 { ap_none {  { atanh_load_5 in_data 0 32 } } }
	atanh_load_6 { ap_none {  { atanh_load_6 in_data 0 32 } } }
	atanh_load_7 { ap_none {  { atanh_load_7 in_data 0 32 } } }
	atanh_load_8 { ap_none {  { atanh_load_8 in_data 0 32 } } }
	atanh_load_9 { ap_none {  { atanh_load_9 in_data 0 32 } } }
	atanh_load_10 { ap_none {  { atanh_load_10 in_data 0 32 } } }
	sinh { ap_memory {  { sinh_address0 mem_address 1 3 }  { sinh_ce0 mem_ce 1 1 }  { sinh_q0 mem_dout 0 32 } } }
	cosh { ap_memory {  { cosh_address0 mem_address 1 3 }  { cosh_ce0 mem_ce 1 1 }  { cosh_q0 mem_dout 0 32 } } }
}
