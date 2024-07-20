set moduleName rendering_Pipeline_COLORING_FB
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
set C_modelName {rendering_Pipeline_COLORING_FB}
set C_modelType { void 0 }
set C_modelArgList {
	{ pixel_cntr_reload int 32 regular  }
	{ pixels_color int 6 regular {array 500 { 1 3 } 1 1 }  }
	{ pixels_x int 8 regular {array 500 { 1 3 } 1 1 }  }
	{ pixels_y int 8 regular {array 500 { 1 3 } 1 1 }  }
	{ output_r int 8 regular {array 65536 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "pixel_cntr_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pixels_color", "interface" : "memory", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "pixels_x", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pixels_y", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pixel_cntr_reload sc_in sc_lv 32 signal 0 } 
	{ pixels_color_address0 sc_out sc_lv 9 signal 1 } 
	{ pixels_color_ce0 sc_out sc_logic 1 signal 1 } 
	{ pixels_color_q0 sc_in sc_lv 6 signal 1 } 
	{ pixels_x_address0 sc_out sc_lv 9 signal 2 } 
	{ pixels_x_ce0 sc_out sc_logic 1 signal 2 } 
	{ pixels_x_q0 sc_in sc_lv 8 signal 2 } 
	{ pixels_y_address0 sc_out sc_lv 9 signal 3 } 
	{ pixels_y_ce0 sc_out sc_logic 1 signal 3 } 
	{ pixels_y_q0 sc_in sc_lv 8 signal 3 } 
	{ output_r_address0 sc_out sc_lv 16 signal 4 } 
	{ output_r_ce0 sc_out sc_logic 1 signal 4 } 
	{ output_r_we0 sc_out sc_logic 1 signal 4 } 
	{ output_r_d0 sc_out sc_lv 8 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pixel_cntr_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pixel_cntr_reload", "role": "default" }} , 
 	{ "name": "pixels_color_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "pixels_color", "role": "address0" }} , 
 	{ "name": "pixels_color_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixels_color", "role": "ce0" }} , 
 	{ "name": "pixels_color_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "pixels_color", "role": "q0" }} , 
 	{ "name": "pixels_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "pixels_x", "role": "address0" }} , 
 	{ "name": "pixels_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixels_x", "role": "ce0" }} , 
 	{ "name": "pixels_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixels_x", "role": "q0" }} , 
 	{ "name": "pixels_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "pixels_y", "role": "address0" }} , 
 	{ "name": "pixels_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixels_y", "role": "ce0" }} , 
 	{ "name": "pixels_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "pixels_y", "role": "q0" }} , 
 	{ "name": "output_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_r", "role": "address0" }} , 
 	{ "name": "output_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce0" }} , 
 	{ "name": "output_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we0" }} , 
 	{ "name": "output_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_r", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "rendering_Pipeline_COLORING_FB",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pixel_cntr_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "pixels_color", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pixels_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pixels_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "COLORING_FB", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rendering_Pipeline_COLORING_FB {
		pixel_cntr_reload {Type I LastRead 0 FirstWrite -1}
		pixels_color {Type I LastRead 0 FirstWrite -1}
		pixels_x {Type I LastRead 0 FirstWrite -1}
		pixels_y {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	pixel_cntr_reload { ap_none {  { pixel_cntr_reload in_data 0 32 } } }
	pixels_color { ap_memory {  { pixels_color_address0 mem_address 1 9 }  { pixels_color_ce0 mem_ce 1 1 }  { pixels_color_q0 mem_dout 0 6 } } }
	pixels_x { ap_memory {  { pixels_x_address0 mem_address 1 9 }  { pixels_x_ce0 mem_ce 1 1 }  { pixels_x_q0 mem_dout 0 8 } } }
	pixels_y { ap_memory {  { pixels_y_address0 mem_address 1 9 }  { pixels_y_ce0 mem_ce 1 1 }  { pixels_y_q0 mem_dout 0 8 } } }
	output_r { ap_memory {  { output_r_address0 mem_address 1 16 }  { output_r_ce0 mem_ce 1 1 }  { output_r_we0 mem_we 1 1 }  { output_r_d0 mem_din 1 8 } } }
}
