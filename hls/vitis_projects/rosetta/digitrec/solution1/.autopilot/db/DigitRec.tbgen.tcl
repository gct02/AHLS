set moduleName DigitRec
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
set C_modelName {DigitRec}
set C_modelType { void 0 }
set C_modelArgList {
	{ training_samples int 64 regular {array 12000 { 1 1 } 1 1 }  }
	{ test_set int 64 regular {array 2000 { 1 1 } 1 1 }  }
	{ training_labels int 8 regular {array 3000 { 1 3 } 1 1 }  }
	{ results int 8 regular {array 500 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "training_samples", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "test_set", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "training_labels", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "results", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ training_samples_address0 sc_out sc_lv 14 signal 0 } 
	{ training_samples_ce0 sc_out sc_logic 1 signal 0 } 
	{ training_samples_q0 sc_in sc_lv 64 signal 0 } 
	{ training_samples_address1 sc_out sc_lv 14 signal 0 } 
	{ training_samples_ce1 sc_out sc_logic 1 signal 0 } 
	{ training_samples_q1 sc_in sc_lv 64 signal 0 } 
	{ test_set_address0 sc_out sc_lv 11 signal 1 } 
	{ test_set_ce0 sc_out sc_logic 1 signal 1 } 
	{ test_set_q0 sc_in sc_lv 64 signal 1 } 
	{ test_set_address1 sc_out sc_lv 11 signal 1 } 
	{ test_set_ce1 sc_out sc_logic 1 signal 1 } 
	{ test_set_q1 sc_in sc_lv 64 signal 1 } 
	{ training_labels_address0 sc_out sc_lv 12 signal 2 } 
	{ training_labels_ce0 sc_out sc_logic 1 signal 2 } 
	{ training_labels_q0 sc_in sc_lv 8 signal 2 } 
	{ results_address0 sc_out sc_lv 9 signal 3 } 
	{ results_ce0 sc_out sc_logic 1 signal 3 } 
	{ results_we0 sc_out sc_logic 1 signal 3 } 
	{ results_d0 sc_out sc_lv 8 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "training_samples_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "training_samples", "role": "address0" }} , 
 	{ "name": "training_samples_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_samples", "role": "ce0" }} , 
 	{ "name": "training_samples_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_samples", "role": "q0" }} , 
 	{ "name": "training_samples_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "training_samples", "role": "address1" }} , 
 	{ "name": "training_samples_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_samples", "role": "ce1" }} , 
 	{ "name": "training_samples_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_samples", "role": "q1" }} , 
 	{ "name": "test_set_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "test_set", "role": "address0" }} , 
 	{ "name": "test_set_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "test_set", "role": "ce0" }} , 
 	{ "name": "test_set_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_set", "role": "q0" }} , 
 	{ "name": "test_set_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "test_set", "role": "address1" }} , 
 	{ "name": "test_set_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "test_set", "role": "ce1" }} , 
 	{ "name": "test_set_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_set", "role": "q1" }} , 
 	{ "name": "training_labels_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "training_labels", "role": "address0" }} , 
 	{ "name": "training_labels_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_labels", "role": "ce0" }} , 
 	{ "name": "training_labels_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "training_labels", "role": "q0" }} , 
 	{ "name": "results_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "results", "role": "address0" }} , 
 	{ "name": "results_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "ce0" }} , 
 	{ "name": "results_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "results", "role": "we0" }} , 
 	{ "name": "results_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "results", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "6", "8", "11"],
		"CDFG" : "DigitRec",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6030001", "EstimateLatencyMax" : "6030001",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "training_samples", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177", "Port" : "training_samples", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "test_set", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177", "Port" : "test_set", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "training_labels", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177", "Port" : "training_labels", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "results", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "TEST_LOOP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "10", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.votes_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_SET_KNN_SET_fu_156", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "DigitRec_Pipeline_SET_KNN_SET",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "labels_2_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "labels_1_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "labels_0_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_2_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_1_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_0_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "labels_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "labels_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "labels_0_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dists_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dists_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dists_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "SET_KNN_SET", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_SET_KNN_SET_fu_156.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_3_fu_172", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "DigitRec_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12", "EstimateLatencyMax" : "12",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "votes", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_3_fu_172.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "DigitRec_Pipeline_TRAINING_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12011", "EstimateLatencyMax" : "12011",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "labels_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "labels_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "labels_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dists_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "training_labels", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "training_samples", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "test_set_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "test_set", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "labels_2_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "labels_1_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "labels_0_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dists_2_3_out", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dists_1_3_out", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dists_0_3_out", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "TRAINING_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201", "Parent" : "0", "Child" : ["9", "10"],
		"CDFG" : "DigitRec_Pipeline_VITIS_LOOP_69_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "votes", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_69_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201.mux_3_2_4_1_1_U31", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "DigitRec_Pipeline_VITIS_LOOP_72_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "votes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_label_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_72_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"}]}


set ArgLastReadFirstWriteLatency {
	DigitRec {
		training_samples {Type I LastRead 2 FirstWrite -1}
		test_set {Type I LastRead 2 FirstWrite -1}
		training_labels {Type I LastRead 8 FirstWrite -1}
		results {Type O LastRead -1 FirstWrite 9}}
	DigitRec_Pipeline_SET_KNN_SET {
		labels_2_0 {Type I LastRead 0 FirstWrite -1}
		labels_1_0 {Type I LastRead 0 FirstWrite -1}
		labels_0_0 {Type I LastRead 0 FirstWrite -1}
		dists_2_0 {Type I LastRead 0 FirstWrite -1}
		dists_1_0 {Type I LastRead 0 FirstWrite -1}
		dists_0_0 {Type I LastRead 0 FirstWrite -1}
		labels_2_1_out {Type O LastRead -1 FirstWrite 0}
		labels_1_1_out {Type O LastRead -1 FirstWrite 0}
		labels_0_1_out {Type O LastRead -1 FirstWrite 0}
		dists_2_1_out {Type O LastRead -1 FirstWrite 0}
		dists_1_1_out {Type O LastRead -1 FirstWrite 0}
		dists_0_1_out {Type O LastRead -1 FirstWrite 0}}
	DigitRec_Pipeline_3 {
		votes {Type O LastRead -1 FirstWrite 1}}
	DigitRec_Pipeline_TRAINING_LOOP {
		labels_2_1_reload {Type I LastRead 0 FirstWrite -1}
		labels_1_1_reload {Type I LastRead 0 FirstWrite -1}
		labels_0_1_reload {Type I LastRead 0 FirstWrite -1}
		dists_2_1_reload {Type I LastRead 0 FirstWrite -1}
		dists_1_1_reload {Type I LastRead 0 FirstWrite -1}
		dists_0_1_reload {Type I LastRead 0 FirstWrite -1}
		training_labels {Type I LastRead 8 FirstWrite -1}
		training_samples {Type I LastRead 2 FirstWrite -1}
		test_set_load {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		test_set {Type I LastRead 2 FirstWrite -1}
		labels_2_3_out {Type O LastRead -1 FirstWrite 9}
		labels_1_3_out {Type O LastRead -1 FirstWrite 9}
		labels_0_3_out {Type O LastRead -1 FirstWrite 9}
		dists_2_3_out {Type IO LastRead 11 FirstWrite 0}
		dists_1_3_out {Type IO LastRead 10 FirstWrite 0}
		dists_0_3_out {Type IO LastRead 9 FirstWrite 0}}
	DigitRec_Pipeline_VITIS_LOOP_69_1 {
		empty_20 {Type I LastRead 0 FirstWrite -1}
		empty_21 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		votes {Type IO LastRead 1 FirstWrite 4}}
	DigitRec_Pipeline_VITIS_LOOP_72_2 {
		votes {Type I LastRead 0 FirstWrite -1}
		max_label_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6030001", "Max" : "6030001"}
	, {"Name" : "Interval", "Min" : "6030002", "Max" : "6030002"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	training_samples { ap_memory {  { training_samples_address0 mem_address 1 14 }  { training_samples_ce0 mem_ce 1 1 }  { training_samples_q0 mem_dout 0 64 }  { training_samples_address1 MemPortADDR2 1 14 }  { training_samples_ce1 MemPortCE2 1 1 }  { training_samples_q1 MemPortDOUT2 0 64 } } }
	test_set { ap_memory {  { test_set_address0 mem_address 1 11 }  { test_set_ce0 mem_ce 1 1 }  { test_set_q0 mem_dout 0 64 }  { test_set_address1 MemPortADDR2 1 11 }  { test_set_ce1 MemPortCE2 1 1 }  { test_set_q1 MemPortDOUT2 0 64 } } }
	training_labels { ap_memory {  { training_labels_address0 mem_address 1 12 }  { training_labels_ce0 mem_ce 1 1 }  { training_labels_q0 mem_dout 0 8 } } }
	results { ap_memory {  { results_address0 mem_address 1 9 }  { results_ce0 mem_ce 1 1 }  { results_we0 mem_we 1 1 }  { results_d0 mem_din 1 8 } } }
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
