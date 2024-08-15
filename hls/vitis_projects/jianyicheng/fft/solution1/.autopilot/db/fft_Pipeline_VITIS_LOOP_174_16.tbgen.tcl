set moduleName fft_Pipeline_VITIS_LOOP_174_16
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fft_Pipeline_VITIS_LOOP_174_16}
set C_modelType { void 0 }
set C_modelArgList {
	{ numBF_7 int 8 regular  }
	{ zext_ln174 int 4 regular  }
	{ select_ln171_1 int 1 regular  }
	{ X_R_7 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ X_I_7 float 32 regular {array 1024 { 2 2 } 1 1 }  }
	{ cos_coefficients_table float 32 regular {array 512 { 1 } 1 1 } {global 0}  }
	{ sin_coefficients_table float 32 regular {array 512 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "numBF_7", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln174", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln171_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "X_R_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "cos_coefficients_table", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sin_coefficients_table", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ numBF_7 sc_in sc_lv 8 signal 0 } 
	{ zext_ln174 sc_in sc_lv 4 signal 1 } 
	{ select_ln171_1 sc_in sc_lv 1 signal 2 } 
	{ X_R_7_address0 sc_out sc_lv 10 signal 3 } 
	{ X_R_7_ce0 sc_out sc_logic 1 signal 3 } 
	{ X_R_7_we0 sc_out sc_logic 1 signal 3 } 
	{ X_R_7_d0 sc_out sc_lv 32 signal 3 } 
	{ X_R_7_q0 sc_in sc_lv 32 signal 3 } 
	{ X_R_7_address1 sc_out sc_lv 10 signal 3 } 
	{ X_R_7_ce1 sc_out sc_logic 1 signal 3 } 
	{ X_R_7_we1 sc_out sc_logic 1 signal 3 } 
	{ X_R_7_d1 sc_out sc_lv 32 signal 3 } 
	{ X_R_7_q1 sc_in sc_lv 32 signal 3 } 
	{ X_I_7_address0 sc_out sc_lv 10 signal 4 } 
	{ X_I_7_ce0 sc_out sc_logic 1 signal 4 } 
	{ X_I_7_we0 sc_out sc_logic 1 signal 4 } 
	{ X_I_7_d0 sc_out sc_lv 32 signal 4 } 
	{ X_I_7_q0 sc_in sc_lv 32 signal 4 } 
	{ X_I_7_address1 sc_out sc_lv 10 signal 4 } 
	{ X_I_7_ce1 sc_out sc_logic 1 signal 4 } 
	{ X_I_7_we1 sc_out sc_logic 1 signal 4 } 
	{ X_I_7_d1 sc_out sc_lv 32 signal 4 } 
	{ X_I_7_q1 sc_in sc_lv 32 signal 4 } 
	{ cos_coefficients_table_address0 sc_out sc_lv 9 signal 5 } 
	{ cos_coefficients_table_ce0 sc_out sc_logic 1 signal 5 } 
	{ cos_coefficients_table_q0 sc_in sc_lv 32 signal 5 } 
	{ sin_coefficients_table_address0 sc_out sc_lv 9 signal 6 } 
	{ sin_coefficients_table_ce0 sc_out sc_logic 1 signal 6 } 
	{ sin_coefficients_table_q0 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_1648_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1648_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1648_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1648_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1648_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1652_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1652_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1652_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1652_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1652_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1656_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1656_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1656_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1656_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1660_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1660_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1660_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1660_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1664_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1664_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1664_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1664_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1668_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1668_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1668_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1668_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "numBF_7", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "numBF_7", "role": "default" }} , 
 	{ "name": "zext_ln174", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln174", "role": "default" }} , 
 	{ "name": "select_ln171_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "select_ln171_1", "role": "default" }} , 
 	{ "name": "X_R_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_7", "role": "address0" }} , 
 	{ "name": "X_R_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "ce0" }} , 
 	{ "name": "X_R_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "we0" }} , 
 	{ "name": "X_R_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "d0" }} , 
 	{ "name": "X_R_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "q0" }} , 
 	{ "name": "X_R_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_7", "role": "address1" }} , 
 	{ "name": "X_R_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "ce1" }} , 
 	{ "name": "X_R_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_7", "role": "we1" }} , 
 	{ "name": "X_R_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "d1" }} , 
 	{ "name": "X_R_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_7", "role": "q1" }} , 
 	{ "name": "X_I_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_7", "role": "address0" }} , 
 	{ "name": "X_I_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "ce0" }} , 
 	{ "name": "X_I_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "we0" }} , 
 	{ "name": "X_I_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "d0" }} , 
 	{ "name": "X_I_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "q0" }} , 
 	{ "name": "X_I_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_7", "role": "address1" }} , 
 	{ "name": "X_I_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "ce1" }} , 
 	{ "name": "X_I_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_7", "role": "we1" }} , 
 	{ "name": "X_I_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "d1" }} , 
 	{ "name": "X_I_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_7", "role": "q1" }} , 
 	{ "name": "cos_coefficients_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "address0" }} , 
 	{ "name": "cos_coefficients_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "ce0" }} , 
 	{ "name": "cos_coefficients_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "q0" }} , 
 	{ "name": "sin_coefficients_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "address0" }} , 
 	{ "name": "sin_coefficients_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "ce0" }} , 
 	{ "name": "sin_coefficients_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "q0" }} , 
 	{ "name": "grp_fu_1648_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1648_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1648_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1648_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1648_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1648_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1648_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1648_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1648_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1648_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1652_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1652_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1652_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1652_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1652_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1652_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1652_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1652_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1652_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1652_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1656_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1656_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1656_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1656_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1656_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1656_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1656_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1656_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1660_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1660_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1660_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1660_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1660_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1660_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1660_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1660_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1664_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1664_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1664_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1664_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1664_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1664_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1664_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1664_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1668_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1668_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1668_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1668_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1668_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1668_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1668_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1668_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "5635",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln171_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "44", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_Pipeline_VITIS_LOOP_174_16 {
		numBF_7 {Type I LastRead 0 FirstWrite -1}
		zext_ln174 {Type I LastRead 0 FirstWrite -1}
		select_ln171_1 {Type I LastRead 0 FirstWrite -1}
		X_R_7 {Type IO LastRead 32 FirstWrite 31}
		X_I_7 {Type IO LastRead 32 FirstWrite 31}
		cos_coefficients_table {Type I LastRead 1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "47", "Max" : "5635"}
	, {"Name" : "Interval", "Min" : "47", "Max" : "5635"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	numBF_7 { ap_none {  { numBF_7 in_data 0 8 } } }
	zext_ln174 { ap_none {  { zext_ln174 in_data 0 4 } } }
	select_ln171_1 { ap_none {  { select_ln171_1 in_data 0 1 } } }
	X_R_7 { ap_memory {  { X_R_7_address0 mem_address 1 10 }  { X_R_7_ce0 mem_ce 1 1 }  { X_R_7_we0 mem_we 1 1 }  { X_R_7_d0 mem_din 1 32 }  { X_R_7_q0 mem_dout 0 32 }  { X_R_7_address1 MemPortADDR2 1 10 }  { X_R_7_ce1 MemPortCE2 1 1 }  { X_R_7_we1 MemPortWE2 1 1 }  { X_R_7_d1 MemPortDIN2 1 32 }  { X_R_7_q1 MemPortDOUT2 0 32 } } }
	X_I_7 { ap_memory {  { X_I_7_address0 mem_address 1 10 }  { X_I_7_ce0 mem_ce 1 1 }  { X_I_7_we0 mem_we 1 1 }  { X_I_7_d0 mem_din 1 32 }  { X_I_7_q0 mem_dout 0 32 }  { X_I_7_address1 MemPortADDR2 1 10 }  { X_I_7_ce1 MemPortCE2 1 1 }  { X_I_7_we1 MemPortWE2 1 1 }  { X_I_7_d1 MemPortDIN2 1 32 }  { X_I_7_q1 MemPortDOUT2 0 32 } } }
	cos_coefficients_table { ap_memory {  { cos_coefficients_table_address0 mem_address 1 9 }  { cos_coefficients_table_ce0 mem_ce 1 1 }  { cos_coefficients_table_q0 mem_dout 0 32 } } }
	sin_coefficients_table { ap_memory {  { sin_coefficients_table_address0 mem_address 1 9 }  { sin_coefficients_table_ce0 mem_ce 1 1 }  { sin_coefficients_table_q0 mem_dout 0 32 } } }
}
