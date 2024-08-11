set moduleName levmarq
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
set C_modelName {levmarq}
set C_modelType { void 0 }
set C_modelArgList {
	{ dummy int 32 regular  }
	{ ny int 32 regular  }
	{ dysq int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ npar int 32 regular  }
	{ g int 32 regular {array 128 { 2 3 } 1 1 }  }
	{ d int 32 regular {array 128 { 2 3 } 1 1 }  }
	{ y int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ h int 32 regular {array 16384 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "dummy", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ny", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dysq", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "npar", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "g", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "d", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "h", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ dummy sc_in sc_lv 32 signal 0 } 
	{ ny sc_in sc_lv 32 signal 1 } 
	{ dysq_address0 sc_out sc_lv 10 signal 2 } 
	{ dysq_ce0 sc_out sc_logic 1 signal 2 } 
	{ dysq_q0 sc_in sc_lv 32 signal 2 } 
	{ npar sc_in sc_lv 32 signal 3 } 
	{ g_address0 sc_out sc_lv 7 signal 4 } 
	{ g_ce0 sc_out sc_logic 1 signal 4 } 
	{ g_we0 sc_out sc_logic 1 signal 4 } 
	{ g_d0 sc_out sc_lv 32 signal 4 } 
	{ g_q0 sc_in sc_lv 32 signal 4 } 
	{ d_address0 sc_out sc_lv 7 signal 5 } 
	{ d_ce0 sc_out sc_logic 1 signal 5 } 
	{ d_we0 sc_out sc_logic 1 signal 5 } 
	{ d_d0 sc_out sc_lv 32 signal 5 } 
	{ d_q0 sc_in sc_lv 32 signal 5 } 
	{ y_address0 sc_out sc_lv 10 signal 6 } 
	{ y_ce0 sc_out sc_logic 1 signal 6 } 
	{ y_q0 sc_in sc_lv 32 signal 6 } 
	{ h_address0 sc_out sc_lv 14 signal 7 } 
	{ h_ce0 sc_out sc_logic 1 signal 7 } 
	{ h_we0 sc_out sc_logic 1 signal 7 } 
	{ h_d0 sc_out sc_lv 32 signal 7 } 
	{ h_address1 sc_out sc_lv 14 signal 7 } 
	{ h_ce1 sc_out sc_logic 1 signal 7 } 
	{ h_q1 sc_in sc_lv 32 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "dummy", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dummy", "role": "default" }} , 
 	{ "name": "ny", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ny", "role": "default" }} , 
 	{ "name": "dysq_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dysq", "role": "address0" }} , 
 	{ "name": "dysq_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dysq", "role": "ce0" }} , 
 	{ "name": "dysq_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dysq", "role": "q0" }} , 
 	{ "name": "npar", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "npar", "role": "default" }} , 
 	{ "name": "g_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "g", "role": "address0" }} , 
 	{ "name": "g_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g", "role": "ce0" }} , 
 	{ "name": "g_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g", "role": "we0" }} , 
 	{ "name": "g_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "g", "role": "d0" }} , 
 	{ "name": "g_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "g", "role": "q0" }} , 
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "we0" }} , 
 	{ "name": "d_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "d0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "q0" }} , 
 	{ "name": "h_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "h", "role": "address0" }} , 
 	{ "name": "h_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce0" }} , 
 	{ "name": "h_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "we0" }} , 
 	{ "name": "h_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h", "role": "d0" }} , 
 	{ "name": "h_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "h", "role": "address1" }} , 
 	{ "name": "h_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "ce1" }} , 
 	{ "name": "h_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "levmarq",
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
			{"Name" : "dummy", "Type" : "None", "Direction" : "I"},
			{"Name" : "ny", "Type" : "None", "Direction" : "I"},
			{"Name" : "dysq", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "npar", "Type" : "None", "Direction" : "I"},
			{"Name" : "g", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_levmarq_Pipeline_VITIS_LOOP_19_3_fu_208", "Port" : "g", "Inst_start_state" : "68", "Inst_end_state" : "69"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_levmarq_Pipeline_VITIS_LOOP_19_3_fu_208", "Port" : "h", "Inst_start_state" : "68", "Inst_end_state" : "69"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "86", "FirstState" : "ap_ST_fsm_state66", "LastState" : ["ap_ST_fsm_state86"], "QuitState" : ["ap_ST_fsm_state66"], "PreState" : ["ap_ST_fsm_state65"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_4_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "86", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state66"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_levmarq_Pipeline_VITIS_LOOP_19_3_fu_208", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "levmarq_Pipeline_VITIS_LOOP_19_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "2147483664",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indvars_iv10", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "g", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_s", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_19_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter16", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter16", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_levmarq_Pipeline_VITIS_LOOP_19_3_fu_208.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U11", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U12", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U13", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U15", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U16", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_4_no_dsp_1_U17", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7s_7s_7_1_1_U18", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	levmarq {
		dummy {Type I LastRead 0 FirstWrite -1}
		ny {Type I LastRead 0 FirstWrite -1}
		dysq {Type I LastRead 58 FirstWrite -1}
		npar {Type I LastRead 0 FirstWrite -1}
		g {Type IO LastRead 65 FirstWrite -1}
		d {Type IO LastRead 78 FirstWrite 85}
		y {Type I LastRead 58 FirstWrite -1}
		h {Type IO LastRead 9 FirstWrite 16}}
	levmarq_Pipeline_VITIS_LOOP_19_3 {
		indvars_iv10 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		g {Type I LastRead 1 FirstWrite -1}
		x_s {Type I LastRead 0 FirstWrite -1}
		weight {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		h {Type IO LastRead 9 FirstWrite 16}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	dummy { ap_none {  { dummy in_data 0 32 } } }
	ny { ap_none {  { ny in_data 0 32 } } }
	dysq { ap_memory {  { dysq_address0 mem_address 1 10 }  { dysq_ce0 mem_ce 1 1 }  { dysq_q0 mem_dout 0 32 } } }
	npar { ap_none {  { npar in_data 0 32 } } }
	g { ap_memory {  { g_address0 mem_address 1 7 }  { g_ce0 mem_ce 1 1 }  { g_we0 mem_we 1 1 }  { g_d0 mem_din 1 32 }  { g_q0 mem_dout 0 32 } } }
	d { ap_memory {  { d_address0 mem_address 1 7 }  { d_ce0 mem_ce 1 1 }  { d_we0 mem_we 1 1 }  { d_d0 mem_din 1 32 }  { d_q0 mem_dout 0 32 } } }
	y { ap_memory {  { y_address0 mem_address 1 10 }  { y_ce0 mem_ce 1 1 }  { y_q0 mem_dout 0 32 } } }
	h { ap_memory {  { h_address0 mem_address 1 14 }  { h_ce0 mem_ce 1 1 }  { h_we0 mem_we 1 1 }  { h_d0 mem_din 1 32 }  { h_address1 MemPortADDR2 1 14 }  { h_ce1 MemPortCE2 1 1 }  { h_q1 MemPortDOUT2 0 32 } } }
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
