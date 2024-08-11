set moduleName gramSchmidt
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
set C_modelName {gramSchmidt}
set C_modelType { void 0 }
set C_modelArgList {
	{ a int 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ r int 32 regular {array 1024 { 0 3 } 0 1 }  }
	{ q int 32 regular {array 1024 { 2 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "a", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "r", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "q", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ a_address0 sc_out sc_lv 10 signal 0 } 
	{ a_ce0 sc_out sc_logic 1 signal 0 } 
	{ a_we0 sc_out sc_logic 1 signal 0 } 
	{ a_d0 sc_out sc_lv 32 signal 0 } 
	{ a_q0 sc_in sc_lv 32 signal 0 } 
	{ a_address1 sc_out sc_lv 10 signal 0 } 
	{ a_ce1 sc_out sc_logic 1 signal 0 } 
	{ a_we1 sc_out sc_logic 1 signal 0 } 
	{ a_d1 sc_out sc_lv 32 signal 0 } 
	{ a_q1 sc_in sc_lv 32 signal 0 } 
	{ r_address0 sc_out sc_lv 10 signal 1 } 
	{ r_ce0 sc_out sc_logic 1 signal 1 } 
	{ r_we0 sc_out sc_logic 1 signal 1 } 
	{ r_d0 sc_out sc_lv 32 signal 1 } 
	{ q_address0 sc_out sc_lv 10 signal 2 } 
	{ q_ce0 sc_out sc_logic 1 signal 2 } 
	{ q_we0 sc_out sc_logic 1 signal 2 } 
	{ q_d0 sc_out sc_lv 32 signal 2 } 
	{ q_q0 sc_in sc_lv 32 signal 2 } 
	{ q_address1 sc_out sc_lv 10 signal 2 } 
	{ q_ce1 sc_out sc_logic 1 signal 2 } 
	{ q_q1 sc_in sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "a", "role": "address0" }} , 
 	{ "name": "a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ce0" }} , 
 	{ "name": "a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "we0" }} , 
 	{ "name": "a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "d0" }} , 
 	{ "name": "a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "q0" }} , 
 	{ "name": "a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "a", "role": "address1" }} , 
 	{ "name": "a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ce1" }} , 
 	{ "name": "a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "we1" }} , 
 	{ "name": "a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "d1" }} , 
 	{ "name": "a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "q1" }} , 
 	{ "name": "r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r", "role": "address0" }} , 
 	{ "name": "r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r", "role": "ce0" }} , 
 	{ "name": "r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r", "role": "we0" }} , 
 	{ "name": "r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "r", "role": "d0" }} , 
 	{ "name": "q_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "q", "role": "address0" }} , 
 	{ "name": "q_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q", "role": "ce0" }} , 
 	{ "name": "q_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q", "role": "we0" }} , 
 	{ "name": "q_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "q", "role": "d0" }} , 
 	{ "name": "q_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "q", "role": "q0" }} , 
 	{ "name": "q_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "q", "role": "address1" }} , 
 	{ "name": "q_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q", "role": "ce1" }} , 
 	{ "name": "q_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "q", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "6", "70", "71"],
		"CDFG" : "gramSchmidt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8001", "EstimateLatencyMax" : "191233",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120", "Port" : "a", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "3", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_40_3_fu_110", "Port" : "a", "Inst_start_state" : "31", "Inst_end_state" : "32"},
					{"ID" : "1", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_36_2_fu_102", "Port" : "a", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "r", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120", "Port" : "r", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120", "Port" : "q", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "3", "SubInstance" : "grp_gramSchmidt_Pipeline_VITIS_LOOP_40_3_fu_110", "Port" : "q", "Inst_start_state" : "31", "Inst_end_state" : "32"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "36", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_36_2_fu_102", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "gramSchmidt_Pipeline_VITIS_LOOP_36_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "168", "EstimateLatencyMax" : "168",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln42_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "a", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nrm_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_36_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_36_2_fu_102.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_40_3_fu_110", "Parent" : "0", "Child" : ["4", "5"],
		"CDFG" : "gramSchmidt_Pipeline_VITIS_LOOP_40_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "45", "EstimateLatencyMax" : "45",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln42_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "a", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nrm_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "q", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_40_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_40_3_fu_110.fdiv_32ns_32ns_32_10_no_dsp_1_U6", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_40_3_fu_110.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69"],
		"CDFG" : "gramSchmidt_Pipeline_VITIS_LOOP_42_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "5728",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln42_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "a", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bitcast_ln45", "Type" : "None", "Direction" : "I"},
			{"Name" : "k", "Type" : "None", "Direction" : "I"},
			{"Name" : "q", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln42_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln42_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln42_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "r", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_42_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "184", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage22", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage22_subdone", "QuitState" : "ap_ST_fsm_pp0_stage22", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage22_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U13", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U14", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U15", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U16", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U17", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U18", "Parent" : "6"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U19", "Parent" : "6"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U20", "Parent" : "6"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U21", "Parent" : "6"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U22", "Parent" : "6"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U23", "Parent" : "6"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U24", "Parent" : "6"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U25", "Parent" : "6"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U26", "Parent" : "6"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U27", "Parent" : "6"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U28", "Parent" : "6"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U29", "Parent" : "6"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U30", "Parent" : "6"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U31", "Parent" : "6"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U32", "Parent" : "6"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U33", "Parent" : "6"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U34", "Parent" : "6"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U35", "Parent" : "6"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U36", "Parent" : "6"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U37", "Parent" : "6"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U38", "Parent" : "6"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U39", "Parent" : "6"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U40", "Parent" : "6"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U41", "Parent" : "6"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U42", "Parent" : "6"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fsub_32ns_32ns_32_5_full_dsp_1_U43", "Parent" : "6"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U44", "Parent" : "6"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U45", "Parent" : "6"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U46", "Parent" : "6"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U47", "Parent" : "6"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U48", "Parent" : "6"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U49", "Parent" : "6"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U50", "Parent" : "6"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U51", "Parent" : "6"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U52", "Parent" : "6"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U53", "Parent" : "6"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U54", "Parent" : "6"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U55", "Parent" : "6"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U56", "Parent" : "6"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U57", "Parent" : "6"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U58", "Parent" : "6"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U59", "Parent" : "6"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U60", "Parent" : "6"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U61", "Parent" : "6"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U62", "Parent" : "6"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U63", "Parent" : "6"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U64", "Parent" : "6"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U65", "Parent" : "6"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U66", "Parent" : "6"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U67", "Parent" : "6"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U68", "Parent" : "6"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U69", "Parent" : "6"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U70", "Parent" : "6"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U71", "Parent" : "6"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U72", "Parent" : "6"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U73", "Parent" : "6"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.fmul_32ns_32ns_32_4_max_dsp_1_U74", "Parent" : "6"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gramSchmidt_Pipeline_VITIS_LOOP_42_4_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U87", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U88", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	gramSchmidt {
		a {Type IO LastRead 23 FirstWrite -1}
		r {Type O LastRead -1 FirstWrite 30}
		q {Type IO LastRead 32 FirstWrite -1}}
	gramSchmidt_Pipeline_VITIS_LOOP_36_2 {
		zext_ln42_4 {Type I LastRead 0 FirstWrite -1}
		a {Type I LastRead 0 FirstWrite -1}
		nrm_out {Type O LastRead -1 FirstWrite 6}}
	gramSchmidt_Pipeline_VITIS_LOOP_40_3 {
		zext_ln42_4 {Type I LastRead 0 FirstWrite -1}
		a {Type I LastRead 0 FirstWrite -1}
		nrm_2 {Type I LastRead 0 FirstWrite -1}
		q {Type O LastRead -1 FirstWrite 12}}
	gramSchmidt_Pipeline_VITIS_LOOP_42_4 {
		zext_ln42_1 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		a {Type IO LastRead 23 FirstWrite 175}
		bitcast_ln45 {Type I LastRead 0 FirstWrite -1}
		k {Type I LastRead 0 FirstWrite -1}
		q {Type I LastRead 16 FirstWrite -1}
		zext_ln42_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln42_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln42_4 {Type I LastRead 0 FirstWrite -1}
		r {Type O LastRead -1 FirstWrite 166}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8001", "Max" : "191233"}
	, {"Name" : "Interval", "Min" : "8002", "Max" : "191234"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	a { ap_memory {  { a_address0 mem_address 1 10 }  { a_ce0 mem_ce 1 1 }  { a_we0 mem_we 1 1 }  { a_d0 mem_din 1 32 }  { a_q0 mem_dout 0 32 }  { a_address1 MemPortADDR2 1 10 }  { a_ce1 MemPortCE2 1 1 }  { a_we1 MemPortWE2 1 1 }  { a_d1 MemPortDIN2 1 32 }  { a_q1 MemPortDOUT2 0 32 } } }
	r { ap_memory {  { r_address0 mem_address 1 10 }  { r_ce0 mem_ce 1 1 }  { r_we0 mem_we 1 1 }  { r_d0 mem_din 1 32 } } }
	q { ap_memory {  { q_address0 mem_address 1 10 }  { q_ce0 mem_ce 1 1 }  { q_we0 mem_we 1 1 }  { q_d0 mem_din 1 32 }  { q_q0 mem_dout 0 32 }  { q_address1 MemPortADDR2 1 10 }  { q_ce1 MemPortCE2 1 1 }  { q_q1 MemPortDOUT2 0 32 } } }
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
