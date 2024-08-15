set moduleName main_Pipeline_VITIS_LOOP_52_4
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
set C_modelName {main_Pipeline_VITIS_LOOP_52_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln52_1 int 6 regular  }
	{ a_s float 32 regular {array 1024 { 2 0 } 1 1 }  }
	{ q_load float 32 regular  }
	{ k_1 int 5 regular  }
	{ q_s float 32 regular {array 1024 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ zext_ln52_3 int 5 regular  }
	{ zext_ln52_2 int 5 regular  }
	{ zext_ln52_4 int 5 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln52_1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "a_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "q_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "q_s", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln52_3", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln52_2", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln52_4", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 312
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln52_1 sc_in sc_lv 6 signal 0 } 
	{ a_s_address0 sc_out sc_lv 10 signal 1 } 
	{ a_s_ce0 sc_out sc_logic 1 signal 1 } 
	{ a_s_we0 sc_out sc_logic 1 signal 1 } 
	{ a_s_d0 sc_out sc_lv 32 signal 1 } 
	{ a_s_q0 sc_in sc_lv 32 signal 1 } 
	{ a_s_address1 sc_out sc_lv 10 signal 1 } 
	{ a_s_ce1 sc_out sc_logic 1 signal 1 } 
	{ a_s_we1 sc_out sc_logic 1 signal 1 } 
	{ a_s_d1 sc_out sc_lv 32 signal 1 } 
	{ q_load sc_in sc_lv 32 signal 2 } 
	{ k_1 sc_in sc_lv 5 signal 3 } 
	{ q_s_address0 sc_out sc_lv 10 signal 4 } 
	{ q_s_ce0 sc_out sc_logic 1 signal 4 } 
	{ q_s_q0 sc_in sc_lv 32 signal 4 } 
	{ zext_ln52_3 sc_in sc_lv 5 signal 5 } 
	{ zext_ln52_2 sc_in sc_lv 5 signal 6 } 
	{ zext_ln52_4 sc_in sc_lv 5 signal 7 } 
	{ grp_fu_182_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_182_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_182_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_182_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_182_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_439_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_439_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_439_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_439_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_439_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_443_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_443_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_443_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_443_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_443_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_447_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_447_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_447_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_447_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_447_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_451_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_451_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_451_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_451_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_451_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_455_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_455_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_455_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_455_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_455_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_459_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_459_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_459_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_459_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_459_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_463_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_463_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_463_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_463_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_463_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_467_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_467_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_467_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_467_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_467_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_471_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_471_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_471_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_471_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_471_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_475_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_475_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_475_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_475_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_475_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_479_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_479_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_479_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_479_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_479_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_483_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_483_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_483_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_483_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_483_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_487_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_487_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_487_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_487_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_487_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_491_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_491_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_491_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_491_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_491_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_495_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_495_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_495_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_495_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_495_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_499_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_499_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_499_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_499_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_499_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_503_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_503_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_503_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_503_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_503_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_507_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_507_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_507_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_507_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_507_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_511_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_511_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_511_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_511_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_511_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_515_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_515_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_515_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_515_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_515_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_519_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_519_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_519_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_519_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_519_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_523_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_523_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_523_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_523_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_523_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_527_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_527_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_527_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_527_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_527_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_531_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_531_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_531_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_531_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_531_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_535_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_535_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_535_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_535_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_535_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_539_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_539_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_539_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_539_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_539_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_543_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_543_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_543_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_543_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_543_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_547_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_547_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_547_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_547_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_547_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_551_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_551_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_551_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_551_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_551_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_555_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_555_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_555_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_555_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_555_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_559_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_559_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_559_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_559_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_559_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_189_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_189_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_189_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_189_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_563_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_563_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_563_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_563_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_567_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_567_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_567_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_567_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_571_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_571_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_571_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_571_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_575_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_575_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_575_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_575_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_579_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_579_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_579_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_579_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_583_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_583_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_583_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_583_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_587_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_587_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_587_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_587_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_591_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_591_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_591_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_591_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_595_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_595_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_595_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_595_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_599_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_599_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_599_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_599_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_603_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_603_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_603_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_603_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_607_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_607_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_607_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_607_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_611_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_611_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_611_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_611_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_615_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_615_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_615_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_615_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_619_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_619_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_619_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_619_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_623_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_623_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_623_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_623_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_627_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_627_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_627_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_627_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_631_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_631_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_631_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_631_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_635_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_635_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_635_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_635_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_639_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_639_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_639_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_639_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_643_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_643_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_643_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_643_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_647_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_647_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_647_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_647_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_651_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_651_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_651_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_651_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_655_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_655_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_655_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_655_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_659_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_659_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_659_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_659_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_663_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_663_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_663_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_663_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_667_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_667_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_667_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_667_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_671_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_671_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_671_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_671_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_675_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_675_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_675_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_675_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_679_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_679_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_679_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_679_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_683_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_683_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_683_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_683_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln52_1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "zext_ln52_1", "role": "default" }} , 
 	{ "name": "a_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "a_s", "role": "address0" }} , 
 	{ "name": "a_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_s", "role": "ce0" }} , 
 	{ "name": "a_s_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_s", "role": "we0" }} , 
 	{ "name": "a_s_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_s", "role": "d0" }} , 
 	{ "name": "a_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_s", "role": "q0" }} , 
 	{ "name": "a_s_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "a_s", "role": "address1" }} , 
 	{ "name": "a_s_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_s", "role": "ce1" }} , 
 	{ "name": "a_s_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_s", "role": "we1" }} , 
 	{ "name": "a_s_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_s", "role": "d1" }} , 
 	{ "name": "q_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "q_load", "role": "default" }} , 
 	{ "name": "k_1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "k_1", "role": "default" }} , 
 	{ "name": "q_s_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "q_s", "role": "address0" }} , 
 	{ "name": "q_s_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_s", "role": "ce0" }} , 
 	{ "name": "q_s_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "q_s", "role": "q0" }} , 
 	{ "name": "zext_ln52_3", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln52_3", "role": "default" }} , 
 	{ "name": "zext_ln52_2", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln52_2", "role": "default" }} , 
 	{ "name": "zext_ln52_4", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln52_4", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_182_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_182_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_182_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_182_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_439_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_439_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_439_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_439_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_439_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_439_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_439_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_439_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_439_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_439_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_443_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_443_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_443_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_443_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_443_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_443_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_443_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_443_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_443_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_443_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_447_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_447_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_447_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_447_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_447_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_447_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_447_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_447_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_447_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_447_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_451_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_451_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_451_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_451_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_451_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_451_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_451_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_451_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_451_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_451_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_455_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_455_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_455_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_455_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_455_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_455_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_455_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_455_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_455_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_455_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_459_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_459_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_459_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_459_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_459_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_459_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_459_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_459_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_459_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_459_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_463_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_463_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_463_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_463_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_463_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_463_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_463_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_463_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_463_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_463_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_467_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_467_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_467_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_467_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_467_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_467_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_467_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_467_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_467_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_467_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_471_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_471_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_471_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_471_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_471_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_471_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_471_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_471_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_471_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_471_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_475_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_475_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_475_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_475_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_475_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_475_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_475_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_475_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_475_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_475_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_479_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_479_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_479_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_479_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_479_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_479_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_479_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_479_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_479_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_479_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_483_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_483_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_483_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_483_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_483_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_483_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_483_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_483_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_483_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_483_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_487_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_487_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_487_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_487_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_487_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_487_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_487_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_487_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_487_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_487_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_491_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_491_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_491_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_491_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_491_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_491_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_491_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_491_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_491_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_491_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_495_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_495_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_495_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_495_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_495_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_495_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_495_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_495_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_495_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_495_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_499_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_499_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_499_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_499_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_499_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_499_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_499_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_499_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_499_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_499_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_503_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_503_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_503_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_503_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_503_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_503_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_503_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_503_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_503_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_503_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_507_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_507_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_507_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_507_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_507_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_507_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_507_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_507_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_507_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_507_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_511_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_511_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_511_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_511_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_511_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_511_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_511_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_511_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_511_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_511_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_515_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_515_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_515_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_515_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_515_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_515_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_515_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_515_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_515_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_515_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_519_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_519_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_519_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_519_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_519_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_519_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_519_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_519_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_519_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_519_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_523_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_523_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_523_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_523_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_523_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_523_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_523_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_523_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_523_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_523_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_527_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_527_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_527_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_527_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_527_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_527_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_527_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_527_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_527_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_527_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_531_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_531_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_531_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_531_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_531_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_531_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_531_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_531_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_531_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_531_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_535_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_535_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_535_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_535_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_535_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_535_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_535_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_535_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_535_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_535_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_539_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_539_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_539_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_539_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_539_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_539_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_539_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_539_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_539_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_539_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_543_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_543_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_543_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_543_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_543_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_543_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_543_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_543_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_543_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_543_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_547_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_547_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_547_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_547_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_547_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_547_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_547_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_547_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_547_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_547_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_551_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_551_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_551_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_551_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_551_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_551_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_551_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_551_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_551_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_551_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_555_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_555_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_555_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_555_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_555_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_555_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_555_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_555_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_555_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_555_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_559_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_559_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_559_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_559_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_559_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_559_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_559_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_559_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_559_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_559_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_189_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_189_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_189_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_563_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_563_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_563_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_563_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_563_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_563_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_563_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_563_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_567_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_567_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_567_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_567_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_567_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_567_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_567_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_567_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_571_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_571_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_571_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_571_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_571_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_571_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_571_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_571_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_575_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_575_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_575_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_575_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_575_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_575_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_575_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_575_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_579_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_579_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_579_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_579_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_579_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_579_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_579_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_579_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_583_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_583_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_583_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_583_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_583_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_583_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_583_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_583_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_587_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_587_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_587_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_587_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_587_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_587_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_587_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_587_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_591_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_591_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_591_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_591_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_591_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_591_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_591_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_591_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_595_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_595_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_595_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_595_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_595_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_595_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_595_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_595_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_599_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_599_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_599_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_599_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_599_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_599_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_599_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_599_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_603_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_603_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_603_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_603_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_603_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_603_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_603_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_603_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_607_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_607_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_607_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_607_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_607_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_607_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_607_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_607_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_611_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_611_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_611_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_611_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_611_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_611_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_611_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_611_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_615_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_615_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_615_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_615_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_615_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_615_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_615_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_615_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_619_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_619_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_619_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_619_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_619_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_619_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_619_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_619_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_623_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_623_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_623_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_623_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_623_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_623_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_623_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_623_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_627_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_627_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_627_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_627_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_627_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_627_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_627_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_627_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_631_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_631_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_631_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_631_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_631_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_631_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_631_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_631_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_635_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_635_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_635_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_635_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_635_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_635_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_635_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_635_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_639_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_639_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_639_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_639_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_639_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_639_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_639_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_639_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_643_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_643_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_643_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_643_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_643_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_643_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_643_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_643_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_647_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_647_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_647_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_647_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_647_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_647_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_647_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_647_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_651_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_651_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_651_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_651_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_651_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_651_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_651_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_651_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_655_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_655_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_655_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_655_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_655_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_655_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_655_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_655_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_659_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_659_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_659_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_659_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_659_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_659_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_659_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_659_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_663_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_663_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_663_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_663_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_663_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_663_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_663_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_663_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_667_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_667_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_667_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_667_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_667_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_667_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_667_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_667_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_671_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_671_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_671_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_671_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_671_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_671_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_671_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_671_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_675_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_675_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_675_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_675_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_675_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_675_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_675_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_675_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_679_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_679_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_679_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_679_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_679_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_679_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_679_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_679_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_683_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_683_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_683_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_683_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_683_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_683_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_683_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_683_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "main_Pipeline_VITIS_LOOP_52_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "11285",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln52_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_s", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "q_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "q_s", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln52_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln52_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln52_4", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_52_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "365", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state365"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]}]}


set ArgLastReadFirstWriteLatency {
	main_Pipeline_VITIS_LOOP_52_4 {
		zext_ln52_1 {Type I LastRead 0 FirstWrite -1}
		a_s {Type IO LastRead 311 FirstWrite 349}
		q_load {Type I LastRead 0 FirstWrite -1}
		k_1 {Type I LastRead 0 FirstWrite -1}
		q_s {Type I LastRead 311 FirstWrite -1}
		zext_ln52_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln52_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln52_4 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "11285"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "11285"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	zext_ln52_1 { ap_none {  { zext_ln52_1 in_data 0 6 } } }
	a_s { ap_memory {  { a_s_address0 mem_address 1 10 }  { a_s_ce0 mem_ce 1 1 }  { a_s_we0 mem_we 1 1 }  { a_s_d0 mem_din 1 32 }  { a_s_q0 mem_dout 0 32 }  { a_s_address1 MemPortADDR2 1 10 }  { a_s_ce1 MemPortCE2 1 1 }  { a_s_we1 MemPortWE2 1 1 }  { a_s_d1 MemPortDIN2 1 32 } } }
	q_load { ap_none {  { q_load in_data 0 32 } } }
	k_1 { ap_none {  { k_1 in_data 0 5 } } }
	q_s { ap_memory {  { q_s_address0 mem_address 1 10 }  { q_s_ce0 mem_ce 1 1 }  { q_s_q0 mem_dout 0 32 } } }
	zext_ln52_3 { ap_none {  { zext_ln52_3 in_data 0 5 } } }
	zext_ln52_2 { ap_none {  { zext_ln52_2 in_data 0 5 } } }
	zext_ln52_4 { ap_none {  { zext_ln52_4 in_data 0 5 } } }
}
