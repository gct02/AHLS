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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89"],
		"CDFG" : "fft1D_512",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73675", "EstimateLatencyMax" : "77259",
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
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "twiddles8_reversed8", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "96", "Inst_end_state" : "97"}]},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_twiddles8_fu_1829", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "96", "Inst_end_state" : "97"}]}],
		"Loop" : [
			{"Name" : "loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state38"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state39"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state39", "LastState" : ["ap_ST_fsm_state43"], "QuitState" : ["ap_ST_fsm_state39"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state44"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state44", "LastState" : ["ap_ST_fsm_state48"], "QuitState" : ["ap_ST_fsm_state44"], "PreState" : ["ap_ST_fsm_state39"], "PostState" : ["ap_ST_fsm_state49"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state53"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state44"], "PostState" : ["ap_ST_fsm_state54"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state54", "LastState" : ["ap_ST_fsm_state65"], "QuitState" : ["ap_ST_fsm_state54"], "PreState" : ["ap_ST_fsm_state49"], "PostState" : ["ap_ST_fsm_state66"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state66", "LastState" : ["ap_ST_fsm_state102"], "QuitState" : ["ap_ST_fsm_state66"], "PreState" : ["ap_ST_fsm_state54"], "PostState" : ["ap_ST_fsm_state103"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state103", "LastState" : ["ap_ST_fsm_state107"], "QuitState" : ["ap_ST_fsm_state103"], "PreState" : ["ap_ST_fsm_state66"], "PostState" : ["ap_ST_fsm_state108"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state108", "LastState" : ["ap_ST_fsm_state112"], "QuitState" : ["ap_ST_fsm_state108"], "PreState" : ["ap_ST_fsm_state103"], "PostState" : ["ap_ST_fsm_state113"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state113", "LastState" : ["ap_ST_fsm_state117"], "QuitState" : ["ap_ST_fsm_state113"], "PreState" : ["ap_ST_fsm_state108"], "PostState" : ["ap_ST_fsm_state118"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state118", "LastState" : ["ap_ST_fsm_state129"], "QuitState" : ["ap_ST_fsm_state118"], "PreState" : ["ap_ST_fsm_state113"], "PostState" : ["ap_ST_fsm_state130"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "160", "FirstState" : "ap_ST_fsm_state130", "LastState" : ["ap_ST_fsm_state160"], "QuitState" : ["ap_ST_fsm_state130"], "PreState" : ["ap_ST_fsm_state118"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_x_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.DATA_y_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_x_U_x", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_y_U_x", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.smem_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829", "Parent" : "0", "Child" : ["7", "8", "37", "66", "67", "68", "69", "70", "71", "72", "73", "74"],
		"CDFG" : "twiddles8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "492", "EstimateLatencyMax" : "520",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "a_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "i", "Type" : "None", "Direction" : "I"},
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "37", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "28", "Inst_end_state" : "29"}]}],
		"Loop" : [
			{"Name" : "twiddles", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "37", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state37"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.twiddles8_reversed8_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109", "Parent" : "6", "Child" : ["9", "10", "11", "12", "13", "14", "15", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "35", "EstimateLatencyMax" : "39",
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
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.ref_4oPi_table_256_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K0_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K1_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K2_U", "Parent" : "8"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K3_U", "Parent" : "8"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K4_U", "Parent" : "8"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314", "Parent" : "8", "Child" : ["16", "18", "20", "23"],
		"CDFG" : "scaled_fixed2ieee_63_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "30",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "prescale", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112", "Parent" : "15", "Child" : ["17"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119", "Parent" : "15", "Child" : ["19"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_0_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131", "Parent" : "15", "Child" : ["21", "22"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_0_21_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_1_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_2_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_1_04_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_0_03_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_3_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.mux_4_2_32_1_1_U11", "Parent" : "20"},
	{"ID" : "22", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "23", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143", "Parent" : "15", "Child" : ["24", "25"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_0_03_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_1_04_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_3_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "shift_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.mux_4_2_32_1_1_U21", "Parent" : "23"},
	{"ID" : "25", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_35ns_25ns_60_1_1_U33", "Parent" : "8"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_42ns_33ns_75_1_1_U34", "Parent" : "8"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_49ns_44s_93_1_1_U35", "Parent" : "8"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_49ns_49ns_98_1_1_U36", "Parent" : "8"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_49ns_49ns_98_1_1_U37", "Parent" : "8"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_56ns_52s_108_1_1_U38", "Parent" : "8"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_64s_63ns_126_1_1_U39", "Parent" : "8"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.mul_170s_53ns_170_2_1_U40", "Parent" : "8"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.sparsemux_17_3_1_1_1_U41", "Parent" : "8"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.sparsemux_33_4_1_1_1_U42", "Parent" : "8"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_109.sparsemux_33_4_1_1_1_U43", "Parent" : "8"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128", "Parent" : "6", "Child" : ["38", "39", "40", "41", "42", "43", "44", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "sin_or_cos_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "35", "EstimateLatencyMax" : "39",
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
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.ref_4oPi_table_256_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K0_U", "Parent" : "37"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K1_U", "Parent" : "37"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K2_U", "Parent" : "37"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K3_U", "Parent" : "37"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K4_U", "Parent" : "37"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314", "Parent" : "37", "Child" : ["45", "47", "49", "52"],
		"CDFG" : "scaled_fixed2ieee_63_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "30",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "prescale", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112", "Parent" : "44", "Child" : ["46"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119", "Parent" : "44", "Child" : ["48"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "out_bits_0_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131", "Parent" : "44", "Child" : ["50", "51"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_bits_0_21_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_1_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_2_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_bits_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_1_04_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_0_03_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "c_3_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "50", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.mux_4_2_32_1_1_U11", "Parent" : "49"},
	{"ID" : "51", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.flow_control_loop_pipe_sequential_init_U", "Parent" : "49"},
	{"ID" : "52", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143", "Parent" : "44", "Child" : ["53", "54"],
		"CDFG" : "scaled_fixed2ieee_63_1_Pipeline_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_0_03_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_1_04_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_2_05_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_3_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "shift_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_shift_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "53", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.mux_4_2_32_1_1_U21", "Parent" : "52"},
	{"ID" : "54", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.flow_control_loop_pipe_sequential_init_U", "Parent" : "52"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_35ns_25ns_60_1_1_U33", "Parent" : "37"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_42ns_33ns_75_1_1_U34", "Parent" : "37"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_49ns_44s_93_1_1_U35", "Parent" : "37"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_49ns_49ns_98_1_1_U36", "Parent" : "37"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_49ns_49ns_98_1_1_U37", "Parent" : "37"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_56ns_52s_108_1_1_U38", "Parent" : "37"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_64s_63ns_126_1_1_U39", "Parent" : "37"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.mul_170s_53ns_170_2_1_U40", "Parent" : "37"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.sparsemux_17_3_1_1_1_U41", "Parent" : "37"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.sparsemux_33_4_1_1_1_U42", "Parent" : "37"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.grp_sin_or_cos_double_s_fu_128.sparsemux_33_4_1_1_1_U43", "Parent" : "37"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dsub_64ns_64ns_64_4_full_dsp_1_U62", "Parent" : "6"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dadd_64ns_64ns_64_4_full_dsp_1_U63", "Parent" : "6"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dmul_64ns_64ns_64_4_max_dsp_1_U64", "Parent" : "6"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dmul_64ns_64ns_64_4_max_dsp_1_U65", "Parent" : "6"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dmul_64ns_64ns_64_4_max_dsp_1_U66", "Parent" : "6"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.dmul_64ns_64ns_64_4_max_dsp_1_U67", "Parent" : "6"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.ddiv_64ns_64ns_64_14_no_dsp_1_U68", "Parent" : "6"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.sitodp_32ns_64_2_no_dsp_1_U69", "Parent" : "6"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_twiddles8_fu_1829.sitodp_32ns_64_2_no_dsp_1_U70", "Parent" : "6"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_loady8_fu_1853", "Parent" : "0",
		"CDFG" : "loady8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "offset", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U84", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U85", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U86", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U87", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U88", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_4_full_dsp_1_U89", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U90", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U91", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U92", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U93", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U94", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U95", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U96", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U97", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft1D_512 {
		work_x {Type IO LastRead 5 FirstWrite 26}
		work_y {Type IO LastRead 5 FirstWrite 26}
		twiddles8_reversed8 {Type I LastRead -1 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	twiddles8 {
		a_x {Type IO LastRead 28 FirstWrite 36}
		a_y {Type IO LastRead 28 FirstWrite 36}
		i {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		twiddles8_reversed8 {Type I LastRead -1 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 4 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	scaled_fixed2ieee_63_1_s {
		in_val {Type I LastRead 2 FirstWrite -1}
		prescale {Type I LastRead 8 FirstWrite -1}}
	scaled_fixed2ieee_63_1_Pipeline_1 {
		out_bits_2_1_out {Type O LastRead -1 FirstWrite 0}
		out_bits_1_1_out {Type O LastRead -1 FirstWrite 0}
		out_bits_0_1_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_2 {
		out_bits_2_1_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_1_1_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_0_1_reload {Type I LastRead 0 FirstWrite -1}
		in_val {Type I LastRead 0 FirstWrite -1}
		out_bits_2_2_out {Type O LastRead -1 FirstWrite 0}
		out_bits_1_2_out {Type O LastRead -1 FirstWrite 0}
		out_bits_0_21_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_3 {
		out_bits_0_21_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_1_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_2_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_3 {Type I LastRead 0 FirstWrite -1}
		c_2_05_out {Type O LastRead -1 FirstWrite 0}
		c_1_04_out {Type O LastRead -1 FirstWrite 0}
		c_0_03_out {Type O LastRead -1 FirstWrite 0}
		c_3_02_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_4 {
		in_val {Type I LastRead 0 FirstWrite -1}
		c_0_03_reload {Type I LastRead 0 FirstWrite -1}
		c_1_04_reload {Type I LastRead 0 FirstWrite -1}
		c_2_05_reload {Type I LastRead 0 FirstWrite -1}
		c_3_02_reload {Type I LastRead 0 FirstWrite -1}
		shift_out {Type O LastRead -1 FirstWrite 1}
		in_shift_out {Type O LastRead -1 FirstWrite 1}
		shift_1_out {Type O LastRead -1 FirstWrite 1}
		in_shift_1_out {Type O LastRead -1 FirstWrite 1}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 4 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	scaled_fixed2ieee_63_1_s {
		in_val {Type I LastRead 2 FirstWrite -1}
		prescale {Type I LastRead 8 FirstWrite -1}}
	scaled_fixed2ieee_63_1_Pipeline_1 {
		out_bits_2_1_out {Type O LastRead -1 FirstWrite 0}
		out_bits_1_1_out {Type O LastRead -1 FirstWrite 0}
		out_bits_0_1_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_2 {
		out_bits_2_1_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_1_1_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_0_1_reload {Type I LastRead 0 FirstWrite -1}
		in_val {Type I LastRead 0 FirstWrite -1}
		out_bits_2_2_out {Type O LastRead -1 FirstWrite 0}
		out_bits_1_2_out {Type O LastRead -1 FirstWrite 0}
		out_bits_0_21_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_3 {
		out_bits_0_21_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_1_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_2_2_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_3 {Type I LastRead 0 FirstWrite -1}
		c_2_05_out {Type O LastRead -1 FirstWrite 0}
		c_1_04_out {Type O LastRead -1 FirstWrite 0}
		c_0_03_out {Type O LastRead -1 FirstWrite 0}
		c_3_02_out {Type O LastRead -1 FirstWrite 0}}
	scaled_fixed2ieee_63_1_Pipeline_4 {
		in_val {Type I LastRead 0 FirstWrite -1}
		c_0_03_reload {Type I LastRead 0 FirstWrite -1}
		c_1_04_reload {Type I LastRead 0 FirstWrite -1}
		c_2_05_reload {Type I LastRead 0 FirstWrite -1}
		c_3_02_reload {Type I LastRead 0 FirstWrite -1}
		shift_out {Type O LastRead -1 FirstWrite 1}
		in_shift_out {Type O LastRead -1 FirstWrite 1}
		shift_1_out {Type O LastRead -1 FirstWrite 1}
		in_shift_1_out {Type O LastRead -1 FirstWrite 1}}
	loady8 {
		a_y {Type O LastRead -1 FirstWrite 1}
		x {Type I LastRead 4 FirstWrite -1}
		offset {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "73675", "Max" : "77259"}
	, {"Name" : "Interval", "Min" : "73676", "Max" : "77260"}
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
