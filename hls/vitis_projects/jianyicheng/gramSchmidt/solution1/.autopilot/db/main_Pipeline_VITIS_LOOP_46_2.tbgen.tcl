set moduleName main_Pipeline_VITIS_LOOP_46_2
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
set C_modelName {main_Pipeline_VITIS_LOOP_46_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln52_4 int 5 regular  }
	{ a_s float 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ nrm_3_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln52_4", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "a_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "nrm_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln52_4 sc_in sc_lv 5 signal 0 } 
	{ a_s_address0 sc_out sc_lv 10 signal 1 } 
	{ a_s_ce0 sc_out sc_logic 1 signal 1 } 
	{ a_s_q0 sc_in sc_lv 32 signal 1 } 
	{ nrm_3_out sc_out sc_lv 32 signal 2 } 
	{ nrm_3_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ grp_fu_182_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_182_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_182_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_182_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_182_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_189_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_189_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_189_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_189_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln52_4", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln52_4", "role": "default" }} , 
 	{ "name": "a_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "a_s", "role": "address0" }} , 
 	{ "name": "a_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_s", "role": "ce0" }} , 
 	{ "name": "a_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_s", "role": "q0" }} , 
 	{ "name": "nrm_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nrm_3_out", "role": "default" }} , 
 	{ "name": "nrm_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nrm_3_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_182_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_182_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_182_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_189_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_46_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "333", "EstimateLatencyMax" : "333",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln52_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nrm_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_46_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "10", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_46_2 {
		zext_ln52_4 {Type I LastRead 0 FirstWrite -1}
		a_s {Type I LastRead 1 FirstWrite -1}
		nrm_3_out {Type O LastRead -1 FirstWrite 11}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "333", "Max" : "333"}
	, {"Name" : "Interval", "Min" : "333", "Max" : "333"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln52_4 { ap_none {  { zext_ln52_4 in_data 0 5 } } }
	a_s { ap_memory {  { a_s_address0 mem_address 1 10 }  { a_s_ce0 mem_ce 1 1 }  { a_s_q0 mem_dout 0 32 } } }
	nrm_3_out { ap_vld {  { nrm_3_out out_data 1 32 }  { nrm_3_out_ap_vld out_vld 1 1 } } }
}