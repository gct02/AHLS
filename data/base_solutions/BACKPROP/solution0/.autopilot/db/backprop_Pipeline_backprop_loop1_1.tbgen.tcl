set moduleName backprop_Pipeline_backprop_loop1_1
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
set C_modelName {backprop_Pipeline_backprop_loop1_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ activations3_2_0 double 64 regular  }
	{ activations3_1_0 double 64 regular  }
	{ activations3_0_0 double 64 regular  }
	{ activations1 double 64 regular {array 64 { 0 3 } 0 1 }  }
	{ activations2 double 64 regular {array 64 { 0 3 } 0 1 }  }
	{ activations3_2_1_out double 64 regular {pointer 1}  }
	{ activations3_1_1_out double 64 regular {pointer 1}  }
	{ activations3_0_1_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "activations3_2_0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_1_0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_0_0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations1", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations2", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations3_2_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations3_1_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations3_0_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ activations3_2_0 sc_in sc_lv 64 signal 0 } 
	{ activations3_1_0 sc_in sc_lv 64 signal 1 } 
	{ activations3_0_0 sc_in sc_lv 64 signal 2 } 
	{ activations1_address0 sc_out sc_lv 6 signal 3 } 
	{ activations1_ce0 sc_out sc_logic 1 signal 3 } 
	{ activations1_we0 sc_out sc_logic 1 signal 3 } 
	{ activations1_d0 sc_out sc_lv 64 signal 3 } 
	{ activations2_address0 sc_out sc_lv 6 signal 4 } 
	{ activations2_ce0 sc_out sc_logic 1 signal 4 } 
	{ activations2_we0 sc_out sc_logic 1 signal 4 } 
	{ activations2_d0 sc_out sc_lv 64 signal 4 } 
	{ activations3_2_1_out sc_out sc_lv 64 signal 5 } 
	{ activations3_2_1_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ activations3_1_1_out sc_out sc_lv 64 signal 6 } 
	{ activations3_1_1_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ activations3_0_1_out sc_out sc_lv 64 signal 7 } 
	{ activations3_0_1_out_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "activations3_2_0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_2_0", "role": "default" }} , 
 	{ "name": "activations3_1_0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_1_0", "role": "default" }} , 
 	{ "name": "activations3_0_0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_0_0", "role": "default" }} , 
 	{ "name": "activations1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "activations1", "role": "address0" }} , 
 	{ "name": "activations1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations1", "role": "ce0" }} , 
 	{ "name": "activations1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations1", "role": "we0" }} , 
 	{ "name": "activations1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations1", "role": "d0" }} , 
 	{ "name": "activations2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "activations2", "role": "address0" }} , 
 	{ "name": "activations2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations2", "role": "ce0" }} , 
 	{ "name": "activations2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations2", "role": "we0" }} , 
 	{ "name": "activations2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations2", "role": "d0" }} , 
 	{ "name": "activations3_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_2_1_out", "role": "default" }} , 
 	{ "name": "activations3_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "activations3_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_1_1_out", "role": "default" }} , 
 	{ "name": "activations3_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "activations3_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_0_1_out", "role": "default" }} , 
 	{ "name": "activations3_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_0_1_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop_Pipeline_backprop_loop1_1 {
		activations3_2_0 {Type I LastRead 0 FirstWrite -1}
		activations3_1_0 {Type I LastRead 0 FirstWrite -1}
		activations3_0_0 {Type I LastRead 0 FirstWrite -1}
		activations1 {Type O LastRead -1 FirstWrite 0}
		activations2 {Type O LastRead -1 FirstWrite 0}
		activations3_2_1_out {Type O LastRead -1 FirstWrite 0}
		activations3_1_1_out {Type O LastRead -1 FirstWrite 0}
		activations3_0_1_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "66"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	activations3_2_0 { ap_none {  { activations3_2_0 in_data 0 64 } } }
	activations3_1_0 { ap_none {  { activations3_1_0 in_data 0 64 } } }
	activations3_0_0 { ap_none {  { activations3_0_0 in_data 0 64 } } }
	activations1 { ap_memory {  { activations1_address0 mem_address 1 6 }  { activations1_ce0 mem_ce 1 1 }  { activations1_we0 mem_we 1 1 }  { activations1_d0 mem_din 1 64 } } }
	activations2 { ap_memory {  { activations2_address0 mem_address 1 6 }  { activations2_ce0 mem_ce 1 1 }  { activations2_we0 mem_we 1 1 }  { activations2_d0 mem_din 1 64 } } }
	activations3_2_1_out { ap_vld {  { activations3_2_1_out out_data 1 64 }  { activations3_2_1_out_ap_vld out_vld 1 1 } } }
	activations3_1_1_out { ap_vld {  { activations3_1_1_out out_data 1 64 }  { activations3_1_1_out_ap_vld out_vld 1 1 } } }
	activations3_0_1_out { ap_vld {  { activations3_0_1_out out_data 1 64 }  { activations3_0_1_out_ap_vld out_vld 1 1 } } }
}
