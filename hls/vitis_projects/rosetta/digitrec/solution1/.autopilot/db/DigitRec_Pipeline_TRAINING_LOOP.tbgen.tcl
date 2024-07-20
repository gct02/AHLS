set moduleName DigitRec_Pipeline_TRAINING_LOOP
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
set C_modelName {DigitRec_Pipeline_TRAINING_LOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ labels_2_1_reload int 32 regular  }
	{ labels_1_1_reload int 32 regular  }
	{ labels_0_1_reload int 32 regular  }
	{ dists_2_1_reload int 32 regular  }
	{ dists_1_1_reload int 32 regular  }
	{ dists_0_1_reload int 32 regular  }
	{ training_labels int 8 regular {array 3000 { 1 3 } 1 1 }  }
	{ training_samples int 64 regular {array 12000 { 1 1 } 1 1 }  }
	{ test_set_load int 64 regular  }
	{ tmp_1 int 11 regular  }
	{ test_set int 64 regular {array 2000 { 1 1 } 1 1 }  }
	{ labels_2_3_out int 32 regular {pointer 1}  }
	{ labels_1_3_out int 32 regular {pointer 1}  }
	{ labels_0_3_out int 32 regular {pointer 1}  }
	{ dists_2_3_out int 32 regular {pointer 2}  }
	{ dists_1_3_out int 32 regular {pointer 2}  }
	{ dists_0_3_out int 32 regular {pointer 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "labels_2_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "labels_1_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "labels_0_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_2_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_1_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dists_0_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "training_labels", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "training_samples", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "test_set_load", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "test_set", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "labels_2_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "labels_1_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "labels_0_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dists_2_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "dists_1_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "dists_0_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ labels_2_1_reload sc_in sc_lv 32 signal 0 } 
	{ labels_1_1_reload sc_in sc_lv 32 signal 1 } 
	{ labels_0_1_reload sc_in sc_lv 32 signal 2 } 
	{ dists_2_1_reload sc_in sc_lv 32 signal 3 } 
	{ dists_1_1_reload sc_in sc_lv 32 signal 4 } 
	{ dists_0_1_reload sc_in sc_lv 32 signal 5 } 
	{ training_labels_address0 sc_out sc_lv 12 signal 6 } 
	{ training_labels_ce0 sc_out sc_logic 1 signal 6 } 
	{ training_labels_q0 sc_in sc_lv 8 signal 6 } 
	{ training_samples_address0 sc_out sc_lv 14 signal 7 } 
	{ training_samples_ce0 sc_out sc_logic 1 signal 7 } 
	{ training_samples_q0 sc_in sc_lv 64 signal 7 } 
	{ training_samples_address1 sc_out sc_lv 14 signal 7 } 
	{ training_samples_ce1 sc_out sc_logic 1 signal 7 } 
	{ training_samples_q1 sc_in sc_lv 64 signal 7 } 
	{ test_set_load sc_in sc_lv 64 signal 8 } 
	{ tmp_1 sc_in sc_lv 11 signal 9 } 
	{ test_set_address0 sc_out sc_lv 11 signal 10 } 
	{ test_set_ce0 sc_out sc_logic 1 signal 10 } 
	{ test_set_q0 sc_in sc_lv 64 signal 10 } 
	{ test_set_address1 sc_out sc_lv 11 signal 10 } 
	{ test_set_ce1 sc_out sc_logic 1 signal 10 } 
	{ test_set_q1 sc_in sc_lv 64 signal 10 } 
	{ labels_2_3_out sc_out sc_lv 32 signal 11 } 
	{ labels_2_3_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ labels_1_3_out sc_out sc_lv 32 signal 12 } 
	{ labels_1_3_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ labels_0_3_out sc_out sc_lv 32 signal 13 } 
	{ labels_0_3_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ dists_2_3_out_i sc_in sc_lv 32 signal 14 } 
	{ dists_2_3_out_o sc_out sc_lv 32 signal 14 } 
	{ dists_2_3_out_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ dists_1_3_out_i sc_in sc_lv 32 signal 15 } 
	{ dists_1_3_out_o sc_out sc_lv 32 signal 15 } 
	{ dists_1_3_out_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ dists_0_3_out_i sc_in sc_lv 32 signal 16 } 
	{ dists_0_3_out_o sc_out sc_lv 32 signal 16 } 
	{ dists_0_3_out_o_ap_vld sc_out sc_logic 1 outvld 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "labels_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_2_1_reload", "role": "default" }} , 
 	{ "name": "labels_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_1_1_reload", "role": "default" }} , 
 	{ "name": "labels_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_0_1_reload", "role": "default" }} , 
 	{ "name": "dists_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_2_1_reload", "role": "default" }} , 
 	{ "name": "dists_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_1_1_reload", "role": "default" }} , 
 	{ "name": "dists_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_0_1_reload", "role": "default" }} , 
 	{ "name": "training_labels_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "training_labels", "role": "address0" }} , 
 	{ "name": "training_labels_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_labels", "role": "ce0" }} , 
 	{ "name": "training_labels_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "training_labels", "role": "q0" }} , 
 	{ "name": "training_samples_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "training_samples", "role": "address0" }} , 
 	{ "name": "training_samples_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_samples", "role": "ce0" }} , 
 	{ "name": "training_samples_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_samples", "role": "q0" }} , 
 	{ "name": "training_samples_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "training_samples", "role": "address1" }} , 
 	{ "name": "training_samples_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "training_samples", "role": "ce1" }} , 
 	{ "name": "training_samples_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "training_samples", "role": "q1" }} , 
 	{ "name": "test_set_load", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_set_load", "role": "default" }} , 
 	{ "name": "tmp_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "tmp_1", "role": "default" }} , 
 	{ "name": "test_set_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "test_set", "role": "address0" }} , 
 	{ "name": "test_set_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "test_set", "role": "ce0" }} , 
 	{ "name": "test_set_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_set", "role": "q0" }} , 
 	{ "name": "test_set_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "test_set", "role": "address1" }} , 
 	{ "name": "test_set_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "test_set", "role": "ce1" }} , 
 	{ "name": "test_set_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_set", "role": "q1" }} , 
 	{ "name": "labels_2_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_2_3_out", "role": "default" }} , 
 	{ "name": "labels_2_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_2_3_out", "role": "ap_vld" }} , 
 	{ "name": "labels_1_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_1_3_out", "role": "default" }} , 
 	{ "name": "labels_1_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_1_3_out", "role": "ap_vld" }} , 
 	{ "name": "labels_0_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "labels_0_3_out", "role": "default" }} , 
 	{ "name": "labels_0_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "labels_0_3_out", "role": "ap_vld" }} , 
 	{ "name": "dists_2_3_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_2_3_out", "role": "i" }} , 
 	{ "name": "dists_2_3_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_2_3_out", "role": "o" }} , 
 	{ "name": "dists_2_3_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_2_3_out", "role": "o_ap_vld" }} , 
 	{ "name": "dists_1_3_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_1_3_out", "role": "i" }} , 
 	{ "name": "dists_1_3_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_1_3_out", "role": "o" }} , 
 	{ "name": "dists_1_3_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_1_3_out", "role": "o_ap_vld" }} , 
 	{ "name": "dists_0_3_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_0_3_out", "role": "i" }} , 
 	{ "name": "dists_0_3_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dists_0_3_out", "role": "o" }} , 
 	{ "name": "dists_0_3_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dists_0_3_out", "role": "o_ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		dists_0_3_out {Type IO LastRead 9 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12011", "Max" : "12011"}
	, {"Name" : "Interval", "Min" : "12011", "Max" : "12011"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	labels_2_1_reload { ap_none {  { labels_2_1_reload in_data 0 32 } } }
	labels_1_1_reload { ap_none {  { labels_1_1_reload in_data 0 32 } } }
	labels_0_1_reload { ap_none {  { labels_0_1_reload in_data 0 32 } } }
	dists_2_1_reload { ap_none {  { dists_2_1_reload in_data 0 32 } } }
	dists_1_1_reload { ap_none {  { dists_1_1_reload in_data 0 32 } } }
	dists_0_1_reload { ap_none {  { dists_0_1_reload in_data 0 32 } } }
	training_labels { ap_memory {  { training_labels_address0 mem_address 1 12 }  { training_labels_ce0 mem_ce 1 1 }  { training_labels_q0 mem_dout 0 8 } } }
	training_samples { ap_memory {  { training_samples_address0 mem_address 1 14 }  { training_samples_ce0 mem_ce 1 1 }  { training_samples_q0 mem_dout 0 64 }  { training_samples_address1 MemPortADDR2 1 14 }  { training_samples_ce1 MemPortCE2 1 1 }  { training_samples_q1 MemPortDOUT2 0 64 } } }
	test_set_load { ap_none {  { test_set_load in_data 0 64 } } }
	tmp_1 { ap_none {  { tmp_1 in_data 0 11 } } }
	test_set { ap_memory {  { test_set_address0 mem_address 1 11 }  { test_set_ce0 mem_ce 1 1 }  { test_set_q0 mem_dout 0 64 }  { test_set_address1 MemPortADDR2 1 11 }  { test_set_ce1 MemPortCE2 1 1 }  { test_set_q1 MemPortDOUT2 0 64 } } }
	labels_2_3_out { ap_vld {  { labels_2_3_out out_data 1 32 }  { labels_2_3_out_ap_vld out_vld 1 1 } } }
	labels_1_3_out { ap_vld {  { labels_1_3_out out_data 1 32 }  { labels_1_3_out_ap_vld out_vld 1 1 } } }
	labels_0_3_out { ap_vld {  { labels_0_3_out out_data 1 32 }  { labels_0_3_out_ap_vld out_vld 1 1 } } }
	dists_2_3_out { ap_ovld {  { dists_2_3_out_i in_data 0 32 }  { dists_2_3_out_o out_data 1 32 }  { dists_2_3_out_o_ap_vld out_vld 1 1 } } }
	dists_1_3_out { ap_ovld {  { dists_1_3_out_i in_data 0 32 }  { dists_1_3_out_o out_data 1 32 }  { dists_1_3_out_o_ap_vld out_vld 1 1 } } }
	dists_0_3_out { ap_ovld {  { dists_0_3_out_i in_data 0 32 }  { dists_0_3_out_o out_data 1 32 }  { dists_0_3_out_o_ap_vld out_vld 1 1 } } }
}
