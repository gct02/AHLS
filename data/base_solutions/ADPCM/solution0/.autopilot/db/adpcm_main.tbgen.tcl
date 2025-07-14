set moduleName adpcm_main
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
set C_modelName {adpcm_main}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_data int 32 regular {array 100 { 1 1 } 1 1 }  }
	{ encoded int 32 regular {array 50 { 2 3 } 1 1 }  }
	{ decoded int 32 regular {array 100 { 0 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "in_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "encoded", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "decoded", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_data_address0 sc_out sc_lv 7 signal 0 } 
	{ in_data_ce0 sc_out sc_logic 1 signal 0 } 
	{ in_data_q0 sc_in sc_lv 32 signal 0 } 
	{ in_data_address1 sc_out sc_lv 7 signal 0 } 
	{ in_data_ce1 sc_out sc_logic 1 signal 0 } 
	{ in_data_q1 sc_in sc_lv 32 signal 0 } 
	{ encoded_address0 sc_out sc_lv 6 signal 1 } 
	{ encoded_ce0 sc_out sc_logic 1 signal 1 } 
	{ encoded_we0 sc_out sc_logic 1 signal 1 } 
	{ encoded_d0 sc_out sc_lv 32 signal 1 } 
	{ encoded_q0 sc_in sc_lv 32 signal 1 } 
	{ decoded_address0 sc_out sc_lv 7 signal 2 } 
	{ decoded_ce0 sc_out sc_logic 1 signal 2 } 
	{ decoded_we0 sc_out sc_logic 1 signal 2 } 
	{ decoded_d0 sc_out sc_lv 32 signal 2 } 
	{ decoded_address1 sc_out sc_lv 7 signal 2 } 
	{ decoded_ce1 sc_out sc_logic 1 signal 2 } 
	{ decoded_we1 sc_out sc_logic 1 signal 2 } 
	{ decoded_d1 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "in_data", "role": "address0" }} , 
 	{ "name": "in_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data", "role": "ce0" }} , 
 	{ "name": "in_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_data", "role": "q0" }} , 
 	{ "name": "in_data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "in_data", "role": "address1" }} , 
 	{ "name": "in_data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data", "role": "ce1" }} , 
 	{ "name": "in_data_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_data", "role": "q1" }} , 
 	{ "name": "encoded_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoded", "role": "address0" }} , 
 	{ "name": "encoded_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoded", "role": "ce0" }} , 
 	{ "name": "encoded_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoded", "role": "we0" }} , 
 	{ "name": "encoded_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoded", "role": "d0" }} , 
 	{ "name": "encoded_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoded", "role": "q0" }} , 
 	{ "name": "decoded_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "decoded", "role": "address0" }} , 
 	{ "name": "decoded_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded", "role": "ce0" }} , 
 	{ "name": "decoded_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded", "role": "we0" }} , 
 	{ "name": "decoded_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "decoded", "role": "d0" }} , 
 	{ "name": "decoded_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "decoded", "role": "address1" }} , 
 	{ "name": "decoded_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded", "role": "ce1" }} , 
 	{ "name": "decoded_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decoded", "role": "we1" }} , 
 	{ "name": "decoded_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "decoded", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "41", "54", "57", "59", "61", "63", "66"],
		"CDFG" : "adpcm_main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13704", "EstimateLatencyMax" : "13804",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "encoded", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "decoded", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_detl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_detl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "detl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "detl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_deth", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_deth", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "deth", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "deth", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "rlt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "rlt2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "rlt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "rlt1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "plt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "plt2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "plt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "plt1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "al2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "al2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "al1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "al1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "nbl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "nbl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "rh2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "rh2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "rh1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "rh1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "ph2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "ph2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "ph1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "ph1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "ah2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "ah2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "ah1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "ah1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "nbh", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "nbh", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rlt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rlt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rlt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rlt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_plt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_plt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_plt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_plt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_al2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_al2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_al1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_al1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_nbl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_nbl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rh2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rh2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rh1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rh1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ph2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ph2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ph1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ph1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ah2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ah2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ah1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ah1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_nbh", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_nbh", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_dltx", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_dhx", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_dltx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_dhx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_bpl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_bph", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_bpl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_bph", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "tqmf", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "tqmf", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "accumc", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "accumc", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_reset_fu_243", "Port" : "accumd", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "accumd", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "h", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "h", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "decis_levl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "quant26bt_pos", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "quant26bt_neg", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "il", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "il", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "il", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "qq4_code4_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "qq4_code4_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "wl_code_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "wl_code_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_encode_fu_333", "Port" : "ilb_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "ilb_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "qq6_code6_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "xout1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_decode_fu_399", "Port" : "xout2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}],
		"Loop" : [
			{"Name" : "adpcm_main_label12", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "adpcm_main_label13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delay_dltx_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delay_dhx_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dec_del_dltx_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dec_del_dhx_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delay_bpl_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.delay_bph_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dec_del_bpl_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dec_del_bph_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tqmf_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.accumc_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.accumd_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.h_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.qq4_code4_table_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_243", "Parent" : "0",
		"CDFG" : "reset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "51",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dec_detl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "detl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_deth", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "deth", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rlt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rlt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "plt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "plt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "al2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "al1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "nbl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rh2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rh1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ph2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ph1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ah2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ah1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "nbh", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rlt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rlt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_plt2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_plt1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_al2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_al1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_nbl", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rh2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_rh1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ph2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ph1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ah2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_ah1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_nbh", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "reset_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "reset_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}},
			{"Name" : "reset_label7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state5_blk"}}]},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333", "Parent" : "0", "Child" : ["16", "18", "24", "25", "27", "29", "32", "34", "35", "36", "37", "38", "39", "40"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "168", "EstimateLatencyMax" : "170",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "xin1", "Type" : "None", "Direction" : "I"},
			{"Name" : "xin2", "Type" : "None", "Direction" : "I"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_filtez_fu_318", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "25", "SubInstance" : "grp_upzero_fu_361", "Port" : "bli", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_filtez_fu_318", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "25", "SubInstance" : "grp_upzero_fu_361", "Port" : "dlti", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_quantl_fu_336", "Port" : "decis_levl", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_quantl_fu_336", "Port" : "quant26bt_pos", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_quantl_fu_336", "Port" : "quant26bt_neg", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_filtez_fu_318", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "27", "SubInstance" : "grp_upzero_fu_370", "Port" : "bli", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_filtez_fu_318", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "27", "SubInstance" : "grp_upzero_fu_370", "Port" : "dlti", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "encode_label0", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "encode_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_filtez_fu_318", "Parent" : "15", "Child" : ["17"],
		"CDFG" : "filtez",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bpl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dlt", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_filtez_fu_318.mul_16s_32s_48_1_1_U44", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336", "Parent" : "15", "Child" : ["19", "20", "21", "22", "23"],
		"CDFG" : "quantl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "62", "EstimateLatencyMax" : "64",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "el", "Type" : "None", "Direction" : "I"},
			{"Name" : "detl", "Type" : "None", "Direction" : "I"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "quantl_label9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336.decis_levl_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336.quant26bt_pos_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336.quant26bt_neg_U", "Parent" : "18"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336.wd_abs_r_fu_116", "Parent" : "18",
		"CDFG" : "abs_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "n", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_336.mul_15ns_15ns_30_1_1_U57", "Parent" : "18"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.tmp_9_abs_r_fu_348", "Parent" : "15",
		"CDFG" : "abs_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "n", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_361", "Parent" : "15", "Child" : ["26"],
		"CDFG" : "upzero",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dlt", "Type" : "None", "Direction" : "I"},
			{"Name" : "dlti", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bli", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_361.mul_16s_16s_32_1_1_U70", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_370", "Parent" : "15", "Child" : ["28"],
		"CDFG" : "upzero",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dlt", "Type" : "None", "Direction" : "I"},
			{"Name" : "dlti", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bli", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_370.mul_16s_16s_32_1_1_U70", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_uppol2_fu_388", "Parent" : "15", "Child" : ["30", "31"],
		"CDFG" : "uppol2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "al2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt2", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_uppol2_fu_388.mul_32s_32s_64_1_1_U75", "Parent" : "29"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_uppol2_fu_388.mul_32s_32s_64_1_1_U76", "Parent" : "29"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_uppol1_fu_422", "Parent" : "15", "Child" : ["33"],
		"CDFG" : "uppol1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "apl2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_uppol1_fu_422.mul_32s_32s_64_1_1_U83", "Parent" : "32"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15s_32s_47_1_1_U92", "Parent" : "15"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15s_32s_47_1_1_U93", "Parent" : "15"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_7s_39_1_1_U94", "Parent" : "15"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15ns_11ns_25_1_1_U95", "Parent" : "15"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_16s_15ns_31_1_1_U96", "Parent" : "15"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mux_4_2_14_1_1_U97", "Parent" : "15"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_14s_15ns_29_1_1_U98", "Parent" : "15"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399", "Parent" : "0", "Child" : ["42", "43", "45", "47", "48", "49", "50", "51", "52", "53"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "98", "EstimateLatencyMax" : "98",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_filtez_fu_317", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "45", "SubInstance" : "grp_upzero_fu_352", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_filtez_fu_317", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "45", "SubInstance" : "grp_upzero_fu_352", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "il", "Type" : "None", "Direction" : "I"},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_filtez_fu_317", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "45", "SubInstance" : "grp_upzero_fu_352", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_filtez_fu_317", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "45", "SubInstance" : "grp_upzero_fu_352", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "xout1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xout2", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "decode_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.qq6_code6_table_U", "Parent" : "41"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_filtez_fu_317", "Parent" : "41", "Child" : ["44"],
		"CDFG" : "filtez",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bpl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dlt", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_filtez_fu_317.mul_16s_32s_48_1_1_U44", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_upzero_fu_352", "Parent" : "41", "Child" : ["46"],
		"CDFG" : "upzero",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "dlt", "Type" : "None", "Direction" : "I"},
			{"Name" : "dlti", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bli", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1", "ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_upzero_fu_352.mul_16s_16s_32_1_1_U70", "Parent" : "45"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_15s_32s_47_1_1_U130", "Parent" : "41"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_15s_32s_47_1_1_U131", "Parent" : "41"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_32s_7s_39_1_1_U132", "Parent" : "41"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mux_4_2_14_1_1_U133", "Parent" : "41"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_14s_15ns_29_1_1_U134", "Parent" : "41"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_16s_15ns_31_1_1_U135", "Parent" : "41"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_16s_15ns_31_1_1_U136", "Parent" : "41"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_filtep_fu_650", "Parent" : "0", "Child" : ["55", "56"],
		"CDFG" : "filtep",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rlt1", "Type" : "None", "Direction" : "I"},
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "rlt2", "Type" : "None", "Direction" : "I"},
			{"Name" : "al2", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_filtep_fu_650.mul_15s_32s_47_1_1_U48", "Parent" : "54"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_filtep_fu_650.mul_16s_32s_47_1_1_U49", "Parent" : "54"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_logscl_fu_657", "Parent" : "0", "Child" : ["58"],
		"CDFG" : "logscl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "il", "Type" : "None", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "None", "Direction" : "I"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_logscl_fu_657.wl_code_table_U", "Parent" : "57"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_scalel_fu_663", "Parent" : "0", "Child" : ["60"],
		"CDFG" : "scalel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "nbl", "Type" : "None", "Direction" : "I"},
			{"Name" : "shift_constant", "Type" : "None", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_scalel_fu_663.ilb_table_U", "Parent" : "59"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_uppol1_fu_669", "Parent" : "0", "Child" : ["62"],
		"CDFG" : "uppol1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "apl2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol1_fu_669.mul_32s_32s_64_1_1_U83", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_676", "Parent" : "0", "Child" : ["64", "65"],
		"CDFG" : "uppol2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "al1", "Type" : "None", "Direction" : "I"},
			{"Name" : "al2", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "None", "Direction" : "I"},
			{"Name" : "plt2", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_676.mul_32s_32s_64_1_1_U75", "Parent" : "63"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_uppol2_fu_676.mul_32s_32s_64_1_1_U76", "Parent" : "63"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tmp_s_logsch_fu_684", "Parent" : "0", "Child" : ["67"],
		"CDFG" : "logsch",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ih", "Type" : "None", "Direction" : "I"},
			{"Name" : "nbh", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.tmp_s_logsch_fu_684.mux_4_2_11_1_1_U88", "Parent" : "66"}]}


set ArgLastReadFirstWriteLatency {
	adpcm_main {
		in_data {Type I LastRead 3 FirstWrite -1}
		encoded {Type IO LastRead 3 FirstWrite 4}
		decoded {Type O LastRead -1 FirstWrite 6}
		dec_detl {Type IO LastRead -1 FirstWrite -1}
		detl {Type IO LastRead -1 FirstWrite -1}
		dec_deth {Type IO LastRead -1 FirstWrite -1}
		deth {Type IO LastRead -1 FirstWrite -1}
		rlt2 {Type IO LastRead -1 FirstWrite -1}
		rlt1 {Type IO LastRead -1 FirstWrite -1}
		plt2 {Type IO LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead -1 FirstWrite -1}
		al2 {Type IO LastRead -1 FirstWrite -1}
		al1 {Type IO LastRead -1 FirstWrite -1}
		nbl {Type IO LastRead -1 FirstWrite -1}
		rh2 {Type IO LastRead -1 FirstWrite -1}
		rh1 {Type IO LastRead -1 FirstWrite -1}
		ph2 {Type IO LastRead -1 FirstWrite -1}
		ph1 {Type IO LastRead -1 FirstWrite -1}
		ah2 {Type IO LastRead -1 FirstWrite -1}
		ah1 {Type IO LastRead -1 FirstWrite -1}
		nbh {Type IO LastRead -1 FirstWrite -1}
		dec_rlt2 {Type IO LastRead -1 FirstWrite -1}
		dec_rlt1 {Type IO LastRead -1 FirstWrite -1}
		dec_plt2 {Type IO LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead -1 FirstWrite -1}
		dec_al2 {Type IO LastRead -1 FirstWrite -1}
		dec_al1 {Type IO LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead -1 FirstWrite -1}
		dec_rh2 {Type IO LastRead -1 FirstWrite -1}
		dec_rh1 {Type IO LastRead -1 FirstWrite -1}
		dec_ph2 {Type IO LastRead -1 FirstWrite -1}
		dec_ph1 {Type IO LastRead -1 FirstWrite -1}
		dec_ah2 {Type IO LastRead -1 FirstWrite -1}
		dec_ah1 {Type IO LastRead -1 FirstWrite -1}
		dec_nbh {Type IO LastRead -1 FirstWrite -1}
		delay_dltx {Type IO LastRead -1 FirstWrite -1}
		delay_dhx {Type IO LastRead -1 FirstWrite -1}
		dec_del_dltx {Type IO LastRead -1 FirstWrite -1}
		dec_del_dhx {Type IO LastRead -1 FirstWrite -1}
		delay_bpl {Type IO LastRead -1 FirstWrite -1}
		delay_bph {Type IO LastRead -1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead -1 FirstWrite -1}
		dec_del_bph {Type IO LastRead -1 FirstWrite -1}
		tqmf {Type IO LastRead -1 FirstWrite -1}
		accumc {Type IO LastRead -1 FirstWrite -1}
		accumd {Type IO LastRead -1 FirstWrite -1}
		h {Type I LastRead -1 FirstWrite -1}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type IO LastRead -1 FirstWrite -1}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		xout1 {Type IO LastRead -1 FirstWrite -1}
		xout2 {Type IO LastRead -1 FirstWrite -1}}
	reset {
		dec_detl {Type O LastRead -1 FirstWrite 0}
		detl {Type O LastRead -1 FirstWrite 0}
		dec_deth {Type O LastRead -1 FirstWrite 0}
		deth {Type O LastRead -1 FirstWrite 0}
		rlt2 {Type O LastRead -1 FirstWrite 0}
		rlt1 {Type O LastRead -1 FirstWrite 0}
		plt2 {Type O LastRead -1 FirstWrite 0}
		plt1 {Type O LastRead -1 FirstWrite 0}
		al2 {Type O LastRead -1 FirstWrite 0}
		al1 {Type O LastRead -1 FirstWrite 0}
		nbl {Type O LastRead -1 FirstWrite 0}
		rh2 {Type O LastRead -1 FirstWrite 0}
		rh1 {Type O LastRead -1 FirstWrite 0}
		ph2 {Type O LastRead -1 FirstWrite 0}
		ph1 {Type O LastRead -1 FirstWrite 0}
		ah2 {Type O LastRead -1 FirstWrite 0}
		ah1 {Type O LastRead -1 FirstWrite 0}
		nbh {Type O LastRead -1 FirstWrite 0}
		dec_rlt2 {Type O LastRead -1 FirstWrite 0}
		dec_rlt1 {Type O LastRead -1 FirstWrite 0}
		dec_plt2 {Type O LastRead -1 FirstWrite 0}
		dec_plt1 {Type O LastRead -1 FirstWrite 0}
		dec_al2 {Type O LastRead -1 FirstWrite 0}
		dec_al1 {Type O LastRead -1 FirstWrite 0}
		dec_nbl {Type O LastRead -1 FirstWrite 0}
		dec_rh2 {Type O LastRead -1 FirstWrite 0}
		dec_rh1 {Type O LastRead -1 FirstWrite 0}
		dec_ph2 {Type O LastRead -1 FirstWrite 0}
		dec_ph1 {Type O LastRead -1 FirstWrite 0}
		dec_ah2 {Type O LastRead -1 FirstWrite 0}
		dec_ah1 {Type O LastRead -1 FirstWrite 0}
		dec_nbh {Type O LastRead -1 FirstWrite 0}
		delay_dltx {Type O LastRead -1 FirstWrite 1}
		delay_dhx {Type O LastRead -1 FirstWrite 1}
		dec_del_dltx {Type O LastRead -1 FirstWrite 1}
		dec_del_dhx {Type O LastRead -1 FirstWrite 1}
		delay_bpl {Type O LastRead -1 FirstWrite 2}
		delay_bph {Type O LastRead -1 FirstWrite 2}
		dec_del_bpl {Type O LastRead -1 FirstWrite 2}
		dec_del_bph {Type O LastRead -1 FirstWrite 2}
		tqmf {Type O LastRead -1 FirstWrite 3}
		accumc {Type O LastRead -1 FirstWrite 4}
		accumd {Type O LastRead -1 FirstWrite 4}}
	encode {
		xin1 {Type I LastRead 1 FirstWrite -1}
		xin2 {Type I LastRead 1 FirstWrite -1}
		tqmf {Type IO LastRead 4 FirstWrite 4}
		h {Type I LastRead 3 FirstWrite -1}
		delay_bpl {Type IO LastRead 2 FirstWrite -1}
		delay_dltx {Type IO LastRead 3 FirstWrite -1}
		rlt1 {Type IO LastRead 4 FirstWrite 7}
		al1 {Type IO LastRead 4 FirstWrite 11}
		rlt2 {Type IO LastRead 4 FirstWrite 4}
		al2 {Type IO LastRead 4 FirstWrite 9}
		detl {Type IO LastRead 5 FirstWrite 11}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 6}
		qq4_code4_table {Type I LastRead 6 FirstWrite -1}
		nbl {Type IO LastRead 8 FirstWrite 9}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead 8 FirstWrite 8}
		plt2 {Type IO LastRead 8 FirstWrite 8}
		delay_bph {Type IO LastRead 2 FirstWrite -1}
		delay_dhx {Type IO LastRead 3 FirstWrite -1}
		rh1 {Type IO LastRead 5 FirstWrite 7}
		ah1 {Type IO LastRead 5 FirstWrite 11}
		rh2 {Type IO LastRead 5 FirstWrite 5}
		ah2 {Type IO LastRead 5 FirstWrite 9}
		deth {Type IO LastRead 6 FirstWrite 9}
		nbh {Type IO LastRead 8 FirstWrite 8}
		ph1 {Type IO LastRead 8 FirstWrite 8}
		ph2 {Type IO LastRead 8 FirstWrite 8}}
	filtez {
		bpl {Type I LastRead 2 FirstWrite -1}
		dlt {Type I LastRead 2 FirstWrite -1}}
	quantl {
		el {Type I LastRead 0 FirstWrite -1}
		detl {Type I LastRead 0 FirstWrite -1}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}}
	abs_r {
		n {Type I LastRead 0 FirstWrite -1}}
	abs_r {
		n {Type I LastRead 0 FirstWrite -1}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	uppol2 {
		al1 {Type I LastRead 1 FirstWrite -1}
		al2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}
		plt2 {Type I LastRead 0 FirstWrite -1}}
	uppol1 {
		al1 {Type I LastRead 0 FirstWrite -1}
		apl2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}}
	decode {
		input_r {Type I LastRead 1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 2 FirstWrite -1}
		dec_del_dltx {Type IO LastRead 3 FirstWrite -1}
		dec_rlt1 {Type IO LastRead 3 FirstWrite 4}
		dec_al1 {Type IO LastRead 3 FirstWrite 7}
		dec_rlt2 {Type IO LastRead 3 FirstWrite 3}
		dec_al2 {Type IO LastRead 3 FirstWrite 5}
		dec_detl {Type IO LastRead 3 FirstWrite 5}
		qq4_code4_table {Type I LastRead 2 FirstWrite -1}
		il {Type I LastRead 2 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 2 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 4 FirstWrite 4}
		dec_plt2 {Type IO LastRead 4 FirstWrite 4}
		dec_del_bph {Type IO LastRead 2 FirstWrite -1}
		dec_del_dhx {Type IO LastRead 3 FirstWrite -1}
		dec_rh1 {Type IO LastRead 4 FirstWrite 4}
		dec_ah1 {Type IO LastRead 2 FirstWrite 5}
		dec_rh2 {Type IO LastRead 4 FirstWrite 4}
		dec_ah2 {Type IO LastRead 2 FirstWrite 3}
		dec_deth {Type IO LastRead 1 FirstWrite 3}
		dec_nbh {Type IO LastRead 2 FirstWrite 2}
		dec_ph1 {Type IO LastRead 2 FirstWrite 2}
		dec_ph2 {Type IO LastRead 2 FirstWrite 2}
		accumc {Type IO LastRead 10 FirstWrite 10}
		h {Type I LastRead 9 FirstWrite -1}
		accumd {Type IO LastRead 10 FirstWrite 10}
		xout1 {Type O LastRead -1 FirstWrite 9}
		xout2 {Type O LastRead -1 FirstWrite 9}}
	filtez {
		bpl {Type I LastRead 2 FirstWrite -1}
		dlt {Type I LastRead 2 FirstWrite -1}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	filtep {
		rlt1 {Type I LastRead 0 FirstWrite -1}
		al1 {Type I LastRead 0 FirstWrite -1}
		rlt2 {Type I LastRead 0 FirstWrite -1}
		al2 {Type I LastRead 0 FirstWrite -1}}
	logscl {
		il {Type I LastRead 0 FirstWrite -1}
		nbl {Type I LastRead 1 FirstWrite -1}
		wl_code_table {Type I LastRead -1 FirstWrite -1}}
	scalel {
		nbl {Type I LastRead 0 FirstWrite -1}
		shift_constant {Type I LastRead 1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}}
	uppol1 {
		al1 {Type I LastRead 0 FirstWrite -1}
		apl2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}}
	uppol2 {
		al1 {Type I LastRead 1 FirstWrite -1}
		al2 {Type I LastRead 1 FirstWrite -1}
		plt {Type I LastRead 0 FirstWrite -1}
		plt1 {Type I LastRead 0 FirstWrite -1}
		plt2 {Type I LastRead 0 FirstWrite -1}}
	logsch {
		ih {Type I LastRead 0 FirstWrite -1}
		nbh {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "13704", "Max" : "13804"}
	, {"Name" : "Interval", "Min" : "13705", "Max" : "13805"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_data { ap_memory {  { in_data_address0 mem_address 1 7 }  { in_data_ce0 mem_ce 1 1 }  { in_data_q0 mem_dout 0 32 }  { in_data_address1 MemPortADDR2 1 7 }  { in_data_ce1 MemPortCE2 1 1 }  { in_data_q1 MemPortDOUT2 0 32 } } }
	encoded { ap_memory {  { encoded_address0 mem_address 1 6 }  { encoded_ce0 mem_ce 1 1 }  { encoded_we0 mem_we 1 1 }  { encoded_d0 mem_din 1 32 }  { encoded_q0 in_data 0 32 } } }
	decoded { ap_memory {  { decoded_address0 mem_address 1 7 }  { decoded_ce0 mem_ce 1 1 }  { decoded_we0 mem_we 1 1 }  { decoded_d0 mem_din 1 32 }  { decoded_address1 MemPortADDR2 1 7 }  { decoded_ce1 MemPortCE2 1 1 }  { decoded_we1 MemPortWE2 1 1 }  { decoded_d1 MemPortDIN2 1 32 } } }
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
