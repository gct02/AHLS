set moduleName evalPos
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
set C_modelName {evalPos}
set C_modelType { void 0 }
set C_modelArgList {
	{ board int 32 regular {array 64 { 1 3 } 1 1 }  }
	{ color int 32 regular {pointer 0}  }
	{ profile int 32 regular {pointer 0}  }
	{ rawMoveCount int 32 unused {array 64 { } 0 1 }  }
	{ pm_2 int 32 regular {array 2 { 1 3 } 1 1 }  }
	{ res int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "board", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "color", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "profile", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rawMoveCount", "interface" : "memory", "bitwidth" : 32, "direction" : "NONE"} , 
 	{ "Name" : "pm_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "res", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ board_address0 sc_out sc_lv 6 signal 0 } 
	{ board_ce0 sc_out sc_logic 1 signal 0 } 
	{ board_q0 sc_in sc_lv 32 signal 0 } 
	{ color sc_in sc_lv 32 signal 1 } 
	{ profile sc_in sc_lv 32 signal 2 } 
	{ rawMoveCount_address0 sc_out sc_lv 6 signal 3 } 
	{ rawMoveCount_ce0 sc_out sc_logic 1 signal 3 } 
	{ rawMoveCount_we0 sc_out sc_logic 1 signal 3 } 
	{ rawMoveCount_d0 sc_out sc_lv 32 signal 3 } 
	{ rawMoveCount_q0 sc_in sc_lv 32 signal 3 } 
	{ rawMoveCount_address1 sc_out sc_lv 6 signal 3 } 
	{ rawMoveCount_ce1 sc_out sc_logic 1 signal 3 } 
	{ rawMoveCount_we1 sc_out sc_logic 1 signal 3 } 
	{ rawMoveCount_d1 sc_out sc_lv 32 signal 3 } 
	{ rawMoveCount_q1 sc_in sc_lv 32 signal 3 } 
	{ pm_2_address0 sc_out sc_lv 1 signal 4 } 
	{ pm_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ pm_2_q0 sc_in sc_lv 32 signal 4 } 
	{ res sc_out sc_lv 32 signal 5 } 
	{ res_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "board_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "board", "role": "address0" }} , 
 	{ "name": "board_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "board", "role": "ce0" }} , 
 	{ "name": "board_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "board", "role": "q0" }} , 
 	{ "name": "color", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "color", "role": "default" }} , 
 	{ "name": "profile", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "profile", "role": "default" }} , 
 	{ "name": "rawMoveCount_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "address0" }} , 
 	{ "name": "rawMoveCount_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "ce0" }} , 
 	{ "name": "rawMoveCount_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "we0" }} , 
 	{ "name": "rawMoveCount_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "d0" }} , 
 	{ "name": "rawMoveCount_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "q0" }} , 
 	{ "name": "rawMoveCount_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "address1" }} , 
 	{ "name": "rawMoveCount_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "ce1" }} , 
 	{ "name": "rawMoveCount_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "we1" }} , 
 	{ "name": "rawMoveCount_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "d1" }} , 
 	{ "name": "rawMoveCount_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rawMoveCount", "role": "q1" }} , 
 	{ "name": "pm_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "pm_2", "role": "address0" }} , 
 	{ "name": "pm_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pm_2", "role": "ce0" }} , 
 	{ "name": "pm_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pm_2", "role": "q0" }} , 
 	{ "name": "res", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "res", "role": "default" }} , 
 	{ "name": "res_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "res", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "8"],
		"CDFG" : "evalPos",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "423", "EstimateLatencyMax" : "423",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "board", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76", "Port" : "board", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "color", "Type" : "None", "Direction" : "I"},
			{"Name" : "profile", "Type" : "None", "Direction" : "I"},
			{"Name" : "rawMoveCount", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "pm_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "res", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7"],
		"CDFG" : "evalPos_Pipeline_VITIS_LOOP_12_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "416", "EstimateLatencyMax" : "416",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "board", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv16_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "centralityValue_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_12_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.fsub_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.fcmp_32ns_32ns_1_2_no_dsp_1_U4", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.urem_6ns_4ns_6_10_1_U5", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.mul_6ns_8ns_13_1_1_U6", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_evalPos_Pipeline_VITIS_LOOP_12_1_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_4_no_dsp_1_U16", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	evalPos {
		board {Type I LastRead 0 FirstWrite -1}
		color {Type I LastRead 5 FirstWrite -1}
		profile {Type I LastRead 0 FirstWrite -1}
		rawMoveCount {Type X LastRead -1 FirstWrite -1}
		pm_2 {Type I LastRead 0 FirstWrite -1}
		res {Type O LastRead -1 FirstWrite 7}}
	evalPos_Pipeline_VITIS_LOOP_12_1 {
		board {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		conv16_i {Type I LastRead 0 FirstWrite -1}
		centralityValue_out {Type O LastRead -1 FirstWrite 30}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "423", "Max" : "423"}
	, {"Name" : "Interval", "Min" : "424", "Max" : "424"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	board { ap_memory {  { board_address0 mem_address 1 6 }  { board_ce0 mem_ce 1 1 }  { board_q0 mem_dout 0 32 } } }
	color { ap_none {  { color in_data 0 32 } } }
	profile { ap_none {  { profile in_data 0 32 } } }
	rawMoveCount { ap_memory {  { rawMoveCount_address0 mem_address 1 6 }  { rawMoveCount_ce0 mem_ce 1 1 }  { rawMoveCount_we0 mem_we 1 1 }  { rawMoveCount_d0 mem_din 1 32 }  { rawMoveCount_q0 mem_dout 0 32 }  { rawMoveCount_address1 MemPortADDR2 1 6 }  { rawMoveCount_ce1 MemPortCE2 1 1 }  { rawMoveCount_we1 MemPortWE2 1 1 }  { rawMoveCount_d1 MemPortDIN2 1 32 }  { rawMoveCount_q1 MemPortDOUT2 0 32 } } }
	pm_2 { ap_memory {  { pm_2_address0 mem_address 1 1 }  { pm_2_ce0 mem_ce 1 1 }  { pm_2_q0 in_data 0 32 } } }
	res { ap_vld {  { res out_data 1 32 }  { res_ap_vld out_vld 1 1 } } }
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
