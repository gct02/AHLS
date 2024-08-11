set moduleName covariance
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
set C_modelName {covariance}
set C_modelType { void 0 }
set C_modelArgList {
	{ data int 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ cov int 32 regular {array 1024 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "data", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "cov", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_address0 sc_out sc_lv 10 signal 0 } 
	{ data_ce0 sc_out sc_logic 1 signal 0 } 
	{ data_we0 sc_out sc_logic 1 signal 0 } 
	{ data_d0 sc_out sc_lv 32 signal 0 } 
	{ data_q0 sc_in sc_lv 32 signal 0 } 
	{ data_address1 sc_out sc_lv 10 signal 0 } 
	{ data_ce1 sc_out sc_logic 1 signal 0 } 
	{ data_we1 sc_out sc_logic 1 signal 0 } 
	{ data_d1 sc_out sc_lv 32 signal 0 } 
	{ data_q1 sc_in sc_lv 32 signal 0 } 
	{ cov_address0 sc_out sc_lv 10 signal 1 } 
	{ cov_ce0 sc_out sc_logic 1 signal 1 } 
	{ cov_we0 sc_out sc_logic 1 signal 1 } 
	{ cov_d0 sc_out sc_lv 32 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address0" }} , 
 	{ "name": "data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce0" }} , 
 	{ "name": "data_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "we0" }} , 
 	{ "name": "data_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "d0" }} , 
 	{ "name": "data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q0" }} , 
 	{ "name": "data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data", "role": "address1" }} , 
 	{ "name": "data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "ce1" }} , 
 	{ "name": "data_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data", "role": "we1" }} , 
 	{ "name": "data_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "d1" }} , 
 	{ "name": "data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "q1" }} , 
 	{ "name": "cov_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "cov", "role": "address0" }} , 
 	{ "name": "cov_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cov", "role": "ce0" }} , 
 	{ "name": "cov_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cov", "role": "we0" }} , 
 	{ "name": "cov_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cov", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "26", "29", "30"],
		"CDFG" : "covariance",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12005", "EstimateLatencyMax" : "43749",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67", "Port" : "data", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "26", "SubInstance" : "grp_covariance_Pipeline_VITIS_LOOP_24_3_fu_73", "Port" : "data", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "cov", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_covariance_Pipeline_VITIS_LOOP_24_3_fu_73", "Port" : "cov", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_22_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"],
		"CDFG" : "covariance_Pipeline_VITIS_LOOP_10_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6147", "EstimateLatencyMax" : "6147",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_10_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "192", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U3", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U4", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U5", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U6", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U7", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U8", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U9", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U10", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U11", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U12", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U13", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U14", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U15", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U16", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U17", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U18", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U19", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U20", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U21", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U22", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U23", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.fsub_32ns_32ns_32_5_full_dsp_1_U24", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_10_1_fu_67.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_24_3_fu_73", "Parent" : "0", "Child" : ["27", "28"],
		"CDFG" : "covariance_Pipeline_VITIS_LOOP_24_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "1171",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "i", "Type" : "None", "Direction" : "I"},
			{"Name" : "jj_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bitcast_ln28", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "cov", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_24_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "32", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage17", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage17_subdone", "QuitState" : "ap_ST_fsm_pp0_stage17", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage17_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_24_3_fu_73.fmul_32ns_32ns_32_4_max_dsp_1_U29", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_covariance_Pipeline_VITIS_LOOP_24_3_fu_73.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U41", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_10_no_dsp_1_U42", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	covariance {
		data {Type IO LastRead 32 FirstWrite -1}
		cov {Type O LastRead -1 FirstWrite 176}}
	covariance_Pipeline_VITIS_LOOP_10_1 {
		data {Type IO LastRead 17 FirstWrite 177}}
	covariance_Pipeline_VITIS_LOOP_24_3 {
		i {Type I LastRead 0 FirstWrite -1}
		jj_2 {Type I LastRead 0 FirstWrite -1}
		data {Type I LastRead 32 FirstWrite -1}
		bitcast_ln28 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_1 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		cov {Type O LastRead -1 FirstWrite 176}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12005", "Max" : "43749"}
	, {"Name" : "Interval", "Min" : "12006", "Max" : "43750"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	data { ap_memory {  { data_address0 mem_address 1 10 }  { data_ce0 mem_ce 1 1 }  { data_we0 mem_we 1 1 }  { data_d0 mem_din 1 32 }  { data_q0 mem_dout 0 32 }  { data_address1 MemPortADDR2 1 10 }  { data_ce1 MemPortCE2 1 1 }  { data_we1 MemPortWE2 1 1 }  { data_d1 MemPortDIN2 1 32 }  { data_q1 MemPortDOUT2 0 32 } } }
	cov { ap_memory {  { cov_address0 mem_address 1 10 }  { cov_ce0 mem_ce 1 1 }  { cov_we0 mem_we 1 1 }  { cov_d0 mem_din 1 32 } } }
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
