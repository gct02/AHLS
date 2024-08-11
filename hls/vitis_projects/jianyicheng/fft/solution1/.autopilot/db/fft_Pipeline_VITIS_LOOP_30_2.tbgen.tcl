set moduleName fft_Pipeline_VITIS_LOOP_30_2
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
set C_modelName {fft_Pipeline_VITIS_LOOP_30_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ numBF int 8 regular  }
	{ zext_ln30 int 4 regular  }
	{ cos_coefficients_table int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ sin_coefficients_table int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ select_ln27_1 int 1 regular  }
	{ X_R_0 int 32 regular {array 1024 { 2 1 } 1 1 }  }
	{ X_I_0 int 32 regular {array 1024 { 2 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "numBF", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln30", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "cos_coefficients_table", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sin_coefficients_table", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln27_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "X_R_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "X_I_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 57
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ numBF sc_in sc_lv 8 signal 0 } 
	{ zext_ln30 sc_in sc_lv 4 signal 1 } 
	{ cos_coefficients_table_address0 sc_out sc_lv 9 signal 2 } 
	{ cos_coefficients_table_ce0 sc_out sc_logic 1 signal 2 } 
	{ cos_coefficients_table_q0 sc_in sc_lv 32 signal 2 } 
	{ sin_coefficients_table_address0 sc_out sc_lv 9 signal 3 } 
	{ sin_coefficients_table_ce0 sc_out sc_logic 1 signal 3 } 
	{ sin_coefficients_table_q0 sc_in sc_lv 32 signal 3 } 
	{ select_ln27_1 sc_in sc_lv 1 signal 4 } 
	{ X_R_0_address0 sc_out sc_lv 10 signal 5 } 
	{ X_R_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ X_R_0_we0 sc_out sc_logic 1 signal 5 } 
	{ X_R_0_d0 sc_out sc_lv 32 signal 5 } 
	{ X_R_0_q0 sc_in sc_lv 32 signal 5 } 
	{ X_R_0_address1 sc_out sc_lv 10 signal 5 } 
	{ X_R_0_ce1 sc_out sc_logic 1 signal 5 } 
	{ X_R_0_q1 sc_in sc_lv 32 signal 5 } 
	{ X_I_0_address0 sc_out sc_lv 10 signal 6 } 
	{ X_I_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ X_I_0_we0 sc_out sc_logic 1 signal 6 } 
	{ X_I_0_d0 sc_out sc_lv 32 signal 6 } 
	{ X_I_0_q0 sc_in sc_lv 32 signal 6 } 
	{ X_I_0_address1 sc_out sc_lv 10 signal 6 } 
	{ X_I_0_ce1 sc_out sc_logic 1 signal 6 } 
	{ X_I_0_q1 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_1608_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1608_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1608_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1608_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1608_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1612_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1612_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1612_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1612_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1612_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1616_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1616_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1616_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1616_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1620_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1620_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1620_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1620_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1624_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1624_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1624_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1624_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1628_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1628_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1628_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1628_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "numBF", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "numBF", "role": "default" }} , 
 	{ "name": "zext_ln30", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln30", "role": "default" }} , 
 	{ "name": "cos_coefficients_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "address0" }} , 
 	{ "name": "cos_coefficients_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "ce0" }} , 
 	{ "name": "cos_coefficients_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cos_coefficients_table", "role": "q0" }} , 
 	{ "name": "sin_coefficients_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "address0" }} , 
 	{ "name": "sin_coefficients_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "ce0" }} , 
 	{ "name": "sin_coefficients_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sin_coefficients_table", "role": "q0" }} , 
 	{ "name": "select_ln27_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "select_ln27_1", "role": "default" }} , 
 	{ "name": "X_R_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_0", "role": "address0" }} , 
 	{ "name": "X_R_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "ce0" }} , 
 	{ "name": "X_R_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "we0" }} , 
 	{ "name": "X_R_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "d0" }} , 
 	{ "name": "X_R_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "q0" }} , 
 	{ "name": "X_R_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_R_0", "role": "address1" }} , 
 	{ "name": "X_R_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_R_0", "role": "ce1" }} , 
 	{ "name": "X_R_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_R_0", "role": "q1" }} , 
 	{ "name": "X_I_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_0", "role": "address0" }} , 
 	{ "name": "X_I_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "ce0" }} , 
 	{ "name": "X_I_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "we0" }} , 
 	{ "name": "X_I_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "d0" }} , 
 	{ "name": "X_I_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "q0" }} , 
 	{ "name": "X_I_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "X_I_0", "role": "address1" }} , 
 	{ "name": "X_I_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X_I_0", "role": "ce1" }} , 
 	{ "name": "X_I_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X_I_0", "role": "q1" }} , 
 	{ "name": "grp_fu_1608_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1608_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1608_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1608_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1608_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1608_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1608_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1608_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1608_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1608_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1612_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1612_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1612_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1612_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1612_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1616_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1616_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1616_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1616_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1616_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1616_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1616_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1616_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1620_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1620_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1620_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1620_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1620_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1620_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1620_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1620_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1624_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1624_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1624_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1624_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1624_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1624_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1624_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1624_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1628_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1628_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1628_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1628_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1628_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1628_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1628_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1628_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fft_Pipeline_VITIS_LOOP_30_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "27", "EstimateLatencyMax" : "3202",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "numBF", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln30", "Type" : "None", "Direction" : "I"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "select_ln27_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "X_R_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "X_I_0", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_30_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state25", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state25_blk", "QuitState" : "ap_ST_fsm_state25", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state25_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_Pipeline_VITIS_LOOP_30_2 {
		numBF {Type I LastRead 0 FirstWrite -1}
		zext_ln30 {Type I LastRead 0 FirstWrite -1}
		cos_coefficients_table {Type I LastRead 0 FirstWrite -1}
		sin_coefficients_table {Type I LastRead 0 FirstWrite -1}
		select_ln27_1 {Type I LastRead 0 FirstWrite -1}
		X_R_0 {Type IO LastRead 17 FirstWrite 16}
		X_I_0 {Type IO LastRead 17 FirstWrite 16}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "27", "Max" : "3202"}
	, {"Name" : "Interval", "Min" : "27", "Max" : "3202"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	numBF { ap_none {  { numBF in_data 0 8 } } }
	zext_ln30 { ap_none {  { zext_ln30 in_data 0 4 } } }
	cos_coefficients_table { ap_memory {  { cos_coefficients_table_address0 mem_address 1 9 }  { cos_coefficients_table_ce0 mem_ce 1 1 }  { cos_coefficients_table_q0 mem_dout 0 32 } } }
	sin_coefficients_table { ap_memory {  { sin_coefficients_table_address0 mem_address 1 9 }  { sin_coefficients_table_ce0 mem_ce 1 1 }  { sin_coefficients_table_q0 mem_dout 0 32 } } }
	select_ln27_1 { ap_none {  { select_ln27_1 in_data 0 1 } } }
	X_R_0 { ap_memory {  { X_R_0_address0 mem_address 1 10 }  { X_R_0_ce0 mem_ce 1 1 }  { X_R_0_we0 mem_we 1 1 }  { X_R_0_d0 mem_din 1 32 }  { X_R_0_q0 mem_dout 0 32 }  { X_R_0_address1 MemPortADDR2 1 10 }  { X_R_0_ce1 MemPortCE2 1 1 }  { X_R_0_q1 MemPortDOUT2 0 32 } } }
	X_I_0 { ap_memory {  { X_I_0_address0 mem_address 1 10 }  { X_I_0_ce0 mem_ce 1 1 }  { X_I_0_we0 mem_we 1 1 }  { X_I_0_d0 mem_din 1 32 }  { X_I_0_q0 mem_dout 0 32 }  { X_I_0_address1 MemPortADDR2 1 10 }  { X_I_0_ce1 MemPortCE2 1 1 }  { X_I_0_q1 MemPortDOUT2 0 32 } } }
}
