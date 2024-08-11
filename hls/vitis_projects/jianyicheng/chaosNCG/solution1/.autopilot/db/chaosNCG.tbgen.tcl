set moduleName chaosNCG
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {chaosNCG}
set C_modelType { void 0 }
set C_modelArgList {
	{ I int 32 regular  }
	{ bo int 32 regular  }
	{ M int 32 regular {array 2000 { 1 1 } 1 1 }  }
	{ X int 32 regular  }
	{ Y int 32 regular  }
	{ params0 int 32 regular  }
	{ params1 int 32 regular  }
	{ buffer_r int 32 regular {array 2000 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "I", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bo", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "M", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "X", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "params0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "params1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ I sc_in sc_lv 32 signal 0 } 
	{ bo sc_in sc_lv 32 signal 1 } 
	{ M_address0 sc_out sc_lv 11 signal 2 } 
	{ M_ce0 sc_out sc_logic 1 signal 2 } 
	{ M_q0 sc_in sc_lv 32 signal 2 } 
	{ M_address1 sc_out sc_lv 11 signal 2 } 
	{ M_ce1 sc_out sc_logic 1 signal 2 } 
	{ M_q1 sc_in sc_lv 32 signal 2 } 
	{ X sc_in sc_lv 32 signal 3 } 
	{ Y sc_in sc_lv 32 signal 4 } 
	{ params0 sc_in sc_lv 32 signal 5 } 
	{ params1 sc_in sc_lv 32 signal 6 } 
	{ buffer_r_address0 sc_out sc_lv 11 signal 7 } 
	{ buffer_r_ce0 sc_out sc_logic 1 signal 7 } 
	{ buffer_r_we0 sc_out sc_logic 1 signal 7 } 
	{ buffer_r_d0 sc_out sc_lv 32 signal 7 } 
	{ buffer_r_q0 sc_in sc_lv 32 signal 7 } 
	{ buffer_r_address1 sc_out sc_lv 11 signal 7 } 
	{ buffer_r_ce1 sc_out sc_logic 1 signal 7 } 
	{ buffer_r_we1 sc_out sc_logic 1 signal 7 } 
	{ buffer_r_d1 sc_out sc_lv 32 signal 7 } 
	{ buffer_r_q1 sc_in sc_lv 32 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "I", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "I", "role": "default" }} , 
 	{ "name": "bo", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bo", "role": "default" }} , 
 	{ "name": "M_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "M", "role": "address0" }} , 
 	{ "name": "M_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M", "role": "ce0" }} , 
 	{ "name": "M_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M", "role": "q0" }} , 
 	{ "name": "M_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "M", "role": "address1" }} , 
 	{ "name": "M_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M", "role": "ce1" }} , 
 	{ "name": "M_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M", "role": "q1" }} , 
 	{ "name": "X", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X", "role": "default" }} , 
 	{ "name": "Y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Y", "role": "default" }} , 
 	{ "name": "params0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params0", "role": "default" }} , 
 	{ "name": "params1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params1", "role": "default" }} , 
 	{ "name": "buffer_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "buffer_r", "role": "address0" }} , 
 	{ "name": "buffer_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "ce0" }} , 
 	{ "name": "buffer_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "we0" }} , 
 	{ "name": "buffer_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_r", "role": "d0" }} , 
 	{ "name": "buffer_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_r", "role": "q0" }} , 
 	{ "name": "buffer_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "buffer_r", "role": "address1" }} , 
 	{ "name": "buffer_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "ce1" }} , 
 	{ "name": "buffer_r_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "we1" }} , 
 	{ "name": "buffer_r_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_r", "role": "d1" }} , 
 	{ "name": "buffer_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_r", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "chaosNCG",
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
			{"Name" : "I", "Type" : "None", "Direction" : "I"},
			{"Name" : "bo", "Type" : "None", "Direction" : "I"},
			{"Name" : "M", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "X", "Type" : "None", "Direction" : "I"},
			{"Name" : "Y", "Type" : "None", "Direction" : "I"},
			{"Name" : "params0", "Type" : "None", "Direction" : "I"},
			{"Name" : "params1", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_r", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_7_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "75", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_6ns_32_36_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_6ns_32_36_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	chaosNCG {
		I {Type I LastRead 0 FirstWrite -1}
		bo {Type I LastRead 0 FirstWrite -1}
		M {Type I LastRead 1 FirstWrite -1}
		X {Type I LastRead 0 FirstWrite -1}
		Y {Type I LastRead 0 FirstWrite -1}
		params0 {Type I LastRead 0 FirstWrite -1}
		params1 {Type I LastRead 0 FirstWrite -1}
		buffer_r {Type IO LastRead 2 FirstWrite 39}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	I { ap_none {  { I in_data 0 32 } } }
	bo { ap_none {  { bo in_data 0 32 } } }
	M { ap_memory {  { M_address0 mem_address 1 11 }  { M_ce0 mem_ce 1 1 }  { M_q0 in_data 0 32 }  { M_address1 MemPortADDR2 1 11 }  { M_ce1 MemPortCE2 1 1 }  { M_q1 in_data 0 32 } } }
	X { ap_none {  { X in_data 0 32 } } }
	Y { ap_none {  { Y in_data 0 32 } } }
	params0 { ap_none {  { params0 in_data 0 32 } } }
	params1 { ap_none {  { params1 in_data 0 32 } } }
	buffer_r { ap_memory {  { buffer_r_address0 mem_address 1 11 }  { buffer_r_ce0 mem_ce 1 1 }  { buffer_r_we0 mem_we 1 1 }  { buffer_r_d0 mem_din 1 32 }  { buffer_r_q0 mem_dout 0 32 }  { buffer_r_address1 MemPortADDR2 1 11 }  { buffer_r_ce1 MemPortCE2 1 1 }  { buffer_r_we1 MemPortWE2 1 1 }  { buffer_r_d1 MemPortDIN2 1 32 }  { buffer_r_q1 in_data 0 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
