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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "36"],
		"CDFG" : "adpcm_main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "15203", "EstimateLatencyMax" : "15303",
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
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_detl", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "detl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_deth", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "deth", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "rlt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "rlt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "plt2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "plt1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "al2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "al1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "nbl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "rh2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "rh1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "ph2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "ph1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "ah2", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "ah1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "nbh", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_rlt2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_rlt1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_plt2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_plt1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_al2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_al1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_nbl", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_rh2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_rh1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_ph2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_ph1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_ah2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_ah1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_nbh", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "delay_dltx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "delay_dhx", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_del_dltx", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_del_dhx", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "delay_bpl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "delay_bph", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_del_bpl", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "dec_del_bph", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "tqmf", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "accumc", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "accumd", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "h", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "h", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "h", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "decis_levl", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "quant26bt_pos", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "quant26bt_neg", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "il", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "il", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "il", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "qq4_code4_table", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "qq4_code4_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "wl_code_table", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "wl_code_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_encode_fu_453", "Port" : "ilb_table", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "ilb_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "qq6_code6_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "xout1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_decode_fu_519", "Port" : "xout2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]}],
		"Loop" : [
			{"Name" : "reset_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}},
			{"Name" : "reset_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "reset_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state4_blk"}},
			{"Name" : "reset_label7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state5_blk"}},
			{"Name" : "adpcm_main_label12", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "adpcm_main_label13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
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
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453", "Parent" : "0", "Child" : ["17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "193", "EstimateLatencyMax" : "195",
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
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "decis_levl", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO"},
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
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "encode_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state9", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state9"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "quantl_label9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state13"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state14"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18", "ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state19"], "PostState" : ["ap_ST_fsm_state20", "ap_ST_fsm_state19"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state24", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state24"], "PreState" : ["ap_ST_fsm_state23"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state31"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state28", "ap_ST_fsm_state30"], "PostState" : ["ap_ST_fsm_state30", "ap_ST_fsm_state32"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state30"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state28", "ap_ST_fsm_state31"], "PostState" : ["ap_ST_fsm_state32", "ap_ST_fsm_state31"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.decis_levl_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.quant26bt_pos_U", "Parent" : "16"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.quant26bt_neg_U", "Parent" : "16"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_14s_32s_46_1_1_U1", "Parent" : "16"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_15s_32s_47_1_1_U2", "Parent" : "16"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_15s_32s_47_1_1_U3", "Parent" : "16"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_16s_32s_47_1_1_U4", "Parent" : "16"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_16s_32s_48_1_1_U5", "Parent" : "16"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_32s_32s_64_1_1_U6", "Parent" : "16"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_32s_32s_64_1_1_U7", "Parent" : "16"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_32s_7s_39_1_1_U8", "Parent" : "16"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_15ns_15ns_30_1_1_U9", "Parent" : "16"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_16s_15ns_31_1_1_U10", "Parent" : "16"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_16s_16s_32_1_1_U11", "Parent" : "16"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_15ns_11ns_25_1_1_U12", "Parent" : "16"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mux_4_2_14_1_1_U13", "Parent" : "16"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_14s_15ns_29_1_1_U14", "Parent" : "16"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mux_4_2_11_1_1_U15", "Parent" : "16"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_encode_fu_453.mul_14s_14s_28_1_1_U16", "Parent" : "16"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519", "Parent" : "0", "Child" : ["37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "103", "EstimateLatencyMax" : "103",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO"},
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
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO"},
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
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6", "ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state8", "ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6", "ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state10", "ap_ST_fsm_state9"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "filtez_label8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state13"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18", "ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "upzero_label11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16", "ap_ST_fsm_state19"], "PostState" : ["ap_ST_fsm_state20", "ap_ST_fsm_state19"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state24", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state24"], "PreState" : ["ap_ST_fsm_state23"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "decode_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "28", "FirstState" : "ap_ST_fsm_state27", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state27"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.qq6_code6_table_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_14s_32s_46_1_1_U62", "Parent" : "36"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_15s_32s_47_1_1_U63", "Parent" : "36"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_15s_32s_47_1_1_U64", "Parent" : "36"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_16s_32s_47_1_1_U65", "Parent" : "36"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_16s_32s_48_1_1_U66", "Parent" : "36"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_32s_32s_64_1_1_U67", "Parent" : "36"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_32s_32s_64_1_1_U68", "Parent" : "36"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_32s_7s_39_1_1_U69", "Parent" : "36"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_16s_15ns_31_1_1_U70", "Parent" : "36"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_16s_15ns_31_1_1_U71", "Parent" : "36"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_16s_16s_32_1_1_U72", "Parent" : "36"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mux_4_2_11_1_1_U73", "Parent" : "36"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mux_4_2_14_1_1_U74", "Parent" : "36"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_14s_15ns_29_1_1_U75", "Parent" : "36"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_decode_fu_519.mul_14s_14s_28_1_1_U76", "Parent" : "36"}]}


set ArgLastReadFirstWriteLatency {
	adpcm_main {
		in_data {Type I LastRead 6 FirstWrite -1}
		encoded {Type IO LastRead 6 FirstWrite 7}
		decoded {Type O LastRead -1 FirstWrite 9}
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
	encode {
		xin1 {Type I LastRead 1 FirstWrite -1}
		xin2 {Type I LastRead 1 FirstWrite -1}
		tqmf {Type IO LastRead 4 FirstWrite 4}
		h {Type I LastRead 3 FirstWrite -1}
		delay_bpl {Type IO LastRead 14 FirstWrite 14}
		delay_dltx {Type IO LastRead 15 FirstWrite 14}
		rlt1 {Type IO LastRead 6 FirstWrite 13}
		al1 {Type IO LastRead 6 FirstWrite 14}
		rlt2 {Type IO LastRead 6 FirstWrite 13}
		al2 {Type IO LastRead 6 FirstWrite 14}
		detl {Type IO LastRead 7 FirstWrite 12}
		decis_levl {Type I LastRead -1 FirstWrite -1}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 12}
		qq4_code4_table {Type I LastRead 10 FirstWrite -1}
		nbl {Type IO LastRead 11 FirstWrite 11}
		wl_code_table {Type I LastRead 10 FirstWrite -1}
		ilb_table {Type I LastRead 20 FirstWrite -1}
		plt1 {Type IO LastRead 13 FirstWrite 13}
		plt2 {Type IO LastRead 13 FirstWrite 13}
		delay_bph {Type IO LastRead 23 FirstWrite 23}
		delay_dhx {Type IO LastRead 24 FirstWrite 23}
		rh1 {Type IO LastRead 18 FirstWrite 22}
		ah1 {Type IO LastRead 18 FirstWrite 23}
		rh2 {Type IO LastRead 18 FirstWrite 22}
		ah2 {Type IO LastRead 18 FirstWrite 23}
		deth {Type IO LastRead 19 FirstWrite 21}
		nbh {Type IO LastRead 20 FirstWrite 20}
		ph1 {Type IO LastRead 22 FirstWrite 22}
		ph2 {Type IO LastRead 22 FirstWrite 22}}
	decode {
		input_r {Type I LastRead 1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 6 FirstWrite 6}
		dec_del_dltx {Type IO LastRead 7 FirstWrite 6}
		dec_rlt1 {Type IO LastRead 3 FirstWrite 5}
		dec_al1 {Type IO LastRead 3 FirstWrite 6}
		dec_rlt2 {Type IO LastRead 3 FirstWrite 5}
		dec_al2 {Type IO LastRead 3 FirstWrite 6}
		dec_detl {Type IO LastRead 4 FirstWrite 4}
		qq4_code4_table {Type I LastRead 2 FirstWrite -1}
		il {Type I LastRead 3 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 3 FirstWrite 3}
		wl_code_table {Type I LastRead 2 FirstWrite -1}
		ilb_table {Type I LastRead 10 FirstWrite -1}
		dec_plt1 {Type IO LastRead 5 FirstWrite 5}
		dec_plt2 {Type IO LastRead 5 FirstWrite 5}
		dec_del_bph {Type IO LastRead 13 FirstWrite 13}
		dec_del_dhx {Type IO LastRead 14 FirstWrite 13}
		dec_rh1 {Type IO LastRead 11 FirstWrite 12}
		dec_ah1 {Type IO LastRead 11 FirstWrite 13}
		dec_rh2 {Type IO LastRead 11 FirstWrite 12}
		dec_ah2 {Type IO LastRead 11 FirstWrite 13}
		dec_deth {Type IO LastRead 11 FirstWrite 11}
		dec_nbh {Type IO LastRead 10 FirstWrite 10}
		dec_ph1 {Type IO LastRead 12 FirstWrite 12}
		dec_ph2 {Type IO LastRead 12 FirstWrite 12}
		accumc {Type IO LastRead 19 FirstWrite 19}
		h {Type I LastRead 18 FirstWrite -1}
		accumd {Type IO LastRead 19 FirstWrite 19}
		xout1 {Type O LastRead -1 FirstWrite 18}
		xout2 {Type O LastRead -1 FirstWrite 18}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "15203", "Max" : "15303"}
	, {"Name" : "Interval", "Min" : "15204", "Max" : "15304"}
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
