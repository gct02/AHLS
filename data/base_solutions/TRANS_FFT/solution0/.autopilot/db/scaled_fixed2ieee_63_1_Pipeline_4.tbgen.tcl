set moduleName scaled_fixed2ieee_63_1_Pipeline_4
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
set C_modelName {scaled_fixed2ieee<63, 1>_Pipeline_4}
set C_modelType { int 1 }
set C_modelArgList {
	{ in_val int 63 regular  }
	{ c_0_03_reload int 32 regular  }
	{ c_1_04_reload int 32 regular  }
	{ c_2_05_reload int 32 regular  }
	{ c_3_02_reload int 32 regular  }
	{ shift_out int 32 regular {pointer 1}  }
	{ in_shift_out int 62 regular {pointer 1}  }
	{ shift_1_out int 32 regular {pointer 1}  }
	{ in_shift_1_out int 62 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "in_val", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "c_0_03_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_1_04_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_2_05_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_3_02_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "shift_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in_shift_out", "interface" : "wire", "bitwidth" : 62, "direction" : "WRITEONLY"} , 
 	{ "Name" : "shift_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in_shift_1_out", "interface" : "wire", "bitwidth" : 62, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_val sc_in sc_lv 63 signal 0 } 
	{ c_0_03_reload sc_in sc_lv 32 signal 1 } 
	{ c_1_04_reload sc_in sc_lv 32 signal 2 } 
	{ c_2_05_reload sc_in sc_lv 32 signal 3 } 
	{ c_3_02_reload sc_in sc_lv 32 signal 4 } 
	{ shift_out sc_out sc_lv 32 signal 5 } 
	{ shift_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ in_shift_out sc_out sc_lv 62 signal 6 } 
	{ in_shift_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ shift_1_out sc_out sc_lv 32 signal 7 } 
	{ shift_1_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ in_shift_1_out sc_out sc_lv 62 signal 8 } 
	{ in_shift_1_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_val", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "in_val", "role": "default" }} , 
 	{ "name": "c_0_03_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_0_03_reload", "role": "default" }} , 
 	{ "name": "c_1_04_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_1_04_reload", "role": "default" }} , 
 	{ "name": "c_2_05_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_2_05_reload", "role": "default" }} , 
 	{ "name": "c_3_02_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_3_02_reload", "role": "default" }} , 
 	{ "name": "shift_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "shift_out", "role": "default" }} , 
 	{ "name": "shift_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "shift_out", "role": "ap_vld" }} , 
 	{ "name": "in_shift_out", "direction": "out", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "in_shift_out", "role": "default" }} , 
 	{ "name": "in_shift_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "in_shift_out", "role": "ap_vld" }} , 
 	{ "name": "shift_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "shift_1_out", "role": "default" }} , 
 	{ "name": "shift_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "shift_1_out", "role": "ap_vld" }} , 
 	{ "name": "in_shift_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "in_shift_1_out", "role": "default" }} , 
 	{ "name": "in_shift_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "in_shift_1_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_0_03_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_1_04_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_3_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "shift_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_32_1_1_U21", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	scaled_fixed2ieee_63_1_Pipeline_4 {
		in_val {Type I LastRead 0 FirstWrite -1}
		c_0_03_reload {Type I LastRead 0 FirstWrite -1}
		c_1_04_reload {Type I LastRead 0 FirstWrite -1}
		c_2_05_reload {Type I LastRead 0 FirstWrite -1}
		c_3_02_reload {Type I LastRead 0 FirstWrite -1}
		shift_out {Type O LastRead -1 FirstWrite 1}
		in_shift_out {Type O LastRead -1 FirstWrite 1}
		shift_1_out {Type O LastRead -1 FirstWrite 1}
		in_shift_1_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_val { ap_none {  { in_val in_data 0 63 } } }
	c_0_03_reload { ap_none {  { c_0_03_reload in_data 0 32 } } }
	c_1_04_reload { ap_none {  { c_1_04_reload in_data 0 32 } } }
	c_2_05_reload { ap_none {  { c_2_05_reload in_data 0 32 } } }
	c_3_02_reload { ap_none {  { c_3_02_reload in_data 0 32 } } }
	shift_out { ap_vld {  { shift_out out_data 1 32 }  { shift_out_ap_vld out_vld 1 1 } } }
	in_shift_out { ap_vld {  { in_shift_out out_data 1 62 }  { in_shift_out_ap_vld out_vld 1 1 } } }
	shift_1_out { ap_vld {  { shift_1_out out_data 1 32 }  { shift_1_out_ap_vld out_vld 1 1 } } }
	in_shift_1_out { ap_vld {  { in_shift_1_out out_data 1 62 }  { in_shift_1_out_ap_vld out_vld 1 1 } } }
}
