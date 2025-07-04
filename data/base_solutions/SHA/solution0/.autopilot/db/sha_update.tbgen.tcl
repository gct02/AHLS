set moduleName sha_update
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
set C_modelName {sha_update}
set C_modelType { void 0 }
set C_modelArgList {
	{ buffer_r int 8 regular {array 16384 { 1 1 } 1 1 }  }
	{ buffer_offset int 1 regular  }
	{ count int 32 regular  }
	{ sha_info_count_lo int 32 regular {pointer 2} {global 2}  }
	{ sha_info_count_hi int 32 regular {pointer 2} {global 2}  }
	{ sha_info_data int 32 regular {array 16 { 2 3 } 1 1 } {global 2}  }
	{ sha_info_digest int 32 regular {array 5 { 2 2 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "buffer_r", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_offset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "count", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sha_info_count_lo", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "sha_info_count_hi", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "sha_info_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "sha_info_digest", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buffer_r_address0 sc_out sc_lv 14 signal 0 } 
	{ buffer_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ buffer_r_q0 sc_in sc_lv 8 signal 0 } 
	{ buffer_r_address1 sc_out sc_lv 14 signal 0 } 
	{ buffer_r_ce1 sc_out sc_logic 1 signal 0 } 
	{ buffer_r_q1 sc_in sc_lv 8 signal 0 } 
	{ buffer_offset sc_in sc_lv 1 signal 1 } 
	{ count sc_in sc_lv 32 signal 2 } 
	{ sha_info_count_lo_i sc_in sc_lv 32 signal 3 } 
	{ sha_info_count_lo_o sc_out sc_lv 32 signal 3 } 
	{ sha_info_count_lo_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ sha_info_count_hi_i sc_in sc_lv 32 signal 4 } 
	{ sha_info_count_hi_o sc_out sc_lv 32 signal 4 } 
	{ sha_info_count_hi_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ sha_info_data_address0 sc_out sc_lv 4 signal 5 } 
	{ sha_info_data_ce0 sc_out sc_logic 1 signal 5 } 
	{ sha_info_data_we0 sc_out sc_logic 1 signal 5 } 
	{ sha_info_data_d0 sc_out sc_lv 32 signal 5 } 
	{ sha_info_data_q0 sc_in sc_lv 32 signal 5 } 
	{ sha_info_digest_address0 sc_out sc_lv 3 signal 6 } 
	{ sha_info_digest_ce0 sc_out sc_logic 1 signal 6 } 
	{ sha_info_digest_we0 sc_out sc_logic 1 signal 6 } 
	{ sha_info_digest_d0 sc_out sc_lv 32 signal 6 } 
	{ sha_info_digest_q0 sc_in sc_lv 32 signal 6 } 
	{ sha_info_digest_address1 sc_out sc_lv 3 signal 6 } 
	{ sha_info_digest_ce1 sc_out sc_logic 1 signal 6 } 
	{ sha_info_digest_we1 sc_out sc_logic 1 signal 6 } 
	{ sha_info_digest_d1 sc_out sc_lv 32 signal 6 } 
	{ sha_info_digest_q1 sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "buffer_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "buffer_r", "role": "address0" }} , 
 	{ "name": "buffer_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "ce0" }} , 
 	{ "name": "buffer_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "buffer_r", "role": "q0" }} , 
 	{ "name": "buffer_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "buffer_r", "role": "address1" }} , 
 	{ "name": "buffer_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_r", "role": "ce1" }} , 
 	{ "name": "buffer_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "buffer_r", "role": "q1" }} , 
 	{ "name": "buffer_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_offset", "role": "default" }} , 
 	{ "name": "count", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "count", "role": "default" }} , 
 	{ "name": "sha_info_count_lo_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_lo", "role": "i" }} , 
 	{ "name": "sha_info_count_lo_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_lo", "role": "o" }} , 
 	{ "name": "sha_info_count_lo_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sha_info_count_lo", "role": "o_ap_vld" }} , 
 	{ "name": "sha_info_count_hi_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_hi", "role": "i" }} , 
 	{ "name": "sha_info_count_hi_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_hi", "role": "o" }} , 
 	{ "name": "sha_info_count_hi_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sha_info_count_hi", "role": "o_ap_vld" }} , 
 	{ "name": "sha_info_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sha_info_data", "role": "address0" }} , 
 	{ "name": "sha_info_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "ce0" }} , 
 	{ "name": "sha_info_data_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "we0" }} , 
 	{ "name": "sha_info_data_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_data", "role": "d0" }} , 
 	{ "name": "sha_info_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_data", "role": "q0" }} , 
 	{ "name": "sha_info_digest_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "address0" }} , 
 	{ "name": "sha_info_digest_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "ce0" }} , 
 	{ "name": "sha_info_digest_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "we0" }} , 
 	{ "name": "sha_info_digest_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "d0" }} , 
 	{ "name": "sha_info_digest_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "q0" }} , 
 	{ "name": "sha_info_digest_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "address1" }} , 
 	{ "name": "sha_info_digest_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "ce1" }} , 
 	{ "name": "sha_info_digest_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "we1" }} , 
 	{ "name": "sha_info_digest_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "d1" }} , 
 	{ "name": "sha_info_digest_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_digest", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "sha_update",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50803", "EstimateLatencyMax" : "57395",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buffer_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_local_memcpy_fu_84", "Port" : "s2", "Inst_start_state" : "2", "Inst_end_state" : "6"}]},
			{"Name" : "buffer_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "count", "Type" : "None", "Direction" : "I"},
			{"Name" : "sha_info_count_lo", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sha_info_count_hi", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sha_info_data", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_local_memcpy_fu_84", "Port" : "sha_info_data", "Inst_start_state" : "2", "Inst_end_state" : "6"},
					{"ID" : "2", "SubInstance" : "grp_sha_transform_fu_96", "Port" : "sha_info_data", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "sha_info_digest", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sha_transform_fu_96", "Port" : "sha_info_digest", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}],
		"Loop" : [
			{"Name" : "sha_update_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_local_memcpy_fu_84", "Parent" : "0",
		"CDFG" : "local_memcpy",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "49",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s2_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sha_info_data", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "local_memcpy_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sha_transform_fu_96", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "sha_transform",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "395", "EstimateLatencyMax" : "395",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sha_info_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sha_info_digest", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "sha_transform_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "sha_transform_label2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "sha_transform_label3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "sha_transform_label4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state14"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "sha_transform_label5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state14", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state14"], "PreState" : ["ap_ST_fsm_state12"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "sha_transform_label6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "19", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state14"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sha_transform_fu_96.W_U", "Parent" : "2"}]}


set ArgLastReadFirstWriteLatency {
	sha_update {
		buffer_r {Type I LastRead 3 FirstWrite -1}
		buffer_offset {Type I LastRead 0 FirstWrite -1}
		count {Type I LastRead 0 FirstWrite -1}
		sha_info_count_lo {Type IO LastRead 0 FirstWrite 0}
		sha_info_count_hi {Type IO LastRead 0 FirstWrite 0}
		sha_info_data {Type IO LastRead 1 FirstWrite -1}
		sha_info_digest {Type IO LastRead 5 FirstWrite 9}}
	local_memcpy {
		s2 {Type I LastRead 3 FirstWrite -1}
		s2_offset {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		sha_info_data {Type O LastRead -1 FirstWrite 3}}
	sha_transform {
		sha_info_data {Type I LastRead 1 FirstWrite -1}
		sha_info_digest {Type IO LastRead 5 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "50803", "Max" : "57395"}
	, {"Name" : "Interval", "Min" : "50803", "Max" : "57395"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	buffer_r { ap_memory {  { buffer_r_address0 mem_address 1 14 }  { buffer_r_ce0 mem_ce 1 1 }  { buffer_r_q0 mem_dout 0 8 }  { buffer_r_address1 MemPortADDR2 1 14 }  { buffer_r_ce1 MemPortCE2 1 1 }  { buffer_r_q1 MemPortDOUT2 0 8 } } }
	buffer_offset { ap_none {  { buffer_offset in_data 0 1 } } }
	count { ap_none {  { count in_data 0 32 } } }
	sha_info_count_lo { ap_ovld {  { sha_info_count_lo_i in_data 0 32 }  { sha_info_count_lo_o out_data 1 32 }  { sha_info_count_lo_o_ap_vld out_vld 1 1 } } }
	sha_info_count_hi { ap_ovld {  { sha_info_count_hi_i in_data 0 32 }  { sha_info_count_hi_o out_data 1 32 }  { sha_info_count_hi_o_ap_vld out_vld 1 1 } } }
	sha_info_data { ap_memory {  { sha_info_data_address0 mem_address 1 4 }  { sha_info_data_ce0 mem_ce 1 1 }  { sha_info_data_we0 mem_we 1 1 }  { sha_info_data_d0 mem_din 1 32 }  { sha_info_data_q0 mem_dout 0 32 } } }
	sha_info_digest { ap_memory {  { sha_info_digest_address0 mem_address 1 3 }  { sha_info_digest_ce0 mem_ce 1 1 }  { sha_info_digest_we0 mem_we 1 1 }  { sha_info_digest_d0 mem_din 1 32 }  { sha_info_digest_q0 mem_dout 0 32 }  { sha_info_digest_address1 MemPortADDR2 1 3 }  { sha_info_digest_ce1 MemPortCE2 1 1 }  { sha_info_digest_we1 MemPortWE2 1 1 }  { sha_info_digest_d1 MemPortDIN2 1 32 }  { sha_info_digest_q1 MemPortDOUT2 0 32 } } }
}
