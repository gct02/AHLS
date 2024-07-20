set moduleName DigitRec_Pipeline_SET_KNN_SET
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
set C_modelName {DigitRec_Pipeline_SET_KNN_SET}
set C_modelType { void 0 }
set C_modelArgList {
	{ labels_2_0 int 32 regular  }
	{ labels_1_0 int 32 regular  }
	{ labels_0_0 int 32 regular  }
	{ dists_2_0 int 32 regular  }
	{ dists_1_0 int 32 regular  }
	{ dists_0_0 int 32 regular  }
	{ labels_2_1_out int 32 regular {pointer 1}  }
	{ labels_1_1_out int 32 regular {pointer 1}  }
	{ labels_0_1_out int 32 regular {pointer 1}  }
	{ dists_2_1_out int 32 regular {pointer 1}  }
	{ dists_1_1_out int 32 regular {pointer 1}  }
	{ dists_0_1_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "labels_2_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "labels_1_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "labels_0_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_2_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_1_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_0_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "labels_2_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "labels_1_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "labels_0_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dists_2_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dists_1_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dists_0_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ labels_2_0 sc_in sc_lv 32 signal 0 } 
	{ labels_1_0 sc_in sc_lv 32 signal 1 } 
	{ labels_0_0 sc_in sc_lv 32 signal 2 } 
	{ dists_2_0 sc_in sc_lv 32 signal 3 } 
	{ dists_1_0 sc_in sc_lv 32 signal 4 } 
	{ dists_0_0 sc_in sc_lv 32 signal 5 } 
	{ labels_2_1_out sc_out sc_lv 32 signal 6 } 
	{ labels_2_1_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ labels_1_1_out sc_out sc_lv 32 signal 7 } 
	{ labels_1_1_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ labels_0_1_out sc_out sc_lv 32 signal 8 } 
	{ labels_0_1_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ dists_2_1_out sc_out sc_lv 32 signal 9 } 
	{ dists_2_1_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ dists_1_1_out sc_out sc_lv 32 signal 10 } 
	{ dists_1_1_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ dists_0_1_out sc_out sc_lv 32 signal 11 } 
	{ dists_0_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "labels_2_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_2_0", "role": "default" }} , 
 	{ "name": "labels_1_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_1_0", "role": "default" }} , 
 	{ "name": "labels_0_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_0_0", "role": "default" }} , 
 	{ "name": "dists_2_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_2_0", "role": "default" }} , 
 	{ "name": "dists_1_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_1_0", "role": "default" }} , 
 	{ "name": "dists_0_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_0_0", "role": "default" }} , 
 	{ "name": "labels_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_2_1_out", "role": "default" }} , 
 	{ "name": "labels_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "labels_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_1_1_out", "role": "default" }} , 
 	{ "name": "labels_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "labels_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_0_1_out", "role": "default" }} , 
 	{ "name": "labels_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "dists_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_2_1_out", "role": "default" }} , 
 	{ "name": "dists_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "dists_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_1_1_out", "role": "default" }} , 
 	{ "name": "dists_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "dists_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_0_1_out", "role": "default" }} , 
 	{ "name": "dists_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_0_1_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		dists_0_1_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	labels_2_0 { ap_none {  { labels_2_0 in_data 0 32 } } }
	labels_1_0 { ap_none {  { labels_1_0 in_data 0 32 } } }
	labels_0_0 { ap_none {  { labels_0_0 in_data 0 32 } } }
	dists_2_0 { ap_none {  { dists_2_0 in_data 0 32 } } }
	dists_1_0 { ap_none {  { dists_1_0 in_data 0 32 } } }
	dists_0_0 { ap_none {  { dists_0_0 in_data 0 32 } } }
	labels_2_1_out { ap_vld {  { labels_2_1_out out_data 1 32 }  { labels_2_1_out_ap_vld out_vld 1 1 } } }
	labels_1_1_out { ap_vld {  { labels_1_1_out out_data 1 32 }  { labels_1_1_out_ap_vld out_vld 1 1 } } }
	labels_0_1_out { ap_vld {  { labels_0_1_out out_data 1 32 }  { labels_0_1_out_ap_vld out_vld 1 1 } } }
	dists_2_1_out { ap_vld {  { dists_2_1_out out_data 1 32 }  { dists_2_1_out_ap_vld out_vld 1 1 } } }
	dists_1_1_out { ap_vld {  { dists_1_1_out out_data 1 32 }  { dists_1_1_out_ap_vld out_vld 1 1 } } }
	dists_0_1_out { ap_vld {  { dists_0_1_out out_data 1 32 }  { dists_0_1_out_ap_vld out_vld 1 1 } } }
}
