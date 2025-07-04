set moduleName Gsm_LPC_Analysis
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
set C_modelName {Gsm_LPC_Analysis}
set C_modelType { void 0 }
set C_modelArgList {
	{ indata int 16 regular {array 160 { 2 1 } 1 1 }  }
	{ LARc int 16 regular {array 8 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indata", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "LARc", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ indata_address0 sc_out sc_lv 8 signal 0 } 
	{ indata_ce0 sc_out sc_logic 1 signal 0 } 
	{ indata_we0 sc_out sc_logic 1 signal 0 } 
	{ indata_d0 sc_out sc_lv 16 signal 0 } 
	{ indata_q0 sc_in sc_lv 16 signal 0 } 
	{ indata_address1 sc_out sc_lv 8 signal 0 } 
	{ indata_ce1 sc_out sc_logic 1 signal 0 } 
	{ indata_q1 sc_in sc_lv 16 signal 0 } 
	{ LARc_address0 sc_out sc_lv 3 signal 1 } 
	{ LARc_ce0 sc_out sc_logic 1 signal 1 } 
	{ LARc_we0 sc_out sc_logic 1 signal 1 } 
	{ LARc_d0 sc_out sc_lv 16 signal 1 } 
	{ LARc_q0 sc_in sc_lv 16 signal 1 } 
	{ LARc_address1 sc_out sc_lv 3 signal 1 } 
	{ LARc_ce1 sc_out sc_logic 1 signal 1 } 
	{ LARc_we1 sc_out sc_logic 1 signal 1 } 
	{ LARc_d1 sc_out sc_lv 16 signal 1 } 
	{ LARc_q1 sc_in sc_lv 16 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "indata_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "indata", "role": "address0" }} , 
 	{ "name": "indata_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "indata", "role": "ce0" }} , 
 	{ "name": "indata_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "indata", "role": "we0" }} , 
 	{ "name": "indata_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "indata", "role": "d0" }} , 
 	{ "name": "indata_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "indata", "role": "q0" }} , 
 	{ "name": "indata_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "indata", "role": "address1" }} , 
 	{ "name": "indata_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "indata", "role": "ce1" }} , 
 	{ "name": "indata_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "indata", "role": "q1" }} , 
 	{ "name": "LARc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "LARc", "role": "address0" }} , 
 	{ "name": "LARc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "ce0" }} , 
 	{ "name": "LARc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "we0" }} , 
 	{ "name": "LARc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "d0" }} , 
 	{ "name": "LARc_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "q0" }} , 
 	{ "name": "LARc_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "LARc", "role": "address1" }} , 
 	{ "name": "LARc_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "ce1" }} , 
 	{ "name": "LARc_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "LARc", "role": "we1" }} , 
 	{ "name": "LARc_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "d1" }} , 
 	{ "name": "LARc_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "LARc", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "52", "62", "66"],
		"CDFG" : "Gsm_LPC_Analysis",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1160", "EstimateLatencyMax" : "2034",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indata", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_Autocorrelation_fu_103", "Port" : "indata", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_Quantization_and_coding_fu_122", "Port" : "LARc", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "52", "SubInstance" : "grp_Reflection_coefficients_fu_113", "Port" : "LARc", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "52", "SubInstance" : "grp_Reflection_coefficients_fu_113", "Port" : "bitoff", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "2", "SubInstance" : "grp_Autocorrelation_fu_103", "Port" : "bitoff", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}],
		"Loop" : [
			{"Name" : "Transformation_to_Log_Area_Ratios_label0", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state4"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state7"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.L_ACF_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103", "Parent" : "0", "Child" : ["3", "6", "8", "19", "21", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51"],
		"CDFG" : "Autocorrelation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1128", "EstimateLatencyMax" : "1456",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indata", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_333", "Port" : "indata", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "8", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348", "Port" : "indata", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "21", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_379", "Port" : "indata", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_342", "Port" : "L_ACF", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "19", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_373", "Port" : "L_ACF", "Inst_start_state" : "21", "Inst_end_state" : "22"}]},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_333", "Parent" : "2", "Child" : ["4", "5"],
		"CDFG" : "Autocorrelation_Pipeline_VITIS_LOOP_65_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "165", "EstimateLatencyMax" : "165",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indata", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cmp_i68", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_65_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_333.mac_muladd_16s_15ns_15ns_31_4_1_U3", "Parent" : "3"},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_333.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_342", "Parent" : "2", "Child" : ["7"],
		"CDFG" : "Autocorrelation_Pipeline_Autocorrelation_label2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_342.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348", "Parent" : "2", "Child" : ["9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "Autocorrelation_Pipeline_Autocorrelation_label3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "765", "EstimateLatencyMax" : "765",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "L_ACF_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln126", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln125", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln124", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln123", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln122", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln121", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln120", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln119", "Type" : "None", "Direction" : "I"},
			{"Name" : "indata", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U9", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U10", "Parent" : "8"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U11", "Parent" : "8"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U12", "Parent" : "8"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U13", "Parent" : "8"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U14", "Parent" : "8"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U15", "Parent" : "8"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U16", "Parent" : "8"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.mul_16s_16s_32_1_1_U17", "Parent" : "8"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_348.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_373", "Parent" : "2", "Child" : ["20"],
		"CDFG" : "Autocorrelation_Pipeline_Autocorrelation_label4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_373.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_379", "Parent" : "2", "Child" : ["22"],
		"CDFG" : "Autocorrelation_Pipeline_Autocorrelation_label5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "162", "EstimateLatencyMax" : "162",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indata", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conv336_cast", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_379.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U41", "Parent" : "2"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U42", "Parent" : "2"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U43", "Parent" : "2"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U44", "Parent" : "2"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U45", "Parent" : "2"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U46", "Parent" : "2"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U47", "Parent" : "2"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U48", "Parent" : "2"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U49", "Parent" : "2"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U50", "Parent" : "2"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U51", "Parent" : "2"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U52", "Parent" : "2"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U53", "Parent" : "2"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U54", "Parent" : "2"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_32s_33_4_1_U55", "Parent" : "2"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_32s_33_4_1_U56", "Parent" : "2"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.am_addmul_16s_16s_16s_33_4_1_U57", "Parent" : "2"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U58", "Parent" : "2"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U59", "Parent" : "2"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U60", "Parent" : "2"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U61", "Parent" : "2"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U62", "Parent" : "2"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_33s_33_4_1_U63", "Parent" : "2"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_33s_33_4_1_U64", "Parent" : "2"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U65", "Parent" : "2"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.am_addmul_16s_16s_16s_33_4_1_U66", "Parent" : "2"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U67", "Parent" : "2"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U68", "Parent" : "2"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U69", "Parent" : "2"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113", "Parent" : "0", "Child" : ["53", "54", "55", "56", "59", "60", "61"],
		"CDFG" : "Reflection_coefficients",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "557",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Reflection_coefficients_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state22", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state22"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state22_blk"}},
			{"Name" : "Reflection_coefficients_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Reflection_coefficients_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state13"], "PreState" : ["ap_ST_fsm_state10", "ap_ST_fsm_state12", "ap_ST_fsm_state22"], "PostState" : ["ap_ST_fsm_state14"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state13_blk"}}]},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.ACF_U", "Parent" : "52"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.P_U", "Parent" : "52"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.K_U", "Parent" : "52"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.grp_gsm_div_fu_306", "Parent" : "52", "Child" : ["57"],
		"CDFG" : "gsm_div",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "18",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "num", "Type" : "None", "Direction" : "I"},
			{"Name" : "denum", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.grp_gsm_div_fu_306.grp_gsm_div_Pipeline_gsm_div_label0_fu_39", "Parent" : "56", "Child" : ["58"],
		"CDFG" : "gsm_div_Pipeline_gsm_div_label0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "16",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln120", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln126", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln121", "Type" : "None", "Direction" : "I"},
			{"Name" : "div_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "gsm_div_label0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "58", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.grp_gsm_div_fu_306.grp_gsm_div_Pipeline_gsm_div_label0_fu_39.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U83", "Parent" : "52"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U84", "Parent" : "52"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U85", "Parent" : "52"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122", "Parent" : "0", "Child" : ["63", "64", "65"],
		"CDFG" : "Quantization_and_coding",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U90", "Parent" : "62"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U91", "Parent" : "62"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U92", "Parent" : "62"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gsm_norm_fu_323", "Parent" : "0", "Child" : ["67"],
		"CDFG" : "gsm_norm",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gsm_norm_fu_323.bitoff_U", "Parent" : "66"}]}


set ArgLastReadFirstWriteLatency {
	Gsm_LPC_Analysis {
		indata {Type IO LastRead 8 FirstWrite -1}
		LARc {Type IO LastRead 4 FirstWrite 2}
		bitoff {Type I LastRead -1 FirstWrite -1}}
	Autocorrelation {
		indata {Type IO LastRead 8 FirstWrite -1}
		L_ACF {Type IO LastRead 12 FirstWrite 0}
		bitoff {Type I LastRead -1 FirstWrite -1}}
	Autocorrelation_Pipeline_VITIS_LOOP_65_1 {
		indata {Type IO LastRead 0 FirstWrite 4}
		cmp_i68 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}}
	Autocorrelation_Pipeline_Autocorrelation_label2 {
		L_ACF {Type O LastRead -1 FirstWrite 0}}
	Autocorrelation_Pipeline_Autocorrelation_label3 {
		L_ACF_load_9 {Type I LastRead 0 FirstWrite -1}
		add_ln126 {Type I LastRead 0 FirstWrite -1}
		add_ln125 {Type I LastRead 0 FirstWrite -1}
		add_ln124 {Type I LastRead 0 FirstWrite -1}
		add_ln123 {Type I LastRead 0 FirstWrite -1}
		add_ln122 {Type I LastRead 0 FirstWrite -1}
		add_ln121 {Type I LastRead 0 FirstWrite -1}
		add_ln120 {Type I LastRead 0 FirstWrite -1}
		add_ln119 {Type I LastRead 0 FirstWrite -1}
		indata {Type I LastRead 5 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 3}
		p_out1 {Type O LastRead -1 FirstWrite 3}
		p_out2 {Type O LastRead -1 FirstWrite 3}
		p_out3 {Type O LastRead -1 FirstWrite 3}
		p_out4 {Type O LastRead -1 FirstWrite 3}
		p_out5 {Type O LastRead -1 FirstWrite 3}
		p_out6 {Type O LastRead -1 FirstWrite 3}
		p_out7 {Type O LastRead -1 FirstWrite 3}
		p_out8 {Type O LastRead -1 FirstWrite 3}}
	Autocorrelation_Pipeline_Autocorrelation_label4 {
		L_ACF {Type IO LastRead 0 FirstWrite 1}}
	Autocorrelation_Pipeline_Autocorrelation_label5 {
		indata {Type IO LastRead 0 FirstWrite 1}
		conv336_cast {Type I LastRead 0 FirstWrite -1}}
	Reflection_coefficients {
		L_ACF {Type I LastRead 3 FirstWrite -1}
		LARc {Type O LastRead -1 FirstWrite 2}
		bitoff {Type I LastRead -1 FirstWrite -1}}
	gsm_div {
		num {Type I LastRead 0 FirstWrite -1}
		denum {Type I LastRead 0 FirstWrite -1}}
	gsm_div_Pipeline_gsm_div_label0 {
		sext_ln120 {Type I LastRead 0 FirstWrite -1}
		sext_ln126 {Type I LastRead 0 FirstWrite -1}
		sext_ln121 {Type I LastRead 0 FirstWrite -1}
		div_3_out {Type O LastRead -1 FirstWrite 1}}
	Quantization_and_coding {
		LARc {Type IO LastRead 4 FirstWrite 4}}
	gsm_norm {
		a {Type I LastRead 0 FirstWrite -1}
		bitoff {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1160", "Max" : "2034"}
	, {"Name" : "Interval", "Min" : "1161", "Max" : "2035"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	indata { ap_memory {  { indata_address0 mem_address 1 8 }  { indata_ce0 mem_ce 1 1 }  { indata_we0 mem_we 1 1 }  { indata_d0 mem_din 1 16 }  { indata_q0 mem_dout 0 16 }  { indata_address1 MemPortADDR2 1 8 }  { indata_ce1 MemPortCE2 1 1 }  { indata_q1 MemPortDOUT2 0 16 } } }
	LARc { ap_memory {  { LARc_address0 mem_address 1 3 }  { LARc_ce0 mem_ce 1 1 }  { LARc_we0 mem_we 1 1 }  { LARc_d0 mem_din 1 16 }  { LARc_q0 mem_dout 0 16 }  { LARc_address1 MemPortADDR2 1 3 }  { LARc_ce1 MemPortCE2 1 1 }  { LARc_we1 MemPortWE2 1 1 }  { LARc_d1 MemPortDIN2 1 16 }  { LARc_q1 in_data 0 16 } } }
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
