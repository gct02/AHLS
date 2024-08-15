set moduleName matrixmult_Pipeline_VITIS_LOOP_208_21
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
set C_modelName {matrixmult_Pipeline_VITIS_LOOP_208_21}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln176_1 int 5 regular  }
	{ A_4 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ B_2 float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ s_4_6_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln176_1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "A_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_4_6_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln176_1 sc_in sc_lv 5 signal 0 } 
	{ A_4_address0 sc_out sc_lv 13 signal 1 } 
	{ A_4_ce0 sc_out sc_logic 1 signal 1 } 
	{ A_4_q0 sc_in sc_lv 32 signal 1 } 
	{ B_2_address0 sc_out sc_lv 13 signal 2 } 
	{ B_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ B_2_q0 sc_in sc_lv 32 signal 2 } 
	{ s_4_6_out sc_out sc_lv 32 signal 3 } 
	{ s_4_6_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ grp_fu_3484_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3484_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3484_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3484_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3488_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3488_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3488_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_3488_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_3488_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3492_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3492_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3492_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_3492_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3492_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln176_1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln176_1", "role": "default" }} , 
 	{ "name": "A_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A_4", "role": "address0" }} , 
 	{ "name": "A_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_4", "role": "ce0" }} , 
 	{ "name": "A_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_4", "role": "q0" }} , 
 	{ "name": "B_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B_2", "role": "address0" }} , 
 	{ "name": "B_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_2", "role": "ce0" }} , 
 	{ "name": "B_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_2", "role": "q0" }} , 
 	{ "name": "s_4_6_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_4_6_out", "role": "default" }} , 
 	{ "name": "s_4_6_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_4_6_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_3484_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3484_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3484_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3484_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3484_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3484_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3484_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3484_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3488_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3488_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3488_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3488_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3488_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_3488_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_3488_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3488_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3488_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3488_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3492_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3492_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3492_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3492_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3492_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_3492_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_3492_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3492_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3492_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3492_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "matrixmult_Pipeline_VITIS_LOOP_208_21",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90124", "EstimateLatencyMax" : "90124",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln176_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_208_21", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matrixmult_Pipeline_VITIS_LOOP_208_21 {
		zext_ln176_1 {Type I LastRead 0 FirstWrite -1}
		A_4 {Type I LastRead 1 FirstWrite -1}
		B_2 {Type I LastRead 1 FirstWrite -1}
		s_4_6_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "90124", "Max" : "90124"}
	, {"Name" : "Interval", "Min" : "90124", "Max" : "90124"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln176_1 { ap_none {  { zext_ln176_1 in_data 0 5 } } }
	A_4 { ap_memory {  { A_4_address0 mem_address 1 13 }  { A_4_ce0 mem_ce 1 1 }  { A_4_q0 mem_dout 0 32 } } }
	B_2 { ap_memory {  { B_2_address0 mem_address 1 13 }  { B_2_ce0 mem_ce 1 1 }  { B_2_q0 mem_dout 0 32 } } }
	s_4_6_out { ap_vld {  { s_4_6_out out_data 1 32 }  { s_4_6_out_ap_vld out_vld 1 1 } } }
}
