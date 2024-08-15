set moduleName main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2
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
set C_modelName {main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ A float 32 regular {array 65536 { 0 3 } 0 1 }  }
	{ A_s float 32 regular {array 65536 { 0 3 } 0 1 }  }
	{ u1 float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ v1 float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ u2 float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ v2 float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ w float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ x float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ w_s float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ x_s float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ y float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ z float 32 regular {array 256 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "A_s", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "u1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "u2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "w", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "w_s", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "x_s", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "z", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 54
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 16 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_we0 sc_out sc_logic 1 signal 0 } 
	{ A_d0 sc_out sc_lv 32 signal 0 } 
	{ A_s_address0 sc_out sc_lv 16 signal 1 } 
	{ A_s_ce0 sc_out sc_logic 1 signal 1 } 
	{ A_s_we0 sc_out sc_logic 1 signal 1 } 
	{ A_s_d0 sc_out sc_lv 32 signal 1 } 
	{ u1_address0 sc_out sc_lv 8 signal 2 } 
	{ u1_ce0 sc_out sc_logic 1 signal 2 } 
	{ u1_we0 sc_out sc_logic 1 signal 2 } 
	{ u1_d0 sc_out sc_lv 32 signal 2 } 
	{ v1_address0 sc_out sc_lv 8 signal 3 } 
	{ v1_ce0 sc_out sc_logic 1 signal 3 } 
	{ v1_we0 sc_out sc_logic 1 signal 3 } 
	{ v1_d0 sc_out sc_lv 32 signal 3 } 
	{ u2_address0 sc_out sc_lv 8 signal 4 } 
	{ u2_ce0 sc_out sc_logic 1 signal 4 } 
	{ u2_we0 sc_out sc_logic 1 signal 4 } 
	{ u2_d0 sc_out sc_lv 32 signal 4 } 
	{ v2_address0 sc_out sc_lv 8 signal 5 } 
	{ v2_ce0 sc_out sc_logic 1 signal 5 } 
	{ v2_we0 sc_out sc_logic 1 signal 5 } 
	{ v2_d0 sc_out sc_lv 32 signal 5 } 
	{ w_address0 sc_out sc_lv 8 signal 6 } 
	{ w_ce0 sc_out sc_logic 1 signal 6 } 
	{ w_we0 sc_out sc_logic 1 signal 6 } 
	{ w_d0 sc_out sc_lv 32 signal 6 } 
	{ x_address0 sc_out sc_lv 8 signal 7 } 
	{ x_ce0 sc_out sc_logic 1 signal 7 } 
	{ x_we0 sc_out sc_logic 1 signal 7 } 
	{ x_d0 sc_out sc_lv 32 signal 7 } 
	{ w_s_address0 sc_out sc_lv 8 signal 8 } 
	{ w_s_ce0 sc_out sc_logic 1 signal 8 } 
	{ w_s_we0 sc_out sc_logic 1 signal 8 } 
	{ w_s_d0 sc_out sc_lv 32 signal 8 } 
	{ x_s_address0 sc_out sc_lv 8 signal 9 } 
	{ x_s_ce0 sc_out sc_logic 1 signal 9 } 
	{ x_s_we0 sc_out sc_logic 1 signal 9 } 
	{ x_s_d0 sc_out sc_lv 32 signal 9 } 
	{ y_address0 sc_out sc_lv 8 signal 10 } 
	{ y_ce0 sc_out sc_logic 1 signal 10 } 
	{ y_we0 sc_out sc_logic 1 signal 10 } 
	{ y_d0 sc_out sc_lv 32 signal 10 } 
	{ z_address0 sc_out sc_lv 8 signal 11 } 
	{ z_ce0 sc_out sc_logic 1 signal 11 } 
	{ z_we0 sc_out sc_logic 1 signal 11 } 
	{ z_d0 sc_out sc_lv 32 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "A_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A_s", "role": "address0" }} , 
 	{ "name": "A_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce0" }} , 
 	{ "name": "A_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "we0" }} , 
 	{ "name": "A_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "d0" }} , 
 	{ "name": "u1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u1", "role": "address0" }} , 
 	{ "name": "u1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u1", "role": "ce0" }} , 
 	{ "name": "u1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u1", "role": "we0" }} , 
 	{ "name": "u1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u1", "role": "d0" }} , 
 	{ "name": "v1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v1", "role": "address0" }} , 
 	{ "name": "v1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v1", "role": "ce0" }} , 
 	{ "name": "v1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v1", "role": "we0" }} , 
 	{ "name": "v1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v1", "role": "d0" }} , 
 	{ "name": "u2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u2", "role": "address0" }} , 
 	{ "name": "u2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u2", "role": "ce0" }} , 
 	{ "name": "u2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u2", "role": "we0" }} , 
 	{ "name": "u2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u2", "role": "d0" }} , 
 	{ "name": "v2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v2", "role": "address0" }} , 
 	{ "name": "v2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v2", "role": "ce0" }} , 
 	{ "name": "v2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v2", "role": "we0" }} , 
 	{ "name": "v2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v2", "role": "d0" }} , 
 	{ "name": "w_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "w", "role": "address0" }} , 
 	{ "name": "w_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "ce0" }} , 
 	{ "name": "w_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "we0" }} , 
 	{ "name": "w_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w", "role": "d0" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "we0" }} , 
 	{ "name": "x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "d0" }} , 
 	{ "name": "w_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "w_s", "role": "address0" }} , 
 	{ "name": "w_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_s", "role": "ce0" }} , 
 	{ "name": "w_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w_s", "role": "we0" }} , 
 	{ "name": "w_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w_s", "role": "d0" }} , 
 	{ "name": "x_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_s", "role": "address0" }} , 
 	{ "name": "x_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_s", "role": "ce0" }} , 
 	{ "name": "x_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_s", "role": "we0" }} , 
 	{ "name": "x_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_s", "role": "d0" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "we0" }} , 
 	{ "name": "y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "d0" }} , 
 	{ "name": "z_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "z", "role": "address0" }} , 
 	{ "name": "z_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "z", "role": "ce0" }} , 
 	{ "name": "z_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "z", "role": "we0" }} , 
 	{ "name": "z_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "z", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131074", "EstimateLatencyMax" : "131074",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "A_s", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "u1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "v1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "u2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "v2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "w", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "w_s", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "x_s", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "z", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_56_1_VITIS_LOOP_67_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2 {
		A {Type O LastRead -1 FirstWrite 3}
		A_s {Type O LastRead -1 FirstWrite 3}
		u1 {Type O LastRead -1 FirstWrite 2}
		v1 {Type O LastRead -1 FirstWrite 2}
		u2 {Type O LastRead -1 FirstWrite 2}
		v2 {Type O LastRead -1 FirstWrite 2}
		w {Type O LastRead -1 FirstWrite 2}
		x {Type O LastRead -1 FirstWrite 2}
		w_s {Type O LastRead -1 FirstWrite 2}
		x_s {Type O LastRead -1 FirstWrite 2}
		y {Type O LastRead -1 FirstWrite 2}
		z {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "131074", "Max" : "131074"}
	, {"Name" : "Interval", "Min" : "131074", "Max" : "131074"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 16 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 } } }
	A_s { ap_memory {  { A_s_address0 mem_address 1 16 }  { A_s_ce0 mem_ce 1 1 }  { A_s_we0 mem_we 1 1 }  { A_s_d0 mem_din 1 32 } } }
	u1 { ap_memory {  { u1_address0 mem_address 1 8 }  { u1_ce0 mem_ce 1 1 }  { u1_we0 mem_we 1 1 }  { u1_d0 mem_din 1 32 } } }
	v1 { ap_memory {  { v1_address0 mem_address 1 8 }  { v1_ce0 mem_ce 1 1 }  { v1_we0 mem_we 1 1 }  { v1_d0 mem_din 1 32 } } }
	u2 { ap_memory {  { u2_address0 mem_address 1 8 }  { u2_ce0 mem_ce 1 1 }  { u2_we0 mem_we 1 1 }  { u2_d0 mem_din 1 32 } } }
	v2 { ap_memory {  { v2_address0 mem_address 1 8 }  { v2_ce0 mem_ce 1 1 }  { v2_we0 mem_we 1 1 }  { v2_d0 mem_din 1 32 } } }
	w { ap_memory {  { w_address0 mem_address 1 8 }  { w_ce0 mem_ce 1 1 }  { w_we0 mem_we 1 1 }  { w_d0 mem_din 1 32 } } }
	x { ap_memory {  { x_address0 mem_address 1 8 }  { x_ce0 mem_ce 1 1 }  { x_we0 mem_we 1 1 }  { x_d0 mem_din 1 32 } } }
	w_s { ap_memory {  { w_s_address0 mem_address 1 8 }  { w_s_ce0 mem_ce 1 1 }  { w_s_we0 mem_we 1 1 }  { w_s_d0 mem_din 1 32 } } }
	x_s { ap_memory {  { x_s_address0 mem_address 1 8 }  { x_s_ce0 mem_ce 1 1 }  { x_s_we0 mem_we 1 1 }  { x_s_d0 mem_din 1 32 } } }
	y { ap_memory {  { y_address0 mem_address 1 8 }  { y_ce0 mem_ce 1 1 }  { y_we0 mem_we 1 1 }  { y_d0 mem_din 1 32 } } }
	z { ap_memory {  { z_address0 mem_address 1 8 }  { z_ce0 mem_ce 1 1 }  { z_we0 mem_we 1 1 }  { z_d0 mem_din 1 32 } } }
}
