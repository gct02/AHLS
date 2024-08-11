set moduleName substring
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
set C_modelName {substring}
set C_modelType { int 32 }
set C_modelArgList {
	{ str_0 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_1 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_2 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_3 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_4 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_5 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_6 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ str_7 int 32 regular {array 4096 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "str_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "str_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ str_0_address0 sc_out sc_lv 12 signal 0 } 
	{ str_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ str_0_q0 sc_in sc_lv 32 signal 0 } 
	{ str_1_address0 sc_out sc_lv 12 signal 1 } 
	{ str_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ str_1_q0 sc_in sc_lv 32 signal 1 } 
	{ str_2_address0 sc_out sc_lv 12 signal 2 } 
	{ str_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ str_2_q0 sc_in sc_lv 32 signal 2 } 
	{ str_3_address0 sc_out sc_lv 12 signal 3 } 
	{ str_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ str_3_q0 sc_in sc_lv 32 signal 3 } 
	{ str_4_address0 sc_out sc_lv 12 signal 4 } 
	{ str_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ str_4_q0 sc_in sc_lv 32 signal 4 } 
	{ str_5_address0 sc_out sc_lv 12 signal 5 } 
	{ str_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ str_5_q0 sc_in sc_lv 32 signal 5 } 
	{ str_6_address0 sc_out sc_lv 12 signal 6 } 
	{ str_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ str_6_q0 sc_in sc_lv 32 signal 6 } 
	{ str_7_address0 sc_out sc_lv 12 signal 7 } 
	{ str_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ str_7_q0 sc_in sc_lv 32 signal 7 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "str_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_0", "role": "address0" }} , 
 	{ "name": "str_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_0", "role": "ce0" }} , 
 	{ "name": "str_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_0", "role": "q0" }} , 
 	{ "name": "str_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_1", "role": "address0" }} , 
 	{ "name": "str_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_1", "role": "ce0" }} , 
 	{ "name": "str_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_1", "role": "q0" }} , 
 	{ "name": "str_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_2", "role": "address0" }} , 
 	{ "name": "str_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_2", "role": "ce0" }} , 
 	{ "name": "str_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_2", "role": "q0" }} , 
 	{ "name": "str_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_3", "role": "address0" }} , 
 	{ "name": "str_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_3", "role": "ce0" }} , 
 	{ "name": "str_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_3", "role": "q0" }} , 
 	{ "name": "str_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_4", "role": "address0" }} , 
 	{ "name": "str_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_4", "role": "ce0" }} , 
 	{ "name": "str_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_4", "role": "q0" }} , 
 	{ "name": "str_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_5", "role": "address0" }} , 
 	{ "name": "str_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_5", "role": "ce0" }} , 
 	{ "name": "str_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_5", "role": "q0" }} , 
 	{ "name": "str_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_6", "role": "address0" }} , 
 	{ "name": "str_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_6", "role": "ce0" }} , 
 	{ "name": "str_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_6", "role": "q0" }} , 
 	{ "name": "str_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "str_7", "role": "address0" }} , 
 	{ "name": "str_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "str_7", "role": "ce0" }} , 
 	{ "name": "str_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "str_7", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15"],
		"CDFG" : "substring",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "98343", "EstimateLatencyMax" : "98343",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_substring_Pipeline_loop_0_VITIS_LOOP_31_1_fu_82", "Port" : "str_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "str_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_substring_Pipeline_loop_1_VITIS_LOOP_49_2_fu_91", "Port" : "str_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1", "SubInstance" : "grp_substring_Pipeline_loop_0_VITIS_LOOP_31_1_fu_82", "Port" : "str_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "str_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_substring_Pipeline_loop_1_VITIS_LOOP_49_2_fu_91", "Port" : "str_2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "5", "SubInstance" : "grp_substring_Pipeline_loop_2_VITIS_LOOP_67_3_fu_100", "Port" : "str_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "str_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_substring_Pipeline_loop_2_VITIS_LOOP_67_3_fu_100", "Port" : "str_3", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "7", "SubInstance" : "grp_substring_Pipeline_loop_3_VITIS_LOOP_85_4_fu_109", "Port" : "str_3", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "str_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_substring_Pipeline_loop_3_VITIS_LOOP_85_4_fu_109", "Port" : "str_4", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_substring_Pipeline_loop_4_VITIS_LOOP_103_5_fu_118", "Port" : "str_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "str_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_substring_Pipeline_loop_4_VITIS_LOOP_103_5_fu_118", "Port" : "str_5", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "11", "SubInstance" : "grp_substring_Pipeline_loop_5_VITIS_LOOP_121_6_fu_127", "Port" : "str_5", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "str_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_substring_Pipeline_loop_5_VITIS_LOOP_121_6_fu_127", "Port" : "str_6", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "13", "SubInstance" : "grp_substring_Pipeline_loop_6_VITIS_LOOP_139_7_fu_136", "Port" : "str_6", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "str_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_substring_Pipeline_loop_6_VITIS_LOOP_139_7_fu_136", "Port" : "str_7", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "15", "SubInstance" : "grp_substring_Pipeline_loop_7_VITIS_LOOP_157_8_fu_145", "Port" : "str_7", "Inst_start_state" : "15", "Inst_end_state" : "16"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_0_VITIS_LOOP_31_1_fu_82", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "substring_Pipeline_loop_0_VITIS_LOOP_31_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_11_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0_VITIS_LOOP_31_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_0_VITIS_LOOP_31_1_fu_82.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_1_VITIS_LOOP_49_2_fu_91", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "substring_Pipeline_loop_1_VITIS_LOOP_49_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_1_VITIS_LOOP_49_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_1_VITIS_LOOP_49_2_fu_91.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_2_VITIS_LOOP_67_3_fu_100", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "substring_Pipeline_loop_2_VITIS_LOOP_67_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_13_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_2_VITIS_LOOP_67_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_2_VITIS_LOOP_67_3_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_3_VITIS_LOOP_85_4_fu_109", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "substring_Pipeline_loop_3_VITIS_LOOP_85_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_3_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_3_VITIS_LOOP_85_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_3_VITIS_LOOP_85_4_fu_109.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_4_VITIS_LOOP_103_5_fu_118", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "substring_Pipeline_loop_4_VITIS_LOOP_103_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_4_VITIS_LOOP_103_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_4_VITIS_LOOP_103_5_fu_118.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_5_VITIS_LOOP_121_6_fu_127", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "substring_Pipeline_loop_5_VITIS_LOOP_121_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_5_16_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_5_VITIS_LOOP_121_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_5_VITIS_LOOP_121_6_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_6_VITIS_LOOP_139_7_fu_136", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "substring_Pipeline_loop_6_VITIS_LOOP_139_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12292", "EstimateLatencyMax" : "12292",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "str_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_17_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_6_VITIS_LOOP_139_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_6_VITIS_LOOP_139_7_fu_136.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_7_VITIS_LOOP_157_8_fu_145", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "substring_Pipeline_loop_7_VITIS_LOOP_157_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12283", "EstimateLatencyMax" : "12283",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "str_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_7_VITIS_LOOP_157_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_substring_Pipeline_loop_7_VITIS_LOOP_157_8_fu_145.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"}]}


set ArgLastReadFirstWriteLatency {
	substring {
		str_0 {Type I LastRead 1 FirstWrite -1}
		str_1 {Type I LastRead 1 FirstWrite -1}
		str_2 {Type I LastRead 1 FirstWrite -1}
		str_3 {Type I LastRead 1 FirstWrite -1}
		str_4 {Type I LastRead 1 FirstWrite -1}
		str_5 {Type I LastRead 1 FirstWrite -1}
		str_6 {Type I LastRead 1 FirstWrite -1}
		str_7 {Type I LastRead 1 FirstWrite -1}}
	substring_Pipeline_loop_0_VITIS_LOOP_31_1 {
		str_0 {Type I LastRead 1 FirstWrite -1}
		str_1 {Type I LastRead 1 FirstWrite -1}
		s_0_11_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_1_VITIS_LOOP_49_2 {
		str_1 {Type I LastRead 1 FirstWrite -1}
		str_2 {Type I LastRead 1 FirstWrite -1}
		s_1_12_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_2_VITIS_LOOP_67_3 {
		str_2 {Type I LastRead 1 FirstWrite -1}
		str_3 {Type I LastRead 1 FirstWrite -1}
		s_2_13_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_3_VITIS_LOOP_85_4 {
		str_3 {Type I LastRead 1 FirstWrite -1}
		str_4 {Type I LastRead 1 FirstWrite -1}
		s_3_14_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_4_VITIS_LOOP_103_5 {
		str_4 {Type I LastRead 1 FirstWrite -1}
		str_5 {Type I LastRead 1 FirstWrite -1}
		s_4_15_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_5_VITIS_LOOP_121_6 {
		str_5 {Type I LastRead 1 FirstWrite -1}
		str_6 {Type I LastRead 1 FirstWrite -1}
		s_5_16_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_6_VITIS_LOOP_139_7 {
		str_6 {Type I LastRead 1 FirstWrite -1}
		str_7 {Type I LastRead 1 FirstWrite -1}
		s_6_17_out {Type O LastRead -1 FirstWrite 2}}
	substring_Pipeline_loop_7_VITIS_LOOP_157_8 {
		str_7 {Type I LastRead 1 FirstWrite -1}
		s_7_18_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "98343", "Max" : "98343"}
	, {"Name" : "Interval", "Min" : "98344", "Max" : "98344"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	str_0 { ap_memory {  { str_0_address0 mem_address 1 12 }  { str_0_ce0 mem_ce 1 1 }  { str_0_q0 mem_dout 0 32 } } }
	str_1 { ap_memory {  { str_1_address0 mem_address 1 12 }  { str_1_ce0 mem_ce 1 1 }  { str_1_q0 mem_dout 0 32 } } }
	str_2 { ap_memory {  { str_2_address0 mem_address 1 12 }  { str_2_ce0 mem_ce 1 1 }  { str_2_q0 mem_dout 0 32 } } }
	str_3 { ap_memory {  { str_3_address0 mem_address 1 12 }  { str_3_ce0 mem_ce 1 1 }  { str_3_q0 mem_dout 0 32 } } }
	str_4 { ap_memory {  { str_4_address0 mem_address 1 12 }  { str_4_ce0 mem_ce 1 1 }  { str_4_q0 mem_dout 0 32 } } }
	str_5 { ap_memory {  { str_5_address0 mem_address 1 12 }  { str_5_ce0 mem_ce 1 1 }  { str_5_q0 mem_dout 0 32 } } }
	str_6 { ap_memory {  { str_6_address0 mem_address 1 12 }  { str_6_ce0 mem_ce 1 1 }  { str_6_q0 mem_dout 0 32 } } }
	str_7 { ap_memory {  { str_7_address0 mem_address 1 12 }  { str_7_ce0 mem_ce 1 1 }  { str_7_q0 mem_dout 0 32 } } }
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
