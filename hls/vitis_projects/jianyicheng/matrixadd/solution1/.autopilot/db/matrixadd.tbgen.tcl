set moduleName matrixadd
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
set C_modelName {matrixadd}
set C_modelType { float 32 }
set C_modelArgList {
	{ array_0 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_1 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_2 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_3 int 32 unused {array 8192 { } 0 1 }  }
	{ array_4 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_5 int 32 unused {array 8192 { } 0 1 }  }
	{ array_6 int 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ array_7 int 32 regular {array 8192 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "array_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_3", "interface" : "memory", "bitwidth" : 32, "direction" : "NONE"} , 
 	{ "Name" : "array_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_5", "interface" : "memory", "bitwidth" : 32, "direction" : "NONE"} , 
 	{ "Name" : "array_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "array_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 45
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ array_0_address0 sc_out sc_lv 13 signal 0 } 
	{ array_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ array_0_q0 sc_in sc_lv 32 signal 0 } 
	{ array_1_address0 sc_out sc_lv 13 signal 1 } 
	{ array_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ array_1_q0 sc_in sc_lv 32 signal 1 } 
	{ array_2_address0 sc_out sc_lv 13 signal 2 } 
	{ array_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ array_2_q0 sc_in sc_lv 32 signal 2 } 
	{ array_3_address0 sc_out sc_lv 13 signal 3 } 
	{ array_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ array_3_we0 sc_out sc_logic 1 signal 3 } 
	{ array_3_d0 sc_out sc_lv 32 signal 3 } 
	{ array_3_q0 sc_in sc_lv 32 signal 3 } 
	{ array_3_address1 sc_out sc_lv 13 signal 3 } 
	{ array_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ array_3_we1 sc_out sc_logic 1 signal 3 } 
	{ array_3_d1 sc_out sc_lv 32 signal 3 } 
	{ array_3_q1 sc_in sc_lv 32 signal 3 } 
	{ array_4_address0 sc_out sc_lv 13 signal 4 } 
	{ array_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ array_4_q0 sc_in sc_lv 32 signal 4 } 
	{ array_5_address0 sc_out sc_lv 13 signal 5 } 
	{ array_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ array_5_we0 sc_out sc_logic 1 signal 5 } 
	{ array_5_d0 sc_out sc_lv 32 signal 5 } 
	{ array_5_q0 sc_in sc_lv 32 signal 5 } 
	{ array_5_address1 sc_out sc_lv 13 signal 5 } 
	{ array_5_ce1 sc_out sc_logic 1 signal 5 } 
	{ array_5_we1 sc_out sc_logic 1 signal 5 } 
	{ array_5_d1 sc_out sc_lv 32 signal 5 } 
	{ array_5_q1 sc_in sc_lv 32 signal 5 } 
	{ array_6_address0 sc_out sc_lv 13 signal 6 } 
	{ array_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ array_6_q0 sc_in sc_lv 32 signal 6 } 
	{ array_7_address0 sc_out sc_lv 13 signal 7 } 
	{ array_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ array_7_q0 sc_in sc_lv 32 signal 7 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "array_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_0", "role": "address0" }} , 
 	{ "name": "array_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_0", "role": "ce0" }} , 
 	{ "name": "array_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_0", "role": "q0" }} , 
 	{ "name": "array_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_1", "role": "address0" }} , 
 	{ "name": "array_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_1", "role": "ce0" }} , 
 	{ "name": "array_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_1", "role": "q0" }} , 
 	{ "name": "array_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_2", "role": "address0" }} , 
 	{ "name": "array_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_2", "role": "ce0" }} , 
 	{ "name": "array_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_2", "role": "q0" }} , 
 	{ "name": "array_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_3", "role": "address0" }} , 
 	{ "name": "array_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "ce0" }} , 
 	{ "name": "array_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "we0" }} , 
 	{ "name": "array_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "d0" }} , 
 	{ "name": "array_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "q0" }} , 
 	{ "name": "array_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_3", "role": "address1" }} , 
 	{ "name": "array_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "ce1" }} , 
 	{ "name": "array_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_3", "role": "we1" }} , 
 	{ "name": "array_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "d1" }} , 
 	{ "name": "array_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_3", "role": "q1" }} , 
 	{ "name": "array_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_4", "role": "address0" }} , 
 	{ "name": "array_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_4", "role": "ce0" }} , 
 	{ "name": "array_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_4", "role": "q0" }} , 
 	{ "name": "array_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_5", "role": "address0" }} , 
 	{ "name": "array_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "ce0" }} , 
 	{ "name": "array_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "we0" }} , 
 	{ "name": "array_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "d0" }} , 
 	{ "name": "array_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "q0" }} , 
 	{ "name": "array_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_5", "role": "address1" }} , 
 	{ "name": "array_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "ce1" }} , 
 	{ "name": "array_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_5", "role": "we1" }} , 
 	{ "name": "array_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "d1" }} , 
 	{ "name": "array_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_5", "role": "q1" }} , 
 	{ "name": "array_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_6", "role": "address0" }} , 
 	{ "name": "array_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_6", "role": "ce0" }} , 
 	{ "name": "array_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_6", "role": "q0" }} , 
 	{ "name": "array_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "array_7", "role": "address0" }} , 
 	{ "name": "array_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "array_7", "role": "ce0" }} , 
 	{ "name": "array_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "array_7", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "8", "12", "16", "20", "24"],
		"CDFG" : "matrixadd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49191", "EstimateLatencyMax" : "49191",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_matrixadd_Pipeline_loop_0_fu_72", "Port" : "array_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_matrixadd_Pipeline_loop_1_fu_79", "Port" : "array_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_matrixadd_Pipeline_loop_2_fu_86", "Port" : "array_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_3", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_matrixadd_Pipeline_loop_3_fu_93", "Port" : "array_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_5", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_matrixadd_Pipeline_loop_5_fu_100", "Port" : "array_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_matrixadd_Pipeline_loop_7_fu_107", "Port" : "array_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_0_fu_72", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "matrixadd_Pipeline_loop_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_0_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_0_fu_72.fcmp_32ns_32ns_1_2_no_dsp_1_U2", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_0_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_1_fu_79", "Parent" : "0", "Child" : ["5", "6", "7"],
		"CDFG" : "matrixadd_Pipeline_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_1_fu_79.fadd_32ns_32ns_32_5_full_dsp_1_U6", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_1_fu_79.fcmp_32ns_32ns_1_2_no_dsp_1_U7", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_1_fu_79.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_2_fu_86", "Parent" : "0", "Child" : ["9", "10", "11"],
		"CDFG" : "matrixadd_Pipeline_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_2_fu_86.fadd_32ns_32ns_32_5_full_dsp_1_U10", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_2_fu_86.fcmp_32ns_32ns_1_2_no_dsp_1_U11", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_2_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_3_fu_93", "Parent" : "0", "Child" : ["13", "14", "15"],
		"CDFG" : "matrixadd_Pipeline_loop_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_3_fu_93.fadd_32ns_32ns_32_5_full_dsp_1_U14", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_3_fu_93.fcmp_32ns_32ns_1_2_no_dsp_1_U15", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_3_fu_93.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_5_fu_100", "Parent" : "0", "Child" : ["17", "18", "19"],
		"CDFG" : "matrixadd_Pipeline_loop_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_5_fu_100.fadd_32ns_32ns_32_5_full_dsp_1_U18", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_5_fu_100.fcmp_32ns_32ns_1_2_no_dsp_1_U19", "Parent" : "16"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_5_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_7_fu_107", "Parent" : "0", "Child" : ["21", "22", "23"],
		"CDFG" : "matrixadd_Pipeline_loop_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49155", "EstimateLatencyMax" : "49155",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "array_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_7_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loop_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_7_fu_107.fadd_32ns_32ns_32_5_full_dsp_1_U22", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_7_fu_107.fcmp_32ns_32ns_1_2_no_dsp_1_U23", "Parent" : "20"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixadd_Pipeline_loop_7_fu_107.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U26", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matrixadd {
		array_0 {Type I LastRead 0 FirstWrite -1}
		array_1 {Type I LastRead 0 FirstWrite -1}
		array_2 {Type I LastRead 0 FirstWrite -1}
		array_3 {Type X LastRead -1 FirstWrite -1}
		array_4 {Type I LastRead 0 FirstWrite -1}
		array_5 {Type X LastRead -1 FirstWrite -1}
		array_6 {Type I LastRead 0 FirstWrite -1}
		array_7 {Type I LastRead 0 FirstWrite -1}}
	matrixadd_Pipeline_loop_0 {
		array_0 {Type I LastRead 0 FirstWrite -1}
		s_0_out {Type O LastRead -1 FirstWrite 1}}
	matrixadd_Pipeline_loop_1 {
		array_1 {Type I LastRead 0 FirstWrite -1}
		s_1_out {Type O LastRead -1 FirstWrite 1}}
	matrixadd_Pipeline_loop_2 {
		array_2 {Type I LastRead 0 FirstWrite -1}
		s_2_out {Type O LastRead -1 FirstWrite 1}}
	matrixadd_Pipeline_loop_3 {
		array_4 {Type I LastRead 0 FirstWrite -1}
		s_4_out {Type O LastRead -1 FirstWrite 1}}
	matrixadd_Pipeline_loop_5 {
		array_6 {Type I LastRead 0 FirstWrite -1}
		s_6_out {Type O LastRead -1 FirstWrite 1}}
	matrixadd_Pipeline_loop_7 {
		array_7 {Type I LastRead 0 FirstWrite -1}
		s_7_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "49191", "Max" : "49191"}
	, {"Name" : "Interval", "Min" : "49192", "Max" : "49192"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	array_0 { ap_memory {  { array_0_address0 mem_address 1 13 }  { array_0_ce0 mem_ce 1 1 }  { array_0_q0 mem_dout 0 32 } } }
	array_1 { ap_memory {  { array_1_address0 mem_address 1 13 }  { array_1_ce0 mem_ce 1 1 }  { array_1_q0 mem_dout 0 32 } } }
	array_2 { ap_memory {  { array_2_address0 mem_address 1 13 }  { array_2_ce0 mem_ce 1 1 }  { array_2_q0 mem_dout 0 32 } } }
	array_3 { ap_memory {  { array_3_address0 mem_address 1 13 }  { array_3_ce0 mem_ce 1 1 }  { array_3_we0 mem_we 1 1 }  { array_3_d0 mem_din 1 32 }  { array_3_q0 mem_dout 0 32 }  { array_3_address1 MemPortADDR2 1 13 }  { array_3_ce1 MemPortCE2 1 1 }  { array_3_we1 MemPortWE2 1 1 }  { array_3_d1 MemPortDIN2 1 32 }  { array_3_q1 MemPortDOUT2 0 32 } } }
	array_4 { ap_memory {  { array_4_address0 mem_address 1 13 }  { array_4_ce0 mem_ce 1 1 }  { array_4_q0 mem_dout 0 32 } } }
	array_5 { ap_memory {  { array_5_address0 mem_address 1 13 }  { array_5_ce0 mem_ce 1 1 }  { array_5_we0 mem_we 1 1 }  { array_5_d0 mem_din 1 32 }  { array_5_q0 mem_dout 0 32 }  { array_5_address1 MemPortADDR2 1 13 }  { array_5_ce1 MemPortCE2 1 1 }  { array_5_we1 MemPortWE2 1 1 }  { array_5_d1 MemPortDIN2 1 32 }  { array_5_q1 MemPortDOUT2 0 32 } } }
	array_6 { ap_memory {  { array_6_address0 mem_address 1 13 }  { array_6_ce0 mem_ce 1 1 }  { array_6_q0 mem_dout 0 32 } } }
	array_7 { ap_memory {  { array_7_address0 mem_address 1 13 }  { array_7_ce0 mem_ce 1 1 }  { array_7_q0 mem_dout 0 32 } } }
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
