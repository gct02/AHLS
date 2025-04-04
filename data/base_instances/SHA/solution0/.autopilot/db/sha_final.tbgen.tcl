set moduleName sha_final
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
set C_modelName {sha_final}
set C_modelType { void 0 }
set C_modelArgList {
	{ sha_info_count_lo int 32 regular {pointer 0} {global 0}  }
	{ sha_info_count_hi int 32 regular {pointer 0} {global 0}  }
	{ sha_info_data int 32 regular {array 16 { 2 0 } 1 1 } {global 2}  }
	{ sha_info_digest int 32 regular {array 5 { 2 2 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "sha_info_count_lo", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sha_info_count_hi", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sha_info_data", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "sha_info_digest", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sha_info_count_lo sc_in sc_lv 32 signal 0 } 
	{ sha_info_count_hi sc_in sc_lv 32 signal 1 } 
	{ sha_info_data_address0 sc_out sc_lv 4 signal 2 } 
	{ sha_info_data_ce0 sc_out sc_logic 1 signal 2 } 
	{ sha_info_data_we0 sc_out sc_logic 1 signal 2 } 
	{ sha_info_data_d0 sc_out sc_lv 32 signal 2 } 
	{ sha_info_data_q0 sc_in sc_lv 32 signal 2 } 
	{ sha_info_data_address1 sc_out sc_lv 4 signal 2 } 
	{ sha_info_data_ce1 sc_out sc_logic 1 signal 2 } 
	{ sha_info_data_we1 sc_out sc_logic 1 signal 2 } 
	{ sha_info_data_d1 sc_out sc_lv 32 signal 2 } 
	{ sha_info_digest_address0 sc_out sc_lv 3 signal 3 } 
	{ sha_info_digest_ce0 sc_out sc_logic 1 signal 3 } 
	{ sha_info_digest_we0 sc_out sc_logic 1 signal 3 } 
	{ sha_info_digest_d0 sc_out sc_lv 32 signal 3 } 
	{ sha_info_digest_q0 sc_in sc_lv 32 signal 3 } 
	{ sha_info_digest_address1 sc_out sc_lv 3 signal 3 } 
	{ sha_info_digest_ce1 sc_out sc_logic 1 signal 3 } 
	{ sha_info_digest_we1 sc_out sc_logic 1 signal 3 } 
	{ sha_info_digest_d1 sc_out sc_lv 32 signal 3 } 
	{ sha_info_digest_q1 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sha_info_count_lo", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_lo", "role": "default" }} , 
 	{ "name": "sha_info_count_hi", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_count_hi", "role": "default" }} , 
 	{ "name": "sha_info_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sha_info_data", "role": "address0" }} , 
 	{ "name": "sha_info_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "ce0" }} , 
 	{ "name": "sha_info_data_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "we0" }} , 
 	{ "name": "sha_info_data_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_data", "role": "d0" }} , 
 	{ "name": "sha_info_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_data", "role": "q0" }} , 
 	{ "name": "sha_info_data_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sha_info_data", "role": "address1" }} , 
 	{ "name": "sha_info_data_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "ce1" }} , 
 	{ "name": "sha_info_data_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sha_info_data", "role": "we1" }} , 
 	{ "name": "sha_info_data_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sha_info_data", "role": "d1" }} , 
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
		"CDFG" : "sha_final",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "402", "EstimateLatencyMax" : "833",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sha_info_count_lo", "Type" : "None", "Direction" : "I"},
			{"Name" : "sha_info_count_hi", "Type" : "None", "Direction" : "I"},
			{"Name" : "sha_info_data", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_local_memset_fu_64", "Port" : "sha_info_data", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "2", "SubInstance" : "grp_sha_transform_fu_74", "Port" : "sha_info_data", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "sha_info_digest", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_sha_transform_fu_74", "Port" : "sha_info_digest", "Inst_start_state" : "10", "Inst_end_state" : "11"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_local_memset_fu_64", "Parent" : "0",
		"CDFG" : "local_memset",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "e", "Type" : "None", "Direction" : "I"},
			{"Name" : "sha_info_data", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "local_memset_label1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state2"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state2_blk"}}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sha_transform_fu_74", "Parent" : "0", "Child" : ["3"],
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sha_transform_fu_74.W_U", "Parent" : "2"}]}


set ArgLastReadFirstWriteLatency {
	sha_final {
		sha_info_count_lo {Type I LastRead 0 FirstWrite -1}
		sha_info_count_hi {Type I LastRead 1 FirstWrite -1}
		sha_info_data {Type IO LastRead 1 FirstWrite -1}
		sha_info_digest {Type IO LastRead 5 FirstWrite 9}}
	local_memset {
		n {Type I LastRead 0 FirstWrite -1}
		e {Type I LastRead 0 FirstWrite -1}
		sha_info_data {Type O LastRead -1 FirstWrite 1}}
	sha_transform {
		sha_info_data {Type I LastRead 1 FirstWrite -1}
		sha_info_digest {Type IO LastRead 5 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "402", "Max" : "833"}
	, {"Name" : "Interval", "Min" : "402", "Max" : "833"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	sha_info_count_lo { ap_none {  { sha_info_count_lo in_data 0 32 } } }
	sha_info_count_hi { ap_none {  { sha_info_count_hi in_data 0 32 } } }
	sha_info_data { ap_memory {  { sha_info_data_address0 mem_address 1 4 }  { sha_info_data_ce0 mem_ce 1 1 }  { sha_info_data_we0 mem_we 1 1 }  { sha_info_data_d0 mem_din 1 32 }  { sha_info_data_q0 mem_dout 0 32 }  { sha_info_data_address1 MemPortADDR2 1 4 }  { sha_info_data_ce1 MemPortCE2 1 1 }  { sha_info_data_we1 MemPortWE2 1 1 }  { sha_info_data_d1 MemPortDIN2 1 32 } } }
	sha_info_digest { ap_memory {  { sha_info_digest_address0 mem_address 1 3 }  { sha_info_digest_ce0 mem_ce 1 1 }  { sha_info_digest_we0 mem_we 1 1 }  { sha_info_digest_d0 mem_din 1 32 }  { sha_info_digest_q0 mem_dout 0 32 }  { sha_info_digest_address1 MemPortADDR2 1 3 }  { sha_info_digest_ce1 MemPortCE2 1 1 }  { sha_info_digest_we1 MemPortWE2 1 1 }  { sha_info_digest_d1 MemPortDIN2 1 32 }  { sha_info_digest_q1 MemPortDOUT2 0 32 } } }
}
