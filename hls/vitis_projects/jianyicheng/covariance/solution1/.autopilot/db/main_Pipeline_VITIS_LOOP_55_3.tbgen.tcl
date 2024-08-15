set moduleName main_Pipeline_VITIS_LOOP_55_3
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
set C_modelName {main_Pipeline_VITIS_LOOP_55_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_s float 32 regular {array 1024 { 2 0 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "data_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 179
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_s_address0 sc_out sc_lv 10 signal 0 } 
	{ data_s_ce0 sc_out sc_logic 1 signal 0 } 
	{ data_s_we0 sc_out sc_logic 1 signal 0 } 
	{ data_s_d0 sc_out sc_lv 32 signal 0 } 
	{ data_s_q0 sc_in sc_lv 32 signal 0 } 
	{ data_s_address1 sc_out sc_lv 10 signal 0 } 
	{ data_s_ce1 sc_out sc_logic 1 signal 0 } 
	{ data_s_we1 sc_out sc_logic 1 signal 0 } 
	{ data_s_d1 sc_out sc_lv 32 signal 0 } 
	{ grp_fu_365_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_365_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_365_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_365_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_365_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_369_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_369_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_369_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_369_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_369_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_373_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_373_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_373_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_373_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_373_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_377_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_377_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_377_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_377_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_377_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_381_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_381_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_381_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_381_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_381_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_385_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_385_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_385_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_385_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_385_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_389_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_389_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_389_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_389_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_389_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_393_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_393_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_393_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_393_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_393_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_397_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_397_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_397_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_397_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_397_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_401_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_401_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_401_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_401_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_401_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_405_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_405_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_405_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_405_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_405_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_409_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_409_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_409_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_409_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_409_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_413_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_413_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_413_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_413_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_413_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_417_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_417_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_417_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_417_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_417_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_421_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_421_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_421_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_421_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_421_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_425_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_425_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_425_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_425_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_425_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_429_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_429_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_429_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_429_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_429_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_433_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_433_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_433_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_433_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_433_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_437_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_437_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_437_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_437_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_437_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_441_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_441_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_441_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_441_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_441_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_445_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_445_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_445_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_445_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_445_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_449_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_449_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_449_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_449_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_449_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_453_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_453_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_453_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_453_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_453_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_457_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_457_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_457_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_457_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_457_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_461_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_461_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_461_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_461_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_461_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_465_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_465_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_465_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_465_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_465_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_469_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_469_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_469_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_469_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_469_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_473_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_473_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_473_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_473_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_473_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_477_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_477_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_477_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_477_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_477_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_481_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_481_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_481_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_481_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_481_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_485_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_485_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_485_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_485_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_485_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_489_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_489_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_489_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_489_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_489_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_493_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_493_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_493_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_493_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data_s", "role": "address0" }} , 
 	{ "name": "data_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_s", "role": "ce0" }} , 
 	{ "name": "data_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_s", "role": "we0" }} , 
 	{ "name": "data_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_s", "role": "d0" }} , 
 	{ "name": "data_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_s", "role": "q0" }} , 
 	{ "name": "data_s_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "data_s", "role": "address1" }} , 
 	{ "name": "data_s_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_s", "role": "ce1" }} , 
 	{ "name": "data_s_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_s", "role": "we1" }} , 
 	{ "name": "data_s_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_s", "role": "d1" }} , 
 	{ "name": "grp_fu_365_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_365_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_365_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_365_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_365_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_369_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_369_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_369_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_369_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_369_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_369_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_369_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_369_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_369_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_369_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_373_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_373_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_373_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_373_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_373_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_373_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_373_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_373_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_373_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_373_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_377_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_377_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_377_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_377_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_377_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_377_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_377_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_377_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_377_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_377_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_381_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_381_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_381_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_381_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_381_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_381_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_381_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_381_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_381_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_381_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_385_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_385_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_385_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_385_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_385_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_385_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_385_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_385_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_385_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_385_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_389_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_389_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_389_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_389_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_389_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_389_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_389_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_389_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_389_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_389_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_393_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_393_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_393_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_393_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_393_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_393_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_393_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_393_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_393_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_393_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_397_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_397_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_397_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_397_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_397_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_397_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_397_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_397_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_397_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_397_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_401_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_401_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_401_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_401_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_401_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_401_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_401_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_401_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_401_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_401_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_405_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_405_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_405_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_405_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_405_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_405_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_405_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_405_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_405_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_405_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_409_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_409_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_409_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_409_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_409_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_409_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_409_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_409_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_409_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_409_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_413_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_413_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_413_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_413_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_413_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_413_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_413_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_413_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_413_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_413_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_417_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_417_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_417_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_417_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_417_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_417_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_417_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_417_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_417_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_417_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_421_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_421_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_421_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_421_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_421_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_421_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_421_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_421_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_421_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_421_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_425_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_425_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_425_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_425_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_425_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_425_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_425_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_425_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_425_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_425_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_429_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_429_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_429_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_429_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_429_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_429_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_429_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_429_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_429_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_429_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_433_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_433_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_433_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_433_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_433_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_433_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_433_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_433_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_433_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_433_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_437_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_437_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_437_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_437_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_437_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_437_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_437_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_437_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_437_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_437_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_441_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_441_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_441_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_441_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_441_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_441_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_441_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_441_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_441_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_441_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_445_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_445_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_445_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_445_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_445_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_445_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_445_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_445_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_445_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_445_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_449_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_449_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_449_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_449_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_449_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_449_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_449_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_449_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_449_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_449_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_453_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_453_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_453_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_453_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_453_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_453_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_453_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_453_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_453_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_453_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_457_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_457_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_457_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_457_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_457_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_457_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_457_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_457_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_457_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_457_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_461_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_461_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_461_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_461_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_461_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_461_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_461_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_461_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_461_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_461_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_465_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_465_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_465_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_465_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_465_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_465_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_465_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_465_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_465_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_465_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_469_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_469_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_469_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_469_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_469_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_469_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_469_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_469_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_469_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_469_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_473_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_473_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_473_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_473_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_473_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_473_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_473_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_473_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_473_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_473_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_477_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_477_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_477_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_477_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_477_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_477_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_477_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_477_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_477_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_477_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_481_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_481_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_481_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_481_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_481_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_481_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_481_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_481_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_481_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_481_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_485_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_485_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_485_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_485_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_485_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_485_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_485_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_485_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_485_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_485_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_489_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_489_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_489_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_489_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_489_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_489_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_489_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_489_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_489_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_489_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_493_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_493_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_493_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "main_Pipeline_VITIS_LOOP_55_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12097", "EstimateLatencyMax" : "12097",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "data_s", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_55_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "379", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state379"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_55_3 {
		data_s {Type IO LastRead 311 FirstWrite 363}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12097", "Max" : "12097"}
	, {"Name" : "Interval", "Min" : "12097", "Max" : "12097"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	data_s { ap_memory {  { data_s_address0 mem_address 1 10 }  { data_s_ce0 mem_ce 1 1 }  { data_s_we0 mem_we 1 1 }  { data_s_d0 mem_din 1 32 }  { data_s_q0 mem_dout 0 32 }  { data_s_address1 MemPortADDR2 1 10 }  { data_s_ce1 MemPortCE2 1 1 }  { data_s_we1 MemPortWE2 1 1 }  { data_s_d1 MemPortDIN2 1 32 } } }
}
