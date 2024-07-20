set moduleName cascadeClassifier
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
set C_modelName {cascadeClassifier}
set C_modelType { int 6 }
set C_modelArgList {
	{ SUM1_data int 32 regular {array 76800 { 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ SQSUM1_data int 32 regular {array 76800 { 1 1 } 1 1 }  }
	{ pt_x_val int 17 regular  }
	{ pt_y_val int 8 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "SUM1_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "SQSUM1_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pt_x_val", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "pt_y_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 6} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ SUM1_data_address0 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce0 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q0 sc_in sc_lv 32 signal 0 } 
	{ SUM1_data_address1 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce1 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q1 sc_in sc_lv 32 signal 0 } 
	{ SUM1_data_address2 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce2 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q2 sc_in sc_lv 32 signal 0 } 
	{ SUM1_data_address3 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce3 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q3 sc_in sc_lv 32 signal 0 } 
	{ SUM1_data_address4 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce4 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q4 sc_in sc_lv 32 signal 0 } 
	{ SUM1_data_address5 sc_out sc_lv 17 signal 0 } 
	{ SUM1_data_ce5 sc_out sc_logic 1 signal 0 } 
	{ SUM1_data_q5 sc_in sc_lv 32 signal 0 } 
	{ SQSUM1_data_address0 sc_out sc_lv 17 signal 1 } 
	{ SQSUM1_data_ce0 sc_out sc_logic 1 signal 1 } 
	{ SQSUM1_data_q0 sc_in sc_lv 32 signal 1 } 
	{ SQSUM1_data_address1 sc_out sc_lv 17 signal 1 } 
	{ SQSUM1_data_ce1 sc_out sc_logic 1 signal 1 } 
	{ SQSUM1_data_q1 sc_in sc_lv 32 signal 1 } 
	{ pt_x_val sc_in sc_lv 17 signal 2 } 
	{ pt_y_val sc_in sc_lv 8 signal 3 } 
	{ ap_return sc_out sc_lv 6 signal -1 } 
	{ grp_fu_342_p_din0 sc_out sc_lv 33 signal -1 } 
	{ grp_fu_342_p_din1 sc_out sc_lv 33 signal -1 } 
	{ grp_fu_342_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_342_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "SUM1_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address0" }} , 
 	{ "name": "SUM1_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce0" }} , 
 	{ "name": "SUM1_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q0" }} , 
 	{ "name": "SUM1_data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address1" }} , 
 	{ "name": "SUM1_data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce1" }} , 
 	{ "name": "SUM1_data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q1" }} , 
 	{ "name": "SUM1_data_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address2" }} , 
 	{ "name": "SUM1_data_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce2" }} , 
 	{ "name": "SUM1_data_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q2" }} , 
 	{ "name": "SUM1_data_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address3" }} , 
 	{ "name": "SUM1_data_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce3" }} , 
 	{ "name": "SUM1_data_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q3" }} , 
 	{ "name": "SUM1_data_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address4" }} , 
 	{ "name": "SUM1_data_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce4" }} , 
 	{ "name": "SUM1_data_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q4" }} , 
 	{ "name": "SUM1_data_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SUM1_data", "role": "address5" }} , 
 	{ "name": "SUM1_data_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SUM1_data", "role": "ce5" }} , 
 	{ "name": "SUM1_data_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SUM1_data", "role": "q5" }} , 
 	{ "name": "SQSUM1_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "address0" }} , 
 	{ "name": "SQSUM1_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "ce0" }} , 
 	{ "name": "SQSUM1_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "q0" }} , 
 	{ "name": "SQSUM1_data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "address1" }} , 
 	{ "name": "SQSUM1_data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "ce1" }} , 
 	{ "name": "SQSUM1_data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SQSUM1_data", "role": "q1" }} , 
 	{ "name": "pt_x_val", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "pt_x_val", "role": "default" }} , 
 	{ "name": "pt_y_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pt_y_val", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_342_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "grp_fu_342_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_342_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "grp_fu_342_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_342_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_342_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_342_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_342_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "5", "27", "28", "29"],
		"CDFG" : "cascadeClassifier",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "11854",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "SUM1_data", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "SUM1_data", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "SQSUM1_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pt_x_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_y_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "stages_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tree_thresh_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "tree_thresh_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array0", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_8", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_8", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_9", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_9", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_10", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_10", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array2", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "alpha1_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "alpha1_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "alpha2_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "alpha2_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array0", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array2", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array4", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array5", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array7", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array8", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array10", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array9", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array11", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "stages_thresh_array", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Stages", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state45"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.stages_array_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.stages_thresh_array_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_VITIS_LOOP_379_1_fu_281", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "cascadeClassifier_Pipeline_VITIS_LOOP_379_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_379_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_VITIS_LOOP_379_1_fu_281.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287", "Parent" : "0", "Child" : ["6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "cascadeClassifier_Pipeline_Filters",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39", "EstimateLatencyMax" : "443",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln200", "Type" : "None", "Direction" : "I"},
			{"Name" : "stage_sum", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln200", "Type" : "None", "Direction" : "I"},
			{"Name" : "stddev_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_y_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_x_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "SUM1_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "stage_sum_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "tree_thresh_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_array0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_array1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "coord_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "coord_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "coord_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "weights_array2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "alpha1_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "alpha2_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array11", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Filters", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.tree_thresh_array_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array0_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array1_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array2_U", "Parent" : "5"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.alpha1_array_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.alpha2_array_U", "Parent" : "5"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array0_U", "Parent" : "5"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array2_U", "Parent" : "5"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array1_U", "Parent" : "5"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array3_U", "Parent" : "5"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array4_U", "Parent" : "5"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array6_U", "Parent" : "5"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array5_U", "Parent" : "5"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array7_U", "Parent" : "5"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array8_U", "Parent" : "5"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array10_U", "Parent" : "5"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array9_U", "Parent" : "5"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array11_U", "Parent" : "5"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.mul_13s_32s_32_5_1_U20", "Parent" : "5"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.mul_14ns_32s_32_5_1_U21", "Parent" : "5"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_Pipeline_Filters_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_14_full_dsp_1_U50", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dcmp_64ns_64ns_1_4_no_dsp_1_U51", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_64s_64_7_no_dsp_1_U52", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	cascadeClassifier {
		SUM1_data {Type I LastRead 8 FirstWrite -1}
		SQSUM1_data {Type I LastRead 5 FirstWrite -1}
		pt_x_val {Type I LastRead 0 FirstWrite -1}
		pt_y_val {Type I LastRead 0 FirstWrite -1}
		stages_array {Type I LastRead -1 FirstWrite -1}
		tree_thresh_array {Type I LastRead -1 FirstWrite -1}
		weights_array0 {Type I LastRead -1 FirstWrite -1}
		weights_array1 {Type I LastRead -1 FirstWrite -1}
		coord_8 {Type IO LastRead -1 FirstWrite -1}
		coord_9 {Type IO LastRead -1 FirstWrite -1}
		coord_10 {Type IO LastRead -1 FirstWrite -1}
		weights_array2 {Type I LastRead -1 FirstWrite -1}
		alpha1_array {Type I LastRead -1 FirstWrite -1}
		alpha2_array {Type I LastRead -1 FirstWrite -1}
		rectangles_array0 {Type I LastRead -1 FirstWrite -1}
		rectangles_array2 {Type I LastRead -1 FirstWrite -1}
		rectangles_array1 {Type I LastRead -1 FirstWrite -1}
		rectangles_array3 {Type I LastRead -1 FirstWrite -1}
		rectangles_array4 {Type I LastRead -1 FirstWrite -1}
		rectangles_array6 {Type I LastRead -1 FirstWrite -1}
		rectangles_array5 {Type I LastRead -1 FirstWrite -1}
		rectangles_array7 {Type I LastRead -1 FirstWrite -1}
		rectangles_array8 {Type I LastRead -1 FirstWrite -1}
		rectangles_array10 {Type I LastRead -1 FirstWrite -1}
		rectangles_array9 {Type I LastRead -1 FirstWrite -1}
		rectangles_array11 {Type I LastRead -1 FirstWrite -1}
		stages_thresh_array {Type I LastRead -1 FirstWrite -1}}
	cascadeClassifier_Pipeline_VITIS_LOOP_379_1 {
		empty {Type I LastRead 0 FirstWrite -1}
		a_out {Type O LastRead -1 FirstWrite 1}}
	cascadeClassifier_Pipeline_Filters {
		sext_ln200 {Type I LastRead 0 FirstWrite -1}
		stage_sum {Type I LastRead 0 FirstWrite -1}
		add_ln200 {Type I LastRead 0 FirstWrite -1}
		stddev_0 {Type I LastRead 0 FirstWrite -1}
		pt_y_val {Type I LastRead 0 FirstWrite -1}
		pt_x_val {Type I LastRead 0 FirstWrite -1}
		SUM1_data {Type I LastRead 8 FirstWrite -1}
		stage_sum_1_out {Type O LastRead -1 FirstWrite 20}
		tree_thresh_array {Type I LastRead -1 FirstWrite -1}
		weights_array0 {Type I LastRead -1 FirstWrite -1}
		weights_array1 {Type I LastRead -1 FirstWrite -1}
		coord_8 {Type IO LastRead -1 FirstWrite -1}
		coord_9 {Type IO LastRead -1 FirstWrite -1}
		coord_10 {Type IO LastRead -1 FirstWrite -1}
		weights_array2 {Type I LastRead -1 FirstWrite -1}
		alpha1_array {Type I LastRead -1 FirstWrite -1}
		alpha2_array {Type I LastRead -1 FirstWrite -1}
		rectangles_array0 {Type I LastRead -1 FirstWrite -1}
		rectangles_array2 {Type I LastRead -1 FirstWrite -1}
		rectangles_array1 {Type I LastRead -1 FirstWrite -1}
		rectangles_array3 {Type I LastRead -1 FirstWrite -1}
		rectangles_array4 {Type I LastRead -1 FirstWrite -1}
		rectangles_array6 {Type I LastRead -1 FirstWrite -1}
		rectangles_array5 {Type I LastRead -1 FirstWrite -1}
		rectangles_array7 {Type I LastRead -1 FirstWrite -1}
		rectangles_array8 {Type I LastRead -1 FirstWrite -1}
		rectangles_array10 {Type I LastRead -1 FirstWrite -1}
		rectangles_array9 {Type I LastRead -1 FirstWrite -1}
		rectangles_array11 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "16", "Max" : "11854"}
	, {"Name" : "Interval", "Min" : "16", "Max" : "11854"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	SUM1_data { ap_memory {  { SUM1_data_address0 mem_address 1 17 }  { SUM1_data_ce0 mem_ce 1 1 }  { SUM1_data_q0 mem_dout 0 32 }  { SUM1_data_address1 MemPortADDR2 1 17 }  { SUM1_data_ce1 MemPortCE2 1 1 }  { SUM1_data_q1 MemPortDOUT2 0 32 }  { SUM1_data_address2 MemPortADDR2 1 17 }  { SUM1_data_ce2 MemPortCE2 1 1 }  { SUM1_data_q2 MemPortDOUT2 0 32 }  { SUM1_data_address3 MemPortADDR2 1 17 }  { SUM1_data_ce3 MemPortCE2 1 1 }  { SUM1_data_q3 MemPortDOUT2 0 32 }  { SUM1_data_address4 MemPortADDR2 1 17 }  { SUM1_data_ce4 MemPortCE2 1 1 }  { SUM1_data_q4 MemPortDOUT2 0 32 }  { SUM1_data_address5 MemPortADDR2 1 17 }  { SUM1_data_ce5 MemPortCE2 1 1 }  { SUM1_data_q5 MemPortDOUT2 0 32 } } }
	SQSUM1_data { ap_memory {  { SQSUM1_data_address0 mem_address 1 17 }  { SQSUM1_data_ce0 mem_ce 1 1 }  { SQSUM1_data_q0 mem_dout 0 32 }  { SQSUM1_data_address1 MemPortADDR2 1 17 }  { SQSUM1_data_ce1 MemPortCE2 1 1 }  { SQSUM1_data_q1 MemPortDOUT2 0 32 } } }
	pt_x_val { ap_none {  { pt_x_val in_data 0 17 } } }
	pt_y_val { ap_none {  { pt_y_val in_data 0 8 } } }
}
