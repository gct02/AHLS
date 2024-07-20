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
	{ input_samples int 32 regular {array 8000 { 1 1 } 1 1 }  }
	{ compressed int 32 regular {array 4000 { 2 3 } 1 1 }  }
	{ result int 32 regular {array 8000 { 0 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_samples", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "compressed", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "result", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_samples_address0 sc_out sc_lv 13 signal 0 } 
	{ input_samples_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_samples_q0 sc_in sc_lv 32 signal 0 } 
	{ input_samples_address1 sc_out sc_lv 13 signal 0 } 
	{ input_samples_ce1 sc_out sc_logic 1 signal 0 } 
	{ input_samples_q1 sc_in sc_lv 32 signal 0 } 
	{ compressed_address0 sc_out sc_lv 12 signal 1 } 
	{ compressed_ce0 sc_out sc_logic 1 signal 1 } 
	{ compressed_we0 sc_out sc_logic 1 signal 1 } 
	{ compressed_d0 sc_out sc_lv 32 signal 1 } 
	{ compressed_q0 sc_in sc_lv 32 signal 1 } 
	{ result_address0 sc_out sc_lv 13 signal 2 } 
	{ result_ce0 sc_out sc_logic 1 signal 2 } 
	{ result_we0 sc_out sc_logic 1 signal 2 } 
	{ result_d0 sc_out sc_lv 32 signal 2 } 
	{ result_address1 sc_out sc_lv 13 signal 2 } 
	{ result_ce1 sc_out sc_logic 1 signal 2 } 
	{ result_we1 sc_out sc_logic 1 signal 2 } 
	{ result_d1 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_samples_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "input_samples", "role": "address0" }} , 
 	{ "name": "input_samples_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_samples", "role": "ce0" }} , 
 	{ "name": "input_samples_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_samples", "role": "q0" }} , 
 	{ "name": "input_samples_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "input_samples", "role": "address1" }} , 
 	{ "name": "input_samples_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_samples", "role": "ce1" }} , 
 	{ "name": "input_samples_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_samples", "role": "q1" }} , 
 	{ "name": "compressed_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "compressed", "role": "address0" }} , 
 	{ "name": "compressed_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compressed", "role": "ce0" }} , 
 	{ "name": "compressed_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "compressed", "role": "we0" }} , 
 	{ "name": "compressed_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compressed", "role": "d0" }} , 
 	{ "name": "compressed_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "compressed", "role": "q0" }} , 
 	{ "name": "result_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "result", "role": "address0" }} , 
 	{ "name": "result_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "ce0" }} , 
 	{ "name": "result_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "we0" }} , 
 	{ "name": "result_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result", "role": "d0" }} , 
 	{ "name": "result_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "result", "role": "address1" }} , 
 	{ "name": "result_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "ce1" }} , 
 	{ "name": "result_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result", "role": "we1" }} , 
 	{ "name": "result_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "14", "16", "18", "20", "90"],
		"CDFG" : "adpcm_main",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "484050", "EstimateLatencyMax" : "484050",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_samples", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "input_samples", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "compressed", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "compressed", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "compressed", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "result", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "result", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_detl", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "detl", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_deth", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "deth", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "rlt2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "rlt1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "plt2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "plt1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "al2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "al1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "nbl", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "rh2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "rh1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "ph2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "ph1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "ah2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "ah1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "nbh", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_rlt2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_rlt1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_plt2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_plt1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_al2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_al1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_nbl", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_rh2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_rh1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_ph2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_ph1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_ah2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_ah1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_nbh", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label4_fu_148", "Port" : "delay_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "delay_dltx", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label4_fu_148", "Port" : "delay_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "delay_dhx", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label4_fu_148", "Port" : "dec_del_dltx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_del_dltx", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label4_fu_148", "Port" : "dec_del_dhx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_del_dhx", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label5_fu_160", "Port" : "delay_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "delay_bpl", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label5_fu_160", "Port" : "delay_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "delay_bph", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label5_fu_160", "Port" : "dec_del_bpl", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_del_bpl", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label5_fu_160", "Port" : "dec_del_bph", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "dec_del_bph", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label6_fu_172", "Port" : "tqmf", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "tqmf", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label7_fu_178", "Port" : "accumc", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "accumc", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_adpcm_main_Pipeline_reset_label7_fu_178", "Port" : "accumd", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "accumd", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "quant26bt_pos", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "quant26bt_neg", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "il", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "il", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "il", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "qq4_code4_table", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "qq4_code4_table", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "wl_code_table", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "wl_code_table", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "ilb_table", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "20", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Port" : "ilb_table", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "qq6_code6_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "xout1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Port" : "xout2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
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
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label4_fu_148", "Parent" : "0", "Child" : ["13"],
		"CDFG" : "adpcm_main_Pipeline_reset_label4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label4_fu_148.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label5_fu_160", "Parent" : "0", "Child" : ["15"],
		"CDFG" : "adpcm_main_Pipeline_reset_label5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label5_fu_160.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label6_fu_172", "Parent" : "0", "Child" : ["17"],
		"CDFG" : "adpcm_main_Pipeline_reset_label6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "26",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label6_fu_172.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label7_fu_178", "Parent" : "0", "Child" : ["19"],
		"CDFG" : "adpcm_main_Pipeline_reset_label7",
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
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "reset_label7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_reset_label7_fu_178.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186", "Parent" : "0", "Child" : ["21", "89"],
		"CDFG" : "adpcm_main_Pipeline_adpcm_main_label12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "340016", "EstimateLatencyMax" : "340016",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_samples", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "compressed", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "rlt1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "al1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "rlt2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "al2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "detl", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "quant26bt_pos", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "quant26bt_neg", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "il", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "qq4_code4_table", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "nbl", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "wl_code_table", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "ilb_table", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "plt1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "plt2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "rh1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "ah1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "rh2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "ah2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "deth", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "nbh", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "ph1", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "ph2", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "tqmf", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "delay_bpl", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "delay_dltx", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "delay_bph", "Inst_start_state" : "3", "Inst_end_state" : "100"}]},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_encode_fu_138", "Port" : "delay_dhx", "Inst_start_state" : "3", "Inst_end_state" : "100"}]}],
		"Loop" : [
			{"Name" : "adpcm_main_label12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "85", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage14", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage14_subdone", "QuitState" : "ap_ST_fsm_pp0_stage14", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage14_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138", "Parent" : "20", "Child" : ["22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88"],
		"CDFG" : "encode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "85",
		"VariableLatency" : "0", "ExactLatency" : "97", "EstimateLatencyMin" : "97", "EstimateLatencyMax" : "97",
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
			{"Name" : "rlt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rlt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "al2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "detl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "quant26bt_pos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "quant26bt_neg", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "il", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "nbl", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "plt1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "plt2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tqmf", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dltx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "delay_dhx", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.quant26bt_pos_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.quant26bt_neg_U", "Parent" : "21"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.qq4_code4_table_U", "Parent" : "21"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.wl_code_table_U", "Parent" : "21"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.ilb_table_U", "Parent" : "21"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_32s_46_5_1_U12", "Parent" : "21"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_32s_46_5_1_U13", "Parent" : "21"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15s_32s_47_5_1_U14", "Parent" : "21"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_32s_46_5_1_U15", "Parent" : "21"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_32s_46_5_1_U16", "Parent" : "21"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_32s_47_5_1_U17", "Parent" : "21"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_32s_64_5_1_U18", "Parent" : "21"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_32s_64_5_1_U19", "Parent" : "21"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_9ns_41_5_1_U20", "Parent" : "21"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_9ns_41_5_1_U21", "Parent" : "21"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_12ns_44_5_1_U22", "Parent" : "21"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_13ns_45_5_1_U23", "Parent" : "21"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_15ns_47_5_1_U24", "Parent" : "21"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_11s_42_5_1_U25", "Parent" : "21"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_11s_43_5_1_U26", "Parent" : "21"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_13s_44_5_1_U27", "Parent" : "21"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_32s_13s_45_5_1_U28", "Parent" : "21"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_33s_7s_40_5_1_U29", "Parent" : "21"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_11ns_25_2_1_U30", "Parent" : "21"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_10ns_24_2_1_U31", "Parent" : "21"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_11ns_25_2_1_U32", "Parent" : "21"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mux_4_2_14_1_1_U33", "Parent" : "21"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mux_4_2_11_1_1_U34", "Parent" : "21"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_15ns_29_2_1_U35", "Parent" : "21"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_12ns_26_2_1_U36", "Parent" : "21"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U37", "Parent" : "21"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U38", "Parent" : "21"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U39", "Parent" : "21"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U40", "Parent" : "21"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U41", "Parent" : "21"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_14s_14s_28_2_1_U42", "Parent" : "21"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_12ns_26_2_1_U43", "Parent" : "21"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_12ns_26_2_1_U44", "Parent" : "21"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_13ns_27_2_1_U45", "Parent" : "21"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_13ns_27_2_1_U46", "Parent" : "21"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_13ns_27_2_1_U47", "Parent" : "21"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_13ns_27_2_1_U48", "Parent" : "21"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_13ns_27_2_1_U49", "Parent" : "21"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U50", "Parent" : "21"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U51", "Parent" : "21"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U52", "Parent" : "21"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U53", "Parent" : "21"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U54", "Parent" : "21"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U55", "Parent" : "21"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_14ns_28_2_1_U56", "Parent" : "21"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U57", "Parent" : "21"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U58", "Parent" : "21"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U59", "Parent" : "21"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U60", "Parent" : "21"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U61", "Parent" : "21"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U62", "Parent" : "21"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_15ns_29_2_1_U63", "Parent" : "21"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_16ns_30_2_1_U64", "Parent" : "21"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_16ns_30_2_1_U65", "Parent" : "21"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_15ns_16ns_30_2_1_U66", "Parent" : "21"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_15ns_31_2_1_U67", "Parent" : "21"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U68", "Parent" : "21"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U69", "Parent" : "21"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U70", "Parent" : "21"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U71", "Parent" : "21"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U72", "Parent" : "21"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.grp_encode_fu_138.mul_16s_16s_32_2_1_U73", "Parent" : "21"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248", "Parent" : "0", "Child" : ["91", "132"],
		"CDFG" : "adpcm_main_Pipeline_adpcm_main_label13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "144003", "EstimateLatencyMax" : "144003",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "compressed", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "result", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "dec_rlt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rlt1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_al1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_al1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rlt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rlt2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_al2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_al2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_detl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_detl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "qq4_code4_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "qq4_code4_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "il", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "il", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "qq6_code6_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "qq6_code6_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_nbl", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_nbl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "wl_code_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "wl_code_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "ilb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "ilb_table", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_plt1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_plt1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_plt2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_plt2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rh1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ah1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_rh2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ah2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_deth", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_nbh", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ph1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_ph2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "xout1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "xout1", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "xout2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "xout2", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_bpl", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_dltx", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_bph", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "dec_del_dhx", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "accumc", "Inst_start_state" : "3", "Inst_end_state" : "37"}]},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_decode_fu_142", "Port" : "accumd", "Inst_start_state" : "3", "Inst_end_state" : "37"}]}],
		"Loop" : [
			{"Name" : "adpcm_main_label13", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "36", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142", "Parent" : "90", "Child" : ["92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131"],
		"CDFG" : "decode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "10",
		"VariableLatency" : "0", "ExactLatency" : "34", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
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
			{"Name" : "dec_rh1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_rh2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ah2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_deth", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_nbh", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dec_ph2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "xout1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "xout2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "dec_del_bpl", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dltx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_bph", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "dec_del_dhx", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "accumc", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "accumd", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.qq4_code4_table_U", "Parent" : "91"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.qq6_code6_table_U", "Parent" : "91"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.wl_code_table_U", "Parent" : "91"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.ilb_table_U", "Parent" : "91"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_32s_46_5_1_U154", "Parent" : "91"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_32s_46_5_1_U155", "Parent" : "91"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_15s_32s_47_5_1_U156", "Parent" : "91"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_32s_46_5_1_U157", "Parent" : "91"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_32s_46_5_1_U158", "Parent" : "91"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_32s_47_5_1_U159", "Parent" : "91"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_32s_64_5_1_U160", "Parent" : "91"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_32s_64_5_1_U161", "Parent" : "91"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_9ns_41_5_1_U162", "Parent" : "91"},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_12ns_44_5_1_U163", "Parent" : "91"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_12ns_44_5_1_U164", "Parent" : "91"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_13ns_45_5_1_U165", "Parent" : "91"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_15ns_46_5_1_U166", "Parent" : "91"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_11s_42_5_1_U167", "Parent" : "91"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_11s_43_5_1_U168", "Parent" : "91"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_13s_45_5_1_U169", "Parent" : "91"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_32s_13s_45_5_1_U170", "Parent" : "91"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_33s_7s_39_5_1_U171", "Parent" : "91"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_33s_7s_40_5_1_U172", "Parent" : "91"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mux_4_2_14_1_1_U173", "Parent" : "91"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_15ns_29_2_1_U174", "Parent" : "91"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mux_4_2_11_1_1_U175", "Parent" : "91"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_15ns_31_2_1_U176", "Parent" : "91"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_15ns_31_2_1_U177", "Parent" : "91"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U178", "Parent" : "91"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U179", "Parent" : "91"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U180", "Parent" : "91"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U181", "Parent" : "91"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U182", "Parent" : "91"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U183", "Parent" : "91"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U184", "Parent" : "91"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U185", "Parent" : "91"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U186", "Parent" : "91"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_16s_16s_32_2_1_U187", "Parent" : "91"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U188", "Parent" : "91"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.grp_decode_fu_142.mul_14s_14s_28_2_1_U189", "Parent" : "91"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "90"}]}


set ArgLastReadFirstWriteLatency {
	adpcm_main {
		input_samples {Type I LastRead 1 FirstWrite -1}
		compressed {Type IO LastRead 0 FirstWrite -1}
		result {Type O LastRead -1 FirstWrite 37}
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
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type IO LastRead -1 FirstWrite -1}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		xout1 {Type IO LastRead -1 FirstWrite -1}
		xout2 {Type IO LastRead -1 FirstWrite -1}}
	adpcm_main_Pipeline_reset_label4 {
		delay_dltx {Type O LastRead -1 FirstWrite 1}
		delay_dhx {Type O LastRead -1 FirstWrite 1}
		dec_del_dltx {Type O LastRead -1 FirstWrite 1}
		dec_del_dhx {Type O LastRead -1 FirstWrite 1}}
	adpcm_main_Pipeline_reset_label5 {
		delay_bpl {Type O LastRead -1 FirstWrite 1}
		delay_bph {Type O LastRead -1 FirstWrite 1}
		dec_del_bpl {Type O LastRead -1 FirstWrite 1}
		dec_del_bph {Type O LastRead -1 FirstWrite 1}}
	adpcm_main_Pipeline_reset_label6 {
		tqmf {Type O LastRead -1 FirstWrite 1}}
	adpcm_main_Pipeline_reset_label7 {
		accumc {Type O LastRead -1 FirstWrite 1}
		accumd {Type O LastRead -1 FirstWrite 1}}
	adpcm_main_Pipeline_adpcm_main_label12 {
		input_samples {Type I LastRead 1 FirstWrite -1}
		compressed {Type O LastRead -1 FirstWrite 99}
		rlt1 {Type IO LastRead 12 FirstWrite 85}
		al1 {Type IO LastRead 12 FirstWrite 97}
		rlt2 {Type IO LastRead 11 FirstWrite 12}
		al2 {Type IO LastRead 11 FirstWrite 94}
		detl {Type IO LastRead 3 FirstWrite 87}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 81}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		nbl {Type IO LastRead 82 FirstWrite 84}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead 86 FirstWrite 86}
		plt2 {Type IO LastRead 86 FirstWrite 86}
		rh1 {Type IO LastRead 0 FirstWrite 25}
		ah1 {Type IO LastRead 0 FirstWrite 37}
		rh2 {Type IO LastRead 0 FirstWrite 0}
		ah2 {Type IO LastRead 0 FirstWrite 34}
		deth {Type IO LastRead 0 FirstWrite 26}
		nbh {Type IO LastRead 21 FirstWrite 23}
		ph1 {Type IO LastRead 26 FirstWrite 26}
		ph2 {Type IO LastRead 26 FirstWrite 26}
		tqmf {Type IO LastRead 12 FirstWrite 2}
		delay_bpl {Type IO LastRead 9 FirstWrite 86}
		delay_dltx {Type IO LastRead 3 FirstWrite 3}
		delay_bph {Type IO LastRead 3 FirstWrite 26}
		delay_dhx {Type IO LastRead 3 FirstWrite 2}}
	encode {
		xin1 {Type I LastRead 5 FirstWrite -1}
		xin2 {Type I LastRead 10 FirstWrite -1}
		rlt1 {Type IO LastRead 12 FirstWrite 85}
		al1 {Type IO LastRead 12 FirstWrite 97}
		rlt2 {Type IO LastRead 11 FirstWrite 12}
		al2 {Type IO LastRead 11 FirstWrite 94}
		detl {Type IO LastRead 3 FirstWrite 87}
		quant26bt_pos {Type I LastRead -1 FirstWrite -1}
		quant26bt_neg {Type I LastRead -1 FirstWrite -1}
		il {Type O LastRead -1 FirstWrite 81}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		nbl {Type IO LastRead 82 FirstWrite 84}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		plt1 {Type IO LastRead 86 FirstWrite 86}
		plt2 {Type IO LastRead 86 FirstWrite 86}
		rh1 {Type IO LastRead 0 FirstWrite 25}
		ah1 {Type IO LastRead 0 FirstWrite 37}
		rh2 {Type IO LastRead 0 FirstWrite 0}
		ah2 {Type IO LastRead 0 FirstWrite 34}
		deth {Type IO LastRead 0 FirstWrite 26}
		nbh {Type IO LastRead 21 FirstWrite 23}
		ph1 {Type IO LastRead 26 FirstWrite 26}
		ph2 {Type IO LastRead 26 FirstWrite 26}
		tqmf {Type IO LastRead 12 FirstWrite 2}
		delay_bpl {Type IO LastRead 9 FirstWrite 86}
		delay_dltx {Type IO LastRead 3 FirstWrite 3}
		delay_bph {Type IO LastRead 3 FirstWrite 26}
		delay_dhx {Type IO LastRead 3 FirstWrite 2}}
	adpcm_main_Pipeline_adpcm_main_label13 {
		compressed {Type I LastRead 0 FirstWrite -1}
		result {Type O LastRead -1 FirstWrite 37}
		dec_rlt1 {Type IO LastRead 14 FirstWrite 21}
		dec_al1 {Type IO LastRead 14 FirstWrite 23}
		dec_rlt2 {Type IO LastRead 11 FirstWrite 14}
		dec_al2 {Type IO LastRead 11 FirstWrite 20}
		dec_detl {Type IO LastRead 2 FirstWrite 6}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		il {Type I LastRead 0 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 1 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 12 FirstWrite 12}
		dec_plt2 {Type IO LastRead 12 FirstWrite 12}
		dec_rh1 {Type IO LastRead 15 FirstWrite 21}
		dec_ah1 {Type IO LastRead 15 FirstWrite 24}
		dec_rh2 {Type IO LastRead 14 FirstWrite 15}
		dec_ah2 {Type IO LastRead 14 FirstWrite 21}
		dec_deth {Type IO LastRead 1 FirstWrite 5}
		dec_nbh {Type IO LastRead 0 FirstWrite 2}
		dec_ph1 {Type IO LastRead 13 FirstWrite 13}
		dec_ph2 {Type IO LastRead 13 FirstWrite 13}
		xout1 {Type IO LastRead -1 FirstWrite -1}
		xout2 {Type IO LastRead -1 FirstWrite -1}
		dec_del_bpl {Type IO LastRead 3 FirstWrite 5}
		dec_del_dltx {Type IO LastRead 3 FirstWrite 2}
		dec_del_bph {Type IO LastRead 3 FirstWrite 4}
		dec_del_dhx {Type IO LastRead 3 FirstWrite 2}
		accumc {Type IO LastRead 14 FirstWrite 3}
		accumd {Type IO LastRead 14 FirstWrite 3}}
	decode {
		input_r {Type I LastRead 0 FirstWrite -1}
		dec_rlt1 {Type IO LastRead 14 FirstWrite 21}
		dec_al1 {Type IO LastRead 14 FirstWrite 23}
		dec_rlt2 {Type IO LastRead 11 FirstWrite 14}
		dec_al2 {Type IO LastRead 11 FirstWrite 20}
		dec_detl {Type IO LastRead 2 FirstWrite 6}
		qq4_code4_table {Type I LastRead -1 FirstWrite -1}
		il {Type I LastRead 0 FirstWrite -1}
		qq6_code6_table {Type I LastRead -1 FirstWrite -1}
		dec_nbl {Type IO LastRead 1 FirstWrite 3}
		wl_code_table {Type I LastRead -1 FirstWrite -1}
		ilb_table {Type I LastRead -1 FirstWrite -1}
		dec_plt1 {Type IO LastRead 12 FirstWrite 12}
		dec_plt2 {Type IO LastRead 12 FirstWrite 12}
		dec_rh1 {Type IO LastRead 15 FirstWrite 21}
		dec_ah1 {Type IO LastRead 15 FirstWrite 24}
		dec_rh2 {Type IO LastRead 14 FirstWrite 15}
		dec_ah2 {Type IO LastRead 14 FirstWrite 21}
		dec_deth {Type IO LastRead 1 FirstWrite 5}
		dec_nbh {Type IO LastRead 0 FirstWrite 2}
		dec_ph1 {Type IO LastRead 13 FirstWrite 13}
		dec_ph2 {Type IO LastRead 13 FirstWrite 13}
		xout1 {Type O LastRead -1 FirstWrite 34}
		xout2 {Type O LastRead -1 FirstWrite 34}
		dec_del_bpl {Type IO LastRead 3 FirstWrite 5}
		dec_del_dltx {Type IO LastRead 3 FirstWrite 2}
		dec_del_bph {Type IO LastRead 3 FirstWrite 4}
		dec_del_dhx {Type IO LastRead 3 FirstWrite 2}
		accumc {Type IO LastRead 14 FirstWrite 3}
		accumd {Type IO LastRead 14 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "484050", "Max" : "484050"}
	, {"Name" : "Interval", "Min" : "484051", "Max" : "484051"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_samples { ap_memory {  { input_samples_address0 mem_address 1 13 }  { input_samples_ce0 mem_ce 1 1 }  { input_samples_q0 mem_dout 0 32 }  { input_samples_address1 MemPortADDR2 1 13 }  { input_samples_ce1 MemPortCE2 1 1 }  { input_samples_q1 MemPortDOUT2 0 32 } } }
	compressed { ap_memory {  { compressed_address0 mem_address 1 12 }  { compressed_ce0 mem_ce 1 1 }  { compressed_we0 mem_we 1 1 }  { compressed_d0 mem_din 1 32 }  { compressed_q0 mem_dout 0 32 } } }
	result { ap_memory {  { result_address0 mem_address 1 13 }  { result_ce0 mem_ce 1 1 }  { result_we0 mem_we 1 1 }  { result_d0 mem_din 1 32 }  { result_address1 MemPortADDR2 1 13 }  { result_ce1 MemPortCE2 1 1 }  { result_we1 MemPortWE2 1 1 }  { result_d1 MemPortDIN2 1 32 } } }
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
