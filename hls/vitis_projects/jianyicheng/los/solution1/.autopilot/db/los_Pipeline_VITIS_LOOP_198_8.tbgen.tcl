set moduleName los_Pipeline_VITIS_LOOP_198_8
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
set C_modelName {los_Pipeline_VITIS_LOOP_198_8}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln196 int 7 regular  }
	{ zext_ln174_3 int 4 regular  }
	{ zext_ln185 int 6 regular  }
	{ sext_ln174 int 6 regular  }
	{ zext_ln174_1 int 6 regular  }
	{ select_ln179 int 2 regular  }
	{ sext_ln180_1 int 7 regular  }
	{ obstacles_3 int 1 regular {array 1024 { 1 3 } 1 1 }  }
	{ sight_3_1_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln196", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln174_3", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln185", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln174", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln174_1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln179", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln180_1", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "obstacles_3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sight_3_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln196 sc_in sc_lv 7 signal 0 } 
	{ zext_ln174_3 sc_in sc_lv 4 signal 1 } 
	{ zext_ln185 sc_in sc_lv 6 signal 2 } 
	{ sext_ln174 sc_in sc_lv 6 signal 3 } 
	{ zext_ln174_1 sc_in sc_lv 6 signal 4 } 
	{ select_ln179 sc_in sc_lv 2 signal 5 } 
	{ sext_ln180_1 sc_in sc_lv 7 signal 6 } 
	{ obstacles_3_address0 sc_out sc_lv 10 signal 7 } 
	{ obstacles_3_ce0 sc_out sc_logic 1 signal 7 } 
	{ obstacles_3_q0 sc_in sc_lv 1 signal 7 } 
	{ sight_3_1_out sc_out sc_lv 32 signal 8 } 
	{ sight_3_1_out_ap_vld sc_out sc_logic 1 outvld 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln196", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sext_ln196", "role": "default" }} , 
 	{ "name": "zext_ln174_3", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln174_3", "role": "default" }} , 
 	{ "name": "zext_ln185", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "zext_ln185", "role": "default" }} , 
 	{ "name": "sext_ln174", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "sext_ln174", "role": "default" }} , 
 	{ "name": "zext_ln174_1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "zext_ln174_1", "role": "default" }} , 
 	{ "name": "select_ln179", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "select_ln179", "role": "default" }} , 
 	{ "name": "sext_ln180_1", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sext_ln180_1", "role": "default" }} , 
 	{ "name": "obstacles_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "obstacles_3", "role": "address0" }} , 
 	{ "name": "obstacles_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_3", "role": "ce0" }} , 
 	{ "name": "obstacles_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obstacles_3", "role": "q0" }} , 
 	{ "name": "sight_3_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sight_3_1_out", "role": "default" }} , 
 	{ "name": "sight_3_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sight_3_1_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "los_Pipeline_VITIS_LOOP_198_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln185", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln179", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln180_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "obstacles_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sight_3_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_198_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	los_Pipeline_VITIS_LOOP_198_8 {
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		zext_ln174_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln185 {Type I LastRead 0 FirstWrite -1}
		sext_ln174 {Type I LastRead 0 FirstWrite -1}
		zext_ln174_1 {Type I LastRead 0 FirstWrite -1}
		select_ln179 {Type I LastRead 0 FirstWrite -1}
		sext_ln180_1 {Type I LastRead 0 FirstWrite -1}
		obstacles_3 {Type I LastRead 1 FirstWrite -1}
		sight_3_1_out {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln196 { ap_none {  { sext_ln196 in_data 0 7 } } }
	zext_ln174_3 { ap_none {  { zext_ln174_3 in_data 0 4 } } }
	zext_ln185 { ap_none {  { zext_ln185 in_data 0 6 } } }
	sext_ln174 { ap_none {  { sext_ln174 in_data 0 6 } } }
	zext_ln174_1 { ap_none {  { zext_ln174_1 in_data 0 6 } } }
	select_ln179 { ap_none {  { select_ln179 in_data 0 2 } } }
	sext_ln180_1 { ap_none {  { sext_ln180_1 in_data 0 7 } } }
	obstacles_3 { ap_memory {  { obstacles_3_address0 mem_address 1 10 }  { obstacles_3_ce0 mem_ce 1 1 }  { obstacles_3_q0 mem_dout 0 1 } } }
	sight_3_1_out { ap_vld {  { sight_3_1_out out_data 1 32 }  { sight_3_1_out_ap_vld out_vld 1 1 } } }
}