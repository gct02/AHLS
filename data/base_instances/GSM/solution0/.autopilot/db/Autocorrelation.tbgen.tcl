set moduleName Autocorrelation
set isTopModule 0
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
set C_modelName {Autocorrelation}
set C_modelType { void 0 }
set C_modelArgList {
	{ indata int 16 regular {array 160 { 2 1 } 1 1 }  }
	{ L_ACF int 64 regular {array 9 { 2 2 } 1 1 }  }
	{ bitoff int 4 regular {array 256 { 1 1 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indata", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "L_ACF", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "bitoff", "interface" : "memory", "bitwidth" : 4, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 33
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
	{ L_ACF_address0 sc_out sc_lv 4 signal 1 } 
	{ L_ACF_ce0 sc_out sc_logic 1 signal 1 } 
	{ L_ACF_we0 sc_out sc_logic 1 signal 1 } 
	{ L_ACF_d0 sc_out sc_lv 64 signal 1 } 
	{ L_ACF_q0 sc_in sc_lv 64 signal 1 } 
	{ L_ACF_address1 sc_out sc_lv 4 signal 1 } 
	{ L_ACF_ce1 sc_out sc_logic 1 signal 1 } 
	{ L_ACF_we1 sc_out sc_logic 1 signal 1 } 
	{ L_ACF_d1 sc_out sc_lv 64 signal 1 } 
	{ L_ACF_q1 sc_in sc_lv 64 signal 1 } 
	{ bitoff_address0 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce0 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q0 sc_in sc_lv 4 signal 2 } 
	{ bitoff_address1 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce1 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q1 sc_in sc_lv 4 signal 2 } 
	{ bitoff_address2 sc_out sc_lv 8 signal 2 } 
	{ bitoff_ce2 sc_out sc_logic 1 signal 2 } 
	{ bitoff_q2 sc_in sc_lv 4 signal 2 } 
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
 	{ "name": "L_ACF_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "L_ACF", "role": "address0" }} , 
 	{ "name": "L_ACF_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "L_ACF", "role": "ce0" }} , 
 	{ "name": "L_ACF_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "L_ACF", "role": "we0" }} , 
 	{ "name": "L_ACF_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "L_ACF", "role": "d0" }} , 
 	{ "name": "L_ACF_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "L_ACF", "role": "q0" }} , 
 	{ "name": "L_ACF_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "L_ACF", "role": "address1" }} , 
 	{ "name": "L_ACF_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "L_ACF", "role": "ce1" }} , 
 	{ "name": "L_ACF_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "L_ACF", "role": "we1" }} , 
 	{ "name": "L_ACF_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "L_ACF", "role": "d1" }} , 
 	{ "name": "L_ACF_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "L_ACF", "role": "q1" }} , 
 	{ "name": "bitoff_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address0" }} , 
 	{ "name": "bitoff_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce0" }} , 
 	{ "name": "bitoff_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q0" }} , 
 	{ "name": "bitoff_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address1" }} , 
 	{ "name": "bitoff_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce1" }} , 
 	{ "name": "bitoff_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q1" }} , 
 	{ "name": "bitoff_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bitoff", "role": "address2" }} , 
 	{ "name": "bitoff_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bitoff", "role": "ce2" }} , 
 	{ "name": "bitoff_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bitoff", "role": "q2" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "6", "8", "19", "21", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51"],
		"CDFG" : "Autocorrelation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "971", "EstimateLatencyMax" : "1298",
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
					{"ID" : "1", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label0_fu_359", "Port" : "indata", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379", "Port" : "indata", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "3", "SubInstance" : "grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_366", "Port" : "indata", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "21", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_410", "Port" : "indata", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "L_ACF", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_373", "Port" : "L_ACF", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "19", "SubInstance" : "grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_404", "Port" : "L_ACF", "Inst_start_state" : "21", "Inst_end_state" : "22"}]},
			{"Name" : "bitoff", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label0_fu_359", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "Autocorrelation_Pipeline_Autocorrelation_label0",
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
			{"Name" : "indata", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "smax_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label0_fu_359.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_366", "Parent" : "0", "Child" : ["4", "5"],
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
			{"Name" : "zext_ln65", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_65_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_366.mac_muladd_16s_15ns_15ns_31_4_1_U3", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_366.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_373", "Parent" : "0", "Child" : ["7"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_373.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379", "Parent" : "0", "Child" : ["9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
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
			{"Name" : "L_ACF_load_8", "Type" : "None", "Direction" : "I"},
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
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U8", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U9", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U10", "Parent" : "8"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U11", "Parent" : "8"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U12", "Parent" : "8"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U13", "Parent" : "8"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U14", "Parent" : "8"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U15", "Parent" : "8"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.mul_16s_16s_32_1_1_U16", "Parent" : "8"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_404", "Parent" : "0", "Child" : ["20"],
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
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_404.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_410", "Parent" : "0", "Child" : ["22"],
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
			{"Name" : "zext_ln152", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Autocorrelation_label5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_410.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U40", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U41", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U42", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U43", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U44", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U45", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U46", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U47", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U48", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U49", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U50", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U51", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U52", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U53", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_16s_16s_16s_32s_33_4_1_U54", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_16s_16s_16s_32s_33_4_1_U55", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_addmul_16s_16s_16s_33_4_1_U56", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U57", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U58", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U59", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U60", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U61", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_33s_33_4_1_U62", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_33s_33_4_1_U63", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_16s_16s_16s_33s_34_4_1_U64", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_addmul_16s_16s_16s_33_4_1_U65", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_16s_16s_16s_33s_34_4_1_U66", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_16s_16s_16s_33s_34_4_1_U67", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_33_4_1_U68", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Autocorrelation {
		indata {Type IO LastRead 9 FirstWrite -1}
		L_ACF {Type IO LastRead 13 FirstWrite 0}
		bitoff {Type I LastRead 3 FirstWrite -1}}
	Autocorrelation_Pipeline_Autocorrelation_label0 {
		indata {Type I LastRead 0 FirstWrite -1}
		smax_out {Type O LastRead -1 FirstWrite 0}}
	Autocorrelation_Pipeline_VITIS_LOOP_65_1 {
		indata {Type IO LastRead 0 FirstWrite 4}
		zext_ln65 {Type I LastRead 0 FirstWrite -1}}
	Autocorrelation_Pipeline_Autocorrelation_label2 {
		L_ACF {Type O LastRead -1 FirstWrite 0}}
	Autocorrelation_Pipeline_Autocorrelation_label3 {
		L_ACF_load_8 {Type I LastRead 0 FirstWrite -1}
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
		zext_ln152 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "971", "Max" : "1298"}
	, {"Name" : "Interval", "Min" : "971", "Max" : "1298"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	indata { ap_memory {  { indata_address0 mem_address 1 8 }  { indata_ce0 mem_ce 1 1 }  { indata_we0 mem_we 1 1 }  { indata_d0 mem_din 1 16 }  { indata_q0 in_data 0 16 }  { indata_address1 MemPortADDR2 1 8 }  { indata_ce1 MemPortCE2 1 1 }  { indata_q1 in_data 0 16 } } }
	L_ACF { ap_memory {  { L_ACF_address0 mem_address 1 4 }  { L_ACF_ce0 mem_ce 1 1 }  { L_ACF_we0 mem_we 1 1 }  { L_ACF_d0 mem_din 1 64 }  { L_ACF_q0 in_data 0 64 }  { L_ACF_address1 MemPortADDR2 1 4 }  { L_ACF_ce1 MemPortCE2 1 1 }  { L_ACF_we1 MemPortWE2 1 1 }  { L_ACF_d1 MemPortDIN2 1 64 }  { L_ACF_q1 MemPortDOUT2 0 64 } } }
	bitoff { ap_memory {  { bitoff_address0 mem_address 1 8 }  { bitoff_ce0 mem_ce 1 1 }  { bitoff_q0 in_data 0 4 }  { bitoff_address1 MemPortADDR2 1 8 }  { bitoff_ce1 MemPortCE2 1 1 }  { bitoff_q1 in_data 0 4 }  { bitoff_address2 MemPortADDR2 1 8 }  { bitoff_ce2 MemPortCE2 1 1 }  { bitoff_q2 in_data 0 4 } } }
}
