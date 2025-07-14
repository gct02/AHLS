set moduleName scaled_fixed2ieee_63_1_Pipeline_3
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
set C_modelName {scaled_fixed2ieee<63, 1>_Pipeline_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_bits_0_21_reload int 32 regular  }
	{ out_bits_1_2_reload int 32 regular  }
	{ out_bits_2_2_reload int 32 regular  }
	{ out_bits_3 int 32 regular  }
	{ c_2_05_out int 32 regular {pointer 1}  }
	{ c_1_04_out int 32 regular {pointer 1}  }
	{ c_0_03_out int 32 regular {pointer 1}  }
	{ c_3_02_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "out_bits_0_21_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_1_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_2_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_2_05_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_1_04_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_0_03_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_3_02_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_bits_0_21_reload sc_in sc_lv 32 signal 0 } 
	{ out_bits_1_2_reload sc_in sc_lv 32 signal 1 } 
	{ out_bits_2_2_reload sc_in sc_lv 32 signal 2 } 
	{ out_bits_3 sc_in sc_lv 32 signal 3 } 
	{ c_2_05_out sc_out sc_lv 32 signal 4 } 
	{ c_2_05_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ c_1_04_out sc_out sc_lv 32 signal 5 } 
	{ c_1_04_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ c_0_03_out sc_out sc_lv 32 signal 6 } 
	{ c_0_03_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ c_3_02_out sc_out sc_lv 32 signal 7 } 
	{ c_3_02_out_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_bits_0_21_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_0_21_reload", "role": "default" }} , 
 	{ "name": "out_bits_1_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_1_2_reload", "role": "default" }} , 
 	{ "name": "out_bits_2_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_2_2_reload", "role": "default" }} , 
 	{ "name": "out_bits_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_3", "role": "default" }} , 
 	{ "name": "c_2_05_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_2_05_out", "role": "default" }} , 
 	{ "name": "c_2_05_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_2_05_out", "role": "ap_vld" }} , 
 	{ "name": "c_1_04_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_1_04_out", "role": "default" }} , 
 	{ "name": "c_1_04_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_1_04_out", "role": "ap_vld" }} , 
 	{ "name": "c_0_03_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_0_03_out", "role": "default" }} , 
 	{ "name": "c_0_03_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_0_03_out", "role": "ap_vld" }} , 
 	{ "name": "c_3_02_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_3_02_out", "role": "default" }} , 
 	{ "name": "c_3_02_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_3_02_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_0_21_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_1_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_2_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_1_04_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_0_03_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_3_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_4_2_32_1_1_U11", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	scaled_fixed2ieee_63_1_Pipeline_3 {
		out_bits_0_21_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_1_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_2_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_3 {Type I LastRead 0 FirstWrite -1}
		c_2_05_out {Type O LastRead -1 FirstWrite 0}
		c_1_04_out {Type O LastRead -1 FirstWrite 0}
		c_0_03_out {Type O LastRead -1 FirstWrite 0}
		c_3_02_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	out_bits_0_21_reload { ap_none {  { out_bits_0_21_reload in_data 0 32 } } }
	out_bits_1_2_reload { ap_none {  { out_bits_1_2_reload in_data 0 32 } } }
	out_bits_2_2_reload { ap_none {  { out_bits_2_2_reload in_data 0 32 } } }
	out_bits_3 { ap_none {  { out_bits_3 in_data 0 32 } } }
	c_2_05_out { ap_vld {  { c_2_05_out out_data 1 32 }  { c_2_05_out_ap_vld out_vld 1 1 } } }
	c_1_04_out { ap_vld {  { c_1_04_out out_data 1 32 }  { c_1_04_out_ap_vld out_vld 1 1 } } }
	c_0_03_out { ap_vld {  { c_0_03_out out_data 1 32 }  { c_0_03_out_ap_vld out_vld 1 1 } } }
	c_3_02_out { ap_vld {  { c_3_02_out out_data 1 32 }  { c_3_02_out_ap_vld out_vld 1 1 } } }
}
