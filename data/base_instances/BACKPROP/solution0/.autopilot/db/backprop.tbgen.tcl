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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"],
		"CDFG" : "backprop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50997648", "EstimateLatencyMax" : "50997648",
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
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "weights1", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "weights2", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "weights3", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "biases1", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "biases2", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_update_weights_1_fu_1234", "Port" : "biases3", "Inst_start_state" : "236", "Inst_end_state" : "243"}]},
			{"Name" : "training_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "training_targets", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "backprop_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state15"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state15", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state15"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "RELU_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state20", "LastState" : ["ap_ST_fsm_state50"], "QuitState" : ["ap_ST_fsm_state20"], "PreState" : ["ap_ST_fsm_state15"], "PostState" : ["ap_ST_fsm_state51"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state52", "LastState" : ["ap_ST_fsm_state61"], "QuitState" : ["ap_ST_fsm_state52"], "PreState" : ["ap_ST_fsm_state51"], "PostState" : ["ap_ST_fsm_state51"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state51", "LastState" : ["ap_ST_fsm_state52"], "QuitState" : ["ap_ST_fsm_state51"], "PreState" : ["ap_ST_fsm_state20"], "PostState" : ["ap_ST_fsm_state62"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state62", "LastState" : ["ap_ST_fsm_state66"], "QuitState" : ["ap_ST_fsm_state62"], "PreState" : ["ap_ST_fsm_state51"], "PostState" : ["ap_ST_fsm_state67"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "RELU_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state67", "LastState" : ["ap_ST_fsm_state97"], "QuitState" : ["ap_ST_fsm_state67"], "PreState" : ["ap_ST_fsm_state62"], "PostState" : ["ap_ST_fsm_state98"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state99", "LastState" : ["ap_ST_fsm_state107"], "QuitState" : ["ap_ST_fsm_state99"], "PreState" : ["ap_ST_fsm_state98"], "PostState" : ["ap_ST_fsm_state108"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state98", "LastState" : ["ap_ST_fsm_state108"], "QuitState" : ["ap_ST_fsm_state98"], "PreState" : ["ap_ST_fsm_state67"], "PostState" : ["ap_ST_fsm_state109"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state109", "LastState" : ["ap_ST_fsm_state114"], "QuitState" : ["ap_ST_fsm_state109"], "PreState" : ["ap_ST_fsm_state98"], "PostState" : ["ap_ST_fsm_state115"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "RELU_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state115", "LastState" : ["ap_ST_fsm_state143"], "QuitState" : ["ap_ST_fsm_state115"], "PreState" : ["ap_ST_fsm_state109"], "PostState" : ["ap_ST_fsm_state144"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "soft_max_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state144", "LastState" : ["ap_ST_fsm_state158"], "QuitState" : ["ap_ST_fsm_state144"], "PreState" : ["ap_ST_fsm_state115"], "PostState" : ["ap_ST_fsm_state159"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "soft_max_loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state159", "LastState" : ["ap_ST_fsm_state183"], "QuitState" : ["ap_ST_fsm_state159"], "PreState" : ["ap_ST_fsm_state144"], "PostState" : ["ap_ST_fsm_state184"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "take_difference_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state184", "LastState" : ["ap_ST_fsm_state192"], "QuitState" : ["ap_ST_fsm_state184"], "PreState" : ["ap_ST_fsm_state159"], "PostState" : ["ap_ST_fsm_state193"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights3_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state195", "LastState" : ["ap_ST_fsm_state198"], "QuitState" : ["ap_ST_fsm_state195"], "PreState" : ["ap_ST_fsm_state194"], "PostState" : ["ap_ST_fsm_state193"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights3_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state193", "LastState" : ["ap_ST_fsm_state195"], "QuitState" : ["ap_ST_fsm_state193"], "PreState" : ["ap_ST_fsm_state184"], "PostState" : ["ap_ST_fsm_state199"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state200", "LastState" : ["ap_ST_fsm_state208"], "QuitState" : ["ap_ST_fsm_state200"], "PreState" : ["ap_ST_fsm_state199"], "PostState" : ["ap_ST_fsm_state209"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state199", "LastState" : ["ap_ST_fsm_state212"], "QuitState" : ["ap_ST_fsm_state199"], "PreState" : ["ap_ST_fsm_state193"], "PostState" : ["ap_ST_fsm_state213"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights2_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state215", "LastState" : ["ap_ST_fsm_state220"], "QuitState" : ["ap_ST_fsm_state215"], "PreState" : ["ap_ST_fsm_state214"], "PostState" : ["ap_ST_fsm_state213"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights2_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state213", "LastState" : ["ap_ST_fsm_state215"], "QuitState" : ["ap_ST_fsm_state213"], "PreState" : ["ap_ST_fsm_state199"], "PostState" : ["ap_ST_fsm_state221"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations1_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state222", "LastState" : ["ap_ST_fsm_state231"], "QuitState" : ["ap_ST_fsm_state222"], "PreState" : ["ap_ST_fsm_state221"], "PostState" : ["ap_ST_fsm_state232"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_oracle_activations1_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state221", "LastState" : ["ap_ST_fsm_state235"], "QuitState" : ["ap_ST_fsm_state221"], "PreState" : ["ap_ST_fsm_state213"], "PostState" : ["ap_ST_fsm_state236"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights1_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state238", "LastState" : ["ap_ST_fsm_state242"], "QuitState" : ["ap_ST_fsm_state238"], "PreState" : ["ap_ST_fsm_state237"], "PostState" : ["ap_ST_fsm_state236"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "get_delta_matrix_weights1_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state236", "LastState" : ["ap_ST_fsm_state238"], "QuitState" : ["ap_ST_fsm_state236"], "PreState" : ["ap_ST_fsm_state221"], "PostState" : ["ap_ST_fsm_state243"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "backprop_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "243", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state243"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activations2_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dactivations2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delta_weights3_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations1_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.oracle_activations2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_1234", "Parent" : "0", "Child" : ["11", "12"],
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
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_1234.dsqrt_64ns_64ns_64_12_no_dsp_1_U4", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_weights_1_fu_1234.mux_3_2_64_1_1_U5", "Parent" : "10"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U22", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U23", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U24", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dexp_64ns_64ns_64_10_full_dsp_1_U25", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U26", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U27", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U28", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U29", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U30", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U31", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U32", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U33", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop {
		weights1 {Type IO LastRead 15 FirstWrite 10}
		weights2 {Type IO LastRead 41 FirstWrite 38}
		weights3 {Type IO LastRead 67 FirstWrite 62}
		biases1 {Type IO LastRead 26 FirstWrite 10}
		biases2 {Type IO LastRead 52 FirstWrite 36}
		biases3 {Type IO LastRead 78 FirstWrite 61}
		training_data {Type I LastRead 19 FirstWrite -1}
		training_targets {Type I LastRead 14 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "50997648", "Max" : "50997648"}
	, {"Name" : "Interval", "Min" : "50997649", "Max" : "50997649"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights1 { ap_memory {  { weights1_address0 mem_address 1 10 }  { weights1_ce0 mem_ce 1 1 }  { weights1_we0 mem_we 1 1 }  { weights1_d0 mem_din 1 64 }  { weights1_q0 in_data 0 64 } } }
	weights2 { ap_memory {  { weights2_address0 mem_address 1 12 }  { weights2_ce0 mem_ce 1 1 }  { weights2_we0 mem_we 1 1 }  { weights2_d0 mem_din 1 64 }  { weights2_q0 mem_dout 0 64 } } }
	weights3 { ap_memory {  { weights3_address0 mem_address 1 8 }  { weights3_ce0 mem_ce 1 1 }  { weights3_we0 mem_we 1 1 }  { weights3_d0 mem_din 1 64 }  { weights3_q0 in_data 0 64 } } }
	biases1 { ap_memory {  { biases1_address0 mem_address 1 6 }  { biases1_ce0 mem_ce 1 1 }  { biases1_we0 mem_we 1 1 }  { biases1_d0 mem_din 1 64 }  { biases1_q0 in_data 0 64 } } }
	biases2 { ap_memory {  { biases2_address0 mem_address 1 6 }  { biases2_ce0 mem_ce 1 1 }  { biases2_we0 mem_we 1 1 }  { biases2_d0 mem_din 1 64 }  { biases2_q0 in_data 0 64 } } }
	biases3 { ap_memory {  { biases3_address0 mem_address 1 2 }  { biases3_ce0 mem_ce 1 1 }  { biases3_we0 mem_we 1 1 }  { biases3_d0 mem_din 1 64 }  { biases3_q0 in_data 0 64 } } }
	training_data { ap_memory {  { training_data_address0 mem_address 1 12 }  { training_data_ce0 mem_ce 1 1 }  { training_data_q0 in_data 0 64 } } }
	training_targets { ap_memory {  { training_targets_address0 mem_address 1 9 }  { training_targets_ce0 mem_ce 1 1 }  { training_targets_q0 in_data 0 64 } } }
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
