set moduleName matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l
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
set C_modelName {matrix_vector_product_with_bias_input_layer.1_Pipeline_add_bias_to_activations_l}
set C_modelType { void 0 }
set C_modelArgList {
	{ activations double 64 regular {array 64 { 0 1 } 1 1 }  }
	{ biases1 int 64 regular {array 64 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "activations", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ activations_address0 sc_out sc_lv 6 signal 0 } 
	{ activations_ce0 sc_out sc_logic 1 signal 0 } 
	{ activations_we0 sc_out sc_logic 1 signal 0 } 
	{ activations_d0 sc_out sc_lv 64 signal 0 } 
	{ activations_address1 sc_out sc_lv 6 signal 0 } 
	{ activations_ce1 sc_out sc_logic 1 signal 0 } 
	{ activations_q1 sc_in sc_lv 64 signal 0 } 
	{ biases1_address0 sc_out sc_lv 6 signal 1 } 
	{ biases1_ce0 sc_out sc_logic 1 signal 1 } 
	{ biases1_q0 sc_in sc_lv 64 signal 1 } 
	{ grp_fu_142_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_142_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_142_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_142_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_142_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "activations_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "activations", "role": "address0" }} , 
 	{ "name": "activations_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations", "role": "ce0" }} , 
 	{ "name": "activations_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations", "role": "we0" }} , 
 	{ "name": "activations_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations", "role": "d0" }} , 
 	{ "name": "activations_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "activations", "role": "address1" }} , 
 	{ "name": "activations_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activations", "role": "ce1" }} , 
 	{ "name": "activations_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "activations", "role": "q1" }} , 
 	{ "name": "biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases1", "role": "address0" }} , 
 	{ "name": "biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "ce0" }} , 
 	{ "name": "biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "q0" }} , 
 	{ "name": "grp_fu_142_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_142_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_142_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "69", "EstimateLatencyMax" : "69",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "activations", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "add_bias_to_activations_loop1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l {
		activations {Type IO LastRead 0 FirstWrite 4}
		biases1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "69", "Max" : "69"}
	, {"Name" : "Interval", "Min" : "69", "Max" : "69"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	activations { ap_memory {  { activations_address0 mem_address 1 6 }  { activations_ce0 mem_ce 1 1 }  { activations_we0 mem_we 1 1 }  { activations_d0 mem_din 1 64 }  { activations_address1 MemPortADDR2 1 6 }  { activations_ce1 MemPortCE2 1 1 }  { activations_q1 in_data 0 64 } } }
	biases1 { ap_memory {  { biases1_address0 mem_address 1 6 }  { biases1_ce0 mem_ce 1 1 }  { biases1_q0 in_data 0 64 } } }
}
