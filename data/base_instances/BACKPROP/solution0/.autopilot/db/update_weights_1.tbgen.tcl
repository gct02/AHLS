set moduleName update_weights_1
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
set C_modelName {update_weights.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights1 int 64 regular {array 832 { 2 3 } 1 1 }  }
	{ weights2 int 64 regular {array 4096 { 2 3 } 1 1 }  }
	{ weights3 int 64 regular {array 192 { 2 3 } 1 1 }  }
	{ d_weights1 double 64 regular {array 832 { 1 3 } 1 1 }  }
	{ d_weights2 double 64 regular {array 4096 { 1 3 } 1 1 }  }
	{ d_weights3 double 64 regular {array 192 { 1 3 } 1 1 }  }
	{ biases1 int 64 regular {array 64 { 2 3 } 1 1 }  }
	{ biases2 int 64 regular {array 64 { 2 3 } 1 1 }  }
	{ biases3 int 64 regular {array 3 { 2 3 } 1 1 }  }
	{ d_biases1 double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ d_biases2 double 64 regular {array 64 { 1 3 } 1 1 }  }
	{ p_read double 64 regular  }
	{ p_read1 double 64 regular  }
	{ p_read2 double 64 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weights1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "d_weights1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_weights2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_weights3", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "biases3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "d_biases1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "d_biases2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 67
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weights1_address0 sc_out sc_lv 10 signal 0 } 
	{ weights1_ce0 sc_out sc_logic 1 signal 0 } 
	{ weights1_we0 sc_out sc_logic 1 signal 0 } 
	{ weights1_d0 sc_out sc_lv 64 signal 0 } 
	{ weights1_q0 sc_in sc_lv 64 signal 0 } 
	{ weights2_address0 sc_out sc_lv 12 signal 1 } 
	{ weights2_ce0 sc_out sc_logic 1 signal 1 } 
	{ weights2_we0 sc_out sc_logic 1 signal 1 } 
	{ weights2_d0 sc_out sc_lv 64 signal 1 } 
	{ weights2_q0 sc_in sc_lv 64 signal 1 } 
	{ weights3_address0 sc_out sc_lv 8 signal 2 } 
	{ weights3_ce0 sc_out sc_logic 1 signal 2 } 
	{ weights3_we0 sc_out sc_logic 1 signal 2 } 
	{ weights3_d0 sc_out sc_lv 64 signal 2 } 
	{ weights3_q0 sc_in sc_lv 64 signal 2 } 
	{ d_weights1_address0 sc_out sc_lv 10 signal 3 } 
	{ d_weights1_ce0 sc_out sc_logic 1 signal 3 } 
	{ d_weights1_q0 sc_in sc_lv 64 signal 3 } 
	{ d_weights2_address0 sc_out sc_lv 12 signal 4 } 
	{ d_weights2_ce0 sc_out sc_logic 1 signal 4 } 
	{ d_weights2_q0 sc_in sc_lv 64 signal 4 } 
	{ d_weights3_address0 sc_out sc_lv 8 signal 5 } 
	{ d_weights3_ce0 sc_out sc_logic 1 signal 5 } 
	{ d_weights3_q0 sc_in sc_lv 64 signal 5 } 
	{ biases1_address0 sc_out sc_lv 6 signal 6 } 
	{ biases1_ce0 sc_out sc_logic 1 signal 6 } 
	{ biases1_we0 sc_out sc_logic 1 signal 6 } 
	{ biases1_d0 sc_out sc_lv 64 signal 6 } 
	{ biases1_q0 sc_in sc_lv 64 signal 6 } 
	{ biases2_address0 sc_out sc_lv 6 signal 7 } 
	{ biases2_ce0 sc_out sc_logic 1 signal 7 } 
	{ biases2_we0 sc_out sc_logic 1 signal 7 } 
	{ biases2_d0 sc_out sc_lv 64 signal 7 } 
	{ biases2_q0 sc_in sc_lv 64 signal 7 } 
	{ biases3_address0 sc_out sc_lv 2 signal 8 } 
	{ biases3_ce0 sc_out sc_logic 1 signal 8 } 
	{ biases3_we0 sc_out sc_logic 1 signal 8 } 
	{ biases3_d0 sc_out sc_lv 64 signal 8 } 
	{ biases3_q0 sc_in sc_lv 64 signal 8 } 
	{ d_biases1_address0 sc_out sc_lv 6 signal 9 } 
	{ d_biases1_ce0 sc_out sc_logic 1 signal 9 } 
	{ d_biases1_q0 sc_in sc_lv 64 signal 9 } 
	{ d_biases2_address0 sc_out sc_lv 6 signal 10 } 
	{ d_biases2_ce0 sc_out sc_logic 1 signal 10 } 
	{ d_biases2_q0 sc_in sc_lv 64 signal 10 } 
	{ p_read sc_in sc_lv 64 signal 11 } 
	{ p_read1 sc_in sc_lv 64 signal 12 } 
	{ p_read2 sc_in sc_lv 64 signal 13 } 
	{ grp_fu_986_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_986_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_986_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_986_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_986_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_990_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_990_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_990_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_998_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_998_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_998_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_998_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weights1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weights1", "role": "address0" }} , 
 	{ "name": "weights1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "ce0" }} , 
 	{ "name": "weights1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights1", "role": "we0" }} , 
 	{ "name": "weights1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "d0" }} , 
 	{ "name": "weights1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights1", "role": "q0" }} , 
 	{ "name": "weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "weights2", "role": "address0" }} , 
 	{ "name": "weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "ce0" }} , 
 	{ "name": "weights2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights2", "role": "we0" }} , 
 	{ "name": "weights2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "d0" }} , 
 	{ "name": "weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights2", "role": "q0" }} , 
 	{ "name": "weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "weights3", "role": "address0" }} , 
 	{ "name": "weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "ce0" }} , 
 	{ "name": "weights3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights3", "role": "we0" }} , 
 	{ "name": "weights3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "d0" }} , 
 	{ "name": "weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weights3", "role": "q0" }} , 
 	{ "name": "d_weights1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "d_weights1", "role": "address0" }} , 
 	{ "name": "d_weights1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights1", "role": "ce0" }} , 
 	{ "name": "d_weights1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights1", "role": "q0" }} , 
 	{ "name": "d_weights2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "d_weights2", "role": "address0" }} , 
 	{ "name": "d_weights2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights2", "role": "ce0" }} , 
 	{ "name": "d_weights2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights2", "role": "q0" }} , 
 	{ "name": "d_weights3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "d_weights3", "role": "address0" }} , 
 	{ "name": "d_weights3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_weights3", "role": "ce0" }} , 
 	{ "name": "d_weights3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_weights3", "role": "q0" }} , 
 	{ "name": "biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases1", "role": "address0" }} , 
 	{ "name": "biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "ce0" }} , 
 	{ "name": "biases1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases1", "role": "we0" }} , 
 	{ "name": "biases1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "d0" }} , 
 	{ "name": "biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases1", "role": "q0" }} , 
 	{ "name": "biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "biases2", "role": "address0" }} , 
 	{ "name": "biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "ce0" }} , 
 	{ "name": "biases2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases2", "role": "we0" }} , 
 	{ "name": "biases2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "d0" }} , 
 	{ "name": "biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases2", "role": "q0" }} , 
 	{ "name": "biases3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "biases3", "role": "address0" }} , 
 	{ "name": "biases3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "ce0" }} , 
 	{ "name": "biases3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "biases3", "role": "we0" }} , 
 	{ "name": "biases3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "d0" }} , 
 	{ "name": "biases3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "biases3", "role": "q0" }} , 
 	{ "name": "d_biases1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "d_biases1", "role": "address0" }} , 
 	{ "name": "d_biases1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_biases1", "role": "ce0" }} , 
 	{ "name": "d_biases1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases1", "role": "q0" }} , 
 	{ "name": "d_biases2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "d_biases2", "role": "address0" }} , 
 	{ "name": "d_biases2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d_biases2", "role": "ce0" }} , 
 	{ "name": "d_biases2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "d_biases2", "role": "q0" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "grp_fu_986_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_986_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_986_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_986_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_986_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_986_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_986_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_986_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_986_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_986_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_990_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_990_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_990_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_998_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_998_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_998_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_998_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_998_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_998_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_998_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_998_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "update_weights_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "183269", "EstimateLatencyMax" : "183269",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weights3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "d_weights1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_weights3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "biases1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "biases3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "d_biases1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d_biases2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "update_weights_loop1_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state20", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state20"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop3_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state65"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state48"], "PostState" : ["ap_ST_fsm_state48"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state48", "LastState" : ["ap_ST_fsm_state49"], "QuitState" : ["ap_ST_fsm_state48"], "PreState" : ["ap_ST_fsm_state47"], "PostState" : ["ap_ST_fsm_state66"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state77", "LastState" : ["ap_ST_fsm_state93"], "QuitState" : ["ap_ST_fsm_state77"], "PreState" : ["ap_ST_fsm_state76"], "PostState" : ["ap_ST_fsm_state94"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop5_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state95", "LastState" : ["ap_ST_fsm_state112"], "QuitState" : ["ap_ST_fsm_state95"], "PreState" : ["ap_ST_fsm_state94"], "PostState" : ["ap_ST_fsm_state94"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state94", "LastState" : ["ap_ST_fsm_state95"], "QuitState" : ["ap_ST_fsm_state94"], "PreState" : ["ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state113"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state113", "LastState" : ["ap_ST_fsm_state129"], "QuitState" : ["ap_ST_fsm_state113"], "PreState" : ["ap_ST_fsm_state94"], "PostState" : ["ap_ST_fsm_state130"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop7_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state142", "LastState" : ["ap_ST_fsm_state158"], "QuitState" : ["ap_ST_fsm_state142"], "PreState" : ["ap_ST_fsm_state141"], "PostState" : ["ap_ST_fsm_state141"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state141", "LastState" : ["ap_ST_fsm_state142"], "QuitState" : ["ap_ST_fsm_state141"], "PreState" : ["ap_ST_fsm_state140"], "PostState" : ["ap_ST_fsm_state159"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state170", "LastState" : ["ap_ST_fsm_state186"], "QuitState" : ["ap_ST_fsm_state170"], "PreState" : ["ap_ST_fsm_state169"], "PostState" : ["ap_ST_fsm_state187"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop9_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state188", "LastState" : ["ap_ST_fsm_state204"], "QuitState" : ["ap_ST_fsm_state188"], "PreState" : ["ap_ST_fsm_state187"], "PostState" : ["ap_ST_fsm_state187"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state187", "LastState" : ["ap_ST_fsm_state188"], "QuitState" : ["ap_ST_fsm_state187"], "PreState" : ["ap_ST_fsm_state170"], "PostState" : ["ap_ST_fsm_state205"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state205", "LastState" : ["ap_ST_fsm_state220"], "QuitState" : ["ap_ST_fsm_state205"], "PreState" : ["ap_ST_fsm_state187"], "PostState" : ["ap_ST_fsm_state221"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop11_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state233", "LastState" : ["ap_ST_fsm_state249"], "QuitState" : ["ap_ST_fsm_state233"], "PreState" : ["ap_ST_fsm_state232"], "PostState" : ["ap_ST_fsm_state232"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state232", "LastState" : ["ap_ST_fsm_state233"], "QuitState" : ["ap_ST_fsm_state232"], "PreState" : ["ap_ST_fsm_state231"], "PostState" : ["ap_ST_fsm_state250"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "update_weights_loop12", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "277", "FirstState" : "ap_ST_fsm_state261", "LastState" : ["ap_ST_fsm_state277"], "QuitState" : ["ap_ST_fsm_state261"], "PreState" : ["ap_ST_fsm_state260"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsqrt_64ns_64ns_64_12_no_dsp_1_U149", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_64_1_1_U150", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	update_weights_1 {
		weights1 {Type IO LastRead 15 FirstWrite 10}
		weights2 {Type IO LastRead 41 FirstWrite 38}
		weights3 {Type IO LastRead 67 FirstWrite 62}
		d_weights1 {Type I LastRead 2 FirstWrite -1}
		d_weights2 {Type I LastRead 28 FirstWrite -1}
		d_weights3 {Type I LastRead 54 FirstWrite -1}
		biases1 {Type IO LastRead 26 FirstWrite 10}
		biases2 {Type IO LastRead 52 FirstWrite 36}
		biases3 {Type IO LastRead 78 FirstWrite 61}
		d_biases1 {Type I LastRead 2 FirstWrite -1}
		d_biases2 {Type I LastRead 28 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "183269", "Max" : "183269"}
	, {"Name" : "Interval", "Min" : "183269", "Max" : "183269"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights1 { ap_memory {  { weights1_address0 mem_address 1 10 }  { weights1_ce0 mem_ce 1 1 }  { weights1_we0 mem_we 1 1 }  { weights1_d0 mem_din 1 64 }  { weights1_q0 in_data 0 64 } } }
	weights2 { ap_memory {  { weights2_address0 mem_address 1 12 }  { weights2_ce0 mem_ce 1 1 }  { weights2_we0 mem_we 1 1 }  { weights2_d0 mem_din 1 64 }  { weights2_q0 mem_dout 0 64 } } }
	weights3 { ap_memory {  { weights3_address0 mem_address 1 8 }  { weights3_ce0 mem_ce 1 1 }  { weights3_we0 mem_we 1 1 }  { weights3_d0 mem_din 1 64 }  { weights3_q0 in_data 0 64 } } }
	d_weights1 { ap_memory {  { d_weights1_address0 mem_address 1 10 }  { d_weights1_ce0 mem_ce 1 1 }  { d_weights1_q0 in_data 0 64 } } }
	d_weights2 { ap_memory {  { d_weights2_address0 mem_address 1 12 }  { d_weights2_ce0 mem_ce 1 1 }  { d_weights2_q0 mem_dout 0 64 } } }
	d_weights3 { ap_memory {  { d_weights3_address0 mem_address 1 8 }  { d_weights3_ce0 mem_ce 1 1 }  { d_weights3_q0 in_data 0 64 } } }
	biases1 { ap_memory {  { biases1_address0 mem_address 1 6 }  { biases1_ce0 mem_ce 1 1 }  { biases1_we0 mem_we 1 1 }  { biases1_d0 mem_din 1 64 }  { biases1_q0 in_data 0 64 } } }
	biases2 { ap_memory {  { biases2_address0 mem_address 1 6 }  { biases2_ce0 mem_ce 1 1 }  { biases2_we0 mem_we 1 1 }  { biases2_d0 mem_din 1 64 }  { biases2_q0 in_data 0 64 } } }
	biases3 { ap_memory {  { biases3_address0 mem_address 1 2 }  { biases3_ce0 mem_ce 1 1 }  { biases3_we0 mem_we 1 1 }  { biases3_d0 mem_din 1 64 }  { biases3_q0 in_data 0 64 } } }
	d_biases1 { ap_memory {  { d_biases1_address0 mem_address 1 6 }  { d_biases1_ce0 mem_ce 1 1 }  { d_biases1_q0 in_data 0 64 } } }
	d_biases2 { ap_memory {  { d_biases2_address0 mem_address 1 6 }  { d_biases2_ce0 mem_ce 1 1 }  { d_biases2_q0 in_data 0 64 } } }
	p_read { ap_none {  { p_read in_data 0 64 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 64 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 64 } } }
}
