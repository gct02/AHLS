set moduleName gemver_Pipeline_VITIS_LOOP_14_1_loop_2
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
set C_modelName {gemver_Pipeline_VITIS_LOOP_14_1_loop_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ u1 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ u2 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ v1 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ v2 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ A int 32 regular {array 65536 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "u1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "u2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ u1_address0 sc_out sc_lv 8 signal 0 } 
	{ u1_ce0 sc_out sc_logic 1 signal 0 } 
	{ u1_q0 sc_in sc_lv 32 signal 0 } 
	{ u2_address0 sc_out sc_lv 8 signal 1 } 
	{ u2_ce0 sc_out sc_logic 1 signal 1 } 
	{ u2_q0 sc_in sc_lv 32 signal 1 } 
	{ v1_address0 sc_out sc_lv 8 signal 2 } 
	{ v1_ce0 sc_out sc_logic 1 signal 2 } 
	{ v1_q0 sc_in sc_lv 32 signal 2 } 
	{ v2_address0 sc_out sc_lv 8 signal 3 } 
	{ v2_ce0 sc_out sc_logic 1 signal 3 } 
	{ v2_q0 sc_in sc_lv 32 signal 3 } 
	{ A_address0 sc_out sc_lv 16 signal 4 } 
	{ A_ce0 sc_out sc_logic 1 signal 4 } 
	{ A_we0 sc_out sc_logic 1 signal 4 } 
	{ A_d0 sc_out sc_lv 32 signal 4 } 
	{ A_address1 sc_out sc_lv 16 signal 4 } 
	{ A_ce1 sc_out sc_logic 1 signal 4 } 
	{ A_q1 sc_in sc_lv 32 signal 4 } 
	{ grp_fu_76_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_76_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_76_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_76_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_76_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_80_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_80_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_80_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_80_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "u1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u1", "role": "address0" }} , 
 	{ "name": "u1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u1", "role": "ce0" }} , 
 	{ "name": "u1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u1", "role": "q0" }} , 
 	{ "name": "u2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u2", "role": "address0" }} , 
 	{ "name": "u2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u2", "role": "ce0" }} , 
 	{ "name": "u2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u2", "role": "q0" }} , 
 	{ "name": "v1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v1", "role": "address0" }} , 
 	{ "name": "v1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v1", "role": "ce0" }} , 
 	{ "name": "v1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v1", "role": "q0" }} , 
 	{ "name": "v2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v2", "role": "address0" }} , 
 	{ "name": "v2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v2", "role": "ce0" }} , 
 	{ "name": "v2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v2", "role": "q0" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "A_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A", "role": "address1" }} , 
 	{ "name": "A_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce1" }} , 
 	{ "name": "A_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q1" }} , 
 	{ "name": "grp_fu_76_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_76_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_76_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_76_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_76_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_76_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_76_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_76_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_76_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_76_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_80_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_80_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_80_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_80_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_80_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_80_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_80_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_80_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "gemver_Pipeline_VITIS_LOOP_14_1_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65553", "EstimateLatencyMax" : "65553",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "u1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "u2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1_loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter17", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter17", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	gemver_Pipeline_VITIS_LOOP_14_1_loop_2 {
		u1 {Type I LastRead 1 FirstWrite -1}
		u2 {Type I LastRead 1 FirstWrite -1}
		v1 {Type I LastRead 1 FirstWrite -1}
		v2 {Type I LastRead 1 FirstWrite -1}
		A {Type IO LastRead 10 FirstWrite 17}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "65553", "Max" : "65553"}
	, {"Name" : "Interval", "Min" : "65553", "Max" : "65553"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	u1 { ap_memory {  { u1_address0 mem_address 1 8 }  { u1_ce0 mem_ce 1 1 }  { u1_q0 mem_dout 0 32 } } }
	u2 { ap_memory {  { u2_address0 mem_address 1 8 }  { u2_ce0 mem_ce 1 1 }  { u2_q0 mem_dout 0 32 } } }
	v1 { ap_memory {  { v1_address0 mem_address 1 8 }  { v1_ce0 mem_ce 1 1 }  { v1_q0 mem_dout 0 32 } } }
	v2 { ap_memory {  { v2_address0 mem_address 1 8 }  { v2_ce0 mem_ce 1 1 }  { v2_q0 mem_dout 0 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 16 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 }  { A_address1 MemPortADDR2 1 16 }  { A_ce1 MemPortCE2 1 1 }  { A_q1 MemPortDOUT2 0 32 } } }
}
