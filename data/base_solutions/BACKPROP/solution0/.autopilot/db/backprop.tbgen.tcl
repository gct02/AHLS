set moduleName backprop
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
set C_modelName {backprop}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights1 int 64 regular {array 832 { 2 3 } 1 1 }  }
	{ weights2 int 64 regular {array 4096 { 2 3 } 1 1 }  }
	{ weights3 int 64 regular {array 192 { 2 3 } 1 1 }  }
	{ biases1 int 64 regular {array 64 { 2 3 } 1 1 }  }
	{ biases2 int 64 regular {array 64 { 2 3 } 1 1 }  }
	{ biases3 int 64 regular {array 3 { 2 3 } 1 1 }  }
	{ training_data int 64 regular {array 2119 { 1 3 } 1 1 }  }
	{ training_targets int 64 regular {array 489 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weights1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "training_data", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "training_targets", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weights1_address0 sc_out sc_lv 10 signal 0 } 
	{ weights1_ce0 sc_out sc_logic 1 signal 0 } 
	{ weights1_we0 sc_out sc_logic 1 signal 0 } 
	{ weights1_d0 sc_out sc_lv 64 signal 0 } 
	{ weights1_q0 sc_in sc_lv 64 signal 0 } 
	{ weights2_address0 sc_out sc_lv 12 signal 1 } 
	{ weights2_ce0 sc_out sc_logic 1 signal 1 } 
	{ weights2_we0 sc_out sc_logic 1 signal 1 } 
	{ weights2_d0 sc_out sc_lv 64 signal 1 } 
	{ weights2_q0 sc_in sc_lv 64 signal 1 } 
	{ weights3_address0 sc_out sc_lv 8 signal 2 } 
	{ weights3_ce0 sc_out sc_logic 1 signal 2 } 
	{ weights3_we0 sc_out sc_logic 1 signal 2 } 
	{ weights3_d0 sc_out sc_lv 64 signal 2 } 
	{ weights3_q0 sc_in sc_lv 64 signal 2 } 
	{ biases1_address0 sc_out sc_lv 6 signal 3 } 
	{ biases1_ce0 sc_out sc_logic 1 signal 3 } 
	{ biases1_we0 sc_out sc_logic 1 signal 3 } 
	{ biases1_d0 sc_out sc_lv 64 signal 3 } 
	{ biases1_q0 sc_in sc_lv 64 signal 3 } 
	{ biases2_address0 sc_out sc_lv 6 signal 4 } 
	{ biases2_ce0 sc_out sc_logic 1 signal 4 } 
	{ biases2_we0 sc_out sc_logic 1 signal 4 } 
	{ biases2_d0 sc_out sc_lv 64 signal 4 } 
	{ biases2_q0 sc_in sc_lv 64 signal 4 } 
	{ biases3_address0 sc_out sc_lv 2 signal 5 } 
	{ biases3_ce0 sc_out sc_logic 1 signal 5 } 
	{ biases3_we0 sc_out sc_logic 1 signal 5 } 
	{ biases3_d0 sc_out sc_lv 64 signal 5 } 
	{ biases3_q0 sc_in sc_lv 64 signal 5 } 
	{ training_data_address0 sc_out sc_lv 12 signal 6 } 
	{ training_data_ce0 sc_out sc_logic 1 signal 6 } 
	{ training_data_q0 sc_in sc_lv 64 signal 6 } 
	{ training_targets_address0 sc_out sc_lv 9 signal 7 } 
	{ training_targets_ce0 sc_out sc_logic 1 signal 7 } 
	{ training_targets_q0 sc_in sc_lv 64 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weights1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weights1", "role": "address0" }} , 
 	{ "name": "weights1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "ce0" }} , 
 	{ "name": "weights1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "we0" }} , 
 	{ "name": "weights1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "d0" }} , 
 	{ "name": "weights1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "q0" }} , 
 	{ "name": "weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "weights2", "role": "address0" }} , 
 	{ "name": "weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "ce0" }} , 
 	{ "name": "weights2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "we0" }} , 
 	{ "name": "weights2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "d0" }} , 
 	{ "name": "weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "q0" }} , 
 	{ "name": "weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "weights3", "role": "address0" }} , 
 	{ "name": "weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "ce0" }} , 
 	{ "name": "weights3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "we0" }} , 
 	{ "name": "weights3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "d0" }} , 
 	{ "name": "weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "q0" }} , 
 	{ "name": "biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases1", "role": "address0" }} , 
 	{ "name": "biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "ce0" }} , 
 	{ "name": "biases1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "we0" }} , 
 	{ "name": "biases1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "d0" }} , 
 	{ "name": "biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "q0" }} , 
 	{ "name": "biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases2", "role": "address0" }} , 
 	{ "name": "biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "ce0" }} , 
 	{ "name": "biases2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "we0" }} , 
 	{ "name": "biases2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "d0" }} , 
 	{ "name": "biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "q0" }} , 
 	{ "name": "biases3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "biases3", "role": "address0" }} , 
 	{ "name": "biases3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "ce0" }} , 
 	{ "name": "biases3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "we0" }} , 
 	{ "name": "biases3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "d0" }} , 
 	{ "name": "biases3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "q0" }} , 
 	{ "name": "training_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "training_data", "role": "address0" }} , 
 	{ "name": "training_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_data", "role": "ce0" }} , 
 	{ "name": "training_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_data", "role": "q0" }} , 
 	{ "name": "training_targets_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "training_targets", "role": "address0" }} , 
 	{ "name": "training_targets_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_targets", "role": "ce0" }} , 
 	{ "name": "training_targets_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_targets", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "15", "17", "20", "22", "26", "29", "32", "35", "39", "41", "43", "44", "45", "46", "49", "50", "51", "52", "53", "54"],
		"CDFG" : "backprop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50132118", "EstimateLatencyMax" : "50132118",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "weights1", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "12", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_258", "Port" : "weights1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_276", "Port" : "weights2", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "44", "SubInstance" : "grp_get_oracle_activations1_1_fu_388", "Port" : "weights2", "Inst_start_state" : "25", "Inst_end_state" : "26"},
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "weights2", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_292", "Port" : "weights3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "41", "SubInstance" : "grp_get_oracle_activations2_1_fu_370", "Port" : "weights3", "Inst_start_state" : "21", "Inst_end_state" : "22"},
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "weights3", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "biases1", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "12", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_258", "Port" : "biases1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_276", "Port" : "biases2", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "biases2", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_292", "Port" : "biases3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "46", "SubInstance" : "grp_update_weights_1_fu_406", "Port" : "biases3", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_get_delta_matrix_weights1_1_fu_397", "Port" : "training_data", "Inst_start_state" : "27", "Inst_end_state" : "28"},
					{"ID" : "12", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_258", "Port" : "training_data", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_backprop_Pipeline_take_difference_loop1_fu_342", "Port" : "training_targets", "Inst_start_state" : "19", "Inst_end_state" : "20"}]}],
		"Loop" : [
			{"Name" : "backprop_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "30", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state30"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations2_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights3_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations1_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_backprop_loop1_1_fu_246", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "backprop_Pipeline_backprop_loop1_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations3_2_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_0_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activations2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activations3_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "backprop_loop1_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_backprop_loop1_1_fu_246.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_258", "Parent" : "0", "Child" : ["13"],
		"CDFG" : "matrix_vector_product_with_bias_input_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8519", "EstimateLatencyMax" : "8519",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134", "Port" : "biases1", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134", "Port" : "activations", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_258.grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134", "Parent" : "12", "Child" : ["14"],
		"CDFG" : "matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "69", "EstimateLatencyMax" : "69",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_258.grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop1_fu_270", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "backprop_Pipeline_RELU_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "95", "EstimateLatencyMax" : "95",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dactivations1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter30", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter30", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop1_fu_270.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_276", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "matrix_vector_product_with_bias_second_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41159", "EstimateLatencyMax" : "41159",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s_fu_113", "Port" : "biases2", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s_fu_113", "Port" : "activations", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "input_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_276.grp_matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s_fu_113", "Parent" : "17", "Child" : ["19"],
		"CDFG" : "matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "69", "EstimateLatencyMax" : "69",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_276.grp_matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s_fu_113.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop11_fu_286", "Parent" : "0", "Child" : ["21"],
		"CDFG" : "backprop_Pipeline_RELU_loop11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "95", "EstimateLatencyMax" : "95",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dactivations2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter30", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter30", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop11_fu_286.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_292", "Parent" : "0", "Child" : ["23"],
		"CDFG" : "matrix_vector_product_with_bias_output_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1749", "EstimateLatencyMax" : "1749",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s_fu_159", "Port" : "biases3", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_292.grp_matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s_fu_159", "Parent" : "22", "Child" : ["24", "25"],
		"CDFG" : "matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s",
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
			{"Name" : "activations_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations12_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations2_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations12_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations2_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_292.grp_matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s_fu_159.mux_3_2_64_1_1_U43", "Parent" : "23"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_292.grp_matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s_fu_159.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop12_fu_304", "Parent" : "0", "Child" : ["27", "28"],
		"CDFG" : "backprop_Pipeline_RELU_loop12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations3_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_2_03", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_1_02", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_0_01", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_2_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_1_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_0_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop12_fu_304.mux_3_2_64_1_1_U64", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_RELU_loop12_fu_304.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop1_fu_320", "Parent" : "0", "Child" : ["30", "31"],
		"CDFG" : "backprop_Pipeline_soft_max_loop1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22", "EstimateLatencyMax" : "22",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations3_0_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_2_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "soft_max_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop1_fu_320.mux_3_2_64_1_1_U79", "Parent" : "29"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop1_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop2_fu_328", "Parent" : "0", "Child" : ["33", "34"],
		"CDFG" : "backprop_Pipeline_soft_max_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28", "EstimateLatencyMax" : "28",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "net_outputs_2_06", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_1_05", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_0_04", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_0_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_2_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "net_outputs_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "net_outputs_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "soft_max_loop2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter24", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter24", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop2_fu_328.mux_3_2_64_1_1_U86", "Parent" : "32"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_soft_max_loop2_fu_328.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_take_difference_loop1_fu_342", "Parent" : "0", "Child" : ["36", "37", "38"],
		"CDFG" : "backprop_Pipeline_take_difference_loop1",
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
			{"Name" : "output_difference_2_022", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_1_021", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_0_020", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln374", "Type" : "None", "Direction" : "I"},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dactivations3_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_difference_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "output_difference_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "output_difference_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "take_difference_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_take_difference_loop1_fu_342.mux_3_2_64_1_1_U99", "Parent" : "35"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_take_difference_loop1_fu_342.mux_3_2_64_1_1_U100", "Parent" : "35"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_backprop_Pipeline_take_difference_loop1_fu_342.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights3_fu_361", "Parent" : "0", "Child" : ["40"],
		"CDFG" : "get_delta_matrix_weights3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "961", "EstimateLatencyMax" : "961",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delta_weights3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "last_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_delta_matrix_weights3_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights3_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights3_fu_361.mux_3_2_64_1_1_U116", "Parent" : "39"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations2_1_fu_370", "Parent" : "0", "Child" : ["42"],
		"CDFG" : "get_oracle_activations2_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2113", "EstimateLatencyMax" : "2113",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "oracle_activations", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dactivations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_oracle_activations2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations2_1_fu_370.mux_3_2_64_1_1_U124", "Parent" : "41"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights2_fu_381", "Parent" : "0",
		"CDFG" : "get_delta_matrix_weights2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24769", "EstimateLatencyMax" : "24769",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delta_weights2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output_difference", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "last_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_delta_matrix_weights2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations1_1_fu_388", "Parent" : "0",
		"CDFG" : "get_oracle_activations1_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41345", "EstimateLatencyMax" : "41345",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_differences", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "oracle_activations", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dactivations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_oracle_activations1_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations1_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights1_1_fu_397", "Parent" : "0",
		"CDFG" : "get_delta_matrix_weights1_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4200", "EstimateLatencyMax" : "4200",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delta_weights1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output_difference", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "get_delta_matrix_weights1_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights1_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_406", "Parent" : "0", "Child" : ["47", "48"],
		"CDFG" : "update_weights_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "183269", "EstimateLatencyMax" : "183269",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "d_weights1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "d_biases1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "update_weights_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state20", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state20"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop3_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state65"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state48"], "PostState" : ["ap_ST_fsm_state48"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state48", "LastState" : ["ap_ST_fsm_state49"], "QuitState" : ["ap_ST_fsm_state48"], "PreState" : ["ap_ST_fsm_state47"], "PostState" : ["ap_ST_fsm_state66"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state77", "LastState" : ["ap_ST_fsm_state93"], "QuitState" : ["ap_ST_fsm_state77"], "PreState" : ["ap_ST_fsm_state76"], "PostState" : ["ap_ST_fsm_state94"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop5_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state95", "LastState" : ["ap_ST_fsm_state112"], "QuitState" : ["ap_ST_fsm_state95"], "PreState" : ["ap_ST_fsm_state94"], "PostState" : ["ap_ST_fsm_state94"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state94", "LastState" : ["ap_ST_fsm_state95"], "QuitState" : ["ap_ST_fsm_state94"], "PreState" : ["ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state113"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state113", "LastState" : ["ap_ST_fsm_state129"], "QuitState" : ["ap_ST_fsm_state113"], "PreState" : ["ap_ST_fsm_state94"], "PostState" : ["ap_ST_fsm_state130"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop7_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state142", "LastState" : ["ap_ST_fsm_state158"], "QuitState" : ["ap_ST_fsm_state142"], "PreState" : ["ap_ST_fsm_state141"], "PostState" : ["ap_ST_fsm_state141"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state141", "LastState" : ["ap_ST_fsm_state142"], "QuitState" : ["ap_ST_fsm_state141"], "PreState" : ["ap_ST_fsm_state140"], "PostState" : ["ap_ST_fsm_state159"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state170", "LastState" : ["ap_ST_fsm_state186"], "QuitState" : ["ap_ST_fsm_state170"], "PreState" : ["ap_ST_fsm_state169"], "PostState" : ["ap_ST_fsm_state187"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop9_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state188", "LastState" : ["ap_ST_fsm_state204"], "QuitState" : ["ap_ST_fsm_state188"], "PreState" : ["ap_ST_fsm_state187"], "PostState" : ["ap_ST_fsm_state187"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state187", "LastState" : ["ap_ST_fsm_state188"], "QuitState" : ["ap_ST_fsm_state187"], "PreState" : ["ap_ST_fsm_state170"], "PostState" : ["ap_ST_fsm_state205"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state205", "LastState" : ["ap_ST_fsm_state220"], "QuitState" : ["ap_ST_fsm_state205"], "PreState" : ["ap_ST_fsm_state187"], "PostState" : ["ap_ST_fsm_state221"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop11_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state233", "LastState" : ["ap_ST_fsm_state249"], "QuitState" : ["ap_ST_fsm_state233"], "PreState" : ["ap_ST_fsm_state232"], "PostState" : ["ap_ST_fsm_state232"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state232", "LastState" : ["ap_ST_fsm_state233"], "QuitState" : ["ap_ST_fsm_state232"], "PreState" : ["ap_ST_fsm_state231"], "PostState" : ["ap_ST_fsm_state250"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop12", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state261", "LastState" : ["ap_ST_fsm_state277"], "QuitState" : ["ap_ST_fsm_state261"], "PreState" : ["ap_ST_fsm_state260"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_406.dsqrt_64ns_64ns_64_12_no_dsp_1_U149", "Parent" : "46"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_406.mux_3_2_64_1_1_U150", "Parent" : "46"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U166", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U167", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_4_full_dsp_1_U168", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U169", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dexp_64ns_64ns_64_10_full_dsp_1_U170", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U171", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop {
		weights1 {Type IO LastRead 15 FirstWrite -1}
		weights2 {Type IO LastRead 41 FirstWrite -1}
		weights3 {Type IO LastRead 67 FirstWrite -1}
		biases1 {Type IO LastRead 26 FirstWrite -1}
		biases2 {Type IO LastRead 52 FirstWrite -1}
		biases3 {Type IO LastRead 78 FirstWrite -1}
		training_data {Type I LastRead 2 FirstWrite -1}
		training_targets {Type I LastRead 0 FirstWrite -1}}
	backprop_Pipeline_backprop_loop1_1 {
		activations3_2_0 {Type I LastRead 0 FirstWrite -1}
		activations3_1_0 {Type I LastRead 0 FirstWrite -1}
		activations3_0_0 {Type I LastRead 0 FirstWrite -1}
		activations1 {Type O LastRead -1 FirstWrite 0}
		activations2 {Type O LastRead -1 FirstWrite 0}
		activations3_2_1_out {Type O LastRead -1 FirstWrite 0}
		activations3_1_1_out {Type O LastRead -1 FirstWrite 0}
		activations3_0_1_out {Type O LastRead -1 FirstWrite 0}}
	matrix_vector_product_with_bias_input_layer_1 {
		biases1 {Type I LastRead 0 FirstWrite -1}
		weights1 {Type I LastRead 3 FirstWrite -1}
		activations {Type IO LastRead 0 FirstWrite 2}
		training_data {Type I LastRead 2 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l {
		activations {Type IO LastRead 0 FirstWrite 4}
		biases1 {Type I LastRead 0 FirstWrite -1}}
	backprop_Pipeline_RELU_loop1 {
		activations1 {Type IO LastRead 0 FirstWrite 30}
		dactivations1 {Type O LastRead -1 FirstWrite 8}}
	matrix_vector_product_with_bias_second_layer_1 {
		biases2 {Type I LastRead 0 FirstWrite -1}
		weights2 {Type I LastRead 2 FirstWrite -1}
		activations {Type IO LastRead 0 FirstWrite 2}
		input_activations {Type I LastRead 3 FirstWrite -1}}
	matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s {
		activations {Type IO LastRead 0 FirstWrite 4}
		biases2 {Type I LastRead 0 FirstWrite -1}}
	backprop_Pipeline_RELU_loop11 {
		activations2 {Type IO LastRead 0 FirstWrite 30}
		dactivations2 {Type O LastRead -1 FirstWrite 8}}
	matrix_vector_product_with_bias_output_layer_1 {
		biases3 {Type I LastRead 0 FirstWrite -1}
		weights3 {Type I LastRead 2 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		input_activations {Type I LastRead 2 FirstWrite -1}}
	matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s {
		activations_0 {Type I LastRead 0 FirstWrite -1}
		activations12_0 {Type I LastRead 0 FirstWrite -1}
		activations2_0 {Type I LastRead 0 FirstWrite -1}
		biases3 {Type I LastRead 0 FirstWrite -1}
		activations_2_out {Type O LastRead -1 FirstWrite 1}
		activations12_2_out {Type O LastRead -1 FirstWrite 1}
		activations2_2_out {Type O LastRead -1 FirstWrite 1}}
	backprop_Pipeline_RELU_loop12 {
		activations3_2 {Type I LastRead 0 FirstWrite -1}
		activations3_1 {Type I LastRead 0 FirstWrite -1}
		activations3_0 {Type I LastRead 0 FirstWrite -1}
		dactivations3_2_03 {Type I LastRead 0 FirstWrite -1}
		dactivations3_1_02 {Type I LastRead 0 FirstWrite -1}
		dactivations3_0_01 {Type I LastRead 0 FirstWrite -1}
		activations3_2_4_out {Type O LastRead -1 FirstWrite 1}
		activations3_1_4_out {Type O LastRead -1 FirstWrite 1}
		activations3_0_4_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_2_1_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_1_1_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_0_1_out {Type O LastRead -1 FirstWrite 1}}
	backprop_Pipeline_soft_max_loop1 {
		activations3_0_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_1_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_2_4_reload {Type I LastRead 0 FirstWrite -1}
		sum_out {Type O LastRead -1 FirstWrite 11}}
	backprop_Pipeline_soft_max_loop2 {
		net_outputs_2_06 {Type I LastRead 0 FirstWrite -1}
		net_outputs_1_05 {Type I LastRead 0 FirstWrite -1}
		net_outputs_0_04 {Type I LastRead 0 FirstWrite -1}
		activations3_0_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_1_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_2_4_reload {Type I LastRead 0 FirstWrite -1}
		sum_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_2_1_out {Type O LastRead -1 FirstWrite 23}
		net_outputs_1_1_out {Type O LastRead -1 FirstWrite 23}
		net_outputs_0_1_out {Type O LastRead -1 FirstWrite 23}}
	backprop_Pipeline_take_difference_loop1 {
		output_difference_2_022 {Type I LastRead 0 FirstWrite -1}
		output_difference_1_021 {Type I LastRead 0 FirstWrite -1}
		output_difference_0_020 {Type I LastRead 0 FirstWrite -1}
		net_outputs_0_1_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_1_1_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_2_1_reload {Type I LastRead 0 FirstWrite -1}
		sub_ln374 {Type I LastRead 0 FirstWrite -1}
		training_targets {Type I LastRead 0 FirstWrite -1}
		dactivations3_0_1_reload {Type I LastRead 0 FirstWrite -1}
		dactivations3_1_1_reload {Type I LastRead 0 FirstWrite -1}
		dactivations3_2_1_reload {Type I LastRead 0 FirstWrite -1}
		output_difference_2_1_out {Type O LastRead -1 FirstWrite 7}
		output_difference_1_1_out {Type O LastRead -1 FirstWrite 7}
		output_difference_0_1_out {Type O LastRead -1 FirstWrite 7}}
	get_delta_matrix_weights3 {
		delta_weights3 {Type O LastRead -1 FirstWrite 6}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		last_activations {Type I LastRead 1 FirstWrite -1}}
	get_oracle_activations2_1 {
		weights3 {Type I LastRead 2 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		oracle_activations {Type O LastRead -1 FirstWrite 6}
		dactivations {Type I LastRead 2 FirstWrite -1}}
	get_delta_matrix_weights2 {
		delta_weights2 {Type O LastRead -1 FirstWrite 8}
		output_difference {Type I LastRead 3 FirstWrite -1}
		last_activations {Type I LastRead 1 FirstWrite -1}}
	get_oracle_activations1_1 {
		weights2 {Type I LastRead 2 FirstWrite -1}
		output_differences {Type I LastRead 3 FirstWrite -1}
		oracle_activations {Type O LastRead -1 FirstWrite 6}
		dactivations {Type I LastRead 2 FirstWrite -1}}
	get_delta_matrix_weights1_1 {
		delta_weights1 {Type O LastRead -1 FirstWrite 7}
		output_difference {Type I LastRead 3 FirstWrite -1}
		training_data {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	update_weights_1 {
		weights1 {Type IO LastRead 15 FirstWrite 10}
		weights2 {Type IO LastRead 41 FirstWrite 38}
		weights3 {Type IO LastRead 67 FirstWrite 62}
		d_weights1 {Type I LastRead 2 FirstWrite -1}
		d_weights2 {Type I LastRead 28 FirstWrite -1}
		d_weights3 {Type I LastRead 54 FirstWrite -1}
		biases1 {Type IO LastRead 26 FirstWrite 10}
		biases2 {Type IO LastRead 52 FirstWrite 36}
		biases3 {Type IO LastRead 78 FirstWrite 61}
		d_biases1 {Type I LastRead 2 FirstWrite -1}
		d_biases2 {Type I LastRead 28 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "50132118", "Max" : "50132118"}
	, {"Name" : "Interval", "Min" : "50132119", "Max" : "50132119"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights1 { ap_memory {  { weights1_address0 mem_address 1 10 }  { weights1_ce0 mem_ce 1 1 }  { weights1_we0 mem_we 1 1 }  { weights1_d0 mem_din 1 64 }  { weights1_q0 mem_dout 0 64 } } }
	weights2 { ap_memory {  { weights2_address0 mem_address 1 12 }  { weights2_ce0 mem_ce 1 1 }  { weights2_we0 mem_we 1 1 }  { weights2_d0 mem_din 1 64 }  { weights2_q0 mem_dout 0 64 } } }
	weights3 { ap_memory {  { weights3_address0 mem_address 1 8 }  { weights3_ce0 mem_ce 1 1 }  { weights3_we0 mem_we 1 1 }  { weights3_d0 mem_din 1 64 }  { weights3_q0 mem_dout 0 64 } } }
	biases1 { ap_memory {  { biases1_address0 mem_address 1 6 }  { biases1_ce0 mem_ce 1 1 }  { biases1_we0 mem_we 1 1 }  { biases1_d0 mem_din 1 64 }  { biases1_q0 mem_dout 0 64 } } }
	biases2 { ap_memory {  { biases2_address0 mem_address 1 6 }  { biases2_ce0 mem_ce 1 1 }  { biases2_we0 mem_we 1 1 }  { biases2_d0 mem_din 1 64 }  { biases2_q0 mem_dout 0 64 } } }
	biases3 { ap_memory {  { biases3_address0 mem_address 1 2 }  { biases3_ce0 mem_ce 1 1 }  { biases3_we0 mem_we 1 1 }  { biases3_d0 mem_din 1 64 }  { biases3_q0 mem_dout 0 64 } } }
	training_data { ap_memory {  { training_data_address0 mem_address 1 12 }  { training_data_ce0 mem_ce 1 1 }  { training_data_q0 mem_dout 0 64 } } }
	training_targets { ap_memory {  { training_targets_address0 mem_address 1 9 }  { training_targets_ce0 mem_ce 1 1 }  { training_targets_q0 mem_dout 0 64 } } }
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
