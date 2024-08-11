set moduleName gemver
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
set C_modelName {gemver}
set C_modelType { void 0 }
set C_modelArgList {
	{ A int 32 regular {array 65536 { 2 1 } 1 1 }  }
	{ u1 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ v1 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ u2 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ v2 int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ w int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ x int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ y int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ z int 32 regular {array 256 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "u1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "u2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "w", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "x", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "z", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 42
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
	{ A_q0 sc_in sc_lv 32 signal 0 } 
	{ A_address1 sc_out sc_lv 16 signal 0 } 
	{ A_ce1 sc_out sc_logic 1 signal 0 } 
	{ A_q1 sc_in sc_lv 32 signal 0 } 
	{ u1_address0 sc_out sc_lv 8 signal 1 } 
	{ u1_ce0 sc_out sc_logic 1 signal 1 } 
	{ u1_q0 sc_in sc_lv 32 signal 1 } 
	{ v1_address0 sc_out sc_lv 8 signal 2 } 
	{ v1_ce0 sc_out sc_logic 1 signal 2 } 
	{ v1_q0 sc_in sc_lv 32 signal 2 } 
	{ u2_address0 sc_out sc_lv 8 signal 3 } 
	{ u2_ce0 sc_out sc_logic 1 signal 3 } 
	{ u2_q0 sc_in sc_lv 32 signal 3 } 
	{ v2_address0 sc_out sc_lv 8 signal 4 } 
	{ v2_ce0 sc_out sc_logic 1 signal 4 } 
	{ v2_q0 sc_in sc_lv 32 signal 4 } 
	{ w_address0 sc_out sc_lv 8 signal 5 } 
	{ w_ce0 sc_out sc_logic 1 signal 5 } 
	{ w_we0 sc_out sc_logic 1 signal 5 } 
	{ w_d0 sc_out sc_lv 32 signal 5 } 
	{ w_q0 sc_in sc_lv 32 signal 5 } 
	{ x_address0 sc_out sc_lv 8 signal 6 } 
	{ x_ce0 sc_out sc_logic 1 signal 6 } 
	{ x_we0 sc_out sc_logic 1 signal 6 } 
	{ x_d0 sc_out sc_lv 32 signal 6 } 
	{ x_q0 sc_in sc_lv 32 signal 6 } 
	{ y_address0 sc_out sc_lv 8 signal 7 } 
	{ y_ce0 sc_out sc_logic 1 signal 7 } 
	{ y_q0 sc_in sc_lv 32 signal 7 } 
	{ z_address0 sc_out sc_lv 8 signal 8 } 
	{ z_ce0 sc_out sc_logic 1 signal 8 } 
	{ z_q0 sc_in sc_lv 32 signal 8 } 
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
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "A_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "A", "role": "address1" }} , 
 	{ "name": "A_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce1" }} , 
 	{ "name": "A_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q1" }} , 
 	{ "name": "u1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u1", "role": "address0" }} , 
 	{ "name": "u1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u1", "role": "ce0" }} , 
 	{ "name": "u1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u1", "role": "q0" }} , 
 	{ "name": "v1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v1", "role": "address0" }} , 
 	{ "name": "v1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v1", "role": "ce0" }} , 
 	{ "name": "v1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v1", "role": "q0" }} , 
 	{ "name": "u2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "u2", "role": "address0" }} , 
 	{ "name": "u2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "u2", "role": "ce0" }} , 
 	{ "name": "u2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "u2", "role": "q0" }} , 
 	{ "name": "v2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "v2", "role": "address0" }} , 
 	{ "name": "v2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v2", "role": "ce0" }} , 
 	{ "name": "v2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v2", "role": "q0" }} , 
 	{ "name": "w_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "w", "role": "address0" }} , 
 	{ "name": "w_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "ce0" }} , 
 	{ "name": "w_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "we0" }} , 
 	{ "name": "w_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w", "role": "d0" }} , 
 	{ "name": "w_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w", "role": "q0" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "we0" }} , 
 	{ "name": "x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "d0" }} , 
 	{ "name": "x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "q0" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "q0" }} , 
 	{ "name": "z_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "z", "role": "address0" }} , 
 	{ "name": "z_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "z", "role": "ce0" }} , 
 	{ "name": "z_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "z", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "5", "7", "9", "10"],
		"CDFG" : "gemver",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "852019", "EstimateLatencyMax" : "852019",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Port" : "A", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "7", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_35_3_loop_4_fu_66", "Port" : "A", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "5", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54", "Port" : "A", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "u1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Port" : "u1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "v1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Port" : "v1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "u2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Port" : "u2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "v2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Port" : "v2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "w", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_35_3_loop_4_fu_66", "Port" : "w", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_35_3_loop_4_fu_66", "Port" : "x", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "5", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "y", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54", "Port" : "y", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "z", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54", "Port" : "z", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40", "Parent" : "0", "Child" : ["2", "3", "4"],
		"CDFG" : "gemver_Pipeline_VITIS_LOOP_14_1_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65553", "EstimateLatencyMax" : "65553",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "u1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "u2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1_loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter17", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter17", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40.fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40.fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_14_1_loop_2_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "gemver_Pipeline_VITIS_LOOP_23_2_loop_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "393233", "EstimateLatencyMax" : "393233",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "z", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_23_2_loop_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_23_2_loop_3_fu_54.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_35_3_loop_4_fu_66", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "gemver_Pipeline_VITIS_LOOP_35_3_loop_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "393228", "EstimateLatencyMax" : "393228",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "w", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_35_3_loop_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemver_Pipeline_VITIS_LOOP_35_3_loop_4_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U23", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U24", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	gemver {
		A {Type IO LastRead 10 FirstWrite -1}
		u1 {Type I LastRead 1 FirstWrite -1}
		v1 {Type I LastRead 1 FirstWrite -1}
		u2 {Type I LastRead 1 FirstWrite -1}
		v2 {Type I LastRead 1 FirstWrite -1}
		w {Type IO LastRead 6 FirstWrite 16}
		x {Type IO LastRead 7 FirstWrite -1}
		y {Type I LastRead 1 FirstWrite -1}
		z {Type I LastRead 13 FirstWrite -1}}
	gemver_Pipeline_VITIS_LOOP_14_1_loop_2 {
		u1 {Type I LastRead 1 FirstWrite -1}
		u2 {Type I LastRead 1 FirstWrite -1}
		v1 {Type I LastRead 1 FirstWrite -1}
		v2 {Type I LastRead 1 FirstWrite -1}
		A {Type IO LastRead 10 FirstWrite 17}}
	gemver_Pipeline_VITIS_LOOP_23_2_loop_3 {
		A {Type I LastRead 2 FirstWrite -1}
		y {Type I LastRead 1 FirstWrite -1}
		z {Type I LastRead 13 FirstWrite -1}
		x {Type IO LastRead 7 FirstWrite 22}}
	gemver_Pipeline_VITIS_LOOP_35_3_loop_4 {
		A {Type I LastRead 1 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		w {Type IO LastRead 6 FirstWrite 16}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "852019", "Max" : "852019"}
	, {"Name" : "Interval", "Min" : "852020", "Max" : "852020"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 16 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 }  { A_q0 mem_dout 0 32 }  { A_address1 MemPortADDR2 1 16 }  { A_ce1 MemPortCE2 1 1 }  { A_q1 MemPortDOUT2 0 32 } } }
	u1 { ap_memory {  { u1_address0 mem_address 1 8 }  { u1_ce0 mem_ce 1 1 }  { u1_q0 mem_dout 0 32 } } }
	v1 { ap_memory {  { v1_address0 mem_address 1 8 }  { v1_ce0 mem_ce 1 1 }  { v1_q0 mem_dout 0 32 } } }
	u2 { ap_memory {  { u2_address0 mem_address 1 8 }  { u2_ce0 mem_ce 1 1 }  { u2_q0 mem_dout 0 32 } } }
	v2 { ap_memory {  { v2_address0 mem_address 1 8 }  { v2_ce0 mem_ce 1 1 }  { v2_q0 mem_dout 0 32 } } }
	w { ap_memory {  { w_address0 mem_address 1 8 }  { w_ce0 mem_ce 1 1 }  { w_we0 mem_we 1 1 }  { w_d0 mem_din 1 32 }  { w_q0 mem_dout 0 32 } } }
	x { ap_memory {  { x_address0 mem_address 1 8 }  { x_ce0 mem_ce 1 1 }  { x_we0 mem_we 1 1 }  { x_d0 mem_din 1 32 }  { x_q0 mem_dout 0 32 } } }
	y { ap_memory {  { y_address0 mem_address 1 8 }  { y_ce0 mem_ce 1 1 }  { y_q0 mem_dout 0 32 } } }
	z { ap_memory {  { z_address0 mem_address 1 8 }  { z_ce0 mem_ce 1 1 }  { z_q0 mem_dout 0 32 } } }
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
