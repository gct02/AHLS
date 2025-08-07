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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "42"],
		"CDFG" : "adpcm_main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13404", "EstimateLatencyMax" : "13504",
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
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_detl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_detl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "detl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "detl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_deth", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_deth", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "deth", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "deth", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "rlt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "rlt2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "rlt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "rlt1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "plt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "plt2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "plt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "plt1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "al2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "al2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "al1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "al1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "nbl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "nbl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "rh2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "rh2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "rh1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "rh1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "ph2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "ph2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "ph1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "ph1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "ah2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "ah2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "ah1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "ah1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "nbh", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "nbh", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rlt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rlt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rlt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rlt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_plt2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_plt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_plt1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_plt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_al2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_al2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_al1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_al1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_nbl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_nbl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rh2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rh2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_rh1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_rh1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ph2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ph2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ph1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ph1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ah2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ah2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_ah1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_ah1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_nbh", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_nbh", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_dltx", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_dhx", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_dltx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_dhx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_bpl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "delay_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "delay_bph", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_bpl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "dec_del_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "dec_del_bph", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "tqmf", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "tqmf", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "accumc", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "accumc", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_reset_fu_243", "Port" : "accumd", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "accumd", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "h", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "h", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "decis_levl", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "quant26bt_pos", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "quant26bt_neg", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "il", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "il", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "il", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "qq4_code4_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "qq4_code4_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "wl_code_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "wl_code_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_encode_fu_333", "Port" : "ilb_table", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "ilb_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "qq6_code6_table", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "xout1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_decode_fu_399", "Port" : "xout2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}],
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
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.wl_code_table_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ilb_table_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reset_fu_243", "Parent" : "0",
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
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333", "Parent" : "0", "Child" : ["18", "20", "25", "27", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "165", "EstimateLatencyMax" : "167",
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
					{"ID" : "25", "SubInstance" : "grp_upzero_fu_452", "Port" : "bli", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "18", "SubInstance" : "grp_filtez_fu_430", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_upzero_fu_452", "Port" : "dlti", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "18", "SubInstance" : "grp_filtez_fu_430", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_quantl_fu_440", "Port" : "decis_levl", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_quantl_fu_440", "Port" : "quant26bt_pos", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_quantl_fu_440", "Port" : "quant26bt_neg", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_upzero_fu_461", "Port" : "bli", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "18", "SubInstance" : "grp_filtez_fu_430", "Port" : "bpl", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_upzero_fu_461", "Port" : "dlti", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "18", "SubInstance" : "grp_filtez_fu_430", "Port" : "dlt", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
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
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "encode_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_filtez_fu_430", "Parent" : "17", "Child" : ["19"],
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
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_filtez_fu_430.mul_16s_32s_48_1_1_U44", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_440", "Parent" : "17", "Child" : ["21", "22", "23", "24"],
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
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_440.decis_levl_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_440.quant26bt_pos_U", "Parent" : "20"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_440.quant26bt_neg_U", "Parent" : "20"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_quantl_fu_440.mul_15ns_15ns_30_1_1_U48", "Parent" : "20"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_452", "Parent" : "17", "Child" : ["26"],
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
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_452.mul_16s_16s_32_1_1_U55", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_461", "Parent" : "17", "Child" : ["28"],
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
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.grp_upzero_fu_461.mul_16s_16s_32_1_1_U55", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15s_32s_47_1_1_U60", "Parent" : "17"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15s_32s_47_1_1_U61", "Parent" : "17"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_16s_32s_47_1_1_U62", "Parent" : "17"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_32s_64_1_1_U63", "Parent" : "17"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_32s_64_1_1_U64", "Parent" : "17"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_32s_64_1_1_U65", "Parent" : "17"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_32s_64_1_1_U66", "Parent" : "17"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_32s_7s_39_1_1_U67", "Parent" : "17"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_15ns_11ns_25_1_1_U68", "Parent" : "17"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_16s_15ns_31_1_1_U69", "Parent" : "17"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mux_4_2_14_1_1_U70", "Parent" : "17"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mul_14s_15ns_29_1_1_U71", "Parent" : "17"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_333.mux_4_2_11_1_1_U72", "Parent" : "17"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399", "Parent" : "0", "Child" : ["43", "44", "46", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "95", "EstimateLatencyMax" : "95",
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
					{"ID" : "44", "SubInstance" : "grp_filtez_fu_433", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "46", "SubInstance" : "grp_upzero_fu_443", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_filtez_fu_433", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "46", "SubInstance" : "grp_upzero_fu_443", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
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
					{"ID" : "44", "SubInstance" : "grp_filtez_fu_433", "Port" : "bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "46", "SubInstance" : "grp_upzero_fu_443", "Port" : "bli", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_filtez_fu_433", "Port" : "dlt", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "46", "SubInstance" : "grp_upzero_fu_443", "Port" : "dlti", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
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
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.qq6_code6_table_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_filtez_fu_433", "Parent" : "42", "Child" : ["45"],
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
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_filtez_fu_433.mul_16s_32s_48_1_1_U44", "Parent" : "44"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_upzero_fu_443", "Parent" : "42", "Child" : ["47"],
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
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.grp_upzero_fu_443.mul_16s_16s_32_1_1_U55", "Parent" : "46"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_15s_32s_47_1_1_U110", "Parent" : "42"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_15s_32s_47_1_1_U111", "Parent" : "42"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_16s_32s_47_1_1_U112", "Parent" : "42"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_32s_32s_64_1_1_U113", "Parent" : "42"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_32s_32s_64_1_1_U114", "Parent" : "42"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_32s_7s_39_1_1_U115", "Parent" : "42"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_16s_15ns_31_1_1_U116", "Parent" : "42"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_16s_15ns_31_1_1_U117", "Parent" : "42"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mux_4_2_11_1_1_U118", "Parent" : "42"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mux_4_2_14_1_1_U119", "Parent" : "42"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_399.mul_14s_15ns_29_1_1_U120", "Parent" : "42"}]}


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
		al1 {Type IO LastRead 4 FirstWrite 9}
		rlt2 {Type IO LastRead 4 FirstWrite 4}
		al2 {Type IO LastRead 4 FirstWrite 9}
		detl {Type IO LastRead 5 FirstWrite 8}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 6}
		qq4_code4_table {Type I LastRead 6 FirstWrite -1}
		nbl {Type IO LastRead 7 FirstWrite 7}
		wl_code_table {Type I LastRead 6 FirstWrite -1}
		ilb_table {Type I LastRead 8 FirstWrite -1}
		plt1 {Type IO LastRead 8 FirstWrite 8}
		plt2 {Type IO LastRead 8 FirstWrite 8}
		delay_bph {Type IO LastRead 2 FirstWrite -1}
		delay_dhx {Type IO LastRead 3 FirstWrite -1}
		rh1 {Type IO LastRead 5 FirstWrite 7}
		ah1 {Type IO LastRead 5 FirstWrite 9}
		rh2 {Type IO LastRead 5 FirstWrite 5}
		ah2 {Type IO LastRead 5 FirstWrite 9}
		deth {Type IO LastRead 6 FirstWrite 8}
		nbh {Type IO LastRead 7 FirstWrite 7}
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
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}
	decode {
		input_r {Type I LastRead 1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 2 FirstWrite -1}
		dec_del_dltx {Type IO LastRead 3 FirstWrite -1}
		dec_rlt1 {Type IO LastRead 3 FirstWrite 4}
		dec_al1 {Type IO LastRead 3 FirstWrite 4}
		dec_rlt2 {Type IO LastRead 3 FirstWrite 3}
		dec_al2 {Type IO LastRead 3 FirstWrite 4}
		dec_detl {Type IO LastRead 2 FirstWrite 3}
		qq4_code4_table {Type I LastRead 1 FirstWrite -1}
		il {Type I LastRead 1 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 2 FirstWrite 2}
		wl_code_table {Type I LastRead 1 FirstWrite -1}
		ilb_table {Type I LastRead 3 FirstWrite -1}
		dec_plt1 {Type IO LastRead 3 FirstWrite 3}
		dec_plt2 {Type IO LastRead 3 FirstWrite 3}
		dec_del_bph {Type IO LastRead 2 FirstWrite -1}
		dec_del_dhx {Type IO LastRead 3 FirstWrite -1}
		dec_rh1 {Type IO LastRead 4 FirstWrite 4}
		dec_ah1 {Type IO LastRead 4 FirstWrite 5}
		dec_rh2 {Type IO LastRead 4 FirstWrite 4}
		dec_ah2 {Type IO LastRead 4 FirstWrite 5}
		dec_deth {Type IO LastRead 3 FirstWrite 3}
		dec_nbh {Type IO LastRead 2 FirstWrite 2}
		dec_ph1 {Type IO LastRead 4 FirstWrite 4}
		dec_ph2 {Type IO LastRead 4 FirstWrite 4}
		accumc {Type IO LastRead 8 FirstWrite 8}
		h {Type I LastRead 7 FirstWrite -1}
		accumd {Type IO LastRead 8 FirstWrite 8}
		xout1 {Type O LastRead -1 FirstWrite 7}
		xout2 {Type O LastRead -1 FirstWrite 7}}
	filtez {
		bpl {Type I LastRead 2 FirstWrite -1}
		dlt {Type I LastRead 2 FirstWrite -1}}
	upzero {
		dlt {Type I LastRead 0 FirstWrite -1}
		dlti {Type IO LastRead 3 FirstWrite 3}
		bli {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "13404", "Max" : "13504"}
	, {"Name" : "Interval", "Min" : "13405", "Max" : "13505"}
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
