set moduleName main_Pipeline_VITIS_LOOP_31_1
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
set C_modelName {main_Pipeline_VITIS_LOOP_31_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ A double 64 regular {array 1000 { 0 3 } 0 1 }  }
	{ gold double 64 regular {array 1000 { 0 3 } 0 1 }  }
	{ addr_out int 10 regular {array 1000 { 0 3 } 0 1 }  }
	{ addr_in int 10 regular {array 1000 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gold", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "addr_out", "interface" : "memory", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "addr_in", "interface" : "memory", "bitwidth" : 10, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 10 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_we0 sc_out sc_logic 1 signal 0 } 
	{ A_d0 sc_out sc_lv 64 signal 0 } 
	{ gold_address0 sc_out sc_lv 10 signal 1 } 
	{ gold_ce0 sc_out sc_logic 1 signal 1 } 
	{ gold_we0 sc_out sc_logic 1 signal 1 } 
	{ gold_d0 sc_out sc_lv 64 signal 1 } 
	{ addr_out_address0 sc_out sc_lv 10 signal 2 } 
	{ addr_out_ce0 sc_out sc_logic 1 signal 2 } 
	{ addr_out_we0 sc_out sc_logic 1 signal 2 } 
	{ addr_out_d0 sc_out sc_lv 10 signal 2 } 
	{ addr_in_address0 sc_out sc_lv 10 signal 3 } 
	{ addr_in_ce0 sc_out sc_logic 1 signal 3 } 
	{ addr_in_we0 sc_out sc_logic 1 signal 3 } 
	{ addr_in_d0 sc_out sc_lv 10 signal 3 } 
	{ grp_fu_102_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_102_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_102_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_102_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_102_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_106_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_106_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_106_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_106_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "gold_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gold", "role": "address0" }} , 
 	{ "name": "gold_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "ce0" }} , 
 	{ "name": "gold_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "we0" }} , 
 	{ "name": "gold_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gold", "role": "d0" }} , 
 	{ "name": "addr_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "address0" }} , 
 	{ "name": "addr_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_out", "role": "ce0" }} , 
 	{ "name": "addr_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_out", "role": "we0" }} , 
 	{ "name": "addr_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_out", "role": "d0" }} , 
 	{ "name": "addr_in_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "address0" }} , 
 	{ "name": "addr_in_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_in", "role": "ce0" }} , 
 	{ "name": "addr_in_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "addr_in", "role": "we0" }} , 
 	{ "name": "addr_in_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "addr_in", "role": "d0" }} , 
 	{ "name": "grp_fu_102_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_102_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_102_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_102_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_106_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_106_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_31_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2098", "EstimateLatencyMax" : "2098",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "gold", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "addr_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "addr_in", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_31_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter49", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter49", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_59_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitodp_32ns_64_7_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_31_1 {
		A {Type O LastRead -1 FirstWrite 99}
		gold {Type O LastRead -1 FirstWrite 99}
		addr_out {Type O LastRead -1 FirstWrite 2}
		addr_in {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2098", "Max" : "2098"}
	, {"Name" : "Interval", "Min" : "2098", "Max" : "2098"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 64 } } }
	gold { ap_memory {  { gold_address0 mem_address 1 10 }  { gold_ce0 mem_ce 1 1 }  { gold_we0 mem_we 1 1 }  { gold_d0 mem_din 1 64 } } }
	addr_out { ap_memory {  { addr_out_address0 mem_address 1 10 }  { addr_out_ce0 mem_ce 1 1 }  { addr_out_we0 mem_we 1 1 }  { addr_out_d0 mem_din 1 10 } } }
	addr_in { ap_memory {  { addr_in_address0 mem_address 1 10 }  { addr_in_ce0 mem_ce 1 1 }  { addr_in_we0 mem_we 1 1 }  { addr_in_d0 mem_din 1 10 } } }
}