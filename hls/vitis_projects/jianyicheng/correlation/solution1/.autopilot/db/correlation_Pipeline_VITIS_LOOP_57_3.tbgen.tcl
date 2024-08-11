set moduleName correlation_Pipeline_VITIS_LOOP_57_3
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
set C_modelName {correlation_Pipeline_VITIS_LOOP_57_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ indvars_iv17 int 6 regular  }
	{ data int 32 regular {array 1024 { 1 1 } 1 1 }  }
	{ bitcast_ln61 float 32 regular  }
	{ i_1 int 5 regular  }
	{ ii int 10 regular  }
	{ corr int 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indvars_iv17", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bitcast_ln61", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "i_1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "ii", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "corr", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ indvars_iv17 sc_in sc_lv 6 signal 0 } 
	{ data_address0 sc_out sc_lv 10 signal 1 } 
	{ data_ce0 sc_out sc_logic 1 signal 1 } 
	{ data_q0 sc_in sc_lv 32 signal 1 } 
	{ data_address1 sc_out sc_lv 10 signal 1 } 
	{ data_ce1 sc_out sc_logic 1 signal 1 } 
	{ data_q1 sc_in sc_lv 32 signal 1 } 
	{ bitcast_ln61 sc_in sc_lv 32 signal 2 } 
	{ i_1 sc_in sc_lv 5 signal 3 } 
	{ ii sc_in sc_lv 10 signal 4 } 
	{ corr_address0 sc_out sc_lv 10 signal 5 } 
	{ corr_ce0 sc_out sc_logic 1 signal 5 } 
	{ corr_we0 sc_out sc_logic 1 signal 5 } 
	{ corr_d0 sc_out sc_lv 32 signal 5 } 
	{ grp_fu_296_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_296_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_296_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_296_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_296_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_300_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_300_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_300_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_300_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "indvars_iv17", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "indvars_iv17", "role": "default" }} , 
 	{ "name": "data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address0" }} , 
 	{ "name": "data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce0" }} , 
 	{ "name": "data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q0" }} , 
 	{ "name": "data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address1" }} , 
 	{ "name": "data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce1" }} , 
 	{ "name": "data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q1" }} , 
 	{ "name": "bitcast_ln61", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitcast_ln61", "role": "default" }} , 
 	{ "name": "i_1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "i_1", "role": "default" }} , 
 	{ "name": "ii", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "ii", "role": "default" }} , 
 	{ "name": "corr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "corr", "role": "address0" }} , 
 	{ "name": "corr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "corr", "role": "ce0" }} , 
 	{ "name": "corr_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "corr", "role": "we0" }} , 
 	{ "name": "corr_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "corr", "role": "d0" }} , 
 	{ "name": "grp_fu_296_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_296_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_296_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_296_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_296_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_296_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_296_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_296_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_296_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_296_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_300_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_300_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_300_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_300_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_300_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_300_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_300_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_300_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "correlation_Pipeline_VITIS_LOOP_57_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "169", "EstimateLatencyMax" : "1129",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indvars_iv17", "Type" : "None", "Direction" : "I"},
			{"Name" : "data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bitcast_ln61", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "ii", "Type" : "None", "Direction" : "I"},
			{"Name" : "corr", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_57_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage7", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage7_subdone", "QuitState" : "ap_ST_fsm_pp0_stage7", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage7_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	correlation_Pipeline_VITIS_LOOP_57_3 {
		indvars_iv17 {Type I LastRead 0 FirstWrite -1}
		data {Type I LastRead 32 FirstWrite -1}
		bitcast_ln61 {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		ii {Type I LastRead 0 FirstWrite -1}
		corr {Type O LastRead -1 FirstWrite 166}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "169", "Max" : "1129"}
	, {"Name" : "Interval", "Min" : "169", "Max" : "1129"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	indvars_iv17 { ap_none {  { indvars_iv17 in_data 0 6 } } }
	data { ap_memory {  { data_address0 mem_address 1 10 }  { data_ce0 mem_ce 1 1 }  { data_q0 mem_dout 0 32 }  { data_address1 MemPortADDR2 1 10 }  { data_ce1 MemPortCE2 1 1 }  { data_q1 MemPortDOUT2 0 32 } } }
	bitcast_ln61 { ap_none {  { bitcast_ln61 in_data 0 32 } } }
	i_1 { ap_none {  { i_1 in_data 0 5 } } }
	ii { ap_none {  { ii in_data 0 10 } } }
	corr { ap_memory {  { corr_address0 mem_address 1 10 }  { corr_ce0 mem_ce 1 1 }  { corr_we0 mem_we 1 1 }  { corr_d0 mem_din 1 32 } } }
}
