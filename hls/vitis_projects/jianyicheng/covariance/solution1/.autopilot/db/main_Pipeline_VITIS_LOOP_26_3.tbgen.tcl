set moduleName main_Pipeline_VITIS_LOOP_26_3
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
set C_modelName {main_Pipeline_VITIS_LOOP_26_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ i_5 int 5 regular  }
	{ jj_2 int 11 regular  }
	{ data float 32 regular {array 1024 { 1 1 } 1 1 }  }
	{ data_load_32 float 32 regular  }
	{ zext_ln24_2 int 5 regular  }
	{ zext_ln24_3 int 5 regular  }
	{ zext_ln24_1 int 5 regular  }
	{ empty int 10 regular  }
	{ cov float 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "i_5", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "jj_2", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "data_load_32", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln24_2", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln24_3", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln24_1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "cov", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ i_5 sc_in sc_lv 5 signal 0 } 
	{ jj_2 sc_in sc_lv 11 signal 1 } 
	{ data_address0 sc_out sc_lv 10 signal 2 } 
	{ data_ce0 sc_out sc_logic 1 signal 2 } 
	{ data_q0 sc_in sc_lv 32 signal 2 } 
	{ data_address1 sc_out sc_lv 10 signal 2 } 
	{ data_ce1 sc_out sc_logic 1 signal 2 } 
	{ data_q1 sc_in sc_lv 32 signal 2 } 
	{ data_load_32 sc_in sc_lv 32 signal 3 } 
	{ zext_ln24_2 sc_in sc_lv 5 signal 4 } 
	{ zext_ln24_3 sc_in sc_lv 5 signal 5 } 
	{ zext_ln24_1 sc_in sc_lv 5 signal 6 } 
	{ empty sc_in sc_lv 10 signal 7 } 
	{ cov_address0 sc_out sc_lv 10 signal 8 } 
	{ cov_ce0 sc_out sc_logic 1 signal 8 } 
	{ cov_we0 sc_out sc_logic 1 signal 8 } 
	{ cov_d0 sc_out sc_lv 32 signal 8 } 
	{ grp_fu_365_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_365_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_365_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_365_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_365_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_497_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_497_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_497_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_497_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_493_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_493_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_493_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_493_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "i_5", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "i_5", "role": "default" }} , 
 	{ "name": "jj_2", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "jj_2", "role": "default" }} , 
 	{ "name": "data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address0" }} , 
 	{ "name": "data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce0" }} , 
 	{ "name": "data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q0" }} , 
 	{ "name": "data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address1" }} , 
 	{ "name": "data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce1" }} , 
 	{ "name": "data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q1" }} , 
 	{ "name": "data_load_32", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_load_32", "role": "default" }} , 
 	{ "name": "zext_ln24_2", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln24_2", "role": "default" }} , 
 	{ "name": "zext_ln24_3", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln24_3", "role": "default" }} , 
 	{ "name": "zext_ln24_1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln24_1", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "cov_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "cov", "role": "address0" }} , 
 	{ "name": "cov_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cov", "role": "ce0" }} , 
 	{ "name": "cov_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cov", "role": "we0" }} , 
 	{ "name": "cov_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cov", "role": "d0" }} , 
 	{ "name": "grp_fu_365_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_365_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_365_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_497_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_497_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_497_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_497_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_497_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_497_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_497_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_497_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_493_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_26_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "364", "EstimateLatencyMax" : "1356",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "i_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "jj_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_load_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln24_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln24_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln24_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "cov", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_26_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_26_3 {
		i_5 {Type I LastRead 0 FirstWrite -1}
		jj_2 {Type I LastRead 0 FirstWrite -1}
		data {Type I LastRead 32 FirstWrite -1}
		data_load_32 {Type I LastRead 0 FirstWrite -1}
		zext_ln24_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln24_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln24_1 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		cov {Type O LastRead -1 FirstWrite 361}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "364", "Max" : "1356"}
	, {"Name" : "Interval", "Min" : "364", "Max" : "1356"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	i_5 { ap_none {  { i_5 in_data 0 5 } } }
	jj_2 { ap_none {  { jj_2 in_data 0 11 } } }
	data { ap_memory {  { data_address0 mem_address 1 10 }  { data_ce0 mem_ce 1 1 }  { data_q0 mem_dout 0 32 }  { data_address1 MemPortADDR2 1 10 }  { data_ce1 MemPortCE2 1 1 }  { data_q1 MemPortDOUT2 0 32 } } }
	data_load_32 { ap_none {  { data_load_32 in_data 0 32 } } }
	zext_ln24_2 { ap_none {  { zext_ln24_2 in_data 0 5 } } }
	zext_ln24_3 { ap_none {  { zext_ln24_3 in_data 0 5 } } }
	zext_ln24_1 { ap_none {  { zext_ln24_1 in_data 0 5 } } }
	empty { ap_none {  { empty in_data 0 10 } } }
	cov { ap_memory {  { cov_address0 mem_address 1 10 }  { cov_ce0 mem_ce 1 1 }  { cov_we0 mem_we 1 1 }  { cov_d0 mem_din 1 32 } } }
}