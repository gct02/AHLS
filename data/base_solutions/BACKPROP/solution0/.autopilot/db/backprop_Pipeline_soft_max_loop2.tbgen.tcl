set moduleName backprop_Pipeline_soft_max_loop2
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
set C_modelName {backprop_Pipeline_soft_max_loop2}
set C_modelType { void 0 }
set C_modelArgList {
	{ net_outputs_2_06 double 64 regular  }
	{ net_outputs_1_05 double 64 regular  }
	{ net_outputs_0_04 double 64 regular  }
	{ activations3_0_4_reload double 64 regular  }
	{ activations3_1_4_reload double 64 regular  }
	{ activations3_2_4_reload double 64 regular  }
	{ sum_reload double 64 regular  }
	{ net_outputs_2_1_out double 64 regular {pointer 1}  }
	{ net_outputs_1_1_out double 64 regular {pointer 1}  }
	{ net_outputs_0_1_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "net_outputs_2_06", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_1_05", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_0_04", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_0_4_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_1_4_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_2_4_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sum_reload", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "net_outputs_2_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "net_outputs_1_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "net_outputs_0_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ net_outputs_2_06 sc_in sc_lv 64 signal 0 } 
	{ net_outputs_1_05 sc_in sc_lv 64 signal 1 } 
	{ net_outputs_0_04 sc_in sc_lv 64 signal 2 } 
	{ activations3_0_4_reload sc_in sc_lv 64 signal 3 } 
	{ activations3_1_4_reload sc_in sc_lv 64 signal 4 } 
	{ activations3_2_4_reload sc_in sc_lv 64 signal 5 } 
	{ sum_reload sc_in sc_lv 64 signal 6 } 
	{ net_outputs_2_1_out sc_out sc_lv 64 signal 7 } 
	{ net_outputs_2_1_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ net_outputs_1_1_out sc_out sc_lv 64 signal 8 } 
	{ net_outputs_1_1_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ net_outputs_0_1_out sc_out sc_lv 64 signal 9 } 
	{ net_outputs_0_1_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ grp_fu_1000_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1000_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1000_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1000_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1004_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1004_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1004_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1004_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "net_outputs_2_06", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_2_06", "role": "default" }} , 
 	{ "name": "net_outputs_1_05", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_1_05", "role": "default" }} , 
 	{ "name": "net_outputs_0_04", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_0_04", "role": "default" }} , 
 	{ "name": "activations3_0_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_0_4_reload", "role": "default" }} , 
 	{ "name": "activations3_1_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_1_4_reload", "role": "default" }} , 
 	{ "name": "activations3_2_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_2_4_reload", "role": "default" }} , 
 	{ "name": "sum_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_reload", "role": "default" }} , 
 	{ "name": "net_outputs_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_2_1_out", "role": "default" }} , 
 	{ "name": "net_outputs_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "net_outputs_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "net_outputs_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_1_1_out", "role": "default" }} , 
 	{ "name": "net_outputs_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "net_outputs_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "net_outputs_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "net_outputs_0_1_out", "role": "default" }} , 
 	{ "name": "net_outputs_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "net_outputs_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1000_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1000_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1000_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1000_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1000_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1000_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1000_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1000_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1004_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1004_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1004_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1004_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1004_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1004_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1004_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1004_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "backprop_Pipeline_soft_max_loop2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28", "EstimateLatencyMax" : "28",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "net_outputs_2_06", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_1_05", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_0_04", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_0_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_2_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "net_outputs_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "net_outputs_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "net_outputs_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "soft_max_loop2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter24", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter24", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U86", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop_Pipeline_soft_max_loop2 {
		net_outputs_2_06 {Type I LastRead 0 FirstWrite -1}
		net_outputs_1_05 {Type I LastRead 0 FirstWrite -1}
		net_outputs_0_04 {Type I LastRead 0 FirstWrite -1}
		activations3_0_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_1_4_reload {Type I LastRead 0 FirstWrite -1}
		activations3_2_4_reload {Type I LastRead 0 FirstWrite -1}
		sum_reload {Type I LastRead 0 FirstWrite -1}
		net_outputs_2_1_out {Type O LastRead -1 FirstWrite 23}
		net_outputs_1_1_out {Type O LastRead -1 FirstWrite 23}
		net_outputs_0_1_out {Type O LastRead -1 FirstWrite 23}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "28", "Max" : "28"}
	, {"Name" : "Interval", "Min" : "28", "Max" : "28"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	net_outputs_2_06 { ap_none {  { net_outputs_2_06 in_data 0 64 } } }
	net_outputs_1_05 { ap_none {  { net_outputs_1_05 in_data 0 64 } } }
	net_outputs_0_04 { ap_none {  { net_outputs_0_04 in_data 0 64 } } }
	activations3_0_4_reload { ap_none {  { activations3_0_4_reload in_data 0 64 } } }
	activations3_1_4_reload { ap_none {  { activations3_1_4_reload in_data 0 64 } } }
	activations3_2_4_reload { ap_none {  { activations3_2_4_reload in_data 0 64 } } }
	sum_reload { ap_none {  { sum_reload in_data 0 64 } } }
	net_outputs_2_1_out { ap_vld {  { net_outputs_2_1_out out_data 1 64 }  { net_outputs_2_1_out_ap_vld out_vld 1 1 } } }
	net_outputs_1_1_out { ap_vld {  { net_outputs_1_1_out out_data 1 64 }  { net_outputs_1_1_out_ap_vld out_vld 1 1 } } }
	net_outputs_0_1_out { ap_vld {  { net_outputs_0_1_out out_data 1 64 }  { net_outputs_0_1_out_ap_vld out_vld 1 1 } } }
}
