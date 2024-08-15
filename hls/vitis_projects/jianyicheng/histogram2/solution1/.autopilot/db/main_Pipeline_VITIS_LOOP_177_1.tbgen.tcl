set moduleName main_Pipeline_VITIS_LOOP_177_1
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
set C_modelName {main_Pipeline_VITIS_LOOP_177_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ array_0 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_1 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_2 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_3 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_4 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_5 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_6 int 7 regular {array 4096 { 0 3 } 0 1 }  }
	{ array_7 int 7 regular {array 4096 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "array_0", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_1", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_2", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_3", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_4", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_5", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_6", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "array_7", "interface" : "memory", "bitwidth" : 7, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ array_0_address0 sc_out sc_lv 12 signal 0 } 
	{ array_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ array_0_we0 sc_out sc_logic 1 signal 0 } 
	{ array_0_d0 sc_out sc_lv 7 signal 0 } 
	{ array_1_address0 sc_out sc_lv 12 signal 1 } 
	{ array_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ array_1_we0 sc_out sc_logic 1 signal 1 } 
	{ array_1_d0 sc_out sc_lv 7 signal 1 } 
	{ array_2_address0 sc_out sc_lv 12 signal 2 } 
	{ array_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ array_2_we0 sc_out sc_logic 1 signal 2 } 
	{ array_2_d0 sc_out sc_lv 7 signal 2 } 
	{ array_3_address0 sc_out sc_lv 12 signal 3 } 
	{ array_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ array_3_we0 sc_out sc_logic 1 signal 3 } 
	{ array_3_d0 sc_out sc_lv 7 signal 3 } 
	{ array_4_address0 sc_out sc_lv 12 signal 4 } 
	{ array_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ array_4_we0 sc_out sc_logic 1 signal 4 } 
	{ array_4_d0 sc_out sc_lv 7 signal 4 } 
	{ array_5_address0 sc_out sc_lv 12 signal 5 } 
	{ array_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ array_5_we0 sc_out sc_logic 1 signal 5 } 
	{ array_5_d0 sc_out sc_lv 7 signal 5 } 
	{ array_6_address0 sc_out sc_lv 12 signal 6 } 
	{ array_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ array_6_we0 sc_out sc_logic 1 signal 6 } 
	{ array_6_d0 sc_out sc_lv 7 signal 6 } 
	{ array_7_address0 sc_out sc_lv 12 signal 7 } 
	{ array_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ array_7_we0 sc_out sc_logic 1 signal 7 } 
	{ array_7_d0 sc_out sc_lv 7 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "array_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_0", "role": "address0" }} , 
 	{ "name": "array_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_0", "role": "ce0" }} , 
 	{ "name": "array_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_0", "role": "we0" }} , 
 	{ "name": "array_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_0", "role": "d0" }} , 
 	{ "name": "array_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_1", "role": "address0" }} , 
 	{ "name": "array_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_1", "role": "ce0" }} , 
 	{ "name": "array_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_1", "role": "we0" }} , 
 	{ "name": "array_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_1", "role": "d0" }} , 
 	{ "name": "array_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_2", "role": "address0" }} , 
 	{ "name": "array_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_2", "role": "ce0" }} , 
 	{ "name": "array_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_2", "role": "we0" }} , 
 	{ "name": "array_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_2", "role": "d0" }} , 
 	{ "name": "array_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_3", "role": "address0" }} , 
 	{ "name": "array_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "ce0" }} , 
 	{ "name": "array_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "we0" }} , 
 	{ "name": "array_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_3", "role": "d0" }} , 
 	{ "name": "array_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_4", "role": "address0" }} , 
 	{ "name": "array_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_4", "role": "ce0" }} , 
 	{ "name": "array_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_4", "role": "we0" }} , 
 	{ "name": "array_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_4", "role": "d0" }} , 
 	{ "name": "array_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_5", "role": "address0" }} , 
 	{ "name": "array_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "ce0" }} , 
 	{ "name": "array_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "we0" }} , 
 	{ "name": "array_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_5", "role": "d0" }} , 
 	{ "name": "array_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_6", "role": "address0" }} , 
 	{ "name": "array_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_6", "role": "ce0" }} , 
 	{ "name": "array_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_6", "role": "we0" }} , 
 	{ "name": "array_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_6", "role": "d0" }} , 
 	{ "name": "array_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "array_7", "role": "address0" }} , 
 	{ "name": "array_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_7", "role": "ce0" }} , 
 	{ "name": "array_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_7", "role": "we0" }} , 
 	{ "name": "array_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "array_7", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_177_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4118", "EstimateLatencyMax" : "4118",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_177_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter21", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter21", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_16ns_8ns_7_20_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_177_1 {
		array_0 {Type O LastRead -1 FirstWrite 21}
		array_1 {Type O LastRead -1 FirstWrite 21}
		array_2 {Type O LastRead -1 FirstWrite 21}
		array_3 {Type O LastRead -1 FirstWrite 21}
		array_4 {Type O LastRead -1 FirstWrite 21}
		array_5 {Type O LastRead -1 FirstWrite 21}
		array_6 {Type O LastRead -1 FirstWrite 21}
		array_7 {Type O LastRead -1 FirstWrite 21}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4118", "Max" : "4118"}
	, {"Name" : "Interval", "Min" : "4118", "Max" : "4118"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	array_0 { ap_memory {  { array_0_address0 mem_address 1 12 }  { array_0_ce0 mem_ce 1 1 }  { array_0_we0 mem_we 1 1 }  { array_0_d0 mem_din 1 7 } } }
	array_1 { ap_memory {  { array_1_address0 mem_address 1 12 }  { array_1_ce0 mem_ce 1 1 }  { array_1_we0 mem_we 1 1 }  { array_1_d0 mem_din 1 7 } } }
	array_2 { ap_memory {  { array_2_address0 mem_address 1 12 }  { array_2_ce0 mem_ce 1 1 }  { array_2_we0 mem_we 1 1 }  { array_2_d0 mem_din 1 7 } } }
	array_3 { ap_memory {  { array_3_address0 mem_address 1 12 }  { array_3_ce0 mem_ce 1 1 }  { array_3_we0 mem_we 1 1 }  { array_3_d0 mem_din 1 7 } } }
	array_4 { ap_memory {  { array_4_address0 mem_address 1 12 }  { array_4_ce0 mem_ce 1 1 }  { array_4_we0 mem_we 1 1 }  { array_4_d0 mem_din 1 7 } } }
	array_5 { ap_memory {  { array_5_address0 mem_address 1 12 }  { array_5_ce0 mem_ce 1 1 }  { array_5_we0 mem_we 1 1 }  { array_5_d0 mem_din 1 7 } } }
	array_6 { ap_memory {  { array_6_address0 mem_address 1 12 }  { array_6_ce0 mem_ce 1 1 }  { array_6_we0 mem_we 1 1 }  { array_6_d0 mem_din 1 7 } } }
	array_7 { ap_memory {  { array_7_address0 mem_address 1 12 }  { array_7_ce0 mem_ce 1 1 }  { array_7_we0 mem_we 1 1 }  { array_7_d0 mem_din 1 7 } } }
}
