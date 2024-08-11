set moduleName levmarq_Pipeline_VITIS_LOOP_19_3
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
set C_modelName {levmarq_Pipeline_VITIS_LOOP_19_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ indvars_iv10 int 32 regular  }
	{ empty int 7 regular  }
	{ g int 32 regular {array 128 { 1 3 } 1 1 }  }
	{ x_s float 32 regular  }
	{ weight float 32 regular  }
	{ tmp_1 int 14 regular  }
	{ h int 32 regular {array 16384 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indvars_iv10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "g", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_s", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weight", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_1", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "h", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ indvars_iv10 sc_in sc_lv 32 signal 0 } 
	{ empty sc_in sc_lv 7 signal 1 } 
	{ g_address0 sc_out sc_lv 7 signal 2 } 
	{ g_ce0 sc_out sc_logic 1 signal 2 } 
	{ g_q0 sc_in sc_lv 32 signal 2 } 
	{ x_s sc_in sc_lv 32 signal 3 } 
	{ weight sc_in sc_lv 32 signal 4 } 
	{ tmp_1 sc_in sc_lv 14 signal 5 } 
	{ h_address0 sc_out sc_lv 14 signal 6 } 
	{ h_ce0 sc_out sc_logic 1 signal 6 } 
	{ h_we0 sc_out sc_logic 1 signal 6 } 
	{ h_d0 sc_out sc_lv 32 signal 6 } 
	{ h_address1 sc_out sc_lv 14 signal 6 } 
	{ h_ce1 sc_out sc_logic 1 signal 6 } 
	{ h_q1 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_222_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_222_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_222_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_222_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_222_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_253_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_253_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_253_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_253_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_258_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_258_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_258_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_258_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "indvars_iv10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "indvars_iv10", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "g_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "g", "role": "address0" }} , 
 	{ "name": "g_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g", "role": "ce0" }} , 
 	{ "name": "g_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "g", "role": "q0" }} , 
 	{ "name": "x_s", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_s", "role": "default" }} , 
 	{ "name": "weight", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weight", "role": "default" }} , 
 	{ "name": "tmp_1", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "tmp_1", "role": "default" }} , 
 	{ "name": "h_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "h", "role": "address0" }} , 
 	{ "name": "h_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce0" }} , 
 	{ "name": "h_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "we0" }} , 
 	{ "name": "h_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h", "role": "d0" }} , 
 	{ "name": "h_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "h", "role": "address1" }} , 
 	{ "name": "h_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce1" }} , 
 	{ "name": "h_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h", "role": "q1" }} , 
 	{ "name": "grp_fu_222_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_222_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_222_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_222_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_222_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_222_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_222_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_222_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_222_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_222_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_253_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_253_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_253_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_253_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_258_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_258_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_258_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_258_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_258_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_258_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_258_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_258_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "levmarq_Pipeline_VITIS_LOOP_19_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "2147483664",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indvars_iv10", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "g", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_s", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_19_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter16", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter16", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	levmarq_Pipeline_VITIS_LOOP_19_3 {
		indvars_iv10 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		g {Type I LastRead 1 FirstWrite -1}
		x_s {Type I LastRead 0 FirstWrite -1}
		weight {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		h {Type IO LastRead 9 FirstWrite 16}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "17", "Max" : "2147483664"}
	, {"Name" : "Interval", "Min" : "17", "Max" : "-2147483632"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	indvars_iv10 { ap_none {  { indvars_iv10 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 7 } } }
	g { ap_memory {  { g_address0 mem_address 1 7 }  { g_ce0 mem_ce 1 1 }  { g_q0 mem_dout 0 32 } } }
	x_s { ap_none {  { x_s in_data 0 32 } } }
	weight { ap_none {  { weight in_data 0 32 } } }
	tmp_1 { ap_none {  { tmp_1 in_data 0 14 } } }
	h { ap_memory {  { h_address0 mem_address 1 14 }  { h_ce0 mem_ce 1 1 }  { h_we0 mem_we 1 1 }  { h_d0 mem_din 1 32 }  { h_address1 MemPortADDR2 1 14 }  { h_ce1 MemPortCE2 1 1 }  { h_q1 MemPortDOUT2 0 32 } } }
}
