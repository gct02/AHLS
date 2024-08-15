set moduleName main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8
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
set C_modelName {main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8}
set C_modelType { void 0 }
set C_modelArgList {
	{ A_s float 32 regular {array 65536 { 1 3 } 1 1 }  }
	{ x_s float 32 regular {array 256 { 1 3 } 1 1 }  }
	{ w_s float 32 regular {array 256 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "w_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_s_address0 sc_out sc_lv 16 signal 0 } 
	{ A_s_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_s_q0 sc_in sc_lv 32 signal 0 } 
	{ x_s_address0 sc_out sc_lv 8 signal 1 } 
	{ x_s_ce0 sc_out sc_logic 1 signal 1 } 
	{ x_s_q0 sc_in sc_lv 32 signal 1 } 
	{ w_s_address0 sc_out sc_lv 8 signal 2 } 
	{ w_s_ce0 sc_out sc_logic 1 signal 2 } 
	{ w_s_we0 sc_out sc_logic 1 signal 2 } 
	{ w_s_d0 sc_out sc_lv 32 signal 2 } 
	{ w_s_q0 sc_in sc_lv 32 signal 2 } 
	{ grp_fu_196_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_196_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_196_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_196_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_196_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_200_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_200_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_200_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_200_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A_s", "role": "address0" }} , 
 	{ "name": "A_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce0" }} , 
 	{ "name": "A_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q0" }} , 
 	{ "name": "x_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_s", "role": "address0" }} , 
 	{ "name": "x_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_s", "role": "ce0" }} , 
 	{ "name": "x_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_s", "role": "q0" }} , 
 	{ "name": "w_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "w_s", "role": "address0" }} , 
 	{ "name": "w_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_s", "role": "ce0" }} , 
 	{ "name": "w_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_s", "role": "we0" }} , 
 	{ "name": "w_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w_s", "role": "d0" }} , 
 	{ "name": "w_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w_s", "role": "q0" }} , 
 	{ "name": "grp_fu_196_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_196_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_196_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_196_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_196_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_196_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_196_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_196_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_196_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_196_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_200_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_200_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_200_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_200_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_200_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_200_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_200_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_200_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "720917", "EstimateLatencyMax" : "720917",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "w_s", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_93_7_VITIS_LOOP_95_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8 {
		A_s {Type I LastRead 2 FirstWrite -1}
		x_s {Type I LastRead 1 FirstWrite -1}
		w_s {Type IO LastRead 12 FirstWrite 30}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "720917", "Max" : "720917"}
	, {"Name" : "Interval", "Min" : "720917", "Max" : "720917"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A_s { ap_memory {  { A_s_address0 mem_address 1 16 }  { A_s_ce0 mem_ce 1 1 }  { A_s_q0 mem_dout 0 32 } } }
	x_s { ap_memory {  { x_s_address0 mem_address 1 8 }  { x_s_ce0 mem_ce 1 1 }  { x_s_q0 mem_dout 0 32 } } }
	w_s { ap_memory {  { w_s_address0 mem_address 1 8 }  { w_s_ce0 mem_ce 1 1 }  { w_s_we0 mem_we 1 1 }  { w_s_d0 mem_din 1 32 }  { w_s_q0 mem_dout 0 32 } } }
}
