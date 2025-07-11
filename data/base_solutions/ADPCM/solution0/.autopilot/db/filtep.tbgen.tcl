set moduleName filtep
set isTopModule 0
set isCombinational 1
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
set C_modelName {filtep}
set C_modelType { int 32 }
set C_modelArgList {
	{ rlt1 int 31 regular  }
	{ al1 int 16 regular  }
	{ rlt2 int 31 regular  }
	{ al2 int 15 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "rlt1", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "al1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "rlt2", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "al2", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 6
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rlt1 sc_in sc_lv 31 signal 0 } 
	{ al1 sc_in sc_lv 16 signal 1 } 
	{ rlt2 sc_in sc_lv 31 signal 2 } 
	{ al2 sc_in sc_lv 15 signal 3 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rlt1", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt1", "role": "default" }} , 
 	{ "name": "al1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "al1", "role": "default" }} , 
 	{ "name": "rlt2", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "rlt2", "role": "default" }} , 
 	{ "name": "al2", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "al2", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_15s_32s_47_1_1_U48", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_32s_47_1_1_U49", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	filtep {
		rlt1 {Type I LastRead 0 FirstWrite -1}
		al1 {Type I LastRead 0 FirstWrite -1}
		rlt2 {Type I LastRead 0 FirstWrite -1}
		al2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	rlt1 { ap_none {  { rlt1 in_data 0 31 } } }
	al1 { ap_none {  { al1 in_data 0 16 } } }
	rlt2 { ap_none {  { rlt2 in_data 0 31 } } }
	al2 { ap_none {  { al2 in_data 0 15 } } }
}
