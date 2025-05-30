set moduleName fft1D_512
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
set C_modelName {fft1D_512}
set C_modelType { void 0 }
set C_modelArgList {
	{ work_x int 64 regular {array 512 { 2 2 } 1 1 }  }
	{ work_y int 64 regular {array 512 { 2 2 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "work_x", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "work_y", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ work_x_address0 sc_out sc_lv 9 signal 0 } 
	{ work_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ work_x_we0 sc_out sc_logic 1 signal 0 } 
	{ work_x_d0 sc_out sc_lv 64 signal 0 } 
	{ work_x_q0 sc_in sc_lv 64 signal 0 } 
	{ work_x_address1 sc_out sc_lv 9 signal 0 } 
	{ work_x_ce1 sc_out sc_logic 1 signal 0 } 
	{ work_x_we1 sc_out sc_logic 1 signal 0 } 
	{ work_x_d1 sc_out sc_lv 64 signal 0 } 
	{ work_x_q1 sc_in sc_lv 64 signal 0 } 
	{ work_y_address0 sc_out sc_lv 9 signal 1 } 
	{ work_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ work_y_we0 sc_out sc_logic 1 signal 1 } 
	{ work_y_d0 sc_out sc_lv 64 signal 1 } 
	{ work_y_q0 sc_in sc_lv 64 signal 1 } 
	{ work_y_address1 sc_out sc_lv 9 signal 1 } 
	{ work_y_ce1 sc_out sc_logic 1 signal 1 } 
	{ work_y_we1 sc_out sc_logic 1 signal 1 } 
	{ work_y_d1 sc_out sc_lv 64 signal 1 } 
	{ work_y_q1 sc_in sc_lv 64 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "work_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_x", "role": "address0" }} , 
 	{ "name": "work_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "ce0" }} , 
 	{ "name": "work_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "we0" }} , 
 	{ "name": "work_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "d0" }} , 
 	{ "name": "work_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "q0" }} , 
 	{ "name": "work_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_x", "role": "address1" }} , 
 	{ "name": "work_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "ce1" }} , 
 	{ "name": "work_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "we1" }} , 
 	{ "name": "work_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "d1" }} , 
 	{ "name": "work_x_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "q1" }} , 
 	{ "name": "work_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_y", "role": "address0" }} , 
 	{ "name": "work_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "ce0" }} , 
 	{ "name": "work_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "we0" }} , 
 	{ "name": "work_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "d0" }} , 
 	{ "name": "work_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "q0" }} , 
 	{ "name": "work_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_y", "role": "address1" }} , 
 	{ "name": "work_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "ce1" }} , 
 	{ "name": "work_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "we1" }} , 
 	{ "name": "work_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "d1" }} , 
 	{ "name": "work_y_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "10", "13", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45"],
		"CDFG" : "fft1D_512",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19856", "EstimateLatencyMax" : "19856",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "work_x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "work_x", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "work_y", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "work_y", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "twiddles8_reversed8", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "twiddles8_reversed8", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "26", "Inst_end_state" : "27"}]}],
		"Loop" : [
			{"Name" : "loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state13"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state13", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state13"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state13"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state28", "LastState" : ["ap_ST_fsm_state32"], "QuitState" : ["ap_ST_fsm_state28"], "PreState" : ["ap_ST_fsm_state27"], "PostState" : ["ap_ST_fsm_state33"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state33", "LastState" : ["ap_ST_fsm_state37"], "QuitState" : ["ap_ST_fsm_state33"], "PreState" : ["ap_ST_fsm_state28"], "PostState" : ["ap_ST_fsm_state38"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state38", "LastState" : ["ap_ST_fsm_state42"], "QuitState" : ["ap_ST_fsm_state38"], "PreState" : ["ap_ST_fsm_state33"], "PostState" : ["ap_ST_fsm_state43"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state43", "LastState" : ["ap_ST_fsm_state47"], "QuitState" : ["ap_ST_fsm_state43"], "PreState" : ["ap_ST_fsm_state38"], "PostState" : ["ap_ST_fsm_state48"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state51", "LastState" : ["ap_ST_fsm_state81"], "QuitState" : ["ap_ST_fsm_state51"], "PreState" : ["ap_ST_fsm_state50"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.twiddles8_reversed8_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_x_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_y_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_x_U_x", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_y_U_x", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.smem_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550", "Parent" : "0", "Child" : ["8", "9"],
		"CDFG" : "fft1D_512_Pipeline_loop1_twiddles",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7647", "EstimateLatencyMax" : "7647",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "data_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "DATA_x_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "DATA_y_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "work_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "work_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop1_twiddles", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage12", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage12_subdone", "QuitState" : "ap_ST_fsm_pp0_stage12", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage12_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550.sitodp_32ns_64_2_no_dsp_1_U41", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580", "Parent" : "0", "Child" : ["11", "12"],
		"CDFG" : "fft1D_512_Pipeline_loop6_twiddles",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7647", "EstimateLatencyMax" : "7647",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "data_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "DATA_x_r", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "DATA_y_r", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop6_twiddles", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage12", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage12_subdone", "QuitState" : "ap_ST_fsm_pp0_stage12", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage12_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580.sitodp_32ns_64_2_no_dsp_1_U60", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138", "Parent" : "0", "Child" : ["14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "8", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "t_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "do_cos", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.ref_4oPi_table_256_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.fourth_order_double_sin_cos_K0_U", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.fourth_order_double_sin_cos_K1_U", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.fourth_order_double_sin_cos_K2_U", "Parent" : "13"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.fourth_order_double_sin_cos_K3_U", "Parent" : "13"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.fourth_order_double_sin_cos_K4_U", "Parent" : "13"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_35ns_25ns_60_1_1_U1", "Parent" : "13"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_42ns_33ns_75_1_1_U2", "Parent" : "13"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_49ns_44s_93_1_1_U3", "Parent" : "13"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_49ns_49ns_98_1_1_U4", "Parent" : "13"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_49ns_49ns_98_1_1_U5", "Parent" : "13"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_49ns_49ns_98_1_1_U6", "Parent" : "13"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_56ns_52s_108_1_1_U7", "Parent" : "13"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_64s_63ns_126_1_1_U8", "Parent" : "13"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.mul_170s_53ns_170_2_1_U9", "Parent" : "13"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.sparsemux_17_3_1_1_1_U10", "Parent" : "13"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.sparsemux_33_4_1_1_1_U11", "Parent" : "13"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_5138.sparsemux_33_4_1_1_1_U12", "Parent" : "13"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U66", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U67", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U68", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U69", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U70", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U71", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U72", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U73", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U74", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U75", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U76", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U77", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U78", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U79", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft1D_512 {
		work_x {Type IO LastRead 4 FirstWrite -1}
		work_y {Type IO LastRead 4 FirstWrite -1}
		twiddles8_reversed8 {Type I LastRead -1 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	fft1D_512_Pipeline_loop1_twiddles {
		data_x {Type IO LastRead 45 FirstWrite 24}
		data_y {Type IO LastRead 45 FirstWrite 24}
		DATA_x_r {Type O LastRead -1 FirstWrite 15}
		DATA_y_r {Type O LastRead -1 FirstWrite 15}
		work_x {Type I LastRead 4 FirstWrite -1}
		work_y {Type I LastRead 4 FirstWrite -1}
		twiddles8_reversed8 {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	fft1D_512_Pipeline_loop6_twiddles {
		data_x {Type IO LastRead 45 FirstWrite 24}
		data_y {Type IO LastRead 45 FirstWrite 24}
		DATA_x_r {Type IO LastRead 4 FirstWrite 15}
		DATA_y_r {Type IO LastRead 4 FirstWrite 15}
		twiddles8_reversed8 {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19856", "Max" : "19856"}
	, {"Name" : "Interval", "Min" : "19857", "Max" : "19857"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	work_x { ap_memory {  { work_x_address0 mem_address 1 9 }  { work_x_ce0 mem_ce 1 1 }  { work_x_we0 mem_we 1 1 }  { work_x_d0 mem_din 1 64 }  { work_x_q0 mem_dout 0 64 }  { work_x_address1 MemPortADDR2 1 9 }  { work_x_ce1 MemPortCE2 1 1 }  { work_x_we1 MemPortWE2 1 1 }  { work_x_d1 MemPortDIN2 1 64 }  { work_x_q1 MemPortDOUT2 0 64 } } }
	work_y { ap_memory {  { work_y_address0 mem_address 1 9 }  { work_y_ce0 mem_ce 1 1 }  { work_y_we0 mem_we 1 1 }  { work_y_d0 mem_din 1 64 }  { work_y_q0 mem_dout 0 64 }  { work_y_address1 MemPortADDR2 1 9 }  { work_y_ce1 MemPortCE2 1 1 }  { work_y_we1 MemPortWE2 1 1 }  { work_y_d1 MemPortDIN2 1 64 }  { work_y_q1 MemPortDOUT2 0 64 } } }
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
