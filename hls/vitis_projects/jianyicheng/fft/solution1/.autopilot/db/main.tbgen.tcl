set moduleName main
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
set C_modelName {main}
set C_modelType { int 32 }
set C_modelArgList {
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 7
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "43"],
		"CDFG" : "main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "23060", "EstimateLatencyMax" : "738324",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "lfsr", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_p_rand_fu_304", "Port" : "lfsr", "Inst_start_state" : "18", "Inst_end_state" : "18"}]},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_fft_fu_310", "Port" : "cos_coefficients_table", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_fft_fu_310", "Port" : "sin_coefficients_table", "Inst_start_state" : "27", "Inst_end_state" : "28"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_373_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage9", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage9_subdone", "PostState" : ["ap_ST_fsm_state27"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_R_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_0_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_2_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_4_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_5_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_6_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.X_I_7_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_rand_fu_304", "Parent" : "0",
		"CDFG" : "p_rand",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "lfsr", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310", "Parent" : "0", "Child" : ["19", "20", "21", "23", "25", "27", "29", "31", "33", "35", "37", "38", "39", "40", "41", "42"],
		"CDFG" : "fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6664", "EstimateLatencyMax" : "721928",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "X_R_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "X_R_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "X_R_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "X_R_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "X_R_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "X_R_2", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "X_R_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "X_R_3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "X_R_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "X_R_4", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "X_R_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "X_R_5", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "X_R_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "X_R_6", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "X_R_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "X_R_7", "Inst_start_state" : "40", "Inst_end_state" : "41"}]},
			{"Name" : "X_I_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "X_I_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "X_I_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "X_I_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "X_I_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "X_I_2", "Inst_start_state" : "15", "Inst_end_state" : "16"}]},
			{"Name" : "X_I_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "X_I_3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "X_I_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "X_I_4", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "X_I_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "X_I_5", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "X_I_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "X_I_6", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "X_I_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "X_I_7", "Inst_start_state" : "40", "Inst_end_state" : "41"}]},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "cos_coefficients_table", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "29", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "cos_coefficients_table", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "31", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "cos_coefficients_table", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "27", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "cos_coefficients_table", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "33", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "cos_coefficients_table", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "23", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "cos_coefficients_table", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "35", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "cos_coefficients_table", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "21", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "cos_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Port" : "sin_coefficients_table", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "29", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Port" : "sin_coefficients_table", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "31", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Port" : "sin_coefficients_table", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "27", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Port" : "sin_coefficients_table", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "33", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Port" : "sin_coefficients_table", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "23", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Port" : "sin_coefficients_table", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "35", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Port" : "sin_coefficients_table", "Inst_start_state" : "40", "Inst_end_state" : "41"},
					{"ID" : "21", "SubInstance" : "grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Port" : "sin_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "loop_0_VITIS_LOOP_39_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_1_VITIS_LOOP_58_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_2_VITIS_LOOP_77_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state7"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_3_VITIS_LOOP_96_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state22"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_4_VITIS_LOOP_115_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state26"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state27"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_5_VITIS_LOOP_134_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state27", "LastState" : ["ap_ST_fsm_state31"], "QuitState" : ["ap_ST_fsm_state27"], "PreState" : ["ap_ST_fsm_state22"], "PostState" : ["ap_ST_fsm_state32"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_6_VITIS_LOOP_153_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state32", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state32"], "PreState" : ["ap_ST_fsm_state27"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_7_VITIS_LOOP_172_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state37", "LastState" : ["ap_ST_fsm_state41"], "QuitState" : ["ap_ST_fsm_state37"], "PreState" : ["ap_ST_fsm_state32"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.cos_coefficients_table_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.sin_coefficients_table_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192", "Parent" : "18", "Child" : ["22"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_41_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln38_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_41_2_fu_192.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207", "Parent" : "18", "Child" : ["24"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_60_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln60", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln57_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_60_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_60_4_fu_207.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222", "Parent" : "18", "Child" : ["26"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_79_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln79", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln76_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_79_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_79_6_fu_222.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237", "Parent" : "18", "Child" : ["28"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_98_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln98", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln95_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_98_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_98_8_fu_237.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252", "Parent" : "18", "Child" : ["30"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_117_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln117", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln114_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_117_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_117_10_fu_252.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267", "Parent" : "18", "Child" : ["32"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_136_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln136", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln133_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_136_12_fu_267.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282", "Parent" : "18", "Child" : ["34"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_155_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln155", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln152_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_155_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_155_14_fu_282.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297", "Parent" : "18", "Child" : ["36"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln171_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.grp_fft_Pipeline_VITIS_LOOP_174_16_fu_297.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.faddfsub_32ns_32ns_32_10_full_dsp_1_U105", "Parent" : "18"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.faddfsub_32ns_32ns_32_10_full_dsp_1_U106", "Parent" : "18"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.fmul_32ns_32ns_32_8_max_dsp_1_U107", "Parent" : "18"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.fmul_32ns_32ns_32_8_max_dsp_1_U108", "Parent" : "18"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.fmul_32ns_32ns_32_8_max_dsp_1_U109", "Parent" : "18"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_310.fmul_32ns_32ns_32_8_max_dsp_1_U110", "Parent" : "18"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitofp_32ns_32_7_no_dsp_1_U135", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main {
		lfsr {Type IO LastRead -1 FirstWrite -1}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	p_rand {
		lfsr {Type IO LastRead -1 FirstWrite -1}}
	fft {
		X_R_0 {Type IO LastRead 32 FirstWrite 31}
		X_R_1 {Type IO LastRead 32 FirstWrite 31}
		X_R_2 {Type IO LastRead 32 FirstWrite 31}
		X_R_3 {Type IO LastRead 32 FirstWrite 31}
		X_R_4 {Type IO LastRead 32 FirstWrite 31}
		X_R_5 {Type IO LastRead 32 FirstWrite 31}
		X_R_6 {Type IO LastRead 32 FirstWrite 31}
		X_R_7 {Type IO LastRead 32 FirstWrite 31}
		X_I_0 {Type IO LastRead 32 FirstWrite 31}
		X_I_1 {Type IO LastRead 32 FirstWrite 31}
		X_I_2 {Type IO LastRead 32 FirstWrite 31}
		X_I_3 {Type IO LastRead 32 FirstWrite 31}
		X_I_4 {Type IO LastRead 32 FirstWrite 31}
		X_I_5 {Type IO LastRead 32 FirstWrite 31}
		X_I_6 {Type IO LastRead 32 FirstWrite 31}
		X_I_7 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_41_2 {
		numBF {Type I LastRead 0 FirstWrite -1}
		zext_ln41 {Type I LastRead 0 FirstWrite -1}
		select_ln38_1 {Type I LastRead 0 FirstWrite -1}
		X_R_0 {Type IO LastRead 32 FirstWrite 31}
		X_I_0 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_60_4 {
		numBF_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln60 {Type I LastRead 0 FirstWrite -1}
		select_ln57_1 {Type I LastRead 0 FirstWrite -1}
		X_R_1 {Type IO LastRead 32 FirstWrite 31}
		X_I_1 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_79_6 {
		numBF_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln79 {Type I LastRead 0 FirstWrite -1}
		select_ln76_1 {Type I LastRead 0 FirstWrite -1}
		X_R_2 {Type IO LastRead 32 FirstWrite 31}
		X_I_2 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_98_8 {
		numBF_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln98 {Type I LastRead 0 FirstWrite -1}
		select_ln95_1 {Type I LastRead 0 FirstWrite -1}
		X_R_3 {Type IO LastRead 32 FirstWrite 31}
		X_I_3 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_117_10 {
		numBF_4 {Type I LastRead 0 FirstWrite -1}
		zext_ln117 {Type I LastRead 0 FirstWrite -1}
		select_ln114_1 {Type I LastRead 0 FirstWrite -1}
		X_R_4 {Type IO LastRead 32 FirstWrite 31}
		X_I_4 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_136_12 {
		numBF_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln136 {Type I LastRead 0 FirstWrite -1}
		select_ln133_1 {Type I LastRead 0 FirstWrite -1}
		X_R_5 {Type IO LastRead 32 FirstWrite 31}
		X_I_5 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_155_14 {
		numBF_6 {Type I LastRead 0 FirstWrite -1}
		zext_ln155 {Type I LastRead 0 FirstWrite -1}
		select_ln152_1 {Type I LastRead 0 FirstWrite -1}
		X_R_6 {Type IO LastRead 32 FirstWrite 31}
		X_I_6 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}
	fft_Pipeline_VITIS_LOOP_174_16 {
		numBF_7 {Type I LastRead 0 FirstWrite -1}
		zext_ln174 {Type I LastRead 0 FirstWrite -1}
		select_ln171_1 {Type I LastRead 0 FirstWrite -1}
		X_R_7 {Type IO LastRead 32 FirstWrite 31}
		X_I_7 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "23060", "Max" : "738324"}
	, {"Name" : "Interval", "Min" : "23061", "Max" : "738325"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
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
