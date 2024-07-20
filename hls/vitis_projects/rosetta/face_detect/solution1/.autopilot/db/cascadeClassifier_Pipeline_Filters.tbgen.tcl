set moduleName cascadeClassifier_Pipeline_Filters
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {cascadeClassifier_Pipeline_Filters}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln200 int 32 regular  }
	{ stage_sum int 64 regular  }
	{ add_ln200 int 8 regular  }
	{ stddev_0 int 32 regular  }
	{ pt_y_val int 8 regular  }
	{ pt_x_val int 17 regular  }
	{ SUM1_data int 32 regular {array 76800 { 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ stage_sum_1_out int 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln200", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stage_sum", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln200", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "stddev_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pt_y_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pt_x_val", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "SUM1_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stage_sum_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln200 sc_in sc_lv 32 signal 0 } 
	{ stage_sum sc_in sc_lv 64 signal 1 } 
	{ add_ln200 sc_in sc_lv 8 signal 2 } 
	{ stddev_0 sc_in sc_lv 32 signal 3 } 
	{ pt_y_val sc_in sc_lv 8 signal 4 } 
	{ pt_x_val sc_in sc_lv 17 signal 5 } 
	{ SUM1_data_address0 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce0 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q0 sc_in sc_lv 32 signal 6 } 
	{ SUM1_data_address1 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce1 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q1 sc_in sc_lv 32 signal 6 } 
	{ SUM1_data_address2 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce2 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q2 sc_in sc_lv 32 signal 6 } 
	{ SUM1_data_address3 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce3 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q3 sc_in sc_lv 32 signal 6 } 
	{ SUM1_data_address4 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce4 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q4 sc_in sc_lv 32 signal 6 } 
	{ SUM1_data_address5 sc_out sc_lv 17 signal 6 } 
	{ SUM1_data_ce5 sc_out sc_logic 1 signal 6 } 
	{ SUM1_data_q5 sc_in sc_lv 32 signal 6 } 
	{ stage_sum_1_out sc_out sc_lv 64 signal 7 } 
	{ stage_sum_1_out_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln200", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln200", "role": "default" }} , 
 	{ "name": "stage_sum", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "stage_sum", "role": "default" }} , 
 	{ "name": "add_ln200", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "add_ln200", "role": "default" }} , 
 	{ "name": "stddev_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stddev_0", "role": "default" }} , 
 	{ "name": "pt_y_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pt_y_val", "role": "default" }} , 
 	{ "name": "pt_x_val", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "pt_x_val", "role": "default" }} , 
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
 	{ "name": "stage_sum_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "stage_sum_1_out", "role": "default" }} , 
 	{ "name": "stage_sum_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stage_sum_1_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tree_thresh_array_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_array0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_array1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_array2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.alpha1_array_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.alpha2_array_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array0_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array2_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array1_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array3_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array4_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array6_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array5_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array7_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array8_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array10_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array9_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rectangles_array11_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_13s_32s_32_5_1_U20", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_14ns_32s_32_5_1_U21", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "39", "Max" : "443"}
	, {"Name" : "Interval", "Min" : "39", "Max" : "443"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln200 { ap_none {  { sext_ln200 in_data 0 32 } } }
	stage_sum { ap_none {  { stage_sum in_data 0 64 } } }
	add_ln200 { ap_none {  { add_ln200 in_data 0 8 } } }
	stddev_0 { ap_none {  { stddev_0 in_data 0 32 } } }
	pt_y_val { ap_none {  { pt_y_val in_data 0 8 } } }
	pt_x_val { ap_none {  { pt_x_val in_data 0 17 } } }
	SUM1_data { ap_memory {  { SUM1_data_address0 mem_address 1 17 }  { SUM1_data_ce0 mem_ce 1 1 }  { SUM1_data_q0 mem_dout 0 32 }  { SUM1_data_address1 MemPortADDR2 1 17 }  { SUM1_data_ce1 MemPortCE2 1 1 }  { SUM1_data_q1 MemPortDOUT2 0 32 }  { SUM1_data_address2 MemPortADDR2 1 17 }  { SUM1_data_ce2 MemPortCE2 1 1 }  { SUM1_data_q2 MemPortDOUT2 0 32 }  { SUM1_data_address3 MemPortADDR2 1 17 }  { SUM1_data_ce3 MemPortCE2 1 1 }  { SUM1_data_q3 MemPortDOUT2 0 32 }  { SUM1_data_address4 MemPortADDR2 1 17 }  { SUM1_data_ce4 MemPortCE2 1 1 }  { SUM1_data_q4 MemPortDOUT2 0 32 }  { SUM1_data_address5 MemPortADDR2 1 17 }  { SUM1_data_ce5 MemPortCE2 1 1 }  { SUM1_data_q5 MemPortDOUT2 0 32 } } }
	stage_sum_1_out { ap_vld {  { stage_sum_1_out out_data 1 64 }  { stage_sum_1_out_ap_vld out_vld 1 1 } } }
}
