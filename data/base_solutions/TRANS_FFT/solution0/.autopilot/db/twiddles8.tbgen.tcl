set moduleName twiddles8
set isTopModule 0
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
set C_modelName {twiddles8}
set C_modelType { void 0 }
set C_modelArgList {
	{ a_x double 64 regular {array 8 { 2 3 } 1 1 }  }
	{ a_y double 64 regular {array 8 { 2 3 } 1 1 }  }
	{ i int 6 regular  }
	{ n int 10 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "a_x", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "a_y", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "i", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "n", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ a_x_address0 sc_out sc_lv 3 signal 0 } 
	{ a_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ a_x_we0 sc_out sc_logic 1 signal 0 } 
	{ a_x_d0 sc_out sc_lv 64 signal 0 } 
	{ a_x_q0 sc_in sc_lv 64 signal 0 } 
	{ a_y_address0 sc_out sc_lv 3 signal 1 } 
	{ a_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ a_y_we0 sc_out sc_logic 1 signal 1 } 
	{ a_y_d0 sc_out sc_lv 64 signal 1 } 
	{ a_y_q0 sc_in sc_lv 64 signal 1 } 
	{ i sc_in sc_lv 6 signal 2 } 
	{ n sc_in sc_lv 10 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "a_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_x", "role": "address0" }} , 
 	{ "name": "a_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_x", "role": "ce0" }} , 
 	{ "name": "a_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_x", "role": "we0" }} , 
 	{ "name": "a_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_x", "role": "d0" }} , 
 	{ "name": "a_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_x", "role": "q0" }} , 
 	{ "name": "a_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_y", "role": "address0" }} , 
 	{ "name": "a_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_y", "role": "ce0" }} , 
 	{ "name": "a_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_y", "role": "we0" }} , 
 	{ "name": "a_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_y", "role": "d0" }} , 
 	{ "name": "a_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_y", "role": "q0" }} , 
 	{ "name": "i", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "i", "role": "default" }} , 
 	{ "name": "n", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "31", "60", "61", "62", "63", "64", "65", "66", "67", "68"],
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
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "ref_4oPi_table_256", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K0", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K1", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K2", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K3", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sin_or_cos_double_s_fu_109", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "28", "Inst_end_state" : "29"},
					{"ID" : "31", "SubInstance" : "grp_sin_or_cos_double_s_fu_128", "Port" : "fourth_order_double_sin_cos_K4", "Inst_start_state" : "28", "Inst_end_state" : "29"}]}],
		"Loop" : [
			{"Name" : "twiddles", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "37", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state37"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.twiddles8_reversed8_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109", "Parent" : "0", "Child" : ["3", "4", "5", "6", "7", "8", "9", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"],
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.ref_4oPi_table_256_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K0_U", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K1_U", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K2_U", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K3_U", "Parent" : "2"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.fourth_order_double_sin_cos_K4_U", "Parent" : "2"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314", "Parent" : "2", "Child" : ["10", "12", "14", "17"],
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
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112", "Parent" : "9", "Child" : ["11"],
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
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119", "Parent" : "9", "Child" : ["13"],
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
	{"ID" : "13", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131", "Parent" : "9", "Child" : ["15", "16"],
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
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.mux_4_2_32_1_1_U11", "Parent" : "14"},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143", "Parent" : "9", "Child" : ["18", "19"],
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
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.mux_4_2_32_1_1_U21", "Parent" : "17"},
	{"ID" : "19", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_35ns_25ns_60_1_1_U33", "Parent" : "2"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_42ns_33ns_75_1_1_U34", "Parent" : "2"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_49ns_44s_93_1_1_U35", "Parent" : "2"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_49ns_49ns_98_1_1_U36", "Parent" : "2"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_49ns_49ns_98_1_1_U37", "Parent" : "2"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_56ns_52s_108_1_1_U38", "Parent" : "2"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_64s_63ns_126_1_1_U39", "Parent" : "2"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.mul_170s_53ns_170_2_1_U40", "Parent" : "2"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.sparsemux_17_3_1_1_1_U41", "Parent" : "2"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.sparsemux_33_4_1_1_1_U42", "Parent" : "2"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_109.sparsemux_33_4_1_1_1_U43", "Parent" : "2"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36", "37", "38", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"],
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
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.ref_4oPi_table_256_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K0_U", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K1_U", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K2_U", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K3_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.fourth_order_double_sin_cos_K4_U", "Parent" : "31"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314", "Parent" : "31", "Child" : ["39", "41", "43", "46"],
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
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112", "Parent" : "38", "Child" : ["40"],
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
	{"ID" : "40", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119", "Parent" : "38", "Child" : ["42"],
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
	{"ID" : "42", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131", "Parent" : "38", "Child" : ["44", "45"],
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
	{"ID" : "44", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.mux_4_2_32_1_1_U11", "Parent" : "43"},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143", "Parent" : "38", "Child" : ["47", "48"],
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
	{"ID" : "47", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.mux_4_2_32_1_1_U21", "Parent" : "46"},
	{"ID" : "48", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.grp_scaled_fixed2ieee_63_1_s_fu_314.grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143.flow_control_loop_pipe_sequential_init_U", "Parent" : "46"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_35ns_25ns_60_1_1_U33", "Parent" : "31"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_42ns_33ns_75_1_1_U34", "Parent" : "31"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_49ns_44s_93_1_1_U35", "Parent" : "31"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_49ns_49ns_98_1_1_U36", "Parent" : "31"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_49ns_49ns_98_1_1_U37", "Parent" : "31"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_56ns_52s_108_1_1_U38", "Parent" : "31"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_64s_63ns_126_1_1_U39", "Parent" : "31"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.mul_170s_53ns_170_2_1_U40", "Parent" : "31"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.sparsemux_17_3_1_1_1_U41", "Parent" : "31"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.sparsemux_33_4_1_1_1_U42", "Parent" : "31"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sin_or_cos_double_s_fu_128.sparsemux_33_4_1_1_1_U43", "Parent" : "31"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_full_dsp_1_U62", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_4_full_dsp_1_U63", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U64", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U65", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U66", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U67", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_14_no_dsp_1_U68", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_2_no_dsp_1_U69", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_2_no_dsp_1_U70", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		in_shift_1_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "492", "Max" : "520"}
	, {"Name" : "Interval", "Min" : "492", "Max" : "520"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	a_x { ap_memory {  { a_x_address0 mem_address 1 3 }  { a_x_ce0 mem_ce 1 1 }  { a_x_we0 mem_we 1 1 }  { a_x_d0 mem_din 1 64 }  { a_x_q0 in_data 0 64 } } }
	a_y { ap_memory {  { a_y_address0 mem_address 1 3 }  { a_y_ce0 mem_ce 1 1 }  { a_y_we0 mem_we 1 1 }  { a_y_d0 mem_din 1 64 }  { a_y_q0 in_data 0 64 } } }
	i { ap_none {  { i in_data 0 6 } } }
	n { ap_none {  { n in_data 0 10 } } }
}
