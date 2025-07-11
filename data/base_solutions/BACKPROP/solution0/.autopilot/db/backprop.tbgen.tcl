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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "13", "18", "21", "24", "26", "29", "32", "34", "37", "38", "39", "40", "43", "44", "45", "46"],
		"CDFG" : "backprop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50857142", "EstimateLatencyMax" : "50857142",
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
					{"ID" : "10", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_323", "Port" : "weights1", "Inst_start_state" : "3", "Inst_end_state" : "5"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "weights1", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_341", "Port" : "weights2", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "38", "SubInstance" : "grp_get_oracle_activations1_1_fu_429", "Port" : "weights2", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "weights2", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_351", "Port" : "weights3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "34", "SubInstance" : "grp_get_oracle_activations2_1_fu_411", "Port" : "weights3", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "weights3", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_323", "Port" : "biases1", "Inst_start_state" : "3", "Inst_end_state" : "5"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "biases1", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_341", "Port" : "biases2", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "biases2", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_351", "Port" : "biases3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "40", "SubInstance" : "grp_update_weights_1_fu_447", "Port" : "biases3", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_323", "Port" : "training_data", "Inst_start_state" : "3", "Inst_end_state" : "5"},
					{"ID" : "39", "SubInstance" : "grp_get_delta_matrix_weights1_1_fu_438", "Port" : "training_data", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_take_difference_1_fu_386", "Port" : "training_targets", "Inst_start_state" : "15", "Inst_end_state" : "16"}]}],
		"Loop" : [
			{"Name" : "backprop_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "backprop_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations2_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights3_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations1_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_323", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "matrix_vector_product_with_bias_input_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8771", "EstimateLatencyMax" : "8771",
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
					{"ID" : "11", "SubInstance" : "grp_add_bias_to_activations_clone_1_fu_136", "Port" : "biases2", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_add_bias_to_activations_clone_1_fu_136", "Port" : "activations", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_323.grp_add_bias_to_activations_clone_1_fu_136", "Parent" : "10", "Child" : ["12"],
		"CDFG" : "add_bias_to_activations_clone_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "321", "EstimateLatencyMax" : "321",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_input_layer_1_fu_323.grp_add_bias_to_activations_clone_1_fu_136.dadd_64ns_64ns_64_4_full_dsp_1_U1", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RELU_fu_335", "Parent" : "0", "Child" : ["14", "15", "16", "17"],
		"CDFG" : "RELU",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1985", "EstimateLatencyMax" : "1985",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dactivations", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state32"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RELU_fu_335.dadddsub_64ns_64ns_64_4_full_dsp_1_U12", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RELU_fu_335.dmul_64ns_64ns_64_4_max_dsp_1_U13", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RELU_fu_335.ddiv_64ns_64ns_64_14_no_dsp_1_U14", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RELU_fu_335.dexp_64ns_64ns_64_10_full_dsp_1_U15", "Parent" : "13"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_341", "Parent" : "0", "Child" : ["19"],
		"CDFG" : "matrix_vector_product_with_bias_second_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41411", "EstimateLatencyMax" : "41411",
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
					{"ID" : "19", "SubInstance" : "grp_add_bias_to_activations_clone_1_fu_115", "Port" : "biases2", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_add_bias_to_activations_clone_1_fu_115", "Port" : "activations", "Inst_start_state" : "2", "Inst_end_state" : "13"}]},
			{"Name" : "input_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_341.grp_add_bias_to_activations_clone_1_fu_115", "Parent" : "18", "Child" : ["20"],
		"CDFG" : "add_bias_to_activations_clone_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "321", "EstimateLatencyMax" : "321",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_second_layer_1_fu_341.grp_add_bias_to_activations_clone_1_fu_115.dadd_64ns_64ns_64_4_full_dsp_1_U1", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_351", "Parent" : "0", "Child" : ["22"],
		"CDFG" : "matrix_vector_product_with_bias_output_layer_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1752", "EstimateLatencyMax" : "1752",
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
					{"ID" : "22", "SubInstance" : "grp_add_bias_to_activations_1_fu_145", "Port" : "biases3", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_activations", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_351.grp_add_bias_to_activations_1_fu_145", "Parent" : "21", "Child" : ["23"],
		"CDFG" : "add_bias_to_activations_1",
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
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_matrix_vector_product_with_bias_output_layer_1_fu_351.grp_add_bias_to_activations_1_fu_145.mux_3_2_64_1_1_U27", "Parent" : "22"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_RELU_clone_fu_366", "Parent" : "0", "Child" : ["25"],
		"CDFG" : "RELU_clone",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "106", "EstimateLatencyMax" : "106",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "36", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_RELU_clone_fu_366.mux_3_2_64_1_1_U45", "Parent" : "24"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_soft_max_fu_376", "Parent" : "0", "Child" : ["27", "28"],
		"CDFG" : "soft_max",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "122", "EstimateLatencyMax" : "122",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "soft_max_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state16"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "soft_max_loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "41", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state41"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_soft_max_fu_376.mux_3_2_64_1_1_U55", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_soft_max_fu_376.mux_3_2_64_1_1_U56", "Parent" : "26"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_take_difference_1_fu_386", "Parent" : "0", "Child" : ["30", "31"],
		"CDFG" : "take_difference_1",
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "take_difference_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "10", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_take_difference_1_fu_386.mux_3_2_64_1_1_U65", "Parent" : "29"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_take_difference_1_fu_386.mux_3_2_64_1_1_U66", "Parent" : "29"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights3_fu_402", "Parent" : "0", "Child" : ["33"],
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
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights3_fu_402.mux_3_2_64_1_1_U79", "Parent" : "32"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations2_1_fu_411", "Parent" : "0", "Child" : ["35", "36"],
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
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations2_1_fu_411.dmul_64ns_64ns_64_4_max_dsp_1_U86", "Parent" : "34"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations2_1_fu_411.mux_3_2_64_1_1_U87", "Parent" : "34"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights2_fu_422", "Parent" : "0",
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
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_oracle_activations1_1_fu_429", "Parent" : "0",
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
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_get_delta_matrix_weights1_1_fu_438", "Parent" : "0",
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
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_447", "Parent" : "0", "Child" : ["41", "42"],
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
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_447.dsqrt_64ns_64ns_64_12_no_dsp_1_U112", "Parent" : "40"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_447.mux_3_2_64_1_1_U113", "Parent" : "40"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U129", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U130", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U131", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dexp_64ns_64ns_64_10_full_dsp_1_U132", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop {
		weights1 {Type IO LastRead 15 FirstWrite -1}
		weights2 {Type IO LastRead 41 FirstWrite -1}
		weights3 {Type IO LastRead 67 FirstWrite -1}
		biases1 {Type IO LastRead 26 FirstWrite -1}
		biases2 {Type IO LastRead 52 FirstWrite -1}
		biases3 {Type IO LastRead 78 FirstWrite -1}
		training_data {Type I LastRead 2 FirstWrite -1}
		training_targets {Type I LastRead 1 FirstWrite -1}}
	matrix_vector_product_with_bias_input_layer_1 {
		biases1 {Type I LastRead 1 FirstWrite -1}
		weights1 {Type I LastRead 3 FirstWrite -1}
		activations {Type IO LastRead 1 FirstWrite 2}
		training_data {Type I LastRead 2 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	add_bias_to_activations_clone_1 {
		biases2 {Type I LastRead 1 FirstWrite -1}
		activations {Type IO LastRead 1 FirstWrite 5}}
	RELU {
		activations {Type IO LastRead 1 FirstWrite 31}
		dactivations {Type O LastRead -1 FirstWrite 9}}
	matrix_vector_product_with_bias_second_layer_1 {
		biases2 {Type I LastRead 1 FirstWrite -1}
		weights2 {Type I LastRead 2 FirstWrite -1}
		activations {Type IO LastRead 1 FirstWrite 2}
		input_activations {Type I LastRead 3 FirstWrite -1}}
	add_bias_to_activations_clone_1 {
		biases2 {Type I LastRead 1 FirstWrite -1}
		activations {Type IO LastRead 1 FirstWrite 5}}
	matrix_vector_product_with_bias_output_layer_1 {
		biases3 {Type I LastRead 1 FirstWrite -1}
		weights3 {Type I LastRead 2 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		input_activations {Type I LastRead 2 FirstWrite -1}}
	add_bias_to_activations_1 {
		biases3 {Type I LastRead 1 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}}
	RELU_clone {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read25 {Type I LastRead 0 FirstWrite -1}}
	soft_max {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}}
	take_difference_1 {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		training_targets {Type I LastRead 1 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read25 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "50857142", "Max" : "50857142"}
	, {"Name" : "Interval", "Min" : "50857143", "Max" : "50857143"}
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
