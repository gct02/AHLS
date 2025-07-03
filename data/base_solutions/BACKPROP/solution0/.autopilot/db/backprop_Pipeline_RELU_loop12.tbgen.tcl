set moduleName backprop_Pipeline_RELU_loop12
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
set C_modelName {backprop_Pipeline_RELU_loop12}
set C_modelType { void 0 }
set C_modelArgList {
	{ activations3_2 double 64 regular  }
	{ activations3_1 double 64 regular  }
	{ activations3_0 double 64 regular  }
	{ dactivations3_2_03 double 64 regular  }
	{ dactivations3_1_02 double 64 regular  }
	{ dactivations3_0_01 double 64 regular  }
	{ activations3_2_4_out double 64 regular {pointer 1}  }
	{ activations3_1_4_out double 64 regular {pointer 1}  }
	{ activations3_0_4_out double 64 regular {pointer 1}  }
	{ dactivations3_2_1_out double 64 regular {pointer 1}  }
	{ dactivations3_1_1_out double 64 regular {pointer 1}  }
	{ dactivations3_0_1_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "activations3_2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_2_03", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_1_02", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "dactivations3_0_01", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activations3_2_4_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations3_1_4_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activations3_0_4_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dactivations3_2_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dactivations3_1_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dactivations3_0_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 41
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ activations3_2 sc_in sc_lv 64 signal 0 } 
	{ activations3_1 sc_in sc_lv 64 signal 1 } 
	{ activations3_0 sc_in sc_lv 64 signal 2 } 
	{ dactivations3_2_03 sc_in sc_lv 64 signal 3 } 
	{ dactivations3_1_02 sc_in sc_lv 64 signal 4 } 
	{ dactivations3_0_01 sc_in sc_lv 64 signal 5 } 
	{ activations3_2_4_out sc_out sc_lv 64 signal 6 } 
	{ activations3_2_4_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ activations3_1_4_out sc_out sc_lv 64 signal 7 } 
	{ activations3_1_4_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ activations3_0_4_out sc_out sc_lv 64 signal 8 } 
	{ activations3_0_4_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ dactivations3_2_1_out sc_out sc_lv 64 signal 9 } 
	{ dactivations3_2_1_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ dactivations3_1_1_out sc_out sc_lv 64 signal 10 } 
	{ dactivations3_1_1_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ dactivations3_0_1_out sc_out sc_lv 64 signal 11 } 
	{ dactivations3_0_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ grp_fu_988_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_988_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_988_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_988_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_988_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_992_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_992_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_992_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_992_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "activations3_2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_2", "role": "default" }} , 
 	{ "name": "activations3_1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_1", "role": "default" }} , 
 	{ "name": "activations3_0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_0", "role": "default" }} , 
 	{ "name": "dactivations3_2_03", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_2_03", "role": "default" }} , 
 	{ "name": "dactivations3_1_02", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_1_02", "role": "default" }} , 
 	{ "name": "dactivations3_0_01", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_0_01", "role": "default" }} , 
 	{ "name": "activations3_2_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_2_4_out", "role": "default" }} , 
 	{ "name": "activations3_2_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_2_4_out", "role": "ap_vld" }} , 
 	{ "name": "activations3_1_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_1_4_out", "role": "default" }} , 
 	{ "name": "activations3_1_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_1_4_out", "role": "ap_vld" }} , 
 	{ "name": "activations3_0_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations3_0_4_out", "role": "default" }} , 
 	{ "name": "activations3_0_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "activations3_0_4_out", "role": "ap_vld" }} , 
 	{ "name": "dactivations3_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_2_1_out", "role": "default" }} , 
 	{ "name": "dactivations3_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dactivations3_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "dactivations3_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_1_1_out", "role": "default" }} , 
 	{ "name": "dactivations3_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dactivations3_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "dactivations3_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "dactivations3_0_1_out", "role": "default" }} , 
 	{ "name": "dactivations3_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dactivations3_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_988_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_988_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_988_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_988_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_988_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_992_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_992_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_992_p_ce", "role": "default" }} , 
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
		"CDFG" : "backprop_Pipeline_RELU_loop12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations3_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_2_03", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_1_02", "Type" : "None", "Direction" : "I"},
			{"Name" : "dactivations3_0_01", "Type" : "None", "Direction" : "I"},
			{"Name" : "activations3_2_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_1_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "activations3_0_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dactivations3_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "RELU_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "29", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U64", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	backprop_Pipeline_RELU_loop12 {
		activations3_2 {Type I LastRead 0 FirstWrite -1}
		activations3_1 {Type I LastRead 0 FirstWrite -1}
		activations3_0 {Type I LastRead 0 FirstWrite -1}
		dactivations3_2_03 {Type I LastRead 0 FirstWrite -1}
		dactivations3_1_02 {Type I LastRead 0 FirstWrite -1}
		dactivations3_0_01 {Type I LastRead 0 FirstWrite -1}
		activations3_2_4_out {Type O LastRead -1 FirstWrite 1}
		activations3_1_4_out {Type O LastRead -1 FirstWrite 1}
		activations3_0_4_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_2_1_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_1_1_out {Type O LastRead -1 FirstWrite 1}
		dactivations3_0_1_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "89", "Max" : "89"}
	, {"Name" : "Interval", "Min" : "89", "Max" : "89"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	activations3_2 { ap_none {  { activations3_2 in_data 0 64 } } }
	activations3_1 { ap_none {  { activations3_1 in_data 0 64 } } }
	activations3_0 { ap_none {  { activations3_0 in_data 0 64 } } }
	dactivations3_2_03 { ap_none {  { dactivations3_2_03 in_data 0 64 } } }
	dactivations3_1_02 { ap_none {  { dactivations3_1_02 in_data 0 64 } } }
	dactivations3_0_01 { ap_none {  { dactivations3_0_01 in_data 0 64 } } }
	activations3_2_4_out { ap_vld {  { activations3_2_4_out out_data 1 64 }  { activations3_2_4_out_ap_vld out_vld 1 1 } } }
	activations3_1_4_out { ap_vld {  { activations3_1_4_out out_data 1 64 }  { activations3_1_4_out_ap_vld out_vld 1 1 } } }
	activations3_0_4_out { ap_vld {  { activations3_0_4_out out_data 1 64 }  { activations3_0_4_out_ap_vld out_vld 1 1 } } }
	dactivations3_2_1_out { ap_vld {  { dactivations3_2_1_out out_data 1 64 }  { dactivations3_2_1_out_ap_vld out_vld 1 1 } } }
	dactivations3_1_1_out { ap_vld {  { dactivations3_1_1_out out_data 1 64 }  { dactivations3_1_1_out_ap_vld out_vld 1 1 } } }
	dactivations3_0_1_out { ap_vld {  { dactivations3_0_1_out out_data 1 64 }  { dactivations3_0_1_out_ap_vld out_vld 1 1 } } }
}
