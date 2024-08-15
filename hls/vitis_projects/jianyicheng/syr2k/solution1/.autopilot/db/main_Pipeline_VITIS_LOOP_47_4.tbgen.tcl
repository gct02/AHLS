set moduleName main_Pipeline_VITIS_LOOP_47_4
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
set C_modelName {main_Pipeline_VITIS_LOOP_47_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ indvars_iv19 int 6 regular  }
	{ empty int 10 regular  }
	{ C_s float 32 regular {array 1024 { 0 1 } 1 1 }  }
	{ A_s float 32 regular {array 1024 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ B_load float 32 regular  }
	{ B_s float 32 regular {array 1024 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ A_load_1 float 32 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "indvars_iv19", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "C_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "A_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_load_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 325
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ indvars_iv19 sc_in sc_lv 6 signal 0 } 
	{ empty sc_in sc_lv 10 signal 1 } 
	{ C_s_address0 sc_out sc_lv 10 signal 2 } 
	{ C_s_ce0 sc_out sc_logic 1 signal 2 } 
	{ C_s_we0 sc_out sc_logic 1 signal 2 } 
	{ C_s_d0 sc_out sc_lv 32 signal 2 } 
	{ C_s_address1 sc_out sc_lv 10 signal 2 } 
	{ C_s_ce1 sc_out sc_logic 1 signal 2 } 
	{ C_s_q1 sc_in sc_lv 32 signal 2 } 
	{ A_s_address0 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce0 sc_out sc_logic 1 signal 3 } 
	{ A_s_q0 sc_in sc_lv 32 signal 3 } 
	{ A_s_address1 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce1 sc_out sc_logic 1 signal 3 } 
	{ A_s_q1 sc_in sc_lv 32 signal 3 } 
	{ A_s_address2 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce2 sc_out sc_logic 1 signal 3 } 
	{ A_s_q2 sc_in sc_lv 32 signal 3 } 
	{ A_s_address3 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce3 sc_out sc_logic 1 signal 3 } 
	{ A_s_q3 sc_in sc_lv 32 signal 3 } 
	{ A_s_address4 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce4 sc_out sc_logic 1 signal 3 } 
	{ A_s_q4 sc_in sc_lv 32 signal 3 } 
	{ A_s_address5 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce5 sc_out sc_logic 1 signal 3 } 
	{ A_s_q5 sc_in sc_lv 32 signal 3 } 
	{ A_s_address6 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce6 sc_out sc_logic 1 signal 3 } 
	{ A_s_q6 sc_in sc_lv 32 signal 3 } 
	{ A_s_address7 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce7 sc_out sc_logic 1 signal 3 } 
	{ A_s_q7 sc_in sc_lv 32 signal 3 } 
	{ A_s_address8 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce8 sc_out sc_logic 1 signal 3 } 
	{ A_s_q8 sc_in sc_lv 32 signal 3 } 
	{ A_s_address9 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce9 sc_out sc_logic 1 signal 3 } 
	{ A_s_q9 sc_in sc_lv 32 signal 3 } 
	{ A_s_address10 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce10 sc_out sc_logic 1 signal 3 } 
	{ A_s_q10 sc_in sc_lv 32 signal 3 } 
	{ A_s_address11 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce11 sc_out sc_logic 1 signal 3 } 
	{ A_s_q11 sc_in sc_lv 32 signal 3 } 
	{ A_s_address12 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce12 sc_out sc_logic 1 signal 3 } 
	{ A_s_q12 sc_in sc_lv 32 signal 3 } 
	{ A_s_address13 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce13 sc_out sc_logic 1 signal 3 } 
	{ A_s_q13 sc_in sc_lv 32 signal 3 } 
	{ A_s_address14 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce14 sc_out sc_logic 1 signal 3 } 
	{ A_s_q14 sc_in sc_lv 32 signal 3 } 
	{ A_s_address15 sc_out sc_lv 10 signal 3 } 
	{ A_s_ce15 sc_out sc_logic 1 signal 3 } 
	{ A_s_q15 sc_in sc_lv 32 signal 3 } 
	{ B_load sc_in sc_lv 32 signal 4 } 
	{ B_s_address0 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce0 sc_out sc_logic 1 signal 5 } 
	{ B_s_q0 sc_in sc_lv 32 signal 5 } 
	{ B_s_address1 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce1 sc_out sc_logic 1 signal 5 } 
	{ B_s_q1 sc_in sc_lv 32 signal 5 } 
	{ B_s_address2 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce2 sc_out sc_logic 1 signal 5 } 
	{ B_s_q2 sc_in sc_lv 32 signal 5 } 
	{ B_s_address3 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce3 sc_out sc_logic 1 signal 5 } 
	{ B_s_q3 sc_in sc_lv 32 signal 5 } 
	{ B_s_address4 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce4 sc_out sc_logic 1 signal 5 } 
	{ B_s_q4 sc_in sc_lv 32 signal 5 } 
	{ B_s_address5 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce5 sc_out sc_logic 1 signal 5 } 
	{ B_s_q5 sc_in sc_lv 32 signal 5 } 
	{ B_s_address6 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce6 sc_out sc_logic 1 signal 5 } 
	{ B_s_q6 sc_in sc_lv 32 signal 5 } 
	{ B_s_address7 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce7 sc_out sc_logic 1 signal 5 } 
	{ B_s_q7 sc_in sc_lv 32 signal 5 } 
	{ B_s_address8 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce8 sc_out sc_logic 1 signal 5 } 
	{ B_s_q8 sc_in sc_lv 32 signal 5 } 
	{ B_s_address9 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce9 sc_out sc_logic 1 signal 5 } 
	{ B_s_q9 sc_in sc_lv 32 signal 5 } 
	{ B_s_address10 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce10 sc_out sc_logic 1 signal 5 } 
	{ B_s_q10 sc_in sc_lv 32 signal 5 } 
	{ B_s_address11 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce11 sc_out sc_logic 1 signal 5 } 
	{ B_s_q11 sc_in sc_lv 32 signal 5 } 
	{ B_s_address12 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce12 sc_out sc_logic 1 signal 5 } 
	{ B_s_q12 sc_in sc_lv 32 signal 5 } 
	{ B_s_address13 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce13 sc_out sc_logic 1 signal 5 } 
	{ B_s_q13 sc_in sc_lv 32 signal 5 } 
	{ B_s_address14 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce14 sc_out sc_logic 1 signal 5 } 
	{ B_s_q14 sc_in sc_lv 32 signal 5 } 
	{ B_s_address15 sc_out sc_lv 10 signal 5 } 
	{ B_s_ce15 sc_out sc_logic 1 signal 5 } 
	{ B_s_q15 sc_in sc_lv 32 signal 5 } 
	{ A_load_1 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_366_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_366_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_366_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_366_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_366_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_370_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_370_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_370_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_370_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_370_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_374_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_374_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_374_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_374_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_374_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_378_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_378_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_378_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_378_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_378_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_382_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_382_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_382_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_382_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_382_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_386_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_386_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_386_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_386_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_386_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_390_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_390_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_390_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_390_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_390_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_394_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_394_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_394_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_394_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_394_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_398_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_398_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_398_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_398_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_398_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_402_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_402_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_402_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_402_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_402_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_406_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_406_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_406_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_406_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_406_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_410_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_410_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_410_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_410_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_410_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_414_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_414_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_414_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_414_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_414_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_418_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_418_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_418_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_418_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_418_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_422_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_422_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_422_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_422_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_422_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_426_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_426_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_426_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_426_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_426_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_430_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_430_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_430_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_430_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_434_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_434_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_434_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_434_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_438_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_438_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_438_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_438_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_442_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_442_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_442_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_442_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_446_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_446_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_446_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_446_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_450_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_450_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_450_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_450_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_454_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_454_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_454_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_454_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_458_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_458_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_458_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_458_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_462_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_462_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_462_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_462_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_466_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_466_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_466_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_466_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_470_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_470_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_470_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_470_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_474_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_474_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_474_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_474_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_478_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_478_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_478_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_478_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_482_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_482_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_482_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_482_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_486_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_486_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_486_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_486_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_490_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_490_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_490_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_490_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_494_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_494_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_494_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_494_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_498_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_498_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_498_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_498_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_502_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_502_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_502_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_502_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_506_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_506_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_506_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_506_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_510_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_510_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_510_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_510_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_514_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_514_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_514_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_514_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_518_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_518_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_518_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_518_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_522_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_522_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_522_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_522_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_526_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_526_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_526_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_526_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_530_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_530_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_530_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_530_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_534_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_534_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_534_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_534_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_538_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_538_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_538_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_538_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_542_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_542_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_542_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_542_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_546_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_546_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_546_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_546_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_550_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_550_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_550_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_550_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_554_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_554_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_554_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_554_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_558_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_558_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_558_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_558_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "indvars_iv19", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "indvars_iv19", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "C_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "C_s", "role": "address0" }} , 
 	{ "name": "C_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_s", "role": "ce0" }} , 
 	{ "name": "C_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_s", "role": "we0" }} , 
 	{ "name": "C_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_s", "role": "d0" }} , 
 	{ "name": "C_s_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "C_s", "role": "address1" }} , 
 	{ "name": "C_s_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_s", "role": "ce1" }} , 
 	{ "name": "C_s_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C_s", "role": "q1" }} , 
 	{ "name": "A_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address0" }} , 
 	{ "name": "A_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce0" }} , 
 	{ "name": "A_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q0" }} , 
 	{ "name": "A_s_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address1" }} , 
 	{ "name": "A_s_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce1" }} , 
 	{ "name": "A_s_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q1" }} , 
 	{ "name": "A_s_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address2" }} , 
 	{ "name": "A_s_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce2" }} , 
 	{ "name": "A_s_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q2" }} , 
 	{ "name": "A_s_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address3" }} , 
 	{ "name": "A_s_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce3" }} , 
 	{ "name": "A_s_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q3" }} , 
 	{ "name": "A_s_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address4" }} , 
 	{ "name": "A_s_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce4" }} , 
 	{ "name": "A_s_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q4" }} , 
 	{ "name": "A_s_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address5" }} , 
 	{ "name": "A_s_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce5" }} , 
 	{ "name": "A_s_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q5" }} , 
 	{ "name": "A_s_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address6" }} , 
 	{ "name": "A_s_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce6" }} , 
 	{ "name": "A_s_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q6" }} , 
 	{ "name": "A_s_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address7" }} , 
 	{ "name": "A_s_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce7" }} , 
 	{ "name": "A_s_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q7" }} , 
 	{ "name": "A_s_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address8" }} , 
 	{ "name": "A_s_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce8" }} , 
 	{ "name": "A_s_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q8" }} , 
 	{ "name": "A_s_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address9" }} , 
 	{ "name": "A_s_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce9" }} , 
 	{ "name": "A_s_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q9" }} , 
 	{ "name": "A_s_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address10" }} , 
 	{ "name": "A_s_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce10" }} , 
 	{ "name": "A_s_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q10" }} , 
 	{ "name": "A_s_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address11" }} , 
 	{ "name": "A_s_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce11" }} , 
 	{ "name": "A_s_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q11" }} , 
 	{ "name": "A_s_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address12" }} , 
 	{ "name": "A_s_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce12" }} , 
 	{ "name": "A_s_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q12" }} , 
 	{ "name": "A_s_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address13" }} , 
 	{ "name": "A_s_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce13" }} , 
 	{ "name": "A_s_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q13" }} , 
 	{ "name": "A_s_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address14" }} , 
 	{ "name": "A_s_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce14" }} , 
 	{ "name": "A_s_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q14" }} , 
 	{ "name": "A_s_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A_s", "role": "address15" }} , 
 	{ "name": "A_s_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_s", "role": "ce15" }} , 
 	{ "name": "A_s_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_s", "role": "q15" }} , 
 	{ "name": "B_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_load", "role": "default" }} , 
 	{ "name": "B_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address0" }} , 
 	{ "name": "B_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce0" }} , 
 	{ "name": "B_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q0" }} , 
 	{ "name": "B_s_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address1" }} , 
 	{ "name": "B_s_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce1" }} , 
 	{ "name": "B_s_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q1" }} , 
 	{ "name": "B_s_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address2" }} , 
 	{ "name": "B_s_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce2" }} , 
 	{ "name": "B_s_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q2" }} , 
 	{ "name": "B_s_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address3" }} , 
 	{ "name": "B_s_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce3" }} , 
 	{ "name": "B_s_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q3" }} , 
 	{ "name": "B_s_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address4" }} , 
 	{ "name": "B_s_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce4" }} , 
 	{ "name": "B_s_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q4" }} , 
 	{ "name": "B_s_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address5" }} , 
 	{ "name": "B_s_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce5" }} , 
 	{ "name": "B_s_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q5" }} , 
 	{ "name": "B_s_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address6" }} , 
 	{ "name": "B_s_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce6" }} , 
 	{ "name": "B_s_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q6" }} , 
 	{ "name": "B_s_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address7" }} , 
 	{ "name": "B_s_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce7" }} , 
 	{ "name": "B_s_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q7" }} , 
 	{ "name": "B_s_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address8" }} , 
 	{ "name": "B_s_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce8" }} , 
 	{ "name": "B_s_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q8" }} , 
 	{ "name": "B_s_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address9" }} , 
 	{ "name": "B_s_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce9" }} , 
 	{ "name": "B_s_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q9" }} , 
 	{ "name": "B_s_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address10" }} , 
 	{ "name": "B_s_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce10" }} , 
 	{ "name": "B_s_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q10" }} , 
 	{ "name": "B_s_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address11" }} , 
 	{ "name": "B_s_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce11" }} , 
 	{ "name": "B_s_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q11" }} , 
 	{ "name": "B_s_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address12" }} , 
 	{ "name": "B_s_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce12" }} , 
 	{ "name": "B_s_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q12" }} , 
 	{ "name": "B_s_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address13" }} , 
 	{ "name": "B_s_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce13" }} , 
 	{ "name": "B_s_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q13" }} , 
 	{ "name": "B_s_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address14" }} , 
 	{ "name": "B_s_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce14" }} , 
 	{ "name": "B_s_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q14" }} , 
 	{ "name": "B_s_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "B_s", "role": "address15" }} , 
 	{ "name": "B_s_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_s", "role": "ce15" }} , 
 	{ "name": "B_s_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_s", "role": "q15" }} , 
 	{ "name": "A_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_load_1", "role": "default" }} , 
 	{ "name": "grp_fu_366_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_366_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_366_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_366_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_366_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_366_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_366_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_366_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_366_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_366_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_370_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_370_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_374_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_374_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_374_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_374_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_374_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_374_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_374_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_374_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_374_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_374_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_378_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_378_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_378_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_378_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_378_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_378_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_378_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_378_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_378_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_378_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_382_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_382_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_382_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_382_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_382_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_382_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_382_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_382_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_382_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_382_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_386_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_386_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_386_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_386_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_386_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_386_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_386_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_386_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_386_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_386_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_390_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_390_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_390_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_390_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_390_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_390_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_390_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_390_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_390_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_390_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_394_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_394_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_394_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_394_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_394_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_394_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_394_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_394_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_394_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_394_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_398_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_398_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_398_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_398_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_398_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_398_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_398_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_398_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_398_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_398_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_402_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_402_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_402_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_402_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_402_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_402_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_402_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_402_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_402_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_402_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_406_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_406_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_406_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_406_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_406_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_406_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_406_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_406_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_406_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_406_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_410_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_410_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_410_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_410_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_410_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_410_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_410_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_410_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_410_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_410_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_414_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_414_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_414_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_414_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_414_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_414_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_414_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_414_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_414_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_414_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_418_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_418_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_418_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_418_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_418_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_418_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_418_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_418_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_418_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_418_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_422_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_422_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_422_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_422_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_422_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_422_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_422_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_422_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_422_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_422_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_426_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_426_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_426_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_426_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_426_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_426_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_426_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_426_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_426_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_426_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_430_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_430_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_430_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_430_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_430_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_430_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_430_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_430_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_434_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_434_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_434_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_434_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_434_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_434_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_434_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_434_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_438_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_438_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_438_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_438_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_438_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_438_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_438_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_438_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_442_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_442_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_442_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_442_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_442_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_442_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_442_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_442_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_446_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_446_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_446_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_446_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_446_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_446_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_446_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_446_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_450_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_450_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_450_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_450_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_450_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_450_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_450_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_450_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_454_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_454_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_454_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_454_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_454_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_454_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_454_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_454_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_458_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_458_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_458_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_458_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_458_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_458_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_458_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_458_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_462_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_462_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_462_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_462_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_462_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_462_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_462_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_462_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_466_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_466_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_466_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_466_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_466_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_466_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_466_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_466_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_470_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_470_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_470_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_470_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_470_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_470_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_470_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_470_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_474_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_474_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_474_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_474_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_474_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_474_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_474_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_474_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_478_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_478_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_478_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_478_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_478_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_478_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_478_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_478_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_482_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_482_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_482_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_482_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_482_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_482_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_482_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_482_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_486_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_486_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_486_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_486_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_486_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_486_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_486_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_486_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_490_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_490_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_490_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_490_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_490_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_490_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_490_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_490_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_494_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_494_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_494_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_494_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_494_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_494_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_494_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_494_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_498_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_498_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_498_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_498_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_498_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_498_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_498_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_498_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_502_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_502_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_502_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_502_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_502_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_502_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_502_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_502_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_506_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_506_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_506_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_506_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_506_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_506_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_506_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_506_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_510_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_510_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_510_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_510_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_510_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_510_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_510_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_510_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_514_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_514_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_514_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_514_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_514_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_514_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_514_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_514_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_518_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_518_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_518_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_518_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_518_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_518_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_518_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_518_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_522_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_522_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_522_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_522_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_522_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_522_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_522_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_522_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_526_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_526_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_526_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_526_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_526_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_526_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_526_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_526_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_530_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_530_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_530_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_530_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_530_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_530_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_530_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_530_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_534_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_534_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_534_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_534_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_534_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_534_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_534_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_534_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_538_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_538_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_538_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_538_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_538_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_538_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_538_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_538_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_542_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_542_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_542_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_542_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_542_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_542_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_542_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_542_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_546_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_546_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_546_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_546_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_546_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_546_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_546_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_546_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_550_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_550_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_550_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_550_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_550_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_550_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_550_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_550_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_554_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_558_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_558_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_558_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_558_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_558_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_558_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_558_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_558_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "main_Pipeline_VITIS_LOOP_47_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "351", "EstimateLatencyMax" : "475",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "indvars_iv19", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "C_s", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "A_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "B_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "B_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "A_load_1", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter87", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter87", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_47_4 {
		indvars_iv19 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		C_s {Type IO LastRead 1 FirstWrite 349}
		A_s {Type I LastRead 4 FirstWrite -1}
		B_load {Type I LastRead 0 FirstWrite -1}
		B_s {Type I LastRead 4 FirstWrite -1}
		A_load_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "351", "Max" : "475"}
	, {"Name" : "Interval", "Min" : "351", "Max" : "475"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	indvars_iv19 { ap_none {  { indvars_iv19 in_data 0 6 } } }
	empty { ap_none {  { empty in_data 0 10 } } }
	C_s { ap_memory {  { C_s_address0 mem_address 1 10 }  { C_s_ce0 mem_ce 1 1 }  { C_s_we0 mem_we 1 1 }  { C_s_d0 mem_din 1 32 }  { C_s_address1 MemPortADDR2 1 10 }  { C_s_ce1 MemPortCE2 1 1 }  { C_s_q1 MemPortDOUT2 0 32 } } }
	A_s { ap_memory {  { A_s_address0 mem_address 1 10 }  { A_s_ce0 mem_ce 1 1 }  { A_s_q0 mem_dout 0 32 }  { A_s_address1 MemPortADDR2 1 10 }  { A_s_ce1 MemPortCE2 1 1 }  { A_s_q1 MemPortDOUT2 0 32 }  { A_s_address2 MemPortADDR2 1 10 }  { A_s_ce2 MemPortCE2 1 1 }  { A_s_q2 MemPortDOUT2 0 32 }  { A_s_address3 MemPortADDR2 1 10 }  { A_s_ce3 MemPortCE2 1 1 }  { A_s_q3 MemPortDOUT2 0 32 }  { A_s_address4 MemPortADDR2 1 10 }  { A_s_ce4 MemPortCE2 1 1 }  { A_s_q4 MemPortDOUT2 0 32 }  { A_s_address5 MemPortADDR2 1 10 }  { A_s_ce5 MemPortCE2 1 1 }  { A_s_q5 MemPortDOUT2 0 32 }  { A_s_address6 MemPortADDR2 1 10 }  { A_s_ce6 MemPortCE2 1 1 }  { A_s_q6 MemPortDOUT2 0 32 }  { A_s_address7 MemPortADDR2 1 10 }  { A_s_ce7 MemPortCE2 1 1 }  { A_s_q7 MemPortDOUT2 0 32 }  { A_s_address8 MemPortADDR2 1 10 }  { A_s_ce8 MemPortCE2 1 1 }  { A_s_q8 MemPortDOUT2 0 32 }  { A_s_address9 MemPortADDR2 1 10 }  { A_s_ce9 MemPortCE2 1 1 }  { A_s_q9 MemPortDOUT2 0 32 }  { A_s_address10 MemPortADDR2 1 10 }  { A_s_ce10 MemPortCE2 1 1 }  { A_s_q10 MemPortDOUT2 0 32 }  { A_s_address11 MemPortADDR2 1 10 }  { A_s_ce11 MemPortCE2 1 1 }  { A_s_q11 MemPortDOUT2 0 32 }  { A_s_address12 MemPortADDR2 1 10 }  { A_s_ce12 MemPortCE2 1 1 }  { A_s_q12 MemPortDOUT2 0 32 }  { A_s_address13 MemPortADDR2 1 10 }  { A_s_ce13 MemPortCE2 1 1 }  { A_s_q13 MemPortDOUT2 0 32 }  { A_s_address14 MemPortADDR2 1 10 }  { A_s_ce14 MemPortCE2 1 1 }  { A_s_q14 MemPortDOUT2 0 32 }  { A_s_address15 MemPortADDR2 1 10 }  { A_s_ce15 MemPortCE2 1 1 }  { A_s_q15 MemPortDOUT2 0 32 } } }
	B_load { ap_none {  { B_load in_data 0 32 } } }
	B_s { ap_memory {  { B_s_address0 mem_address 1 10 }  { B_s_ce0 mem_ce 1 1 }  { B_s_q0 mem_dout 0 32 }  { B_s_address1 MemPortADDR2 1 10 }  { B_s_ce1 MemPortCE2 1 1 }  { B_s_q1 MemPortDOUT2 0 32 }  { B_s_address2 MemPortADDR2 1 10 }  { B_s_ce2 MemPortCE2 1 1 }  { B_s_q2 MemPortDOUT2 0 32 }  { B_s_address3 MemPortADDR2 1 10 }  { B_s_ce3 MemPortCE2 1 1 }  { B_s_q3 MemPortDOUT2 0 32 }  { B_s_address4 MemPortADDR2 1 10 }  { B_s_ce4 MemPortCE2 1 1 }  { B_s_q4 MemPortDOUT2 0 32 }  { B_s_address5 MemPortADDR2 1 10 }  { B_s_ce5 MemPortCE2 1 1 }  { B_s_q5 MemPortDOUT2 0 32 }  { B_s_address6 MemPortADDR2 1 10 }  { B_s_ce6 MemPortCE2 1 1 }  { B_s_q6 MemPortDOUT2 0 32 }  { B_s_address7 MemPortADDR2 1 10 }  { B_s_ce7 MemPortCE2 1 1 }  { B_s_q7 MemPortDOUT2 0 32 }  { B_s_address8 MemPortADDR2 1 10 }  { B_s_ce8 MemPortCE2 1 1 }  { B_s_q8 MemPortDOUT2 0 32 }  { B_s_address9 MemPortADDR2 1 10 }  { B_s_ce9 MemPortCE2 1 1 }  { B_s_q9 MemPortDOUT2 0 32 }  { B_s_address10 MemPortADDR2 1 10 }  { B_s_ce10 MemPortCE2 1 1 }  { B_s_q10 MemPortDOUT2 0 32 }  { B_s_address11 MemPortADDR2 1 10 }  { B_s_ce11 MemPortCE2 1 1 }  { B_s_q11 MemPortDOUT2 0 32 }  { B_s_address12 MemPortADDR2 1 10 }  { B_s_ce12 MemPortCE2 1 1 }  { B_s_q12 MemPortDOUT2 0 32 }  { B_s_address13 MemPortADDR2 1 10 }  { B_s_ce13 MemPortCE2 1 1 }  { B_s_q13 MemPortDOUT2 0 32 }  { B_s_address14 MemPortADDR2 1 10 }  { B_s_ce14 MemPortCE2 1 1 }  { B_s_q14 MemPortDOUT2 0 32 }  { B_s_address15 MemPortADDR2 1 10 }  { B_s_ce15 MemPortCE2 1 1 }  { B_s_q15 MemPortDOUT2 0 32 } } }
	A_load_1 { ap_none {  { A_load_1 in_data 0 32 } } }
}
