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
	{ indata int 16 regular {array 160 { 2 2 } 1 1 }  }
	{ LARc int 16 regular {array 8 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indata", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "LARc", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 26
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
	{ indata_we1 sc_out sc_logic 1 signal 0 } 
	{ indata_d1 sc_out sc_lv 16 signal 0 } 
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
 	{ "name": "indata_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "indata", "role": "we1" }} , 
 	{ "name": "indata_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "indata", "role": "d1" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "43", "51"],
		"CDFG" : "Gsm_LPC_Analysis",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1310", "EstimateLatencyMax" : "2951",
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
					{"ID" : "3", "SubInstance" : "grp_Autocorrelation_fu_103", "Port" : "indata", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "LARc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_Reflection_coefficients_fu_113", "Port" : "LARc", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "51", "SubInstance" : "grp_Quantization_and_coding_fu_122", "Port" : "LARc", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_Autocorrelation_fu_103", "Port" : "bitoff", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "43", "SubInstance" : "grp_Reflection_coefficients_fu_113", "Port" : "bitoff", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "Transformation_to_Log_Area_Ratios_label0", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state4"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state7"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitoff_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.L_ACF_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"],
		"CDFG" : "Autocorrelation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1278", "EstimateLatencyMax" : "2398",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indata", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Autocorrelation_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Autocorrelation_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state11_blk"}},
			{"Name" : "Autocorrelation_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state19", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Autocorrelation_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state30"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state28"], "PostState" : ["ap_ST_fsm_state31"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Autocorrelation_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state31", "LastState" : ["ap_ST_fsm_state32"], "QuitState" : ["ap_ST_fsm_state31"], "PreState" : ["ap_ST_fsm_state29"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U1", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U2", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U3", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U4", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U5", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U6", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U7", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U8", "Parent" : "3"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U9", "Parent" : "3"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U10", "Parent" : "3"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U11", "Parent" : "3"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U12", "Parent" : "3"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U13", "Parent" : "3"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U14", "Parent" : "3"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U15", "Parent" : "3"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U16", "Parent" : "3"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U17", "Parent" : "3"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U18", "Parent" : "3"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U19", "Parent" : "3"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U20", "Parent" : "3"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U21", "Parent" : "3"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U22", "Parent" : "3"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mul_16s_16s_32_1_1_U23", "Parent" : "3"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_15ns_15ns_31_4_1_U24", "Parent" : "3"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_32s_33_4_1_U25", "Parent" : "3"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_32s_33_4_1_U26", "Parent" : "3"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.am_addmul_16s_16s_16s_33_4_1_U27", "Parent" : "3"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U28", "Parent" : "3"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U29", "Parent" : "3"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U30", "Parent" : "3"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U31", "Parent" : "3"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U32", "Parent" : "3"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_33s_33_4_1_U33", "Parent" : "3"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_33s_33_4_1_U34", "Parent" : "3"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U35", "Parent" : "3"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.am_addmul_16s_16s_16s_33_4_1_U36", "Parent" : "3"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U37", "Parent" : "3"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.ama_addmuladd_16s_16s_16s_33s_34_4_1_U38", "Parent" : "3"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_fu_103.mac_muladd_16s_16s_32s_33_4_1_U39", "Parent" : "3"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113", "Parent" : "0", "Child" : ["44", "45", "46", "47", "48", "49", "50"],
		"CDFG" : "Reflection_coefficients",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "532",
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
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.ACF_U", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.P_U", "Parent" : "43"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.K_U", "Parent" : "43"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.grp_gsm_div_fu_389", "Parent" : "43",
		"CDFG" : "gsm_div",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "15",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "num", "Type" : "None", "Direction" : "I"},
			{"Name" : "denum", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "gsm_div_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U52", "Parent" : "43"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U53", "Parent" : "43"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Reflection_coefficients_fu_113.mac_muladd_16s_16s_15ns_31_4_1_U54", "Parent" : "43"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122", "Parent" : "0", "Child" : ["52", "53", "54"],
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
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U60", "Parent" : "51"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U61", "Parent" : "51"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Quantization_and_coding_fu_122.mul_16s_15ns_31_1_1_U62", "Parent" : "51"}]}


set ArgLastReadFirstWriteLatency {
	Gsm_LPC_Analysis {
		indata {Type IO LastRead 19 FirstWrite 7}
		LARc {Type IO LastRead 4 FirstWrite 2}
		bitoff {Type I LastRead -1 FirstWrite -1}}
	Autocorrelation {
		indata {Type IO LastRead 19 FirstWrite 7}
		L_ACF {Type IO LastRead 18 FirstWrite 5}
		bitoff {Type I LastRead 2 FirstWrite -1}}
	Reflection_coefficients {
		L_ACF {Type I LastRead 3 FirstWrite -1}
		LARc {Type O LastRead -1 FirstWrite 2}
		bitoff {Type I LastRead 2 FirstWrite -1}}
	gsm_div {
		num {Type I LastRead 0 FirstWrite -1}
		denum {Type I LastRead 0 FirstWrite -1}}
	Quantization_and_coding {
		LARc {Type IO LastRead 4 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1310", "Max" : "2951"}
	, {"Name" : "Interval", "Min" : "1311", "Max" : "2952"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	indata { ap_memory {  { indata_address0 mem_address 1 8 }  { indata_ce0 mem_ce 1 1 }  { indata_we0 mem_we 1 1 }  { indata_d0 mem_din 1 16 }  { indata_q0 mem_dout 0 16 }  { indata_address1 MemPortADDR2 1 8 }  { indata_ce1 MemPortCE2 1 1 }  { indata_we1 MemPortWE2 1 1 }  { indata_d1 MemPortDIN2 1 16 }  { indata_q1 MemPortDOUT2 0 16 } } }
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
