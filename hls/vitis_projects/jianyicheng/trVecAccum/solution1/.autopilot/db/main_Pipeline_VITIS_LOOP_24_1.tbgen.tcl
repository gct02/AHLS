set moduleName main_Pipeline_VITIS_LOOP_24_1
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
set C_modelName {main_Pipeline_VITIS_LOOP_24_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ array_r float 32 regular {array 65536 { 0 3 } 0 1 }  }
	{ result float 32 regular {array 65536 { 0 3 } 0 1 }  }
	{ gold float 32 regular {array 65536 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "array_r", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gold", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ array_r_address0 sc_out sc_lv 16 signal 0 } 
	{ array_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ array_r_we0 sc_out sc_logic 1 signal 0 } 
	{ array_r_d0 sc_out sc_lv 32 signal 0 } 
	{ result_address0 sc_out sc_lv 16 signal 1 } 
	{ result_ce0 sc_out sc_logic 1 signal 1 } 
	{ result_we0 sc_out sc_logic 1 signal 1 } 
	{ result_d0 sc_out sc_lv 32 signal 1 } 
	{ gold_address0 sc_out sc_lv 16 signal 2 } 
	{ gold_ce0 sc_out sc_logic 1 signal 2 } 
	{ gold_we0 sc_out sc_logic 1 signal 2 } 
	{ gold_d0 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "array_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "array_r", "role": "address0" }} , 
 	{ "name": "array_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_r", "role": "ce0" }} , 
 	{ "name": "array_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_r", "role": "we0" }} , 
 	{ "name": "array_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_r", "role": "d0" }} , 
 	{ "name": "result_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "result", "role": "address0" }} , 
 	{ "name": "result_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "ce0" }} , 
 	{ "name": "result_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "we0" }} , 
 	{ "name": "result_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result", "role": "d0" }} , 
 	{ "name": "gold_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gold", "role": "address0" }} , 
 	{ "name": "gold_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "ce0" }} , 
 	{ "name": "gold_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gold", "role": "we0" }} , 
 	{ "name": "gold_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gold", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_24_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65538", "EstimateLatencyMax" : "65538",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "result", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "gold", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_24_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_24_1 {
		array_r {Type O LastRead -1 FirstWrite 1}
		result {Type O LastRead -1 FirstWrite 1}
		gold {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "65538", "Max" : "65538"}
	, {"Name" : "Interval", "Min" : "65538", "Max" : "65538"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	array_r { ap_memory {  { array_r_address0 mem_address 1 16 }  { array_r_ce0 mem_ce 1 1 }  { array_r_we0 mem_we 1 1 }  { array_r_d0 mem_din 1 32 } } }
	result { ap_memory {  { result_address0 mem_address 1 16 }  { result_ce0 mem_ce 1 1 }  { result_we0 mem_we 1 1 }  { result_d0 mem_din 1 32 } } }
	gold { ap_memory {  { gold_address0 mem_address 1 16 }  { gold_ce0 mem_ce 1 1 }  { gold_we0 mem_we 1 1 }  { gold_d0 mem_din 1 32 } } }
}
