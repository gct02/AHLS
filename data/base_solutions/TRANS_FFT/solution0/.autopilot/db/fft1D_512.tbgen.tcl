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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "9", "11", "30", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "fft1D_512",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14289", "EstimateLatencyMax" : "14289",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "work_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "work_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "twiddles8_reversed8", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "twiddles8_reversed8", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "92", "Inst_end_state" : "93"},
					{"ID" : "7", "SubInstance" : "grp_fft1D_512_Pipeline_twiddles_fu_2005", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "32", "Inst_end_state" : "33"}]}],
		"Loop" : [
			{"Name" : "loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state38"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state39"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state39", "LastState" : ["ap_ST_fsm_state43"], "QuitState" : ["ap_ST_fsm_state39"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state44"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state44", "LastState" : ["ap_ST_fsm_state48"], "QuitState" : ["ap_ST_fsm_state44"], "PreState" : ["ap_ST_fsm_state39"], "PostState" : ["ap_ST_fsm_state49"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state53"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state44"], "PostState" : ["ap_ST_fsm_state54"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state54", "LastState" : ["ap_ST_fsm_state58"], "QuitState" : ["ap_ST_fsm_state54"], "PreState" : ["ap_ST_fsm_state49"], "PostState" : ["ap_ST_fsm_state59"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state62", "LastState" : ["ap_ST_fsm_state98"], "QuitState" : ["ap_ST_fsm_state62"], "PreState" : ["ap_ST_fsm_state61"], "PostState" : ["ap_ST_fsm_state99"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state99", "LastState" : ["ap_ST_fsm_state103"], "QuitState" : ["ap_ST_fsm_state99"], "PreState" : ["ap_ST_fsm_state62"], "PostState" : ["ap_ST_fsm_state104"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state104", "LastState" : ["ap_ST_fsm_state108"], "QuitState" : ["ap_ST_fsm_state104"], "PreState" : ["ap_ST_fsm_state99"], "PostState" : ["ap_ST_fsm_state109"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state109", "LastState" : ["ap_ST_fsm_state113"], "QuitState" : ["ap_ST_fsm_state109"], "PreState" : ["ap_ST_fsm_state104"], "PostState" : ["ap_ST_fsm_state114"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state114", "LastState" : ["ap_ST_fsm_state118"], "QuitState" : ["ap_ST_fsm_state114"], "PreState" : ["ap_ST_fsm_state109"], "PostState" : ["ap_ST_fsm_state119"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "152", "FirstState" : "ap_ST_fsm_state122", "LastState" : ["ap_ST_fsm_state152"], "QuitState" : ["ap_ST_fsm_state122"], "PreState" : ["ap_ST_fsm_state121"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.twiddles8_reversed8_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_x_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_y_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_x_U_x", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_y_U_x", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.smem_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_twiddles_fu_2005", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "fft1D_512_Pipeline_twiddles",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39", "EstimateLatencyMax" : "39",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "conv2_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "data_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "twiddles", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter31", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter31", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_twiddles_fu_2005.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_twiddles1_fu_2026", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "fft1D_512_Pipeline_twiddles1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39", "EstimateLatencyMax" : "39",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "conv2_i1", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "data_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "twiddles", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter31", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter31", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1D_512_Pipeline_twiddles1_fu_2026.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916", "Parent" : "0", "Child" : ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "8", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.ref_4oPi_table_256_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.fourth_order_double_sin_cos_K0_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.fourth_order_double_sin_cos_K1_U", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.fourth_order_double_sin_cos_K2_U", "Parent" : "11"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.fourth_order_double_sin_cos_K3_U", "Parent" : "11"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.fourth_order_double_sin_cos_K4_U", "Parent" : "11"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_35ns_25ns_60_1_1_U1", "Parent" : "11"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_42ns_33ns_75_1_1_U2", "Parent" : "11"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_49ns_44s_93_1_1_U3", "Parent" : "11"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_49ns_49ns_98_1_1_U4", "Parent" : "11"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_49ns_49ns_98_1_1_U5", "Parent" : "11"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_49ns_49ns_98_1_1_U6", "Parent" : "11"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_56ns_52s_108_1_1_U7", "Parent" : "11"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_64s_63ns_126_1_1_U8", "Parent" : "11"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.mul_170s_53ns_170_2_1_U9", "Parent" : "11"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.sparsemux_17_3_1_1_1_U10", "Parent" : "11"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.sparsemux_33_4_1_1_1_U11", "Parent" : "11"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6916.sparsemux_33_4_1_1_1_U12", "Parent" : "11"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927", "Parent" : "0", "Child" : ["31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "8", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
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
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.ref_4oPi_table_256_U", "Parent" : "30"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.fourth_order_double_sin_cos_K0_U", "Parent" : "30"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.fourth_order_double_sin_cos_K1_U", "Parent" : "30"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.fourth_order_double_sin_cos_K2_U", "Parent" : "30"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.fourth_order_double_sin_cos_K3_U", "Parent" : "30"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.fourth_order_double_sin_cos_K4_U", "Parent" : "30"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_35ns_25ns_60_1_1_U1", "Parent" : "30"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_42ns_33ns_75_1_1_U2", "Parent" : "30"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_49ns_44s_93_1_1_U3", "Parent" : "30"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_49ns_49ns_98_1_1_U4", "Parent" : "30"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_49ns_49ns_98_1_1_U5", "Parent" : "30"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_49ns_49ns_98_1_1_U6", "Parent" : "30"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_56ns_52s_108_1_1_U7", "Parent" : "30"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_64s_63ns_126_1_1_U8", "Parent" : "30"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.mul_170s_53ns_170_2_1_U9", "Parent" : "30"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.sparsemux_17_3_1_1_1_U10", "Parent" : "30"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.sparsemux_33_4_1_1_1_U11", "Parent" : "30"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_6927.sparsemux_33_4_1_1_1_U12", "Parent" : "30"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U59", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U60", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U61", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U62", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U63", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U64", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U65", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U66", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U67", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U68", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U69", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U70", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U71", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U72", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_2_no_dsp_1_U73", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U74", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_2_no_dsp_1_U75", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft1D_512 {
		work_x {Type IO LastRead 10 FirstWrite 32}
		work_y {Type IO LastRead 10 FirstWrite 32}
		twiddles8_reversed8 {Type I LastRead -1 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	fft1D_512_Pipeline_twiddles {
		conv2_i {Type I LastRead 0 FirstWrite -1}
		data_x {Type IO LastRead 23 FirstWrite 31}
		data_y {Type IO LastRead 23 FirstWrite 31}
		twiddles8_reversed8 {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	fft1D_512_Pipeline_twiddles1 {
		conv2_i1 {Type I LastRead 0 FirstWrite -1}
		data_x {Type IO LastRead 23 FirstWrite 31}
		data_y {Type IO LastRead 23 FirstWrite 31}
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
	{"Name" : "Latency", "Min" : "14289", "Max" : "14289"}
	, {"Name" : "Interval", "Min" : "14290", "Max" : "14290"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	work_x { ap_memory {  { work_x_address0 mem_address 1 9 }  { work_x_ce0 mem_ce 1 1 }  { work_x_we0 mem_we 1 1 }  { work_x_d0 mem_din 1 64 }  { work_x_q0 in_data 0 64 }  { work_x_address1 MemPortADDR2 1 9 }  { work_x_ce1 MemPortCE2 1 1 }  { work_x_we1 MemPortWE2 1 1 }  { work_x_d1 MemPortDIN2 1 64 }  { work_x_q1 in_data 0 64 } } }
	work_y { ap_memory {  { work_y_address0 mem_address 1 9 }  { work_y_ce0 mem_ce 1 1 }  { work_y_we0 mem_we 1 1 }  { work_y_d0 mem_din 1 64 }  { work_y_q0 in_data 0 64 }  { work_y_address1 MemPortADDR2 1 9 }  { work_y_ce1 MemPortCE2 1 1 }  { work_y_we1 MemPortWE2 1 1 }  { work_y_d1 MemPortDIN2 1 64 }  { work_y_q1 in_data 0 64 } } }
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
