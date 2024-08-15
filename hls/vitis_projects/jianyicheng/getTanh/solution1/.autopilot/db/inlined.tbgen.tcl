set moduleName inlined
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
set C_modelName {inlined}
set C_modelType { void 0 }
set C_modelArgList {
	{ A int 32 regular {array 1000 { 2 3 } 1 1 }  }
	{ addr_in int 10 regular {array 1000 { 1 3 } 1 1 }  }
	{ addr_out int 10 regular {array 1000 { 1 3 } 1 1 }  }
	{ sinh int 17 regular {array 5 { 1 } 1 1 } {global 0}  }
	{ cosh int 17 regular {array 5 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "addr_in", "interface" : "memory", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "addr_out", "interface" : "memory", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "sinh", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "cosh", "interface" : "memory", "bitwidth" : 17, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 10 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_we0 sc_out sc_logic 1 signal 0 } 
	{ A_d0 sc_out sc_lv 32 signal 0 } 
	{ A_q0 sc_in sc_lv 32 signal 0 } 
	{ addr_in_address0 sc_out sc_lv 10 signal 1 } 
	{ addr_in_ce0 sc_out sc_logic 1 signal 1 } 
	{ addr_in_q0 sc_in sc_lv 10 signal 1 } 
	{ addr_out_address0 sc_out sc_lv 10 signal 2 } 
	{ addr_out_ce0 sc_out sc_logic 1 signal 2 } 
	{ addr_out_q0 sc_in sc_lv 10 signal 2 } 
	{ sinh_address0 sc_out sc_lv 3 signal 3 } 
	{ sinh_ce0 sc_out sc_logic 1 signal 3 } 
	{ sinh_q0 sc_in sc_lv 17 signal 3 } 
	{ cosh_address0 sc_out sc_lv 3 signal 4 } 
	{ cosh_ce0 sc_out sc_logic 1 signal 4 } 
	{ cosh_q0 sc_in sc_lv 17 signal 4 } 
	{ grp_fu_114_p_din0 sc_out sc_lv 17 signal -1 } 
	{ grp_fu_114_p_din1 sc_out sc_lv 27 signal -1 } 
	{ grp_fu_114_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_114_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_118_p_din0 sc_out sc_lv 17 signal -1 } 
	{ grp_fu_118_p_din1 sc_out sc_lv 27 signal -1 } 
	{ grp_fu_118_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_118_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_122_p_din0 sc_out sc_lv 17 signal -1 } 
	{ grp_fu_122_p_din1 sc_out sc_lv 28 signal -1 } 
	{ grp_fu_122_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_122_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_126_p_din0 sc_out sc_lv 17 signal -1 } 
	{ grp_fu_126_p_din1 sc_out sc_lv 28 signal -1 } 
	{ grp_fu_126_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_126_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "addr_in_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "address0" }} , 
 	{ "name": "addr_in_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_in", "role": "ce0" }} , 
 	{ "name": "addr_in_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "q0" }} , 
 	{ "name": "addr_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "address0" }} , 
 	{ "name": "addr_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_out", "role": "ce0" }} , 
 	{ "name": "addr_out_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "q0" }} , 
 	{ "name": "sinh_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sinh", "role": "address0" }} , 
 	{ "name": "sinh_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sinh", "role": "ce0" }} , 
 	{ "name": "sinh_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "sinh", "role": "q0" }} , 
 	{ "name": "cosh_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cosh", "role": "address0" }} , 
 	{ "name": "cosh_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cosh", "role": "ce0" }} , 
 	{ "name": "cosh_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "cosh", "role": "q0" }} , 
 	{ "name": "grp_fu_114_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "grp_fu_114_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_114_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "grp_fu_114_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_114_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_114_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_114_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_114_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_118_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "grp_fu_118_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_118_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "grp_fu_118_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_118_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_118_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_118_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_118_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_122_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "grp_fu_122_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_122_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "grp_fu_122_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_122_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_122_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_122_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_122_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "grp_fu_126_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "grp_fu_126_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_126_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_126_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "inlined",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68007", "EstimateLatencyMax" : "68007",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "addr_in", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "addr_out", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sinh", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cosh", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_33_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "68", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage5", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage5_subdone", "QuitState" : "ap_ST_fsm_pp0_stage5", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage5_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_32ns_20s_32_36_1_U20", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	inlined {
		A {Type IO LastRead 2 FirstWrite 73}
		addr_in {Type I LastRead 0 FirstWrite -1}
		addr_out {Type I LastRead 68 FirstWrite -1}
		sinh {Type I LastRead 6 FirstWrite -1}
		cosh {Type I LastRead 6 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "68007", "Max" : "68007"}
	, {"Name" : "Interval", "Min" : "68007", "Max" : "68007"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 }  { A_q0 mem_dout 0 32 } } }
	addr_in { ap_memory {  { addr_in_address0 mem_address 1 10 }  { addr_in_ce0 mem_ce 1 1 }  { addr_in_q0 mem_dout 0 10 } } }
	addr_out { ap_memory {  { addr_out_address0 mem_address 1 10 }  { addr_out_ce0 mem_ce 1 1 }  { addr_out_q0 mem_dout 0 10 } } }
	sinh { ap_memory {  { sinh_address0 mem_address 1 3 }  { sinh_ce0 mem_ce 1 1 }  { sinh_q0 mem_dout 0 17 } } }
	cosh { ap_memory {  { cosh_address0 mem_address 1 3 }  { cosh_ce0 mem_ce 1 1 }  { cosh_q0 mem_dout 0 17 } } }
}
