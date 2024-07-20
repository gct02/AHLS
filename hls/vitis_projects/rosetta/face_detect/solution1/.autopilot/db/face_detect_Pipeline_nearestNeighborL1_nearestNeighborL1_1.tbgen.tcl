set moduleName face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1
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
set C_modelName {face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ y_ratio int 24 regular  }
	{ result_19 int 32 regular  }
	{ IMG1_data int 8 regular {array 76800 { 0 3 } 0 1 }  }
	{ result_18 int 32 regular  }
	{ sext_ln357_1 int 28 regular  }
	{ Data int 8 regular {array 76800 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "y_ratio", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "result_19", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "IMG1_data", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result_18", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln357_1", "interface" : "wire", "bitwidth" : 28, "direction" : "READONLY"} , 
 	{ "Name" : "Data", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ y_ratio sc_in sc_lv 24 signal 0 } 
	{ result_19 sc_in sc_lv 32 signal 1 } 
	{ IMG1_data_address0 sc_out sc_lv 17 signal 2 } 
	{ IMG1_data_ce0 sc_out sc_logic 1 signal 2 } 
	{ IMG1_data_we0 sc_out sc_logic 1 signal 2 } 
	{ IMG1_data_d0 sc_out sc_lv 8 signal 2 } 
	{ result_18 sc_in sc_lv 32 signal 3 } 
	{ sext_ln357_1 sc_in sc_lv 28 signal 4 } 
	{ Data_address0 sc_out sc_lv 17 signal 5 } 
	{ Data_ce0 sc_out sc_logic 1 signal 5 } 
	{ Data_q0 sc_in sc_lv 8 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "y_ratio", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "y_ratio", "role": "default" }} , 
 	{ "name": "result_19", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_19", "role": "default" }} , 
 	{ "name": "IMG1_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IMG1_data", "role": "address0" }} , 
 	{ "name": "IMG1_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IMG1_data", "role": "ce0" }} , 
 	{ "name": "IMG1_data_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IMG1_data", "role": "we0" }} , 
 	{ "name": "IMG1_data_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IMG1_data", "role": "d0" }} , 
 	{ "name": "result_18", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_18", "role": "default" }} , 
 	{ "name": "sext_ln357_1", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "sext_ln357_1", "role": "default" }} , 
 	{ "name": "Data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "Data", "role": "address0" }} , 
 	{ "name": "Data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Data", "role": "ce0" }} , 
 	{ "name": "Data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Data", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "153610", "EstimateLatencyMax" : "153610",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "y_ratio", "Type" : "None", "Direction" : "I"},
			{"Name" : "result_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "IMG1_data", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "result_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln357_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "Data", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "nearestNeighborL1_nearestNeighborL1_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_9ns_28s_32_4_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_24s_24_5_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1 {
		y_ratio {Type I LastRead 0 FirstWrite -1}
		result_19 {Type I LastRead 0 FirstWrite -1}
		IMG1_data {Type O LastRead -1 FirstWrite 11}
		result_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln357_1 {Type I LastRead 0 FirstWrite -1}
		Data {Type I LastRead 9 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "153610", "Max" : "153610"}
	, {"Name" : "Interval", "Min" : "153610", "Max" : "153610"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	y_ratio { ap_none {  { y_ratio in_data 0 24 } } }
	result_19 { ap_none {  { result_19 in_data 0 32 } } }
	IMG1_data { ap_memory {  { IMG1_data_address0 mem_address 1 17 }  { IMG1_data_ce0 mem_ce 1 1 }  { IMG1_data_we0 mem_we 1 1 }  { IMG1_data_d0 mem_din 1 8 } } }
	result_18 { ap_none {  { result_18 in_data 0 32 } } }
	sext_ln357_1 { ap_none {  { sext_ln357_1 in_data 0 28 } } }
	Data { ap_memory {  { Data_address0 mem_address 1 17 }  { Data_ce0 mem_ce 1 1 }  { Data_q0 mem_dout 0 8 } } }
}
