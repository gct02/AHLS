set moduleName processImage
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
set C_modelName {processImage}
set C_modelType { int 32 }
set C_modelArgList {
	{ factor float 32 regular  }
	{ sum_row int 32 regular  }
	{ sum_col int 32 regular  }
	{ result_x int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ result_y int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ result_w int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ result_h int 32 regular {array 100 { 0 3 } 0 1 }  }
	{ p_read int 32 regular  }
	{ IMG1_data int 8 regular {array 76800 { 1 3 } 1 1 }  }
	{ winSize_width_val int 32 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "factor", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sum_row", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sum_col", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "result_x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result_y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result_w", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result_h", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "IMG1_data", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "winSize_width_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 48
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ factor sc_in sc_lv 32 signal 0 } 
	{ sum_row sc_in sc_lv 32 signal 1 } 
	{ sum_col sc_in sc_lv 32 signal 2 } 
	{ result_x_address0 sc_out sc_lv 7 signal 3 } 
	{ result_x_ce0 sc_out sc_logic 1 signal 3 } 
	{ result_x_we0 sc_out sc_logic 1 signal 3 } 
	{ result_x_d0 sc_out sc_lv 32 signal 3 } 
	{ result_y_address0 sc_out sc_lv 7 signal 4 } 
	{ result_y_ce0 sc_out sc_logic 1 signal 4 } 
	{ result_y_we0 sc_out sc_logic 1 signal 4 } 
	{ result_y_d0 sc_out sc_lv 32 signal 4 } 
	{ result_w_address0 sc_out sc_lv 7 signal 5 } 
	{ result_w_ce0 sc_out sc_logic 1 signal 5 } 
	{ result_w_we0 sc_out sc_logic 1 signal 5 } 
	{ result_w_d0 sc_out sc_lv 32 signal 5 } 
	{ result_h_address0 sc_out sc_lv 7 signal 6 } 
	{ result_h_ce0 sc_out sc_logic 1 signal 6 } 
	{ result_h_we0 sc_out sc_logic 1 signal 6 } 
	{ result_h_d0 sc_out sc_lv 32 signal 6 } 
	{ p_read sc_in sc_lv 32 signal 7 } 
	{ IMG1_data_address0 sc_out sc_lv 17 signal 8 } 
	{ IMG1_data_ce0 sc_out sc_logic 1 signal 8 } 
	{ IMG1_data_q0 sc_in sc_lv 8 signal 8 } 
	{ winSize_width_val sc_in sc_lv 32 signal 9 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
	{ grp_fu_278_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_278_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_278_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_278_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_298_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_298_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_298_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_301_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_301_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_301_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_301_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_301_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_312_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_312_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_312_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_312_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_312_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "factor", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "factor", "role": "default" }} , 
 	{ "name": "sum_row", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_row", "role": "default" }} , 
 	{ "name": "sum_col", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_col", "role": "default" }} , 
 	{ "name": "result_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "result_x", "role": "address0" }} , 
 	{ "name": "result_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_x", "role": "ce0" }} , 
 	{ "name": "result_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_x", "role": "we0" }} , 
 	{ "name": "result_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_x", "role": "d0" }} , 
 	{ "name": "result_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "result_y", "role": "address0" }} , 
 	{ "name": "result_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_y", "role": "ce0" }} , 
 	{ "name": "result_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_y", "role": "we0" }} , 
 	{ "name": "result_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_y", "role": "d0" }} , 
 	{ "name": "result_w_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "result_w", "role": "address0" }} , 
 	{ "name": "result_w_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_w", "role": "ce0" }} , 
 	{ "name": "result_w_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_w", "role": "we0" }} , 
 	{ "name": "result_w_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_w", "role": "d0" }} , 
 	{ "name": "result_h_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "result_h", "role": "address0" }} , 
 	{ "name": "result_h_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_h", "role": "ce0" }} , 
 	{ "name": "result_h_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result_h", "role": "we0" }} , 
 	{ "name": "result_h_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result_h", "role": "d0" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "IMG1_data_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IMG1_data", "role": "address0" }} , 
 	{ "name": "IMG1_data_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IMG1_data", "role": "ce0" }} , 
 	{ "name": "IMG1_data_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IMG1_data", "role": "q0" }} , 
 	{ "name": "winSize_width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "winSize_width_val", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_278_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_278_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_278_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_278_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_278_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_278_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_278_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_278_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_298_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_298_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_298_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_298_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_298_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_298_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_301_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_301_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_301_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_301_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_301_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_301_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_301_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_301_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_301_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_301_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_312_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_312_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_312_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_312_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_312_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_312_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_312_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_312_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_312_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_312_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "6", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "processImage",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "factor", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_row", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_col", "Type" : "None", "Direction" : "I"},
			{"Name" : "result_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "result_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "result_w", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "result_h", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "IMG1_data", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2_fu_259", "Port" : "IMG1_data", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "winSize_width_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "stages_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "stages_array", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "tree_thresh_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "tree_thresh_array", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "weights_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "weights_array0", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "weights_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "weights_array1", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "coord_8", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "coord_8", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "coord_9", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "coord_9", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "coord_10", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "coord_10", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "weights_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "weights_array2", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "alpha1_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "alpha1_array", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "alpha2_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "alpha2_array", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array0", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array2", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array1", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array3", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array4", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array6", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array5", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array7", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array8", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array10", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array9", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "rectangles_array11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "rectangles_array11", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "stages_thresh_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_cascadeClassifier_fu_269", "Port" : "stages_thresh_array", "Inst_start_state" : "45", "Inst_end_state" : "46"}]}],
		"Loop" : [
			{"Name" : "Pixelx", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "94", "FirstState" : "ap_ST_fsm_state44", "LastState" : ["ap_ST_fsm_state93"], "QuitState" : ["ap_ST_fsm_state44"], "PreState" : ["ap_ST_fsm_state43"], "PostState" : ["ap_ST_fsm_state94"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "Pixely", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "94", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state94"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state7"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.SUM1_data_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.SQSUM1_data_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2_fu_259", "Parent" : "0", "Child" : ["4", "5"],
		"CDFG" : "processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_col", "Type" : "None", "Direction" : "I"},
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "IMG1_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SUM1_data", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "SQSUM1_data", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_306_1_VITIS_LOOP_311_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2_fu_259.mac_muladd_8ns_8ns_32ns_32_4_1_U11", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2_fu_259.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269", "Parent" : "0", "Child" : ["7", "8", "9", "11", "33", "34", "35"],
		"CDFG" : "cascadeClassifier",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "11854",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "SUM1_data", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "SUM1_data", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "SQSUM1_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pt_x_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_y_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "stages_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tree_thresh_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "tree_thresh_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array0", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_8", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_8", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_9", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_9", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "coord_10", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "coord_10", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "weights_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "weights_array2", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "alpha1_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "alpha1_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "alpha2_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "alpha2_array", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array0", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array2", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array3", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array4", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array5", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array7", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array8", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array10", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array9", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "rectangles_array11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_cascadeClassifier_Pipeline_Filters_fu_287", "Port" : "rectangles_array11", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "stages_thresh_array", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Stages", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state45"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.stages_array_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.stages_thresh_array_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_VITIS_LOOP_379_1_fu_281", "Parent" : "6", "Child" : ["10"],
		"CDFG" : "cascadeClassifier_Pipeline_VITIS_LOOP_379_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_379_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_VITIS_LOOP_379_1_fu_281.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287", "Parent" : "6", "Child" : ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "cascadeClassifier_Pipeline_Filters",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "39", "EstimateLatencyMax" : "443",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln200", "Type" : "None", "Direction" : "I"},
			{"Name" : "stage_sum", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln200", "Type" : "None", "Direction" : "I"},
			{"Name" : "stddev_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_y_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "pt_x_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "SUM1_data", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "stage_sum_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "tree_thresh_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_array0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_array1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "coord_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "coord_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "coord_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "weights_array2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "alpha1_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "alpha2_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "rectangles_array11", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "Filters", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.tree_thresh_array_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array0_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array1_U", "Parent" : "11"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.weights_array2_U", "Parent" : "11"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.alpha1_array_U", "Parent" : "11"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.alpha2_array_U", "Parent" : "11"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array0_U", "Parent" : "11"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array2_U", "Parent" : "11"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array1_U", "Parent" : "11"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array3_U", "Parent" : "11"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array4_U", "Parent" : "11"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array6_U", "Parent" : "11"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array5_U", "Parent" : "11"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array7_U", "Parent" : "11"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array8_U", "Parent" : "11"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array10_U", "Parent" : "11"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array9_U", "Parent" : "11"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.rectangles_array11_U", "Parent" : "11"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.mul_13s_32s_32_5_1_U20", "Parent" : "11"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.mul_14ns_32s_32_5_1_U21", "Parent" : "11"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.grp_cascadeClassifier_Pipeline_Filters_fu_287.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.dmul_64ns_64ns_64_14_full_dsp_1_U50", "Parent" : "6"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.dcmp_64ns_64ns_1_4_no_dsp_1_U51", "Parent" : "6"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_cascadeClassifier_fu_269.sitodp_64s_64_7_no_dsp_1_U52", "Parent" : "6"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_7_no_dsp_1_U64", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_64_5_1_U68", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lshr_137ns_32ns_137_7_1_U69", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.shl_137ns_32ns_137_7_1_U70", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lshr_137ns_32ns_137_7_1_U71", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.shl_137ns_32ns_137_7_1_U72", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	processImage {
		factor {Type I LastRead 6 FirstWrite -1}
		sum_row {Type I LastRead 0 FirstWrite -1}
		sum_col {Type I LastRead 0 FirstWrite -1}
		result_x {Type O LastRead -1 FirstWrite 92}
		result_y {Type O LastRead -1 FirstWrite 91}
		result_w {Type O LastRead -1 FirstWrite 91}
		result_h {Type O LastRead -1 FirstWrite 91}
		p_read {Type I LastRead 0 FirstWrite -1}
		IMG1_data {Type I LastRead 4 FirstWrite -1}
		winSize_width_val {Type I LastRead 6 FirstWrite -1}
		stages_array {Type I LastRead -1 FirstWrite -1}
		tree_thresh_array {Type I LastRead -1 FirstWrite -1}
		weights_array0 {Type I LastRead -1 FirstWrite -1}
		weights_array1 {Type I LastRead -1 FirstWrite -1}
		coord_8 {Type IO LastRead -1 FirstWrite -1}
		coord_9 {Type IO LastRead -1 FirstWrite -1}
		coord_10 {Type IO LastRead -1 FirstWrite -1}
		weights_array2 {Type I LastRead -1 FirstWrite -1}
		alpha1_array {Type I LastRead -1 FirstWrite -1}
		alpha2_array {Type I LastRead -1 FirstWrite -1}
		rectangles_array0 {Type I LastRead -1 FirstWrite -1}
		rectangles_array2 {Type I LastRead -1 FirstWrite -1}
		rectangles_array1 {Type I LastRead -1 FirstWrite -1}
		rectangles_array3 {Type I LastRead -1 FirstWrite -1}
		rectangles_array4 {Type I LastRead -1 FirstWrite -1}
		rectangles_array6 {Type I LastRead -1 FirstWrite -1}
		rectangles_array5 {Type I LastRead -1 FirstWrite -1}
		rectangles_array7 {Type I LastRead -1 FirstWrite -1}
		rectangles_array8 {Type I LastRead -1 FirstWrite -1}
		rectangles_array10 {Type I LastRead -1 FirstWrite -1}
		rectangles_array9 {Type I LastRead -1 FirstWrite -1}
		rectangles_array11 {Type I LastRead -1 FirstWrite -1}
		stages_thresh_array {Type I LastRead -1 FirstWrite -1}}
	processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2 {
		sum_col {Type I LastRead 0 FirstWrite -1}
		bound {Type I LastRead 0 FirstWrite -1}
		IMG1_data {Type I LastRead 4 FirstWrite -1}
		SUM1_data {Type IO LastRead 5 FirstWrite 8}
		SQSUM1_data {Type IO LastRead 8 FirstWrite 11}}
	cascadeClassifier {
		SUM1_data {Type I LastRead 8 FirstWrite -1}
		SQSUM1_data {Type I LastRead 5 FirstWrite -1}
		pt_x_val {Type I LastRead 0 FirstWrite -1}
		pt_y_val {Type I LastRead 0 FirstWrite -1}
		stages_array {Type I LastRead -1 FirstWrite -1}
		tree_thresh_array {Type I LastRead -1 FirstWrite -1}
		weights_array0 {Type I LastRead -1 FirstWrite -1}
		weights_array1 {Type I LastRead -1 FirstWrite -1}
		coord_8 {Type IO LastRead -1 FirstWrite -1}
		coord_9 {Type IO LastRead -1 FirstWrite -1}
		coord_10 {Type IO LastRead -1 FirstWrite -1}
		weights_array2 {Type I LastRead -1 FirstWrite -1}
		alpha1_array {Type I LastRead -1 FirstWrite -1}
		alpha2_array {Type I LastRead -1 FirstWrite -1}
		rectangles_array0 {Type I LastRead -1 FirstWrite -1}
		rectangles_array2 {Type I LastRead -1 FirstWrite -1}
		rectangles_array1 {Type I LastRead -1 FirstWrite -1}
		rectangles_array3 {Type I LastRead -1 FirstWrite -1}
		rectangles_array4 {Type I LastRead -1 FirstWrite -1}
		rectangles_array6 {Type I LastRead -1 FirstWrite -1}
		rectangles_array5 {Type I LastRead -1 FirstWrite -1}
		rectangles_array7 {Type I LastRead -1 FirstWrite -1}
		rectangles_array8 {Type I LastRead -1 FirstWrite -1}
		rectangles_array10 {Type I LastRead -1 FirstWrite -1}
		rectangles_array9 {Type I LastRead -1 FirstWrite -1}
		rectangles_array11 {Type I LastRead -1 FirstWrite -1}
		stages_thresh_array {Type I LastRead -1 FirstWrite -1}}
	cascadeClassifier_Pipeline_VITIS_LOOP_379_1 {
		empty {Type I LastRead 0 FirstWrite -1}
		a_out {Type O LastRead -1 FirstWrite 1}}
	cascadeClassifier_Pipeline_Filters {
		sext_ln200 {Type I LastRead 0 FirstWrite -1}
		stage_sum {Type I LastRead 0 FirstWrite -1}
		add_ln200 {Type I LastRead 0 FirstWrite -1}
		stddev_0 {Type I LastRead 0 FirstWrite -1}
		pt_y_val {Type I LastRead 0 FirstWrite -1}
		pt_x_val {Type I LastRead 0 FirstWrite -1}
		SUM1_data {Type I LastRead 8 FirstWrite -1}
		stage_sum_1_out {Type O LastRead -1 FirstWrite 20}
		tree_thresh_array {Type I LastRead -1 FirstWrite -1}
		weights_array0 {Type I LastRead -1 FirstWrite -1}
		weights_array1 {Type I LastRead -1 FirstWrite -1}
		coord_8 {Type IO LastRead -1 FirstWrite -1}
		coord_9 {Type IO LastRead -1 FirstWrite -1}
		coord_10 {Type IO LastRead -1 FirstWrite -1}
		weights_array2 {Type I LastRead -1 FirstWrite -1}
		alpha1_array {Type I LastRead -1 FirstWrite -1}
		alpha2_array {Type I LastRead -1 FirstWrite -1}
		rectangles_array0 {Type I LastRead -1 FirstWrite -1}
		rectangles_array2 {Type I LastRead -1 FirstWrite -1}
		rectangles_array1 {Type I LastRead -1 FirstWrite -1}
		rectangles_array3 {Type I LastRead -1 FirstWrite -1}
		rectangles_array4 {Type I LastRead -1 FirstWrite -1}
		rectangles_array6 {Type I LastRead -1 FirstWrite -1}
		rectangles_array5 {Type I LastRead -1 FirstWrite -1}
		rectangles_array7 {Type I LastRead -1 FirstWrite -1}
		rectangles_array8 {Type I LastRead -1 FirstWrite -1}
		rectangles_array10 {Type I LastRead -1 FirstWrite -1}
		rectangles_array9 {Type I LastRead -1 FirstWrite -1}
		rectangles_array11 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	factor { ap_none {  { factor in_data 0 32 } } }
	sum_row { ap_none {  { sum_row in_data 0 32 } } }
	sum_col { ap_none {  { sum_col in_data 0 32 } } }
	result_x { ap_memory {  { result_x_address0 mem_address 1 7 }  { result_x_ce0 mem_ce 1 1 }  { result_x_we0 mem_we 1 1 }  { result_x_d0 mem_din 1 32 } } }
	result_y { ap_memory {  { result_y_address0 mem_address 1 7 }  { result_y_ce0 mem_ce 1 1 }  { result_y_we0 mem_we 1 1 }  { result_y_d0 mem_din 1 32 } } }
	result_w { ap_memory {  { result_w_address0 mem_address 1 7 }  { result_w_ce0 mem_ce 1 1 }  { result_w_we0 mem_we 1 1 }  { result_w_d0 mem_din 1 32 } } }
	result_h { ap_memory {  { result_h_address0 mem_address 1 7 }  { result_h_ce0 mem_ce 1 1 }  { result_h_we0 mem_we 1 1 }  { result_h_d0 mem_din 1 32 } } }
	p_read { ap_none {  { p_read in_data 0 32 } } }
	IMG1_data { ap_memory {  { IMG1_data_address0 mem_address 1 17 }  { IMG1_data_ce0 mem_ce 1 1 }  { IMG1_data_q0 mem_dout 0 8 } } }
	winSize_width_val { ap_none {  { winSize_width_val in_data 0 32 } } }
}
