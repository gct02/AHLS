set moduleName main_Pipeline_loop_22
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
set C_modelName {main_Pipeline_loop_22}
set C_modelType { void 0 }
set C_modelArgList {
	{ A_load float 32 regular  }
	{ sum float 32 regular {array 256 { 1 3 } 1 1 }  }
	{ A float 32 regular {array 256 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sum", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_load sc_in sc_lv 32 signal 0 } 
	{ sum_address0 sc_out sc_lv 8 signal 1 } 
	{ sum_ce0 sc_out sc_logic 1 signal 1 } 
	{ sum_q0 sc_in sc_lv 32 signal 1 } 
	{ A_address0 sc_out sc_lv 8 signal 2 } 
	{ A_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_we0 sc_out sc_logic 1 signal 2 } 
	{ A_d0 sc_out sc_lv 32 signal 2 } 
	{ grp_fu_170_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_170_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_170_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_170_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_170_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_174_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_174_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_174_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_174_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_load", "role": "default" }} , 
 	{ "name": "sum_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sum", "role": "address0" }} , 
 	{ "name": "sum_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum", "role": "ce0" }} , 
 	{ "name": "sum_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum", "role": "q0" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "grp_fu_170_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_170_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_170_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_170_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_170_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_170_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_170_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_170_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_170_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_170_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_174_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_174_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_174_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_174_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_174_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_174_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_174_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_174_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_loop_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2580", "EstimateLatencyMax" : "2580",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "10", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_loop_22 {
		A_load {Type I LastRead 0 FirstWrite -1}
		sum {Type I LastRead 0 FirstWrite -1}
		A {Type O LastRead -1 FirstWrite 38}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2580", "Max" : "2580"}
	, {"Name" : "Interval", "Min" : "2580", "Max" : "2580"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A_load { ap_none {  { A_load in_data 0 32 } } }
	sum { ap_memory {  { sum_address0 mem_address 1 8 }  { sum_ce0 mem_ce 1 1 }  { sum_q0 mem_dout 0 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 8 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 } } }
}