set moduleName fft1D_512_Pipeline_loop1_twiddles
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
set C_modelName {fft1D_512_Pipeline_loop1_twiddles}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_x double 64 regular {array 8 { 2 2 } 1 1 }  }
	{ data_y double 64 regular {array 8 { 2 2 } 1 1 }  }
	{ DATA_x_r double 64 regular {array 512 { 0 0 } 0 1 }  }
	{ DATA_y_r double 64 regular {array 512 { 0 0 } 0 1 }  }
	{ work_x int 64 regular {array 512 { 1 1 } 1 1 }  }
	{ work_y int 64 regular {array 512 { 1 1 } 1 1 }  }
	{ twiddles8_reversed8 int 32 regular {array 8 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "data_x", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "data_y", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "DATA_x_r", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "DATA_y_r", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "work_x", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "work_y", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "twiddles8_reversed8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 111
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_x_address0 sc_out sc_lv 3 signal 0 } 
	{ data_x_ce0 sc_out sc_logic 1 signal 0 } 
	{ data_x_we0 sc_out sc_logic 1 signal 0 } 
	{ data_x_d0 sc_out sc_lv 64 signal 0 } 
	{ data_x_q0 sc_in sc_lv 64 signal 0 } 
	{ data_x_address1 sc_out sc_lv 3 signal 0 } 
	{ data_x_ce1 sc_out sc_logic 1 signal 0 } 
	{ data_x_we1 sc_out sc_logic 1 signal 0 } 
	{ data_x_d1 sc_out sc_lv 64 signal 0 } 
	{ data_x_q1 sc_in sc_lv 64 signal 0 } 
	{ data_y_address0 sc_out sc_lv 3 signal 1 } 
	{ data_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ data_y_we0 sc_out sc_logic 1 signal 1 } 
	{ data_y_d0 sc_out sc_lv 64 signal 1 } 
	{ data_y_q0 sc_in sc_lv 64 signal 1 } 
	{ data_y_address1 sc_out sc_lv 3 signal 1 } 
	{ data_y_ce1 sc_out sc_logic 1 signal 1 } 
	{ data_y_we1 sc_out sc_logic 1 signal 1 } 
	{ data_y_d1 sc_out sc_lv 64 signal 1 } 
	{ data_y_q1 sc_in sc_lv 64 signal 1 } 
	{ DATA_x_r_address0 sc_out sc_lv 9 signal 2 } 
	{ DATA_x_r_ce0 sc_out sc_logic 1 signal 2 } 
	{ DATA_x_r_we0 sc_out sc_logic 1 signal 2 } 
	{ DATA_x_r_d0 sc_out sc_lv 64 signal 2 } 
	{ DATA_x_r_address1 sc_out sc_lv 9 signal 2 } 
	{ DATA_x_r_ce1 sc_out sc_logic 1 signal 2 } 
	{ DATA_x_r_we1 sc_out sc_logic 1 signal 2 } 
	{ DATA_x_r_d1 sc_out sc_lv 64 signal 2 } 
	{ DATA_y_r_address0 sc_out sc_lv 9 signal 3 } 
	{ DATA_y_r_ce0 sc_out sc_logic 1 signal 3 } 
	{ DATA_y_r_we0 sc_out sc_logic 1 signal 3 } 
	{ DATA_y_r_d0 sc_out sc_lv 64 signal 3 } 
	{ DATA_y_r_address1 sc_out sc_lv 9 signal 3 } 
	{ DATA_y_r_ce1 sc_out sc_logic 1 signal 3 } 
	{ DATA_y_r_we1 sc_out sc_logic 1 signal 3 } 
	{ DATA_y_r_d1 sc_out sc_lv 64 signal 3 } 
	{ work_x_address0 sc_out sc_lv 9 signal 4 } 
	{ work_x_ce0 sc_out sc_logic 1 signal 4 } 
	{ work_x_q0 sc_in sc_lv 64 signal 4 } 
	{ work_x_address1 sc_out sc_lv 9 signal 4 } 
	{ work_x_ce1 sc_out sc_logic 1 signal 4 } 
	{ work_x_q1 sc_in sc_lv 64 signal 4 } 
	{ work_y_address0 sc_out sc_lv 9 signal 5 } 
	{ work_y_ce0 sc_out sc_logic 1 signal 5 } 
	{ work_y_q0 sc_in sc_lv 64 signal 5 } 
	{ work_y_address1 sc_out sc_lv 9 signal 5 } 
	{ work_y_ce1 sc_out sc_logic 1 signal 5 } 
	{ work_y_q1 sc_in sc_lv 64 signal 5 } 
	{ twiddles8_reversed8_address0 sc_out sc_lv 3 signal 6 } 
	{ twiddles8_reversed8_ce0 sc_out sc_logic 1 signal 6 } 
	{ twiddles8_reversed8_q0 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_1602_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1602_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1602_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1602_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1602_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1607_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1607_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1607_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1607_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1607_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1612_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1612_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1612_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1612_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1612_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1617_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1617_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1617_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1617_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1617_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1622_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1622_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1622_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1622_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1622_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1627_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1627_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1627_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1627_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1627_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1650_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1650_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1650_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1650_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1655_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1655_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1655_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1655_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1662_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1662_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1662_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1662_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1667_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1667_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1667_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1667_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_din2 sc_out sc_lv 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_double_s_fu_5138_p_idle sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_x", "role": "address0" }} , 
 	{ "name": "data_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_x", "role": "ce0" }} , 
 	{ "name": "data_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_x", "role": "we0" }} , 
 	{ "name": "data_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_x", "role": "d0" }} , 
 	{ "name": "data_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_x", "role": "q0" }} , 
 	{ "name": "data_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_x", "role": "address1" }} , 
 	{ "name": "data_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_x", "role": "ce1" }} , 
 	{ "name": "data_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_x", "role": "we1" }} , 
 	{ "name": "data_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_x", "role": "d1" }} , 
 	{ "name": "data_x_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_x", "role": "q1" }} , 
 	{ "name": "data_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_y", "role": "address0" }} , 
 	{ "name": "data_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_y", "role": "ce0" }} , 
 	{ "name": "data_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_y", "role": "we0" }} , 
 	{ "name": "data_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_y", "role": "d0" }} , 
 	{ "name": "data_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_y", "role": "q0" }} , 
 	{ "name": "data_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_y", "role": "address1" }} , 
 	{ "name": "data_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_y", "role": "ce1" }} , 
 	{ "name": "data_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_y", "role": "we1" }} , 
 	{ "name": "data_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_y", "role": "d1" }} , 
 	{ "name": "data_y_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_y", "role": "q1" }} , 
 	{ "name": "DATA_x_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "address0" }} , 
 	{ "name": "DATA_x_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "ce0" }} , 
 	{ "name": "DATA_x_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "we0" }} , 
 	{ "name": "DATA_x_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "d0" }} , 
 	{ "name": "DATA_x_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "address1" }} , 
 	{ "name": "DATA_x_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "ce1" }} , 
 	{ "name": "DATA_x_r_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "we1" }} , 
 	{ "name": "DATA_x_r_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "DATA_x_r", "role": "d1" }} , 
 	{ "name": "DATA_y_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "address0" }} , 
 	{ "name": "DATA_y_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "ce0" }} , 
 	{ "name": "DATA_y_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "we0" }} , 
 	{ "name": "DATA_y_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "d0" }} , 
 	{ "name": "DATA_y_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "address1" }} , 
 	{ "name": "DATA_y_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "ce1" }} , 
 	{ "name": "DATA_y_r_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "we1" }} , 
 	{ "name": "DATA_y_r_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "DATA_y_r", "role": "d1" }} , 
 	{ "name": "work_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_x", "role": "address0" }} , 
 	{ "name": "work_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "ce0" }} , 
 	{ "name": "work_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "q0" }} , 
 	{ "name": "work_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_x", "role": "address1" }} , 
 	{ "name": "work_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_x", "role": "ce1" }} , 
 	{ "name": "work_x_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_x", "role": "q1" }} , 
 	{ "name": "work_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_y", "role": "address0" }} , 
 	{ "name": "work_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "ce0" }} , 
 	{ "name": "work_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "q0" }} , 
 	{ "name": "work_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "work_y", "role": "address1" }} , 
 	{ "name": "work_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "work_y", "role": "ce1" }} , 
 	{ "name": "work_y_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "work_y", "role": "q1" }} , 
 	{ "name": "twiddles8_reversed8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "twiddles8_reversed8", "role": "address0" }} , 
 	{ "name": "twiddles8_reversed8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "twiddles8_reversed8", "role": "ce0" }} , 
 	{ "name": "twiddles8_reversed8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "twiddles8_reversed8", "role": "q0" }} , 
 	{ "name": "grp_fu_1602_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1602_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1602_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1602_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1602_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1602_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1602_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1602_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1602_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1602_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1607_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1607_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1607_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1607_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1607_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1607_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1607_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1607_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1607_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1607_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1612_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1612_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1612_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1612_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1612_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1612_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1617_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1617_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1617_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1617_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1617_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1617_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1617_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1617_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1617_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1617_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1622_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1622_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1622_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1622_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1622_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1622_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1622_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1622_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1622_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1622_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1627_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1627_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1627_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1627_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1627_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1627_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1627_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1627_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1627_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1627_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1650_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1650_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1650_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1650_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1650_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1650_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1650_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1650_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1655_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1655_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1655_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1655_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1655_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1655_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1655_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1655_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1662_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1662_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1662_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1662_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1662_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1662_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1662_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1662_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1667_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1667_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1667_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1667_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1667_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1667_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1667_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1667_p_ce", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_din1", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_din2", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_dout0", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_ce", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_start", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_ready", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_done", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_double_s_fu_5138_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_double_s_fu_5138_p_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "fft1D_512_Pipeline_loop1_twiddles",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7647", "EstimateLatencyMax" : "7647",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "data_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "DATA_x_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "DATA_y_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "work_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "work_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "twiddles8_reversed8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_256", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fourth_order_double_sin_cos_K4", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop1_twiddles", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage12", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage12_subdone", "QuitState" : "ap_ST_fsm_pp0_stage12", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage12_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_2_no_dsp_1_U41", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft1D_512_Pipeline_loop1_twiddles {
		data_x {Type IO LastRead 45 FirstWrite 24}
		data_y {Type IO LastRead 45 FirstWrite 24}
		DATA_x_r {Type O LastRead -1 FirstWrite 15}
		DATA_y_r {Type O LastRead -1 FirstWrite 15}
		work_x {Type I LastRead 4 FirstWrite -1}
		work_y {Type I LastRead 4 FirstWrite -1}
		twiddles8_reversed8 {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7647", "Max" : "7647"}
	, {"Name" : "Interval", "Min" : "7647", "Max" : "7647"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	data_x { ap_memory {  { data_x_address0 mem_address 1 3 }  { data_x_ce0 mem_ce 1 1 }  { data_x_we0 mem_we 1 1 }  { data_x_d0 mem_din 1 64 }  { data_x_q0 in_data 0 64 }  { data_x_address1 MemPortADDR2 1 3 }  { data_x_ce1 MemPortCE2 1 1 }  { data_x_we1 MemPortWE2 1 1 }  { data_x_d1 MemPortDIN2 1 64 }  { data_x_q1 in_data 0 64 } } }
	data_y { ap_memory {  { data_y_address0 mem_address 1 3 }  { data_y_ce0 mem_ce 1 1 }  { data_y_we0 mem_we 1 1 }  { data_y_d0 mem_din 1 64 }  { data_y_q0 in_data 0 64 }  { data_y_address1 MemPortADDR2 1 3 }  { data_y_ce1 MemPortCE2 1 1 }  { data_y_we1 MemPortWE2 1 1 }  { data_y_d1 MemPortDIN2 1 64 }  { data_y_q1 in_data 0 64 } } }
	DATA_x_r { ap_memory {  { DATA_x_r_address0 mem_address 1 9 }  { DATA_x_r_ce0 mem_ce 1 1 }  { DATA_x_r_we0 mem_we 1 1 }  { DATA_x_r_d0 mem_din 1 64 }  { DATA_x_r_address1 MemPortADDR2 1 9 }  { DATA_x_r_ce1 MemPortCE2 1 1 }  { DATA_x_r_we1 MemPortWE2 1 1 }  { DATA_x_r_d1 MemPortDIN2 1 64 } } }
	DATA_y_r { ap_memory {  { DATA_y_r_address0 mem_address 1 9 }  { DATA_y_r_ce0 mem_ce 1 1 }  { DATA_y_r_we0 mem_we 1 1 }  { DATA_y_r_d0 mem_din 1 64 }  { DATA_y_r_address1 MemPortADDR2 1 9 }  { DATA_y_r_ce1 MemPortCE2 1 1 }  { DATA_y_r_we1 MemPortWE2 1 1 }  { DATA_y_r_d1 MemPortDIN2 1 64 } } }
	work_x { ap_memory {  { work_x_address0 mem_address 1 9 }  { work_x_ce0 mem_ce 1 1 }  { work_x_q0 in_data 0 64 }  { work_x_address1 MemPortADDR2 1 9 }  { work_x_ce1 MemPortCE2 1 1 }  { work_x_q1 in_data 0 64 } } }
	work_y { ap_memory {  { work_y_address0 mem_address 1 9 }  { work_y_ce0 mem_ce 1 1 }  { work_y_q0 in_data 0 64 }  { work_y_address1 MemPortADDR2 1 9 }  { work_y_ce1 MemPortCE2 1 1 }  { work_y_q1 in_data 0 64 } } }
	twiddles8_reversed8 { ap_memory {  { twiddles8_reversed8_address0 mem_address 1 3 }  { twiddles8_reversed8_ce0 mem_ce 1 1 }  { twiddles8_reversed8_q0 in_data 0 32 } } }
}
