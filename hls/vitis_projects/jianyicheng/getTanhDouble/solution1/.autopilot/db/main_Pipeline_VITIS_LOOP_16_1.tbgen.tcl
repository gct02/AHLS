set moduleName main_Pipeline_VITIS_LOOP_16_1
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
set C_modelName {main_Pipeline_VITIS_LOOP_16_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ addr_in int 10 regular {array 1000 { 1 3 } 1 1 }  }
	{ gold double 64 regular {array 1000 { 2 3 } 1 1 }  }
	{ addr_out int 10 regular {array 1000 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "addr_in", "interface" : "memory", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "gold", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "addr_out", "interface" : "memory", "bitwidth" : 10, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ addr_in_address0 sc_out sc_lv 10 signal 0 } 
	{ addr_in_ce0 sc_out sc_logic 1 signal 0 } 
	{ addr_in_q0 sc_in sc_lv 10 signal 0 } 
	{ gold_address0 sc_out sc_lv 10 signal 1 } 
	{ gold_ce0 sc_out sc_logic 1 signal 1 } 
	{ gold_we0 sc_out sc_logic 1 signal 1 } 
	{ gold_d0 sc_out sc_lv 64 signal 1 } 
	{ gold_q0 sc_in sc_lv 64 signal 1 } 
	{ addr_out_address0 sc_out sc_lv 10 signal 2 } 
	{ addr_out_ce0 sc_out sc_logic 1 signal 2 } 
	{ addr_out_q0 sc_in sc_lv 10 signal 2 } 
	{ grp_fu_102_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_102_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_102_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_102_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_102_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_106_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_106_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_106_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_106_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_110_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_110_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_110_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_110_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_110_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "addr_in_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "address0" }} , 
 	{ "name": "addr_in_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_in", "role": "ce0" }} , 
 	{ "name": "addr_in_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "q0" }} , 
 	{ "name": "gold_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gold", "role": "address0" }} , 
 	{ "name": "gold_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "ce0" }} , 
 	{ "name": "gold_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "we0" }} , 
 	{ "name": "gold_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gold", "role": "d0" }} , 
 	{ "name": "gold_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gold", "role": "q0" }} , 
 	{ "name": "addr_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "address0" }} , 
 	{ "name": "addr_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_out", "role": "ce0" }} , 
 	{ "name": "addr_out_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "q0" }} , 
 	{ "name": "grp_fu_102_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_102_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_102_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_106_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_110_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_110_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_110_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_110_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_110_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_110_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_110_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_110_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_110_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_110_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "104006", "EstimateLatencyMax" : "104006",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "addr_in", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "gold", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "addr_out", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_16_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "104", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_16_1 {
		addr_in {Type I LastRead 0 FirstWrite -1}
		gold {Type IO LastRead 2 FirstWrite 108}
		addr_out {Type I LastRead 104 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "104006", "Max" : "104006"}
	, {"Name" : "Interval", "Min" : "104006", "Max" : "104006"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	addr_in { ap_memory {  { addr_in_address0 mem_address 1 10 }  { addr_in_ce0 mem_ce 1 1 }  { addr_in_q0 mem_dout 0 10 } } }
	gold { ap_memory {  { gold_address0 mem_address 1 10 }  { gold_ce0 mem_ce 1 1 }  { gold_we0 mem_we 1 1 }  { gold_d0 mem_din 1 64 }  { gold_q0 mem_dout 0 64 } } }
	addr_out { ap_memory {  { addr_out_address0 mem_address 1 10 }  { addr_out_ce0 mem_ce 1 1 }  { addr_out_q0 mem_dout 0 10 } } }
}
