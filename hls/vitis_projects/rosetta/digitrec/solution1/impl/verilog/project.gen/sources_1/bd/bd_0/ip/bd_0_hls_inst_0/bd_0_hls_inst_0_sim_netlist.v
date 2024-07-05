// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Jun 23 07:15:02 2024
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/rosetta/digitrec/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.v
// Design      : bd_0_hls_inst_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,DigitRec,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "DigitRec,Vivado 2023.2" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module bd_0_hls_inst_0
   (training_samples_ce0,
    training_samples_ce1,
    test_set_ce0,
    test_set_ce1,
    training_labels_ce0,
    results_ce0,
    results_we0,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    training_samples_address0,
    training_samples_q0,
    training_samples_address1,
    training_samples_q1,
    test_set_address0,
    test_set_q0,
    test_set_address1,
    test_set_q1,
    training_labels_address0,
    training_labels_q0,
    results_address0,
    results_d0);
  output training_samples_ce0;
  output training_samples_ce1;
  output test_set_ce0;
  output test_set_ce1;
  output training_labels_ce0;
  output results_ce0;
  output results_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_samples_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_samples_address0, LAYERED_METADATA undef" *) output [13:0]training_samples_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_samples_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_samples_q0, LAYERED_METADATA undef" *) input [63:0]training_samples_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_samples_address1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_samples_address1, LAYERED_METADATA undef" *) output [13:0]training_samples_address1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_samples_q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_samples_q1, LAYERED_METADATA undef" *) input [63:0]training_samples_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 test_set_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME test_set_address0, LAYERED_METADATA undef" *) output [10:0]test_set_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 test_set_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME test_set_q0, LAYERED_METADATA undef" *) input [63:0]test_set_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 test_set_address1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME test_set_address1, LAYERED_METADATA undef" *) output [10:0]test_set_address1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 test_set_q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME test_set_q1, LAYERED_METADATA undef" *) input [63:0]test_set_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_labels_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_labels_address0, LAYERED_METADATA undef" *) output [11:0]training_labels_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 training_labels_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME training_labels_q0, LAYERED_METADATA undef" *) input [7:0]training_labels_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 results_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME results_address0, LAYERED_METADATA undef" *) output [8:0]results_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 results_d0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME results_d0, LAYERED_METADATA undef" *) output [7:0]results_d0;

  wire \<const0> ;
  wire \<const1> ;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [8:0]results_address0;
  wire results_ce0;
  wire [3:0]\^results_d0 ;
  wire results_we0;
  wire [10:0]test_set_address0;
  wire [10:2]\^test_set_address1 ;
  wire test_set_ce0;
  wire test_set_ce1;
  wire [63:0]test_set_q0;
  wire [63:0]test_set_q1;
  wire [11:0]training_labels_address0;
  wire training_labels_ce0;
  wire [7:0]training_labels_q0;
  wire [13:1]\^training_samples_address0 ;
  wire [13:1]\^training_samples_address1 ;
  wire training_samples_ce0;
  wire training_samples_ce1;
  wire [63:0]training_samples_q0;
  wire [63:0]training_samples_q1;
  wire [7:4]NLW_inst_results_d0_UNCONNECTED;
  wire [1:0]NLW_inst_test_set_address1_UNCONNECTED;
  wire [0:0]NLW_inst_training_samples_address0_UNCONNECTED;
  wire [0:0]NLW_inst_training_samples_address1_UNCONNECTED;

  assign results_d0[7] = \<const0> ;
  assign results_d0[6] = \<const0> ;
  assign results_d0[5] = \<const0> ;
  assign results_d0[4] = \<const0> ;
  assign results_d0[3:0] = \^results_d0 [3:0];
  assign test_set_address1[10:2] = \^test_set_address1 [10:2];
  assign test_set_address1[1] = \<const0> ;
  assign test_set_address1[0] = \<const1> ;
  assign training_samples_address0[13:1] = \^training_samples_address0 [13:1];
  assign training_samples_address0[0] = \<const1> ;
  assign training_samples_address1[13:1] = \^training_samples_address1 [13:1];
  assign training_samples_address1[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "10'b0000000001" *) 
  (* ap_ST_fsm_state10 = "10'b1000000000" *) 
  (* ap_ST_fsm_state2 = "10'b0000000010" *) 
  (* ap_ST_fsm_state3 = "10'b0000000100" *) 
  (* ap_ST_fsm_state4 = "10'b0000001000" *) 
  (* ap_ST_fsm_state5 = "10'b0000010000" *) 
  (* ap_ST_fsm_state6 = "10'b0000100000" *) 
  (* ap_ST_fsm_state7 = "10'b0001000000" *) 
  (* ap_ST_fsm_state8 = "10'b0010000000" *) 
  (* ap_ST_fsm_state9 = "10'b0100000000" *) 
  bd_0_hls_inst_0_DigitRec inst
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .results_address0(results_address0),
        .results_ce0(results_ce0),
        .results_d0({NLW_inst_results_d0_UNCONNECTED[7:4],\^results_d0 }),
        .results_we0(results_we0),
        .test_set_address0(test_set_address0),
        .test_set_address1({\^test_set_address1 ,NLW_inst_test_set_address1_UNCONNECTED[1:0]}),
        .test_set_ce0(test_set_ce0),
        .test_set_ce1(test_set_ce1),
        .test_set_q0(test_set_q0),
        .test_set_q1(test_set_q1),
        .training_labels_address0(training_labels_address0),
        .training_labels_ce0(training_labels_ce0),
        .training_labels_q0({1'b0,1'b0,1'b0,1'b0,training_labels_q0[3:0]}),
        .training_samples_address0({\^training_samples_address0 ,NLW_inst_training_samples_address0_UNCONNECTED[0]}),
        .training_samples_address1({\^training_samples_address1 ,NLW_inst_training_samples_address1_UNCONNECTED[0]}),
        .training_samples_ce0(training_samples_ce0),
        .training_samples_ce1(training_samples_ce1),
        .training_samples_q0(training_samples_q0),
        .training_samples_q1(training_samples_q1));
endmodule

(* ORIG_REF_NAME = "DigitRec" *) (* ap_ST_fsm_state1 = "10'b0000000001" *) (* ap_ST_fsm_state10 = "10'b1000000000" *) 
(* ap_ST_fsm_state2 = "10'b0000000010" *) (* ap_ST_fsm_state3 = "10'b0000000100" *) (* ap_ST_fsm_state4 = "10'b0000001000" *) 
(* ap_ST_fsm_state5 = "10'b0000010000" *) (* ap_ST_fsm_state6 = "10'b0000100000" *) (* ap_ST_fsm_state7 = "10'b0001000000" *) 
(* ap_ST_fsm_state8 = "10'b0010000000" *) (* ap_ST_fsm_state9 = "10'b0100000000" *) (* hls_module = "yes" *) 
module bd_0_hls_inst_0_DigitRec
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    training_samples_address0,
    training_samples_ce0,
    training_samples_q0,
    training_samples_address1,
    training_samples_ce1,
    training_samples_q1,
    test_set_address0,
    test_set_ce0,
    test_set_q0,
    test_set_address1,
    test_set_ce1,
    test_set_q1,
    training_labels_address0,
    training_labels_ce0,
    training_labels_q0,
    results_address0,
    results_ce0,
    results_we0,
    results_d0);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [13:0]training_samples_address0;
  output training_samples_ce0;
  input [63:0]training_samples_q0;
  output [13:0]training_samples_address1;
  output training_samples_ce1;
  input [63:0]training_samples_q1;
  output [10:0]test_set_address0;
  output test_set_ce0;
  input [63:0]test_set_q0;
  output [10:0]test_set_address1;
  output test_set_ce1;
  input [63:0]test_set_q1;
  output [11:0]training_labels_address0;
  output training_labels_ce0;
  input [7:0]training_labels_q0;
  output [8:0]results_address0;
  output results_ce0;
  output results_we0;
  output [7:0]results_d0;

  wire \<const0> ;
  wire [8:1]add_ln96_fu_229_p2;
  wire \ap_CS_fsm_reg_n_4_[0] ;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire ap_CS_fsm_state5;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state8;
  wire ap_CS_fsm_state9;
  wire [9:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter1;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [31:0]d0;
  wire [8:0]dists_0_0_fu_62;
  wire [8:0]dists_1_0_fu_66;
  wire [8:0]dists_2_0_fu_70;
  wire dists_2_0_fu_700;
  wire \flow_control_loop_pipe_sequential_init_U/ap_done_cache ;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  wire grp_DigitRec_Pipeline_3_fu_172_n_6;
  wire grp_DigitRec_Pipeline_3_fu_172_n_7;
  wire [3:0]grp_DigitRec_Pipeline_3_fu_172_votes_address0;
  wire grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg;
  wire [8:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_0_1_out;
  wire [8:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_1_1_out;
  wire [8:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_2_1_out;
  wire [3:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_0_1_out;
  wire [3:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_1_1_out;
  wire [3:0]grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_2_1_out;
  wire grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_7;
  wire grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_8;
  wire grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg;
  wire [8:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o;
  wire [8:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o;
  wire [8:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o;
  wire [3:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out;
  wire [3:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out;
  wire [3:0]grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out;
  wire grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_n_52;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_10;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_11;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_44;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_8;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_9;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_n_10;
  wire [3:0]labels_0_0_fu_74;
  wire [3:0]labels_1_0_fu_78;
  wire [3:0]labels_2_0_fu_82;
  wire p_0_in;
  wire [31:0]q0;
  wire results_ce0;
  wire [3:0]\^results_d0 ;
  wire \t_fu_58[0]_i_1_n_4 ;
  wire \t_fu_58[8]_i_1_n_4 ;
  wire \t_fu_58[8]_i_4_n_4 ;
  wire [8:0]t_fu_58_reg;
  wire [10:0]test_set_address0;
  wire [10:2]\^test_set_address1 ;
  wire test_set_ce0;
  wire test_set_ce1;
  wire [63:0]test_set_load_reg_487;
  wire [63:0]test_set_q0;
  wire [63:0]test_set_q1;
  wire [11:0]training_labels_address0;
  wire training_labels_ce0;
  wire [7:0]training_labels_q0;
  wire [13:1]\^training_samples_address0 ;
  wire training_samples_ce1;
  wire [63:0]training_samples_q0;
  wire [63:0]training_samples_q1;
  wire [3:0]trunc_ln107_1_reg_515;
  wire [3:0]trunc_ln107_2_reg_520;
  wire [3:0]trunc_ln107_reg_510;
  wire [3:0]votes_address0;
  wire votes_ce0;

  assign ap_done = ap_ready;
  assign results_address0[8:0] = \^test_set_address1 [10:2];
  assign results_d0[7] = \<const0> ;
  assign results_d0[6] = \<const0> ;
  assign results_d0[5] = \<const0> ;
  assign results_d0[4] = \<const0> ;
  assign results_d0[3:0] = \^results_d0 [3:0];
  assign results_we0 = results_ce0;
  assign test_set_address1[10:2] = \^test_set_address1 [10:2];
  assign test_set_address1[1] = \<const0> ;
  assign test_set_address1[0] = \<const0> ;
  assign training_samples_address0[13:1] = \^training_samples_address0 [13:1];
  assign training_samples_address0[0] = \<const0> ;
  assign training_samples_address1[13:1] = \^training_samples_address0 [13:1];
  assign training_samples_address1[0] = \<const0> ;
  assign training_samples_ce0 = training_samples_ce1;
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \ap_CS_fsm[0]_i_1__1 
       (.I0(ap_ready),
        .I1(ap_start),
        .I2(\ap_CS_fsm_reg_n_4_[0] ),
        .O(ap_NS_fsm[0]));
  LUT3 #(
    .INIT(8'hF8)) 
    \ap_CS_fsm[1]_i_1__1 
       (.I0(\ap_CS_fsm_reg_n_4_[0] ),
        .I1(ap_start),
        .I2(results_ce0),
        .O(ap_NS_fsm[1]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_4_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_state3),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[3]),
        .Q(ap_CS_fsm_state4),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[4]),
        .Q(ap_CS_fsm_state5),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[5]),
        .Q(ap_CS_fsm_state6),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[6]),
        .Q(ap_CS_fsm_state7),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[7]),
        .Q(ap_CS_fsm_state8),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[8]),
        .Q(ap_CS_fsm_state9),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[9]),
        .Q(results_ce0),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_4_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    ap_ready_INST_0
       (.I0(t_fu_58_reg[7]),
        .I1(t_fu_58_reg[6]),
        .I2(t_fu_58_reg[5]),
        .I3(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_7),
        .I4(ap_CS_fsm_state2),
        .O(ap_ready));
  FDRE \dists_0_0_fu_62_reg[0] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[0]),
        .Q(dists_0_0_fu_62[0]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[1] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[1]),
        .Q(dists_0_0_fu_62[1]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[2] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[2]),
        .Q(dists_0_0_fu_62[2]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[3] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[3]),
        .Q(dists_0_0_fu_62[3]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[4] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[4]),
        .Q(dists_0_0_fu_62[4]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[5] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[5]),
        .Q(dists_0_0_fu_62[5]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[6] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[6]),
        .Q(dists_0_0_fu_62[6]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[7] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[7]),
        .Q(dists_0_0_fu_62[7]),
        .R(1'b0));
  FDRE \dists_0_0_fu_62_reg[8] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o[8]),
        .Q(dists_0_0_fu_62[8]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[0] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[0]),
        .Q(dists_1_0_fu_66[0]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[1] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[1]),
        .Q(dists_1_0_fu_66[1]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[2] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[2]),
        .Q(dists_1_0_fu_66[2]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[3] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[3]),
        .Q(dists_1_0_fu_66[3]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[4] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[4]),
        .Q(dists_1_0_fu_66[4]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[5] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[5]),
        .Q(dists_1_0_fu_66[5]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[6] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[6]),
        .Q(dists_1_0_fu_66[6]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[7] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[7]),
        .Q(dists_1_0_fu_66[7]),
        .R(1'b0));
  FDRE \dists_1_0_fu_66_reg[8] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o[8]),
        .Q(dists_1_0_fu_66[8]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[0] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[0]),
        .Q(dists_2_0_fu_70[0]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[1] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[1]),
        .Q(dists_2_0_fu_70[1]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[2] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[2]),
        .Q(dists_2_0_fu_70[2]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[3] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[3]),
        .Q(dists_2_0_fu_70[3]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[4] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[4]),
        .Q(dists_2_0_fu_70[4]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[5] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[5]),
        .Q(dists_2_0_fu_70[5]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[6] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[6]),
        .Q(dists_2_0_fu_70[6]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[7] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[7]),
        .Q(dists_2_0_fu_70[7]),
        .R(1'b0));
  FDRE \dists_2_0_fu_70_reg[8] 
       (.C(ap_clk),
        .CE(dists_2_0_fu_700),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o[8]),
        .Q(dists_2_0_fu_70[8]),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_3 grp_DigitRec_Pipeline_3_fu_172
       (.ap_clk(ap_clk),
        .ap_done_cache(\flow_control_loop_pipe_sequential_init_U/ap_done_cache ),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_loop_init_int_reg(grp_DigitRec_Pipeline_3_fu_172_n_6),
        .ap_rst(ap_rst),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg(grp_DigitRec_Pipeline_3_fu_172_n_7),
        .grp_DigitRec_Pipeline_3_fu_172_votes_address0(grp_DigitRec_Pipeline_3_fu_172_votes_address0));
  FDRE #(
    .INIT(1'b0)) 
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_3_fu_172_n_7),
        .Q(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .R(ap_rst));
  bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_SET_KNN_SET grp_DigitRec_Pipeline_SET_KNN_SET_fu_156
       (.D(ap_NS_fsm[3:2]),
        .Q({ap_CS_fsm_state3,ap_CS_fsm_state2}),
        .\ap_CS_fsm_reg[2] (grp_DigitRec_Pipeline_3_fu_172_n_6),
        .ap_clk(ap_clk),
        .ap_done_cache(\flow_control_loop_pipe_sequential_init_U/ap_done_cache ),
        .ap_rst(ap_rst),
        .\dists_0_1_fu_58_reg[8]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_0_1_out),
        .\dists_0_1_fu_58_reg[8]_1 (dists_0_0_fu_62),
        .\dists_1_1_fu_62_reg[8]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_1_1_out),
        .\dists_1_1_fu_62_reg[8]_1 (dists_1_0_fu_66),
        .\dists_2_1_fu_66_reg[8]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_2_1_out),
        .\dists_2_1_fu_66_reg[8]_1 (dists_2_0_fu_70),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .\i_fu_54_reg[0]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_8),
        .\labels_0_1_fu_70_reg[3]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_0_1_out),
        .\labels_0_1_fu_70_reg[3]_1 (labels_0_0_fu_74),
        .\labels_1_1_fu_74_reg[3]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_1_1_out),
        .\labels_1_1_fu_74_reg[3]_1 (labels_1_0_fu_78),
        .\labels_2_1_fu_78_reg[3]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_2_1_out),
        .\labels_2_1_fu_78_reg[3]_1 (labels_2_0_fu_82),
        .\t_fu_58_reg[0] (t_fu_58_reg),
        .\t_fu_58_reg[2] (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_7));
  FDRE #(
    .INIT(1'b0)) 
    grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_n_8),
        .Q(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .R(ap_rst));
  bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_TRAINING_LOOP grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177
       (.D(ap_NS_fsm[5:4]),
        .E(dists_2_0_fu_700),
        .Q(\^training_samples_address0 [1]),
        .\ap_CS_fsm_reg[1]_0 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_1_3_out_o),
        .\ap_CS_fsm_reg[1]_1 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_2_3_out_o),
        .\ap_CS_fsm_reg[3]_0 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_n_52),
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .\dists_0_0_fu_62_reg[8] ({ap_CS_fsm_state5,ap_CS_fsm_state4,ap_CS_fsm_state2}),
        .\dists_0_0_fu_62_reg[8]_0 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_0_1_out),
        .\dists_0_0_fu_62_reg[8]_1 (dists_0_0_fu_62),
        .\dists_0_1_fu_58_reg[8] (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_dists_0_3_out_o),
        .\dists_1_0_fu_66_reg[8] (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_1_1_out),
        .\dists_1_3_out_load_reg_6847_reg[8]_0 (dists_1_0_fu_66),
        .\dists_2_0_fu_70_reg[8] (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_dists_2_1_out),
        .\dists_2_3_out_load_reg_6874_reg[8]_0 (dists_2_0_fu_70),
        .grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .\labels_0_3_fu_246_reg[3]_0 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out),
        .\labels_0_3_fu_246_reg[3]_1 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_0_1_out),
        .\labels_1_3_fu_250_reg[3]_0 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out),
        .\labels_1_3_fu_250_reg[3]_1 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_1_1_out),
        .\labels_2_3_fu_254_reg[3]_0 (grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out),
        .\labels_2_3_fu_254_reg[3]_1 (grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_labels_2_1_out),
        .test_set_address0(test_set_address0[0]),
        .test_set_ce0(test_set_ce0),
        .test_set_ce1(test_set_ce1),
        .test_set_q0(test_set_q0),
        .test_set_q1(test_set_q1),
        .\tmp_reg_5097_reg[0]_0 (test_set_load_reg_487),
        .training_labels_address0(training_labels_address0),
        .training_labels_ce0(training_labels_ce0),
        .training_labels_q0(training_labels_q0[3:0]),
        .training_samples_address0(\^training_samples_address0 [13:2]),
        .training_samples_ce1(training_samples_ce1),
        .training_samples_q0(training_samples_q0),
        .training_samples_q1(training_samples_q1));
  FDRE #(
    .INIT(1'b0)) 
    grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_n_52),
        .Q(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .R(ap_rst));
  bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_VITIS_LOOP_69_1 grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201
       (.D(ap_NS_fsm[7:6]),
        .E(votes_ce0),
        .Q({ap_CS_fsm_state9,ap_CS_fsm_state7,ap_CS_fsm_state6,ap_CS_fsm_state3}),
        .\ap_CS_fsm_reg[5] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_44),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_rst(ap_rst),
        .d0(d0),
        .grp_DigitRec_Pipeline_3_fu_172_votes_address0(grp_DigitRec_Pipeline_3_fu_172_votes_address0),
        .grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .p_0_in(p_0_in),
        .\p_load_reg_78_reg[0] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_8),
        .\p_load_reg_78_reg[1] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_9),
        .\p_load_reg_78_reg[2] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_10),
        .\p_load_reg_78_reg[3] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_11),
        .\tmp_reg_130_reg[3]_0 (trunc_ln107_reg_510),
        .\tmp_reg_130_reg[3]_1 (trunc_ln107_1_reg_515),
        .\tmp_reg_130_reg[3]_2 (trunc_ln107_2_reg_520),
        .\votes_load_reg_140_reg[31]_0 (q0));
  FDRE #(
    .INIT(1'b0)) 
    grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_44),
        .Q(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .R(ap_rst));
  bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2 grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209
       (.D(ap_NS_fsm[9:8]),
        .Q({ap_CS_fsm_state9,ap_CS_fsm_state8}),
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_n_10),
        .\q0_reg[31] (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_11),
        .\q0_reg[31]_0 (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_9),
        .\q0_reg[31]_1 (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_10),
        .\q0_reg[31]_2 (grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_n_8),
        .results_d0(\^results_d0 ),
        .votes_address0(votes_address0),
        .\votes_load_reg_183_reg[31]_0 (q0));
  FDRE #(
    .INIT(1'b0)) 
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_n_10),
        .Q(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_0_fu_74_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[0]),
        .Q(labels_0_0_fu_74[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_0_fu_74_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[1]),
        .Q(labels_0_0_fu_74[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_0_fu_74_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[2]),
        .Q(labels_0_0_fu_74[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_0_fu_74_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[3]),
        .Q(labels_0_0_fu_74[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_0_fu_78_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[0]),
        .Q(labels_1_0_fu_78[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_0_fu_78_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[1]),
        .Q(labels_1_0_fu_78[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_0_fu_78_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[2]),
        .Q(labels_1_0_fu_78[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_0_fu_78_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[3]),
        .Q(labels_1_0_fu_78[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_0_fu_82_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[0]),
        .Q(labels_2_0_fu_82[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_0_fu_82_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[1]),
        .Q(labels_2_0_fu_82[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_0_fu_82_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[2]),
        .Q(labels_2_0_fu_82[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_0_fu_82_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[3]),
        .Q(labels_2_0_fu_82[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \t_fu_58[0]_i_1 
       (.I0(t_fu_58_reg[0]),
        .O(\t_fu_58[0]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \t_fu_58[1]_i_1 
       (.I0(t_fu_58_reg[1]),
        .I1(t_fu_58_reg[0]),
        .O(add_ln96_fu_229_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \t_fu_58[2]_i_1 
       (.I0(t_fu_58_reg[2]),
        .I1(t_fu_58_reg[0]),
        .I2(t_fu_58_reg[1]),
        .O(add_ln96_fu_229_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \t_fu_58[3]_i_1 
       (.I0(t_fu_58_reg[0]),
        .I1(t_fu_58_reg[1]),
        .I2(t_fu_58_reg[2]),
        .I3(t_fu_58_reg[3]),
        .O(add_ln96_fu_229_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \t_fu_58[4]_i_1 
       (.I0(t_fu_58_reg[4]),
        .I1(t_fu_58_reg[0]),
        .I2(t_fu_58_reg[1]),
        .I3(t_fu_58_reg[2]),
        .I4(t_fu_58_reg[3]),
        .O(add_ln96_fu_229_p2[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \t_fu_58[5]_i_1 
       (.I0(t_fu_58_reg[5]),
        .I1(t_fu_58_reg[3]),
        .I2(t_fu_58_reg[2]),
        .I3(t_fu_58_reg[1]),
        .I4(t_fu_58_reg[0]),
        .I5(t_fu_58_reg[4]),
        .O(add_ln96_fu_229_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \t_fu_58[6]_i_1 
       (.I0(t_fu_58_reg[6]),
        .I1(\t_fu_58[8]_i_4_n_4 ),
        .I2(t_fu_58_reg[5]),
        .O(add_ln96_fu_229_p2[6]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \t_fu_58[7]_i_1 
       (.I0(t_fu_58_reg[7]),
        .I1(\t_fu_58[8]_i_4_n_4 ),
        .I2(t_fu_58_reg[5]),
        .I3(t_fu_58_reg[6]),
        .O(add_ln96_fu_229_p2[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \t_fu_58[8]_i_1 
       (.I0(ap_start),
        .I1(\ap_CS_fsm_reg_n_4_[0] ),
        .O(\t_fu_58[8]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \t_fu_58[8]_i_3 
       (.I0(t_fu_58_reg[8]),
        .I1(\t_fu_58[8]_i_4_n_4 ),
        .I2(t_fu_58_reg[7]),
        .I3(t_fu_58_reg[6]),
        .I4(t_fu_58_reg[5]),
        .O(add_ln96_fu_229_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \t_fu_58[8]_i_4 
       (.I0(t_fu_58_reg[4]),
        .I1(t_fu_58_reg[0]),
        .I2(t_fu_58_reg[1]),
        .I3(t_fu_58_reg[2]),
        .I4(t_fu_58_reg[3]),
        .O(\t_fu_58[8]_i_4_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[0] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(\t_fu_58[0]_i_1_n_4 ),
        .Q(t_fu_58_reg[0]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[1] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[1]),
        .Q(t_fu_58_reg[1]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[2] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[2]),
        .Q(t_fu_58_reg[2]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[3] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[3]),
        .Q(t_fu_58_reg[3]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[4] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[4]),
        .Q(t_fu_58_reg[4]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[5] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[5]),
        .Q(t_fu_58_reg[5]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[6] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[6]),
        .Q(t_fu_58_reg[6]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[7] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[7]),
        .Q(t_fu_58_reg[7]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_fu_58_reg[8] 
       (.C(ap_clk),
        .CE(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .D(add_ln96_fu_229_p2[8]),
        .Q(t_fu_58_reg[8]),
        .R(\t_fu_58[8]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[10]_INST_0 
       (.I0(t_fu_58_reg[8]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [10]),
        .O(test_set_address0[10]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \test_set_address0[1]_INST_0 
       (.I0(ap_CS_fsm_state2),
        .O(test_set_address0[1]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[2]_INST_0 
       (.I0(t_fu_58_reg[0]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [2]),
        .O(test_set_address0[2]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[3]_INST_0 
       (.I0(t_fu_58_reg[1]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [3]),
        .O(test_set_address0[3]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[4]_INST_0 
       (.I0(t_fu_58_reg[2]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [4]),
        .O(test_set_address0[4]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[5]_INST_0 
       (.I0(t_fu_58_reg[3]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [5]),
        .O(test_set_address0[5]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[6]_INST_0 
       (.I0(t_fu_58_reg[4]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [6]),
        .O(test_set_address0[6]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[7]_INST_0 
       (.I0(t_fu_58_reg[5]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [7]),
        .O(test_set_address0[7]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[8]_INST_0 
       (.I0(t_fu_58_reg[6]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [8]),
        .O(test_set_address0[8]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \test_set_address0[9]_INST_0 
       (.I0(t_fu_58_reg[7]),
        .I1(ap_CS_fsm_state2),
        .I2(\^test_set_address1 [9]),
        .O(test_set_address0[9]));
  FDRE \test_set_load_reg_487_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[0]),
        .Q(test_set_load_reg_487[0]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[10]),
        .Q(test_set_load_reg_487[10]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[11]),
        .Q(test_set_load_reg_487[11]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[12]),
        .Q(test_set_load_reg_487[12]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[13]),
        .Q(test_set_load_reg_487[13]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[14]),
        .Q(test_set_load_reg_487[14]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[15]),
        .Q(test_set_load_reg_487[15]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[16]),
        .Q(test_set_load_reg_487[16]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[17]),
        .Q(test_set_load_reg_487[17]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[18]),
        .Q(test_set_load_reg_487[18]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[19]),
        .Q(test_set_load_reg_487[19]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[1]),
        .Q(test_set_load_reg_487[1]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[20]),
        .Q(test_set_load_reg_487[20]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[21]),
        .Q(test_set_load_reg_487[21]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[22]),
        .Q(test_set_load_reg_487[22]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[23]),
        .Q(test_set_load_reg_487[23]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[24]),
        .Q(test_set_load_reg_487[24]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[25]),
        .Q(test_set_load_reg_487[25]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[26]),
        .Q(test_set_load_reg_487[26]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[27]),
        .Q(test_set_load_reg_487[27]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[28]),
        .Q(test_set_load_reg_487[28]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[29]),
        .Q(test_set_load_reg_487[29]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[2]),
        .Q(test_set_load_reg_487[2]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[30]),
        .Q(test_set_load_reg_487[30]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[31]),
        .Q(test_set_load_reg_487[31]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[32]),
        .Q(test_set_load_reg_487[32]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[33]),
        .Q(test_set_load_reg_487[33]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[34]),
        .Q(test_set_load_reg_487[34]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[35]),
        .Q(test_set_load_reg_487[35]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[36]),
        .Q(test_set_load_reg_487[36]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[37] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[37]),
        .Q(test_set_load_reg_487[37]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[38] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[38]),
        .Q(test_set_load_reg_487[38]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[39] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[39]),
        .Q(test_set_load_reg_487[39]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[3]),
        .Q(test_set_load_reg_487[3]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[40]),
        .Q(test_set_load_reg_487[40]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[41]),
        .Q(test_set_load_reg_487[41]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[42]),
        .Q(test_set_load_reg_487[42]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[43] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[43]),
        .Q(test_set_load_reg_487[43]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[44] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[44]),
        .Q(test_set_load_reg_487[44]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[45] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[45]),
        .Q(test_set_load_reg_487[45]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[46] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[46]),
        .Q(test_set_load_reg_487[46]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[47] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[47]),
        .Q(test_set_load_reg_487[47]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[48]),
        .Q(test_set_load_reg_487[48]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[49]),
        .Q(test_set_load_reg_487[49]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[4]),
        .Q(test_set_load_reg_487[4]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[50]),
        .Q(test_set_load_reg_487[50]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[51] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[51]),
        .Q(test_set_load_reg_487[51]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[52] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[52]),
        .Q(test_set_load_reg_487[52]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[53] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[53]),
        .Q(test_set_load_reg_487[53]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[54] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[54]),
        .Q(test_set_load_reg_487[54]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[55] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[55]),
        .Q(test_set_load_reg_487[55]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[56]),
        .Q(test_set_load_reg_487[56]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[57]),
        .Q(test_set_load_reg_487[57]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[58]),
        .Q(test_set_load_reg_487[58]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[59] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[59]),
        .Q(test_set_load_reg_487[59]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[5]),
        .Q(test_set_load_reg_487[5]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[60] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[60]),
        .Q(test_set_load_reg_487[60]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[61] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[61]),
        .Q(test_set_load_reg_487[61]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[62] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[62]),
        .Q(test_set_load_reg_487[62]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[63] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[63]),
        .Q(test_set_load_reg_487[63]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[6]),
        .Q(test_set_load_reg_487[6]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[7]),
        .Q(test_set_load_reg_487[7]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[8]),
        .Q(test_set_load_reg_487[8]),
        .R(1'b0));
  FDRE \test_set_load_reg_487_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(test_set_q0[9]),
        .Q(test_set_load_reg_487[9]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[8]),
        .Q(\^test_set_address1 [10]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[0]),
        .Q(\^test_set_address1 [2]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[1]),
        .Q(\^test_set_address1 [3]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[2]),
        .Q(\^test_set_address1 [4]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[3]),
        .Q(\^test_set_address1 [5]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[4]),
        .Q(\^test_set_address1 [6]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[5]),
        .Q(\^test_set_address1 [7]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[6]),
        .Q(\^test_set_address1 [8]),
        .R(1'b0));
  FDRE \tmp_1_reg_477_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(t_fu_58_reg[7]),
        .Q(\^test_set_address1 [9]),
        .R(1'b0));
  FDRE \trunc_ln107_1_reg_515_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[0]),
        .Q(trunc_ln107_1_reg_515[0]),
        .R(1'b0));
  FDRE \trunc_ln107_1_reg_515_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[1]),
        .Q(trunc_ln107_1_reg_515[1]),
        .R(1'b0));
  FDRE \trunc_ln107_1_reg_515_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[2]),
        .Q(trunc_ln107_1_reg_515[2]),
        .R(1'b0));
  FDRE \trunc_ln107_1_reg_515_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_1_3_out[3]),
        .Q(trunc_ln107_1_reg_515[3]),
        .R(1'b0));
  FDRE \trunc_ln107_2_reg_520_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[0]),
        .Q(trunc_ln107_2_reg_520[0]),
        .R(1'b0));
  FDRE \trunc_ln107_2_reg_520_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[1]),
        .Q(trunc_ln107_2_reg_520[1]),
        .R(1'b0));
  FDRE \trunc_ln107_2_reg_520_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[2]),
        .Q(trunc_ln107_2_reg_520[2]),
        .R(1'b0));
  FDRE \trunc_ln107_2_reg_520_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_0_3_out[3]),
        .Q(trunc_ln107_2_reg_520[3]),
        .R(1'b0));
  FDRE \trunc_ln107_reg_510_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[0]),
        .Q(trunc_ln107_reg_510[0]),
        .R(1'b0));
  FDRE \trunc_ln107_reg_510_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[1]),
        .Q(trunc_ln107_reg_510[1]),
        .R(1'b0));
  FDRE \trunc_ln107_reg_510_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[2]),
        .Q(trunc_ln107_reg_510[2]),
        .R(1'b0));
  FDRE \trunc_ln107_reg_510_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_labels_2_3_out[3]),
        .Q(trunc_ln107_reg_510[3]),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_votes_RAM_AUTO_1R1W votes_U
       (.E(votes_ce0),
        .ap_clk(ap_clk),
        .d0(d0),
        .p_0_in(p_0_in),
        .q0(q0),
        .votes_address0(votes_address0));
endmodule

(* ORIG_REF_NAME = "DigitRec_DigitRec_Pipeline_3" *) 
module bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_3
   (ap_done_cache,
    ap_enable_reg_pp0_iter1,
    ap_loop_init_int_reg,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg,
    grp_DigitRec_Pipeline_3_fu_172_votes_address0,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0);
  output ap_done_cache;
  output ap_enable_reg_pp0_iter1;
  output ap_loop_init_int_reg;
  output grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg;
  output [3:0]grp_DigitRec_Pipeline_3_fu_172_votes_address0;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;

  wire ap_clk;
  wire ap_done_cache;
  wire ap_enable_reg_pp0_iter1;
  wire ap_loop_init_int_reg;
  wire ap_rst;
  wire [3:0]ap_sig_allocacmp_p_load;
  wire [3:0]empty_568_fu_56_p2;
  wire empty_fu_240;
  wire \empty_fu_24_reg_n_4_[0] ;
  wire \empty_fu_24_reg_n_4_[1] ;
  wire \empty_fu_24_reg_n_4_[2] ;
  wire \empty_fu_24_reg_n_4_[3] ;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg;
  wire [3:0]grp_DigitRec_Pipeline_3_fu_172_votes_address0;

  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(empty_fu_240),
        .Q(ap_enable_reg_pp0_iter1),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_24_reg[0] 
       (.C(ap_clk),
        .CE(empty_fu_240),
        .D(empty_568_fu_56_p2[0]),
        .Q(\empty_fu_24_reg_n_4_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_24_reg[1] 
       (.C(ap_clk),
        .CE(empty_fu_240),
        .D(empty_568_fu_56_p2[1]),
        .Q(\empty_fu_24_reg_n_4_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_24_reg[2] 
       (.C(ap_clk),
        .CE(empty_fu_240),
        .D(empty_568_fu_56_p2[2]),
        .Q(\empty_fu_24_reg_n_4_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_24_reg[3] 
       (.C(ap_clk),
        .CE(empty_fu_240),
        .D(empty_568_fu_56_p2[3]),
        .Q(\empty_fu_24_reg_n_4_[3] ),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_3 flow_control_loop_pipe_sequential_init_U
       (.ap_clk(ap_clk),
        .ap_done_cache(ap_done_cache),
        .ap_enable_reg_pp0_iter1_reg(\empty_fu_24_reg_n_4_[1] ),
        .ap_loop_init_int_reg_0(ap_loop_init_int_reg),
        .ap_rst(ap_rst),
        .ap_sig_allocacmp_p_load(ap_sig_allocacmp_p_load),
        .empty_568_fu_56_p2(empty_568_fu_56_p2),
        .empty_fu_240(empty_fu_240),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg),
        .\p_load_reg_78_reg[0] (\empty_fu_24_reg_n_4_[0] ),
        .\p_load_reg_78_reg[2] (\empty_fu_24_reg_n_4_[2] ),
        .\p_load_reg_78_reg[3] (\empty_fu_24_reg_n_4_[3] ));
  FDRE \p_load_reg_78_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_sig_allocacmp_p_load[0]),
        .Q(grp_DigitRec_Pipeline_3_fu_172_votes_address0[0]),
        .R(1'b0));
  FDRE \p_load_reg_78_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_sig_allocacmp_p_load[1]),
        .Q(grp_DigitRec_Pipeline_3_fu_172_votes_address0[1]),
        .R(1'b0));
  FDRE \p_load_reg_78_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_sig_allocacmp_p_load[2]),
        .Q(grp_DigitRec_Pipeline_3_fu_172_votes_address0[2]),
        .R(1'b0));
  FDRE \p_load_reg_78_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_sig_allocacmp_p_load[3]),
        .Q(grp_DigitRec_Pipeline_3_fu_172_votes_address0[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "DigitRec_DigitRec_Pipeline_SET_KNN_SET" *) 
module bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_SET_KNN_SET
   (D,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0,
    \t_fu_58_reg[2] ,
    \i_fu_54_reg[0]_0 ,
    \labels_2_1_fu_78_reg[3]_0 ,
    \labels_1_1_fu_74_reg[3]_0 ,
    \labels_0_1_fu_70_reg[3]_0 ,
    \dists_2_1_fu_66_reg[8]_0 ,
    \dists_1_1_fu_62_reg[8]_0 ,
    \dists_0_1_fu_58_reg[8]_0 ,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg,
    \ap_CS_fsm_reg[2] ,
    Q,
    ap_done_cache,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg,
    \t_fu_58_reg[0] ,
    \labels_2_1_fu_78_reg[3]_1 ,
    \labels_1_1_fu_74_reg[3]_1 ,
    \labels_0_1_fu_70_reg[3]_1 ,
    \dists_2_1_fu_66_reg[8]_1 ,
    \dists_1_1_fu_62_reg[8]_1 ,
    \dists_0_1_fu_58_reg[8]_1 );
  output [1:0]D;
  output grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  output \t_fu_58_reg[2] ;
  output \i_fu_54_reg[0]_0 ;
  output [3:0]\labels_2_1_fu_78_reg[3]_0 ;
  output [3:0]\labels_1_1_fu_74_reg[3]_0 ;
  output [3:0]\labels_0_1_fu_70_reg[3]_0 ;
  output [8:0]\dists_2_1_fu_66_reg[8]_0 ;
  output [8:0]\dists_1_1_fu_62_reg[8]_0 ;
  output [8:0]\dists_0_1_fu_58_reg[8]_0 ;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg;
  input \ap_CS_fsm_reg[2] ;
  input [1:0]Q;
  input ap_done_cache;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  input [8:0]\t_fu_58_reg[0] ;
  input [3:0]\labels_2_1_fu_78_reg[3]_1 ;
  input [3:0]\labels_1_1_fu_74_reg[3]_1 ;
  input [3:0]\labels_0_1_fu_70_reg[3]_1 ;
  input [8:0]\dists_2_1_fu_66_reg[8]_1 ;
  input [8:0]\dists_1_1_fu_62_reg[8]_1 ;
  input [8:0]\dists_0_1_fu_58_reg[8]_1 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire \ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_loop_init_int;
  wire ap_rst;
  wire dists_0_1_fu_58;
  wire [8:0]\dists_0_1_fu_58_reg[8]_0 ;
  wire [8:0]\dists_0_1_fu_58_reg[8]_1 ;
  wire dists_1_1_fu_62;
  wire [8:0]\dists_1_1_fu_62_reg[8]_0 ;
  wire [8:0]\dists_1_1_fu_62_reg[8]_1 ;
  wire dists_2_1_fu_66;
  wire [8:0]\dists_2_1_fu_66_reg[8]_0 ;
  wire [8:0]\dists_2_1_fu_66_reg[8]_1 ;
  wire flow_control_loop_pipe_sequential_init_U_n_5;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  wire grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg;
  wire \i_fu_54[0]_i_1_n_4 ;
  wire \i_fu_54[1]_i_1_n_4 ;
  wire \i_fu_54_reg[0]_0 ;
  wire \i_fu_54_reg_n_4_[0] ;
  wire \i_fu_54_reg_n_4_[1] ;
  wire [3:0]\labels_0_1_fu_70_reg[3]_0 ;
  wire [3:0]\labels_0_1_fu_70_reg[3]_1 ;
  wire [3:0]\labels_1_1_fu_74_reg[3]_0 ;
  wire [3:0]\labels_1_1_fu_74_reg[3]_1 ;
  wire [3:0]\labels_2_1_fu_78_reg[3]_0 ;
  wire [3:0]\labels_2_1_fu_78_reg[3]_1 ;
  wire [8:0]\t_fu_58_reg[0] ;
  wire \t_fu_58_reg[2] ;

  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [0]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [0]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [1]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [1]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [2]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [2]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [3]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [3]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[4] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [4]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [4]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[5] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [5]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [5]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[6] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [6]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [6]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[7] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [7]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [7]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDSE #(
    .INIT(1'b0)) 
    \dists_0_1_fu_58_reg[8] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_0_1_fu_58_reg[8]_1 [8]),
        .Q(\dists_0_1_fu_58_reg[8]_0 [8]),
        .S(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [0]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [0]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [1]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [1]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [2]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [2]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [3]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [3]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[4] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [4]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [4]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[5] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [5]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [5]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[6] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [6]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [6]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[7] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [7]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [7]),
        .R(dists_1_1_fu_62));
  FDSE #(
    .INIT(1'b0)) 
    \dists_1_1_fu_62_reg[8] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_1_1_fu_62_reg[8]_1 [8]),
        .Q(\dists_1_1_fu_62_reg[8]_0 [8]),
        .S(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [0]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [0]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [1]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [1]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [2]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [2]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [3]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [3]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[4] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [4]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [4]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[5] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [5]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [5]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[6] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [6]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [6]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[7] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [7]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [7]),
        .R(dists_2_1_fu_66));
  FDSE #(
    .INIT(1'b0)) 
    \dists_2_1_fu_66_reg[8] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\dists_2_1_fu_66_reg[8]_1 [8]),
        .Q(\dists_2_1_fu_66_reg[8]_0 [8]),
        .S(dists_2_1_fu_66));
  bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_2 flow_control_loop_pipe_sequential_init_U
       (.D(D),
        .E(dists_0_1_fu_58),
        .Q(Q),
        .SR(flow_control_loop_pipe_sequential_init_U_n_5),
        .\ap_CS_fsm_reg[2] (\ap_CS_fsm_reg[2] ),
        .ap_clk(ap_clk),
        .ap_done_cache(ap_done_cache),
        .ap_done_cache_reg_0(\i_fu_54_reg_n_4_[1] ),
        .ap_done_cache_reg_1(\i_fu_54_reg_n_4_[0] ),
        .ap_loop_init_int(ap_loop_init_int),
        .ap_rst(ap_rst),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .\i_fu_54_reg[0] (dists_2_1_fu_66),
        .\i_fu_54_reg[0]_0 (\i_fu_54_reg[0]_0 ),
        .\i_fu_54_reg[1] (dists_1_1_fu_62),
        .\t_fu_58_reg[0] (\t_fu_58_reg[0] ),
        .\t_fu_58_reg[2] (\t_fu_58_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFBCC)) 
    \i_fu_54[0]_i_1 
       (.I0(ap_loop_init_int),
        .I1(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I2(\i_fu_54_reg_n_4_[1] ),
        .I3(\i_fu_54_reg_n_4_[0] ),
        .O(\i_fu_54[0]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7470)) 
    \i_fu_54[1]_i_1 
       (.I0(ap_loop_init_int),
        .I1(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I2(\i_fu_54_reg_n_4_[1] ),
        .I3(\i_fu_54_reg_n_4_[0] ),
        .O(\i_fu_54[1]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_54_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\i_fu_54[0]_i_1_n_4 ),
        .Q(\i_fu_54_reg_n_4_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_54_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\i_fu_54[1]_i_1_n_4 ),
        .Q(\i_fu_54_reg_n_4_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_1_fu_70_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_0_1_fu_70_reg[3]_1 [0]),
        .Q(\labels_0_1_fu_70_reg[3]_0 [0]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_1_fu_70_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_0_1_fu_70_reg[3]_1 [1]),
        .Q(\labels_0_1_fu_70_reg[3]_0 [1]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_1_fu_70_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_0_1_fu_70_reg[3]_1 [2]),
        .Q(\labels_0_1_fu_70_reg[3]_0 [2]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_1_fu_70_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_0_1_fu_70_reg[3]_1 [3]),
        .Q(\labels_0_1_fu_70_reg[3]_0 [3]),
        .R(flow_control_loop_pipe_sequential_init_U_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_1_fu_74_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_1_1_fu_74_reg[3]_1 [0]),
        .Q(\labels_1_1_fu_74_reg[3]_0 [0]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_1_fu_74_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_1_1_fu_74_reg[3]_1 [1]),
        .Q(\labels_1_1_fu_74_reg[3]_0 [1]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_1_fu_74_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_1_1_fu_74_reg[3]_1 [2]),
        .Q(\labels_1_1_fu_74_reg[3]_0 [2]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_1_fu_74_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_1_1_fu_74_reg[3]_1 [3]),
        .Q(\labels_1_1_fu_74_reg[3]_0 [3]),
        .R(dists_1_1_fu_62));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_1_fu_78_reg[0] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_2_1_fu_78_reg[3]_1 [0]),
        .Q(\labels_2_1_fu_78_reg[3]_0 [0]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_1_fu_78_reg[1] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_2_1_fu_78_reg[3]_1 [1]),
        .Q(\labels_2_1_fu_78_reg[3]_0 [1]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_1_fu_78_reg[2] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_2_1_fu_78_reg[3]_1 [2]),
        .Q(\labels_2_1_fu_78_reg[3]_0 [2]),
        .R(dists_2_1_fu_66));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_1_fu_78_reg[3] 
       (.C(ap_clk),
        .CE(dists_0_1_fu_58),
        .D(\labels_2_1_fu_78_reg[3]_1 [3]),
        .Q(\labels_2_1_fu_78_reg[3]_0 [3]),
        .R(dists_2_1_fu_66));
endmodule

(* ORIG_REF_NAME = "DigitRec_DigitRec_Pipeline_TRAINING_LOOP" *) 
module bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_TRAINING_LOOP
   (Q,
    D,
    test_set_ce1,
    test_set_ce0,
    training_samples_ce1,
    training_samples_address0,
    \ap_CS_fsm_reg[1]_0 ,
    \ap_CS_fsm_reg[1]_1 ,
    E,
    \dists_0_1_fu_58_reg[8] ,
    training_labels_ce0,
    test_set_address0,
    \ap_CS_fsm_reg[3]_0 ,
    training_labels_address0,
    \labels_2_3_fu_254_reg[3]_0 ,
    \labels_1_3_fu_250_reg[3]_0 ,
    \labels_0_3_fu_246_reg[3]_0 ,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg,
    \dists_0_0_fu_62_reg[8] ,
    \dists_1_3_out_load_reg_6847_reg[8]_0 ,
    \dists_1_0_fu_66_reg[8] ,
    \dists_2_3_out_load_reg_6874_reg[8]_0 ,
    \dists_2_0_fu_70_reg[8] ,
    \labels_2_3_fu_254_reg[3]_1 ,
    \labels_1_3_fu_250_reg[3]_1 ,
    \labels_0_3_fu_246_reg[3]_1 ,
    \dists_0_0_fu_62_reg[8]_0 ,
    \dists_0_0_fu_62_reg[8]_1 ,
    test_set_q0,
    test_set_q1,
    training_samples_q1,
    training_samples_q0,
    training_labels_q0,
    \tmp_reg_5097_reg[0]_0 );
  output [0:0]Q;
  output [1:0]D;
  output test_set_ce1;
  output test_set_ce0;
  output training_samples_ce1;
  output [11:0]training_samples_address0;
  output [8:0]\ap_CS_fsm_reg[1]_0 ;
  output [8:0]\ap_CS_fsm_reg[1]_1 ;
  output [0:0]E;
  output [8:0]\dists_0_1_fu_58_reg[8] ;
  output training_labels_ce0;
  output [0:0]test_set_address0;
  output \ap_CS_fsm_reg[3]_0 ;
  output [11:0]training_labels_address0;
  output [3:0]\labels_2_3_fu_254_reg[3]_0 ;
  output [3:0]\labels_1_3_fu_250_reg[3]_0 ;
  output [3:0]\labels_0_3_fu_246_reg[3]_0 ;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg;
  input [2:0]\dists_0_0_fu_62_reg[8] ;
  input [8:0]\dists_1_3_out_load_reg_6847_reg[8]_0 ;
  input [8:0]\dists_1_0_fu_66_reg[8] ;
  input [8:0]\dists_2_3_out_load_reg_6874_reg[8]_0 ;
  input [8:0]\dists_2_0_fu_70_reg[8] ;
  input [3:0]\labels_2_3_fu_254_reg[3]_1 ;
  input [3:0]\labels_1_3_fu_250_reg[3]_1 ;
  input [3:0]\labels_0_3_fu_246_reg[3]_1 ;
  input [8:0]\dists_0_0_fu_62_reg[8]_0 ;
  input [8:0]\dists_0_0_fu_62_reg[8]_1 ;
  input [63:0]test_set_q0;
  input [63:0]test_set_q1;
  input [63:0]training_samples_q1;
  input [63:0]training_samples_q0;
  input [3:0]training_labels_q0;
  input [63:0]\tmp_reg_5097_reg[0]_0 ;

  wire [1:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [11:0]add_ln107_fu_1077_p2;
  wire add_ln107_fu_1077_p2_carry__0_n_4;
  wire add_ln107_fu_1077_p2_carry__0_n_5;
  wire add_ln107_fu_1077_p2_carry__0_n_6;
  wire add_ln107_fu_1077_p2_carry__0_n_7;
  wire add_ln107_fu_1077_p2_carry__1_n_6;
  wire add_ln107_fu_1077_p2_carry__1_n_7;
  wire add_ln107_fu_1077_p2_carry_n_4;
  wire add_ln107_fu_1077_p2_carry_n_5;
  wire add_ln107_fu_1077_p2_carry_n_6;
  wire add_ln107_fu_1077_p2_carry_n_7;
  wire [58:0]add_ln18_1_fu_2625_p2;
  wire [58:0]add_ln18_1_reg_6132;
  wire \add_ln18_1_reg_6132[10]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[10]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[18]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[18]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[26]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[26]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[2]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[2]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[34]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[34]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[42]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[42]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[50]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[50]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132[58]_i_2_n_4 ;
  wire \add_ln18_1_reg_6132[58]_i_3_n_4 ;
  wire \add_ln18_1_reg_6132_reg[10]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[18]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[26]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[2]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[34]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[42]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[50]_i_1_n_7 ;
  wire \add_ln18_1_reg_6132_reg[58]_i_1_n_7 ;
  wire [58:0]add_ln18_2_fu_3860_p2;
  wire [58:0]add_ln18_2_reg_6614;
  wire \add_ln18_2_reg_6614[10]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[10]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[18]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[18]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[26]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[26]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[2]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[2]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[34]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[34]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[42]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[42]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[50]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[50]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614[58]_i_2_n_4 ;
  wire \add_ln18_2_reg_6614[58]_i_3_n_4 ;
  wire \add_ln18_2_reg_6614_reg[10]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[18]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[26]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[2]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[34]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[42]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[50]_i_1_n_7 ;
  wire \add_ln18_2_reg_6614_reg[58]_i_1_n_7 ;
  wire [58:0]add_ln18_3_fu_4088_p2;
  wire [58:0]add_ln18_3_reg_6624;
  wire \add_ln18_3_reg_6624[10]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[10]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[18]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[18]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[26]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[26]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[2]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[2]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[34]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[34]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[42]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[42]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[50]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[50]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624[58]_i_2_n_4 ;
  wire \add_ln18_3_reg_6624[58]_i_3_n_4 ;
  wire \add_ln18_3_reg_6624_reg[10]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[18]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[26]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[2]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[34]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[42]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[50]_i_1_n_7 ;
  wire \add_ln18_3_reg_6624_reg[58]_i_1_n_7 ;
  wire [58:0]add_ln18_fu_2413_p2;
  wire [58:0]add_ln18_reg_6127;
  wire \add_ln18_reg_6127[10]_i_2_n_4 ;
  wire \add_ln18_reg_6127[10]_i_3_n_4 ;
  wire \add_ln18_reg_6127[18]_i_2_n_4 ;
  wire \add_ln18_reg_6127[18]_i_3_n_4 ;
  wire \add_ln18_reg_6127[26]_i_2_n_4 ;
  wire \add_ln18_reg_6127[26]_i_3_n_4 ;
  wire \add_ln18_reg_6127[2]_i_2_n_4 ;
  wire \add_ln18_reg_6127[2]_i_3_n_4 ;
  wire \add_ln18_reg_6127[34]_i_2_n_4 ;
  wire \add_ln18_reg_6127[34]_i_3_n_4 ;
  wire \add_ln18_reg_6127[42]_i_2_n_4 ;
  wire \add_ln18_reg_6127[42]_i_3_n_4 ;
  wire \add_ln18_reg_6127[50]_i_2_n_4 ;
  wire \add_ln18_reg_6127[50]_i_3_n_4 ;
  wire \add_ln18_reg_6127[58]_i_2_n_4 ;
  wire \add_ln18_reg_6127[58]_i_3_n_4 ;
  wire \add_ln18_reg_6127_reg[10]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[18]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[26]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[2]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[34]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[42]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[50]_i_1_n_7 ;
  wire \add_ln18_reg_6127_reg[58]_i_1_n_7 ;
  wire [62:4]add_ln21_1_fu_2397_p2;
  wire [62:4]add_ln21_2_fu_3866_p2;
  wire [62:4]add_ln21_3_fu_4094_p2;
  wire [62:4]add_ln21_fu_2631_p2;
  wire [52:16]add_ln23_1_fu_4258_p2;
  wire [52:16]add_ln23_2_fu_4550_p2;
  wire [52:16]add_ln23_3_fu_4634_p2;
  wire [52:16]add_ln23_fu_4174_p2;
  wire [6:0]add_ln26_1_fu_4718_p2;
  wire [6:0]add_ln26_1_reg_6832;
  wire \add_ln26_1_reg_6832[3]_i_2_n_4 ;
  wire \add_ln26_1_reg_6832[3]_i_3_n_4 ;
  wire \add_ln26_1_reg_6832[3]_i_4_n_4 ;
  wire \add_ln26_1_reg_6832[3]_i_5_n_4 ;
  wire \add_ln26_1_reg_6832[6]_i_2_n_4 ;
  wire \add_ln26_1_reg_6832[6]_i_3_n_4 ;
  wire \add_ln26_1_reg_6832_reg[3]_i_1_n_4 ;
  wire \add_ln26_1_reg_6832_reg[3]_i_1_n_5 ;
  wire \add_ln26_1_reg_6832_reg[3]_i_1_n_6 ;
  wire \add_ln26_1_reg_6832_reg[3]_i_1_n_7 ;
  wire \add_ln26_1_reg_6832_reg[6]_i_1_n_7 ;
  wire [6:0]add_ln26_2_fu_4722_p2;
  wire [6:0]add_ln26_2_reg_6837;
  wire \add_ln26_2_reg_6837[3]_i_2_n_4 ;
  wire \add_ln26_2_reg_6837[3]_i_3_n_4 ;
  wire \add_ln26_2_reg_6837[3]_i_4_n_4 ;
  wire \add_ln26_2_reg_6837[3]_i_5_n_4 ;
  wire \add_ln26_2_reg_6837[6]_i_2_n_4 ;
  wire \add_ln26_2_reg_6837[6]_i_3_n_4 ;
  wire \add_ln26_2_reg_6837_reg[3]_i_1_n_4 ;
  wire \add_ln26_2_reg_6837_reg[3]_i_1_n_5 ;
  wire \add_ln26_2_reg_6837_reg[3]_i_1_n_6 ;
  wire \add_ln26_2_reg_6837_reg[3]_i_1_n_7 ;
  wire \add_ln26_2_reg_6837_reg[6]_i_1_n_7 ;
  wire [6:0]add_ln26_fu_4662_p2;
  wire [6:0]add_ln26_reg_6796;
  wire \add_ln26_reg_6796[3]_i_2_n_4 ;
  wire \add_ln26_reg_6796[3]_i_3_n_4 ;
  wire \add_ln26_reg_6796[3]_i_4_n_4 ;
  wire \add_ln26_reg_6796[3]_i_5_n_4 ;
  wire \add_ln26_reg_6796[6]_i_2_n_4 ;
  wire \add_ln26_reg_6796[6]_i_3_n_4 ;
  wire \add_ln26_reg_6796_reg[3]_i_1_n_4 ;
  wire \add_ln26_reg_6796_reg[3]_i_1_n_5 ;
  wire \add_ln26_reg_6796_reg[3]_i_1_n_6 ;
  wire \add_ln26_reg_6796_reg[3]_i_1_n_7 ;
  wire \add_ln26_reg_6796_reg[6]_i_1_n_7 ;
  wire [7:0]add_ln36_1_fu_4762_p2;
  wire [7:0]add_ln36_1_reg_6858;
  wire \add_ln36_1_reg_6858[3]_i_2_n_4 ;
  wire \add_ln36_1_reg_6858[3]_i_3_n_4 ;
  wire \add_ln36_1_reg_6858[3]_i_4_n_4 ;
  wire \add_ln36_1_reg_6858[3]_i_5_n_4 ;
  wire \add_ln36_1_reg_6858[7]_i_2_n_4 ;
  wire \add_ln36_1_reg_6858[7]_i_3_n_4 ;
  wire \add_ln36_1_reg_6858[7]_i_4_n_4 ;
  wire \add_ln36_1_reg_6858_reg[3]_i_1_n_4 ;
  wire \add_ln36_1_reg_6858_reg[3]_i_1_n_5 ;
  wire \add_ln36_1_reg_6858_reg[3]_i_1_n_6 ;
  wire \add_ln36_1_reg_6858_reg[3]_i_1_n_7 ;
  wire \add_ln36_1_reg_6858_reg[7]_i_1_n_6 ;
  wire \add_ln36_1_reg_6858_reg[7]_i_1_n_7 ;
  wire [7:0]add_ln36_fu_4756_p2;
  wire [7:0]add_ln36_reg_6853;
  wire \add_ln36_reg_6853[3]_i_2_n_4 ;
  wire \add_ln36_reg_6853[3]_i_3_n_4 ;
  wire \add_ln36_reg_6853[3]_i_4_n_4 ;
  wire \add_ln36_reg_6853[3]_i_5_n_4 ;
  wire \add_ln36_reg_6853[7]_i_2_n_4 ;
  wire \add_ln36_reg_6853[7]_i_3_n_4 ;
  wire \add_ln36_reg_6853[7]_i_4_n_4 ;
  wire \add_ln36_reg_6853_reg[3]_i_1_n_4 ;
  wire \add_ln36_reg_6853_reg[3]_i_1_n_5 ;
  wire \add_ln36_reg_6853_reg[3]_i_1_n_6 ;
  wire \add_ln36_reg_6853_reg[3]_i_1_n_7 ;
  wire \add_ln36_reg_6853_reg[7]_i_1_n_6 ;
  wire \add_ln36_reg_6853_reg[7]_i_1_n_7 ;
  wire [57:0]and_ln21_2_cast_fu_2469_p31;
  wire [57:0]and_ln21_3_cast_fu_2572_p31;
  wire [57:0]and_ln21_4_cast_fu_3704_p31;
  wire [57:0]and_ln21_5_cast_fu_3807_p31;
  wire [57:0]and_ln21_6_cast_fu_3932_p31;
  wire [57:0]and_ln21_7_cast_fu_4035_p31;
  wire \ap_CS_fsm[1]_i_2_n_4 ;
  wire ap_CS_fsm_pp0_stage0;
  wire ap_CS_fsm_pp0_stage2;
  wire ap_CS_fsm_pp0_stage3;
  wire [8:0]\ap_CS_fsm_reg[1]_0 ;
  wire [8:0]\ap_CS_fsm_reg[1]_1 ;
  wire \ap_CS_fsm_reg[3]_0 ;
  wire [2:0]ap_NS_fsm;
  wire ap_NS_fsm1;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_i_1_n_4;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter2_i_1_n_4;
  wire ap_enable_reg_pp0_iter3;
  wire ap_enable_reg_pp0_iter3_i_1_n_4;
  wire ap_loop_exit_ready_pp0_iter1_reg;
  wire ap_loop_exit_ready_pp0_iter1_reg_i_1__0_n_4;
  wire ap_loop_exit_ready_pp0_iter2_reg;
  wire ap_loop_exit_ready_pp0_iter2_reg_i_1_n_4;
  wire ap_ready_int;
  wire ap_rst;
  wire [63:0]diff_2_fu_1925_p2;
  wire [62:0]diff_2_reg_5797;
  wire [63:0]diff_fu_816_p2;
  wire [62:0]diff_reg_5092;
  wire [6:0]dist_fu_4658_p2;
  wire [6:0]dist_reg_6791;
  wire \dist_reg_6791[3]_i_2_n_4 ;
  wire \dist_reg_6791[3]_i_3_n_4 ;
  wire \dist_reg_6791[3]_i_4_n_4 ;
  wire \dist_reg_6791[3]_i_5_n_4 ;
  wire \dist_reg_6791[6]_i_2_n_4 ;
  wire \dist_reg_6791[6]_i_3_n_4 ;
  wire \dist_reg_6791_reg[3]_i_1_n_4 ;
  wire \dist_reg_6791_reg[3]_i_1_n_5 ;
  wire \dist_reg_6791_reg[3]_i_1_n_6 ;
  wire \dist_reg_6791_reg[3]_i_1_n_7 ;
  wire \dist_reg_6791_reg[6]_i_1_n_7 ;
  wire [2:0]\dists_0_0_fu_62_reg[8] ;
  wire [8:0]\dists_0_0_fu_62_reg[8]_0 ;
  wire [8:0]\dists_0_0_fu_62_reg[8]_1 ;
  wire [8:0]\dists_0_1_fu_58_reg[8] ;
  wire [8:0]dists_0_3_out_load_reg_6821;
  wire [8:0]dists_0_fu_4795_p2;
  wire [8:0]dists_0_reg_6881;
  wire \dists_0_reg_6881[3]_i_2_n_4 ;
  wire \dists_0_reg_6881[3]_i_3_n_4 ;
  wire \dists_0_reg_6881[3]_i_4_n_4 ;
  wire \dists_0_reg_6881[3]_i_5_n_4 ;
  wire \dists_0_reg_6881[7]_i_2_n_4 ;
  wire \dists_0_reg_6881[7]_i_3_n_4 ;
  wire \dists_0_reg_6881[7]_i_4_n_4 ;
  wire \dists_0_reg_6881[7]_i_5_n_4 ;
  wire \dists_0_reg_6881_reg[3]_i_1_n_4 ;
  wire \dists_0_reg_6881_reg[3]_i_1_n_5 ;
  wire \dists_0_reg_6881_reg[3]_i_1_n_6 ;
  wire \dists_0_reg_6881_reg[3]_i_1_n_7 ;
  wire \dists_0_reg_6881_reg[7]_i_1_n_4 ;
  wire \dists_0_reg_6881_reg[7]_i_1_n_5 ;
  wire \dists_0_reg_6881_reg[7]_i_1_n_6 ;
  wire \dists_0_reg_6881_reg[7]_i_1_n_7 ;
  wire [8:0]\dists_1_0_fu_66_reg[8] ;
  wire [8:0]dists_1_3_out_load_reg_6847;
  wire [8:0]\dists_1_3_out_load_reg_6847_reg[8]_0 ;
  wire [8:0]\dists_2_0_fu_70_reg[8] ;
  wire [8:0]dists_2_3_out_load_reg_6874;
  wire [8:0]\dists_2_3_out_load_reg_6874_reg[8]_0 ;
  wire [8:0]dists_2_4_fu_4878_p3;
  wire \dists_2_4_reg_6919_reg_n_4_[0] ;
  wire \dists_2_4_reg_6919_reg_n_4_[1] ;
  wire \dists_2_4_reg_6919_reg_n_4_[2] ;
  wire \dists_2_4_reg_6919_reg_n_4_[3] ;
  wire \dists_2_4_reg_6919_reg_n_4_[4] ;
  wire \dists_2_4_reg_6919_reg_n_4_[5] ;
  wire \dists_2_4_reg_6919_reg_n_4_[6] ;
  wire \dists_2_4_reg_6919_reg_n_4_[7] ;
  wire \dists_2_4_reg_6919_reg_n_4_[8] ;
  wire [8:0]dists_2_5_fu_4885_p3;
  wire \dists_2_5_reg_6924_reg_n_4_[0] ;
  wire \dists_2_5_reg_6924_reg_n_4_[1] ;
  wire \dists_2_5_reg_6924_reg_n_4_[2] ;
  wire \dists_2_5_reg_6924_reg_n_4_[3] ;
  wire \dists_2_5_reg_6924_reg_n_4_[4] ;
  wire \dists_2_5_reg_6924_reg_n_4_[5] ;
  wire \dists_2_5_reg_6924_reg_n_4_[6] ;
  wire \dists_2_5_reg_6924_reg_n_4_[7] ;
  wire \dists_2_5_reg_6924_reg_n_4_[8] ;
  wire [8:0]dists_2_6_fu_4892_p3;
  wire [8:0]dists_2_6_reg_6929;
  wire flow_control_loop_pipe_sequential_init_U_n_10;
  wire flow_control_loop_pipe_sequential_init_U_n_11;
  wire flow_control_loop_pipe_sequential_init_U_n_43;
  wire flow_control_loop_pipe_sequential_init_U_n_44;
  wire flow_control_loop_pipe_sequential_init_U_n_45;
  wire flow_control_loop_pipe_sequential_init_U_n_46;
  wire flow_control_loop_pipe_sequential_init_U_n_47;
  wire flow_control_loop_pipe_sequential_init_U_n_48;
  wire flow_control_loop_pipe_sequential_init_U_n_49;
  wire flow_control_loop_pipe_sequential_init_U_n_50;
  wire flow_control_loop_pipe_sequential_init_U_n_51;
  wire flow_control_loop_pipe_sequential_init_U_n_52;
  wire flow_control_loop_pipe_sequential_init_U_n_53;
  wire flow_control_loop_pipe_sequential_init_U_n_54;
  wire flow_control_loop_pipe_sequential_init_U_n_65;
  wire flow_control_loop_pipe_sequential_init_U_n_7;
  wire flow_control_loop_pipe_sequential_init_U_n_9;
  wire grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg;
  wire [63:0]grp_fu_427_p2;
  wire [11:0]i_1_fu_242;
  wire i_1_fu_2420;
  wire i_1_fu_24204_out;
  wire \icmp_ln107_reg_5042[0]_i_2_n_4 ;
  wire \icmp_ln107_reg_5042[0]_i_3_n_4 ;
  wire \icmp_ln107_reg_5042[0]_i_4_n_4 ;
  wire icmp_ln107_reg_5042_pp0_iter1_reg;
  wire icmp_ln107_reg_5042_pp0_iter2_reg;
  wire \icmp_ln107_reg_5042_reg_n_4_[0] ;
  wire icmp_ln45_1_fu_4771_p2_carry__0_i_1_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry__0_i_2_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry__0_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry__0_n_5;
  wire icmp_ln45_1_fu_4771_p2_carry__0_n_6;
  wire icmp_ln45_1_fu_4771_p2_carry__0_n_7;
  wire icmp_ln45_1_fu_4771_p2_carry__1_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry__1_n_5;
  wire icmp_ln45_1_fu_4771_p2_carry__1_n_6;
  wire icmp_ln45_1_fu_4771_p2_carry__1_n_7;
  wire icmp_ln45_1_fu_4771_p2_carry__2_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry__2_n_5;
  wire icmp_ln45_1_fu_4771_p2_carry__2_n_6;
  wire icmp_ln45_1_fu_4771_p2_carry__2_n_7;
  wire icmp_ln45_1_fu_4771_p2_carry_i_1_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_2_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_3_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_4_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_5_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_6_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_7_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_i_8_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_n_4;
  wire icmp_ln45_1_fu_4771_p2_carry_n_5;
  wire icmp_ln45_1_fu_4771_p2_carry_n_6;
  wire icmp_ln45_1_fu_4771_p2_carry_n_7;
  wire icmp_ln45_1_reg_6863;
  wire icmp_ln45_2_fu_4801_p2;
  wire icmp_ln45_2_fu_4801_p2_carry__0_i_1_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry__0_i_2_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry__0_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry__0_n_5;
  wire icmp_ln45_2_fu_4801_p2_carry__0_n_6;
  wire icmp_ln45_2_fu_4801_p2_carry__0_n_7;
  wire icmp_ln45_2_fu_4801_p2_carry__1_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry__1_n_5;
  wire icmp_ln45_2_fu_4801_p2_carry__1_n_6;
  wire icmp_ln45_2_fu_4801_p2_carry__1_n_7;
  wire icmp_ln45_2_fu_4801_p2_carry__2_n_5;
  wire icmp_ln45_2_fu_4801_p2_carry__2_n_6;
  wire icmp_ln45_2_fu_4801_p2_carry__2_n_7;
  wire icmp_ln45_2_fu_4801_p2_carry_i_1_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_2_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_3_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_4_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_5_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_6_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_7_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_i_8_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_n_4;
  wire icmp_ln45_2_fu_4801_p2_carry_n_5;
  wire icmp_ln45_2_fu_4801_p2_carry_n_6;
  wire icmp_ln45_2_fu_4801_p2_carry_n_7;
  wire icmp_ln45_fu_4726_p2_carry__0_i_1_n_4;
  wire icmp_ln45_fu_4726_p2_carry__0_i_2_n_4;
  wire icmp_ln45_fu_4726_p2_carry__0_n_4;
  wire icmp_ln45_fu_4726_p2_carry__0_n_5;
  wire icmp_ln45_fu_4726_p2_carry__0_n_6;
  wire icmp_ln45_fu_4726_p2_carry__0_n_7;
  wire icmp_ln45_fu_4726_p2_carry__1_n_4;
  wire icmp_ln45_fu_4726_p2_carry__1_n_5;
  wire icmp_ln45_fu_4726_p2_carry__1_n_6;
  wire icmp_ln45_fu_4726_p2_carry__1_n_7;
  wire icmp_ln45_fu_4726_p2_carry__2_n_4;
  wire icmp_ln45_fu_4726_p2_carry__2_n_5;
  wire icmp_ln45_fu_4726_p2_carry__2_n_6;
  wire icmp_ln45_fu_4726_p2_carry__2_n_7;
  wire icmp_ln45_fu_4726_p2_carry_i_1_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_2_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_3_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_4_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_5_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_6_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_7_n_4;
  wire icmp_ln45_fu_4726_p2_carry_i_8_n_4;
  wire icmp_ln45_fu_4726_p2_carry_n_4;
  wire icmp_ln45_fu_4726_p2_carry_n_5;
  wire icmp_ln45_fu_4726_p2_carry_n_6;
  wire icmp_ln45_fu_4726_p2_carry_n_7;
  wire icmp_ln53_fu_4835_p2_carry__0_i_1_n_4;
  wire icmp_ln53_fu_4835_p2_carry__0_i_2_n_4;
  wire icmp_ln53_fu_4835_p2_carry__0_n_4;
  wire icmp_ln53_fu_4835_p2_carry__0_n_5;
  wire icmp_ln53_fu_4835_p2_carry__0_n_6;
  wire icmp_ln53_fu_4835_p2_carry__0_n_7;
  wire icmp_ln53_fu_4835_p2_carry__1_n_4;
  wire icmp_ln53_fu_4835_p2_carry__1_n_5;
  wire icmp_ln53_fu_4835_p2_carry__1_n_6;
  wire icmp_ln53_fu_4835_p2_carry__1_n_7;
  wire icmp_ln53_fu_4835_p2_carry__2_n_5;
  wire icmp_ln53_fu_4835_p2_carry__2_n_6;
  wire icmp_ln53_fu_4835_p2_carry__2_n_7;
  wire icmp_ln53_fu_4835_p2_carry_i_10_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_11_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_12_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_13_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_14_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_15_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_16_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_1_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_2_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_3_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_4_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_5_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_6_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_7_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_8_n_4;
  wire icmp_ln53_fu_4835_p2_carry_i_9_n_4;
  wire icmp_ln53_fu_4835_p2_carry_n_4;
  wire icmp_ln53_fu_4835_p2_carry_n_5;
  wire icmp_ln53_fu_4835_p2_carry_n_6;
  wire icmp_ln53_fu_4835_p2_carry_n_7;
  wire icmp_ln53_reg_6897;
  wire icmp_ln55_1_reg_6909;
  wire \icmp_ln55_1_reg_6909[0]_i_1_n_4 ;
  wire icmp_ln55_reg_6904;
  wire [3:0]\labels_0_3_fu_246_reg[3]_0 ;
  wire [3:0]\labels_0_3_fu_246_reg[3]_1 ;
  wire [3:0]\labels_1_3_fu_250_reg[3]_0 ;
  wire [3:0]\labels_1_3_fu_250_reg[3]_1 ;
  wire [3:0]labels_1_reg_6827;
  wire [3:0]\labels_2_3_fu_254_reg[3]_0 ;
  wire [3:0]\labels_2_3_fu_254_reg[3]_1 ;
  wire [8:0]max_dist_1_fu_4777_p3;
  wire [8:0]max_dist_1_reg_6868;
  wire [8:0]max_dist_reg_6842;
  wire \max_dist_reg_6842[8]_i_1_n_4 ;
  wire or_ln55_reg_6914;
  wire [1:0]p_0_in;
  wire p_0_in1_in;
  wire p_0_in2_out;
  wire p_1_in;
  wire [62:0]p_1_out;
  wire [63:0]reg_414;
  wire reg_4140;
  wire reg_4141;
  wire reg_41413_out;
  wire \reg_418[0]_i_1_n_4 ;
  wire \reg_418[10]_i_1_n_4 ;
  wire \reg_418[11]_i_1_n_4 ;
  wire \reg_418[12]_i_1_n_4 ;
  wire \reg_418[13]_i_1_n_4 ;
  wire \reg_418[14]_i_1_n_4 ;
  wire \reg_418[15]_i_1_n_4 ;
  wire \reg_418[16]_i_1_n_4 ;
  wire \reg_418[17]_i_1_n_4 ;
  wire \reg_418[18]_i_1_n_4 ;
  wire \reg_418[19]_i_1_n_4 ;
  wire \reg_418[1]_i_1_n_4 ;
  wire \reg_418[20]_i_1_n_4 ;
  wire \reg_418[21]_i_1_n_4 ;
  wire \reg_418[22]_i_1_n_4 ;
  wire \reg_418[23]_i_1_n_4 ;
  wire \reg_418[24]_i_1_n_4 ;
  wire \reg_418[25]_i_1_n_4 ;
  wire \reg_418[26]_i_1_n_4 ;
  wire \reg_418[27]_i_1_n_4 ;
  wire \reg_418[28]_i_1_n_4 ;
  wire \reg_418[29]_i_1_n_4 ;
  wire \reg_418[2]_i_1_n_4 ;
  wire \reg_418[30]_i_1_n_4 ;
  wire \reg_418[31]_i_1_n_4 ;
  wire \reg_418[32]_i_1_n_4 ;
  wire \reg_418[33]_i_1_n_4 ;
  wire \reg_418[34]_i_1_n_4 ;
  wire \reg_418[35]_i_1_n_4 ;
  wire \reg_418[36]_i_1_n_4 ;
  wire \reg_418[37]_i_1_n_4 ;
  wire \reg_418[38]_i_1_n_4 ;
  wire \reg_418[39]_i_1_n_4 ;
  wire \reg_418[3]_i_1_n_4 ;
  wire \reg_418[40]_i_1_n_4 ;
  wire \reg_418[41]_i_1_n_4 ;
  wire \reg_418[42]_i_1_n_4 ;
  wire \reg_418[43]_i_1_n_4 ;
  wire \reg_418[44]_i_1_n_4 ;
  wire \reg_418[45]_i_1_n_4 ;
  wire \reg_418[46]_i_1_n_4 ;
  wire \reg_418[47]_i_1_n_4 ;
  wire \reg_418[48]_i_1_n_4 ;
  wire \reg_418[49]_i_1_n_4 ;
  wire \reg_418[4]_i_1_n_4 ;
  wire \reg_418[50]_i_1_n_4 ;
  wire \reg_418[51]_i_1_n_4 ;
  wire \reg_418[52]_i_1_n_4 ;
  wire \reg_418[53]_i_1_n_4 ;
  wire \reg_418[54]_i_1_n_4 ;
  wire \reg_418[55]_i_1_n_4 ;
  wire \reg_418[56]_i_1_n_4 ;
  wire \reg_418[57]_i_1_n_4 ;
  wire \reg_418[58]_i_1_n_4 ;
  wire \reg_418[59]_i_1_n_4 ;
  wire \reg_418[5]_i_1_n_4 ;
  wire \reg_418[60]_i_1_n_4 ;
  wire \reg_418[61]_i_1_n_4 ;
  wire \reg_418[62]_i_1_n_4 ;
  wire \reg_418[63]_i_1_n_4 ;
  wire \reg_418[6]_i_1_n_4 ;
  wire \reg_418[7]_i_1_n_4 ;
  wire \reg_418[8]_i_1_n_4 ;
  wire \reg_418[9]_i_1_n_4 ;
  wire \reg_418_reg_n_4_[0] ;
  wire \reg_418_reg_n_4_[10] ;
  wire \reg_418_reg_n_4_[11] ;
  wire \reg_418_reg_n_4_[12] ;
  wire \reg_418_reg_n_4_[13] ;
  wire \reg_418_reg_n_4_[14] ;
  wire \reg_418_reg_n_4_[15] ;
  wire \reg_418_reg_n_4_[16] ;
  wire \reg_418_reg_n_4_[17] ;
  wire \reg_418_reg_n_4_[18] ;
  wire \reg_418_reg_n_4_[19] ;
  wire \reg_418_reg_n_4_[1] ;
  wire \reg_418_reg_n_4_[20] ;
  wire \reg_418_reg_n_4_[21] ;
  wire \reg_418_reg_n_4_[22] ;
  wire \reg_418_reg_n_4_[23] ;
  wire \reg_418_reg_n_4_[24] ;
  wire \reg_418_reg_n_4_[25] ;
  wire \reg_418_reg_n_4_[26] ;
  wire \reg_418_reg_n_4_[27] ;
  wire \reg_418_reg_n_4_[28] ;
  wire \reg_418_reg_n_4_[29] ;
  wire \reg_418_reg_n_4_[2] ;
  wire \reg_418_reg_n_4_[30] ;
  wire \reg_418_reg_n_4_[31] ;
  wire \reg_418_reg_n_4_[32] ;
  wire \reg_418_reg_n_4_[33] ;
  wire \reg_418_reg_n_4_[34] ;
  wire \reg_418_reg_n_4_[35] ;
  wire \reg_418_reg_n_4_[36] ;
  wire \reg_418_reg_n_4_[37] ;
  wire \reg_418_reg_n_4_[38] ;
  wire \reg_418_reg_n_4_[39] ;
  wire \reg_418_reg_n_4_[3] ;
  wire \reg_418_reg_n_4_[40] ;
  wire \reg_418_reg_n_4_[41] ;
  wire \reg_418_reg_n_4_[42] ;
  wire \reg_418_reg_n_4_[43] ;
  wire \reg_418_reg_n_4_[44] ;
  wire \reg_418_reg_n_4_[45] ;
  wire \reg_418_reg_n_4_[46] ;
  wire \reg_418_reg_n_4_[47] ;
  wire \reg_418_reg_n_4_[48] ;
  wire \reg_418_reg_n_4_[49] ;
  wire \reg_418_reg_n_4_[4] ;
  wire \reg_418_reg_n_4_[50] ;
  wire \reg_418_reg_n_4_[51] ;
  wire \reg_418_reg_n_4_[52] ;
  wire \reg_418_reg_n_4_[53] ;
  wire \reg_418_reg_n_4_[54] ;
  wire \reg_418_reg_n_4_[55] ;
  wire \reg_418_reg_n_4_[56] ;
  wire \reg_418_reg_n_4_[57] ;
  wire \reg_418_reg_n_4_[58] ;
  wire \reg_418_reg_n_4_[59] ;
  wire \reg_418_reg_n_4_[5] ;
  wire \reg_418_reg_n_4_[60] ;
  wire \reg_418_reg_n_4_[61] ;
  wire \reg_418_reg_n_4_[62] ;
  wire \reg_418_reg_n_4_[63] ;
  wire \reg_418_reg_n_4_[6] ;
  wire \reg_418_reg_n_4_[7] ;
  wire \reg_418_reg_n_4_[8] ;
  wire \reg_418_reg_n_4_[9] ;
  wire [63:0]reg_423;
  wire [63:0]reg_689;
  wire reg_6890;
  wire [0:0]select_ln45_2_fu_4819_p3;
  wire [1:0]select_ln45_2_reg_6891;
  wire \shl_ln_reg_5046_reg_n_4_[10] ;
  wire \shl_ln_reg_5046_reg_n_4_[11] ;
  wire \shl_ln_reg_5046_reg_n_4_[12] ;
  wire \shl_ln_reg_5046_reg_n_4_[13] ;
  wire \shl_ln_reg_5046_reg_n_4_[2] ;
  wire \shl_ln_reg_5046_reg_n_4_[3] ;
  wire \shl_ln_reg_5046_reg_n_4_[4] ;
  wire \shl_ln_reg_5046_reg_n_4_[5] ;
  wire \shl_ln_reg_5046_reg_n_4_[6] ;
  wire \shl_ln_reg_5046_reg_n_4_[7] ;
  wire \shl_ln_reg_5046_reg_n_4_[8] ;
  wire \shl_ln_reg_5046_reg_n_4_[9] ;
  wire sub_ln20_fu_1184_p2_carry__0_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__0_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__0_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__0_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__0_n_10;
  wire sub_ln20_fu_1184_p2_carry__0_n_11;
  wire sub_ln20_fu_1184_p2_carry__0_n_4;
  wire sub_ln20_fu_1184_p2_carry__0_n_5;
  wire sub_ln20_fu_1184_p2_carry__0_n_6;
  wire sub_ln20_fu_1184_p2_carry__0_n_7;
  wire sub_ln20_fu_1184_p2_carry__0_n_8;
  wire sub_ln20_fu_1184_p2_carry__0_n_9;
  wire sub_ln20_fu_1184_p2_carry__10_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__10_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__10_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__10_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__10_n_10;
  wire sub_ln20_fu_1184_p2_carry__10_n_11;
  wire sub_ln20_fu_1184_p2_carry__10_n_4;
  wire sub_ln20_fu_1184_p2_carry__10_n_5;
  wire sub_ln20_fu_1184_p2_carry__10_n_6;
  wire sub_ln20_fu_1184_p2_carry__10_n_7;
  wire sub_ln20_fu_1184_p2_carry__10_n_8;
  wire sub_ln20_fu_1184_p2_carry__10_n_9;
  wire sub_ln20_fu_1184_p2_carry__11_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__11_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__11_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__11_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__11_n_10;
  wire sub_ln20_fu_1184_p2_carry__11_n_11;
  wire sub_ln20_fu_1184_p2_carry__11_n_4;
  wire sub_ln20_fu_1184_p2_carry__11_n_5;
  wire sub_ln20_fu_1184_p2_carry__11_n_6;
  wire sub_ln20_fu_1184_p2_carry__11_n_7;
  wire sub_ln20_fu_1184_p2_carry__11_n_8;
  wire sub_ln20_fu_1184_p2_carry__11_n_9;
  wire sub_ln20_fu_1184_p2_carry__12_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__12_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__12_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__12_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__12_n_10;
  wire sub_ln20_fu_1184_p2_carry__12_n_11;
  wire sub_ln20_fu_1184_p2_carry__12_n_4;
  wire sub_ln20_fu_1184_p2_carry__12_n_5;
  wire sub_ln20_fu_1184_p2_carry__12_n_6;
  wire sub_ln20_fu_1184_p2_carry__12_n_7;
  wire sub_ln20_fu_1184_p2_carry__12_n_8;
  wire sub_ln20_fu_1184_p2_carry__12_n_9;
  wire sub_ln20_fu_1184_p2_carry__13_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__13_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__13_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__13_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__13_n_10;
  wire sub_ln20_fu_1184_p2_carry__13_n_11;
  wire sub_ln20_fu_1184_p2_carry__13_n_4;
  wire sub_ln20_fu_1184_p2_carry__13_n_5;
  wire sub_ln20_fu_1184_p2_carry__13_n_6;
  wire sub_ln20_fu_1184_p2_carry__13_n_7;
  wire sub_ln20_fu_1184_p2_carry__13_n_8;
  wire sub_ln20_fu_1184_p2_carry__13_n_9;
  wire sub_ln20_fu_1184_p2_carry__14_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__14_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__14_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__14_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__14_n_10;
  wire sub_ln20_fu_1184_p2_carry__14_n_11;
  wire sub_ln20_fu_1184_p2_carry__14_n_5;
  wire sub_ln20_fu_1184_p2_carry__14_n_6;
  wire sub_ln20_fu_1184_p2_carry__14_n_7;
  wire sub_ln20_fu_1184_p2_carry__14_n_8;
  wire sub_ln20_fu_1184_p2_carry__14_n_9;
  wire sub_ln20_fu_1184_p2_carry__1_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__1_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__1_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__1_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__1_n_10;
  wire sub_ln20_fu_1184_p2_carry__1_n_11;
  wire sub_ln20_fu_1184_p2_carry__1_n_4;
  wire sub_ln20_fu_1184_p2_carry__1_n_5;
  wire sub_ln20_fu_1184_p2_carry__1_n_6;
  wire sub_ln20_fu_1184_p2_carry__1_n_7;
  wire sub_ln20_fu_1184_p2_carry__1_n_8;
  wire sub_ln20_fu_1184_p2_carry__1_n_9;
  wire sub_ln20_fu_1184_p2_carry__2_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__2_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__2_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__2_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__2_n_10;
  wire sub_ln20_fu_1184_p2_carry__2_n_11;
  wire sub_ln20_fu_1184_p2_carry__2_n_4;
  wire sub_ln20_fu_1184_p2_carry__2_n_5;
  wire sub_ln20_fu_1184_p2_carry__2_n_6;
  wire sub_ln20_fu_1184_p2_carry__2_n_7;
  wire sub_ln20_fu_1184_p2_carry__2_n_8;
  wire sub_ln20_fu_1184_p2_carry__2_n_9;
  wire sub_ln20_fu_1184_p2_carry__3_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__3_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__3_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__3_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__3_n_10;
  wire sub_ln20_fu_1184_p2_carry__3_n_11;
  wire sub_ln20_fu_1184_p2_carry__3_n_4;
  wire sub_ln20_fu_1184_p2_carry__3_n_5;
  wire sub_ln20_fu_1184_p2_carry__3_n_6;
  wire sub_ln20_fu_1184_p2_carry__3_n_7;
  wire sub_ln20_fu_1184_p2_carry__3_n_8;
  wire sub_ln20_fu_1184_p2_carry__3_n_9;
  wire sub_ln20_fu_1184_p2_carry__4_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__4_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__4_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__4_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__4_n_10;
  wire sub_ln20_fu_1184_p2_carry__4_n_11;
  wire sub_ln20_fu_1184_p2_carry__4_n_4;
  wire sub_ln20_fu_1184_p2_carry__4_n_5;
  wire sub_ln20_fu_1184_p2_carry__4_n_6;
  wire sub_ln20_fu_1184_p2_carry__4_n_7;
  wire sub_ln20_fu_1184_p2_carry__4_n_8;
  wire sub_ln20_fu_1184_p2_carry__4_n_9;
  wire sub_ln20_fu_1184_p2_carry__5_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__5_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__5_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__5_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__5_n_10;
  wire sub_ln20_fu_1184_p2_carry__5_n_11;
  wire sub_ln20_fu_1184_p2_carry__5_n_4;
  wire sub_ln20_fu_1184_p2_carry__5_n_5;
  wire sub_ln20_fu_1184_p2_carry__5_n_6;
  wire sub_ln20_fu_1184_p2_carry__5_n_7;
  wire sub_ln20_fu_1184_p2_carry__5_n_8;
  wire sub_ln20_fu_1184_p2_carry__5_n_9;
  wire sub_ln20_fu_1184_p2_carry__6_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__6_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__6_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__6_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__6_n_10;
  wire sub_ln20_fu_1184_p2_carry__6_n_11;
  wire sub_ln20_fu_1184_p2_carry__6_n_4;
  wire sub_ln20_fu_1184_p2_carry__6_n_5;
  wire sub_ln20_fu_1184_p2_carry__6_n_6;
  wire sub_ln20_fu_1184_p2_carry__6_n_7;
  wire sub_ln20_fu_1184_p2_carry__6_n_8;
  wire sub_ln20_fu_1184_p2_carry__6_n_9;
  wire sub_ln20_fu_1184_p2_carry__7_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__7_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__7_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__7_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__7_n_10;
  wire sub_ln20_fu_1184_p2_carry__7_n_11;
  wire sub_ln20_fu_1184_p2_carry__7_n_4;
  wire sub_ln20_fu_1184_p2_carry__7_n_5;
  wire sub_ln20_fu_1184_p2_carry__7_n_6;
  wire sub_ln20_fu_1184_p2_carry__7_n_7;
  wire sub_ln20_fu_1184_p2_carry__7_n_8;
  wire sub_ln20_fu_1184_p2_carry__7_n_9;
  wire sub_ln20_fu_1184_p2_carry__8_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__8_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__8_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__8_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__8_n_10;
  wire sub_ln20_fu_1184_p2_carry__8_n_11;
  wire sub_ln20_fu_1184_p2_carry__8_n_4;
  wire sub_ln20_fu_1184_p2_carry__8_n_5;
  wire sub_ln20_fu_1184_p2_carry__8_n_6;
  wire sub_ln20_fu_1184_p2_carry__8_n_7;
  wire sub_ln20_fu_1184_p2_carry__8_n_8;
  wire sub_ln20_fu_1184_p2_carry__8_n_9;
  wire sub_ln20_fu_1184_p2_carry__9_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry__9_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry__9_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry__9_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry__9_n_10;
  wire sub_ln20_fu_1184_p2_carry__9_n_11;
  wire sub_ln20_fu_1184_p2_carry__9_n_4;
  wire sub_ln20_fu_1184_p2_carry__9_n_5;
  wire sub_ln20_fu_1184_p2_carry__9_n_6;
  wire sub_ln20_fu_1184_p2_carry__9_n_7;
  wire sub_ln20_fu_1184_p2_carry__9_n_8;
  wire sub_ln20_fu_1184_p2_carry__9_n_9;
  wire sub_ln20_fu_1184_p2_carry_i_1_n_4;
  wire sub_ln20_fu_1184_p2_carry_i_2_n_4;
  wire sub_ln20_fu_1184_p2_carry_i_3_n_4;
  wire sub_ln20_fu_1184_p2_carry_i_4_n_4;
  wire sub_ln20_fu_1184_p2_carry_n_10;
  wire sub_ln20_fu_1184_p2_carry_n_11;
  wire sub_ln20_fu_1184_p2_carry_n_4;
  wire sub_ln20_fu_1184_p2_carry_n_5;
  wire sub_ln20_fu_1184_p2_carry_n_6;
  wire sub_ln20_fu_1184_p2_carry_n_7;
  wire sub_ln20_fu_1184_p2_carry_n_8;
  wire sub_ln20_fu_1184_p2_carry_n_9;
  wire [0:0]test_set_address0;
  wire test_set_ce0;
  wire test_set_ce1;
  wire [63:0]test_set_load_2_reg_5072;
  wire [63:0]test_set_q0;
  wire [63:0]test_set_q1;
  wire tmp_100_reg_5397;
  wire tmp_101_reg_5402;
  wire tmp_102_reg_5407;
  wire tmp_103_reg_5412;
  wire [1:0]tmp_104_reg_5607;
  wire \tmp_104_reg_5607[1]_i_2_n_4 ;
  wire \tmp_104_reg_5607[1]_i_3_n_4 ;
  wire \tmp_104_reg_5607[1]_i_4_n_4 ;
  wire \tmp_104_reg_5607[1]_i_5_n_4 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_10 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_11 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_5 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_6 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_7 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_8 ;
  wire \tmp_104_reg_5607_reg[1]_i_1_n_9 ;
  wire \tmp_105_reg_5612[1]_i_2_n_4 ;
  wire \tmp_105_reg_5612[1]_i_3_n_4 ;
  wire \tmp_105_reg_5612[1]_i_4_n_4 ;
  wire \tmp_105_reg_5612[1]_i_5_n_4 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_10 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_11 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_4 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_5 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_6 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_7 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_8 ;
  wire \tmp_105_reg_5612_reg[1]_i_1_n_9 ;
  wire \tmp_106_reg_5618[1]_i_2_n_4 ;
  wire \tmp_106_reg_5618[1]_i_3_n_4 ;
  wire \tmp_106_reg_5618[1]_i_4_n_4 ;
  wire \tmp_106_reg_5618[1]_i_5_n_4 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_10 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_11 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_4 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_5 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_6 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_7 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_8 ;
  wire \tmp_106_reg_5618_reg[1]_i_1_n_9 ;
  wire \tmp_107_reg_5624[1]_i_2_n_4 ;
  wire \tmp_107_reg_5624[1]_i_3_n_4 ;
  wire \tmp_107_reg_5624[1]_i_4_n_4 ;
  wire \tmp_107_reg_5624[1]_i_5_n_4 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_10 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_11 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_4 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_5 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_6 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_7 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_8 ;
  wire \tmp_107_reg_5624_reg[1]_i_1_n_9 ;
  wire \tmp_108_reg_5630[1]_i_2_n_4 ;
  wire \tmp_108_reg_5630[1]_i_3_n_4 ;
  wire \tmp_108_reg_5630[1]_i_4_n_4 ;
  wire \tmp_108_reg_5630[1]_i_5_n_4 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_10 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_11 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_4 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_5 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_6 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_7 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_8 ;
  wire \tmp_108_reg_5630_reg[1]_i_1_n_9 ;
  wire \tmp_109_reg_5636[1]_i_2_n_4 ;
  wire \tmp_109_reg_5636[1]_i_3_n_4 ;
  wire \tmp_109_reg_5636[1]_i_4_n_4 ;
  wire \tmp_109_reg_5636[1]_i_5_n_4 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_10 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_11 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_4 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_5 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_6 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_7 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_8 ;
  wire \tmp_109_reg_5636_reg[1]_i_1_n_9 ;
  wire \tmp_110_reg_5642[1]_i_2_n_4 ;
  wire \tmp_110_reg_5642[1]_i_3_n_4 ;
  wire \tmp_110_reg_5642[1]_i_4_n_4 ;
  wire \tmp_110_reg_5642[1]_i_5_n_4 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_10 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_11 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_4 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_5 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_6 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_7 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_8 ;
  wire \tmp_110_reg_5642_reg[1]_i_1_n_9 ;
  wire \tmp_111_reg_5648[1]_i_2_n_4 ;
  wire \tmp_111_reg_5648[1]_i_3_n_4 ;
  wire \tmp_111_reg_5648[1]_i_4_n_4 ;
  wire \tmp_111_reg_5648[1]_i_5_n_4 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_10 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_11 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_4 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_5 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_6 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_7 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_8 ;
  wire \tmp_111_reg_5648_reg[1]_i_1_n_9 ;
  wire \tmp_112_reg_5654[1]_i_2_n_4 ;
  wire \tmp_112_reg_5654[1]_i_3_n_4 ;
  wire \tmp_112_reg_5654[1]_i_4_n_4 ;
  wire \tmp_112_reg_5654[1]_i_5_n_4 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_10 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_11 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_4 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_5 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_6 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_7 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_8 ;
  wire \tmp_112_reg_5654_reg[1]_i_1_n_9 ;
  wire \tmp_113_reg_5660[1]_i_2_n_4 ;
  wire \tmp_113_reg_5660[1]_i_3_n_4 ;
  wire \tmp_113_reg_5660[1]_i_4_n_4 ;
  wire \tmp_113_reg_5660[1]_i_5_n_4 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_10 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_11 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_4 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_5 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_6 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_7 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_8 ;
  wire \tmp_113_reg_5660_reg[1]_i_1_n_9 ;
  wire \tmp_114_reg_5666[1]_i_2_n_4 ;
  wire \tmp_114_reg_5666[1]_i_3_n_4 ;
  wire \tmp_114_reg_5666[1]_i_4_n_4 ;
  wire \tmp_114_reg_5666[1]_i_5_n_4 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_10 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_11 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_4 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_5 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_6 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_7 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_8 ;
  wire \tmp_114_reg_5666_reg[1]_i_1_n_9 ;
  wire \tmp_115_reg_5672[1]_i_2_n_4 ;
  wire \tmp_115_reg_5672[1]_i_3_n_4 ;
  wire \tmp_115_reg_5672[1]_i_4_n_4 ;
  wire \tmp_115_reg_5672[1]_i_5_n_4 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_10 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_11 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_4 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_5 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_6 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_7 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_8 ;
  wire \tmp_115_reg_5672_reg[1]_i_1_n_9 ;
  wire \tmp_116_reg_5678[1]_i_2_n_4 ;
  wire \tmp_116_reg_5678[1]_i_3_n_4 ;
  wire \tmp_116_reg_5678[1]_i_4_n_4 ;
  wire \tmp_116_reg_5678[1]_i_5_n_4 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_10 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_11 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_4 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_5 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_6 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_7 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_8 ;
  wire \tmp_116_reg_5678_reg[1]_i_1_n_9 ;
  wire \tmp_117_reg_5684[1]_i_2_n_4 ;
  wire \tmp_117_reg_5684[1]_i_3_n_4 ;
  wire \tmp_117_reg_5684[1]_i_4_n_4 ;
  wire \tmp_117_reg_5684[1]_i_5_n_4 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_10 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_11 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_4 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_5 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_6 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_7 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_8 ;
  wire \tmp_117_reg_5684_reg[1]_i_1_n_9 ;
  wire \tmp_118_reg_5690[1]_i_2_n_4 ;
  wire \tmp_118_reg_5690[1]_i_3_n_4 ;
  wire \tmp_118_reg_5690[1]_i_4_n_4 ;
  wire \tmp_118_reg_5690[1]_i_5_n_4 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_10 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_11 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_4 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_5 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_6 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_7 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_8 ;
  wire \tmp_118_reg_5690_reg[1]_i_1_n_9 ;
  wire [1:0]tmp_119_reg_5702;
  wire tmp_11_reg_5137;
  wire tmp_12_reg_5142;
  wire [58:0]tmp_135_reg_6137;
  wire \tmp_135_reg_6137[10]_i_2_n_4 ;
  wire \tmp_135_reg_6137[10]_i_3_n_4 ;
  wire \tmp_135_reg_6137[18]_i_2_n_4 ;
  wire \tmp_135_reg_6137[18]_i_3_n_4 ;
  wire \tmp_135_reg_6137[26]_i_2_n_4 ;
  wire \tmp_135_reg_6137[26]_i_3_n_4 ;
  wire \tmp_135_reg_6137[2]_i_2_n_4 ;
  wire \tmp_135_reg_6137[2]_i_3_n_4 ;
  wire \tmp_135_reg_6137[34]_i_2_n_4 ;
  wire \tmp_135_reg_6137[34]_i_3_n_4 ;
  wire \tmp_135_reg_6137[42]_i_2_n_4 ;
  wire \tmp_135_reg_6137[42]_i_3_n_4 ;
  wire \tmp_135_reg_6137[50]_i_2_n_4 ;
  wire \tmp_135_reg_6137[50]_i_3_n_4 ;
  wire \tmp_135_reg_6137[58]_i_2_n_4 ;
  wire \tmp_135_reg_6137[58]_i_3_n_4 ;
  wire \tmp_135_reg_6137_reg[10]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[18]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[26]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[2]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[34]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[42]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[50]_i_1_n_7 ;
  wire \tmp_135_reg_6137_reg[58]_i_1_n_7 ;
  wire [3:0]tmp_136_reg_6568;
  wire \tmp_136_reg_6568[3]_i_2_n_4 ;
  wire \tmp_136_reg_6568[3]_i_3_n_4 ;
  wire \tmp_136_reg_6568[3]_i_4_n_4 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_10 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_11 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_4 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_6 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_7 ;
  wire \tmp_136_reg_6568_reg[3]_i_1_n_9 ;
  wire \tmp_137_reg_6574[3]_i_2_n_4 ;
  wire \tmp_137_reg_6574[3]_i_3_n_4 ;
  wire \tmp_137_reg_6574[3]_i_4_n_4 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_10 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_11 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_4 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_6 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_7 ;
  wire \tmp_137_reg_6574_reg[3]_i_1_n_9 ;
  wire \tmp_138_reg_6580[3]_i_2_n_4 ;
  wire \tmp_138_reg_6580[3]_i_3_n_4 ;
  wire \tmp_138_reg_6580[3]_i_4_n_4 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_10 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_11 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_4 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_6 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_7 ;
  wire \tmp_138_reg_6580_reg[3]_i_1_n_9 ;
  wire \tmp_139_reg_6586[3]_i_2_n_4 ;
  wire \tmp_139_reg_6586[3]_i_3_n_4 ;
  wire \tmp_139_reg_6586[3]_i_4_n_4 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_10 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_11 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_4 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_6 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_7 ;
  wire \tmp_139_reg_6586_reg[3]_i_1_n_9 ;
  wire tmp_13_reg_5147;
  wire \tmp_140_reg_6592[3]_i_2_n_4 ;
  wire \tmp_140_reg_6592[3]_i_3_n_4 ;
  wire \tmp_140_reg_6592[3]_i_4_n_4 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_10 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_11 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_4 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_6 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_7 ;
  wire \tmp_140_reg_6592_reg[3]_i_1_n_9 ;
  wire \tmp_141_reg_6598[3]_i_2_n_4 ;
  wire \tmp_141_reg_6598[3]_i_3_n_4 ;
  wire \tmp_141_reg_6598[3]_i_4_n_4 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_10 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_11 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_4 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_6 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_7 ;
  wire \tmp_141_reg_6598_reg[3]_i_1_n_9 ;
  wire [3:0]tmp_142_reg_6609;
  wire \tmp_142_reg_6609[3]_i_2_n_4 ;
  wire \tmp_142_reg_6609[3]_i_3_n_4 ;
  wire \tmp_142_reg_6609[3]_i_4_n_4 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_10 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_11 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_4 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_6 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_7 ;
  wire \tmp_142_reg_6609_reg[3]_i_1_n_9 ;
  wire [36:0]tmp_143_reg_6649;
  wire \tmp_143_reg_6649[35]_i_2_n_4 ;
  wire \tmp_143_reg_6649[35]_i_3_n_4 ;
  wire \tmp_143_reg_6649[35]_i_4_n_4 ;
  wire \tmp_143_reg_6649[35]_i_5_n_4 ;
  wire \tmp_143_reg_6649[3]_i_2_n_4 ;
  wire \tmp_143_reg_6649[3]_i_3_n_4 ;
  wire \tmp_143_reg_6649[3]_i_4_n_4 ;
  wire \tmp_143_reg_6649[3]_i_5_n_4 ;
  wire \tmp_143_reg_6649_reg[35]_i_1_n_4 ;
  wire \tmp_143_reg_6649_reg[35]_i_1_n_5 ;
  wire \tmp_143_reg_6649_reg[35]_i_1_n_6 ;
  wire \tmp_143_reg_6649_reg[35]_i_1_n_7 ;
  wire \tmp_143_reg_6649_reg[3]_i_1_n_4 ;
  wire \tmp_143_reg_6649_reg[3]_i_1_n_5 ;
  wire \tmp_143_reg_6649_reg[3]_i_1_n_6 ;
  wire \tmp_143_reg_6649_reg[3]_i_1_n_7 ;
  wire tmp_144_reg_5802;
  wire tmp_145_reg_5807;
  wire tmp_146_reg_5812;
  wire tmp_148_reg_5822;
  wire tmp_149_reg_5827;
  wire tmp_150_reg_5832;
  wire tmp_152_reg_5842;
  wire tmp_153_reg_5847;
  wire tmp_154_reg_5852;
  wire tmp_156_reg_5862;
  wire tmp_157_reg_5867;
  wire tmp_158_reg_5872;
  wire tmp_15_reg_5157;
  wire tmp_160_reg_5882;
  wire tmp_161_reg_5887;
  wire tmp_162_reg_5892;
  wire tmp_164_reg_5902;
  wire tmp_165_reg_5907;
  wire tmp_166_reg_5912;
  wire tmp_168_reg_5922;
  wire tmp_169_reg_5927;
  wire tmp_16_reg_5162;
  wire tmp_170_reg_5932;
  wire tmp_172_reg_5942;
  wire tmp_173_reg_5947;
  wire tmp_174_reg_5952;
  wire tmp_175_reg_5957;
  wire [1:0]tmp_176_reg_6142;
  wire \tmp_176_reg_6142[1]_i_3_n_4 ;
  wire \tmp_176_reg_6142[1]_i_5_n_4 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_10 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_11 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_5 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_6 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_7 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_8 ;
  wire \tmp_176_reg_6142_reg[1]_i_1_n_9 ;
  wire \tmp_177_reg_6147[1]_i_3_n_4 ;
  wire \tmp_177_reg_6147[1]_i_5_n_4 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_10 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_11 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_4 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_5 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_6 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_7 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_8 ;
  wire \tmp_177_reg_6147_reg[1]_i_1_n_9 ;
  wire \tmp_178_reg_6153[1]_i_3_n_4 ;
  wire \tmp_178_reg_6153[1]_i_5_n_4 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_10 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_11 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_4 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_5 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_6 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_7 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_8 ;
  wire \tmp_178_reg_6153_reg[1]_i_1_n_9 ;
  wire \tmp_179_reg_6159[1]_i_3_n_4 ;
  wire \tmp_179_reg_6159[1]_i_5_n_4 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_10 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_11 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_4 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_5 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_6 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_7 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_8 ;
  wire \tmp_179_reg_6159_reg[1]_i_1_n_9 ;
  wire tmp_17_reg_5167;
  wire \tmp_180_reg_6165[1]_i_3_n_4 ;
  wire \tmp_180_reg_6165[1]_i_5_n_4 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_10 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_11 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_4 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_5 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_6 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_7 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_8 ;
  wire \tmp_180_reg_6165_reg[1]_i_1_n_9 ;
  wire \tmp_181_reg_6171[1]_i_3_n_4 ;
  wire \tmp_181_reg_6171[1]_i_5_n_4 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_10 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_11 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_4 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_5 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_6 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_7 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_8 ;
  wire \tmp_181_reg_6171_reg[1]_i_1_n_9 ;
  wire \tmp_182_reg_6177[1]_i_3_n_4 ;
  wire \tmp_182_reg_6177[1]_i_5_n_4 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_10 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_11 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_4 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_5 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_6 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_7 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_8 ;
  wire \tmp_182_reg_6177_reg[1]_i_1_n_9 ;
  wire \tmp_183_reg_6183[1]_i_3_n_4 ;
  wire \tmp_183_reg_6183[1]_i_5_n_4 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_10 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_11 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_4 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_5 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_6 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_7 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_8 ;
  wire \tmp_183_reg_6183_reg[1]_i_1_n_9 ;
  wire \tmp_184_reg_6189[1]_i_3_n_4 ;
  wire \tmp_184_reg_6189[1]_i_5_n_4 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_10 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_11 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_4 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_5 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_6 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_7 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_8 ;
  wire \tmp_184_reg_6189_reg[1]_i_1_n_9 ;
  wire \tmp_185_reg_6195[1]_i_3_n_4 ;
  wire \tmp_185_reg_6195[1]_i_5_n_4 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_10 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_11 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_4 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_5 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_6 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_7 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_8 ;
  wire \tmp_185_reg_6195_reg[1]_i_1_n_9 ;
  wire \tmp_186_reg_6201[1]_i_3_n_4 ;
  wire \tmp_186_reg_6201[1]_i_5_n_4 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_10 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_11 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_4 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_5 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_6 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_7 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_8 ;
  wire \tmp_186_reg_6201_reg[1]_i_1_n_9 ;
  wire \tmp_187_reg_6207[1]_i_3_n_4 ;
  wire \tmp_187_reg_6207[1]_i_5_n_4 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_10 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_11 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_4 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_5 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_6 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_7 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_8 ;
  wire \tmp_187_reg_6207_reg[1]_i_1_n_9 ;
  wire \tmp_188_reg_6213[1]_i_3_n_4 ;
  wire \tmp_188_reg_6213[1]_i_5_n_4 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_10 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_11 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_4 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_5 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_6 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_7 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_8 ;
  wire \tmp_188_reg_6213_reg[1]_i_1_n_9 ;
  wire \tmp_189_reg_6219[1]_i_3_n_4 ;
  wire \tmp_189_reg_6219[1]_i_5_n_4 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_10 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_11 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_4 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_5 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_6 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_7 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_8 ;
  wire \tmp_189_reg_6219_reg[1]_i_1_n_9 ;
  wire \tmp_190_reg_6225[1]_i_3_n_4 ;
  wire \tmp_190_reg_6225[1]_i_5_n_4 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_4 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_5 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_6 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_7 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_8 ;
  wire \tmp_190_reg_6225_reg[1]_i_1_n_9 ;
  wire [1:0]tmp_191_reg_6237;
  wire tmp_19_reg_5177;
  wire [58:0]tmp_207_reg_6619;
  wire \tmp_207_reg_6619[10]_i_2_n_4 ;
  wire \tmp_207_reg_6619[10]_i_3_n_4 ;
  wire \tmp_207_reg_6619[18]_i_2_n_4 ;
  wire \tmp_207_reg_6619[18]_i_3_n_4 ;
  wire \tmp_207_reg_6619[26]_i_2_n_4 ;
  wire \tmp_207_reg_6619[26]_i_3_n_4 ;
  wire \tmp_207_reg_6619[2]_i_2_n_4 ;
  wire \tmp_207_reg_6619[2]_i_3_n_4 ;
  wire \tmp_207_reg_6619[34]_i_2_n_4 ;
  wire \tmp_207_reg_6619[34]_i_3_n_4 ;
  wire \tmp_207_reg_6619[42]_i_2_n_4 ;
  wire \tmp_207_reg_6619[42]_i_3_n_4 ;
  wire \tmp_207_reg_6619[50]_i_2_n_4 ;
  wire \tmp_207_reg_6619[50]_i_3_n_4 ;
  wire \tmp_207_reg_6619[58]_i_2_n_4 ;
  wire \tmp_207_reg_6619[58]_i_3_n_4 ;
  wire \tmp_207_reg_6619_reg[10]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[18]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[26]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[2]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[34]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[42]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[50]_i_1_n_7 ;
  wire \tmp_207_reg_6619_reg[58]_i_1_n_7 ;
  wire [3:0]tmp_208_reg_6654;
  wire \tmp_208_reg_6654[3]_i_2_n_4 ;
  wire \tmp_208_reg_6654[3]_i_3_n_4 ;
  wire \tmp_208_reg_6654[3]_i_4_n_4 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_10 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_11 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_4 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_6 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_7 ;
  wire \tmp_208_reg_6654_reg[3]_i_1_n_9 ;
  wire \tmp_209_reg_6660[3]_i_2_n_4 ;
  wire \tmp_209_reg_6660[3]_i_3_n_4 ;
  wire \tmp_209_reg_6660[3]_i_4_n_4 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_10 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_11 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_4 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_6 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_7 ;
  wire \tmp_209_reg_6660_reg[3]_i_1_n_9 ;
  wire tmp_20_reg_5182;
  wire \tmp_210_reg_6666[3]_i_2_n_4 ;
  wire \tmp_210_reg_6666[3]_i_3_n_4 ;
  wire \tmp_210_reg_6666[3]_i_4_n_4 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_10 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_11 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_4 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_6 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_7 ;
  wire \tmp_210_reg_6666_reg[3]_i_1_n_9 ;
  wire \tmp_211_reg_6672[3]_i_2_n_4 ;
  wire \tmp_211_reg_6672[3]_i_3_n_4 ;
  wire \tmp_211_reg_6672[3]_i_4_n_4 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_10 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_11 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_4 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_6 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_7 ;
  wire \tmp_211_reg_6672_reg[3]_i_1_n_9 ;
  wire \tmp_212_reg_6678[3]_i_2_n_4 ;
  wire \tmp_212_reg_6678[3]_i_3_n_4 ;
  wire \tmp_212_reg_6678[3]_i_4_n_4 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_10 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_11 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_4 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_6 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_7 ;
  wire \tmp_212_reg_6678_reg[3]_i_1_n_9 ;
  wire \tmp_213_reg_6684[3]_i_2_n_4 ;
  wire \tmp_213_reg_6684[3]_i_3_n_4 ;
  wire \tmp_213_reg_6684[3]_i_4_n_4 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_10 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_11 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_4 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_6 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_7 ;
  wire \tmp_213_reg_6684_reg[3]_i_1_n_9 ;
  wire [3:0]tmp_214_reg_6695;
  wire \tmp_214_reg_6695[3]_i_2_n_4 ;
  wire \tmp_214_reg_6695[3]_i_3_n_4 ;
  wire \tmp_214_reg_6695[3]_i_4_n_4 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_10 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_11 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_4 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_6 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_7 ;
  wire \tmp_214_reg_6695_reg[3]_i_1_n_9 ;
  wire [36:0]tmp_215_reg_6771;
  wire \tmp_215_reg_6771[35]_i_2_n_4 ;
  wire \tmp_215_reg_6771[35]_i_3_n_4 ;
  wire \tmp_215_reg_6771[35]_i_4_n_4 ;
  wire \tmp_215_reg_6771[35]_i_5_n_4 ;
  wire \tmp_215_reg_6771[3]_i_2_n_4 ;
  wire \tmp_215_reg_6771[3]_i_3_n_4 ;
  wire \tmp_215_reg_6771[3]_i_4_n_4 ;
  wire \tmp_215_reg_6771[3]_i_5_n_4 ;
  wire \tmp_215_reg_6771_reg[35]_i_1_n_4 ;
  wire \tmp_215_reg_6771_reg[35]_i_1_n_5 ;
  wire \tmp_215_reg_6771_reg[35]_i_1_n_6 ;
  wire \tmp_215_reg_6771_reg[35]_i_1_n_7 ;
  wire \tmp_215_reg_6771_reg[3]_i_1_n_4 ;
  wire \tmp_215_reg_6771_reg[3]_i_1_n_5 ;
  wire \tmp_215_reg_6771_reg[3]_i_1_n_6 ;
  wire \tmp_215_reg_6771_reg[3]_i_1_n_7 ;
  wire tmp_216_reg_5962;
  wire tmp_217_reg_5967;
  wire tmp_218_reg_5972;
  wire tmp_219_reg_5977;
  wire tmp_21_reg_5187;
  wire tmp_220_reg_5982;
  wire tmp_221_reg_5987;
  wire tmp_222_reg_5992;
  wire tmp_223_reg_5997;
  wire tmp_224_reg_6002;
  wire tmp_225_reg_6007;
  wire tmp_226_reg_6012;
  wire tmp_227_reg_6017;
  wire tmp_228_reg_6022;
  wire tmp_229_reg_6027;
  wire tmp_230_reg_6032;
  wire tmp_231_reg_6037;
  wire tmp_232_reg_6042;
  wire tmp_233_reg_6047;
  wire tmp_234_reg_6052;
  wire tmp_235_reg_6057;
  wire tmp_236_reg_6062;
  wire tmp_237_reg_6067;
  wire tmp_238_reg_6072;
  wire tmp_239_reg_6077;
  wire tmp_23_reg_5197;
  wire tmp_240_reg_6082;
  wire tmp_241_reg_6087;
  wire tmp_242_reg_6092;
  wire tmp_243_reg_6097;
  wire tmp_244_reg_6102;
  wire tmp_245_reg_6107;
  wire tmp_246_reg_6112;
  wire tmp_247_reg_6117;
  wire [1:0]tmp_248_reg_6332;
  wire \tmp_248_reg_6332[1]_i_2_n_4 ;
  wire \tmp_248_reg_6332[1]_i_3_n_4 ;
  wire \tmp_248_reg_6332[1]_i_4_n_4 ;
  wire \tmp_248_reg_6332[1]_i_5_n_4 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_10 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_11 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_5 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_6 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_7 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_8 ;
  wire \tmp_248_reg_6332_reg[1]_i_1_n_9 ;
  wire \tmp_249_reg_6337[1]_i_2_n_4 ;
  wire \tmp_249_reg_6337[1]_i_3_n_4 ;
  wire \tmp_249_reg_6337[1]_i_4_n_4 ;
  wire \tmp_249_reg_6337[1]_i_5_n_4 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_10 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_11 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_4 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_5 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_6 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_7 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_8 ;
  wire \tmp_249_reg_6337_reg[1]_i_1_n_9 ;
  wire tmp_24_reg_5202;
  wire \tmp_250_reg_6343[1]_i_2_n_4 ;
  wire \tmp_250_reg_6343[1]_i_3_n_4 ;
  wire \tmp_250_reg_6343[1]_i_4_n_4 ;
  wire \tmp_250_reg_6343[1]_i_5_n_4 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_10 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_11 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_4 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_5 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_6 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_7 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_8 ;
  wire \tmp_250_reg_6343_reg[1]_i_1_n_9 ;
  wire \tmp_251_reg_6349[1]_i_2_n_4 ;
  wire \tmp_251_reg_6349[1]_i_3_n_4 ;
  wire \tmp_251_reg_6349[1]_i_4_n_4 ;
  wire \tmp_251_reg_6349[1]_i_5_n_4 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_10 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_11 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_4 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_5 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_6 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_7 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_8 ;
  wire \tmp_251_reg_6349_reg[1]_i_1_n_9 ;
  wire \tmp_252_reg_6355[1]_i_2_n_4 ;
  wire \tmp_252_reg_6355[1]_i_3_n_4 ;
  wire \tmp_252_reg_6355[1]_i_4_n_4 ;
  wire \tmp_252_reg_6355[1]_i_5_n_4 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_10 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_11 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_4 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_5 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_6 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_7 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_8 ;
  wire \tmp_252_reg_6355_reg[1]_i_1_n_9 ;
  wire \tmp_253_reg_6361[1]_i_2_n_4 ;
  wire \tmp_253_reg_6361[1]_i_3_n_4 ;
  wire \tmp_253_reg_6361[1]_i_4_n_4 ;
  wire \tmp_253_reg_6361[1]_i_5_n_4 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_10 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_11 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_4 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_5 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_6 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_7 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_8 ;
  wire \tmp_253_reg_6361_reg[1]_i_1_n_9 ;
  wire \tmp_254_reg_6367[1]_i_2_n_4 ;
  wire \tmp_254_reg_6367[1]_i_3_n_4 ;
  wire \tmp_254_reg_6367[1]_i_4_n_4 ;
  wire \tmp_254_reg_6367[1]_i_5_n_4 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_10 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_11 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_4 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_5 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_6 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_7 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_8 ;
  wire \tmp_254_reg_6367_reg[1]_i_1_n_9 ;
  wire \tmp_255_reg_6373[1]_i_2_n_4 ;
  wire \tmp_255_reg_6373[1]_i_3_n_4 ;
  wire \tmp_255_reg_6373[1]_i_4_n_4 ;
  wire \tmp_255_reg_6373[1]_i_5_n_4 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_10 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_11 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_4 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_5 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_6 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_7 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_8 ;
  wire \tmp_255_reg_6373_reg[1]_i_1_n_9 ;
  wire \tmp_256_reg_6379[1]_i_2_n_4 ;
  wire \tmp_256_reg_6379[1]_i_3_n_4 ;
  wire \tmp_256_reg_6379[1]_i_4_n_4 ;
  wire \tmp_256_reg_6379[1]_i_5_n_4 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_10 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_11 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_4 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_5 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_6 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_7 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_8 ;
  wire \tmp_256_reg_6379_reg[1]_i_1_n_9 ;
  wire \tmp_257_reg_6385[1]_i_2_n_4 ;
  wire \tmp_257_reg_6385[1]_i_3_n_4 ;
  wire \tmp_257_reg_6385[1]_i_4_n_4 ;
  wire \tmp_257_reg_6385[1]_i_5_n_4 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_10 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_11 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_4 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_5 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_6 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_7 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_8 ;
  wire \tmp_257_reg_6385_reg[1]_i_1_n_9 ;
  wire \tmp_258_reg_6391[1]_i_2_n_4 ;
  wire \tmp_258_reg_6391[1]_i_3_n_4 ;
  wire \tmp_258_reg_6391[1]_i_4_n_4 ;
  wire \tmp_258_reg_6391[1]_i_5_n_4 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_10 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_11 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_4 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_5 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_6 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_7 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_8 ;
  wire \tmp_258_reg_6391_reg[1]_i_1_n_9 ;
  wire \tmp_259_reg_6397[1]_i_2_n_4 ;
  wire \tmp_259_reg_6397[1]_i_3_n_4 ;
  wire \tmp_259_reg_6397[1]_i_4_n_4 ;
  wire \tmp_259_reg_6397[1]_i_5_n_4 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_10 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_11 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_4 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_5 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_6 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_7 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_8 ;
  wire \tmp_259_reg_6397_reg[1]_i_1_n_9 ;
  wire tmp_25_reg_5207;
  wire \tmp_260_reg_6403[1]_i_2_n_4 ;
  wire \tmp_260_reg_6403[1]_i_3_n_4 ;
  wire \tmp_260_reg_6403[1]_i_4_n_4 ;
  wire \tmp_260_reg_6403[1]_i_5_n_4 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_10 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_11 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_4 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_5 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_6 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_7 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_8 ;
  wire \tmp_260_reg_6403_reg[1]_i_1_n_9 ;
  wire \tmp_261_reg_6409[1]_i_2_n_4 ;
  wire \tmp_261_reg_6409[1]_i_3_n_4 ;
  wire \tmp_261_reg_6409[1]_i_4_n_4 ;
  wire \tmp_261_reg_6409[1]_i_5_n_4 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_10 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_11 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_4 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_5 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_6 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_7 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_8 ;
  wire \tmp_261_reg_6409_reg[1]_i_1_n_9 ;
  wire \tmp_262_reg_6415[1]_i_2_n_4 ;
  wire \tmp_262_reg_6415[1]_i_3_n_4 ;
  wire \tmp_262_reg_6415[1]_i_4_n_4 ;
  wire \tmp_262_reg_6415[1]_i_5_n_4 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_10 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_11 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_4 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_5 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_6 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_7 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_8 ;
  wire \tmp_262_reg_6415_reg[1]_i_1_n_9 ;
  wire [1:0]tmp_263_reg_6427;
  wire [58:0]tmp_279_reg_6629;
  wire \tmp_279_reg_6629[10]_i_2_n_4 ;
  wire \tmp_279_reg_6629[10]_i_3_n_4 ;
  wire \tmp_279_reg_6629[18]_i_2_n_4 ;
  wire \tmp_279_reg_6629[18]_i_3_n_4 ;
  wire \tmp_279_reg_6629[26]_i_2_n_4 ;
  wire \tmp_279_reg_6629[26]_i_3_n_4 ;
  wire \tmp_279_reg_6629[2]_i_2_n_4 ;
  wire \tmp_279_reg_6629[2]_i_3_n_4 ;
  wire \tmp_279_reg_6629[34]_i_2_n_4 ;
  wire \tmp_279_reg_6629[34]_i_3_n_4 ;
  wire \tmp_279_reg_6629[42]_i_2_n_4 ;
  wire \tmp_279_reg_6629[42]_i_3_n_4 ;
  wire \tmp_279_reg_6629[50]_i_2_n_4 ;
  wire \tmp_279_reg_6629[50]_i_3_n_4 ;
  wire \tmp_279_reg_6629[58]_i_2_n_4 ;
  wire \tmp_279_reg_6629[58]_i_3_n_4 ;
  wire \tmp_279_reg_6629_reg[10]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[18]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[26]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[2]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[34]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[42]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[50]_i_1_n_7 ;
  wire \tmp_279_reg_6629_reg[58]_i_1_n_7 ;
  wire tmp_27_reg_5217;
  wire [3:0]tmp_280_reg_6700;
  wire \tmp_280_reg_6700[3]_i_2_n_4 ;
  wire \tmp_280_reg_6700[3]_i_3_n_4 ;
  wire \tmp_280_reg_6700[3]_i_4_n_4 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_10 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_11 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_4 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_6 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_7 ;
  wire \tmp_280_reg_6700_reg[3]_i_1_n_9 ;
  wire \tmp_281_reg_6706[3]_i_2_n_4 ;
  wire \tmp_281_reg_6706[3]_i_3_n_4 ;
  wire \tmp_281_reg_6706[3]_i_4_n_4 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_10 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_11 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_4 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_6 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_7 ;
  wire \tmp_281_reg_6706_reg[3]_i_1_n_9 ;
  wire \tmp_282_reg_6712[3]_i_2_n_4 ;
  wire \tmp_282_reg_6712[3]_i_3_n_4 ;
  wire \tmp_282_reg_6712[3]_i_4_n_4 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_10 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_11 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_4 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_6 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_7 ;
  wire \tmp_282_reg_6712_reg[3]_i_1_n_9 ;
  wire \tmp_283_reg_6718[3]_i_2_n_4 ;
  wire \tmp_283_reg_6718[3]_i_3_n_4 ;
  wire \tmp_283_reg_6718[3]_i_4_n_4 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_10 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_11 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_4 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_6 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_7 ;
  wire \tmp_283_reg_6718_reg[3]_i_1_n_9 ;
  wire \tmp_284_reg_6724[3]_i_2_n_4 ;
  wire \tmp_284_reg_6724[3]_i_3_n_4 ;
  wire \tmp_284_reg_6724[3]_i_4_n_4 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_10 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_11 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_4 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_6 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_7 ;
  wire \tmp_284_reg_6724_reg[3]_i_1_n_9 ;
  wire \tmp_285_reg_6730[3]_i_2_n_4 ;
  wire \tmp_285_reg_6730[3]_i_3_n_4 ;
  wire \tmp_285_reg_6730[3]_i_4_n_4 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_10 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_11 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_4 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_6 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_7 ;
  wire \tmp_285_reg_6730_reg[3]_i_1_n_9 ;
  wire [3:0]tmp_286_reg_6741;
  wire \tmp_286_reg_6741[3]_i_2_n_4 ;
  wire \tmp_286_reg_6741[3]_i_3_n_4 ;
  wire \tmp_286_reg_6741[3]_i_4_n_4 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_10 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_11 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_4 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_6 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_7 ;
  wire \tmp_286_reg_6741_reg[3]_i_1_n_9 ;
  wire [36:0]tmp_287_reg_6781;
  wire \tmp_287_reg_6781[35]_i_2_n_4 ;
  wire \tmp_287_reg_6781[35]_i_3_n_4 ;
  wire \tmp_287_reg_6781[35]_i_4_n_4 ;
  wire \tmp_287_reg_6781[35]_i_5_n_4 ;
  wire \tmp_287_reg_6781[3]_i_2_n_4 ;
  wire \tmp_287_reg_6781[3]_i_3_n_4 ;
  wire \tmp_287_reg_6781[3]_i_4_n_4 ;
  wire \tmp_287_reg_6781[3]_i_5_n_4 ;
  wire \tmp_287_reg_6781_reg[35]_i_1_n_4 ;
  wire \tmp_287_reg_6781_reg[35]_i_1_n_5 ;
  wire \tmp_287_reg_6781_reg[35]_i_1_n_6 ;
  wire \tmp_287_reg_6781_reg[35]_i_1_n_7 ;
  wire \tmp_287_reg_6781_reg[3]_i_1_n_4 ;
  wire \tmp_287_reg_6781_reg[3]_i_1_n_5 ;
  wire \tmp_287_reg_6781_reg[3]_i_1_n_6 ;
  wire \tmp_287_reg_6781_reg[3]_i_1_n_7 ;
  wire tmp_28_reg_5222;
  wire tmp_29_reg_5227;
  wire tmp_31_reg_5237;
  wire tmp_32_reg_5242;
  wire tmp_4_reg_5102;
  wire tmp_5_reg_5107;
  wire [58:0]tmp_63_reg_6122;
  wire \tmp_63_reg_6122[10]_i_2_n_4 ;
  wire \tmp_63_reg_6122[10]_i_3_n_4 ;
  wire \tmp_63_reg_6122[18]_i_2_n_4 ;
  wire \tmp_63_reg_6122[18]_i_3_n_4 ;
  wire \tmp_63_reg_6122[26]_i_2_n_4 ;
  wire \tmp_63_reg_6122[26]_i_3_n_4 ;
  wire \tmp_63_reg_6122[2]_i_2_n_4 ;
  wire \tmp_63_reg_6122[2]_i_3_n_4 ;
  wire \tmp_63_reg_6122[34]_i_2_n_4 ;
  wire \tmp_63_reg_6122[34]_i_3_n_4 ;
  wire \tmp_63_reg_6122[42]_i_2_n_4 ;
  wire \tmp_63_reg_6122[42]_i_3_n_4 ;
  wire \tmp_63_reg_6122[50]_i_2_n_4 ;
  wire \tmp_63_reg_6122[50]_i_3_n_4 ;
  wire \tmp_63_reg_6122[58]_i_2_n_4 ;
  wire \tmp_63_reg_6122[58]_i_3_n_4 ;
  wire \tmp_63_reg_6122_reg[10]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[18]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[26]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[2]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[34]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[42]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[50]_i_1_n_7 ;
  wire \tmp_63_reg_6122_reg[58]_i_1_n_7 ;
  wire [3:0]tmp_64_reg_6522;
  wire \tmp_64_reg_6522[3]_i_2_n_4 ;
  wire \tmp_64_reg_6522[3]_i_3_n_4 ;
  wire \tmp_64_reg_6522[3]_i_4_n_4 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_10 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_11 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_4 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_6 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_7 ;
  wire \tmp_64_reg_6522_reg[3]_i_1_n_9 ;
  wire \tmp_65_reg_6528[3]_i_2_n_4 ;
  wire \tmp_65_reg_6528[3]_i_3_n_4 ;
  wire \tmp_65_reg_6528[3]_i_4_n_4 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_10 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_11 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_4 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_6 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_7 ;
  wire \tmp_65_reg_6528_reg[3]_i_1_n_9 ;
  wire \tmp_66_reg_6534[3]_i_2_n_4 ;
  wire \tmp_66_reg_6534[3]_i_3_n_4 ;
  wire \tmp_66_reg_6534[3]_i_4_n_4 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_10 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_11 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_4 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_6 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_7 ;
  wire \tmp_66_reg_6534_reg[3]_i_1_n_9 ;
  wire \tmp_67_reg_6540[3]_i_2_n_4 ;
  wire \tmp_67_reg_6540[3]_i_3_n_4 ;
  wire \tmp_67_reg_6540[3]_i_4_n_4 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_10 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_11 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_4 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_6 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_7 ;
  wire \tmp_67_reg_6540_reg[3]_i_1_n_9 ;
  wire \tmp_68_reg_6546[3]_i_2_n_4 ;
  wire \tmp_68_reg_6546[3]_i_3_n_4 ;
  wire \tmp_68_reg_6546[3]_i_4_n_4 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_10 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_11 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_4 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_6 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_7 ;
  wire \tmp_68_reg_6546_reg[3]_i_1_n_9 ;
  wire \tmp_69_reg_6552[3]_i_2_n_4 ;
  wire \tmp_69_reg_6552[3]_i_3_n_4 ;
  wire \tmp_69_reg_6552[3]_i_4_n_4 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_10 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_11 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_4 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_6 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_7 ;
  wire \tmp_69_reg_6552_reg[3]_i_1_n_9 ;
  wire [3:0]tmp_70_reg_6563;
  wire \tmp_70_reg_6563[3]_i_2_n_4 ;
  wire \tmp_70_reg_6563[3]_i_3_n_4 ;
  wire \tmp_70_reg_6563[3]_i_4_n_4 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_10 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_11 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_4 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_6 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_7 ;
  wire \tmp_70_reg_6563_reg[3]_i_1_n_9 ;
  wire [36:0]tmp_71_reg_6639;
  wire \tmp_71_reg_6639[35]_i_2_n_4 ;
  wire \tmp_71_reg_6639[35]_i_3_n_4 ;
  wire \tmp_71_reg_6639[35]_i_4_n_4 ;
  wire \tmp_71_reg_6639[35]_i_5_n_4 ;
  wire \tmp_71_reg_6639[3]_i_2_n_4 ;
  wire \tmp_71_reg_6639[3]_i_3_n_4 ;
  wire \tmp_71_reg_6639[3]_i_4_n_4 ;
  wire \tmp_71_reg_6639[3]_i_5_n_4 ;
  wire \tmp_71_reg_6639_reg[35]_i_1_n_4 ;
  wire \tmp_71_reg_6639_reg[35]_i_1_n_5 ;
  wire \tmp_71_reg_6639_reg[35]_i_1_n_6 ;
  wire \tmp_71_reg_6639_reg[35]_i_1_n_7 ;
  wire \tmp_71_reg_6639_reg[3]_i_1_n_4 ;
  wire \tmp_71_reg_6639_reg[3]_i_1_n_5 ;
  wire \tmp_71_reg_6639_reg[3]_i_1_n_6 ;
  wire \tmp_71_reg_6639_reg[3]_i_1_n_7 ;
  wire tmp_72_reg_5257;
  wire tmp_73_reg_5262;
  wire tmp_74_reg_5267;
  wire tmp_75_reg_5272;
  wire tmp_76_reg_5277;
  wire tmp_77_reg_5282;
  wire tmp_78_reg_5287;
  wire tmp_79_reg_5292;
  wire tmp_7_reg_5117;
  wire tmp_80_reg_5297;
  wire tmp_81_reg_5302;
  wire tmp_82_reg_5307;
  wire tmp_83_reg_5312;
  wire tmp_84_reg_5317;
  wire tmp_85_reg_5322;
  wire tmp_86_reg_5327;
  wire tmp_87_reg_5332;
  wire tmp_88_reg_5337;
  wire tmp_89_reg_5342;
  wire tmp_8_reg_5122;
  wire tmp_90_reg_5347;
  wire tmp_91_reg_5352;
  wire tmp_92_reg_5357;
  wire tmp_93_reg_5362;
  wire tmp_94_reg_5367;
  wire tmp_95_reg_5372;
  wire tmp_96_reg_5377;
  wire tmp_97_reg_5382;
  wire tmp_98_reg_5387;
  wire tmp_99_reg_5392;
  wire tmp_9_reg_5127;
  wire tmp_reg_5097;
  wire [63:0]\tmp_reg_5097_reg[0]_0 ;
  wire [11:0]training_labels_address0;
  wire training_labels_ce0;
  wire [3:0]training_labels_q0;
  wire [11:0]training_samples_address0;
  wire training_samples_ce1;
  wire [63:0]training_samples_q0;
  wire [63:0]training_samples_q1;
  wire [8:0]trunc_ln107_fu_4714_p1;
  wire [36:0]trunc_ln18_1_fu_4180_p1;
  wire [36:0]trunc_ln18_1_reg_6634;
  wire \trunc_ln18_1_reg_6634[35]_i_2_n_4 ;
  wire \trunc_ln18_1_reg_6634[35]_i_3_n_4 ;
  wire \trunc_ln18_1_reg_6634[35]_i_4_n_4 ;
  wire \trunc_ln18_1_reg_6634[35]_i_5_n_4 ;
  wire \trunc_ln18_1_reg_6634[3]_i_2_n_4 ;
  wire \trunc_ln18_1_reg_6634[3]_i_3_n_4 ;
  wire \trunc_ln18_1_reg_6634[3]_i_4_n_4 ;
  wire \trunc_ln18_1_reg_6634[3]_i_5_n_4 ;
  wire \trunc_ln18_1_reg_6634_reg[35]_i_1_n_4 ;
  wire \trunc_ln18_1_reg_6634_reg[35]_i_1_n_5 ;
  wire \trunc_ln18_1_reg_6634_reg[35]_i_1_n_6 ;
  wire \trunc_ln18_1_reg_6634_reg[35]_i_1_n_7 ;
  wire \trunc_ln18_1_reg_6634_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_1_reg_6634_reg[3]_i_1_n_5 ;
  wire \trunc_ln18_1_reg_6634_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_1_reg_6634_reg[3]_i_1_n_7 ;
  wire [3:0]trunc_ln18_2_reg_6604;
  wire \trunc_ln18_2_reg_6604[3]_i_2_n_4 ;
  wire \trunc_ln18_2_reg_6604[3]_i_3_n_4 ;
  wire \trunc_ln18_2_reg_6604[3]_i_4_n_4 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_10 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_11 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_7 ;
  wire \trunc_ln18_2_reg_6604_reg[3]_i_1_n_9 ;
  wire [36:0]trunc_ln18_3_fu_4264_p1;
  wire [36:0]trunc_ln18_3_reg_6644;
  wire \trunc_ln18_3_reg_6644[35]_i_2_n_4 ;
  wire \trunc_ln18_3_reg_6644[35]_i_3_n_4 ;
  wire \trunc_ln18_3_reg_6644[35]_i_4_n_4 ;
  wire \trunc_ln18_3_reg_6644[35]_i_5_n_4 ;
  wire \trunc_ln18_3_reg_6644[3]_i_2_n_4 ;
  wire \trunc_ln18_3_reg_6644[3]_i_3_n_4 ;
  wire \trunc_ln18_3_reg_6644[3]_i_4_n_4 ;
  wire \trunc_ln18_3_reg_6644[3]_i_5_n_4 ;
  wire \trunc_ln18_3_reg_6644_reg[35]_i_1_n_4 ;
  wire \trunc_ln18_3_reg_6644_reg[35]_i_1_n_5 ;
  wire \trunc_ln18_3_reg_6644_reg[35]_i_1_n_6 ;
  wire \trunc_ln18_3_reg_6644_reg[35]_i_1_n_7 ;
  wire \trunc_ln18_3_reg_6644_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_3_reg_6644_reg[3]_i_1_n_5 ;
  wire \trunc_ln18_3_reg_6644_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_3_reg_6644_reg[3]_i_1_n_7 ;
  wire [3:0]trunc_ln18_4_reg_6690;
  wire \trunc_ln18_4_reg_6690[3]_i_2_n_4 ;
  wire \trunc_ln18_4_reg_6690[3]_i_3_n_4 ;
  wire \trunc_ln18_4_reg_6690[3]_i_4_n_4 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_10 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_11 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_7 ;
  wire \trunc_ln18_4_reg_6690_reg[3]_i_1_n_9 ;
  wire [36:0]trunc_ln18_5_fu_4556_p1;
  wire [36:0]trunc_ln18_5_reg_6766;
  wire \trunc_ln18_5_reg_6766[35]_i_2_n_4 ;
  wire \trunc_ln18_5_reg_6766[35]_i_3_n_4 ;
  wire \trunc_ln18_5_reg_6766[35]_i_4_n_4 ;
  wire \trunc_ln18_5_reg_6766[35]_i_5_n_4 ;
  wire \trunc_ln18_5_reg_6766[3]_i_2_n_4 ;
  wire \trunc_ln18_5_reg_6766[3]_i_3_n_4 ;
  wire \trunc_ln18_5_reg_6766[3]_i_4_n_4 ;
  wire \trunc_ln18_5_reg_6766[3]_i_5_n_4 ;
  wire \trunc_ln18_5_reg_6766_reg[35]_i_1_n_4 ;
  wire \trunc_ln18_5_reg_6766_reg[35]_i_1_n_5 ;
  wire \trunc_ln18_5_reg_6766_reg[35]_i_1_n_6 ;
  wire \trunc_ln18_5_reg_6766_reg[35]_i_1_n_7 ;
  wire \trunc_ln18_5_reg_6766_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_5_reg_6766_reg[3]_i_1_n_5 ;
  wire \trunc_ln18_5_reg_6766_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_5_reg_6766_reg[3]_i_1_n_7 ;
  wire [3:0]trunc_ln18_6_reg_6736;
  wire \trunc_ln18_6_reg_6736[3]_i_2_n_4 ;
  wire \trunc_ln18_6_reg_6736[3]_i_3_n_4 ;
  wire \trunc_ln18_6_reg_6736[3]_i_4_n_4 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_10 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_11 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_7 ;
  wire \trunc_ln18_6_reg_6736_reg[3]_i_1_n_9 ;
  wire [36:0]trunc_ln18_7_fu_4640_p1;
  wire [36:0]trunc_ln18_7_reg_6776;
  wire \trunc_ln18_7_reg_6776[35]_i_2_n_4 ;
  wire \trunc_ln18_7_reg_6776[35]_i_3_n_4 ;
  wire \trunc_ln18_7_reg_6776[35]_i_4_n_4 ;
  wire \trunc_ln18_7_reg_6776[35]_i_5_n_4 ;
  wire \trunc_ln18_7_reg_6776[3]_i_2_n_4 ;
  wire \trunc_ln18_7_reg_6776[3]_i_3_n_4 ;
  wire \trunc_ln18_7_reg_6776[3]_i_4_n_4 ;
  wire \trunc_ln18_7_reg_6776[3]_i_5_n_4 ;
  wire \trunc_ln18_7_reg_6776_reg[35]_i_1_n_4 ;
  wire \trunc_ln18_7_reg_6776_reg[35]_i_1_n_5 ;
  wire \trunc_ln18_7_reg_6776_reg[35]_i_1_n_6 ;
  wire \trunc_ln18_7_reg_6776_reg[35]_i_1_n_7 ;
  wire \trunc_ln18_7_reg_6776_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_7_reg_6776_reg[3]_i_1_n_5 ;
  wire \trunc_ln18_7_reg_6776_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_7_reg_6776_reg[3]_i_1_n_7 ;
  wire [3:0]trunc_ln18_reg_6558;
  wire \trunc_ln18_reg_6558[3]_i_2_n_4 ;
  wire \trunc_ln18_reg_6558[3]_i_3_n_4 ;
  wire \trunc_ln18_reg_6558[3]_i_4_n_4 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_10 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_11 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_4 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_6 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_7 ;
  wire \trunc_ln18_reg_6558_reg[3]_i_1_n_9 ;
  wire \trunc_ln21_1_reg_5696[1]_i_2_n_4 ;
  wire \trunc_ln21_1_reg_5696[1]_i_3_n_4 ;
  wire \trunc_ln21_1_reg_5696[1]_i_4_n_4 ;
  wire \trunc_ln21_1_reg_5696[1]_i_5_n_4 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_10 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_11 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_4 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_5 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_6 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_7 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_8 ;
  wire \trunc_ln21_1_reg_5696_reg[1]_i_1_n_9 ;
  wire \trunc_ln21_2_reg_6231[1]_i_3_n_4 ;
  wire \trunc_ln21_2_reg_6231[1]_i_5_n_4 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_10 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_11 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_4 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_5 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_6 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_7 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_8 ;
  wire \trunc_ln21_2_reg_6231_reg[1]_i_1_n_9 ;
  wire \trunc_ln21_3_reg_6421[1]_i_2_n_4 ;
  wire \trunc_ln21_3_reg_6421[1]_i_3_n_4 ;
  wire \trunc_ln21_3_reg_6421[1]_i_4_n_4 ;
  wire \trunc_ln21_3_reg_6421[1]_i_5_n_4 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_10 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_11 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_4 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_5 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_6 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_7 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_8 ;
  wire \trunc_ln21_3_reg_6421_reg[1]_i_1_n_9 ;
  wire [5:0]trunc_ln25_1_reg_6751;
  wire \trunc_ln25_1_reg_6751[3]_i_2_n_4 ;
  wire \trunc_ln25_1_reg_6751[3]_i_3_n_4 ;
  wire \trunc_ln25_1_reg_6751[3]_i_4_n_4 ;
  wire \trunc_ln25_1_reg_6751[3]_i_5_n_4 ;
  wire \trunc_ln25_1_reg_6751[5]_i_2_n_4 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_1_reg_6751_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_1_reg_6751_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_1_reg_6751_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_2_reg_6756;
  wire \trunc_ln25_2_reg_6756[3]_i_2_n_4 ;
  wire \trunc_ln25_2_reg_6756[3]_i_3_n_4 ;
  wire \trunc_ln25_2_reg_6756[3]_i_4_n_4 ;
  wire \trunc_ln25_2_reg_6756[3]_i_5_n_4 ;
  wire \trunc_ln25_2_reg_6756[5]_i_2_n_4 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_2_reg_6756_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_2_reg_6756_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_2_reg_6756_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_3_reg_6761;
  wire \trunc_ln25_3_reg_6761[3]_i_2_n_4 ;
  wire \trunc_ln25_3_reg_6761[3]_i_3_n_4 ;
  wire \trunc_ln25_3_reg_6761[3]_i_4_n_4 ;
  wire \trunc_ln25_3_reg_6761[3]_i_5_n_4 ;
  wire \trunc_ln25_3_reg_6761[5]_i_2_n_4 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_3_reg_6761_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_3_reg_6761_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_3_reg_6761_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_4_reg_6801;
  wire \trunc_ln25_4_reg_6801[3]_i_2_n_4 ;
  wire \trunc_ln25_4_reg_6801[3]_i_3_n_4 ;
  wire \trunc_ln25_4_reg_6801[3]_i_4_n_4 ;
  wire \trunc_ln25_4_reg_6801[3]_i_5_n_4 ;
  wire \trunc_ln25_4_reg_6801[5]_i_2_n_4 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_4_reg_6801_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_4_reg_6801_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_4_reg_6801_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_5_reg_6806;
  wire \trunc_ln25_5_reg_6806[3]_i_2_n_4 ;
  wire \trunc_ln25_5_reg_6806[3]_i_3_n_4 ;
  wire \trunc_ln25_5_reg_6806[3]_i_4_n_4 ;
  wire \trunc_ln25_5_reg_6806[3]_i_5_n_4 ;
  wire \trunc_ln25_5_reg_6806[5]_i_2_n_4 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_5_reg_6806_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_5_reg_6806_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_5_reg_6806_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_6_reg_6811;
  wire \trunc_ln25_6_reg_6811[3]_i_2_n_4 ;
  wire \trunc_ln25_6_reg_6811[3]_i_3_n_4 ;
  wire \trunc_ln25_6_reg_6811[3]_i_4_n_4 ;
  wire \trunc_ln25_6_reg_6811[3]_i_5_n_4 ;
  wire \trunc_ln25_6_reg_6811[5]_i_2_n_4 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_6_reg_6811_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_6_reg_6811_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_6_reg_6811_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_7_reg_6816;
  wire \trunc_ln25_7_reg_6816[3]_i_2_n_4 ;
  wire \trunc_ln25_7_reg_6816[3]_i_3_n_4 ;
  wire \trunc_ln25_7_reg_6816[3]_i_4_n_4 ;
  wire \trunc_ln25_7_reg_6816[3]_i_5_n_4 ;
  wire \trunc_ln25_7_reg_6816[5]_i_2_n_4 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_7_reg_6816_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_7_reg_6816_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_7_reg_6816_reg[5]_i_1_n_6 ;
  wire [5:0]trunc_ln25_reg_6746;
  wire \trunc_ln25_reg_6746[3]_i_2_n_4 ;
  wire \trunc_ln25_reg_6746[3]_i_3_n_4 ;
  wire \trunc_ln25_reg_6746[3]_i_4_n_4 ;
  wire \trunc_ln25_reg_6746[3]_i_5_n_4 ;
  wire \trunc_ln25_reg_6746[5]_i_2_n_4 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_10 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_11 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_4 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_5 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_6 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_7 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_8 ;
  wire \trunc_ln25_reg_6746_reg[3]_i_1_n_9 ;
  wire \trunc_ln25_reg_6746_reg[5]_i_1_n_11 ;
  wire \trunc_ln25_reg_6746_reg[5]_i_1_n_6 ;
  wire [9:9]zext_ln108_fu_748_p1;
  wire [61:0]zext_ln21_1_fu_2393_p1;
  wire [61:0]zext_ln21_fu_2290_p1;
  wire [35:0]zext_ln23_1_fu_4164_p1;
  wire [35:0]zext_ln23_3_fu_4248_p1;
  wire [35:0]zext_ln23_5_fu_4540_p1;
  wire [35:0]zext_ln23_7_fu_4624_p1;
  wire [3:2]NLW_add_ln107_fu_1077_p2_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_add_ln107_fu_1077_p2_carry__1_O_UNCONNECTED;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_1_reg_6132_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_1_reg_6132_reg[58]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_2_reg_6614_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_2_reg_6614_reg[58]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_3_reg_6624_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_3_reg_6624_reg[58]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln18_reg_6127_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln18_reg_6127_reg[58]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln26_1_reg_6832_reg[6]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln26_1_reg_6832_reg[6]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln26_2_reg_6837_reg[6]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln26_2_reg_6837_reg[6]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_add_ln26_reg_6796_reg[6]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_add_ln26_reg_6796_reg[6]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_add_ln36_1_reg_6858_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_add_ln36_1_reg_6858_reg[7]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_add_ln36_reg_6853_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_add_ln36_reg_6853_reg[7]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_dist_reg_6791_reg[6]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_dist_reg_6791_reg[6]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_dists_0_reg_6881_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_dists_0_reg_6881_reg[8]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_icmp_ln45_1_fu_4771_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_1_fu_4771_p2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_1_fu_4771_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_1_fu_4771_p2_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_2_fu_4801_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_2_fu_4801_p2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_2_fu_4801_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_2_fu_4801_p2_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_fu_4726_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_fu_4726_p2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_fu_4726_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln45_fu_4726_p2_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln53_fu_4835_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln53_fu_4835_p2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln53_fu_4835_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln53_fu_4835_p2_carry__2_O_UNCONNECTED;
  wire [3:3]NLW_sub_ln20_fu_1184_p2_carry__14_CO_UNCONNECTED;
  wire [3:3]\NLW_tmp_104_reg_5607_reg[1]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_135_reg_6137_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_135_reg_6137_reg[58]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_136_reg_6568_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_136_reg_6568_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_137_reg_6574_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_137_reg_6574_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_138_reg_6580_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_138_reg_6580_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_139_reg_6586_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_139_reg_6586_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_140_reg_6592_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_140_reg_6592_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_141_reg_6598_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_141_reg_6598_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_142_reg_6609_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_142_reg_6609_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_143_reg_6649_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_143_reg_6649_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_143_reg_6649_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_143_reg_6649_reg[4]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_tmp_176_reg_6142_reg[1]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_207_reg_6619_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_207_reg_6619_reg[58]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_208_reg_6654_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_208_reg_6654_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_209_reg_6660_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_209_reg_6660_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_210_reg_6666_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_210_reg_6666_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_211_reg_6672_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_211_reg_6672_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_212_reg_6678_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_212_reg_6678_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_213_reg_6684_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_213_reg_6684_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_214_reg_6695_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_214_reg_6695_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_215_reg_6771_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_215_reg_6771_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_215_reg_6771_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_215_reg_6771_reg[4]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_tmp_248_reg_6332_reg[1]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_279_reg_6629_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_279_reg_6629_reg[58]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_280_reg_6700_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_280_reg_6700_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_281_reg_6706_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_281_reg_6706_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_282_reg_6712_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_282_reg_6712_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_283_reg_6718_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_283_reg_6718_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_284_reg_6724_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_284_reg_6724_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_285_reg_6730_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_285_reg_6730_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_286_reg_6741_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_286_reg_6741_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_287_reg_6781_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_287_reg_6781_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_287_reg_6781_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_287_reg_6781_reg[4]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[10]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[18]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[18]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[2]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[2]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[34]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[42]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[42]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[50]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[50]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_63_reg_6122_reg[58]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_tmp_63_reg_6122_reg[58]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_64_reg_6522_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_64_reg_6522_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_65_reg_6528_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_65_reg_6528_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_66_reg_6534_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_66_reg_6534_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_67_reg_6540_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_67_reg_6540_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_68_reg_6546_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_68_reg_6546_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_69_reg_6552_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_69_reg_6552_reg[3]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_tmp_70_reg_6563_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_tmp_70_reg_6563_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_71_reg_6639_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_71_reg_6639_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_tmp_71_reg_6639_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tmp_71_reg_6639_reg[4]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_1_reg_6634_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_1_reg_6634_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_1_reg_6634_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_1_reg_6634_reg[4]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_trunc_ln18_2_reg_6604_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_trunc_ln18_2_reg_6604_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_3_reg_6644_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_3_reg_6644_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_3_reg_6644_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_3_reg_6644_reg[4]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_trunc_ln18_4_reg_6690_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_trunc_ln18_4_reg_6690_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_5_reg_6766_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_5_reg_6766_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_5_reg_6766_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_5_reg_6766_reg[4]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_trunc_ln18_6_reg_6736_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_trunc_ln18_6_reg_6736_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_7_reg_6776_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_7_reg_6776_reg[36]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln18_7_reg_6776_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln18_7_reg_6776_reg[4]_i_1_O_UNCONNECTED ;
  wire [2:2]\NLW_trunc_ln18_reg_6558_reg[3]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_trunc_ln18_reg_6558_reg[3]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_1_reg_6751_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_1_reg_6751_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_2_reg_6756_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_2_reg_6756_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_3_reg_6761_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_3_reg_6761_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_4_reg_6801_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_4_reg_6801_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_5_reg_6806_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_5_reg_6806_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_6_reg_6811_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_6_reg_6811_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_7_reg_6816_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_7_reg_6816_reg[5]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_trunc_ln25_reg_6746_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_trunc_ln25_reg_6746_reg[5]_i_1_O_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln107_fu_1077_p2_carry
       (.CI(1'b0),
        .CO({add_ln107_fu_1077_p2_carry_n_4,add_ln107_fu_1077_p2_carry_n_5,add_ln107_fu_1077_p2_carry_n_6,add_ln107_fu_1077_p2_carry_n_7}),
        .CYINIT(\shl_ln_reg_5046_reg_n_4_[2] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln107_fu_1077_p2[4:1]),
        .S({\shl_ln_reg_5046_reg_n_4_[6] ,\shl_ln_reg_5046_reg_n_4_[5] ,\shl_ln_reg_5046_reg_n_4_[4] ,\shl_ln_reg_5046_reg_n_4_[3] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln107_fu_1077_p2_carry__0
       (.CI(add_ln107_fu_1077_p2_carry_n_4),
        .CO({add_ln107_fu_1077_p2_carry__0_n_4,add_ln107_fu_1077_p2_carry__0_n_5,add_ln107_fu_1077_p2_carry__0_n_6,add_ln107_fu_1077_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln107_fu_1077_p2[8:5]),
        .S({\shl_ln_reg_5046_reg_n_4_[10] ,\shl_ln_reg_5046_reg_n_4_[9] ,\shl_ln_reg_5046_reg_n_4_[8] ,\shl_ln_reg_5046_reg_n_4_[7] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln107_fu_1077_p2_carry__1
       (.CI(add_ln107_fu_1077_p2_carry__0_n_4),
        .CO({NLW_add_ln107_fu_1077_p2_carry__1_CO_UNCONNECTED[3:2],add_ln107_fu_1077_p2_carry__1_n_6,add_ln107_fu_1077_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_add_ln107_fu_1077_p2_carry__1_O_UNCONNECTED[3],add_ln107_fu_1077_p2[11:9]}),
        .S({1'b0,\shl_ln_reg_5046_reg_n_4_[13] ,\shl_ln_reg_5046_reg_n_4_[12] ,\shl_ln_reg_5046_reg_n_4_[11] }));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[10]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[9]),
        .I1(and_ln21_2_cast_fu_2469_p31[9]),
        .O(\add_ln18_1_reg_6132[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[10]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[8]),
        .I1(and_ln21_2_cast_fu_2469_p31[8]),
        .O(\add_ln18_1_reg_6132[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[18]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[17]),
        .I1(and_ln21_2_cast_fu_2469_p31[17]),
        .O(\add_ln18_1_reg_6132[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[18]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[16]),
        .I1(and_ln21_2_cast_fu_2469_p31[16]),
        .O(\add_ln18_1_reg_6132[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[26]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[25]),
        .I1(and_ln21_2_cast_fu_2469_p31[25]),
        .O(\add_ln18_1_reg_6132[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[26]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[24]),
        .I1(and_ln21_2_cast_fu_2469_p31[24]),
        .O(\add_ln18_1_reg_6132[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[2]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[1]),
        .I1(and_ln21_2_cast_fu_2469_p31[1]),
        .O(\add_ln18_1_reg_6132[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[2]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[0]),
        .I1(and_ln21_2_cast_fu_2469_p31[0]),
        .O(\add_ln18_1_reg_6132[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[34]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[33]),
        .I1(and_ln21_2_cast_fu_2469_p31[33]),
        .O(\add_ln18_1_reg_6132[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[34]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[32]),
        .I1(and_ln21_2_cast_fu_2469_p31[32]),
        .O(\add_ln18_1_reg_6132[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[42]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[41]),
        .I1(and_ln21_2_cast_fu_2469_p31[41]),
        .O(\add_ln18_1_reg_6132[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[42]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[40]),
        .I1(and_ln21_2_cast_fu_2469_p31[40]),
        .O(\add_ln18_1_reg_6132[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[50]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[49]),
        .I1(and_ln21_2_cast_fu_2469_p31[49]),
        .O(\add_ln18_1_reg_6132[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[50]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[48]),
        .I1(and_ln21_2_cast_fu_2469_p31[48]),
        .O(\add_ln18_1_reg_6132[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[58]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[57]),
        .I1(and_ln21_2_cast_fu_2469_p31[57]),
        .O(\add_ln18_1_reg_6132[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_1_reg_6132[58]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[56]),
        .I1(and_ln21_2_cast_fu_2469_p31[56]),
        .O(\add_ln18_1_reg_6132[58]_i_3_n_4 ));
  FDRE \add_ln18_1_reg_6132_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[0]),
        .Q(add_ln18_1_reg_6132[0]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[10]),
        .Q(add_ln18_1_reg_6132[10]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[10]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[10],\NLW_add_ln18_1_reg_6132_reg[10]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[9:8]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[9:8]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[10]_i_2_n_4 ,\add_ln18_1_reg_6132[10]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[16]),
        .Q(add_ln18_1_reg_6132[16]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[17]),
        .Q(add_ln18_1_reg_6132[17]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[18]),
        .Q(add_ln18_1_reg_6132[18]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[18]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[18],\NLW_add_ln18_1_reg_6132_reg[18]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[17:16]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[17:16]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[18]_i_2_n_4 ,\add_ln18_1_reg_6132[18]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[1]),
        .Q(add_ln18_1_reg_6132[1]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[24]),
        .Q(add_ln18_1_reg_6132[24]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[25]),
        .Q(add_ln18_1_reg_6132[25]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[26]),
        .Q(add_ln18_1_reg_6132[26]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[26]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[26],\NLW_add_ln18_1_reg_6132_reg[26]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[25:24]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[25:24]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[26]_i_2_n_4 ,\add_ln18_1_reg_6132[26]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[2]),
        .Q(add_ln18_1_reg_6132[2]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[2]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[2],\NLW_add_ln18_1_reg_6132_reg[2]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[1:0]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[1:0]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[2]_i_2_n_4 ,\add_ln18_1_reg_6132[2]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[32]),
        .Q(add_ln18_1_reg_6132[32]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[33]),
        .Q(add_ln18_1_reg_6132[33]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[34]),
        .Q(add_ln18_1_reg_6132[34]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[34]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[34],\NLW_add_ln18_1_reg_6132_reg[34]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[33:32]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[33:32]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[34]_i_2_n_4 ,\add_ln18_1_reg_6132[34]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[40]),
        .Q(add_ln18_1_reg_6132[40]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[41]),
        .Q(add_ln18_1_reg_6132[41]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[42]),
        .Q(add_ln18_1_reg_6132[42]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[42]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[42],\NLW_add_ln18_1_reg_6132_reg[42]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[41:40]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[41:40]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[42]_i_2_n_4 ,\add_ln18_1_reg_6132[42]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[48]),
        .Q(add_ln18_1_reg_6132[48]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[49]),
        .Q(add_ln18_1_reg_6132[49]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[50]),
        .Q(add_ln18_1_reg_6132[50]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[50]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[50],\NLW_add_ln18_1_reg_6132_reg[50]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[49:48]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[49:48]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[50]_i_2_n_4 ,\add_ln18_1_reg_6132[50]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[56]),
        .Q(add_ln18_1_reg_6132[56]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[57]),
        .Q(add_ln18_1_reg_6132[57]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[58]),
        .Q(add_ln18_1_reg_6132[58]),
        .R(1'b0));
  CARRY4 \add_ln18_1_reg_6132_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_1_reg_6132_reg[58]_i_1_CO_UNCONNECTED [3],add_ln18_1_fu_2625_p2[58],\NLW_add_ln18_1_reg_6132_reg[58]_i_1_CO_UNCONNECTED [1],\add_ln18_1_reg_6132_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[57:56]}),
        .O({\NLW_add_ln18_1_reg_6132_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln18_1_fu_2625_p2[57:56]}),
        .S({1'b0,1'b1,\add_ln18_1_reg_6132[58]_i_2_n_4 ,\add_ln18_1_reg_6132[58]_i_3_n_4 }));
  FDRE \add_ln18_1_reg_6132_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[8]),
        .Q(add_ln18_1_reg_6132[8]),
        .R(1'b0));
  FDRE \add_ln18_1_reg_6132_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_1_fu_2625_p2[9]),
        .Q(add_ln18_1_reg_6132[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[10]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[9]),
        .I1(and_ln21_4_cast_fu_3704_p31[9]),
        .O(\add_ln18_2_reg_6614[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[10]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[8]),
        .I1(and_ln21_4_cast_fu_3704_p31[8]),
        .O(\add_ln18_2_reg_6614[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[18]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[17]),
        .I1(and_ln21_4_cast_fu_3704_p31[17]),
        .O(\add_ln18_2_reg_6614[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[18]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[16]),
        .I1(and_ln21_4_cast_fu_3704_p31[16]),
        .O(\add_ln18_2_reg_6614[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[26]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[25]),
        .I1(and_ln21_4_cast_fu_3704_p31[25]),
        .O(\add_ln18_2_reg_6614[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[26]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[24]),
        .I1(and_ln21_4_cast_fu_3704_p31[24]),
        .O(\add_ln18_2_reg_6614[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[2]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[1]),
        .I1(and_ln21_4_cast_fu_3704_p31[1]),
        .O(\add_ln18_2_reg_6614[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[2]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[0]),
        .I1(and_ln21_4_cast_fu_3704_p31[0]),
        .O(\add_ln18_2_reg_6614[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[34]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[33]),
        .I1(and_ln21_4_cast_fu_3704_p31[33]),
        .O(\add_ln18_2_reg_6614[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[34]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[32]),
        .I1(and_ln21_4_cast_fu_3704_p31[32]),
        .O(\add_ln18_2_reg_6614[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[42]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[41]),
        .I1(and_ln21_4_cast_fu_3704_p31[41]),
        .O(\add_ln18_2_reg_6614[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[42]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[40]),
        .I1(and_ln21_4_cast_fu_3704_p31[40]),
        .O(\add_ln18_2_reg_6614[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[50]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[49]),
        .I1(and_ln21_4_cast_fu_3704_p31[49]),
        .O(\add_ln18_2_reg_6614[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[50]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[48]),
        .I1(and_ln21_4_cast_fu_3704_p31[48]),
        .O(\add_ln18_2_reg_6614[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[58]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[57]),
        .I1(and_ln21_4_cast_fu_3704_p31[57]),
        .O(\add_ln18_2_reg_6614[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_2_reg_6614[58]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[56]),
        .I1(and_ln21_4_cast_fu_3704_p31[56]),
        .O(\add_ln18_2_reg_6614[58]_i_3_n_4 ));
  FDRE \add_ln18_2_reg_6614_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[0]),
        .Q(add_ln18_2_reg_6614[0]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[10] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[10]),
        .Q(add_ln18_2_reg_6614[10]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[10]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[10],\NLW_add_ln18_2_reg_6614_reg[10]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[9:8]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[9:8]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[10]_i_2_n_4 ,\add_ln18_2_reg_6614[10]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[16] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[16]),
        .Q(add_ln18_2_reg_6614[16]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[17] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[17]),
        .Q(add_ln18_2_reg_6614[17]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[18] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[18]),
        .Q(add_ln18_2_reg_6614[18]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[18]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[18],\NLW_add_ln18_2_reg_6614_reg[18]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[17:16]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[17:16]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[18]_i_2_n_4 ,\add_ln18_2_reg_6614[18]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[1]),
        .Q(add_ln18_2_reg_6614[1]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[24] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[24]),
        .Q(add_ln18_2_reg_6614[24]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[25] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[25]),
        .Q(add_ln18_2_reg_6614[25]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[26] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[26]),
        .Q(add_ln18_2_reg_6614[26]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[26]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[26],\NLW_add_ln18_2_reg_6614_reg[26]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[25:24]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[25:24]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[26]_i_2_n_4 ,\add_ln18_2_reg_6614[26]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[2]),
        .Q(add_ln18_2_reg_6614[2]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[2]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[2],\NLW_add_ln18_2_reg_6614_reg[2]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[1:0]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[1:0]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[2]_i_2_n_4 ,\add_ln18_2_reg_6614[2]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[32] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[32]),
        .Q(add_ln18_2_reg_6614[32]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[33] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[33]),
        .Q(add_ln18_2_reg_6614[33]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[34] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[34]),
        .Q(add_ln18_2_reg_6614[34]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[34]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[34],\NLW_add_ln18_2_reg_6614_reg[34]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[33:32]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[33:32]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[34]_i_2_n_4 ,\add_ln18_2_reg_6614[34]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[40] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[40]),
        .Q(add_ln18_2_reg_6614[40]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[41] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[41]),
        .Q(add_ln18_2_reg_6614[41]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[42] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[42]),
        .Q(add_ln18_2_reg_6614[42]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[42]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[42],\NLW_add_ln18_2_reg_6614_reg[42]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[41:40]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[41:40]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[42]_i_2_n_4 ,\add_ln18_2_reg_6614[42]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[48] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[48]),
        .Q(add_ln18_2_reg_6614[48]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[49] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[49]),
        .Q(add_ln18_2_reg_6614[49]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[50] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[50]),
        .Q(add_ln18_2_reg_6614[50]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[50]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[50],\NLW_add_ln18_2_reg_6614_reg[50]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[49:48]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[49:48]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[50]_i_2_n_4 ,\add_ln18_2_reg_6614[50]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[56] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[56]),
        .Q(add_ln18_2_reg_6614[56]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[57] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[57]),
        .Q(add_ln18_2_reg_6614[57]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[58] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[58]),
        .Q(add_ln18_2_reg_6614[58]),
        .R(1'b0));
  CARRY4 \add_ln18_2_reg_6614_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_2_reg_6614_reg[58]_i_1_CO_UNCONNECTED [3],add_ln18_2_fu_3860_p2[58],\NLW_add_ln18_2_reg_6614_reg[58]_i_1_CO_UNCONNECTED [1],\add_ln18_2_reg_6614_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[57:56]}),
        .O({\NLW_add_ln18_2_reg_6614_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln18_2_fu_3860_p2[57:56]}),
        .S({1'b0,1'b1,\add_ln18_2_reg_6614[58]_i_2_n_4 ,\add_ln18_2_reg_6614[58]_i_3_n_4 }));
  FDRE \add_ln18_2_reg_6614_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[8]),
        .Q(add_ln18_2_reg_6614[8]),
        .R(1'b0));
  FDRE \add_ln18_2_reg_6614_reg[9] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_2_fu_3860_p2[9]),
        .Q(add_ln18_2_reg_6614[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[10]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[9]),
        .I1(and_ln21_6_cast_fu_3932_p31[9]),
        .O(\add_ln18_3_reg_6624[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[10]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[8]),
        .I1(and_ln21_6_cast_fu_3932_p31[8]),
        .O(\add_ln18_3_reg_6624[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[18]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[17]),
        .I1(and_ln21_6_cast_fu_3932_p31[17]),
        .O(\add_ln18_3_reg_6624[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[18]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[16]),
        .I1(and_ln21_6_cast_fu_3932_p31[16]),
        .O(\add_ln18_3_reg_6624[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[26]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[25]),
        .I1(and_ln21_6_cast_fu_3932_p31[25]),
        .O(\add_ln18_3_reg_6624[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[26]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[24]),
        .I1(and_ln21_6_cast_fu_3932_p31[24]),
        .O(\add_ln18_3_reg_6624[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[2]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[1]),
        .I1(and_ln21_6_cast_fu_3932_p31[1]),
        .O(\add_ln18_3_reg_6624[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[2]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[0]),
        .I1(and_ln21_6_cast_fu_3932_p31[0]),
        .O(\add_ln18_3_reg_6624[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[34]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[33]),
        .I1(and_ln21_6_cast_fu_3932_p31[33]),
        .O(\add_ln18_3_reg_6624[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[34]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[32]),
        .I1(and_ln21_6_cast_fu_3932_p31[32]),
        .O(\add_ln18_3_reg_6624[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[42]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[41]),
        .I1(and_ln21_6_cast_fu_3932_p31[41]),
        .O(\add_ln18_3_reg_6624[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[42]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[40]),
        .I1(and_ln21_6_cast_fu_3932_p31[40]),
        .O(\add_ln18_3_reg_6624[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[50]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[49]),
        .I1(and_ln21_6_cast_fu_3932_p31[49]),
        .O(\add_ln18_3_reg_6624[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[50]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[48]),
        .I1(and_ln21_6_cast_fu_3932_p31[48]),
        .O(\add_ln18_3_reg_6624[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[58]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[57]),
        .I1(and_ln21_6_cast_fu_3932_p31[57]),
        .O(\add_ln18_3_reg_6624[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_3_reg_6624[58]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[56]),
        .I1(and_ln21_6_cast_fu_3932_p31[56]),
        .O(\add_ln18_3_reg_6624[58]_i_3_n_4 ));
  FDRE \add_ln18_3_reg_6624_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[0]),
        .Q(add_ln18_3_reg_6624[0]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[10] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[10]),
        .Q(add_ln18_3_reg_6624[10]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[10]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[10],\NLW_add_ln18_3_reg_6624_reg[10]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[9:8]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[9:8]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[10]_i_2_n_4 ,\add_ln18_3_reg_6624[10]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[16] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[16]),
        .Q(add_ln18_3_reg_6624[16]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[17] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[17]),
        .Q(add_ln18_3_reg_6624[17]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[18] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[18]),
        .Q(add_ln18_3_reg_6624[18]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[18]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[18],\NLW_add_ln18_3_reg_6624_reg[18]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[17:16]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[17:16]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[18]_i_2_n_4 ,\add_ln18_3_reg_6624[18]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[1]),
        .Q(add_ln18_3_reg_6624[1]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[24] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[24]),
        .Q(add_ln18_3_reg_6624[24]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[25] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[25]),
        .Q(add_ln18_3_reg_6624[25]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[26] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[26]),
        .Q(add_ln18_3_reg_6624[26]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[26]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[26],\NLW_add_ln18_3_reg_6624_reg[26]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[25:24]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[25:24]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[26]_i_2_n_4 ,\add_ln18_3_reg_6624[26]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[2]),
        .Q(add_ln18_3_reg_6624[2]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[2]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[2],\NLW_add_ln18_3_reg_6624_reg[2]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[1:0]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[1:0]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[2]_i_2_n_4 ,\add_ln18_3_reg_6624[2]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[32] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[32]),
        .Q(add_ln18_3_reg_6624[32]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[33] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[33]),
        .Q(add_ln18_3_reg_6624[33]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[34] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[34]),
        .Q(add_ln18_3_reg_6624[34]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[34]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[34],\NLW_add_ln18_3_reg_6624_reg[34]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[33:32]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[33:32]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[34]_i_2_n_4 ,\add_ln18_3_reg_6624[34]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[40] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[40]),
        .Q(add_ln18_3_reg_6624[40]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[41] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[41]),
        .Q(add_ln18_3_reg_6624[41]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[42] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[42]),
        .Q(add_ln18_3_reg_6624[42]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[42]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[42],\NLW_add_ln18_3_reg_6624_reg[42]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[41:40]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[41:40]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[42]_i_2_n_4 ,\add_ln18_3_reg_6624[42]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[48] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[48]),
        .Q(add_ln18_3_reg_6624[48]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[49] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[49]),
        .Q(add_ln18_3_reg_6624[49]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[50] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[50]),
        .Q(add_ln18_3_reg_6624[50]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[50]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[50],\NLW_add_ln18_3_reg_6624_reg[50]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[49:48]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[49:48]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[50]_i_2_n_4 ,\add_ln18_3_reg_6624[50]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[56] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[56]),
        .Q(add_ln18_3_reg_6624[56]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[57] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[57]),
        .Q(add_ln18_3_reg_6624[57]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[58] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[58]),
        .Q(add_ln18_3_reg_6624[58]),
        .R(1'b0));
  CARRY4 \add_ln18_3_reg_6624_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_3_reg_6624_reg[58]_i_1_CO_UNCONNECTED [3],add_ln18_3_fu_4088_p2[58],\NLW_add_ln18_3_reg_6624_reg[58]_i_1_CO_UNCONNECTED [1],\add_ln18_3_reg_6624_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[57:56]}),
        .O({\NLW_add_ln18_3_reg_6624_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln18_3_fu_4088_p2[57:56]}),
        .S({1'b0,1'b1,\add_ln18_3_reg_6624[58]_i_2_n_4 ,\add_ln18_3_reg_6624[58]_i_3_n_4 }));
  FDRE \add_ln18_3_reg_6624_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[8]),
        .Q(add_ln18_3_reg_6624[8]),
        .R(1'b0));
  FDRE \add_ln18_3_reg_6624_reg[9] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln18_3_fu_4088_p2[9]),
        .Q(add_ln18_3_reg_6624[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[10]_i_2 
       (.I0(zext_ln21_fu_2290_p1[9]),
        .I1(zext_ln21_1_fu_2393_p1[9]),
        .O(\add_ln18_reg_6127[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[10]_i_3 
       (.I0(zext_ln21_fu_2290_p1[8]),
        .I1(zext_ln21_1_fu_2393_p1[8]),
        .O(\add_ln18_reg_6127[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[18]_i_2 
       (.I0(zext_ln21_fu_2290_p1[17]),
        .I1(zext_ln21_1_fu_2393_p1[17]),
        .O(\add_ln18_reg_6127[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[18]_i_3 
       (.I0(zext_ln21_fu_2290_p1[16]),
        .I1(zext_ln21_1_fu_2393_p1[16]),
        .O(\add_ln18_reg_6127[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[26]_i_2 
       (.I0(zext_ln21_fu_2290_p1[25]),
        .I1(zext_ln21_1_fu_2393_p1[25]),
        .O(\add_ln18_reg_6127[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[26]_i_3 
       (.I0(zext_ln21_fu_2290_p1[24]),
        .I1(zext_ln21_1_fu_2393_p1[24]),
        .O(\add_ln18_reg_6127[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[2]_i_2 
       (.I0(zext_ln21_fu_2290_p1[1]),
        .I1(zext_ln21_1_fu_2393_p1[1]),
        .O(\add_ln18_reg_6127[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[2]_i_3 
       (.I0(zext_ln21_fu_2290_p1[0]),
        .I1(zext_ln21_1_fu_2393_p1[0]),
        .O(\add_ln18_reg_6127[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[34]_i_2 
       (.I0(zext_ln21_fu_2290_p1[33]),
        .I1(zext_ln21_1_fu_2393_p1[33]),
        .O(\add_ln18_reg_6127[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[34]_i_3 
       (.I0(zext_ln21_fu_2290_p1[32]),
        .I1(zext_ln21_1_fu_2393_p1[32]),
        .O(\add_ln18_reg_6127[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[42]_i_2 
       (.I0(zext_ln21_fu_2290_p1[41]),
        .I1(zext_ln21_1_fu_2393_p1[41]),
        .O(\add_ln18_reg_6127[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[42]_i_3 
       (.I0(zext_ln21_fu_2290_p1[40]),
        .I1(zext_ln21_1_fu_2393_p1[40]),
        .O(\add_ln18_reg_6127[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[50]_i_2 
       (.I0(zext_ln21_fu_2290_p1[49]),
        .I1(zext_ln21_1_fu_2393_p1[49]),
        .O(\add_ln18_reg_6127[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[50]_i_3 
       (.I0(zext_ln21_fu_2290_p1[48]),
        .I1(zext_ln21_1_fu_2393_p1[48]),
        .O(\add_ln18_reg_6127[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[58]_i_2 
       (.I0(zext_ln21_fu_2290_p1[57]),
        .I1(zext_ln21_1_fu_2393_p1[57]),
        .O(\add_ln18_reg_6127[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln18_reg_6127[58]_i_3 
       (.I0(zext_ln21_fu_2290_p1[56]),
        .I1(zext_ln21_1_fu_2393_p1[56]),
        .O(\add_ln18_reg_6127[58]_i_3_n_4 ));
  FDRE \add_ln18_reg_6127_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[0]),
        .Q(add_ln18_reg_6127[0]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[10]),
        .Q(add_ln18_reg_6127[10]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[10]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[10],\NLW_add_ln18_reg_6127_reg[10]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[9:8]}),
        .O({\NLW_add_ln18_reg_6127_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[9:8]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[10]_i_2_n_4 ,\add_ln18_reg_6127[10]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[16]),
        .Q(add_ln18_reg_6127[16]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[17]),
        .Q(add_ln18_reg_6127[17]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[18]),
        .Q(add_ln18_reg_6127[18]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[18]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[18],\NLW_add_ln18_reg_6127_reg[18]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[17:16]}),
        .O({\NLW_add_ln18_reg_6127_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[17:16]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[18]_i_2_n_4 ,\add_ln18_reg_6127[18]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[1]),
        .Q(add_ln18_reg_6127[1]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[24]),
        .Q(add_ln18_reg_6127[24]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[25]),
        .Q(add_ln18_reg_6127[25]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[26]),
        .Q(add_ln18_reg_6127[26]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[26]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[26],\NLW_add_ln18_reg_6127_reg[26]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[25:24]}),
        .O({\NLW_add_ln18_reg_6127_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[25:24]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[26]_i_2_n_4 ,\add_ln18_reg_6127[26]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[2]),
        .Q(add_ln18_reg_6127[2]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[2]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[2],\NLW_add_ln18_reg_6127_reg[2]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[1:0]}),
        .O({\NLW_add_ln18_reg_6127_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[1:0]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[2]_i_2_n_4 ,\add_ln18_reg_6127[2]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[32]),
        .Q(add_ln18_reg_6127[32]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[33]),
        .Q(add_ln18_reg_6127[33]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[34]),
        .Q(add_ln18_reg_6127[34]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[34]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[34],\NLW_add_ln18_reg_6127_reg[34]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[33:32]}),
        .O({\NLW_add_ln18_reg_6127_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[33:32]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[34]_i_2_n_4 ,\add_ln18_reg_6127[34]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[40]),
        .Q(add_ln18_reg_6127[40]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[41]),
        .Q(add_ln18_reg_6127[41]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[42]),
        .Q(add_ln18_reg_6127[42]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[42]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[42],\NLW_add_ln18_reg_6127_reg[42]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[41:40]}),
        .O({\NLW_add_ln18_reg_6127_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[41:40]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[42]_i_2_n_4 ,\add_ln18_reg_6127[42]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[48]),
        .Q(add_ln18_reg_6127[48]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[49]),
        .Q(add_ln18_reg_6127[49]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[50]),
        .Q(add_ln18_reg_6127[50]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[50]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[50],\NLW_add_ln18_reg_6127_reg[50]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[49:48]}),
        .O({\NLW_add_ln18_reg_6127_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[49:48]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[50]_i_2_n_4 ,\add_ln18_reg_6127[50]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[56]),
        .Q(add_ln18_reg_6127[56]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[57]),
        .Q(add_ln18_reg_6127[57]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[58]),
        .Q(add_ln18_reg_6127[58]),
        .R(1'b0));
  CARRY4 \add_ln18_reg_6127_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_add_ln18_reg_6127_reg[58]_i_1_CO_UNCONNECTED [3],add_ln18_fu_2413_p2[58],\NLW_add_ln18_reg_6127_reg[58]_i_1_CO_UNCONNECTED [1],\add_ln18_reg_6127_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_fu_2290_p1[57:56]}),
        .O({\NLW_add_ln18_reg_6127_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln18_fu_2413_p2[57:56]}),
        .S({1'b0,1'b1,\add_ln18_reg_6127[58]_i_2_n_4 ,\add_ln18_reg_6127[58]_i_3_n_4 }));
  FDRE \add_ln18_reg_6127_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[8]),
        .Q(add_ln18_reg_6127[8]),
        .R(1'b0));
  FDRE \add_ln18_reg_6127_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln18_fu_2413_p2[9]),
        .Q(add_ln18_reg_6127[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[3]_i_2 
       (.I0(trunc_ln25_5_reg_6806[3]),
        .I1(trunc_ln25_4_reg_6801[3]),
        .O(\add_ln26_1_reg_6832[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[3]_i_3 
       (.I0(trunc_ln25_5_reg_6806[2]),
        .I1(trunc_ln25_4_reg_6801[2]),
        .O(\add_ln26_1_reg_6832[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[3]_i_4 
       (.I0(trunc_ln25_5_reg_6806[1]),
        .I1(trunc_ln25_4_reg_6801[1]),
        .O(\add_ln26_1_reg_6832[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[3]_i_5 
       (.I0(trunc_ln25_5_reg_6806[0]),
        .I1(trunc_ln25_4_reg_6801[0]),
        .O(\add_ln26_1_reg_6832[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[6]_i_2 
       (.I0(trunc_ln25_5_reg_6806[5]),
        .I1(trunc_ln25_4_reg_6801[5]),
        .O(\add_ln26_1_reg_6832[6]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_1_reg_6832[6]_i_3 
       (.I0(trunc_ln25_5_reg_6806[4]),
        .I1(trunc_ln25_4_reg_6801[4]),
        .O(\add_ln26_1_reg_6832[6]_i_3_n_4 ));
  FDRE \add_ln26_1_reg_6832_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[0]),
        .Q(add_ln26_1_reg_6832[0]),
        .R(1'b0));
  FDRE \add_ln26_1_reg_6832_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[1]),
        .Q(add_ln26_1_reg_6832[1]),
        .R(1'b0));
  FDRE \add_ln26_1_reg_6832_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[2]),
        .Q(add_ln26_1_reg_6832[2]),
        .R(1'b0));
  FDRE \add_ln26_1_reg_6832_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[3]),
        .Q(add_ln26_1_reg_6832[3]),
        .R(1'b0));
  CARRY4 \add_ln26_1_reg_6832_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\add_ln26_1_reg_6832_reg[3]_i_1_n_4 ,\add_ln26_1_reg_6832_reg[3]_i_1_n_5 ,\add_ln26_1_reg_6832_reg[3]_i_1_n_6 ,\add_ln26_1_reg_6832_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(trunc_ln25_5_reg_6806[3:0]),
        .O(add_ln26_1_fu_4718_p2[3:0]),
        .S({\add_ln26_1_reg_6832[3]_i_2_n_4 ,\add_ln26_1_reg_6832[3]_i_3_n_4 ,\add_ln26_1_reg_6832[3]_i_4_n_4 ,\add_ln26_1_reg_6832[3]_i_5_n_4 }));
  FDRE \add_ln26_1_reg_6832_reg[4] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[4]),
        .Q(add_ln26_1_reg_6832[4]),
        .R(1'b0));
  FDRE \add_ln26_1_reg_6832_reg[5] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[5]),
        .Q(add_ln26_1_reg_6832[5]),
        .R(1'b0));
  FDRE \add_ln26_1_reg_6832_reg[6] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_1_fu_4718_p2[6]),
        .Q(add_ln26_1_reg_6832[6]),
        .R(1'b0));
  CARRY4 \add_ln26_1_reg_6832_reg[6]_i_1 
       (.CI(\add_ln26_1_reg_6832_reg[3]_i_1_n_4 ),
        .CO({\NLW_add_ln26_1_reg_6832_reg[6]_i_1_CO_UNCONNECTED [3],add_ln26_1_fu_4718_p2[6],\NLW_add_ln26_1_reg_6832_reg[6]_i_1_CO_UNCONNECTED [1],\add_ln26_1_reg_6832_reg[6]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,trunc_ln25_5_reg_6806[5:4]}),
        .O({\NLW_add_ln26_1_reg_6832_reg[6]_i_1_O_UNCONNECTED [3:2],add_ln26_1_fu_4718_p2[5:4]}),
        .S({1'b0,1'b1,\add_ln26_1_reg_6832[6]_i_2_n_4 ,\add_ln26_1_reg_6832[6]_i_3_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[3]_i_2 
       (.I0(trunc_ln25_7_reg_6816[3]),
        .I1(trunc_ln25_6_reg_6811[3]),
        .O(\add_ln26_2_reg_6837[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[3]_i_3 
       (.I0(trunc_ln25_7_reg_6816[2]),
        .I1(trunc_ln25_6_reg_6811[2]),
        .O(\add_ln26_2_reg_6837[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[3]_i_4 
       (.I0(trunc_ln25_7_reg_6816[1]),
        .I1(trunc_ln25_6_reg_6811[1]),
        .O(\add_ln26_2_reg_6837[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[3]_i_5 
       (.I0(trunc_ln25_7_reg_6816[0]),
        .I1(trunc_ln25_6_reg_6811[0]),
        .O(\add_ln26_2_reg_6837[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[6]_i_2 
       (.I0(trunc_ln25_7_reg_6816[5]),
        .I1(trunc_ln25_6_reg_6811[5]),
        .O(\add_ln26_2_reg_6837[6]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_2_reg_6837[6]_i_3 
       (.I0(trunc_ln25_7_reg_6816[4]),
        .I1(trunc_ln25_6_reg_6811[4]),
        .O(\add_ln26_2_reg_6837[6]_i_3_n_4 ));
  FDRE \add_ln26_2_reg_6837_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[0]),
        .Q(add_ln26_2_reg_6837[0]),
        .R(1'b0));
  FDRE \add_ln26_2_reg_6837_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[1]),
        .Q(add_ln26_2_reg_6837[1]),
        .R(1'b0));
  FDRE \add_ln26_2_reg_6837_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[2]),
        .Q(add_ln26_2_reg_6837[2]),
        .R(1'b0));
  FDRE \add_ln26_2_reg_6837_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[3]),
        .Q(add_ln26_2_reg_6837[3]),
        .R(1'b0));
  CARRY4 \add_ln26_2_reg_6837_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\add_ln26_2_reg_6837_reg[3]_i_1_n_4 ,\add_ln26_2_reg_6837_reg[3]_i_1_n_5 ,\add_ln26_2_reg_6837_reg[3]_i_1_n_6 ,\add_ln26_2_reg_6837_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(trunc_ln25_7_reg_6816[3:0]),
        .O(add_ln26_2_fu_4722_p2[3:0]),
        .S({\add_ln26_2_reg_6837[3]_i_2_n_4 ,\add_ln26_2_reg_6837[3]_i_3_n_4 ,\add_ln26_2_reg_6837[3]_i_4_n_4 ,\add_ln26_2_reg_6837[3]_i_5_n_4 }));
  FDRE \add_ln26_2_reg_6837_reg[4] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[4]),
        .Q(add_ln26_2_reg_6837[4]),
        .R(1'b0));
  FDRE \add_ln26_2_reg_6837_reg[5] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[5]),
        .Q(add_ln26_2_reg_6837[5]),
        .R(1'b0));
  FDRE \add_ln26_2_reg_6837_reg[6] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln26_2_fu_4722_p2[6]),
        .Q(add_ln26_2_reg_6837[6]),
        .R(1'b0));
  CARRY4 \add_ln26_2_reg_6837_reg[6]_i_1 
       (.CI(\add_ln26_2_reg_6837_reg[3]_i_1_n_4 ),
        .CO({\NLW_add_ln26_2_reg_6837_reg[6]_i_1_CO_UNCONNECTED [3],add_ln26_2_fu_4722_p2[6],\NLW_add_ln26_2_reg_6837_reg[6]_i_1_CO_UNCONNECTED [1],\add_ln26_2_reg_6837_reg[6]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,trunc_ln25_7_reg_6816[5:4]}),
        .O({\NLW_add_ln26_2_reg_6837_reg[6]_i_1_O_UNCONNECTED [3:2],add_ln26_2_fu_4722_p2[5:4]}),
        .S({1'b0,1'b1,\add_ln26_2_reg_6837[6]_i_2_n_4 ,\add_ln26_2_reg_6837[6]_i_3_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[3]_i_2 
       (.I0(trunc_ln25_3_reg_6761[3]),
        .I1(trunc_ln25_2_reg_6756[3]),
        .O(\add_ln26_reg_6796[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[3]_i_3 
       (.I0(trunc_ln25_3_reg_6761[2]),
        .I1(trunc_ln25_2_reg_6756[2]),
        .O(\add_ln26_reg_6796[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[3]_i_4 
       (.I0(trunc_ln25_3_reg_6761[1]),
        .I1(trunc_ln25_2_reg_6756[1]),
        .O(\add_ln26_reg_6796[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[3]_i_5 
       (.I0(trunc_ln25_3_reg_6761[0]),
        .I1(trunc_ln25_2_reg_6756[0]),
        .O(\add_ln26_reg_6796[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[6]_i_2 
       (.I0(trunc_ln25_3_reg_6761[5]),
        .I1(trunc_ln25_2_reg_6756[5]),
        .O(\add_ln26_reg_6796[6]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln26_reg_6796[6]_i_3 
       (.I0(trunc_ln25_3_reg_6761[4]),
        .I1(trunc_ln25_2_reg_6756[4]),
        .O(\add_ln26_reg_6796[6]_i_3_n_4 ));
  FDRE \add_ln26_reg_6796_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[0]),
        .Q(add_ln26_reg_6796[0]),
        .R(1'b0));
  FDRE \add_ln26_reg_6796_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[1]),
        .Q(add_ln26_reg_6796[1]),
        .R(1'b0));
  FDRE \add_ln26_reg_6796_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[2]),
        .Q(add_ln26_reg_6796[2]),
        .R(1'b0));
  FDRE \add_ln26_reg_6796_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[3]),
        .Q(add_ln26_reg_6796[3]),
        .R(1'b0));
  CARRY4 \add_ln26_reg_6796_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\add_ln26_reg_6796_reg[3]_i_1_n_4 ,\add_ln26_reg_6796_reg[3]_i_1_n_5 ,\add_ln26_reg_6796_reg[3]_i_1_n_6 ,\add_ln26_reg_6796_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(trunc_ln25_3_reg_6761[3:0]),
        .O(add_ln26_fu_4662_p2[3:0]),
        .S({\add_ln26_reg_6796[3]_i_2_n_4 ,\add_ln26_reg_6796[3]_i_3_n_4 ,\add_ln26_reg_6796[3]_i_4_n_4 ,\add_ln26_reg_6796[3]_i_5_n_4 }));
  FDRE \add_ln26_reg_6796_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[4]),
        .Q(add_ln26_reg_6796[4]),
        .R(1'b0));
  FDRE \add_ln26_reg_6796_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[5]),
        .Q(add_ln26_reg_6796[5]),
        .R(1'b0));
  FDRE \add_ln26_reg_6796_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln26_fu_4662_p2[6]),
        .Q(add_ln26_reg_6796[6]),
        .R(1'b0));
  CARRY4 \add_ln26_reg_6796_reg[6]_i_1 
       (.CI(\add_ln26_reg_6796_reg[3]_i_1_n_4 ),
        .CO({\NLW_add_ln26_reg_6796_reg[6]_i_1_CO_UNCONNECTED [3],add_ln26_fu_4662_p2[6],\NLW_add_ln26_reg_6796_reg[6]_i_1_CO_UNCONNECTED [1],\add_ln26_reg_6796_reg[6]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,trunc_ln25_3_reg_6761[5:4]}),
        .O({\NLW_add_ln26_reg_6796_reg[6]_i_1_O_UNCONNECTED [3:2],add_ln26_fu_4662_p2[5:4]}),
        .S({1'b0,1'b1,\add_ln26_reg_6796[6]_i_2_n_4 ,\add_ln26_reg_6796[6]_i_3_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[3]_i_2 
       (.I0(add_ln26_reg_6796[3]),
        .I1(add_ln26_2_reg_6837[3]),
        .O(\add_ln36_1_reg_6858[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[3]_i_3 
       (.I0(add_ln26_reg_6796[2]),
        .I1(add_ln26_2_reg_6837[2]),
        .O(\add_ln36_1_reg_6858[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[3]_i_4 
       (.I0(add_ln26_reg_6796[1]),
        .I1(add_ln26_2_reg_6837[1]),
        .O(\add_ln36_1_reg_6858[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[3]_i_5 
       (.I0(add_ln26_reg_6796[0]),
        .I1(add_ln26_2_reg_6837[0]),
        .O(\add_ln36_1_reg_6858[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[7]_i_2 
       (.I0(add_ln26_reg_6796[6]),
        .I1(add_ln26_2_reg_6837[6]),
        .O(\add_ln36_1_reg_6858[7]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[7]_i_3 
       (.I0(add_ln26_reg_6796[5]),
        .I1(add_ln26_2_reg_6837[5]),
        .O(\add_ln36_1_reg_6858[7]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_1_reg_6858[7]_i_4 
       (.I0(add_ln26_reg_6796[4]),
        .I1(add_ln26_2_reg_6837[4]),
        .O(\add_ln36_1_reg_6858[7]_i_4_n_4 ));
  FDRE \add_ln36_1_reg_6858_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[0]),
        .Q(add_ln36_1_reg_6858[0]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[1]),
        .Q(add_ln36_1_reg_6858[1]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[2]),
        .Q(add_ln36_1_reg_6858[2]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[3]),
        .Q(add_ln36_1_reg_6858[3]),
        .R(1'b0));
  CARRY4 \add_ln36_1_reg_6858_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\add_ln36_1_reg_6858_reg[3]_i_1_n_4 ,\add_ln36_1_reg_6858_reg[3]_i_1_n_5 ,\add_ln36_1_reg_6858_reg[3]_i_1_n_6 ,\add_ln36_1_reg_6858_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(add_ln26_reg_6796[3:0]),
        .O(add_ln36_1_fu_4762_p2[3:0]),
        .S({\add_ln36_1_reg_6858[3]_i_2_n_4 ,\add_ln36_1_reg_6858[3]_i_3_n_4 ,\add_ln36_1_reg_6858[3]_i_4_n_4 ,\add_ln36_1_reg_6858[3]_i_5_n_4 }));
  FDRE \add_ln36_1_reg_6858_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[4]),
        .Q(add_ln36_1_reg_6858[4]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[5]),
        .Q(add_ln36_1_reg_6858[5]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[6]),
        .Q(add_ln36_1_reg_6858[6]),
        .R(1'b0));
  FDRE \add_ln36_1_reg_6858_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_1_fu_4762_p2[7]),
        .Q(add_ln36_1_reg_6858[7]),
        .R(1'b0));
  CARRY4 \add_ln36_1_reg_6858_reg[7]_i_1 
       (.CI(\add_ln36_1_reg_6858_reg[3]_i_1_n_4 ),
        .CO({add_ln36_1_fu_4762_p2[7],\NLW_add_ln36_1_reg_6858_reg[7]_i_1_CO_UNCONNECTED [2],\add_ln36_1_reg_6858_reg[7]_i_1_n_6 ,\add_ln36_1_reg_6858_reg[7]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln26_reg_6796[6:4]}),
        .O({\NLW_add_ln36_1_reg_6858_reg[7]_i_1_O_UNCONNECTED [3],add_ln36_1_fu_4762_p2[6:4]}),
        .S({1'b1,\add_ln36_1_reg_6858[7]_i_2_n_4 ,\add_ln36_1_reg_6858[7]_i_3_n_4 ,\add_ln36_1_reg_6858[7]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[3]_i_2 
       (.I0(dist_reg_6791[3]),
        .I1(add_ln26_1_reg_6832[3]),
        .O(\add_ln36_reg_6853[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[3]_i_3 
       (.I0(dist_reg_6791[2]),
        .I1(add_ln26_1_reg_6832[2]),
        .O(\add_ln36_reg_6853[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[3]_i_4 
       (.I0(dist_reg_6791[1]),
        .I1(add_ln26_1_reg_6832[1]),
        .O(\add_ln36_reg_6853[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[3]_i_5 
       (.I0(dist_reg_6791[0]),
        .I1(add_ln26_1_reg_6832[0]),
        .O(\add_ln36_reg_6853[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[7]_i_2 
       (.I0(dist_reg_6791[6]),
        .I1(add_ln26_1_reg_6832[6]),
        .O(\add_ln36_reg_6853[7]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[7]_i_3 
       (.I0(dist_reg_6791[5]),
        .I1(add_ln26_1_reg_6832[5]),
        .O(\add_ln36_reg_6853[7]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln36_reg_6853[7]_i_4 
       (.I0(dist_reg_6791[4]),
        .I1(add_ln26_1_reg_6832[4]),
        .O(\add_ln36_reg_6853[7]_i_4_n_4 ));
  FDRE \add_ln36_reg_6853_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[0]),
        .Q(add_ln36_reg_6853[0]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[1]),
        .Q(add_ln36_reg_6853[1]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[2]),
        .Q(add_ln36_reg_6853[2]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[3]),
        .Q(add_ln36_reg_6853[3]),
        .R(1'b0));
  CARRY4 \add_ln36_reg_6853_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\add_ln36_reg_6853_reg[3]_i_1_n_4 ,\add_ln36_reg_6853_reg[3]_i_1_n_5 ,\add_ln36_reg_6853_reg[3]_i_1_n_6 ,\add_ln36_reg_6853_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(dist_reg_6791[3:0]),
        .O(add_ln36_fu_4756_p2[3:0]),
        .S({\add_ln36_reg_6853[3]_i_2_n_4 ,\add_ln36_reg_6853[3]_i_3_n_4 ,\add_ln36_reg_6853[3]_i_4_n_4 ,\add_ln36_reg_6853[3]_i_5_n_4 }));
  FDRE \add_ln36_reg_6853_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[4]),
        .Q(add_ln36_reg_6853[4]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[5]),
        .Q(add_ln36_reg_6853[5]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[6]),
        .Q(add_ln36_reg_6853[6]),
        .R(1'b0));
  FDRE \add_ln36_reg_6853_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln36_fu_4756_p2[7]),
        .Q(add_ln36_reg_6853[7]),
        .R(1'b0));
  CARRY4 \add_ln36_reg_6853_reg[7]_i_1 
       (.CI(\add_ln36_reg_6853_reg[3]_i_1_n_4 ),
        .CO({add_ln36_fu_4756_p2[7],\NLW_add_ln36_reg_6853_reg[7]_i_1_CO_UNCONNECTED [2],\add_ln36_reg_6853_reg[7]_i_1_n_6 ,\add_ln36_reg_6853_reg[7]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,dist_reg_6791[6:4]}),
        .O({\NLW_add_ln36_reg_6853_reg[7]_i_1_O_UNCONNECTED [3],add_ln36_fu_4756_p2[6:4]}),
        .S({1'b1,\add_ln36_reg_6853[7]_i_2_n_4 ,\add_ln36_reg_6853[7]_i_3_n_4 ,\add_ln36_reg_6853[7]_i_4_n_4 }));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hEFEE)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_CS_fsm_pp0_stage3),
        .I1(ap_NS_fsm1),
        .I2(\ap_CS_fsm[1]_i_2_n_4 ),
        .I3(ap_CS_fsm_pp0_stage0),
        .O(ap_NS_fsm[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \ap_CS_fsm[0]_i_2 
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(Q),
        .I2(icmp_ln107_reg_5042_pp0_iter2_reg),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(ap_enable_reg_pp0_iter0),
        .O(ap_NS_fsm1));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_CS_fsm_pp0_stage3),
        .I1(Q),
        .I2(ap_CS_fsm_pp0_stage2),
        .I3(\ap_CS_fsm[1]_i_2_n_4 ),
        .O(ap_NS_fsm[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ap_CS_fsm[1]_i_2 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(\ap_CS_fsm[1]_i_2_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hEF00FF00)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(ap_enable_reg_pp0_iter0),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(icmp_ln107_reg_5042_pp0_iter2_reg),
        .I3(Q),
        .I4(ap_enable_reg_pp0_iter2),
        .O(ap_NS_fsm[2]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(ap_CS_fsm_pp0_stage0),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(Q),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_pp0_stage2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_pp0_stage2),
        .Q(ap_CS_fsm_pp0_stage3),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter0_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter0),
        .Q(ap_enable_reg_pp0_iter0_reg),
        .R(ap_rst));
  LUT5 #(
    .INIT(32'h04045404)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(ap_rst),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(ap_CS_fsm_pp0_stage3),
        .I3(ap_enable_reg_pp0_iter0),
        .I4(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .O(ap_enable_reg_pp0_iter1_i_1_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1_n_4),
        .Q(ap_enable_reg_pp0_iter1),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ap_enable_reg_pp0_iter2_i_1
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_CS_fsm_pp0_stage3),
        .I2(ap_enable_reg_pp0_iter2),
        .O(ap_enable_reg_pp0_iter2_i_1_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2_i_1_n_4),
        .Q(ap_enable_reg_pp0_iter2),
        .R(ap_rst));
  LUT5 #(
    .INIT(32'h00404540)) 
    ap_enable_reg_pp0_iter3_i_1
       (.I0(ap_rst),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(ap_CS_fsm_pp0_stage3),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(Q),
        .O(ap_enable_reg_pp0_iter3_i_1_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter3_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter3_i_1_n_4),
        .Q(ap_enable_reg_pp0_iter3),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000E222)) 
    ap_loop_exit_ready_pp0_iter1_reg_i_1__0
       (.I0(ap_loop_exit_ready_pp0_iter1_reg),
        .I1(ap_CS_fsm_pp0_stage3),
        .I2(ap_enable_reg_pp0_iter0),
        .I3(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .I4(ap_NS_fsm1),
        .O(ap_loop_exit_ready_pp0_iter1_reg_i_1__0_n_4));
  FDRE ap_loop_exit_ready_pp0_iter1_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_exit_ready_pp0_iter1_reg_i_1__0_n_4),
        .Q(ap_loop_exit_ready_pp0_iter1_reg),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00E2)) 
    ap_loop_exit_ready_pp0_iter2_reg_i_1
       (.I0(ap_loop_exit_ready_pp0_iter2_reg),
        .I1(ap_CS_fsm_pp0_stage3),
        .I2(ap_loop_exit_ready_pp0_iter1_reg),
        .I3(ap_NS_fsm1),
        .O(ap_loop_exit_ready_pp0_iter2_reg_i_1_n_4));
  FDRE ap_loop_exit_ready_pp0_iter2_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_exit_ready_pp0_iter2_reg_i_1_n_4),
        .Q(ap_loop_exit_ready_pp0_iter2_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[0]_i_1 
       (.I0(reg_414[0]),
        .I1(test_set_load_2_reg_5072[0]),
        .O(diff_2_fu_1925_p2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[10]_i_1 
       (.I0(reg_414[10]),
        .I1(test_set_load_2_reg_5072[10]),
        .O(diff_2_fu_1925_p2[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[12]_i_1 
       (.I0(reg_414[12]),
        .I1(test_set_load_2_reg_5072[12]),
        .O(diff_2_fu_1925_p2[12]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[14]_i_1 
       (.I0(reg_414[14]),
        .I1(test_set_load_2_reg_5072[14]),
        .O(diff_2_fu_1925_p2[14]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[16]_i_1 
       (.I0(reg_414[16]),
        .I1(test_set_load_2_reg_5072[16]),
        .O(diff_2_fu_1925_p2[16]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[17]_i_1 
       (.I0(reg_414[17]),
        .I1(test_set_load_2_reg_5072[17]),
        .O(diff_2_fu_1925_p2[17]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[18]_i_1 
       (.I0(reg_414[18]),
        .I1(test_set_load_2_reg_5072[18]),
        .O(diff_2_fu_1925_p2[18]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[20]_i_1 
       (.I0(reg_414[20]),
        .I1(test_set_load_2_reg_5072[20]),
        .O(diff_2_fu_1925_p2[20]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[22]_i_1 
       (.I0(reg_414[22]),
        .I1(test_set_load_2_reg_5072[22]),
        .O(diff_2_fu_1925_p2[22]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[24]_i_1 
       (.I0(reg_414[24]),
        .I1(test_set_load_2_reg_5072[24]),
        .O(diff_2_fu_1925_p2[24]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[25]_i_1 
       (.I0(reg_414[25]),
        .I1(test_set_load_2_reg_5072[25]),
        .O(diff_2_fu_1925_p2[25]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[26]_i_1 
       (.I0(reg_414[26]),
        .I1(test_set_load_2_reg_5072[26]),
        .O(diff_2_fu_1925_p2[26]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[28]_i_1 
       (.I0(reg_414[28]),
        .I1(test_set_load_2_reg_5072[28]),
        .O(diff_2_fu_1925_p2[28]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[2]_i_1 
       (.I0(reg_414[2]),
        .I1(test_set_load_2_reg_5072[2]),
        .O(diff_2_fu_1925_p2[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[30]_i_1 
       (.I0(reg_414[30]),
        .I1(test_set_load_2_reg_5072[30]),
        .O(diff_2_fu_1925_p2[30]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[32]_i_1 
       (.I0(reg_414[32]),
        .I1(test_set_load_2_reg_5072[32]),
        .O(diff_2_fu_1925_p2[32]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[33]_i_1 
       (.I0(reg_414[33]),
        .I1(test_set_load_2_reg_5072[33]),
        .O(diff_2_fu_1925_p2[33]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[34]_i_1 
       (.I0(reg_414[34]),
        .I1(test_set_load_2_reg_5072[34]),
        .O(diff_2_fu_1925_p2[34]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[36]_i_1 
       (.I0(reg_414[36]),
        .I1(test_set_load_2_reg_5072[36]),
        .O(diff_2_fu_1925_p2[36]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[38]_i_1 
       (.I0(reg_414[38]),
        .I1(test_set_load_2_reg_5072[38]),
        .O(diff_2_fu_1925_p2[38]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[40]_i_1 
       (.I0(reg_414[40]),
        .I1(test_set_load_2_reg_5072[40]),
        .O(diff_2_fu_1925_p2[40]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[41]_i_1 
       (.I0(reg_414[41]),
        .I1(test_set_load_2_reg_5072[41]),
        .O(diff_2_fu_1925_p2[41]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[42]_i_1 
       (.I0(reg_414[42]),
        .I1(test_set_load_2_reg_5072[42]),
        .O(diff_2_fu_1925_p2[42]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[44]_i_1 
       (.I0(reg_414[44]),
        .I1(test_set_load_2_reg_5072[44]),
        .O(diff_2_fu_1925_p2[44]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[46]_i_1 
       (.I0(reg_414[46]),
        .I1(test_set_load_2_reg_5072[46]),
        .O(diff_2_fu_1925_p2[46]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[48]_i_1 
       (.I0(reg_414[48]),
        .I1(test_set_load_2_reg_5072[48]),
        .O(diff_2_fu_1925_p2[48]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[49]_i_1 
       (.I0(reg_414[49]),
        .I1(test_set_load_2_reg_5072[49]),
        .O(diff_2_fu_1925_p2[49]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[4]_i_1 
       (.I0(reg_414[4]),
        .I1(test_set_load_2_reg_5072[4]),
        .O(diff_2_fu_1925_p2[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[50]_i_1 
       (.I0(reg_414[50]),
        .I1(test_set_load_2_reg_5072[50]),
        .O(diff_2_fu_1925_p2[50]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[52]_i_1 
       (.I0(reg_414[52]),
        .I1(test_set_load_2_reg_5072[52]),
        .O(diff_2_fu_1925_p2[52]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[54]_i_1 
       (.I0(reg_414[54]),
        .I1(test_set_load_2_reg_5072[54]),
        .O(diff_2_fu_1925_p2[54]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[56]_i_1 
       (.I0(reg_414[56]),
        .I1(test_set_load_2_reg_5072[56]),
        .O(diff_2_fu_1925_p2[56]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[57]_i_1 
       (.I0(reg_414[57]),
        .I1(test_set_load_2_reg_5072[57]),
        .O(diff_2_fu_1925_p2[57]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[58]_i_1 
       (.I0(reg_414[58]),
        .I1(test_set_load_2_reg_5072[58]),
        .O(diff_2_fu_1925_p2[58]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[60]_i_1 
       (.I0(reg_414[60]),
        .I1(test_set_load_2_reg_5072[60]),
        .O(diff_2_fu_1925_p2[60]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[62]_i_1 
       (.I0(reg_414[62]),
        .I1(test_set_load_2_reg_5072[62]),
        .O(diff_2_fu_1925_p2[62]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[6]_i_1 
       (.I0(reg_414[6]),
        .I1(test_set_load_2_reg_5072[6]),
        .O(diff_2_fu_1925_p2[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[8]_i_1 
       (.I0(reg_414[8]),
        .I1(test_set_load_2_reg_5072[8]),
        .O(diff_2_fu_1925_p2[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_2_reg_5797[9]_i_1 
       (.I0(reg_414[9]),
        .I1(test_set_load_2_reg_5072[9]),
        .O(diff_2_fu_1925_p2[9]));
  FDRE \diff_2_reg_5797_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[0]),
        .Q(diff_2_reg_5797[0]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[10]),
        .Q(diff_2_reg_5797[10]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[12]),
        .Q(diff_2_reg_5797[12]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[14]),
        .Q(diff_2_reg_5797[14]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[16]),
        .Q(diff_2_reg_5797[16]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[17]),
        .Q(diff_2_reg_5797[17]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[18]),
        .Q(diff_2_reg_5797[18]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[20]),
        .Q(diff_2_reg_5797[20]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[22]),
        .Q(diff_2_reg_5797[22]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[24]),
        .Q(diff_2_reg_5797[24]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[25]),
        .Q(diff_2_reg_5797[25]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[26]),
        .Q(diff_2_reg_5797[26]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[28]),
        .Q(diff_2_reg_5797[28]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[2]),
        .Q(diff_2_reg_5797[2]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[30]),
        .Q(diff_2_reg_5797[30]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[32]),
        .Q(diff_2_reg_5797[32]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[33]),
        .Q(diff_2_reg_5797[33]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[34]),
        .Q(diff_2_reg_5797[34]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[36]),
        .Q(diff_2_reg_5797[36]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[38] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[38]),
        .Q(diff_2_reg_5797[38]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[40]),
        .Q(diff_2_reg_5797[40]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[41]),
        .Q(diff_2_reg_5797[41]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[42]),
        .Q(diff_2_reg_5797[42]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[44] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[44]),
        .Q(diff_2_reg_5797[44]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[46] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[46]),
        .Q(diff_2_reg_5797[46]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[48]),
        .Q(diff_2_reg_5797[48]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[49]),
        .Q(diff_2_reg_5797[49]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[4]),
        .Q(diff_2_reg_5797[4]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[50]),
        .Q(diff_2_reg_5797[50]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[52] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[52]),
        .Q(diff_2_reg_5797[52]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[54] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[54]),
        .Q(diff_2_reg_5797[54]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[56]),
        .Q(diff_2_reg_5797[56]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[57]),
        .Q(diff_2_reg_5797[57]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[58]),
        .Q(diff_2_reg_5797[58]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[60] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[60]),
        .Q(diff_2_reg_5797[60]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[62] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[62]),
        .Q(diff_2_reg_5797[62]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[6]),
        .Q(diff_2_reg_5797[6]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[8]),
        .Q(diff_2_reg_5797[8]),
        .R(1'b0));
  FDRE \diff_2_reg_5797_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[9]),
        .Q(diff_2_reg_5797[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[0]_i_1 
       (.I0(reg_414[0]),
        .I1(\tmp_reg_5097_reg[0]_0 [0]),
        .O(diff_fu_816_p2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[10]_i_1 
       (.I0(reg_414[10]),
        .I1(\tmp_reg_5097_reg[0]_0 [10]),
        .O(diff_fu_816_p2[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[12]_i_1 
       (.I0(reg_414[12]),
        .I1(\tmp_reg_5097_reg[0]_0 [12]),
        .O(diff_fu_816_p2[12]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[14]_i_1 
       (.I0(reg_414[14]),
        .I1(\tmp_reg_5097_reg[0]_0 [14]),
        .O(diff_fu_816_p2[14]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[16]_i_1 
       (.I0(reg_414[16]),
        .I1(\tmp_reg_5097_reg[0]_0 [16]),
        .O(diff_fu_816_p2[16]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[17]_i_1 
       (.I0(reg_414[17]),
        .I1(\tmp_reg_5097_reg[0]_0 [17]),
        .O(diff_fu_816_p2[17]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[18]_i_1 
       (.I0(reg_414[18]),
        .I1(\tmp_reg_5097_reg[0]_0 [18]),
        .O(diff_fu_816_p2[18]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[1]_i_1 
       (.I0(reg_414[1]),
        .I1(\tmp_reg_5097_reg[0]_0 [1]),
        .O(diff_fu_816_p2[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[20]_i_1 
       (.I0(reg_414[20]),
        .I1(\tmp_reg_5097_reg[0]_0 [20]),
        .O(diff_fu_816_p2[20]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[22]_i_1 
       (.I0(reg_414[22]),
        .I1(\tmp_reg_5097_reg[0]_0 [22]),
        .O(diff_fu_816_p2[22]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[24]_i_1 
       (.I0(reg_414[24]),
        .I1(\tmp_reg_5097_reg[0]_0 [24]),
        .O(diff_fu_816_p2[24]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[25]_i_1 
       (.I0(reg_414[25]),
        .I1(\tmp_reg_5097_reg[0]_0 [25]),
        .O(diff_fu_816_p2[25]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[26]_i_1 
       (.I0(reg_414[26]),
        .I1(\tmp_reg_5097_reg[0]_0 [26]),
        .O(diff_fu_816_p2[26]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[28]_i_1 
       (.I0(reg_414[28]),
        .I1(\tmp_reg_5097_reg[0]_0 [28]),
        .O(diff_fu_816_p2[28]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[2]_i_1 
       (.I0(reg_414[2]),
        .I1(\tmp_reg_5097_reg[0]_0 [2]),
        .O(diff_fu_816_p2[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[30]_i_1 
       (.I0(reg_414[30]),
        .I1(\tmp_reg_5097_reg[0]_0 [30]),
        .O(diff_fu_816_p2[30]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[32]_i_1 
       (.I0(reg_414[32]),
        .I1(\tmp_reg_5097_reg[0]_0 [32]),
        .O(diff_fu_816_p2[32]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[33]_i_1 
       (.I0(reg_414[33]),
        .I1(\tmp_reg_5097_reg[0]_0 [33]),
        .O(diff_fu_816_p2[33]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[34]_i_1 
       (.I0(reg_414[34]),
        .I1(\tmp_reg_5097_reg[0]_0 [34]),
        .O(diff_fu_816_p2[34]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[36]_i_1 
       (.I0(reg_414[36]),
        .I1(\tmp_reg_5097_reg[0]_0 [36]),
        .O(diff_fu_816_p2[36]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[38]_i_1 
       (.I0(reg_414[38]),
        .I1(\tmp_reg_5097_reg[0]_0 [38]),
        .O(diff_fu_816_p2[38]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[3]_i_1 
       (.I0(reg_414[3]),
        .I1(\tmp_reg_5097_reg[0]_0 [3]),
        .O(diff_fu_816_p2[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[40]_i_1 
       (.I0(reg_414[40]),
        .I1(\tmp_reg_5097_reg[0]_0 [40]),
        .O(diff_fu_816_p2[40]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[41]_i_1 
       (.I0(reg_414[41]),
        .I1(\tmp_reg_5097_reg[0]_0 [41]),
        .O(diff_fu_816_p2[41]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[42]_i_1 
       (.I0(reg_414[42]),
        .I1(\tmp_reg_5097_reg[0]_0 [42]),
        .O(diff_fu_816_p2[42]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[44]_i_1 
       (.I0(reg_414[44]),
        .I1(\tmp_reg_5097_reg[0]_0 [44]),
        .O(diff_fu_816_p2[44]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[46]_i_1 
       (.I0(reg_414[46]),
        .I1(\tmp_reg_5097_reg[0]_0 [46]),
        .O(diff_fu_816_p2[46]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[48]_i_1 
       (.I0(reg_414[48]),
        .I1(\tmp_reg_5097_reg[0]_0 [48]),
        .O(diff_fu_816_p2[48]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[49]_i_1 
       (.I0(reg_414[49]),
        .I1(\tmp_reg_5097_reg[0]_0 [49]),
        .O(diff_fu_816_p2[49]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[4]_i_1 
       (.I0(reg_414[4]),
        .I1(\tmp_reg_5097_reg[0]_0 [4]),
        .O(diff_fu_816_p2[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[50]_i_1 
       (.I0(reg_414[50]),
        .I1(\tmp_reg_5097_reg[0]_0 [50]),
        .O(diff_fu_816_p2[50]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[52]_i_1 
       (.I0(reg_414[52]),
        .I1(\tmp_reg_5097_reg[0]_0 [52]),
        .O(diff_fu_816_p2[52]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[54]_i_1 
       (.I0(reg_414[54]),
        .I1(\tmp_reg_5097_reg[0]_0 [54]),
        .O(diff_fu_816_p2[54]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[56]_i_1 
       (.I0(reg_414[56]),
        .I1(\tmp_reg_5097_reg[0]_0 [56]),
        .O(diff_fu_816_p2[56]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[57]_i_1 
       (.I0(reg_414[57]),
        .I1(\tmp_reg_5097_reg[0]_0 [57]),
        .O(diff_fu_816_p2[57]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[58]_i_1 
       (.I0(reg_414[58]),
        .I1(\tmp_reg_5097_reg[0]_0 [58]),
        .O(diff_fu_816_p2[58]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[60]_i_1 
       (.I0(reg_414[60]),
        .I1(\tmp_reg_5097_reg[0]_0 [60]),
        .O(diff_fu_816_p2[60]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[62]_i_1 
       (.I0(reg_414[62]),
        .I1(\tmp_reg_5097_reg[0]_0 [62]),
        .O(diff_fu_816_p2[62]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[6]_i_1 
       (.I0(reg_414[6]),
        .I1(\tmp_reg_5097_reg[0]_0 [6]),
        .O(diff_fu_816_p2[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[8]_i_1 
       (.I0(reg_414[8]),
        .I1(\tmp_reg_5097_reg[0]_0 [8]),
        .O(diff_fu_816_p2[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \diff_reg_5092[9]_i_1 
       (.I0(reg_414[9]),
        .I1(\tmp_reg_5097_reg[0]_0 [9]),
        .O(diff_fu_816_p2[9]));
  FDRE \diff_reg_5092_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[0]),
        .Q(diff_reg_5092[0]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[10]),
        .Q(diff_reg_5092[10]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[12]),
        .Q(diff_reg_5092[12]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[14]),
        .Q(diff_reg_5092[14]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[16]),
        .Q(diff_reg_5092[16]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[17]),
        .Q(diff_reg_5092[17]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[18]),
        .Q(diff_reg_5092[18]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[1]),
        .Q(diff_reg_5092[1]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[20]),
        .Q(diff_reg_5092[20]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[22]),
        .Q(diff_reg_5092[22]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[24]),
        .Q(diff_reg_5092[24]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[25]),
        .Q(diff_reg_5092[25]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[26]),
        .Q(diff_reg_5092[26]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[28]),
        .Q(diff_reg_5092[28]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[2]),
        .Q(diff_reg_5092[2]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[30]),
        .Q(diff_reg_5092[30]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[32]),
        .Q(diff_reg_5092[32]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[33]),
        .Q(diff_reg_5092[33]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[34]),
        .Q(diff_reg_5092[34]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[36]),
        .Q(diff_reg_5092[36]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[38] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[38]),
        .Q(diff_reg_5092[38]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[3]),
        .Q(diff_reg_5092[3]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[40]),
        .Q(diff_reg_5092[40]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[41]),
        .Q(diff_reg_5092[41]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[42]),
        .Q(diff_reg_5092[42]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[44] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[44]),
        .Q(diff_reg_5092[44]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[46] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[46]),
        .Q(diff_reg_5092[46]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[48]),
        .Q(diff_reg_5092[48]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[49]),
        .Q(diff_reg_5092[49]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[4]),
        .Q(diff_reg_5092[4]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[50]),
        .Q(diff_reg_5092[50]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[52] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[52]),
        .Q(diff_reg_5092[52]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[54] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[54]),
        .Q(diff_reg_5092[54]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[56]),
        .Q(diff_reg_5092[56]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[57]),
        .Q(diff_reg_5092[57]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[58]),
        .Q(diff_reg_5092[58]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[60] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[60]),
        .Q(diff_reg_5092[60]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[62] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[62]),
        .Q(diff_reg_5092[62]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[6]),
        .Q(diff_reg_5092[6]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[8]),
        .Q(diff_reg_5092[8]),
        .R(1'b0));
  FDRE \diff_reg_5092_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[9]),
        .Q(diff_reg_5092[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[3]_i_2 
       (.I0(trunc_ln25_1_reg_6751[3]),
        .I1(trunc_ln25_reg_6746[3]),
        .O(\dist_reg_6791[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[3]_i_3 
       (.I0(trunc_ln25_1_reg_6751[2]),
        .I1(trunc_ln25_reg_6746[2]),
        .O(\dist_reg_6791[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[3]_i_4 
       (.I0(trunc_ln25_1_reg_6751[1]),
        .I1(trunc_ln25_reg_6746[1]),
        .O(\dist_reg_6791[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[3]_i_5 
       (.I0(trunc_ln25_1_reg_6751[0]),
        .I1(trunc_ln25_reg_6746[0]),
        .O(\dist_reg_6791[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[6]_i_2 
       (.I0(trunc_ln25_1_reg_6751[5]),
        .I1(trunc_ln25_reg_6746[5]),
        .O(\dist_reg_6791[6]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dist_reg_6791[6]_i_3 
       (.I0(trunc_ln25_1_reg_6751[4]),
        .I1(trunc_ln25_reg_6746[4]),
        .O(\dist_reg_6791[6]_i_3_n_4 ));
  FDRE \dist_reg_6791_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[0]),
        .Q(dist_reg_6791[0]),
        .R(1'b0));
  FDRE \dist_reg_6791_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[1]),
        .Q(dist_reg_6791[1]),
        .R(1'b0));
  FDRE \dist_reg_6791_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[2]),
        .Q(dist_reg_6791[2]),
        .R(1'b0));
  FDRE \dist_reg_6791_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[3]),
        .Q(dist_reg_6791[3]),
        .R(1'b0));
  CARRY4 \dist_reg_6791_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\dist_reg_6791_reg[3]_i_1_n_4 ,\dist_reg_6791_reg[3]_i_1_n_5 ,\dist_reg_6791_reg[3]_i_1_n_6 ,\dist_reg_6791_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(trunc_ln25_1_reg_6751[3:0]),
        .O(dist_fu_4658_p2[3:0]),
        .S({\dist_reg_6791[3]_i_2_n_4 ,\dist_reg_6791[3]_i_3_n_4 ,\dist_reg_6791[3]_i_4_n_4 ,\dist_reg_6791[3]_i_5_n_4 }));
  FDRE \dist_reg_6791_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[4]),
        .Q(dist_reg_6791[4]),
        .R(1'b0));
  FDRE \dist_reg_6791_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[5]),
        .Q(dist_reg_6791[5]),
        .R(1'b0));
  FDRE \dist_reg_6791_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dist_fu_4658_p2[6]),
        .Q(dist_reg_6791[6]),
        .R(1'b0));
  CARRY4 \dist_reg_6791_reg[6]_i_1 
       (.CI(\dist_reg_6791_reg[3]_i_1_n_4 ),
        .CO({\NLW_dist_reg_6791_reg[6]_i_1_CO_UNCONNECTED [3],dist_fu_4658_p2[6],\NLW_dist_reg_6791_reg[6]_i_1_CO_UNCONNECTED [1],\dist_reg_6791_reg[6]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,trunc_ln25_1_reg_6751[5:4]}),
        .O({\NLW_dist_reg_6791_reg[6]_i_1_O_UNCONNECTED [3:2],dist_fu_4658_p2[5:4]}),
        .S({1'b0,1'b1,\dist_reg_6791[6]_i_2_n_4 ,\dist_reg_6791[6]_i_3_n_4 }));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[0]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [0]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[0]),
        .O(trunc_ln107_fu_4714_p1[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[1]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[1]),
        .O(trunc_ln107_fu_4714_p1[1]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[2]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [2]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[2]),
        .O(trunc_ln107_fu_4714_p1[2]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[3]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [3]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[3]),
        .O(trunc_ln107_fu_4714_p1[3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[4]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [4]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[4]),
        .O(trunc_ln107_fu_4714_p1[4]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[5]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [5]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[5]),
        .O(trunc_ln107_fu_4714_p1[5]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[6]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [6]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[6]),
        .O(trunc_ln107_fu_4714_p1[6]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dists_0_3_out_load_reg_6821[7]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [7]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(dists_2_6_reg_6929[7]),
        .O(trunc_ln107_fu_4714_p1[7]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \dists_0_3_out_load_reg_6821[8]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_1 [8]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[8]),
        .O(trunc_ln107_fu_4714_p1[8]));
  FDRE \dists_0_3_out_load_reg_6821_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[0]),
        .Q(dists_0_3_out_load_reg_6821[0]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[1]),
        .Q(dists_0_3_out_load_reg_6821[1]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[2]),
        .Q(dists_0_3_out_load_reg_6821[2]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[3]),
        .Q(dists_0_3_out_load_reg_6821[3]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[4] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[4]),
        .Q(dists_0_3_out_load_reg_6821[4]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[5] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[5]),
        .Q(dists_0_3_out_load_reg_6821[5]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[6] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[6]),
        .Q(dists_0_3_out_load_reg_6821[6]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[7] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[7]),
        .Q(dists_0_3_out_load_reg_6821[7]),
        .R(1'b0));
  FDRE \dists_0_3_out_load_reg_6821_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[8]),
        .Q(dists_0_3_out_load_reg_6821[8]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[3]_i_2 
       (.I0(add_ln36_1_reg_6858[3]),
        .I1(add_ln36_reg_6853[3]),
        .O(\dists_0_reg_6881[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[3]_i_3 
       (.I0(add_ln36_1_reg_6858[2]),
        .I1(add_ln36_reg_6853[2]),
        .O(\dists_0_reg_6881[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[3]_i_4 
       (.I0(add_ln36_1_reg_6858[1]),
        .I1(add_ln36_reg_6853[1]),
        .O(\dists_0_reg_6881[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[3]_i_5 
       (.I0(add_ln36_1_reg_6858[0]),
        .I1(add_ln36_reg_6853[0]),
        .O(\dists_0_reg_6881[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[7]_i_2 
       (.I0(add_ln36_1_reg_6858[7]),
        .I1(add_ln36_reg_6853[7]),
        .O(\dists_0_reg_6881[7]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[7]_i_3 
       (.I0(add_ln36_1_reg_6858[6]),
        .I1(add_ln36_reg_6853[6]),
        .O(\dists_0_reg_6881[7]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[7]_i_4 
       (.I0(add_ln36_1_reg_6858[5]),
        .I1(add_ln36_reg_6853[5]),
        .O(\dists_0_reg_6881[7]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dists_0_reg_6881[7]_i_5 
       (.I0(add_ln36_1_reg_6858[4]),
        .I1(add_ln36_reg_6853[4]),
        .O(\dists_0_reg_6881[7]_i_5_n_4 ));
  FDRE \dists_0_reg_6881_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[0]),
        .Q(dists_0_reg_6881[0]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[1]),
        .Q(dists_0_reg_6881[1]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[2]),
        .Q(dists_0_reg_6881[2]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[3]),
        .Q(dists_0_reg_6881[3]),
        .R(1'b0));
  CARRY4 \dists_0_reg_6881_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\dists_0_reg_6881_reg[3]_i_1_n_4 ,\dists_0_reg_6881_reg[3]_i_1_n_5 ,\dists_0_reg_6881_reg[3]_i_1_n_6 ,\dists_0_reg_6881_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(add_ln36_1_reg_6858[3:0]),
        .O(dists_0_fu_4795_p2[3:0]),
        .S({\dists_0_reg_6881[3]_i_2_n_4 ,\dists_0_reg_6881[3]_i_3_n_4 ,\dists_0_reg_6881[3]_i_4_n_4 ,\dists_0_reg_6881[3]_i_5_n_4 }));
  FDRE \dists_0_reg_6881_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[4]),
        .Q(dists_0_reg_6881[4]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[5]),
        .Q(dists_0_reg_6881[5]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[6]),
        .Q(dists_0_reg_6881[6]),
        .R(1'b0));
  FDRE \dists_0_reg_6881_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[7]),
        .Q(dists_0_reg_6881[7]),
        .R(1'b0));
  CARRY4 \dists_0_reg_6881_reg[7]_i_1 
       (.CI(\dists_0_reg_6881_reg[3]_i_1_n_4 ),
        .CO({\dists_0_reg_6881_reg[7]_i_1_n_4 ,\dists_0_reg_6881_reg[7]_i_1_n_5 ,\dists_0_reg_6881_reg[7]_i_1_n_6 ,\dists_0_reg_6881_reg[7]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(add_ln36_1_reg_6858[7:4]),
        .O(dists_0_fu_4795_p2[7:4]),
        .S({\dists_0_reg_6881[7]_i_2_n_4 ,\dists_0_reg_6881[7]_i_3_n_4 ,\dists_0_reg_6881[7]_i_4_n_4 ,\dists_0_reg_6881[7]_i_5_n_4 }));
  FDRE \dists_0_reg_6881_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(dists_0_fu_4795_p2[8]),
        .Q(dists_0_reg_6881[8]),
        .R(1'b0));
  CARRY4 \dists_0_reg_6881_reg[8]_i_1 
       (.CI(\dists_0_reg_6881_reg[7]_i_1_n_4 ),
        .CO({\NLW_dists_0_reg_6881_reg[8]_i_1_CO_UNCONNECTED [3:1],dists_0_fu_4795_p2[8]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_dists_0_reg_6881_reg[8]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \dists_1_3_out_load_reg_6847_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [0]),
        .Q(dists_1_3_out_load_reg_6847[0]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [1]),
        .Q(dists_1_3_out_load_reg_6847[1]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [2]),
        .Q(dists_1_3_out_load_reg_6847[2]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [3]),
        .Q(dists_1_3_out_load_reg_6847[3]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [4]),
        .Q(dists_1_3_out_load_reg_6847[4]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [5]),
        .Q(dists_1_3_out_load_reg_6847[5]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [6]),
        .Q(dists_1_3_out_load_reg_6847[6]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [7]),
        .Q(dists_1_3_out_load_reg_6847[7]),
        .R(1'b0));
  FDRE \dists_1_3_out_load_reg_6847_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\dists_1_3_out_load_reg_6847_reg[8]_0 [8]),
        .Q(dists_1_3_out_load_reg_6847[8]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [0]),
        .Q(dists_2_3_out_load_reg_6874[0]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [1]),
        .Q(dists_2_3_out_load_reg_6874[1]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [2]),
        .Q(dists_2_3_out_load_reg_6874[2]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [3]),
        .Q(dists_2_3_out_load_reg_6874[3]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [4]),
        .Q(dists_2_3_out_load_reg_6874[4]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [5]),
        .Q(dists_2_3_out_load_reg_6874[5]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [6]),
        .Q(dists_2_3_out_load_reg_6874[6]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [7]),
        .Q(dists_2_3_out_load_reg_6874[7]),
        .R(1'b0));
  FDRE \dists_2_3_out_load_reg_6874_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\dists_2_3_out_load_reg_6874_reg[8]_0 [8]),
        .Q(dists_2_3_out_load_reg_6874[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[0]_i_1 
       (.I0(dists_0_reg_6881[0]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[0]),
        .O(dists_2_4_fu_4878_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[1]_i_1 
       (.I0(dists_0_reg_6881[1]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[1]),
        .O(dists_2_4_fu_4878_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[2]_i_1 
       (.I0(dists_0_reg_6881[2]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[2]),
        .O(dists_2_4_fu_4878_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[3]_i_1 
       (.I0(dists_0_reg_6881[3]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[3]),
        .O(dists_2_4_fu_4878_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[4]_i_1 
       (.I0(dists_0_reg_6881[4]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[4]),
        .O(dists_2_4_fu_4878_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[5]_i_1 
       (.I0(dists_0_reg_6881[5]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[5]),
        .O(dists_2_4_fu_4878_p3[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[6]_i_1 
       (.I0(dists_0_reg_6881[6]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[6]),
        .O(dists_2_4_fu_4878_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[7]_i_1 
       (.I0(dists_0_reg_6881[7]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[7]),
        .O(dists_2_4_fu_4878_p3[7]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \dists_2_4_reg_6919[8]_i_1 
       (.I0(dists_0_reg_6881[8]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(p_1_in),
        .I3(dists_2_3_out_load_reg_6874[8]),
        .O(dists_2_4_fu_4878_p3[8]));
  FDRE \dists_2_4_reg_6919_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[0]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[0] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[1]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[1] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[2]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[2] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[3]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[3] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[4]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[4] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[5]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[5] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[6]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[6] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[7]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[7] ),
        .R(1'b0));
  FDRE \dists_2_4_reg_6919_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_4_fu_4878_p3[8]),
        .Q(\dists_2_4_reg_6919_reg_n_4_[8] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[0]_i_1 
       (.I0(dists_0_reg_6881[0]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[0]),
        .O(dists_2_5_fu_4885_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[1]_i_1 
       (.I0(dists_0_reg_6881[1]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[1]),
        .O(dists_2_5_fu_4885_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[2]_i_1 
       (.I0(dists_0_reg_6881[2]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[2]),
        .O(dists_2_5_fu_4885_p3[2]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[3]_i_1 
       (.I0(dists_0_reg_6881[3]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[3]),
        .O(dists_2_5_fu_4885_p3[3]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[4]_i_1 
       (.I0(dists_0_reg_6881[4]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[4]),
        .O(dists_2_5_fu_4885_p3[4]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[5]_i_1 
       (.I0(dists_0_reg_6881[5]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[5]),
        .O(dists_2_5_fu_4885_p3[5]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[6]_i_1 
       (.I0(dists_0_reg_6881[6]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[6]),
        .O(dists_2_5_fu_4885_p3[6]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[7]_i_1 
       (.I0(dists_0_reg_6881[7]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[7]),
        .O(dists_2_5_fu_4885_p3[7]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \dists_2_5_reg_6924[8]_i_1 
       (.I0(dists_0_reg_6881[8]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_1_3_out_load_reg_6847[8]),
        .O(dists_2_5_fu_4885_p3[8]));
  FDRE \dists_2_5_reg_6924_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[0]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[0] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[1]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[1] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[2]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[2] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[3]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[3] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[4]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[4] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[5]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[5] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[6]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[6] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[7]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[7] ),
        .R(1'b0));
  FDRE \dists_2_5_reg_6924_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_5_fu_4885_p3[8]),
        .Q(\dists_2_5_reg_6924_reg_n_4_[8] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[0]_i_1 
       (.I0(dists_0_reg_6881[0]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[0]),
        .O(dists_2_6_fu_4892_p3[0]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[1]_i_1 
       (.I0(dists_0_reg_6881[1]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[1]),
        .O(dists_2_6_fu_4892_p3[1]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[2]_i_1 
       (.I0(dists_0_reg_6881[2]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[2]),
        .O(dists_2_6_fu_4892_p3[2]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[3]_i_1 
       (.I0(dists_0_reg_6881[3]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[3]),
        .O(dists_2_6_fu_4892_p3[3]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[4]_i_1 
       (.I0(dists_0_reg_6881[4]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[4]),
        .O(dists_2_6_fu_4892_p3[4]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[5]_i_1 
       (.I0(dists_0_reg_6881[5]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[5]),
        .O(dists_2_6_fu_4892_p3[5]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[6]_i_1 
       (.I0(dists_0_reg_6881[6]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[6]),
        .O(dists_2_6_fu_4892_p3[6]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[7]_i_1 
       (.I0(dists_0_reg_6881[7]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[7]),
        .O(dists_2_6_fu_4892_p3[7]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \dists_2_6_reg_6929[8]_i_1 
       (.I0(dists_0_reg_6881[8]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(select_ln45_2_reg_6891[0]),
        .I3(p_1_in),
        .I4(dists_0_3_out_load_reg_6821[8]),
        .O(dists_2_6_fu_4892_p3[8]));
  FDRE \dists_2_6_reg_6929_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[0]),
        .Q(dists_2_6_reg_6929[0]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[1]),
        .Q(dists_2_6_reg_6929[1]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[2]),
        .Q(dists_2_6_reg_6929[2]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[3]),
        .Q(dists_2_6_reg_6929[3]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[4]),
        .Q(dists_2_6_reg_6929[4]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[5]),
        .Q(dists_2_6_reg_6929[5]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[6]),
        .Q(dists_2_6_reg_6929[6]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[7]),
        .Q(dists_2_6_reg_6929[7]),
        .R(1'b0));
  FDRE \dists_2_6_reg_6929_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(dists_2_6_fu_4892_p3[8]),
        .Q(dists_2_6_reg_6929[8]),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_1 flow_control_loop_pipe_sequential_init_U
       (.D(D),
        .E(flow_control_loop_pipe_sequential_init_U_n_7),
        .Q({ap_CS_fsm_pp0_stage3,Q,ap_CS_fsm_pp0_stage0}),
        .\ap_CS_fsm_reg[1] (flow_control_loop_pipe_sequential_init_U_n_9),
        .\ap_CS_fsm_reg[1]_0 (flow_control_loop_pipe_sequential_init_U_n_10),
        .\ap_CS_fsm_reg[1]_1 (\ap_CS_fsm_reg[1]_0 ),
        .\ap_CS_fsm_reg[1]_2 (\ap_CS_fsm_reg[1]_1 ),
        .\ap_CS_fsm_reg[1]_3 (E),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ap_loop_exit_ready_pp0_iter2_reg(ap_loop_exit_ready_pp0_iter2_reg),
        .ap_rst(ap_rst),
        .\dists_0_0_fu_62_reg[8] (\dists_0_0_fu_62_reg[8] [2:1]),
        .\dists_0_0_fu_62_reg[8]_0 (\dists_0_0_fu_62_reg[8]_0 ),
        .\dists_0_0_fu_62_reg[8]_1 (\dists_0_0_fu_62_reg[8]_1 ),
        .\dists_0_0_fu_62_reg[8]_2 (dists_2_6_reg_6929),
        .\dists_0_1_fu_58_reg[8] (\dists_0_1_fu_58_reg[8] ),
        .\dists_1_0_fu_66_reg[8] ({\dists_2_5_reg_6924_reg_n_4_[8] ,\dists_2_5_reg_6924_reg_n_4_[7] ,\dists_2_5_reg_6924_reg_n_4_[6] ,\dists_2_5_reg_6924_reg_n_4_[5] ,\dists_2_5_reg_6924_reg_n_4_[4] ,\dists_2_5_reg_6924_reg_n_4_[3] ,\dists_2_5_reg_6924_reg_n_4_[2] ,\dists_2_5_reg_6924_reg_n_4_[1] ,\dists_2_5_reg_6924_reg_n_4_[0] }),
        .\dists_1_0_fu_66_reg[8]_0 (\dists_1_3_out_load_reg_6847_reg[8]_0 ),
        .\dists_1_0_fu_66_reg[8]_1 (\dists_1_0_fu_66_reg[8] ),
        .\dists_2_0_fu_70_reg[8] ({\dists_2_4_reg_6919_reg_n_4_[8] ,\dists_2_4_reg_6919_reg_n_4_[7] ,\dists_2_4_reg_6919_reg_n_4_[6] ,\dists_2_4_reg_6919_reg_n_4_[5] ,\dists_2_4_reg_6919_reg_n_4_[4] ,\dists_2_4_reg_6919_reg_n_4_[3] ,\dists_2_4_reg_6919_reg_n_4_[2] ,\dists_2_4_reg_6919_reg_n_4_[1] ,\dists_2_4_reg_6919_reg_n_4_[0] }),
        .\dists_2_0_fu_70_reg[8]_0 (\dists_2_3_out_load_reg_6874_reg[8]_0 ),
        .\dists_2_0_fu_70_reg[8]_1 (\dists_2_0_fu_70_reg[8] ),
        .grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg(flow_control_loop_pipe_sequential_init_U_n_65),
        .i_1_fu_24204_out(i_1_fu_24204_out),
        .\i_1_fu_242_reg[7] (flow_control_loop_pipe_sequential_init_U_n_11),
        .\icmp_ln107_reg_5042_reg[0] (\icmp_ln107_reg_5042[0]_i_2_n_4 ),
        .\icmp_ln107_reg_5042_reg[0]_0 (\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .icmp_ln53_reg_6897(icmp_ln53_reg_6897),
        .icmp_ln55_1_reg_6909(icmp_ln55_1_reg_6909),
        .icmp_ln55_reg_6904(icmp_ln55_reg_6904),
        .\labels_0_1_fu_70_reg[3] ({flow_control_loop_pipe_sequential_init_U_n_51,flow_control_loop_pipe_sequential_init_U_n_52,flow_control_loop_pipe_sequential_init_U_n_53,flow_control_loop_pipe_sequential_init_U_n_54}),
        .\labels_0_3_fu_246_reg[3] (\labels_0_3_fu_246_reg[3]_1 ),
        .\labels_1_1_fu_74_reg[3] ({flow_control_loop_pipe_sequential_init_U_n_47,flow_control_loop_pipe_sequential_init_U_n_48,flow_control_loop_pipe_sequential_init_U_n_49,flow_control_loop_pipe_sequential_init_U_n_50}),
        .\labels_1_3_fu_250_reg[3] (\labels_1_3_fu_250_reg[3]_1 ),
        .\labels_2_1_fu_78_reg[3] ({flow_control_loop_pipe_sequential_init_U_n_43,flow_control_loop_pipe_sequential_init_U_n_44,flow_control_loop_pipe_sequential_init_U_n_45,flow_control_loop_pipe_sequential_init_U_n_46}),
        .\labels_2_3_fu_254_reg[3] (\labels_2_3_fu_254_reg[3]_1 ),
        .\labels_2_3_fu_254_reg[3]_0 (labels_1_reg_6827),
        .or_ln55_reg_6914(or_ln55_reg_6914),
        .training_samples_address0(training_samples_address0),
        .\training_samples_address0[13] (i_1_fu_242),
        .\training_samples_address0[13]_0 ({\shl_ln_reg_5046_reg_n_4_[13] ,\shl_ln_reg_5046_reg_n_4_[12] ,\shl_ln_reg_5046_reg_n_4_[11] ,\shl_ln_reg_5046_reg_n_4_[10] ,\shl_ln_reg_5046_reg_n_4_[9] ,\shl_ln_reg_5046_reg_n_4_[8] ,\shl_ln_reg_5046_reg_n_4_[7] ,\shl_ln_reg_5046_reg_n_4_[6] ,\shl_ln_reg_5046_reg_n_4_[5] ,\shl_ln_reg_5046_reg_n_4_[4] ,\shl_ln_reg_5046_reg_n_4_[3] ,\shl_ln_reg_5046_reg_n_4_[2] }),
        .zext_ln108_fu_748_p1(zext_ln108_fu_748_p1));
  LUT6 #(
    .INIT(64'hBBBFAAAAFFFFAAAA)) 
    grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_i_1
       (.I0(\dists_0_0_fu_62_reg[8] [1]),
        .I1(ap_CS_fsm_pp0_stage3),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I5(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .O(\ap_CS_fsm_reg[3]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \i_1_fu_242[0]_i_1 
       (.I0(\shl_ln_reg_5046_reg_n_4_[2] ),
        .O(add_ln107_fu_1077_p2[0]));
  LUT5 #(
    .INIT(32'h45400000)) 
    \i_1_fu_242[11]_i_2 
       (.I0(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .I1(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(ap_enable_reg_pp0_iter0_reg),
        .I4(ap_CS_fsm_pp0_stage3),
        .O(i_1_fu_2420));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[0] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[0]),
        .Q(i_1_fu_242[0]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[10] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[10]),
        .Q(i_1_fu_242[10]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[11] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[11]),
        .Q(i_1_fu_242[11]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[1] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[1]),
        .Q(i_1_fu_242[1]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[2] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[2]),
        .Q(i_1_fu_242[2]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[3] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[3]),
        .Q(i_1_fu_242[3]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[4] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[4]),
        .Q(i_1_fu_242[4]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[5] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[5]),
        .Q(i_1_fu_242[5]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[6] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[6]),
        .Q(i_1_fu_242[6]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[7] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[7]),
        .Q(i_1_fu_242[7]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[8] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[8]),
        .Q(i_1_fu_242[8]),
        .R(i_1_fu_24204_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_242_reg[9] 
       (.C(ap_clk),
        .CE(i_1_fu_2420),
        .D(add_ln107_fu_1077_p2[9]),
        .Q(i_1_fu_242[9]),
        .R(i_1_fu_24204_out));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[2] ),
        .Q(training_labels_address0[0]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[12] ),
        .Q(training_labels_address0[10]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[13] ),
        .Q(training_labels_address0[11]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[3] ),
        .Q(training_labels_address0[1]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[4] ),
        .Q(training_labels_address0[2]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[5] ),
        .Q(training_labels_address0[3]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[6] ),
        .Q(training_labels_address0[4]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[7] ),
        .Q(training_labels_address0[5]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[8] ),
        .Q(training_labels_address0[6]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[9] ),
        .Q(training_labels_address0[7]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[10] ),
        .Q(training_labels_address0[8]),
        .R(1'b0));
  FDRE \i_reg_5036_pp0_iter1_reg_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\shl_ln_reg_5046_reg_n_4_[11] ),
        .Q(training_labels_address0[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \icmp_ln107_reg_5042[0]_i_2 
       (.I0(\icmp_ln107_reg_5042[0]_i_3_n_4 ),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(i_1_fu_242[11]),
        .I3(i_1_fu_242[10]),
        .I4(i_1_fu_242[9]),
        .I5(\icmp_ln107_reg_5042[0]_i_4_n_4 ),
        .O(\icmp_ln107_reg_5042[0]_i_2_n_4 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \icmp_ln107_reg_5042[0]_i_3 
       (.I0(i_1_fu_242[6]),
        .I1(i_1_fu_242[8]),
        .I2(i_1_fu_242[5]),
        .I3(i_1_fu_242[4]),
        .O(\icmp_ln107_reg_5042[0]_i_3_n_4 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \icmp_ln107_reg_5042[0]_i_4 
       (.I0(i_1_fu_242[1]),
        .I1(i_1_fu_242[0]),
        .I2(i_1_fu_242[2]),
        .I3(i_1_fu_242[3]),
        .O(\icmp_ln107_reg_5042[0]_i_4_n_4 ));
  FDRE \icmp_ln107_reg_5042_pp0_iter1_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .Q(icmp_ln107_reg_5042_pp0_iter1_reg),
        .R(1'b0));
  FDRE \icmp_ln107_reg_5042_pp0_iter2_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(icmp_ln107_reg_5042_pp0_iter1_reg),
        .Q(icmp_ln107_reg_5042_pp0_iter2_reg),
        .R(1'b0));
  FDRE \icmp_ln107_reg_5042_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(flow_control_loop_pipe_sequential_init_U_n_11),
        .Q(\icmp_ln107_reg_5042_reg_n_4_[0] ),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_1_fu_4771_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln45_1_fu_4771_p2_carry_n_4,icmp_ln45_1_fu_4771_p2_carry_n_5,icmp_ln45_1_fu_4771_p2_carry_n_6,icmp_ln45_1_fu_4771_p2_carry_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln45_1_fu_4771_p2_carry_i_1_n_4,icmp_ln45_1_fu_4771_p2_carry_i_2_n_4,icmp_ln45_1_fu_4771_p2_carry_i_3_n_4,icmp_ln45_1_fu_4771_p2_carry_i_4_n_4}),
        .O(NLW_icmp_ln45_1_fu_4771_p2_carry_O_UNCONNECTED[3:0]),
        .S({icmp_ln45_1_fu_4771_p2_carry_i_5_n_4,icmp_ln45_1_fu_4771_p2_carry_i_6_n_4,icmp_ln45_1_fu_4771_p2_carry_i_7_n_4,icmp_ln45_1_fu_4771_p2_carry_i_8_n_4}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_1_fu_4771_p2_carry__0
       (.CI(icmp_ln45_1_fu_4771_p2_carry_n_4),
        .CO({icmp_ln45_1_fu_4771_p2_carry__0_n_4,icmp_ln45_1_fu_4771_p2_carry__0_n_5,icmp_ln45_1_fu_4771_p2_carry__0_n_6,icmp_ln45_1_fu_4771_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,icmp_ln45_1_fu_4771_p2_carry__0_i_1_n_4}),
        .O(NLW_icmp_ln45_1_fu_4771_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,icmp_ln45_1_fu_4771_p2_carry__0_i_2_n_4}));
  LUT2 #(
    .INIT(4'h2)) 
    icmp_ln45_1_fu_4771_p2_carry__0_i_1
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [8]),
        .I1(max_dist_reg_6842[8]),
        .O(icmp_ln45_1_fu_4771_p2_carry__0_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    icmp_ln45_1_fu_4771_p2_carry__0_i_2
       (.I0(max_dist_reg_6842[8]),
        .I1(\dists_1_3_out_load_reg_6847_reg[8]_0 [8]),
        .O(icmp_ln45_1_fu_4771_p2_carry__0_i_2_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_1_fu_4771_p2_carry__1
       (.CI(icmp_ln45_1_fu_4771_p2_carry__0_n_4),
        .CO({icmp_ln45_1_fu_4771_p2_carry__1_n_4,icmp_ln45_1_fu_4771_p2_carry__1_n_5,icmp_ln45_1_fu_4771_p2_carry__1_n_6,icmp_ln45_1_fu_4771_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_1_fu_4771_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_1_fu_4771_p2_carry__2
       (.CI(icmp_ln45_1_fu_4771_p2_carry__1_n_4),
        .CO({icmp_ln45_1_fu_4771_p2_carry__2_n_4,icmp_ln45_1_fu_4771_p2_carry__2_n_5,icmp_ln45_1_fu_4771_p2_carry__2_n_6,icmp_ln45_1_fu_4771_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_1_fu_4771_p2_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_1_fu_4771_p2_carry_i_1
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [6]),
        .I1(max_dist_reg_6842[6]),
        .I2(max_dist_reg_6842[7]),
        .I3(\dists_1_3_out_load_reg_6847_reg[8]_0 [7]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_1_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_1_fu_4771_p2_carry_i_2
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [4]),
        .I1(max_dist_reg_6842[4]),
        .I2(max_dist_reg_6842[5]),
        .I3(\dists_1_3_out_load_reg_6847_reg[8]_0 [5]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_2_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_1_fu_4771_p2_carry_i_3
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [2]),
        .I1(max_dist_reg_6842[2]),
        .I2(max_dist_reg_6842[3]),
        .I3(\dists_1_3_out_load_reg_6847_reg[8]_0 [3]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_3_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_1_fu_4771_p2_carry_i_4
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [0]),
        .I1(max_dist_reg_6842[0]),
        .I2(max_dist_reg_6842[1]),
        .I3(\dists_1_3_out_load_reg_6847_reg[8]_0 [1]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_4_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_1_fu_4771_p2_carry_i_5
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [7]),
        .I1(max_dist_reg_6842[7]),
        .I2(\dists_1_3_out_load_reg_6847_reg[8]_0 [6]),
        .I3(max_dist_reg_6842[6]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_5_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_1_fu_4771_p2_carry_i_6
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [5]),
        .I1(max_dist_reg_6842[5]),
        .I2(\dists_1_3_out_load_reg_6847_reg[8]_0 [4]),
        .I3(max_dist_reg_6842[4]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_6_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_1_fu_4771_p2_carry_i_7
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [3]),
        .I1(max_dist_reg_6842[3]),
        .I2(\dists_1_3_out_load_reg_6847_reg[8]_0 [2]),
        .I3(max_dist_reg_6842[2]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_7_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_1_fu_4771_p2_carry_i_8
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [1]),
        .I1(max_dist_reg_6842[1]),
        .I2(\dists_1_3_out_load_reg_6847_reg[8]_0 [0]),
        .I3(max_dist_reg_6842[0]),
        .O(icmp_ln45_1_fu_4771_p2_carry_i_8_n_4));
  FDRE \icmp_ln45_1_reg_6863_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .Q(icmp_ln45_1_reg_6863),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_2_fu_4801_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln45_2_fu_4801_p2_carry_n_4,icmp_ln45_2_fu_4801_p2_carry_n_5,icmp_ln45_2_fu_4801_p2_carry_n_6,icmp_ln45_2_fu_4801_p2_carry_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln45_2_fu_4801_p2_carry_i_1_n_4,icmp_ln45_2_fu_4801_p2_carry_i_2_n_4,icmp_ln45_2_fu_4801_p2_carry_i_3_n_4,icmp_ln45_2_fu_4801_p2_carry_i_4_n_4}),
        .O(NLW_icmp_ln45_2_fu_4801_p2_carry_O_UNCONNECTED[3:0]),
        .S({icmp_ln45_2_fu_4801_p2_carry_i_5_n_4,icmp_ln45_2_fu_4801_p2_carry_i_6_n_4,icmp_ln45_2_fu_4801_p2_carry_i_7_n_4,icmp_ln45_2_fu_4801_p2_carry_i_8_n_4}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_2_fu_4801_p2_carry__0
       (.CI(icmp_ln45_2_fu_4801_p2_carry_n_4),
        .CO({icmp_ln45_2_fu_4801_p2_carry__0_n_4,icmp_ln45_2_fu_4801_p2_carry__0_n_5,icmp_ln45_2_fu_4801_p2_carry__0_n_6,icmp_ln45_2_fu_4801_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,icmp_ln45_2_fu_4801_p2_carry__0_i_1_n_4}),
        .O(NLW_icmp_ln45_2_fu_4801_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,icmp_ln45_2_fu_4801_p2_carry__0_i_2_n_4}));
  LUT2 #(
    .INIT(4'h2)) 
    icmp_ln45_2_fu_4801_p2_carry__0_i_1
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [8]),
        .I1(max_dist_1_reg_6868[8]),
        .O(icmp_ln45_2_fu_4801_p2_carry__0_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    icmp_ln45_2_fu_4801_p2_carry__0_i_2
       (.I0(max_dist_1_reg_6868[8]),
        .I1(\dists_2_3_out_load_reg_6874_reg[8]_0 [8]),
        .O(icmp_ln45_2_fu_4801_p2_carry__0_i_2_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_2_fu_4801_p2_carry__1
       (.CI(icmp_ln45_2_fu_4801_p2_carry__0_n_4),
        .CO({icmp_ln45_2_fu_4801_p2_carry__1_n_4,icmp_ln45_2_fu_4801_p2_carry__1_n_5,icmp_ln45_2_fu_4801_p2_carry__1_n_6,icmp_ln45_2_fu_4801_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_2_fu_4801_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_2_fu_4801_p2_carry__2
       (.CI(icmp_ln45_2_fu_4801_p2_carry__1_n_4),
        .CO({icmp_ln45_2_fu_4801_p2,icmp_ln45_2_fu_4801_p2_carry__2_n_5,icmp_ln45_2_fu_4801_p2_carry__2_n_6,icmp_ln45_2_fu_4801_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_2_fu_4801_p2_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_2_fu_4801_p2_carry_i_1
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [6]),
        .I1(max_dist_1_reg_6868[6]),
        .I2(max_dist_1_reg_6868[7]),
        .I3(\dists_2_3_out_load_reg_6874_reg[8]_0 [7]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_1_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_2_fu_4801_p2_carry_i_2
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [4]),
        .I1(max_dist_1_reg_6868[4]),
        .I2(max_dist_1_reg_6868[5]),
        .I3(\dists_2_3_out_load_reg_6874_reg[8]_0 [5]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_2_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_2_fu_4801_p2_carry_i_3
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [2]),
        .I1(max_dist_1_reg_6868[2]),
        .I2(max_dist_1_reg_6868[3]),
        .I3(\dists_2_3_out_load_reg_6874_reg[8]_0 [3]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_3_n_4));
  LUT4 #(
    .INIT(16'h2F02)) 
    icmp_ln45_2_fu_4801_p2_carry_i_4
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [0]),
        .I1(max_dist_1_reg_6868[0]),
        .I2(max_dist_1_reg_6868[1]),
        .I3(\dists_2_3_out_load_reg_6874_reg[8]_0 [1]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_4_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_2_fu_4801_p2_carry_i_5
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [7]),
        .I1(max_dist_1_reg_6868[7]),
        .I2(\dists_2_3_out_load_reg_6874_reg[8]_0 [6]),
        .I3(max_dist_1_reg_6868[6]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_5_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_2_fu_4801_p2_carry_i_6
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [5]),
        .I1(max_dist_1_reg_6868[5]),
        .I2(\dists_2_3_out_load_reg_6874_reg[8]_0 [4]),
        .I3(max_dist_1_reg_6868[4]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_6_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_2_fu_4801_p2_carry_i_7
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [3]),
        .I1(max_dist_1_reg_6868[3]),
        .I2(\dists_2_3_out_load_reg_6874_reg[8]_0 [2]),
        .I3(max_dist_1_reg_6868[2]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_7_n_4));
  LUT4 #(
    .INIT(16'h9009)) 
    icmp_ln45_2_fu_4801_p2_carry_i_8
       (.I0(\dists_2_3_out_load_reg_6874_reg[8]_0 [1]),
        .I1(max_dist_1_reg_6868[1]),
        .I2(\dists_2_3_out_load_reg_6874_reg[8]_0 [0]),
        .I3(max_dist_1_reg_6868[0]),
        .O(icmp_ln45_2_fu_4801_p2_carry_i_8_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_fu_4726_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln45_fu_4726_p2_carry_n_4,icmp_ln45_fu_4726_p2_carry_n_5,icmp_ln45_fu_4726_p2_carry_n_6,icmp_ln45_fu_4726_p2_carry_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln45_fu_4726_p2_carry_i_1_n_4,icmp_ln45_fu_4726_p2_carry_i_2_n_4,icmp_ln45_fu_4726_p2_carry_i_3_n_4,icmp_ln45_fu_4726_p2_carry_i_4_n_4}),
        .O(NLW_icmp_ln45_fu_4726_p2_carry_O_UNCONNECTED[3:0]),
        .S({icmp_ln45_fu_4726_p2_carry_i_5_n_4,icmp_ln45_fu_4726_p2_carry_i_6_n_4,icmp_ln45_fu_4726_p2_carry_i_7_n_4,icmp_ln45_fu_4726_p2_carry_i_8_n_4}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_fu_4726_p2_carry__0
       (.CI(icmp_ln45_fu_4726_p2_carry_n_4),
        .CO({icmp_ln45_fu_4726_p2_carry__0_n_4,icmp_ln45_fu_4726_p2_carry__0_n_5,icmp_ln45_fu_4726_p2_carry__0_n_6,icmp_ln45_fu_4726_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,icmp_ln45_fu_4726_p2_carry__0_i_1_n_4}),
        .O(NLW_icmp_ln45_fu_4726_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,icmp_ln45_fu_4726_p2_carry__0_i_2_n_4}));
  LUT4 #(
    .INIT(16'hEA2A)) 
    icmp_ln45_fu_4726_p2_carry__0_i_1
       (.I0(\dists_0_0_fu_62_reg[8]_1 [8]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[8]),
        .O(icmp_ln45_fu_4726_p2_carry__0_i_1_n_4));
  LUT4 #(
    .INIT(16'h407F)) 
    icmp_ln45_fu_4726_p2_carry__0_i_2
       (.I0(dists_2_6_reg_6929[8]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(Q),
        .I3(\dists_0_0_fu_62_reg[8]_1 [8]),
        .O(icmp_ln45_fu_4726_p2_carry__0_i_2_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_fu_4726_p2_carry__1
       (.CI(icmp_ln45_fu_4726_p2_carry__0_n_4),
        .CO({icmp_ln45_fu_4726_p2_carry__1_n_4,icmp_ln45_fu_4726_p2_carry__1_n_5,icmp_ln45_fu_4726_p2_carry__1_n_6,icmp_ln45_fu_4726_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_fu_4726_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln45_fu_4726_p2_carry__2
       (.CI(icmp_ln45_fu_4726_p2_carry__1_n_4),
        .CO({icmp_ln45_fu_4726_p2_carry__2_n_4,icmp_ln45_fu_4726_p2_carry__2_n_5,icmp_ln45_fu_4726_p2_carry__2_n_6,icmp_ln45_fu_4726_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln45_fu_4726_p2_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  LUT6 #(
    .INIT(64'hFAFFFFFFFACCCCCC)) 
    icmp_ln45_fu_4726_p2_carry_i_1
       (.I0(dists_2_6_reg_6929[6]),
        .I1(\dists_0_0_fu_62_reg[8]_1 [6]),
        .I2(dists_2_6_reg_6929[7]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(Q),
        .I5(\dists_0_0_fu_62_reg[8]_1 [7]),
        .O(icmp_ln45_fu_4726_p2_carry_i_1_n_4));
  LUT6 #(
    .INIT(64'hFAFFFFFFFACCCCCC)) 
    icmp_ln45_fu_4726_p2_carry_i_2
       (.I0(dists_2_6_reg_6929[4]),
        .I1(\dists_0_0_fu_62_reg[8]_1 [4]),
        .I2(dists_2_6_reg_6929[5]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(Q),
        .I5(\dists_0_0_fu_62_reg[8]_1 [5]),
        .O(icmp_ln45_fu_4726_p2_carry_i_2_n_4));
  LUT6 #(
    .INIT(64'hFAFFFFFFFACCCCCC)) 
    icmp_ln45_fu_4726_p2_carry_i_3
       (.I0(dists_2_6_reg_6929[2]),
        .I1(\dists_0_0_fu_62_reg[8]_1 [2]),
        .I2(dists_2_6_reg_6929[3]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(Q),
        .I5(\dists_0_0_fu_62_reg[8]_1 [3]),
        .O(icmp_ln45_fu_4726_p2_carry_i_3_n_4));
  LUT6 #(
    .INIT(64'hFAFFFFFFFACCCCCC)) 
    icmp_ln45_fu_4726_p2_carry_i_4
       (.I0(dists_2_6_reg_6929[0]),
        .I1(\dists_0_0_fu_62_reg[8]_1 [0]),
        .I2(dists_2_6_reg_6929[1]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(Q),
        .I5(\dists_0_0_fu_62_reg[8]_1 [1]),
        .O(icmp_ln45_fu_4726_p2_carry_i_4_n_4));
  LUT6 #(
    .INIT(64'h0000151500C015D5)) 
    icmp_ln45_fu_4726_p2_carry_i_5
       (.I0(\dists_0_0_fu_62_reg[8]_1 [7]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[7]),
        .I4(\dists_0_0_fu_62_reg[8]_1 [6]),
        .I5(dists_2_6_reg_6929[6]),
        .O(icmp_ln45_fu_4726_p2_carry_i_5_n_4));
  LUT6 #(
    .INIT(64'h0000151500C015D5)) 
    icmp_ln45_fu_4726_p2_carry_i_6
       (.I0(\dists_0_0_fu_62_reg[8]_1 [5]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[5]),
        .I4(\dists_0_0_fu_62_reg[8]_1 [4]),
        .I5(dists_2_6_reg_6929[4]),
        .O(icmp_ln45_fu_4726_p2_carry_i_6_n_4));
  LUT6 #(
    .INIT(64'h0000151500C015D5)) 
    icmp_ln45_fu_4726_p2_carry_i_7
       (.I0(\dists_0_0_fu_62_reg[8]_1 [3]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[3]),
        .I4(\dists_0_0_fu_62_reg[8]_1 [2]),
        .I5(dists_2_6_reg_6929[2]),
        .O(icmp_ln45_fu_4726_p2_carry_i_7_n_4));
  LUT6 #(
    .INIT(64'h0000151500C015D5)) 
    icmp_ln45_fu_4726_p2_carry_i_8
       (.I0(\dists_0_0_fu_62_reg[8]_1 [1]),
        .I1(Q),
        .I2(ap_enable_reg_pp0_iter3),
        .I3(dists_2_6_reg_6929[1]),
        .I4(\dists_0_0_fu_62_reg[8]_1 [0]),
        .I5(dists_2_6_reg_6929[0]),
        .O(icmp_ln45_fu_4726_p2_carry_i_8_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln53_fu_4835_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln53_fu_4835_p2_carry_n_4,icmp_ln53_fu_4835_p2_carry_n_5,icmp_ln53_fu_4835_p2_carry_n_6,icmp_ln53_fu_4835_p2_carry_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln53_fu_4835_p2_carry_i_1_n_4,icmp_ln53_fu_4835_p2_carry_i_2_n_4,icmp_ln53_fu_4835_p2_carry_i_3_n_4,icmp_ln53_fu_4835_p2_carry_i_4_n_4}),
        .O(NLW_icmp_ln53_fu_4835_p2_carry_O_UNCONNECTED[3:0]),
        .S({icmp_ln53_fu_4835_p2_carry_i_5_n_4,icmp_ln53_fu_4835_p2_carry_i_6_n_4,icmp_ln53_fu_4835_p2_carry_i_7_n_4,icmp_ln53_fu_4835_p2_carry_i_8_n_4}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln53_fu_4835_p2_carry__0
       (.CI(icmp_ln53_fu_4835_p2_carry_n_4),
        .CO({icmp_ln53_fu_4835_p2_carry__0_n_4,icmp_ln53_fu_4835_p2_carry__0_n_5,icmp_ln53_fu_4835_p2_carry__0_n_6,icmp_ln53_fu_4835_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,icmp_ln53_fu_4835_p2_carry__0_i_1_n_4}),
        .O(NLW_icmp_ln53_fu_4835_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,icmp_ln53_fu_4835_p2_carry__0_i_2_n_4}));
  LUT4 #(
    .INIT(16'h00E2)) 
    icmp_ln53_fu_4835_p2_carry__0_i_1
       (.I0(max_dist_1_reg_6868[8]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(dists_2_3_out_load_reg_6874[8]),
        .I3(dists_0_reg_6881[8]),
        .O(icmp_ln53_fu_4835_p2_carry__0_i_1_n_4));
  LUT4 #(
    .INIT(16'h9A95)) 
    icmp_ln53_fu_4835_p2_carry__0_i_2
       (.I0(dists_0_reg_6881[8]),
        .I1(dists_2_3_out_load_reg_6874[8]),
        .I2(select_ln45_2_reg_6891[1]),
        .I3(max_dist_1_reg_6868[8]),
        .O(icmp_ln53_fu_4835_p2_carry__0_i_2_n_4));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln53_fu_4835_p2_carry__1
       (.CI(icmp_ln53_fu_4835_p2_carry__0_n_4),
        .CO({icmp_ln53_fu_4835_p2_carry__1_n_4,icmp_ln53_fu_4835_p2_carry__1_n_5,icmp_ln53_fu_4835_p2_carry__1_n_6,icmp_ln53_fu_4835_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln53_fu_4835_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln53_fu_4835_p2_carry__2
       (.CI(icmp_ln53_fu_4835_p2_carry__1_n_4),
        .CO({p_1_in,icmp_ln53_fu_4835_p2_carry__2_n_5,icmp_ln53_fu_4835_p2_carry__2_n_6,icmp_ln53_fu_4835_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln53_fu_4835_p2_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  LUT6 #(
    .INIT(64'h2F022F2F2F020202)) 
    icmp_ln53_fu_4835_p2_carry_i_1
       (.I0(icmp_ln53_fu_4835_p2_carry_i_9_n_4),
        .I1(dists_0_reg_6881[6]),
        .I2(dists_0_reg_6881[7]),
        .I3(dists_2_3_out_load_reg_6874[7]),
        .I4(select_ln45_2_reg_6891[1]),
        .I5(max_dist_1_reg_6868[7]),
        .O(icmp_ln53_fu_4835_p2_carry_i_1_n_4));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    icmp_ln53_fu_4835_p2_carry_i_10
       (.I0(dists_2_3_out_load_reg_6874[4]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(max_dist_1_reg_6868[4]),
        .O(icmp_ln53_fu_4835_p2_carry_i_10_n_4));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    icmp_ln53_fu_4835_p2_carry_i_11
       (.I0(dists_2_3_out_load_reg_6874[2]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(max_dist_1_reg_6868[2]),
        .O(icmp_ln53_fu_4835_p2_carry_i_11_n_4));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    icmp_ln53_fu_4835_p2_carry_i_12
       (.I0(dists_2_3_out_load_reg_6874[0]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(max_dist_1_reg_6868[0]),
        .O(icmp_ln53_fu_4835_p2_carry_i_12_n_4));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hE21D)) 
    icmp_ln53_fu_4835_p2_carry_i_13
       (.I0(max_dist_1_reg_6868[7]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(dists_2_3_out_load_reg_6874[7]),
        .I3(dists_0_reg_6881[7]),
        .O(icmp_ln53_fu_4835_p2_carry_i_13_n_4));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hE21D)) 
    icmp_ln53_fu_4835_p2_carry_i_14
       (.I0(max_dist_1_reg_6868[5]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(dists_2_3_out_load_reg_6874[5]),
        .I3(dists_0_reg_6881[5]),
        .O(icmp_ln53_fu_4835_p2_carry_i_14_n_4));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hE21D)) 
    icmp_ln53_fu_4835_p2_carry_i_15
       (.I0(max_dist_1_reg_6868[3]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(dists_2_3_out_load_reg_6874[3]),
        .I3(dists_0_reg_6881[3]),
        .O(icmp_ln53_fu_4835_p2_carry_i_15_n_4));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hE21D)) 
    icmp_ln53_fu_4835_p2_carry_i_16
       (.I0(max_dist_1_reg_6868[1]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(dists_2_3_out_load_reg_6874[1]),
        .I3(dists_0_reg_6881[1]),
        .O(icmp_ln53_fu_4835_p2_carry_i_16_n_4));
  LUT6 #(
    .INIT(64'h2F022F2F2F020202)) 
    icmp_ln53_fu_4835_p2_carry_i_2
       (.I0(icmp_ln53_fu_4835_p2_carry_i_10_n_4),
        .I1(dists_0_reg_6881[4]),
        .I2(dists_0_reg_6881[5]),
        .I3(dists_2_3_out_load_reg_6874[5]),
        .I4(select_ln45_2_reg_6891[1]),
        .I5(max_dist_1_reg_6868[5]),
        .O(icmp_ln53_fu_4835_p2_carry_i_2_n_4));
  LUT6 #(
    .INIT(64'h2F022F2F2F020202)) 
    icmp_ln53_fu_4835_p2_carry_i_3
       (.I0(icmp_ln53_fu_4835_p2_carry_i_11_n_4),
        .I1(dists_0_reg_6881[2]),
        .I2(dists_0_reg_6881[3]),
        .I3(dists_2_3_out_load_reg_6874[3]),
        .I4(select_ln45_2_reg_6891[1]),
        .I5(max_dist_1_reg_6868[3]),
        .O(icmp_ln53_fu_4835_p2_carry_i_3_n_4));
  LUT6 #(
    .INIT(64'h2F022F2F2F020202)) 
    icmp_ln53_fu_4835_p2_carry_i_4
       (.I0(icmp_ln53_fu_4835_p2_carry_i_12_n_4),
        .I1(dists_0_reg_6881[0]),
        .I2(dists_0_reg_6881[1]),
        .I3(dists_2_3_out_load_reg_6874[1]),
        .I4(select_ln45_2_reg_6891[1]),
        .I5(max_dist_1_reg_6868[1]),
        .O(icmp_ln53_fu_4835_p2_carry_i_4_n_4));
  LUT5 #(
    .INIT(32'hA80802A2)) 
    icmp_ln53_fu_4835_p2_carry_i_5
       (.I0(icmp_ln53_fu_4835_p2_carry_i_13_n_4),
        .I1(max_dist_1_reg_6868[6]),
        .I2(select_ln45_2_reg_6891[1]),
        .I3(dists_2_3_out_load_reg_6874[6]),
        .I4(dists_0_reg_6881[6]),
        .O(icmp_ln53_fu_4835_p2_carry_i_5_n_4));
  LUT5 #(
    .INIT(32'hA80802A2)) 
    icmp_ln53_fu_4835_p2_carry_i_6
       (.I0(icmp_ln53_fu_4835_p2_carry_i_14_n_4),
        .I1(max_dist_1_reg_6868[4]),
        .I2(select_ln45_2_reg_6891[1]),
        .I3(dists_2_3_out_load_reg_6874[4]),
        .I4(dists_0_reg_6881[4]),
        .O(icmp_ln53_fu_4835_p2_carry_i_6_n_4));
  LUT5 #(
    .INIT(32'hA80802A2)) 
    icmp_ln53_fu_4835_p2_carry_i_7
       (.I0(icmp_ln53_fu_4835_p2_carry_i_15_n_4),
        .I1(max_dist_1_reg_6868[2]),
        .I2(select_ln45_2_reg_6891[1]),
        .I3(dists_2_3_out_load_reg_6874[2]),
        .I4(dists_0_reg_6881[2]),
        .O(icmp_ln53_fu_4835_p2_carry_i_7_n_4));
  LUT5 #(
    .INIT(32'hA80802A2)) 
    icmp_ln53_fu_4835_p2_carry_i_8
       (.I0(icmp_ln53_fu_4835_p2_carry_i_16_n_4),
        .I1(max_dist_1_reg_6868[0]),
        .I2(select_ln45_2_reg_6891[1]),
        .I3(dists_2_3_out_load_reg_6874[0]),
        .I4(dists_0_reg_6881[0]),
        .O(icmp_ln53_fu_4835_p2_carry_i_8_n_4));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    icmp_ln53_fu_4835_p2_carry_i_9
       (.I0(dists_2_3_out_load_reg_6874[6]),
        .I1(select_ln45_2_reg_6891[1]),
        .I2(max_dist_1_reg_6868[6]),
        .O(icmp_ln53_fu_4835_p2_carry_i_9_n_4));
  FDRE \icmp_ln53_reg_6897_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(p_1_in),
        .Q(icmp_ln53_reg_6897),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \icmp_ln55_1_reg_6909[0]_i_1 
       (.I0(select_ln45_2_reg_6891[0]),
        .I1(select_ln45_2_reg_6891[1]),
        .O(\icmp_ln55_1_reg_6909[0]_i_1_n_4 ));
  FDRE \icmp_ln55_1_reg_6909_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\icmp_ln55_1_reg_6909[0]_i_1_n_4 ),
        .Q(icmp_ln55_1_reg_6909),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \icmp_ln55_reg_6904[0]_i_1 
       (.I0(select_ln45_2_reg_6891[1]),
        .I1(select_ln45_2_reg_6891[0]),
        .O(p_0_in1_in));
  FDRE \icmp_ln55_reg_6904_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(p_0_in1_in),
        .Q(icmp_ln55_reg_6904),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_3_fu_246_reg[0] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_10),
        .D(flow_control_loop_pipe_sequential_init_U_n_54),
        .Q(\labels_0_3_fu_246_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_3_fu_246_reg[1] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_10),
        .D(flow_control_loop_pipe_sequential_init_U_n_53),
        .Q(\labels_0_3_fu_246_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_3_fu_246_reg[2] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_10),
        .D(flow_control_loop_pipe_sequential_init_U_n_52),
        .Q(\labels_0_3_fu_246_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_0_3_fu_246_reg[3] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_10),
        .D(flow_control_loop_pipe_sequential_init_U_n_51),
        .Q(\labels_0_3_fu_246_reg[3]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_3_fu_250_reg[0] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_9),
        .D(flow_control_loop_pipe_sequential_init_U_n_50),
        .Q(\labels_1_3_fu_250_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_3_fu_250_reg[1] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_9),
        .D(flow_control_loop_pipe_sequential_init_U_n_49),
        .Q(\labels_1_3_fu_250_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_3_fu_250_reg[2] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_9),
        .D(flow_control_loop_pipe_sequential_init_U_n_48),
        .Q(\labels_1_3_fu_250_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_1_3_fu_250_reg[3] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_9),
        .D(flow_control_loop_pipe_sequential_init_U_n_47),
        .Q(\labels_1_3_fu_250_reg[3]_0 [3]),
        .R(1'b0));
  FDRE \labels_1_reg_6827_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(training_labels_q0[0]),
        .Q(labels_1_reg_6827[0]),
        .R(1'b0));
  FDRE \labels_1_reg_6827_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(training_labels_q0[1]),
        .Q(labels_1_reg_6827[1]),
        .R(1'b0));
  FDRE \labels_1_reg_6827_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(training_labels_q0[2]),
        .Q(labels_1_reg_6827[2]),
        .R(1'b0));
  FDRE \labels_1_reg_6827_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(training_labels_q0[3]),
        .Q(labels_1_reg_6827[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_3_fu_254_reg[0] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_7),
        .D(flow_control_loop_pipe_sequential_init_U_n_46),
        .Q(\labels_2_3_fu_254_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_3_fu_254_reg[1] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_7),
        .D(flow_control_loop_pipe_sequential_init_U_n_45),
        .Q(\labels_2_3_fu_254_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_3_fu_254_reg[2] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_7),
        .D(flow_control_loop_pipe_sequential_init_U_n_44),
        .Q(\labels_2_3_fu_254_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \labels_2_3_fu_254_reg[3] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_7),
        .D(flow_control_loop_pipe_sequential_init_U_n_43),
        .Q(\labels_2_3_fu_254_reg[3]_0 [3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[0]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [0]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[0]),
        .O(max_dist_1_fu_4777_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[1]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [1]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[1]),
        .O(max_dist_1_fu_4777_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[2]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [2]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[2]),
        .O(max_dist_1_fu_4777_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[3]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [3]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[3]),
        .O(max_dist_1_fu_4777_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[4]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [4]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[4]),
        .O(max_dist_1_fu_4777_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[5]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [5]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[5]),
        .O(max_dist_1_fu_4777_p3[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[6]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [6]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[6]),
        .O(max_dist_1_fu_4777_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[7]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [7]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[7]),
        .O(max_dist_1_fu_4777_p3[7]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \max_dist_1_reg_6868[8]_i_1 
       (.I0(\dists_1_3_out_load_reg_6847_reg[8]_0 [8]),
        .I1(icmp_ln45_1_fu_4771_p2_carry__2_n_4),
        .I2(max_dist_reg_6842[8]),
        .O(max_dist_1_fu_4777_p3[8]));
  FDRE \max_dist_1_reg_6868_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[0]),
        .Q(max_dist_1_reg_6868[0]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[1]),
        .Q(max_dist_1_reg_6868[1]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[2]),
        .Q(max_dist_1_reg_6868[2]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[3]),
        .Q(max_dist_1_reg_6868[3]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[4]),
        .Q(max_dist_1_reg_6868[4]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[5]),
        .Q(max_dist_1_reg_6868[5]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[6]),
        .Q(max_dist_1_reg_6868[6]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[7]),
        .Q(max_dist_1_reg_6868[7]),
        .R(1'b0));
  FDRE \max_dist_1_reg_6868_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(max_dist_1_fu_4777_p3[8]),
        .Q(max_dist_1_reg_6868[8]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \max_dist_reg_6842[8]_i_1 
       (.I0(Q),
        .I1(icmp_ln45_fu_4726_p2_carry__2_n_4),
        .O(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[0]),
        .Q(max_dist_reg_6842[0]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[1]),
        .Q(max_dist_reg_6842[1]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[2]),
        .Q(max_dist_reg_6842[2]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[3]),
        .Q(max_dist_reg_6842[3]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[4] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[4]),
        .Q(max_dist_reg_6842[4]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[5] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[5]),
        .Q(max_dist_reg_6842[5]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[6] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[6]),
        .Q(max_dist_reg_6842[6]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[7] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[7]),
        .Q(max_dist_reg_6842[7]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  FDRE \max_dist_reg_6842_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(trunc_ln107_fu_4714_p1[8]),
        .Q(max_dist_reg_6842[8]),
        .R(\max_dist_reg_6842[8]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \or_ln55_reg_6914[0]_i_1 
       (.I0(select_ln45_2_reg_6891[1]),
        .O(p_0_in2_out));
  FDRE \or_ln55_reg_6914_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(p_0_in2_out),
        .Q(or_ln55_reg_6914),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hE2E2E200)) 
    \reg_414[63]_i_1 
       (.I0(ap_enable_reg_pp0_iter0_reg),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(ap_CS_fsm_pp0_stage2),
        .I4(Q),
        .O(reg_4140));
  FDRE \reg_414_reg[0] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[0]),
        .Q(reg_414[0]),
        .R(1'b0));
  FDRE \reg_414_reg[10] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[10]),
        .Q(reg_414[10]),
        .R(1'b0));
  FDRE \reg_414_reg[11] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[11]),
        .Q(reg_414[11]),
        .R(1'b0));
  FDRE \reg_414_reg[12] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[12]),
        .Q(reg_414[12]),
        .R(1'b0));
  FDRE \reg_414_reg[13] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[13]),
        .Q(reg_414[13]),
        .R(1'b0));
  FDRE \reg_414_reg[14] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[14]),
        .Q(reg_414[14]),
        .R(1'b0));
  FDRE \reg_414_reg[15] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[15]),
        .Q(reg_414[15]),
        .R(1'b0));
  FDRE \reg_414_reg[16] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[16]),
        .Q(reg_414[16]),
        .R(1'b0));
  FDRE \reg_414_reg[17] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[17]),
        .Q(reg_414[17]),
        .R(1'b0));
  FDRE \reg_414_reg[18] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[18]),
        .Q(reg_414[18]),
        .R(1'b0));
  FDRE \reg_414_reg[19] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[19]),
        .Q(reg_414[19]),
        .R(1'b0));
  FDRE \reg_414_reg[1] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[1]),
        .Q(reg_414[1]),
        .R(1'b0));
  FDRE \reg_414_reg[20] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[20]),
        .Q(reg_414[20]),
        .R(1'b0));
  FDRE \reg_414_reg[21] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[21]),
        .Q(reg_414[21]),
        .R(1'b0));
  FDRE \reg_414_reg[22] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[22]),
        .Q(reg_414[22]),
        .R(1'b0));
  FDRE \reg_414_reg[23] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[23]),
        .Q(reg_414[23]),
        .R(1'b0));
  FDRE \reg_414_reg[24] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[24]),
        .Q(reg_414[24]),
        .R(1'b0));
  FDRE \reg_414_reg[25] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[25]),
        .Q(reg_414[25]),
        .R(1'b0));
  FDRE \reg_414_reg[26] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[26]),
        .Q(reg_414[26]),
        .R(1'b0));
  FDRE \reg_414_reg[27] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[27]),
        .Q(reg_414[27]),
        .R(1'b0));
  FDRE \reg_414_reg[28] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[28]),
        .Q(reg_414[28]),
        .R(1'b0));
  FDRE \reg_414_reg[29] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[29]),
        .Q(reg_414[29]),
        .R(1'b0));
  FDRE \reg_414_reg[2] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[2]),
        .Q(reg_414[2]),
        .R(1'b0));
  FDRE \reg_414_reg[30] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[30]),
        .Q(reg_414[30]),
        .R(1'b0));
  FDRE \reg_414_reg[31] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[31]),
        .Q(reg_414[31]),
        .R(1'b0));
  FDRE \reg_414_reg[32] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[32]),
        .Q(reg_414[32]),
        .R(1'b0));
  FDRE \reg_414_reg[33] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[33]),
        .Q(reg_414[33]),
        .R(1'b0));
  FDRE \reg_414_reg[34] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[34]),
        .Q(reg_414[34]),
        .R(1'b0));
  FDRE \reg_414_reg[35] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[35]),
        .Q(reg_414[35]),
        .R(1'b0));
  FDRE \reg_414_reg[36] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[36]),
        .Q(reg_414[36]),
        .R(1'b0));
  FDRE \reg_414_reg[37] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[37]),
        .Q(reg_414[37]),
        .R(1'b0));
  FDRE \reg_414_reg[38] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[38]),
        .Q(reg_414[38]),
        .R(1'b0));
  FDRE \reg_414_reg[39] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[39]),
        .Q(reg_414[39]),
        .R(1'b0));
  FDRE \reg_414_reg[3] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[3]),
        .Q(reg_414[3]),
        .R(1'b0));
  FDRE \reg_414_reg[40] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[40]),
        .Q(reg_414[40]),
        .R(1'b0));
  FDRE \reg_414_reg[41] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[41]),
        .Q(reg_414[41]),
        .R(1'b0));
  FDRE \reg_414_reg[42] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[42]),
        .Q(reg_414[42]),
        .R(1'b0));
  FDRE \reg_414_reg[43] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[43]),
        .Q(reg_414[43]),
        .R(1'b0));
  FDRE \reg_414_reg[44] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[44]),
        .Q(reg_414[44]),
        .R(1'b0));
  FDRE \reg_414_reg[45] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[45]),
        .Q(reg_414[45]),
        .R(1'b0));
  FDRE \reg_414_reg[46] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[46]),
        .Q(reg_414[46]),
        .R(1'b0));
  FDRE \reg_414_reg[47] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[47]),
        .Q(reg_414[47]),
        .R(1'b0));
  FDRE \reg_414_reg[48] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[48]),
        .Q(reg_414[48]),
        .R(1'b0));
  FDRE \reg_414_reg[49] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[49]),
        .Q(reg_414[49]),
        .R(1'b0));
  FDRE \reg_414_reg[4] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[4]),
        .Q(reg_414[4]),
        .R(1'b0));
  FDRE \reg_414_reg[50] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[50]),
        .Q(reg_414[50]),
        .R(1'b0));
  FDRE \reg_414_reg[51] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[51]),
        .Q(reg_414[51]),
        .R(1'b0));
  FDRE \reg_414_reg[52] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[52]),
        .Q(reg_414[52]),
        .R(1'b0));
  FDRE \reg_414_reg[53] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[53]),
        .Q(reg_414[53]),
        .R(1'b0));
  FDRE \reg_414_reg[54] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[54]),
        .Q(reg_414[54]),
        .R(1'b0));
  FDRE \reg_414_reg[55] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[55]),
        .Q(reg_414[55]),
        .R(1'b0));
  FDRE \reg_414_reg[56] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[56]),
        .Q(reg_414[56]),
        .R(1'b0));
  FDRE \reg_414_reg[57] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[57]),
        .Q(reg_414[57]),
        .R(1'b0));
  FDRE \reg_414_reg[58] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[58]),
        .Q(reg_414[58]),
        .R(1'b0));
  FDRE \reg_414_reg[59] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[59]),
        .Q(reg_414[59]),
        .R(1'b0));
  FDRE \reg_414_reg[5] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[5]),
        .Q(reg_414[5]),
        .R(1'b0));
  FDRE \reg_414_reg[60] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[60]),
        .Q(reg_414[60]),
        .R(1'b0));
  FDRE \reg_414_reg[61] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[61]),
        .Q(reg_414[61]),
        .R(1'b0));
  FDRE \reg_414_reg[62] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[62]),
        .Q(reg_414[62]),
        .R(1'b0));
  FDRE \reg_414_reg[63] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[63]),
        .Q(reg_414[63]),
        .R(1'b0));
  FDRE \reg_414_reg[6] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[6]),
        .Q(reg_414[6]),
        .R(1'b0));
  FDRE \reg_414_reg[7] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[7]),
        .Q(reg_414[7]),
        .R(1'b0));
  FDRE \reg_414_reg[8] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[8]),
        .Q(reg_414[8]),
        .R(1'b0));
  FDRE \reg_414_reg[9] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q1[9]),
        .Q(reg_414[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[0]_i_1 
       (.I0(test_set_q0[0]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[0]),
        .O(\reg_418[0]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[10]_i_1 
       (.I0(test_set_q0[10]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[10]),
        .O(\reg_418[10]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[11]_i_1 
       (.I0(test_set_q0[11]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[11]),
        .O(\reg_418[11]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[12]_i_1 
       (.I0(test_set_q0[12]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[12]),
        .O(\reg_418[12]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[13]_i_1 
       (.I0(test_set_q0[13]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[13]),
        .O(\reg_418[13]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[14]_i_1 
       (.I0(test_set_q0[14]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[14]),
        .O(\reg_418[14]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[15]_i_1 
       (.I0(test_set_q0[15]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[15]),
        .O(\reg_418[15]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[16]_i_1 
       (.I0(test_set_q0[16]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[16]),
        .O(\reg_418[16]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[17]_i_1 
       (.I0(test_set_q0[17]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[17]),
        .O(\reg_418[17]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[18]_i_1 
       (.I0(test_set_q0[18]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[18]),
        .O(\reg_418[18]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[19]_i_1 
       (.I0(test_set_q0[19]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[19]),
        .O(\reg_418[19]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[1]_i_1 
       (.I0(test_set_q0[1]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[1]),
        .O(\reg_418[1]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[20]_i_1 
       (.I0(test_set_q0[20]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[20]),
        .O(\reg_418[20]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[21]_i_1 
       (.I0(test_set_q0[21]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[21]),
        .O(\reg_418[21]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[22]_i_1 
       (.I0(test_set_q0[22]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[22]),
        .O(\reg_418[22]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[23]_i_1 
       (.I0(test_set_q0[23]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[23]),
        .O(\reg_418[23]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[24]_i_1 
       (.I0(test_set_q0[24]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[24]),
        .O(\reg_418[24]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[25]_i_1 
       (.I0(test_set_q0[25]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[25]),
        .O(\reg_418[25]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[26]_i_1 
       (.I0(test_set_q0[26]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[26]),
        .O(\reg_418[26]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[27]_i_1 
       (.I0(test_set_q0[27]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[27]),
        .O(\reg_418[27]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[28]_i_1 
       (.I0(test_set_q0[28]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[28]),
        .O(\reg_418[28]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[29]_i_1 
       (.I0(test_set_q0[29]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[29]),
        .O(\reg_418[29]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[2]_i_1 
       (.I0(test_set_q0[2]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[2]),
        .O(\reg_418[2]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[30]_i_1 
       (.I0(test_set_q0[30]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[30]),
        .O(\reg_418[30]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[31]_i_1 
       (.I0(test_set_q0[31]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[31]),
        .O(\reg_418[31]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[32]_i_1 
       (.I0(test_set_q0[32]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[32]),
        .O(\reg_418[32]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[33]_i_1 
       (.I0(test_set_q0[33]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[33]),
        .O(\reg_418[33]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[34]_i_1 
       (.I0(test_set_q0[34]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[34]),
        .O(\reg_418[34]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[35]_i_1 
       (.I0(test_set_q0[35]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[35]),
        .O(\reg_418[35]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[36]_i_1 
       (.I0(test_set_q0[36]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[36]),
        .O(\reg_418[36]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[37]_i_1 
       (.I0(test_set_q0[37]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[37]),
        .O(\reg_418[37]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[38]_i_1 
       (.I0(test_set_q0[38]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[38]),
        .O(\reg_418[38]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[39]_i_1 
       (.I0(test_set_q0[39]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[39]),
        .O(\reg_418[39]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[3]_i_1 
       (.I0(test_set_q0[3]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[3]),
        .O(\reg_418[3]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[40]_i_1 
       (.I0(test_set_q0[40]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[40]),
        .O(\reg_418[40]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[41]_i_1 
       (.I0(test_set_q0[41]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[41]),
        .O(\reg_418[41]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[42]_i_1 
       (.I0(test_set_q0[42]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[42]),
        .O(\reg_418[42]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[43]_i_1 
       (.I0(test_set_q0[43]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[43]),
        .O(\reg_418[43]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[44]_i_1 
       (.I0(test_set_q0[44]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[44]),
        .O(\reg_418[44]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[45]_i_1 
       (.I0(test_set_q0[45]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[45]),
        .O(\reg_418[45]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[46]_i_1 
       (.I0(test_set_q0[46]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[46]),
        .O(\reg_418[46]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[47]_i_1 
       (.I0(test_set_q0[47]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[47]),
        .O(\reg_418[47]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[48]_i_1 
       (.I0(test_set_q0[48]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[48]),
        .O(\reg_418[48]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[49]_i_1 
       (.I0(test_set_q0[49]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[49]),
        .O(\reg_418[49]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[4]_i_1 
       (.I0(test_set_q0[4]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[4]),
        .O(\reg_418[4]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[50]_i_1 
       (.I0(test_set_q0[50]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[50]),
        .O(\reg_418[50]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[51]_i_1 
       (.I0(test_set_q0[51]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[51]),
        .O(\reg_418[51]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[52]_i_1 
       (.I0(test_set_q0[52]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[52]),
        .O(\reg_418[52]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[53]_i_1 
       (.I0(test_set_q0[53]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[53]),
        .O(\reg_418[53]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[54]_i_1 
       (.I0(test_set_q0[54]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[54]),
        .O(\reg_418[54]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[55]_i_1 
       (.I0(test_set_q0[55]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[55]),
        .O(\reg_418[55]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[56]_i_1 
       (.I0(test_set_q0[56]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[56]),
        .O(\reg_418[56]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[57]_i_1 
       (.I0(test_set_q0[57]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[57]),
        .O(\reg_418[57]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[58]_i_1 
       (.I0(test_set_q0[58]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[58]),
        .O(\reg_418[58]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[59]_i_1 
       (.I0(test_set_q0[59]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[59]),
        .O(\reg_418[59]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[5]_i_1 
       (.I0(test_set_q0[5]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[5]),
        .O(\reg_418[5]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[60]_i_1 
       (.I0(test_set_q0[60]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[60]),
        .O(\reg_418[60]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[61]_i_1 
       (.I0(test_set_q0[61]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[61]),
        .O(\reg_418[61]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[62]_i_1 
       (.I0(test_set_q0[62]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[62]),
        .O(\reg_418[62]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[63]_i_1 
       (.I0(test_set_q0[63]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[63]),
        .O(\reg_418[63]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[6]_i_1 
       (.I0(test_set_q0[6]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[6]),
        .O(\reg_418[6]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[7]_i_1 
       (.I0(test_set_q0[7]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[7]),
        .O(\reg_418[7]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[8]_i_1 
       (.I0(test_set_q0[8]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[8]),
        .O(\reg_418[8]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_418[9]_i_1 
       (.I0(test_set_q0[9]),
        .I1(ap_CS_fsm_pp0_stage2),
        .I2(test_set_q1[9]),
        .O(\reg_418[9]_i_1_n_4 ));
  FDRE \reg_418_reg[0] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[0]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[0] ),
        .R(1'b0));
  FDRE \reg_418_reg[10] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[10]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[10] ),
        .R(1'b0));
  FDRE \reg_418_reg[11] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[11]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[11] ),
        .R(1'b0));
  FDRE \reg_418_reg[12] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[12]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[12] ),
        .R(1'b0));
  FDRE \reg_418_reg[13] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[13]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[13] ),
        .R(1'b0));
  FDRE \reg_418_reg[14] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[14]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[14] ),
        .R(1'b0));
  FDRE \reg_418_reg[15] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[15]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[15] ),
        .R(1'b0));
  FDRE \reg_418_reg[16] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[16]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[16] ),
        .R(1'b0));
  FDRE \reg_418_reg[17] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[17]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[17] ),
        .R(1'b0));
  FDRE \reg_418_reg[18] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[18]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[18] ),
        .R(1'b0));
  FDRE \reg_418_reg[19] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[19]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[19] ),
        .R(1'b0));
  FDRE \reg_418_reg[1] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[1]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[1] ),
        .R(1'b0));
  FDRE \reg_418_reg[20] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[20]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[20] ),
        .R(1'b0));
  FDRE \reg_418_reg[21] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[21]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[21] ),
        .R(1'b0));
  FDRE \reg_418_reg[22] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[22]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[22] ),
        .R(1'b0));
  FDRE \reg_418_reg[23] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[23]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[23] ),
        .R(1'b0));
  FDRE \reg_418_reg[24] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[24]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[24] ),
        .R(1'b0));
  FDRE \reg_418_reg[25] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[25]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[25] ),
        .R(1'b0));
  FDRE \reg_418_reg[26] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[26]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[26] ),
        .R(1'b0));
  FDRE \reg_418_reg[27] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[27]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[27] ),
        .R(1'b0));
  FDRE \reg_418_reg[28] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[28]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[28] ),
        .R(1'b0));
  FDRE \reg_418_reg[29] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[29]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[29] ),
        .R(1'b0));
  FDRE \reg_418_reg[2] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[2]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[2] ),
        .R(1'b0));
  FDRE \reg_418_reg[30] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[30]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[30] ),
        .R(1'b0));
  FDRE \reg_418_reg[31] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[31]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[31] ),
        .R(1'b0));
  FDRE \reg_418_reg[32] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[32]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[32] ),
        .R(1'b0));
  FDRE \reg_418_reg[33] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[33]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[33] ),
        .R(1'b0));
  FDRE \reg_418_reg[34] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[34]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[34] ),
        .R(1'b0));
  FDRE \reg_418_reg[35] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[35]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[35] ),
        .R(1'b0));
  FDRE \reg_418_reg[36] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[36]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[36] ),
        .R(1'b0));
  FDRE \reg_418_reg[37] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[37]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[37] ),
        .R(1'b0));
  FDRE \reg_418_reg[38] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[38]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[38] ),
        .R(1'b0));
  FDRE \reg_418_reg[39] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[39]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[39] ),
        .R(1'b0));
  FDRE \reg_418_reg[3] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[3]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[3] ),
        .R(1'b0));
  FDRE \reg_418_reg[40] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[40]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[40] ),
        .R(1'b0));
  FDRE \reg_418_reg[41] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[41]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[41] ),
        .R(1'b0));
  FDRE \reg_418_reg[42] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[42]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[42] ),
        .R(1'b0));
  FDRE \reg_418_reg[43] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[43]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[43] ),
        .R(1'b0));
  FDRE \reg_418_reg[44] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[44]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[44] ),
        .R(1'b0));
  FDRE \reg_418_reg[45] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[45]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[45] ),
        .R(1'b0));
  FDRE \reg_418_reg[46] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[46]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[46] ),
        .R(1'b0));
  FDRE \reg_418_reg[47] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[47]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[47] ),
        .R(1'b0));
  FDRE \reg_418_reg[48] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[48]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[48] ),
        .R(1'b0));
  FDRE \reg_418_reg[49] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[49]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[49] ),
        .R(1'b0));
  FDRE \reg_418_reg[4] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[4]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[4] ),
        .R(1'b0));
  FDRE \reg_418_reg[50] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[50]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[50] ),
        .R(1'b0));
  FDRE \reg_418_reg[51] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[51]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[51] ),
        .R(1'b0));
  FDRE \reg_418_reg[52] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[52]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[52] ),
        .R(1'b0));
  FDRE \reg_418_reg[53] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[53]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[53] ),
        .R(1'b0));
  FDRE \reg_418_reg[54] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[54]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[54] ),
        .R(1'b0));
  FDRE \reg_418_reg[55] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[55]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[55] ),
        .R(1'b0));
  FDRE \reg_418_reg[56] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[56]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[56] ),
        .R(1'b0));
  FDRE \reg_418_reg[57] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[57]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[57] ),
        .R(1'b0));
  FDRE \reg_418_reg[58] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[58]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[58] ),
        .R(1'b0));
  FDRE \reg_418_reg[59] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[59]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[59] ),
        .R(1'b0));
  FDRE \reg_418_reg[5] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[5]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[5] ),
        .R(1'b0));
  FDRE \reg_418_reg[60] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[60]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[60] ),
        .R(1'b0));
  FDRE \reg_418_reg[61] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[61]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[61] ),
        .R(1'b0));
  FDRE \reg_418_reg[62] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[62]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[62] ),
        .R(1'b0));
  FDRE \reg_418_reg[63] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[63]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[63] ),
        .R(1'b0));
  FDRE \reg_418_reg[6] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[6]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[6] ),
        .R(1'b0));
  FDRE \reg_418_reg[7] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[7]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[7] ),
        .R(1'b0));
  FDRE \reg_418_reg[8] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[8]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[8] ),
        .R(1'b0));
  FDRE \reg_418_reg[9] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(\reg_418[9]_i_1_n_4 ),
        .Q(\reg_418_reg_n_4_[9] ),
        .R(1'b0));
  FDRE \reg_423_reg[0] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[0]),
        .Q(reg_423[0]),
        .R(1'b0));
  FDRE \reg_423_reg[10] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[10]),
        .Q(reg_423[10]),
        .R(1'b0));
  FDRE \reg_423_reg[11] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[11]),
        .Q(reg_423[11]),
        .R(1'b0));
  FDRE \reg_423_reg[12] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[12]),
        .Q(reg_423[12]),
        .R(1'b0));
  FDRE \reg_423_reg[13] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[13]),
        .Q(reg_423[13]),
        .R(1'b0));
  FDRE \reg_423_reg[14] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[14]),
        .Q(reg_423[14]),
        .R(1'b0));
  FDRE \reg_423_reg[15] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[15]),
        .Q(reg_423[15]),
        .R(1'b0));
  FDRE \reg_423_reg[16] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[16]),
        .Q(reg_423[16]),
        .R(1'b0));
  FDRE \reg_423_reg[17] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[17]),
        .Q(reg_423[17]),
        .R(1'b0));
  FDRE \reg_423_reg[18] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[18]),
        .Q(reg_423[18]),
        .R(1'b0));
  FDRE \reg_423_reg[19] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[19]),
        .Q(reg_423[19]),
        .R(1'b0));
  FDRE \reg_423_reg[1] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[1]),
        .Q(reg_423[1]),
        .R(1'b0));
  FDRE \reg_423_reg[20] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[20]),
        .Q(reg_423[20]),
        .R(1'b0));
  FDRE \reg_423_reg[21] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[21]),
        .Q(reg_423[21]),
        .R(1'b0));
  FDRE \reg_423_reg[22] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[22]),
        .Q(reg_423[22]),
        .R(1'b0));
  FDRE \reg_423_reg[23] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[23]),
        .Q(reg_423[23]),
        .R(1'b0));
  FDRE \reg_423_reg[24] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[24]),
        .Q(reg_423[24]),
        .R(1'b0));
  FDRE \reg_423_reg[25] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[25]),
        .Q(reg_423[25]),
        .R(1'b0));
  FDRE \reg_423_reg[26] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[26]),
        .Q(reg_423[26]),
        .R(1'b0));
  FDRE \reg_423_reg[27] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[27]),
        .Q(reg_423[27]),
        .R(1'b0));
  FDRE \reg_423_reg[28] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[28]),
        .Q(reg_423[28]),
        .R(1'b0));
  FDRE \reg_423_reg[29] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[29]),
        .Q(reg_423[29]),
        .R(1'b0));
  FDRE \reg_423_reg[2] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[2]),
        .Q(reg_423[2]),
        .R(1'b0));
  FDRE \reg_423_reg[30] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[30]),
        .Q(reg_423[30]),
        .R(1'b0));
  FDRE \reg_423_reg[31] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[31]),
        .Q(reg_423[31]),
        .R(1'b0));
  FDRE \reg_423_reg[32] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[32]),
        .Q(reg_423[32]),
        .R(1'b0));
  FDRE \reg_423_reg[33] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[33]),
        .Q(reg_423[33]),
        .R(1'b0));
  FDRE \reg_423_reg[34] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[34]),
        .Q(reg_423[34]),
        .R(1'b0));
  FDRE \reg_423_reg[35] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[35]),
        .Q(reg_423[35]),
        .R(1'b0));
  FDRE \reg_423_reg[36] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[36]),
        .Q(reg_423[36]),
        .R(1'b0));
  FDRE \reg_423_reg[37] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[37]),
        .Q(reg_423[37]),
        .R(1'b0));
  FDRE \reg_423_reg[38] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[38]),
        .Q(reg_423[38]),
        .R(1'b0));
  FDRE \reg_423_reg[39] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[39]),
        .Q(reg_423[39]),
        .R(1'b0));
  FDRE \reg_423_reg[3] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[3]),
        .Q(reg_423[3]),
        .R(1'b0));
  FDRE \reg_423_reg[40] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[40]),
        .Q(reg_423[40]),
        .R(1'b0));
  FDRE \reg_423_reg[41] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[41]),
        .Q(reg_423[41]),
        .R(1'b0));
  FDRE \reg_423_reg[42] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[42]),
        .Q(reg_423[42]),
        .R(1'b0));
  FDRE \reg_423_reg[43] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[43]),
        .Q(reg_423[43]),
        .R(1'b0));
  FDRE \reg_423_reg[44] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[44]),
        .Q(reg_423[44]),
        .R(1'b0));
  FDRE \reg_423_reg[45] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[45]),
        .Q(reg_423[45]),
        .R(1'b0));
  FDRE \reg_423_reg[46] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[46]),
        .Q(reg_423[46]),
        .R(1'b0));
  FDRE \reg_423_reg[47] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[47]),
        .Q(reg_423[47]),
        .R(1'b0));
  FDRE \reg_423_reg[48] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[48]),
        .Q(reg_423[48]),
        .R(1'b0));
  FDRE \reg_423_reg[49] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[49]),
        .Q(reg_423[49]),
        .R(1'b0));
  FDRE \reg_423_reg[4] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[4]),
        .Q(reg_423[4]),
        .R(1'b0));
  FDRE \reg_423_reg[50] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[50]),
        .Q(reg_423[50]),
        .R(1'b0));
  FDRE \reg_423_reg[51] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[51]),
        .Q(reg_423[51]),
        .R(1'b0));
  FDRE \reg_423_reg[52] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[52]),
        .Q(reg_423[52]),
        .R(1'b0));
  FDRE \reg_423_reg[53] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[53]),
        .Q(reg_423[53]),
        .R(1'b0));
  FDRE \reg_423_reg[54] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[54]),
        .Q(reg_423[54]),
        .R(1'b0));
  FDRE \reg_423_reg[55] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[55]),
        .Q(reg_423[55]),
        .R(1'b0));
  FDRE \reg_423_reg[56] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[56]),
        .Q(reg_423[56]),
        .R(1'b0));
  FDRE \reg_423_reg[57] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[57]),
        .Q(reg_423[57]),
        .R(1'b0));
  FDRE \reg_423_reg[58] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[58]),
        .Q(reg_423[58]),
        .R(1'b0));
  FDRE \reg_423_reg[59] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[59]),
        .Q(reg_423[59]),
        .R(1'b0));
  FDRE \reg_423_reg[5] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[5]),
        .Q(reg_423[5]),
        .R(1'b0));
  FDRE \reg_423_reg[60] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[60]),
        .Q(reg_423[60]),
        .R(1'b0));
  FDRE \reg_423_reg[61] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[61]),
        .Q(reg_423[61]),
        .R(1'b0));
  FDRE \reg_423_reg[62] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[62]),
        .Q(reg_423[62]),
        .R(1'b0));
  FDRE \reg_423_reg[63] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[63]),
        .Q(reg_423[63]),
        .R(1'b0));
  FDRE \reg_423_reg[6] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[6]),
        .Q(reg_423[6]),
        .R(1'b0));
  FDRE \reg_423_reg[7] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[7]),
        .Q(reg_423[7]),
        .R(1'b0));
  FDRE \reg_423_reg[8] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[8]),
        .Q(reg_423[8]),
        .R(1'b0));
  FDRE \reg_423_reg[9] 
       (.C(ap_clk),
        .CE(reg_4140),
        .D(training_samples_q0[9]),
        .Q(reg_423[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[0]_i_1 
       (.I0(\reg_418_reg_n_4_[0] ),
        .I1(reg_423[0]),
        .O(grp_fu_427_p2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[10]_i_1 
       (.I0(\reg_418_reg_n_4_[10] ),
        .I1(reg_423[10]),
        .O(grp_fu_427_p2[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[12]_i_1 
       (.I0(\reg_418_reg_n_4_[12] ),
        .I1(reg_423[12]),
        .O(grp_fu_427_p2[12]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[14]_i_1 
       (.I0(\reg_418_reg_n_4_[14] ),
        .I1(reg_423[14]),
        .O(grp_fu_427_p2[14]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[16]_i_1 
       (.I0(\reg_418_reg_n_4_[16] ),
        .I1(reg_423[16]),
        .O(grp_fu_427_p2[16]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[18]_i_1 
       (.I0(\reg_418_reg_n_4_[18] ),
        .I1(reg_423[18]),
        .O(grp_fu_427_p2[18]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[20]_i_1 
       (.I0(\reg_418_reg_n_4_[20] ),
        .I1(reg_423[20]),
        .O(grp_fu_427_p2[20]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[22]_i_1 
       (.I0(\reg_418_reg_n_4_[22] ),
        .I1(reg_423[22]),
        .O(grp_fu_427_p2[22]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[24]_i_1 
       (.I0(\reg_418_reg_n_4_[24] ),
        .I1(reg_423[24]),
        .O(grp_fu_427_p2[24]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[26]_i_1 
       (.I0(\reg_418_reg_n_4_[26] ),
        .I1(reg_423[26]),
        .O(grp_fu_427_p2[26]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[28]_i_1 
       (.I0(\reg_418_reg_n_4_[28] ),
        .I1(reg_423[28]),
        .O(grp_fu_427_p2[28]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[2]_i_1 
       (.I0(\reg_418_reg_n_4_[2] ),
        .I1(reg_423[2]),
        .O(grp_fu_427_p2[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[30]_i_1 
       (.I0(\reg_418_reg_n_4_[30] ),
        .I1(reg_423[30]),
        .O(grp_fu_427_p2[30]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[32]_i_1 
       (.I0(\reg_418_reg_n_4_[32] ),
        .I1(reg_423[32]),
        .O(grp_fu_427_p2[32]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[34]_i_1 
       (.I0(\reg_418_reg_n_4_[34] ),
        .I1(reg_423[34]),
        .O(grp_fu_427_p2[34]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[36]_i_1 
       (.I0(\reg_418_reg_n_4_[36] ),
        .I1(reg_423[36]),
        .O(grp_fu_427_p2[36]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[38]_i_1 
       (.I0(\reg_418_reg_n_4_[38] ),
        .I1(reg_423[38]),
        .O(grp_fu_427_p2[38]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[40]_i_1 
       (.I0(\reg_418_reg_n_4_[40] ),
        .I1(reg_423[40]),
        .O(grp_fu_427_p2[40]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[42]_i_1 
       (.I0(\reg_418_reg_n_4_[42] ),
        .I1(reg_423[42]),
        .O(grp_fu_427_p2[42]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[44]_i_1 
       (.I0(\reg_418_reg_n_4_[44] ),
        .I1(reg_423[44]),
        .O(grp_fu_427_p2[44]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[46]_i_1 
       (.I0(\reg_418_reg_n_4_[46] ),
        .I1(reg_423[46]),
        .O(grp_fu_427_p2[46]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[48]_i_1 
       (.I0(\reg_418_reg_n_4_[48] ),
        .I1(reg_423[48]),
        .O(grp_fu_427_p2[48]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[4]_i_1 
       (.I0(\reg_418_reg_n_4_[4] ),
        .I1(reg_423[4]),
        .O(grp_fu_427_p2[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[50]_i_1 
       (.I0(\reg_418_reg_n_4_[50] ),
        .I1(reg_423[50]),
        .O(grp_fu_427_p2[50]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[52]_i_1 
       (.I0(\reg_418_reg_n_4_[52] ),
        .I1(reg_423[52]),
        .O(grp_fu_427_p2[52]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[54]_i_1 
       (.I0(\reg_418_reg_n_4_[54] ),
        .I1(reg_423[54]),
        .O(grp_fu_427_p2[54]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[56]_i_1 
       (.I0(\reg_418_reg_n_4_[56] ),
        .I1(reg_423[56]),
        .O(grp_fu_427_p2[56]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[58]_i_1 
       (.I0(\reg_418_reg_n_4_[58] ),
        .I1(reg_423[58]),
        .O(grp_fu_427_p2[58]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[60]_i_1 
       (.I0(\reg_418_reg_n_4_[60] ),
        .I1(reg_423[60]),
        .O(grp_fu_427_p2[60]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[62]_i_1 
       (.I0(\reg_418_reg_n_4_[62] ),
        .I1(reg_423[62]),
        .O(grp_fu_427_p2[62]));
  LUT5 #(
    .INIT(32'hCFC08A80)) 
    \reg_689[63]_i_1 
       (.I0(ap_CS_fsm_pp0_stage2),
        .I1(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(ap_enable_reg_pp0_iter0_reg),
        .I4(ap_CS_fsm_pp0_stage3),
        .O(reg_6890));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[6]_i_1 
       (.I0(\reg_418_reg_n_4_[6] ),
        .I1(reg_423[6]),
        .O(grp_fu_427_p2[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_689[8]_i_1 
       (.I0(\reg_418_reg_n_4_[8] ),
        .I1(reg_423[8]),
        .O(grp_fu_427_p2[8]));
  FDRE \reg_689_reg[0] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[0]),
        .Q(reg_689[0]),
        .R(1'b0));
  FDRE \reg_689_reg[10] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[10]),
        .Q(reg_689[10]),
        .R(1'b0));
  FDRE \reg_689_reg[11] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[11]),
        .Q(reg_689[11]),
        .R(1'b0));
  FDRE \reg_689_reg[12] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[12]),
        .Q(reg_689[12]),
        .R(1'b0));
  FDRE \reg_689_reg[13] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[13]),
        .Q(reg_689[13]),
        .R(1'b0));
  FDRE \reg_689_reg[14] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[14]),
        .Q(reg_689[14]),
        .R(1'b0));
  FDRE \reg_689_reg[15] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[15]),
        .Q(reg_689[15]),
        .R(1'b0));
  FDRE \reg_689_reg[16] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[16]),
        .Q(reg_689[16]),
        .R(1'b0));
  FDRE \reg_689_reg[17] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[17]),
        .Q(reg_689[17]),
        .R(1'b0));
  FDRE \reg_689_reg[18] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[18]),
        .Q(reg_689[18]),
        .R(1'b0));
  FDRE \reg_689_reg[19] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[19]),
        .Q(reg_689[19]),
        .R(1'b0));
  FDRE \reg_689_reg[1] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[1]),
        .Q(reg_689[1]),
        .R(1'b0));
  FDRE \reg_689_reg[20] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[20]),
        .Q(reg_689[20]),
        .R(1'b0));
  FDRE \reg_689_reg[21] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[21]),
        .Q(reg_689[21]),
        .R(1'b0));
  FDRE \reg_689_reg[22] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[22]),
        .Q(reg_689[22]),
        .R(1'b0));
  FDRE \reg_689_reg[23] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[23]),
        .Q(reg_689[23]),
        .R(1'b0));
  FDRE \reg_689_reg[24] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[24]),
        .Q(reg_689[24]),
        .R(1'b0));
  FDRE \reg_689_reg[25] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[25]),
        .Q(reg_689[25]),
        .R(1'b0));
  FDRE \reg_689_reg[26] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[26]),
        .Q(reg_689[26]),
        .R(1'b0));
  FDRE \reg_689_reg[27] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[27]),
        .Q(reg_689[27]),
        .R(1'b0));
  FDRE \reg_689_reg[28] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[28]),
        .Q(reg_689[28]),
        .R(1'b0));
  FDRE \reg_689_reg[29] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[29]),
        .Q(reg_689[29]),
        .R(1'b0));
  FDRE \reg_689_reg[2] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[2]),
        .Q(reg_689[2]),
        .R(1'b0));
  FDRE \reg_689_reg[30] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[30]),
        .Q(reg_689[30]),
        .R(1'b0));
  FDRE \reg_689_reg[31] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[31]),
        .Q(reg_689[31]),
        .R(1'b0));
  FDRE \reg_689_reg[32] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[32]),
        .Q(reg_689[32]),
        .R(1'b0));
  FDRE \reg_689_reg[33] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[33]),
        .Q(reg_689[33]),
        .R(1'b0));
  FDRE \reg_689_reg[34] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[34]),
        .Q(reg_689[34]),
        .R(1'b0));
  FDRE \reg_689_reg[35] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[35]),
        .Q(reg_689[35]),
        .R(1'b0));
  FDRE \reg_689_reg[36] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[36]),
        .Q(reg_689[36]),
        .R(1'b0));
  FDRE \reg_689_reg[37] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[37]),
        .Q(reg_689[37]),
        .R(1'b0));
  FDRE \reg_689_reg[38] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[38]),
        .Q(reg_689[38]),
        .R(1'b0));
  FDRE \reg_689_reg[39] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[39]),
        .Q(reg_689[39]),
        .R(1'b0));
  FDRE \reg_689_reg[3] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[3]),
        .Q(reg_689[3]),
        .R(1'b0));
  FDRE \reg_689_reg[40] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[40]),
        .Q(reg_689[40]),
        .R(1'b0));
  FDRE \reg_689_reg[41] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[41]),
        .Q(reg_689[41]),
        .R(1'b0));
  FDRE \reg_689_reg[42] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[42]),
        .Q(reg_689[42]),
        .R(1'b0));
  FDRE \reg_689_reg[43] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[43]),
        .Q(reg_689[43]),
        .R(1'b0));
  FDRE \reg_689_reg[44] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[44]),
        .Q(reg_689[44]),
        .R(1'b0));
  FDRE \reg_689_reg[45] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[45]),
        .Q(reg_689[45]),
        .R(1'b0));
  FDRE \reg_689_reg[46] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[46]),
        .Q(reg_689[46]),
        .R(1'b0));
  FDRE \reg_689_reg[47] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[47]),
        .Q(reg_689[47]),
        .R(1'b0));
  FDRE \reg_689_reg[48] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[48]),
        .Q(reg_689[48]),
        .R(1'b0));
  FDRE \reg_689_reg[49] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[49]),
        .Q(reg_689[49]),
        .R(1'b0));
  FDRE \reg_689_reg[4] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[4]),
        .Q(reg_689[4]),
        .R(1'b0));
  FDRE \reg_689_reg[50] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[50]),
        .Q(reg_689[50]),
        .R(1'b0));
  FDRE \reg_689_reg[51] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[51]),
        .Q(reg_689[51]),
        .R(1'b0));
  FDRE \reg_689_reg[52] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[52]),
        .Q(reg_689[52]),
        .R(1'b0));
  FDRE \reg_689_reg[53] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[53]),
        .Q(reg_689[53]),
        .R(1'b0));
  FDRE \reg_689_reg[54] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[54]),
        .Q(reg_689[54]),
        .R(1'b0));
  FDRE \reg_689_reg[55] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[55]),
        .Q(reg_689[55]),
        .R(1'b0));
  FDRE \reg_689_reg[56] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[56]),
        .Q(reg_689[56]),
        .R(1'b0));
  FDRE \reg_689_reg[57] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[57]),
        .Q(reg_689[57]),
        .R(1'b0));
  FDRE \reg_689_reg[58] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[58]),
        .Q(reg_689[58]),
        .R(1'b0));
  FDRE \reg_689_reg[59] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[59]),
        .Q(reg_689[59]),
        .R(1'b0));
  FDRE \reg_689_reg[5] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[5]),
        .Q(reg_689[5]),
        .R(1'b0));
  FDRE \reg_689_reg[60] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[60]),
        .Q(reg_689[60]),
        .R(1'b0));
  FDRE \reg_689_reg[61] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[61]),
        .Q(reg_689[61]),
        .R(1'b0));
  FDRE \reg_689_reg[62] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[62]),
        .Q(reg_689[62]),
        .R(1'b0));
  FDRE \reg_689_reg[63] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[63]),
        .Q(reg_689[63]),
        .R(1'b0));
  FDRE \reg_689_reg[6] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[6]),
        .Q(reg_689[6]),
        .R(1'b0));
  FDRE \reg_689_reg[7] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[7]),
        .Q(reg_689[7]),
        .R(1'b0));
  FDRE \reg_689_reg[8] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[8]),
        .Q(reg_689[8]),
        .R(1'b0));
  FDRE \reg_689_reg[9] 
       (.C(ap_clk),
        .CE(reg_6890),
        .D(grp_fu_427_p2[9]),
        .Q(reg_689[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \select_ln45_2_reg_6891[0]_i_1 
       (.I0(icmp_ln45_1_reg_6863),
        .I1(icmp_ln45_2_fu_4801_p2),
        .O(select_ln45_2_fu_4819_p3));
  FDRE \select_ln45_2_reg_6891_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(select_ln45_2_fu_4819_p3),
        .Q(select_ln45_2_reg_6891[0]),
        .R(1'b0));
  FDRE \select_ln45_2_reg_6891_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(icmp_ln45_2_fu_4801_p2),
        .Q(select_ln45_2_reg_6891[1]),
        .R(1'b0));
  FDRE \shl_ln_reg_5046_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[8]),
        .Q(\shl_ln_reg_5046_reg_n_4_[10] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[9]),
        .Q(\shl_ln_reg_5046_reg_n_4_[11] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[10]),
        .Q(\shl_ln_reg_5046_reg_n_4_[12] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[11]),
        .Q(\shl_ln_reg_5046_reg_n_4_[13] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[0]),
        .Q(\shl_ln_reg_5046_reg_n_4_[2] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[1]),
        .Q(\shl_ln_reg_5046_reg_n_4_[3] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[2]),
        .Q(\shl_ln_reg_5046_reg_n_4_[4] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[3]),
        .Q(\shl_ln_reg_5046_reg_n_4_[5] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[4]),
        .Q(\shl_ln_reg_5046_reg_n_4_[6] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[5]),
        .Q(\shl_ln_reg_5046_reg_n_4_[7] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(i_1_fu_242[6]),
        .Q(\shl_ln_reg_5046_reg_n_4_[8] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_65));
  FDRE \shl_ln_reg_5046_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(zext_ln108_fu_748_p1),
        .Q(\shl_ln_reg_5046_reg_n_4_[9] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry
       (.CI(1'b0),
        .CO({sub_ln20_fu_1184_p2_carry_n_4,sub_ln20_fu_1184_p2_carry_n_5,sub_ln20_fu_1184_p2_carry_n_6,sub_ln20_fu_1184_p2_carry_n_7}),
        .CYINIT(1'b1),
        .DI(diff_reg_5092[3:0]),
        .O({sub_ln20_fu_1184_p2_carry_n_8,sub_ln20_fu_1184_p2_carry_n_9,sub_ln20_fu_1184_p2_carry_n_10,sub_ln20_fu_1184_p2_carry_n_11}),
        .S({sub_ln20_fu_1184_p2_carry_i_1_n_4,sub_ln20_fu_1184_p2_carry_i_2_n_4,sub_ln20_fu_1184_p2_carry_i_3_n_4,sub_ln20_fu_1184_p2_carry_i_4_n_4}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__0
       (.CI(sub_ln20_fu_1184_p2_carry_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__0_n_4,sub_ln20_fu_1184_p2_carry__0_n_5,sub_ln20_fu_1184_p2_carry__0_n_6,sub_ln20_fu_1184_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_31_reg_5237,diff_reg_5092[6],tmp_32_reg_5242,diff_reg_5092[4]}),
        .O({sub_ln20_fu_1184_p2_carry__0_n_8,sub_ln20_fu_1184_p2_carry__0_n_9,sub_ln20_fu_1184_p2_carry__0_n_10,sub_ln20_fu_1184_p2_carry__0_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__0_i_1_n_4,sub_ln20_fu_1184_p2_carry__0_i_2_n_4,sub_ln20_fu_1184_p2_carry__0_i_3_n_4,sub_ln20_fu_1184_p2_carry__0_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__0_i_1
       (.I0(tmp_31_reg_5237),
        .O(sub_ln20_fu_1184_p2_carry__0_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__0_i_2
       (.I0(diff_reg_5092[6]),
        .I1(tmp_31_reg_5237),
        .O(sub_ln20_fu_1184_p2_carry__0_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__0_i_3
       (.I0(tmp_32_reg_5242),
        .O(sub_ln20_fu_1184_p2_carry__0_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__0_i_4
       (.I0(diff_reg_5092[4]),
        .I1(tmp_32_reg_5242),
        .O(sub_ln20_fu_1184_p2_carry__0_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__1
       (.CI(sub_ln20_fu_1184_p2_carry__0_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__1_n_4,sub_ln20_fu_1184_p2_carry__1_n_5,sub_ln20_fu_1184_p2_carry__1_n_6,sub_ln20_fu_1184_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_29_reg_5227,diff_reg_5092[10:8]}),
        .O({sub_ln20_fu_1184_p2_carry__1_n_8,sub_ln20_fu_1184_p2_carry__1_n_9,sub_ln20_fu_1184_p2_carry__1_n_10,sub_ln20_fu_1184_p2_carry__1_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__1_i_1_n_4,sub_ln20_fu_1184_p2_carry__1_i_2_n_4,sub_ln20_fu_1184_p2_carry__1_i_3_n_4,sub_ln20_fu_1184_p2_carry__1_i_4_n_4}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__10
       (.CI(sub_ln20_fu_1184_p2_carry__9_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__10_n_4,sub_ln20_fu_1184_p2_carry__10_n_5,sub_ln20_fu_1184_p2_carry__10_n_6,sub_ln20_fu_1184_p2_carry__10_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_11_reg_5137,diff_reg_5092[46],tmp_12_reg_5142,diff_reg_5092[44]}),
        .O({sub_ln20_fu_1184_p2_carry__10_n_8,sub_ln20_fu_1184_p2_carry__10_n_9,sub_ln20_fu_1184_p2_carry__10_n_10,sub_ln20_fu_1184_p2_carry__10_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__10_i_1_n_4,sub_ln20_fu_1184_p2_carry__10_i_2_n_4,sub_ln20_fu_1184_p2_carry__10_i_3_n_4,sub_ln20_fu_1184_p2_carry__10_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__10_i_1
       (.I0(tmp_11_reg_5137),
        .O(sub_ln20_fu_1184_p2_carry__10_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__10_i_2
       (.I0(diff_reg_5092[46]),
        .I1(tmp_11_reg_5137),
        .O(sub_ln20_fu_1184_p2_carry__10_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__10_i_3
       (.I0(tmp_12_reg_5142),
        .O(sub_ln20_fu_1184_p2_carry__10_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__10_i_4
       (.I0(diff_reg_5092[44]),
        .I1(tmp_12_reg_5142),
        .O(sub_ln20_fu_1184_p2_carry__10_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__11
       (.CI(sub_ln20_fu_1184_p2_carry__10_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__11_n_4,sub_ln20_fu_1184_p2_carry__11_n_5,sub_ln20_fu_1184_p2_carry__11_n_6,sub_ln20_fu_1184_p2_carry__11_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_9_reg_5127,diff_reg_5092[50:48]}),
        .O({sub_ln20_fu_1184_p2_carry__11_n_8,sub_ln20_fu_1184_p2_carry__11_n_9,sub_ln20_fu_1184_p2_carry__11_n_10,sub_ln20_fu_1184_p2_carry__11_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__11_i_1_n_4,sub_ln20_fu_1184_p2_carry__11_i_2_n_4,sub_ln20_fu_1184_p2_carry__11_i_3_n_4,sub_ln20_fu_1184_p2_carry__11_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__11_i_1
       (.I0(tmp_9_reg_5127),
        .O(sub_ln20_fu_1184_p2_carry__11_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__11_i_2
       (.I0(diff_reg_5092[50]),
        .I1(tmp_9_reg_5127),
        .O(sub_ln20_fu_1184_p2_carry__11_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__11_i_3
       (.I0(diff_reg_5092[49]),
        .O(sub_ln20_fu_1184_p2_carry__11_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__11_i_4
       (.I0(diff_reg_5092[48]),
        .I1(diff_reg_5092[49]),
        .O(sub_ln20_fu_1184_p2_carry__11_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__12
       (.CI(sub_ln20_fu_1184_p2_carry__11_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__12_n_4,sub_ln20_fu_1184_p2_carry__12_n_5,sub_ln20_fu_1184_p2_carry__12_n_6,sub_ln20_fu_1184_p2_carry__12_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_7_reg_5117,diff_reg_5092[54],tmp_8_reg_5122,diff_reg_5092[52]}),
        .O({sub_ln20_fu_1184_p2_carry__12_n_8,sub_ln20_fu_1184_p2_carry__12_n_9,sub_ln20_fu_1184_p2_carry__12_n_10,sub_ln20_fu_1184_p2_carry__12_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__12_i_1_n_4,sub_ln20_fu_1184_p2_carry__12_i_2_n_4,sub_ln20_fu_1184_p2_carry__12_i_3_n_4,sub_ln20_fu_1184_p2_carry__12_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__12_i_1
       (.I0(tmp_7_reg_5117),
        .O(sub_ln20_fu_1184_p2_carry__12_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__12_i_2
       (.I0(diff_reg_5092[54]),
        .I1(tmp_7_reg_5117),
        .O(sub_ln20_fu_1184_p2_carry__12_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__12_i_3
       (.I0(tmp_8_reg_5122),
        .O(sub_ln20_fu_1184_p2_carry__12_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__12_i_4
       (.I0(diff_reg_5092[52]),
        .I1(tmp_8_reg_5122),
        .O(sub_ln20_fu_1184_p2_carry__12_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__13
       (.CI(sub_ln20_fu_1184_p2_carry__12_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__13_n_4,sub_ln20_fu_1184_p2_carry__13_n_5,sub_ln20_fu_1184_p2_carry__13_n_6,sub_ln20_fu_1184_p2_carry__13_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_5_reg_5107,diff_reg_5092[58:56]}),
        .O({sub_ln20_fu_1184_p2_carry__13_n_8,sub_ln20_fu_1184_p2_carry__13_n_9,sub_ln20_fu_1184_p2_carry__13_n_10,sub_ln20_fu_1184_p2_carry__13_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__13_i_1_n_4,sub_ln20_fu_1184_p2_carry__13_i_2_n_4,sub_ln20_fu_1184_p2_carry__13_i_3_n_4,sub_ln20_fu_1184_p2_carry__13_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__13_i_1
       (.I0(tmp_5_reg_5107),
        .O(sub_ln20_fu_1184_p2_carry__13_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__13_i_2
       (.I0(diff_reg_5092[58]),
        .I1(tmp_5_reg_5107),
        .O(sub_ln20_fu_1184_p2_carry__13_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__13_i_3
       (.I0(diff_reg_5092[57]),
        .O(sub_ln20_fu_1184_p2_carry__13_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__13_i_4
       (.I0(diff_reg_5092[56]),
        .I1(diff_reg_5092[57]),
        .O(sub_ln20_fu_1184_p2_carry__13_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__14
       (.CI(sub_ln20_fu_1184_p2_carry__13_n_4),
        .CO({NLW_sub_ln20_fu_1184_p2_carry__14_CO_UNCONNECTED[3],sub_ln20_fu_1184_p2_carry__14_n_5,sub_ln20_fu_1184_p2_carry__14_n_6,sub_ln20_fu_1184_p2_carry__14_n_7}),
        .CYINIT(1'b0),
        .DI({1'b0,diff_reg_5092[62],tmp_4_reg_5102,diff_reg_5092[60]}),
        .O({sub_ln20_fu_1184_p2_carry__14_n_8,sub_ln20_fu_1184_p2_carry__14_n_9,sub_ln20_fu_1184_p2_carry__14_n_10,sub_ln20_fu_1184_p2_carry__14_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__14_i_1_n_4,sub_ln20_fu_1184_p2_carry__14_i_2_n_4,sub_ln20_fu_1184_p2_carry__14_i_3_n_4,sub_ln20_fu_1184_p2_carry__14_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__14_i_1
       (.I0(tmp_reg_5097),
        .O(sub_ln20_fu_1184_p2_carry__14_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__14_i_2
       (.I0(diff_reg_5092[62]),
        .I1(tmp_reg_5097),
        .O(sub_ln20_fu_1184_p2_carry__14_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__14_i_3
       (.I0(tmp_4_reg_5102),
        .O(sub_ln20_fu_1184_p2_carry__14_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__14_i_4
       (.I0(diff_reg_5092[60]),
        .I1(tmp_4_reg_5102),
        .O(sub_ln20_fu_1184_p2_carry__14_i_4_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__1_i_1
       (.I0(tmp_29_reg_5227),
        .O(sub_ln20_fu_1184_p2_carry__1_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__1_i_2
       (.I0(diff_reg_5092[10]),
        .I1(tmp_29_reg_5227),
        .O(sub_ln20_fu_1184_p2_carry__1_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__1_i_3
       (.I0(diff_reg_5092[9]),
        .O(sub_ln20_fu_1184_p2_carry__1_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__1_i_4
       (.I0(diff_reg_5092[8]),
        .I1(diff_reg_5092[9]),
        .O(sub_ln20_fu_1184_p2_carry__1_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__2
       (.CI(sub_ln20_fu_1184_p2_carry__1_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__2_n_4,sub_ln20_fu_1184_p2_carry__2_n_5,sub_ln20_fu_1184_p2_carry__2_n_6,sub_ln20_fu_1184_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_27_reg_5217,diff_reg_5092[14],tmp_28_reg_5222,diff_reg_5092[12]}),
        .O({sub_ln20_fu_1184_p2_carry__2_n_8,sub_ln20_fu_1184_p2_carry__2_n_9,sub_ln20_fu_1184_p2_carry__2_n_10,sub_ln20_fu_1184_p2_carry__2_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__2_i_1_n_4,sub_ln20_fu_1184_p2_carry__2_i_2_n_4,sub_ln20_fu_1184_p2_carry__2_i_3_n_4,sub_ln20_fu_1184_p2_carry__2_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__2_i_1
       (.I0(tmp_27_reg_5217),
        .O(sub_ln20_fu_1184_p2_carry__2_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__2_i_2
       (.I0(diff_reg_5092[14]),
        .I1(tmp_27_reg_5217),
        .O(sub_ln20_fu_1184_p2_carry__2_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__2_i_3
       (.I0(tmp_28_reg_5222),
        .O(sub_ln20_fu_1184_p2_carry__2_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__2_i_4
       (.I0(diff_reg_5092[12]),
        .I1(tmp_28_reg_5222),
        .O(sub_ln20_fu_1184_p2_carry__2_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__3
       (.CI(sub_ln20_fu_1184_p2_carry__2_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__3_n_4,sub_ln20_fu_1184_p2_carry__3_n_5,sub_ln20_fu_1184_p2_carry__3_n_6,sub_ln20_fu_1184_p2_carry__3_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_25_reg_5207,diff_reg_5092[18:16]}),
        .O({sub_ln20_fu_1184_p2_carry__3_n_8,sub_ln20_fu_1184_p2_carry__3_n_9,sub_ln20_fu_1184_p2_carry__3_n_10,sub_ln20_fu_1184_p2_carry__3_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__3_i_1_n_4,sub_ln20_fu_1184_p2_carry__3_i_2_n_4,sub_ln20_fu_1184_p2_carry__3_i_3_n_4,sub_ln20_fu_1184_p2_carry__3_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__3_i_1
       (.I0(tmp_25_reg_5207),
        .O(sub_ln20_fu_1184_p2_carry__3_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__3_i_2
       (.I0(diff_reg_5092[18]),
        .I1(tmp_25_reg_5207),
        .O(sub_ln20_fu_1184_p2_carry__3_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__3_i_3
       (.I0(diff_reg_5092[17]),
        .O(sub_ln20_fu_1184_p2_carry__3_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__3_i_4
       (.I0(diff_reg_5092[16]),
        .I1(diff_reg_5092[17]),
        .O(sub_ln20_fu_1184_p2_carry__3_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__4
       (.CI(sub_ln20_fu_1184_p2_carry__3_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__4_n_4,sub_ln20_fu_1184_p2_carry__4_n_5,sub_ln20_fu_1184_p2_carry__4_n_6,sub_ln20_fu_1184_p2_carry__4_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_23_reg_5197,diff_reg_5092[22],tmp_24_reg_5202,diff_reg_5092[20]}),
        .O({sub_ln20_fu_1184_p2_carry__4_n_8,sub_ln20_fu_1184_p2_carry__4_n_9,sub_ln20_fu_1184_p2_carry__4_n_10,sub_ln20_fu_1184_p2_carry__4_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__4_i_1_n_4,sub_ln20_fu_1184_p2_carry__4_i_2_n_4,sub_ln20_fu_1184_p2_carry__4_i_3_n_4,sub_ln20_fu_1184_p2_carry__4_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__4_i_1
       (.I0(tmp_23_reg_5197),
        .O(sub_ln20_fu_1184_p2_carry__4_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__4_i_2
       (.I0(diff_reg_5092[22]),
        .I1(tmp_23_reg_5197),
        .O(sub_ln20_fu_1184_p2_carry__4_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__4_i_3
       (.I0(tmp_24_reg_5202),
        .O(sub_ln20_fu_1184_p2_carry__4_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__4_i_4
       (.I0(diff_reg_5092[20]),
        .I1(tmp_24_reg_5202),
        .O(sub_ln20_fu_1184_p2_carry__4_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__5
       (.CI(sub_ln20_fu_1184_p2_carry__4_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__5_n_4,sub_ln20_fu_1184_p2_carry__5_n_5,sub_ln20_fu_1184_p2_carry__5_n_6,sub_ln20_fu_1184_p2_carry__5_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_21_reg_5187,diff_reg_5092[26:24]}),
        .O({sub_ln20_fu_1184_p2_carry__5_n_8,sub_ln20_fu_1184_p2_carry__5_n_9,sub_ln20_fu_1184_p2_carry__5_n_10,sub_ln20_fu_1184_p2_carry__5_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__5_i_1_n_4,sub_ln20_fu_1184_p2_carry__5_i_2_n_4,sub_ln20_fu_1184_p2_carry__5_i_3_n_4,sub_ln20_fu_1184_p2_carry__5_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__5_i_1
       (.I0(tmp_21_reg_5187),
        .O(sub_ln20_fu_1184_p2_carry__5_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__5_i_2
       (.I0(diff_reg_5092[26]),
        .I1(tmp_21_reg_5187),
        .O(sub_ln20_fu_1184_p2_carry__5_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__5_i_3
       (.I0(diff_reg_5092[25]),
        .O(sub_ln20_fu_1184_p2_carry__5_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__5_i_4
       (.I0(diff_reg_5092[24]),
        .I1(diff_reg_5092[25]),
        .O(sub_ln20_fu_1184_p2_carry__5_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__6
       (.CI(sub_ln20_fu_1184_p2_carry__5_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__6_n_4,sub_ln20_fu_1184_p2_carry__6_n_5,sub_ln20_fu_1184_p2_carry__6_n_6,sub_ln20_fu_1184_p2_carry__6_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_19_reg_5177,diff_reg_5092[30],tmp_20_reg_5182,diff_reg_5092[28]}),
        .O({sub_ln20_fu_1184_p2_carry__6_n_8,sub_ln20_fu_1184_p2_carry__6_n_9,sub_ln20_fu_1184_p2_carry__6_n_10,sub_ln20_fu_1184_p2_carry__6_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__6_i_1_n_4,sub_ln20_fu_1184_p2_carry__6_i_2_n_4,sub_ln20_fu_1184_p2_carry__6_i_3_n_4,sub_ln20_fu_1184_p2_carry__6_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__6_i_1
       (.I0(tmp_19_reg_5177),
        .O(sub_ln20_fu_1184_p2_carry__6_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__6_i_2
       (.I0(diff_reg_5092[30]),
        .I1(tmp_19_reg_5177),
        .O(sub_ln20_fu_1184_p2_carry__6_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__6_i_3
       (.I0(tmp_20_reg_5182),
        .O(sub_ln20_fu_1184_p2_carry__6_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__6_i_4
       (.I0(diff_reg_5092[28]),
        .I1(tmp_20_reg_5182),
        .O(sub_ln20_fu_1184_p2_carry__6_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__7
       (.CI(sub_ln20_fu_1184_p2_carry__6_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__7_n_4,sub_ln20_fu_1184_p2_carry__7_n_5,sub_ln20_fu_1184_p2_carry__7_n_6,sub_ln20_fu_1184_p2_carry__7_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_17_reg_5167,diff_reg_5092[34:32]}),
        .O({sub_ln20_fu_1184_p2_carry__7_n_8,sub_ln20_fu_1184_p2_carry__7_n_9,sub_ln20_fu_1184_p2_carry__7_n_10,sub_ln20_fu_1184_p2_carry__7_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__7_i_1_n_4,sub_ln20_fu_1184_p2_carry__7_i_2_n_4,sub_ln20_fu_1184_p2_carry__7_i_3_n_4,sub_ln20_fu_1184_p2_carry__7_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__7_i_1
       (.I0(tmp_17_reg_5167),
        .O(sub_ln20_fu_1184_p2_carry__7_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__7_i_2
       (.I0(diff_reg_5092[34]),
        .I1(tmp_17_reg_5167),
        .O(sub_ln20_fu_1184_p2_carry__7_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__7_i_3
       (.I0(diff_reg_5092[33]),
        .O(sub_ln20_fu_1184_p2_carry__7_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__7_i_4
       (.I0(diff_reg_5092[32]),
        .I1(diff_reg_5092[33]),
        .O(sub_ln20_fu_1184_p2_carry__7_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__8
       (.CI(sub_ln20_fu_1184_p2_carry__7_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__8_n_4,sub_ln20_fu_1184_p2_carry__8_n_5,sub_ln20_fu_1184_p2_carry__8_n_6,sub_ln20_fu_1184_p2_carry__8_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_15_reg_5157,diff_reg_5092[38],tmp_16_reg_5162,diff_reg_5092[36]}),
        .O({sub_ln20_fu_1184_p2_carry__8_n_8,sub_ln20_fu_1184_p2_carry__8_n_9,sub_ln20_fu_1184_p2_carry__8_n_10,sub_ln20_fu_1184_p2_carry__8_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__8_i_1_n_4,sub_ln20_fu_1184_p2_carry__8_i_2_n_4,sub_ln20_fu_1184_p2_carry__8_i_3_n_4,sub_ln20_fu_1184_p2_carry__8_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__8_i_1
       (.I0(tmp_15_reg_5157),
        .O(sub_ln20_fu_1184_p2_carry__8_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__8_i_2
       (.I0(diff_reg_5092[38]),
        .I1(tmp_15_reg_5157),
        .O(sub_ln20_fu_1184_p2_carry__8_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__8_i_3
       (.I0(tmp_16_reg_5162),
        .O(sub_ln20_fu_1184_p2_carry__8_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__8_i_4
       (.I0(diff_reg_5092[36]),
        .I1(tmp_16_reg_5162),
        .O(sub_ln20_fu_1184_p2_carry__8_i_4_n_4));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sub_ln20_fu_1184_p2_carry__9
       (.CI(sub_ln20_fu_1184_p2_carry__8_n_4),
        .CO({sub_ln20_fu_1184_p2_carry__9_n_4,sub_ln20_fu_1184_p2_carry__9_n_5,sub_ln20_fu_1184_p2_carry__9_n_6,sub_ln20_fu_1184_p2_carry__9_n_7}),
        .CYINIT(1'b0),
        .DI({tmp_13_reg_5147,diff_reg_5092[42:40]}),
        .O({sub_ln20_fu_1184_p2_carry__9_n_8,sub_ln20_fu_1184_p2_carry__9_n_9,sub_ln20_fu_1184_p2_carry__9_n_10,sub_ln20_fu_1184_p2_carry__9_n_11}),
        .S({sub_ln20_fu_1184_p2_carry__9_i_1_n_4,sub_ln20_fu_1184_p2_carry__9_i_2_n_4,sub_ln20_fu_1184_p2_carry__9_i_3_n_4,sub_ln20_fu_1184_p2_carry__9_i_4_n_4}));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__9_i_1
       (.I0(tmp_13_reg_5147),
        .O(sub_ln20_fu_1184_p2_carry__9_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__9_i_2
       (.I0(diff_reg_5092[42]),
        .I1(tmp_13_reg_5147),
        .O(sub_ln20_fu_1184_p2_carry__9_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry__9_i_3
       (.I0(diff_reg_5092[41]),
        .O(sub_ln20_fu_1184_p2_carry__9_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry__9_i_4
       (.I0(diff_reg_5092[40]),
        .I1(diff_reg_5092[41]),
        .O(sub_ln20_fu_1184_p2_carry__9_i_4_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry_i_1
       (.I0(diff_reg_5092[3]),
        .O(sub_ln20_fu_1184_p2_carry_i_1_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry_i_2
       (.I0(diff_reg_5092[2]),
        .I1(diff_reg_5092[3]),
        .O(sub_ln20_fu_1184_p2_carry_i_2_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    sub_ln20_fu_1184_p2_carry_i_3
       (.I0(diff_reg_5092[1]),
        .O(sub_ln20_fu_1184_p2_carry_i_3_n_4));
  LUT2 #(
    .INIT(4'h9)) 
    sub_ln20_fu_1184_p2_carry_i_4
       (.I0(diff_reg_5092[0]),
        .I1(diff_reg_5092[1]),
        .O(sub_ln20_fu_1184_p2_carry_i_4_n_4));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \test_set_address0[0]_INST_0 
       (.I0(Q),
        .I1(\dists_0_0_fu_62_reg[8] [0]),
        .O(test_set_address0));
  LUT6 #(
    .INIT(64'hFFFFFFFFB8880000)) 
    test_set_ce0_INST_0
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .I3(Q),
        .I4(\dists_0_0_fu_62_reg[8] [2]),
        .I5(\dists_0_0_fu_62_reg[8] [0]),
        .O(test_set_ce0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h80)) 
    test_set_ce1_INST_0
       (.I0(\dists_0_0_fu_62_reg[8] [2]),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(test_set_ce1));
  LUT4 #(
    .INIT(16'hA808)) 
    \test_set_load_2_reg_5072[63]_i_1 
       (.I0(Q),
        .I1(ap_enable_reg_pp0_iter0_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(reg_41413_out));
  FDRE \test_set_load_2_reg_5072_reg[0] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[0]),
        .Q(test_set_load_2_reg_5072[0]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[10] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[10]),
        .Q(test_set_load_2_reg_5072[10]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[11] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[11]),
        .Q(test_set_load_2_reg_5072[11]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[12] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[12]),
        .Q(test_set_load_2_reg_5072[12]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[13] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[13]),
        .Q(test_set_load_2_reg_5072[13]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[14] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[14]),
        .Q(test_set_load_2_reg_5072[14]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[15] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[15]),
        .Q(test_set_load_2_reg_5072[15]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[16] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[16]),
        .Q(test_set_load_2_reg_5072[16]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[17] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[17]),
        .Q(test_set_load_2_reg_5072[17]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[18] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[18]),
        .Q(test_set_load_2_reg_5072[18]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[19] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[19]),
        .Q(test_set_load_2_reg_5072[19]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[1] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[1]),
        .Q(test_set_load_2_reg_5072[1]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[20] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[20]),
        .Q(test_set_load_2_reg_5072[20]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[21] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[21]),
        .Q(test_set_load_2_reg_5072[21]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[22] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[22]),
        .Q(test_set_load_2_reg_5072[22]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[23] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[23]),
        .Q(test_set_load_2_reg_5072[23]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[24] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[24]),
        .Q(test_set_load_2_reg_5072[24]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[25] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[25]),
        .Q(test_set_load_2_reg_5072[25]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[26] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[26]),
        .Q(test_set_load_2_reg_5072[26]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[27] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[27]),
        .Q(test_set_load_2_reg_5072[27]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[28] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[28]),
        .Q(test_set_load_2_reg_5072[28]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[29] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[29]),
        .Q(test_set_load_2_reg_5072[29]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[2] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[2]),
        .Q(test_set_load_2_reg_5072[2]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[30] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[30]),
        .Q(test_set_load_2_reg_5072[30]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[31] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[31]),
        .Q(test_set_load_2_reg_5072[31]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[32] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[32]),
        .Q(test_set_load_2_reg_5072[32]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[33] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[33]),
        .Q(test_set_load_2_reg_5072[33]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[34] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[34]),
        .Q(test_set_load_2_reg_5072[34]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[35] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[35]),
        .Q(test_set_load_2_reg_5072[35]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[36] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[36]),
        .Q(test_set_load_2_reg_5072[36]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[37] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[37]),
        .Q(test_set_load_2_reg_5072[37]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[38] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[38]),
        .Q(test_set_load_2_reg_5072[38]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[39] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[39]),
        .Q(test_set_load_2_reg_5072[39]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[3] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[3]),
        .Q(test_set_load_2_reg_5072[3]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[40] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[40]),
        .Q(test_set_load_2_reg_5072[40]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[41] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[41]),
        .Q(test_set_load_2_reg_5072[41]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[42] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[42]),
        .Q(test_set_load_2_reg_5072[42]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[43] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[43]),
        .Q(test_set_load_2_reg_5072[43]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[44] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[44]),
        .Q(test_set_load_2_reg_5072[44]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[45] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[45]),
        .Q(test_set_load_2_reg_5072[45]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[46] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[46]),
        .Q(test_set_load_2_reg_5072[46]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[47] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[47]),
        .Q(test_set_load_2_reg_5072[47]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[48] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[48]),
        .Q(test_set_load_2_reg_5072[48]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[49] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[49]),
        .Q(test_set_load_2_reg_5072[49]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[4] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[4]),
        .Q(test_set_load_2_reg_5072[4]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[50] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[50]),
        .Q(test_set_load_2_reg_5072[50]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[51] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[51]),
        .Q(test_set_load_2_reg_5072[51]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[52] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[52]),
        .Q(test_set_load_2_reg_5072[52]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[53] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[53]),
        .Q(test_set_load_2_reg_5072[53]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[54] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[54]),
        .Q(test_set_load_2_reg_5072[54]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[55] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[55]),
        .Q(test_set_load_2_reg_5072[55]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[56] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[56]),
        .Q(test_set_load_2_reg_5072[56]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[57] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[57]),
        .Q(test_set_load_2_reg_5072[57]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[58] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[58]),
        .Q(test_set_load_2_reg_5072[58]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[59] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[59]),
        .Q(test_set_load_2_reg_5072[59]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[5] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[5]),
        .Q(test_set_load_2_reg_5072[5]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[60] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[60]),
        .Q(test_set_load_2_reg_5072[60]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[61] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[61]),
        .Q(test_set_load_2_reg_5072[61]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[62] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[62]),
        .Q(test_set_load_2_reg_5072[62]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[63] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[63]),
        .Q(test_set_load_2_reg_5072[63]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[6] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[6]),
        .Q(test_set_load_2_reg_5072[6]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[7] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[7]),
        .Q(test_set_load_2_reg_5072[7]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[8] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[8]),
        .Q(test_set_load_2_reg_5072[8]),
        .R(1'b0));
  FDRE \test_set_load_2_reg_5072_reg[9] 
       (.C(ap_clk),
        .CE(reg_41413_out),
        .D(test_set_q0[9]),
        .Q(test_set_load_2_reg_5072[9]),
        .R(1'b0));
  FDRE \tmp_100_reg_5397_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[7]),
        .Q(tmp_100_reg_5397),
        .R(1'b0));
  FDRE \tmp_101_reg_5402_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[5]),
        .Q(tmp_101_reg_5402),
        .R(1'b0));
  FDRE \tmp_102_reg_5407_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[3]),
        .Q(tmp_102_reg_5407),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA808)) 
    \tmp_103_reg_5412[0]_i_1 
       (.I0(ap_CS_fsm_pp0_stage2),
        .I1(ap_enable_reg_pp0_iter0_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(reg_4141));
  FDRE \tmp_103_reg_5412_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[1]),
        .Q(tmp_103_reg_5412),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_104_reg_5607[1]_i_2 
       (.I0(reg_689[63]),
        .O(\tmp_104_reg_5607[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_104_reg_5607[1]_i_3 
       (.I0(reg_689[62]),
        .I1(tmp_72_reg_5257),
        .O(\tmp_104_reg_5607[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_104_reg_5607[1]_i_4 
       (.I0(reg_689[61]),
        .O(\tmp_104_reg_5607[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_104_reg_5607[1]_i_5 
       (.I0(reg_689[60]),
        .I1(tmp_73_reg_5262),
        .O(\tmp_104_reg_5607[1]_i_5_n_4 ));
  FDRE \tmp_104_reg_5607_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_104_reg_5607_reg[1]_i_1_n_11 ),
        .Q(tmp_104_reg_5607[0]),
        .R(1'b0));
  FDRE \tmp_104_reg_5607_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_104_reg_5607_reg[1]_i_1_n_10 ),
        .Q(tmp_104_reg_5607[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_104_reg_5607_reg[1]_i_1 
       (.CI(\tmp_105_reg_5612_reg[1]_i_1_n_4 ),
        .CO({\NLW_tmp_104_reg_5607_reg[1]_i_1_CO_UNCONNECTED [3],\tmp_104_reg_5607_reg[1]_i_1_n_5 ,\tmp_104_reg_5607_reg[1]_i_1_n_6 ,\tmp_104_reg_5607_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,reg_689[62:60]}),
        .O({\tmp_104_reg_5607_reg[1]_i_1_n_8 ,\tmp_104_reg_5607_reg[1]_i_1_n_9 ,\tmp_104_reg_5607_reg[1]_i_1_n_10 ,\tmp_104_reg_5607_reg[1]_i_1_n_11 }),
        .S({\tmp_104_reg_5607[1]_i_2_n_4 ,\tmp_104_reg_5607[1]_i_3_n_4 ,\tmp_104_reg_5607[1]_i_4_n_4 ,\tmp_104_reg_5607[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_105_reg_5612[1]_i_2 
       (.I0(reg_689[59]),
        .O(\tmp_105_reg_5612[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_105_reg_5612[1]_i_3 
       (.I0(reg_689[58]),
        .I1(tmp_74_reg_5267),
        .O(\tmp_105_reg_5612[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_105_reg_5612[1]_i_4 
       (.I0(reg_689[57]),
        .O(\tmp_105_reg_5612[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_105_reg_5612[1]_i_5 
       (.I0(reg_689[56]),
        .I1(tmp_75_reg_5272),
        .O(\tmp_105_reg_5612[1]_i_5_n_4 ));
  FDRE \tmp_105_reg_5612_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_105_reg_5612_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[56]),
        .R(1'b0));
  FDRE \tmp_105_reg_5612_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_105_reg_5612_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[57]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_105_reg_5612_reg[1]_i_1 
       (.CI(\tmp_106_reg_5618_reg[1]_i_1_n_4 ),
        .CO({\tmp_105_reg_5612_reg[1]_i_1_n_4 ,\tmp_105_reg_5612_reg[1]_i_1_n_5 ,\tmp_105_reg_5612_reg[1]_i_1_n_6 ,\tmp_105_reg_5612_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[59:56]),
        .O({\tmp_105_reg_5612_reg[1]_i_1_n_8 ,\tmp_105_reg_5612_reg[1]_i_1_n_9 ,\tmp_105_reg_5612_reg[1]_i_1_n_10 ,\tmp_105_reg_5612_reg[1]_i_1_n_11 }),
        .S({\tmp_105_reg_5612[1]_i_2_n_4 ,\tmp_105_reg_5612[1]_i_3_n_4 ,\tmp_105_reg_5612[1]_i_4_n_4 ,\tmp_105_reg_5612[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_106_reg_5618[1]_i_2 
       (.I0(reg_689[55]),
        .O(\tmp_106_reg_5618[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_106_reg_5618[1]_i_3 
       (.I0(reg_689[54]),
        .I1(tmp_76_reg_5277),
        .O(\tmp_106_reg_5618[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_106_reg_5618[1]_i_4 
       (.I0(reg_689[53]),
        .O(\tmp_106_reg_5618[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_106_reg_5618[1]_i_5 
       (.I0(reg_689[52]),
        .I1(tmp_77_reg_5282),
        .O(\tmp_106_reg_5618[1]_i_5_n_4 ));
  FDRE \tmp_106_reg_5618_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_106_reg_5618_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[52]),
        .R(1'b0));
  FDRE \tmp_106_reg_5618_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_106_reg_5618_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[53]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_106_reg_5618_reg[1]_i_1 
       (.CI(\tmp_107_reg_5624_reg[1]_i_1_n_4 ),
        .CO({\tmp_106_reg_5618_reg[1]_i_1_n_4 ,\tmp_106_reg_5618_reg[1]_i_1_n_5 ,\tmp_106_reg_5618_reg[1]_i_1_n_6 ,\tmp_106_reg_5618_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[55:52]),
        .O({\tmp_106_reg_5618_reg[1]_i_1_n_8 ,\tmp_106_reg_5618_reg[1]_i_1_n_9 ,\tmp_106_reg_5618_reg[1]_i_1_n_10 ,\tmp_106_reg_5618_reg[1]_i_1_n_11 }),
        .S({\tmp_106_reg_5618[1]_i_2_n_4 ,\tmp_106_reg_5618[1]_i_3_n_4 ,\tmp_106_reg_5618[1]_i_4_n_4 ,\tmp_106_reg_5618[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_107_reg_5624[1]_i_2 
       (.I0(reg_689[51]),
        .O(\tmp_107_reg_5624[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_107_reg_5624[1]_i_3 
       (.I0(reg_689[50]),
        .I1(tmp_78_reg_5287),
        .O(\tmp_107_reg_5624[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_107_reg_5624[1]_i_4 
       (.I0(reg_689[49]),
        .O(\tmp_107_reg_5624[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_107_reg_5624[1]_i_5 
       (.I0(reg_689[48]),
        .I1(tmp_79_reg_5292),
        .O(\tmp_107_reg_5624[1]_i_5_n_4 ));
  FDRE \tmp_107_reg_5624_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_107_reg_5624_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[48]),
        .R(1'b0));
  FDRE \tmp_107_reg_5624_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_107_reg_5624_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[49]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_107_reg_5624_reg[1]_i_1 
       (.CI(\tmp_108_reg_5630_reg[1]_i_1_n_4 ),
        .CO({\tmp_107_reg_5624_reg[1]_i_1_n_4 ,\tmp_107_reg_5624_reg[1]_i_1_n_5 ,\tmp_107_reg_5624_reg[1]_i_1_n_6 ,\tmp_107_reg_5624_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[51:48]),
        .O({\tmp_107_reg_5624_reg[1]_i_1_n_8 ,\tmp_107_reg_5624_reg[1]_i_1_n_9 ,\tmp_107_reg_5624_reg[1]_i_1_n_10 ,\tmp_107_reg_5624_reg[1]_i_1_n_11 }),
        .S({\tmp_107_reg_5624[1]_i_2_n_4 ,\tmp_107_reg_5624[1]_i_3_n_4 ,\tmp_107_reg_5624[1]_i_4_n_4 ,\tmp_107_reg_5624[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_108_reg_5630[1]_i_2 
       (.I0(reg_689[47]),
        .O(\tmp_108_reg_5630[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_108_reg_5630[1]_i_3 
       (.I0(reg_689[46]),
        .I1(tmp_80_reg_5297),
        .O(\tmp_108_reg_5630[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_108_reg_5630[1]_i_4 
       (.I0(reg_689[45]),
        .O(\tmp_108_reg_5630[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_108_reg_5630[1]_i_5 
       (.I0(reg_689[44]),
        .I1(tmp_81_reg_5302),
        .O(\tmp_108_reg_5630[1]_i_5_n_4 ));
  FDRE \tmp_108_reg_5630_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_108_reg_5630_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[44]),
        .R(1'b0));
  FDRE \tmp_108_reg_5630_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_108_reg_5630_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[45]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_108_reg_5630_reg[1]_i_1 
       (.CI(\tmp_109_reg_5636_reg[1]_i_1_n_4 ),
        .CO({\tmp_108_reg_5630_reg[1]_i_1_n_4 ,\tmp_108_reg_5630_reg[1]_i_1_n_5 ,\tmp_108_reg_5630_reg[1]_i_1_n_6 ,\tmp_108_reg_5630_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[47:44]),
        .O({\tmp_108_reg_5630_reg[1]_i_1_n_8 ,\tmp_108_reg_5630_reg[1]_i_1_n_9 ,\tmp_108_reg_5630_reg[1]_i_1_n_10 ,\tmp_108_reg_5630_reg[1]_i_1_n_11 }),
        .S({\tmp_108_reg_5630[1]_i_2_n_4 ,\tmp_108_reg_5630[1]_i_3_n_4 ,\tmp_108_reg_5630[1]_i_4_n_4 ,\tmp_108_reg_5630[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_109_reg_5636[1]_i_2 
       (.I0(reg_689[43]),
        .O(\tmp_109_reg_5636[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_109_reg_5636[1]_i_3 
       (.I0(reg_689[42]),
        .I1(tmp_82_reg_5307),
        .O(\tmp_109_reg_5636[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_109_reg_5636[1]_i_4 
       (.I0(reg_689[41]),
        .O(\tmp_109_reg_5636[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_109_reg_5636[1]_i_5 
       (.I0(reg_689[40]),
        .I1(tmp_83_reg_5312),
        .O(\tmp_109_reg_5636[1]_i_5_n_4 ));
  FDRE \tmp_109_reg_5636_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_109_reg_5636_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[40]),
        .R(1'b0));
  FDRE \tmp_109_reg_5636_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_109_reg_5636_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[41]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_109_reg_5636_reg[1]_i_1 
       (.CI(\tmp_110_reg_5642_reg[1]_i_1_n_4 ),
        .CO({\tmp_109_reg_5636_reg[1]_i_1_n_4 ,\tmp_109_reg_5636_reg[1]_i_1_n_5 ,\tmp_109_reg_5636_reg[1]_i_1_n_6 ,\tmp_109_reg_5636_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[43:40]),
        .O({\tmp_109_reg_5636_reg[1]_i_1_n_8 ,\tmp_109_reg_5636_reg[1]_i_1_n_9 ,\tmp_109_reg_5636_reg[1]_i_1_n_10 ,\tmp_109_reg_5636_reg[1]_i_1_n_11 }),
        .S({\tmp_109_reg_5636[1]_i_2_n_4 ,\tmp_109_reg_5636[1]_i_3_n_4 ,\tmp_109_reg_5636[1]_i_4_n_4 ,\tmp_109_reg_5636[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_110_reg_5642[1]_i_2 
       (.I0(reg_689[39]),
        .O(\tmp_110_reg_5642[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_110_reg_5642[1]_i_3 
       (.I0(reg_689[38]),
        .I1(tmp_84_reg_5317),
        .O(\tmp_110_reg_5642[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_110_reg_5642[1]_i_4 
       (.I0(reg_689[37]),
        .O(\tmp_110_reg_5642[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_110_reg_5642[1]_i_5 
       (.I0(reg_689[36]),
        .I1(tmp_85_reg_5322),
        .O(\tmp_110_reg_5642[1]_i_5_n_4 ));
  FDRE \tmp_110_reg_5642_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_110_reg_5642_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[36]),
        .R(1'b0));
  FDRE \tmp_110_reg_5642_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_110_reg_5642_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[37]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_110_reg_5642_reg[1]_i_1 
       (.CI(\tmp_111_reg_5648_reg[1]_i_1_n_4 ),
        .CO({\tmp_110_reg_5642_reg[1]_i_1_n_4 ,\tmp_110_reg_5642_reg[1]_i_1_n_5 ,\tmp_110_reg_5642_reg[1]_i_1_n_6 ,\tmp_110_reg_5642_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[39:36]),
        .O({\tmp_110_reg_5642_reg[1]_i_1_n_8 ,\tmp_110_reg_5642_reg[1]_i_1_n_9 ,\tmp_110_reg_5642_reg[1]_i_1_n_10 ,\tmp_110_reg_5642_reg[1]_i_1_n_11 }),
        .S({\tmp_110_reg_5642[1]_i_2_n_4 ,\tmp_110_reg_5642[1]_i_3_n_4 ,\tmp_110_reg_5642[1]_i_4_n_4 ,\tmp_110_reg_5642[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_111_reg_5648[1]_i_2 
       (.I0(reg_689[35]),
        .O(\tmp_111_reg_5648[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_111_reg_5648[1]_i_3 
       (.I0(reg_689[34]),
        .I1(tmp_86_reg_5327),
        .O(\tmp_111_reg_5648[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_111_reg_5648[1]_i_4 
       (.I0(reg_689[33]),
        .O(\tmp_111_reg_5648[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_111_reg_5648[1]_i_5 
       (.I0(reg_689[32]),
        .I1(tmp_87_reg_5332),
        .O(\tmp_111_reg_5648[1]_i_5_n_4 ));
  FDRE \tmp_111_reg_5648_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_111_reg_5648_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[32]),
        .R(1'b0));
  FDRE \tmp_111_reg_5648_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_111_reg_5648_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[33]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_111_reg_5648_reg[1]_i_1 
       (.CI(\tmp_112_reg_5654_reg[1]_i_1_n_4 ),
        .CO({\tmp_111_reg_5648_reg[1]_i_1_n_4 ,\tmp_111_reg_5648_reg[1]_i_1_n_5 ,\tmp_111_reg_5648_reg[1]_i_1_n_6 ,\tmp_111_reg_5648_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[35:32]),
        .O({\tmp_111_reg_5648_reg[1]_i_1_n_8 ,\tmp_111_reg_5648_reg[1]_i_1_n_9 ,\tmp_111_reg_5648_reg[1]_i_1_n_10 ,\tmp_111_reg_5648_reg[1]_i_1_n_11 }),
        .S({\tmp_111_reg_5648[1]_i_2_n_4 ,\tmp_111_reg_5648[1]_i_3_n_4 ,\tmp_111_reg_5648[1]_i_4_n_4 ,\tmp_111_reg_5648[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_112_reg_5654[1]_i_2 
       (.I0(reg_689[31]),
        .O(\tmp_112_reg_5654[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_112_reg_5654[1]_i_3 
       (.I0(reg_689[30]),
        .I1(tmp_88_reg_5337),
        .O(\tmp_112_reg_5654[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_112_reg_5654[1]_i_4 
       (.I0(reg_689[29]),
        .O(\tmp_112_reg_5654[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_112_reg_5654[1]_i_5 
       (.I0(reg_689[28]),
        .I1(tmp_89_reg_5342),
        .O(\tmp_112_reg_5654[1]_i_5_n_4 ));
  FDRE \tmp_112_reg_5654_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_112_reg_5654_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[28]),
        .R(1'b0));
  FDRE \tmp_112_reg_5654_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_112_reg_5654_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[29]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_112_reg_5654_reg[1]_i_1 
       (.CI(\tmp_113_reg_5660_reg[1]_i_1_n_4 ),
        .CO({\tmp_112_reg_5654_reg[1]_i_1_n_4 ,\tmp_112_reg_5654_reg[1]_i_1_n_5 ,\tmp_112_reg_5654_reg[1]_i_1_n_6 ,\tmp_112_reg_5654_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[31:28]),
        .O({\tmp_112_reg_5654_reg[1]_i_1_n_8 ,\tmp_112_reg_5654_reg[1]_i_1_n_9 ,\tmp_112_reg_5654_reg[1]_i_1_n_10 ,\tmp_112_reg_5654_reg[1]_i_1_n_11 }),
        .S({\tmp_112_reg_5654[1]_i_2_n_4 ,\tmp_112_reg_5654[1]_i_3_n_4 ,\tmp_112_reg_5654[1]_i_4_n_4 ,\tmp_112_reg_5654[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_113_reg_5660[1]_i_2 
       (.I0(reg_689[27]),
        .O(\tmp_113_reg_5660[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_113_reg_5660[1]_i_3 
       (.I0(reg_689[26]),
        .I1(tmp_90_reg_5347),
        .O(\tmp_113_reg_5660[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_113_reg_5660[1]_i_4 
       (.I0(reg_689[25]),
        .O(\tmp_113_reg_5660[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_113_reg_5660[1]_i_5 
       (.I0(reg_689[24]),
        .I1(tmp_91_reg_5352),
        .O(\tmp_113_reg_5660[1]_i_5_n_4 ));
  FDRE \tmp_113_reg_5660_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_113_reg_5660_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[24]),
        .R(1'b0));
  FDRE \tmp_113_reg_5660_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_113_reg_5660_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[25]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_113_reg_5660_reg[1]_i_1 
       (.CI(\tmp_114_reg_5666_reg[1]_i_1_n_4 ),
        .CO({\tmp_113_reg_5660_reg[1]_i_1_n_4 ,\tmp_113_reg_5660_reg[1]_i_1_n_5 ,\tmp_113_reg_5660_reg[1]_i_1_n_6 ,\tmp_113_reg_5660_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[27:24]),
        .O({\tmp_113_reg_5660_reg[1]_i_1_n_8 ,\tmp_113_reg_5660_reg[1]_i_1_n_9 ,\tmp_113_reg_5660_reg[1]_i_1_n_10 ,\tmp_113_reg_5660_reg[1]_i_1_n_11 }),
        .S({\tmp_113_reg_5660[1]_i_2_n_4 ,\tmp_113_reg_5660[1]_i_3_n_4 ,\tmp_113_reg_5660[1]_i_4_n_4 ,\tmp_113_reg_5660[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_114_reg_5666[1]_i_2 
       (.I0(reg_689[23]),
        .O(\tmp_114_reg_5666[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_114_reg_5666[1]_i_3 
       (.I0(reg_689[22]),
        .I1(tmp_92_reg_5357),
        .O(\tmp_114_reg_5666[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_114_reg_5666[1]_i_4 
       (.I0(reg_689[21]),
        .O(\tmp_114_reg_5666[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_114_reg_5666[1]_i_5 
       (.I0(reg_689[20]),
        .I1(tmp_93_reg_5362),
        .O(\tmp_114_reg_5666[1]_i_5_n_4 ));
  FDRE \tmp_114_reg_5666_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_114_reg_5666_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[20]),
        .R(1'b0));
  FDRE \tmp_114_reg_5666_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_114_reg_5666_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[21]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_114_reg_5666_reg[1]_i_1 
       (.CI(\tmp_115_reg_5672_reg[1]_i_1_n_4 ),
        .CO({\tmp_114_reg_5666_reg[1]_i_1_n_4 ,\tmp_114_reg_5666_reg[1]_i_1_n_5 ,\tmp_114_reg_5666_reg[1]_i_1_n_6 ,\tmp_114_reg_5666_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[23:20]),
        .O({\tmp_114_reg_5666_reg[1]_i_1_n_8 ,\tmp_114_reg_5666_reg[1]_i_1_n_9 ,\tmp_114_reg_5666_reg[1]_i_1_n_10 ,\tmp_114_reg_5666_reg[1]_i_1_n_11 }),
        .S({\tmp_114_reg_5666[1]_i_2_n_4 ,\tmp_114_reg_5666[1]_i_3_n_4 ,\tmp_114_reg_5666[1]_i_4_n_4 ,\tmp_114_reg_5666[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_115_reg_5672[1]_i_2 
       (.I0(reg_689[19]),
        .O(\tmp_115_reg_5672[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_115_reg_5672[1]_i_3 
       (.I0(reg_689[18]),
        .I1(tmp_94_reg_5367),
        .O(\tmp_115_reg_5672[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_115_reg_5672[1]_i_4 
       (.I0(reg_689[17]),
        .O(\tmp_115_reg_5672[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_115_reg_5672[1]_i_5 
       (.I0(reg_689[16]),
        .I1(tmp_95_reg_5372),
        .O(\tmp_115_reg_5672[1]_i_5_n_4 ));
  FDRE \tmp_115_reg_5672_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_115_reg_5672_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[16]),
        .R(1'b0));
  FDRE \tmp_115_reg_5672_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_115_reg_5672_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[17]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_115_reg_5672_reg[1]_i_1 
       (.CI(\tmp_116_reg_5678_reg[1]_i_1_n_4 ),
        .CO({\tmp_115_reg_5672_reg[1]_i_1_n_4 ,\tmp_115_reg_5672_reg[1]_i_1_n_5 ,\tmp_115_reg_5672_reg[1]_i_1_n_6 ,\tmp_115_reg_5672_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[19:16]),
        .O({\tmp_115_reg_5672_reg[1]_i_1_n_8 ,\tmp_115_reg_5672_reg[1]_i_1_n_9 ,\tmp_115_reg_5672_reg[1]_i_1_n_10 ,\tmp_115_reg_5672_reg[1]_i_1_n_11 }),
        .S({\tmp_115_reg_5672[1]_i_2_n_4 ,\tmp_115_reg_5672[1]_i_3_n_4 ,\tmp_115_reg_5672[1]_i_4_n_4 ,\tmp_115_reg_5672[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_116_reg_5678[1]_i_2 
       (.I0(reg_689[15]),
        .O(\tmp_116_reg_5678[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_116_reg_5678[1]_i_3 
       (.I0(reg_689[14]),
        .I1(tmp_96_reg_5377),
        .O(\tmp_116_reg_5678[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_116_reg_5678[1]_i_4 
       (.I0(reg_689[13]),
        .O(\tmp_116_reg_5678[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_116_reg_5678[1]_i_5 
       (.I0(reg_689[12]),
        .I1(tmp_97_reg_5382),
        .O(\tmp_116_reg_5678[1]_i_5_n_4 ));
  FDRE \tmp_116_reg_5678_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_116_reg_5678_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[12]),
        .R(1'b0));
  FDRE \tmp_116_reg_5678_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_116_reg_5678_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[13]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_116_reg_5678_reg[1]_i_1 
       (.CI(\tmp_117_reg_5684_reg[1]_i_1_n_4 ),
        .CO({\tmp_116_reg_5678_reg[1]_i_1_n_4 ,\tmp_116_reg_5678_reg[1]_i_1_n_5 ,\tmp_116_reg_5678_reg[1]_i_1_n_6 ,\tmp_116_reg_5678_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[15:12]),
        .O({\tmp_116_reg_5678_reg[1]_i_1_n_8 ,\tmp_116_reg_5678_reg[1]_i_1_n_9 ,\tmp_116_reg_5678_reg[1]_i_1_n_10 ,\tmp_116_reg_5678_reg[1]_i_1_n_11 }),
        .S({\tmp_116_reg_5678[1]_i_2_n_4 ,\tmp_116_reg_5678[1]_i_3_n_4 ,\tmp_116_reg_5678[1]_i_4_n_4 ,\tmp_116_reg_5678[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_117_reg_5684[1]_i_2 
       (.I0(reg_689[11]),
        .O(\tmp_117_reg_5684[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_117_reg_5684[1]_i_3 
       (.I0(reg_689[10]),
        .I1(tmp_98_reg_5387),
        .O(\tmp_117_reg_5684[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_117_reg_5684[1]_i_4 
       (.I0(reg_689[9]),
        .O(\tmp_117_reg_5684[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_117_reg_5684[1]_i_5 
       (.I0(reg_689[8]),
        .I1(tmp_99_reg_5392),
        .O(\tmp_117_reg_5684[1]_i_5_n_4 ));
  FDRE \tmp_117_reg_5684_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_117_reg_5684_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[8]),
        .R(1'b0));
  FDRE \tmp_117_reg_5684_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_117_reg_5684_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_117_reg_5684_reg[1]_i_1 
       (.CI(\tmp_118_reg_5690_reg[1]_i_1_n_4 ),
        .CO({\tmp_117_reg_5684_reg[1]_i_1_n_4 ,\tmp_117_reg_5684_reg[1]_i_1_n_5 ,\tmp_117_reg_5684_reg[1]_i_1_n_6 ,\tmp_117_reg_5684_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[11:8]),
        .O({\tmp_117_reg_5684_reg[1]_i_1_n_8 ,\tmp_117_reg_5684_reg[1]_i_1_n_9 ,\tmp_117_reg_5684_reg[1]_i_1_n_10 ,\tmp_117_reg_5684_reg[1]_i_1_n_11 }),
        .S({\tmp_117_reg_5684[1]_i_2_n_4 ,\tmp_117_reg_5684[1]_i_3_n_4 ,\tmp_117_reg_5684[1]_i_4_n_4 ,\tmp_117_reg_5684[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_118_reg_5690[1]_i_2 
       (.I0(reg_689[7]),
        .O(\tmp_118_reg_5690[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_118_reg_5690[1]_i_3 
       (.I0(reg_689[6]),
        .I1(tmp_100_reg_5397),
        .O(\tmp_118_reg_5690[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_118_reg_5690[1]_i_4 
       (.I0(reg_689[5]),
        .O(\tmp_118_reg_5690[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_118_reg_5690[1]_i_5 
       (.I0(reg_689[4]),
        .I1(tmp_101_reg_5402),
        .O(\tmp_118_reg_5690[1]_i_5_n_4 ));
  FDRE \tmp_118_reg_5690_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_118_reg_5690_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[4]),
        .R(1'b0));
  FDRE \tmp_118_reg_5690_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_118_reg_5690_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[5]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_118_reg_5690_reg[1]_i_1 
       (.CI(\trunc_ln21_1_reg_5696_reg[1]_i_1_n_4 ),
        .CO({\tmp_118_reg_5690_reg[1]_i_1_n_4 ,\tmp_118_reg_5690_reg[1]_i_1_n_5 ,\tmp_118_reg_5690_reg[1]_i_1_n_6 ,\tmp_118_reg_5690_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[7:4]),
        .O({\tmp_118_reg_5690_reg[1]_i_1_n_8 ,\tmp_118_reg_5690_reg[1]_i_1_n_9 ,\tmp_118_reg_5690_reg[1]_i_1_n_10 ,\tmp_118_reg_5690_reg[1]_i_1_n_11 }),
        .S({\tmp_118_reg_5690[1]_i_2_n_4 ,\tmp_118_reg_5690[1]_i_3_n_4 ,\tmp_118_reg_5690[1]_i_4_n_4 ,\tmp_118_reg_5690[1]_i_5_n_4 }));
  FDRE \tmp_119_reg_5702_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_104_reg_5607_reg[1]_i_1_n_9 ),
        .Q(tmp_119_reg_5702[0]),
        .R(1'b0));
  FDRE \tmp_119_reg_5702_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_104_reg_5607_reg[1]_i_1_n_8 ),
        .Q(tmp_119_reg_5702[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_11_reg_5137[0]_i_1 
       (.I0(reg_414[47]),
        .I1(\tmp_reg_5097_reg[0]_0 [47]),
        .O(diff_fu_816_p2[47]));
  FDRE \tmp_11_reg_5137_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[47]),
        .Q(tmp_11_reg_5137),
        .R(1'b0));
  FDRE \tmp_120_reg_5707_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_105_reg_5612_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[56]),
        .R(1'b0));
  FDRE \tmp_120_reg_5707_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_105_reg_5612_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[57]),
        .R(1'b0));
  FDRE \tmp_121_reg_5713_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_106_reg_5618_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[52]),
        .R(1'b0));
  FDRE \tmp_121_reg_5713_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_106_reg_5618_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[53]),
        .R(1'b0));
  FDRE \tmp_122_reg_5719_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_107_reg_5624_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[48]),
        .R(1'b0));
  FDRE \tmp_122_reg_5719_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_107_reg_5624_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[49]),
        .R(1'b0));
  FDRE \tmp_123_reg_5725_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_108_reg_5630_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[44]),
        .R(1'b0));
  FDRE \tmp_123_reg_5725_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_108_reg_5630_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[45]),
        .R(1'b0));
  FDRE \tmp_124_reg_5731_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_109_reg_5636_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[40]),
        .R(1'b0));
  FDRE \tmp_124_reg_5731_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_109_reg_5636_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[41]),
        .R(1'b0));
  FDRE \tmp_125_reg_5737_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_110_reg_5642_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[36]),
        .R(1'b0));
  FDRE \tmp_125_reg_5737_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_110_reg_5642_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[37]),
        .R(1'b0));
  FDRE \tmp_126_reg_5743_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_111_reg_5648_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[32]),
        .R(1'b0));
  FDRE \tmp_126_reg_5743_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_111_reg_5648_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[33]),
        .R(1'b0));
  FDRE \tmp_127_reg_5749_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_112_reg_5654_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[28]),
        .R(1'b0));
  FDRE \tmp_127_reg_5749_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_112_reg_5654_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[29]),
        .R(1'b0));
  FDRE \tmp_128_reg_5755_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_113_reg_5660_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[24]),
        .R(1'b0));
  FDRE \tmp_128_reg_5755_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_113_reg_5660_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[25]),
        .R(1'b0));
  FDRE \tmp_129_reg_5761_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_114_reg_5666_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[20]),
        .R(1'b0));
  FDRE \tmp_129_reg_5761_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_114_reg_5666_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[21]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_12_reg_5142[0]_i_1 
       (.I0(reg_414[45]),
        .I1(\tmp_reg_5097_reg[0]_0 [45]),
        .O(diff_fu_816_p2[45]));
  FDRE \tmp_12_reg_5142_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[45]),
        .Q(tmp_12_reg_5142),
        .R(1'b0));
  FDRE \tmp_130_reg_5767_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_115_reg_5672_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[16]),
        .R(1'b0));
  FDRE \tmp_130_reg_5767_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_115_reg_5672_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[17]),
        .R(1'b0));
  FDRE \tmp_131_reg_5773_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_116_reg_5678_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[12]),
        .R(1'b0));
  FDRE \tmp_131_reg_5773_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_116_reg_5678_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[13]),
        .R(1'b0));
  FDRE \tmp_132_reg_5779_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_117_reg_5684_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[8]),
        .R(1'b0));
  FDRE \tmp_132_reg_5779_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_117_reg_5684_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[9]),
        .R(1'b0));
  FDRE \tmp_133_reg_5785_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_118_reg_5690_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[4]),
        .R(1'b0));
  FDRE \tmp_133_reg_5785_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\tmp_118_reg_5690_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[5]),
        .R(1'b0));
  FDRE \tmp_134_reg_5791_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln21_1_reg_5696_reg[1]_i_1_n_9 ),
        .Q(and_ln21_3_cast_fu_2572_p31[0]),
        .R(1'b0));
  FDRE \tmp_134_reg_5791_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln21_1_reg_5696_reg[1]_i_1_n_8 ),
        .Q(and_ln21_3_cast_fu_2572_p31[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[10]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[13]),
        .I1(and_ln21_2_cast_fu_2469_p31[13]),
        .O(\tmp_135_reg_6137[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[10]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[12]),
        .I1(and_ln21_2_cast_fu_2469_p31[12]),
        .O(\tmp_135_reg_6137[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[18]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[21]),
        .I1(and_ln21_2_cast_fu_2469_p31[21]),
        .O(\tmp_135_reg_6137[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[18]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[20]),
        .I1(and_ln21_2_cast_fu_2469_p31[20]),
        .O(\tmp_135_reg_6137[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[26]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[29]),
        .I1(and_ln21_2_cast_fu_2469_p31[29]),
        .O(\tmp_135_reg_6137[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[26]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[28]),
        .I1(and_ln21_2_cast_fu_2469_p31[28]),
        .O(\tmp_135_reg_6137[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[2]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[5]),
        .I1(and_ln21_2_cast_fu_2469_p31[5]),
        .O(\tmp_135_reg_6137[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[2]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[4]),
        .I1(and_ln21_2_cast_fu_2469_p31[4]),
        .O(\tmp_135_reg_6137[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[34]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[37]),
        .I1(and_ln21_2_cast_fu_2469_p31[37]),
        .O(\tmp_135_reg_6137[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[34]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[36]),
        .I1(and_ln21_2_cast_fu_2469_p31[36]),
        .O(\tmp_135_reg_6137[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[42]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[45]),
        .I1(and_ln21_2_cast_fu_2469_p31[45]),
        .O(\tmp_135_reg_6137[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[42]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[44]),
        .I1(and_ln21_2_cast_fu_2469_p31[44]),
        .O(\tmp_135_reg_6137[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[50]_i_2 
       (.I0(and_ln21_3_cast_fu_2572_p31[53]),
        .I1(and_ln21_2_cast_fu_2469_p31[53]),
        .O(\tmp_135_reg_6137[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[50]_i_3 
       (.I0(and_ln21_3_cast_fu_2572_p31[52]),
        .I1(and_ln21_2_cast_fu_2469_p31[52]),
        .O(\tmp_135_reg_6137[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[58]_i_2 
       (.I0(tmp_119_reg_5702[1]),
        .I1(tmp_104_reg_5607[1]),
        .O(\tmp_135_reg_6137[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_135_reg_6137[58]_i_3 
       (.I0(tmp_119_reg_5702[0]),
        .I1(tmp_104_reg_5607[0]),
        .O(\tmp_135_reg_6137[58]_i_3_n_4 ));
  FDRE \tmp_135_reg_6137_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[4]),
        .Q(tmp_135_reg_6137[0]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[14]),
        .Q(tmp_135_reg_6137[10]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[10]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[14],\NLW_tmp_135_reg_6137_reg[10]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[13:12]}),
        .O({\NLW_tmp_135_reg_6137_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[13:12]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[10]_i_2_n_4 ,\tmp_135_reg_6137[10]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[20]),
        .Q(tmp_135_reg_6137[16]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[21]),
        .Q(tmp_135_reg_6137[17]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[22]),
        .Q(tmp_135_reg_6137[18]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[18]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[22],\NLW_tmp_135_reg_6137_reg[18]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[21:20]}),
        .O({\NLW_tmp_135_reg_6137_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[21:20]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[18]_i_2_n_4 ,\tmp_135_reg_6137[18]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[5]),
        .Q(tmp_135_reg_6137[1]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[28]),
        .Q(tmp_135_reg_6137[24]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[29]),
        .Q(tmp_135_reg_6137[25]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[30]),
        .Q(tmp_135_reg_6137[26]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[26]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[30],\NLW_tmp_135_reg_6137_reg[26]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[29:28]}),
        .O({\NLW_tmp_135_reg_6137_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[29:28]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[26]_i_2_n_4 ,\tmp_135_reg_6137[26]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[6]),
        .Q(tmp_135_reg_6137[2]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[2]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[6],\NLW_tmp_135_reg_6137_reg[2]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[5:4]}),
        .O({\NLW_tmp_135_reg_6137_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[5:4]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[2]_i_2_n_4 ,\tmp_135_reg_6137[2]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[36]),
        .Q(tmp_135_reg_6137[32]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[37]),
        .Q(tmp_135_reg_6137[33]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[38]),
        .Q(tmp_135_reg_6137[34]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[34]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[38],\NLW_tmp_135_reg_6137_reg[34]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[37:36]}),
        .O({\NLW_tmp_135_reg_6137_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[37:36]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[34]_i_2_n_4 ,\tmp_135_reg_6137[34]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[44]),
        .Q(tmp_135_reg_6137[40]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[45]),
        .Q(tmp_135_reg_6137[41]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[46]),
        .Q(tmp_135_reg_6137[42]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[42]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[46],\NLW_tmp_135_reg_6137_reg[42]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[45:44]}),
        .O({\NLW_tmp_135_reg_6137_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[45:44]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[42]_i_2_n_4 ,\tmp_135_reg_6137[42]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[52]),
        .Q(tmp_135_reg_6137[48]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[53]),
        .Q(tmp_135_reg_6137[49]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[54]),
        .Q(tmp_135_reg_6137[50]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[50]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[54],\NLW_tmp_135_reg_6137_reg[50]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_3_cast_fu_2572_p31[53:52]}),
        .O({\NLW_tmp_135_reg_6137_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[53:52]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[50]_i_2_n_4 ,\tmp_135_reg_6137[50]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[60]),
        .Q(tmp_135_reg_6137[56]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[61]),
        .Q(tmp_135_reg_6137[57]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[62]),
        .Q(tmp_135_reg_6137[58]),
        .R(1'b0));
  CARRY4 \tmp_135_reg_6137_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_135_reg_6137_reg[58]_i_1_CO_UNCONNECTED [3],add_ln21_fu_2631_p2[62],\NLW_tmp_135_reg_6137_reg[58]_i_1_CO_UNCONNECTED [1],\tmp_135_reg_6137_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,tmp_119_reg_5702}),
        .O({\NLW_tmp_135_reg_6137_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln21_fu_2631_p2[61:60]}),
        .S({1'b0,1'b1,\tmp_135_reg_6137[58]_i_2_n_4 ,\tmp_135_reg_6137[58]_i_3_n_4 }));
  FDRE \tmp_135_reg_6137_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[12]),
        .Q(tmp_135_reg_6137[8]),
        .R(1'b0));
  FDRE \tmp_135_reg_6137_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_fu_2631_p2[13]),
        .Q(tmp_135_reg_6137[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_136_reg_6568[3]_i_2 
       (.I0(tmp_135_reg_6137[50]),
        .I1(add_ln18_1_reg_6132[50]),
        .O(\tmp_136_reg_6568[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_136_reg_6568[3]_i_3 
       (.I0(tmp_135_reg_6137[49]),
        .I1(add_ln18_1_reg_6132[49]),
        .O(\tmp_136_reg_6568[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_136_reg_6568[3]_i_4 
       (.I0(tmp_135_reg_6137[48]),
        .I1(add_ln18_1_reg_6132[48]),
        .O(\tmp_136_reg_6568[3]_i_4_n_4 ));
  FDRE \tmp_136_reg_6568_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_136_reg_6568_reg[3]_i_1_n_11 ),
        .Q(tmp_136_reg_6568[0]),
        .R(1'b0));
  FDRE \tmp_136_reg_6568_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_136_reg_6568_reg[3]_i_1_n_10 ),
        .Q(tmp_136_reg_6568[1]),
        .R(1'b0));
  FDRE \tmp_136_reg_6568_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_136_reg_6568_reg[3]_i_1_n_9 ),
        .Q(tmp_136_reg_6568[2]),
        .R(1'b0));
  FDRE \tmp_136_reg_6568_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_136_reg_6568_reg[3]_i_1_n_4 ),
        .Q(tmp_136_reg_6568[3]),
        .R(1'b0));
  CARRY4 \tmp_136_reg_6568_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_136_reg_6568_reg[3]_i_1_n_4 ,\NLW_tmp_136_reg_6568_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_136_reg_6568_reg[3]_i_1_n_6 ,\tmp_136_reg_6568_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[50:48]}),
        .O({\NLW_tmp_136_reg_6568_reg[3]_i_1_O_UNCONNECTED [3],\tmp_136_reg_6568_reg[3]_i_1_n_9 ,\tmp_136_reg_6568_reg[3]_i_1_n_10 ,\tmp_136_reg_6568_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_136_reg_6568[3]_i_2_n_4 ,\tmp_136_reg_6568[3]_i_3_n_4 ,\tmp_136_reg_6568[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_137_reg_6574[3]_i_2 
       (.I0(tmp_135_reg_6137[42]),
        .I1(add_ln18_1_reg_6132[42]),
        .O(\tmp_137_reg_6574[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_137_reg_6574[3]_i_3 
       (.I0(tmp_135_reg_6137[41]),
        .I1(add_ln18_1_reg_6132[41]),
        .O(\tmp_137_reg_6574[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_137_reg_6574[3]_i_4 
       (.I0(tmp_135_reg_6137[40]),
        .I1(add_ln18_1_reg_6132[40]),
        .O(\tmp_137_reg_6574[3]_i_4_n_4 ));
  FDRE \tmp_137_reg_6574_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_137_reg_6574_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_3_fu_4248_p1[32]),
        .R(1'b0));
  FDRE \tmp_137_reg_6574_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_137_reg_6574_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_3_fu_4248_p1[33]),
        .R(1'b0));
  FDRE \tmp_137_reg_6574_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_137_reg_6574_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_3_fu_4248_p1[34]),
        .R(1'b0));
  FDRE \tmp_137_reg_6574_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_137_reg_6574_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_3_fu_4248_p1[35]),
        .R(1'b0));
  CARRY4 \tmp_137_reg_6574_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_137_reg_6574_reg[3]_i_1_n_4 ,\NLW_tmp_137_reg_6574_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_137_reg_6574_reg[3]_i_1_n_6 ,\tmp_137_reg_6574_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[42:40]}),
        .O({\NLW_tmp_137_reg_6574_reg[3]_i_1_O_UNCONNECTED [3],\tmp_137_reg_6574_reg[3]_i_1_n_9 ,\tmp_137_reg_6574_reg[3]_i_1_n_10 ,\tmp_137_reg_6574_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_137_reg_6574[3]_i_2_n_4 ,\tmp_137_reg_6574[3]_i_3_n_4 ,\tmp_137_reg_6574[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_138_reg_6580[3]_i_2 
       (.I0(tmp_135_reg_6137[34]),
        .I1(add_ln18_1_reg_6132[34]),
        .O(\tmp_138_reg_6580[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_138_reg_6580[3]_i_3 
       (.I0(tmp_135_reg_6137[33]),
        .I1(add_ln18_1_reg_6132[33]),
        .O(\tmp_138_reg_6580[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_138_reg_6580[3]_i_4 
       (.I0(tmp_135_reg_6137[32]),
        .I1(add_ln18_1_reg_6132[32]),
        .O(\tmp_138_reg_6580[3]_i_4_n_4 ));
  FDRE \tmp_138_reg_6580_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_138_reg_6580_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_3_fu_4248_p1[24]),
        .R(1'b0));
  FDRE \tmp_138_reg_6580_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_138_reg_6580_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_3_fu_4248_p1[25]),
        .R(1'b0));
  FDRE \tmp_138_reg_6580_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_138_reg_6580_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_3_fu_4248_p1[26]),
        .R(1'b0));
  FDRE \tmp_138_reg_6580_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_138_reg_6580_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_3_fu_4248_p1[27]),
        .R(1'b0));
  CARRY4 \tmp_138_reg_6580_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_138_reg_6580_reg[3]_i_1_n_4 ,\NLW_tmp_138_reg_6580_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_138_reg_6580_reg[3]_i_1_n_6 ,\tmp_138_reg_6580_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[34:32]}),
        .O({\NLW_tmp_138_reg_6580_reg[3]_i_1_O_UNCONNECTED [3],\tmp_138_reg_6580_reg[3]_i_1_n_9 ,\tmp_138_reg_6580_reg[3]_i_1_n_10 ,\tmp_138_reg_6580_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_138_reg_6580[3]_i_2_n_4 ,\tmp_138_reg_6580[3]_i_3_n_4 ,\tmp_138_reg_6580[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_139_reg_6586[3]_i_2 
       (.I0(tmp_135_reg_6137[26]),
        .I1(add_ln18_1_reg_6132[26]),
        .O(\tmp_139_reg_6586[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_139_reg_6586[3]_i_3 
       (.I0(tmp_135_reg_6137[25]),
        .I1(add_ln18_1_reg_6132[25]),
        .O(\tmp_139_reg_6586[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_139_reg_6586[3]_i_4 
       (.I0(tmp_135_reg_6137[24]),
        .I1(add_ln18_1_reg_6132[24]),
        .O(\tmp_139_reg_6586[3]_i_4_n_4 ));
  FDRE \tmp_139_reg_6586_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_139_reg_6586_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_3_fu_4248_p1[16]),
        .R(1'b0));
  FDRE \tmp_139_reg_6586_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_139_reg_6586_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_3_fu_4248_p1[17]),
        .R(1'b0));
  FDRE \tmp_139_reg_6586_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_139_reg_6586_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_3_fu_4248_p1[18]),
        .R(1'b0));
  FDRE \tmp_139_reg_6586_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_139_reg_6586_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_3_fu_4248_p1[19]),
        .R(1'b0));
  CARRY4 \tmp_139_reg_6586_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_139_reg_6586_reg[3]_i_1_n_4 ,\NLW_tmp_139_reg_6586_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_139_reg_6586_reg[3]_i_1_n_6 ,\tmp_139_reg_6586_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[26:24]}),
        .O({\NLW_tmp_139_reg_6586_reg[3]_i_1_O_UNCONNECTED [3],\tmp_139_reg_6586_reg[3]_i_1_n_9 ,\tmp_139_reg_6586_reg[3]_i_1_n_10 ,\tmp_139_reg_6586_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_139_reg_6586[3]_i_2_n_4 ,\tmp_139_reg_6586[3]_i_3_n_4 ,\tmp_139_reg_6586[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_13_reg_5147[0]_i_1 
       (.I0(reg_414[43]),
        .I1(\tmp_reg_5097_reg[0]_0 [43]),
        .O(diff_fu_816_p2[43]));
  FDRE \tmp_13_reg_5147_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[43]),
        .Q(tmp_13_reg_5147),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_140_reg_6592[3]_i_2 
       (.I0(tmp_135_reg_6137[18]),
        .I1(add_ln18_1_reg_6132[18]),
        .O(\tmp_140_reg_6592[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_140_reg_6592[3]_i_3 
       (.I0(tmp_135_reg_6137[17]),
        .I1(add_ln18_1_reg_6132[17]),
        .O(\tmp_140_reg_6592[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_140_reg_6592[3]_i_4 
       (.I0(tmp_135_reg_6137[16]),
        .I1(add_ln18_1_reg_6132[16]),
        .O(\tmp_140_reg_6592[3]_i_4_n_4 ));
  FDRE \tmp_140_reg_6592_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_140_reg_6592_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_3_fu_4248_p1[8]),
        .R(1'b0));
  FDRE \tmp_140_reg_6592_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_140_reg_6592_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_3_fu_4248_p1[9]),
        .R(1'b0));
  FDRE \tmp_140_reg_6592_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_140_reg_6592_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_3_fu_4248_p1[10]),
        .R(1'b0));
  FDRE \tmp_140_reg_6592_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_140_reg_6592_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_3_fu_4248_p1[11]),
        .R(1'b0));
  CARRY4 \tmp_140_reg_6592_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_140_reg_6592_reg[3]_i_1_n_4 ,\NLW_tmp_140_reg_6592_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_140_reg_6592_reg[3]_i_1_n_6 ,\tmp_140_reg_6592_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[18:16]}),
        .O({\NLW_tmp_140_reg_6592_reg[3]_i_1_O_UNCONNECTED [3],\tmp_140_reg_6592_reg[3]_i_1_n_9 ,\tmp_140_reg_6592_reg[3]_i_1_n_10 ,\tmp_140_reg_6592_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_140_reg_6592[3]_i_2_n_4 ,\tmp_140_reg_6592[3]_i_3_n_4 ,\tmp_140_reg_6592[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_141_reg_6598[3]_i_2 
       (.I0(tmp_135_reg_6137[10]),
        .I1(add_ln18_1_reg_6132[10]),
        .O(\tmp_141_reg_6598[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_141_reg_6598[3]_i_3 
       (.I0(tmp_135_reg_6137[9]),
        .I1(add_ln18_1_reg_6132[9]),
        .O(\tmp_141_reg_6598[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_141_reg_6598[3]_i_4 
       (.I0(tmp_135_reg_6137[8]),
        .I1(add_ln18_1_reg_6132[8]),
        .O(\tmp_141_reg_6598[3]_i_4_n_4 ));
  FDRE \tmp_141_reg_6598_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_141_reg_6598_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_3_fu_4248_p1[0]),
        .R(1'b0));
  FDRE \tmp_141_reg_6598_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_141_reg_6598_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_3_fu_4248_p1[1]),
        .R(1'b0));
  FDRE \tmp_141_reg_6598_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_141_reg_6598_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_3_fu_4248_p1[2]),
        .R(1'b0));
  FDRE \tmp_141_reg_6598_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_141_reg_6598_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_3_fu_4248_p1[3]),
        .R(1'b0));
  CARRY4 \tmp_141_reg_6598_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_141_reg_6598_reg[3]_i_1_n_4 ,\NLW_tmp_141_reg_6598_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_141_reg_6598_reg[3]_i_1_n_6 ,\tmp_141_reg_6598_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[10:8]}),
        .O({\NLW_tmp_141_reg_6598_reg[3]_i_1_O_UNCONNECTED [3],\tmp_141_reg_6598_reg[3]_i_1_n_9 ,\tmp_141_reg_6598_reg[3]_i_1_n_10 ,\tmp_141_reg_6598_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_141_reg_6598[3]_i_2_n_4 ,\tmp_141_reg_6598[3]_i_3_n_4 ,\tmp_141_reg_6598[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_142_reg_6609[3]_i_2 
       (.I0(tmp_135_reg_6137[58]),
        .I1(add_ln18_1_reg_6132[58]),
        .O(\tmp_142_reg_6609[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_142_reg_6609[3]_i_3 
       (.I0(tmp_135_reg_6137[57]),
        .I1(add_ln18_1_reg_6132[57]),
        .O(\tmp_142_reg_6609[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_142_reg_6609[3]_i_4 
       (.I0(tmp_135_reg_6137[56]),
        .I1(add_ln18_1_reg_6132[56]),
        .O(\tmp_142_reg_6609[3]_i_4_n_4 ));
  FDRE \tmp_142_reg_6609_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_142_reg_6609_reg[3]_i_1_n_11 ),
        .Q(tmp_142_reg_6609[0]),
        .R(1'b0));
  FDRE \tmp_142_reg_6609_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_142_reg_6609_reg[3]_i_1_n_10 ),
        .Q(tmp_142_reg_6609[1]),
        .R(1'b0));
  FDRE \tmp_142_reg_6609_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_142_reg_6609_reg[3]_i_1_n_9 ),
        .Q(tmp_142_reg_6609[2]),
        .R(1'b0));
  FDRE \tmp_142_reg_6609_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_142_reg_6609_reg[3]_i_1_n_4 ),
        .Q(tmp_142_reg_6609[3]),
        .R(1'b0));
  CARRY4 \tmp_142_reg_6609_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_142_reg_6609_reg[3]_i_1_n_4 ,\NLW_tmp_142_reg_6609_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_142_reg_6609_reg[3]_i_1_n_6 ,\tmp_142_reg_6609_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[58:56]}),
        .O({\NLW_tmp_142_reg_6609_reg[3]_i_1_O_UNCONNECTED [3],\tmp_142_reg_6609_reg[3]_i_1_n_9 ,\tmp_142_reg_6609_reg[3]_i_1_n_10 ,\tmp_142_reg_6609_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_142_reg_6609[3]_i_2_n_4 ,\tmp_142_reg_6609[3]_i_3_n_4 ,\tmp_142_reg_6609[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[35]_i_2 
       (.I0(tmp_142_reg_6609[3]),
        .I1(tmp_136_reg_6568[3]),
        .O(\tmp_143_reg_6649[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[35]_i_3 
       (.I0(tmp_142_reg_6609[2]),
        .I1(tmp_136_reg_6568[2]),
        .O(\tmp_143_reg_6649[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[35]_i_4 
       (.I0(tmp_142_reg_6609[1]),
        .I1(tmp_136_reg_6568[1]),
        .O(\tmp_143_reg_6649[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[35]_i_5 
       (.I0(tmp_142_reg_6609[0]),
        .I1(tmp_136_reg_6568[0]),
        .O(\tmp_143_reg_6649[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[3]_i_2 
       (.I0(zext_ln23_3_fu_4248_p1[19]),
        .I1(zext_ln23_3_fu_4248_p1[11]),
        .O(\tmp_143_reg_6649[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[3]_i_3 
       (.I0(zext_ln23_3_fu_4248_p1[18]),
        .I1(zext_ln23_3_fu_4248_p1[10]),
        .O(\tmp_143_reg_6649[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[3]_i_4 
       (.I0(zext_ln23_3_fu_4248_p1[17]),
        .I1(zext_ln23_3_fu_4248_p1[9]),
        .O(\tmp_143_reg_6649[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_143_reg_6649[3]_i_5 
       (.I0(zext_ln23_3_fu_4248_p1[16]),
        .I1(zext_ln23_3_fu_4248_p1[8]),
        .O(\tmp_143_reg_6649[3]_i_5_n_4 ));
  FDRE \tmp_143_reg_6649_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[16]),
        .Q(tmp_143_reg_6649[0]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[17]),
        .Q(tmp_143_reg_6649[1]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[18]),
        .Q(tmp_143_reg_6649[2]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[48]),
        .Q(tmp_143_reg_6649[32]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[49]),
        .Q(tmp_143_reg_6649[33]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[50]),
        .Q(tmp_143_reg_6649[34]),
        .R(1'b0));
  FDRE \tmp_143_reg_6649_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[51]),
        .Q(tmp_143_reg_6649[35]),
        .R(1'b0));
  CARRY4 \tmp_143_reg_6649_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\tmp_143_reg_6649_reg[35]_i_1_n_4 ,\tmp_143_reg_6649_reg[35]_i_1_n_5 ,\tmp_143_reg_6649_reg[35]_i_1_n_6 ,\tmp_143_reg_6649_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_142_reg_6609),
        .O(add_ln23_1_fu_4258_p2[51:48]),
        .S({\tmp_143_reg_6649[35]_i_2_n_4 ,\tmp_143_reg_6649[35]_i_3_n_4 ,\tmp_143_reg_6649[35]_i_4_n_4 ,\tmp_143_reg_6649[35]_i_5_n_4 }));
  FDRE \tmp_143_reg_6649_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[52]),
        .Q(tmp_143_reg_6649[36]),
        .R(1'b0));
  CARRY4 \tmp_143_reg_6649_reg[36]_i_1 
       (.CI(\tmp_143_reg_6649_reg[35]_i_1_n_4 ),
        .CO({\NLW_tmp_143_reg_6649_reg[36]_i_1_CO_UNCONNECTED [3:1],add_ln23_1_fu_4258_p2[52]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_143_reg_6649_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \tmp_143_reg_6649_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[19]),
        .Q(tmp_143_reg_6649[3]),
        .R(1'b0));
  CARRY4 \tmp_143_reg_6649_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_143_reg_6649_reg[3]_i_1_n_4 ,\tmp_143_reg_6649_reg[3]_i_1_n_5 ,\tmp_143_reg_6649_reg[3]_i_1_n_6 ,\tmp_143_reg_6649_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_3_fu_4248_p1[19:16]),
        .O(add_ln23_1_fu_4258_p2[19:16]),
        .S({\tmp_143_reg_6649[3]_i_2_n_4 ,\tmp_143_reg_6649[3]_i_3_n_4 ,\tmp_143_reg_6649[3]_i_4_n_4 ,\tmp_143_reg_6649[3]_i_5_n_4 }));
  FDRE \tmp_143_reg_6649_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_1_fu_4258_p2[20]),
        .Q(tmp_143_reg_6649[4]),
        .R(1'b0));
  CARRY4 \tmp_143_reg_6649_reg[4]_i_1 
       (.CI(\tmp_143_reg_6649_reg[3]_i_1_n_4 ),
        .CO({\NLW_tmp_143_reg_6649_reg[4]_i_1_CO_UNCONNECTED [3:1],add_ln23_1_fu_4258_p2[20]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_143_reg_6649_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_144_reg_5802[0]_i_1 
       (.I0(reg_414[63]),
        .I1(test_set_load_2_reg_5072[63]),
        .O(diff_2_fu_1925_p2[63]));
  FDRE \tmp_144_reg_5802_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[63]),
        .Q(tmp_144_reg_5802),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_145_reg_5807[0]_i_1 
       (.I0(reg_414[61]),
        .I1(test_set_load_2_reg_5072[61]),
        .O(diff_2_fu_1925_p2[61]));
  FDRE \tmp_145_reg_5807_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[61]),
        .Q(tmp_145_reg_5807),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_146_reg_5812[0]_i_1 
       (.I0(reg_414[59]),
        .I1(test_set_load_2_reg_5072[59]),
        .O(diff_2_fu_1925_p2[59]));
  FDRE \tmp_146_reg_5812_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[59]),
        .Q(tmp_146_reg_5812),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_148_reg_5822[0]_i_1 
       (.I0(reg_414[55]),
        .I1(test_set_load_2_reg_5072[55]),
        .O(diff_2_fu_1925_p2[55]));
  FDRE \tmp_148_reg_5822_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[55]),
        .Q(tmp_148_reg_5822),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_149_reg_5827[0]_i_1 
       (.I0(reg_414[53]),
        .I1(test_set_load_2_reg_5072[53]),
        .O(diff_2_fu_1925_p2[53]));
  FDRE \tmp_149_reg_5827_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[53]),
        .Q(tmp_149_reg_5827),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_150_reg_5832[0]_i_1 
       (.I0(reg_414[51]),
        .I1(test_set_load_2_reg_5072[51]),
        .O(diff_2_fu_1925_p2[51]));
  FDRE \tmp_150_reg_5832_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[51]),
        .Q(tmp_150_reg_5832),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_152_reg_5842[0]_i_1 
       (.I0(reg_414[47]),
        .I1(test_set_load_2_reg_5072[47]),
        .O(diff_2_fu_1925_p2[47]));
  FDRE \tmp_152_reg_5842_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[47]),
        .Q(tmp_152_reg_5842),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_153_reg_5847[0]_i_1 
       (.I0(reg_414[45]),
        .I1(test_set_load_2_reg_5072[45]),
        .O(diff_2_fu_1925_p2[45]));
  FDRE \tmp_153_reg_5847_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[45]),
        .Q(tmp_153_reg_5847),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_154_reg_5852[0]_i_1 
       (.I0(reg_414[43]),
        .I1(test_set_load_2_reg_5072[43]),
        .O(diff_2_fu_1925_p2[43]));
  FDRE \tmp_154_reg_5852_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[43]),
        .Q(tmp_154_reg_5852),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_156_reg_5862[0]_i_1 
       (.I0(reg_414[39]),
        .I1(test_set_load_2_reg_5072[39]),
        .O(diff_2_fu_1925_p2[39]));
  FDRE \tmp_156_reg_5862_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[39]),
        .Q(tmp_156_reg_5862),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_157_reg_5867[0]_i_1 
       (.I0(reg_414[37]),
        .I1(test_set_load_2_reg_5072[37]),
        .O(diff_2_fu_1925_p2[37]));
  FDRE \tmp_157_reg_5867_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[37]),
        .Q(tmp_157_reg_5867),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_158_reg_5872[0]_i_1 
       (.I0(reg_414[35]),
        .I1(test_set_load_2_reg_5072[35]),
        .O(diff_2_fu_1925_p2[35]));
  FDRE \tmp_158_reg_5872_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[35]),
        .Q(tmp_158_reg_5872),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_15_reg_5157[0]_i_1 
       (.I0(reg_414[39]),
        .I1(\tmp_reg_5097_reg[0]_0 [39]),
        .O(diff_fu_816_p2[39]));
  FDRE \tmp_15_reg_5157_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[39]),
        .Q(tmp_15_reg_5157),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_160_reg_5882[0]_i_1 
       (.I0(reg_414[31]),
        .I1(test_set_load_2_reg_5072[31]),
        .O(diff_2_fu_1925_p2[31]));
  FDRE \tmp_160_reg_5882_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[31]),
        .Q(tmp_160_reg_5882),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_161_reg_5887[0]_i_1 
       (.I0(reg_414[29]),
        .I1(test_set_load_2_reg_5072[29]),
        .O(diff_2_fu_1925_p2[29]));
  FDRE \tmp_161_reg_5887_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[29]),
        .Q(tmp_161_reg_5887),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_162_reg_5892[0]_i_1 
       (.I0(reg_414[27]),
        .I1(test_set_load_2_reg_5072[27]),
        .O(diff_2_fu_1925_p2[27]));
  FDRE \tmp_162_reg_5892_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[27]),
        .Q(tmp_162_reg_5892),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_164_reg_5902[0]_i_1 
       (.I0(reg_414[23]),
        .I1(test_set_load_2_reg_5072[23]),
        .O(diff_2_fu_1925_p2[23]));
  FDRE \tmp_164_reg_5902_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[23]),
        .Q(tmp_164_reg_5902),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_165_reg_5907[0]_i_1 
       (.I0(reg_414[21]),
        .I1(test_set_load_2_reg_5072[21]),
        .O(diff_2_fu_1925_p2[21]));
  FDRE \tmp_165_reg_5907_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[21]),
        .Q(tmp_165_reg_5907),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_166_reg_5912[0]_i_1 
       (.I0(reg_414[19]),
        .I1(test_set_load_2_reg_5072[19]),
        .O(diff_2_fu_1925_p2[19]));
  FDRE \tmp_166_reg_5912_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[19]),
        .Q(tmp_166_reg_5912),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_168_reg_5922[0]_i_1 
       (.I0(reg_414[15]),
        .I1(test_set_load_2_reg_5072[15]),
        .O(diff_2_fu_1925_p2[15]));
  FDRE \tmp_168_reg_5922_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[15]),
        .Q(tmp_168_reg_5922),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_169_reg_5927[0]_i_1 
       (.I0(reg_414[13]),
        .I1(test_set_load_2_reg_5072[13]),
        .O(diff_2_fu_1925_p2[13]));
  FDRE \tmp_169_reg_5927_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[13]),
        .Q(tmp_169_reg_5927),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_16_reg_5162[0]_i_1 
       (.I0(reg_414[37]),
        .I1(\tmp_reg_5097_reg[0]_0 [37]),
        .O(diff_fu_816_p2[37]));
  FDRE \tmp_16_reg_5162_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[37]),
        .Q(tmp_16_reg_5162),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_170_reg_5932[0]_i_1 
       (.I0(reg_414[11]),
        .I1(test_set_load_2_reg_5072[11]),
        .O(diff_2_fu_1925_p2[11]));
  FDRE \tmp_170_reg_5932_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[11]),
        .Q(tmp_170_reg_5932),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_172_reg_5942[0]_i_1 
       (.I0(reg_414[7]),
        .I1(test_set_load_2_reg_5072[7]),
        .O(diff_2_fu_1925_p2[7]));
  FDRE \tmp_172_reg_5942_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[7]),
        .Q(tmp_172_reg_5942),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_173_reg_5947[0]_i_1 
       (.I0(reg_414[5]),
        .I1(test_set_load_2_reg_5072[5]),
        .O(diff_2_fu_1925_p2[5]));
  FDRE \tmp_173_reg_5947_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[5]),
        .Q(tmp_173_reg_5947),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_174_reg_5952[0]_i_1 
       (.I0(reg_414[3]),
        .I1(test_set_load_2_reg_5072[3]),
        .O(diff_2_fu_1925_p2[3]));
  FDRE \tmp_174_reg_5952_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[3]),
        .Q(tmp_174_reg_5952),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_175_reg_5957[0]_i_1 
       (.I0(reg_414[1]),
        .I1(test_set_load_2_reg_5072[1]),
        .O(diff_2_fu_1925_p2[1]));
  FDRE \tmp_175_reg_5957_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(diff_2_fu_1925_p2[1]),
        .Q(tmp_175_reg_5957),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_176_reg_6142[1]_i_2 
       (.I0(tmp_144_reg_5802),
        .O(p_1_out[62]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_176_reg_6142[1]_i_3 
       (.I0(diff_2_reg_5797[62]),
        .I1(tmp_144_reg_5802),
        .O(\tmp_176_reg_6142[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_176_reg_6142[1]_i_4 
       (.I0(tmp_145_reg_5807),
        .O(p_1_out[60]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_176_reg_6142[1]_i_5 
       (.I0(diff_2_reg_5797[60]),
        .I1(tmp_145_reg_5807),
        .O(\tmp_176_reg_6142[1]_i_5_n_4 ));
  FDRE \tmp_176_reg_6142_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_176_reg_6142_reg[1]_i_1_n_11 ),
        .Q(tmp_176_reg_6142[0]),
        .R(1'b0));
  FDRE \tmp_176_reg_6142_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_176_reg_6142_reg[1]_i_1_n_10 ),
        .Q(tmp_176_reg_6142[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_176_reg_6142_reg[1]_i_1 
       (.CI(\tmp_177_reg_6147_reg[1]_i_1_n_4 ),
        .CO({\NLW_tmp_176_reg_6142_reg[1]_i_1_CO_UNCONNECTED [3],\tmp_176_reg_6142_reg[1]_i_1_n_5 ,\tmp_176_reg_6142_reg[1]_i_1_n_6 ,\tmp_176_reg_6142_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,diff_2_reg_5797[62],tmp_145_reg_5807,diff_2_reg_5797[60]}),
        .O({\tmp_176_reg_6142_reg[1]_i_1_n_8 ,\tmp_176_reg_6142_reg[1]_i_1_n_9 ,\tmp_176_reg_6142_reg[1]_i_1_n_10 ,\tmp_176_reg_6142_reg[1]_i_1_n_11 }),
        .S({p_1_out[62],\tmp_176_reg_6142[1]_i_3_n_4 ,p_1_out[60],\tmp_176_reg_6142[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_177_reg_6147[1]_i_2 
       (.I0(tmp_146_reg_5812),
        .O(p_1_out[58]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_177_reg_6147[1]_i_3 
       (.I0(diff_2_reg_5797[58]),
        .I1(tmp_146_reg_5812),
        .O(\tmp_177_reg_6147[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_177_reg_6147[1]_i_4 
       (.I0(diff_2_reg_5797[57]),
        .O(p_1_out[56]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_177_reg_6147[1]_i_5 
       (.I0(diff_2_reg_5797[56]),
        .I1(diff_2_reg_5797[57]),
        .O(\tmp_177_reg_6147[1]_i_5_n_4 ));
  FDRE \tmp_177_reg_6147_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_177_reg_6147_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[56]),
        .R(1'b0));
  FDRE \tmp_177_reg_6147_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_177_reg_6147_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[57]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_177_reg_6147_reg[1]_i_1 
       (.CI(\tmp_178_reg_6153_reg[1]_i_1_n_4 ),
        .CO({\tmp_177_reg_6147_reg[1]_i_1_n_4 ,\tmp_177_reg_6147_reg[1]_i_1_n_5 ,\tmp_177_reg_6147_reg[1]_i_1_n_6 ,\tmp_177_reg_6147_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_146_reg_5812,diff_2_reg_5797[58:56]}),
        .O({\tmp_177_reg_6147_reg[1]_i_1_n_8 ,\tmp_177_reg_6147_reg[1]_i_1_n_9 ,\tmp_177_reg_6147_reg[1]_i_1_n_10 ,\tmp_177_reg_6147_reg[1]_i_1_n_11 }),
        .S({p_1_out[58],\tmp_177_reg_6147[1]_i_3_n_4 ,p_1_out[56],\tmp_177_reg_6147[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_178_reg_6153[1]_i_2 
       (.I0(tmp_148_reg_5822),
        .O(p_1_out[54]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_178_reg_6153[1]_i_3 
       (.I0(diff_2_reg_5797[54]),
        .I1(tmp_148_reg_5822),
        .O(\tmp_178_reg_6153[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_178_reg_6153[1]_i_4 
       (.I0(tmp_149_reg_5827),
        .O(p_1_out[52]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_178_reg_6153[1]_i_5 
       (.I0(diff_2_reg_5797[52]),
        .I1(tmp_149_reg_5827),
        .O(\tmp_178_reg_6153[1]_i_5_n_4 ));
  FDRE \tmp_178_reg_6153_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_178_reg_6153_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[52]),
        .R(1'b0));
  FDRE \tmp_178_reg_6153_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_178_reg_6153_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[53]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_178_reg_6153_reg[1]_i_1 
       (.CI(\tmp_179_reg_6159_reg[1]_i_1_n_4 ),
        .CO({\tmp_178_reg_6153_reg[1]_i_1_n_4 ,\tmp_178_reg_6153_reg[1]_i_1_n_5 ,\tmp_178_reg_6153_reg[1]_i_1_n_6 ,\tmp_178_reg_6153_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_148_reg_5822,diff_2_reg_5797[54],tmp_149_reg_5827,diff_2_reg_5797[52]}),
        .O({\tmp_178_reg_6153_reg[1]_i_1_n_8 ,\tmp_178_reg_6153_reg[1]_i_1_n_9 ,\tmp_178_reg_6153_reg[1]_i_1_n_10 ,\tmp_178_reg_6153_reg[1]_i_1_n_11 }),
        .S({p_1_out[54],\tmp_178_reg_6153[1]_i_3_n_4 ,p_1_out[52],\tmp_178_reg_6153[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_179_reg_6159[1]_i_2 
       (.I0(tmp_150_reg_5832),
        .O(p_1_out[50]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_179_reg_6159[1]_i_3 
       (.I0(diff_2_reg_5797[50]),
        .I1(tmp_150_reg_5832),
        .O(\tmp_179_reg_6159[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_179_reg_6159[1]_i_4 
       (.I0(diff_2_reg_5797[49]),
        .O(p_1_out[48]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_179_reg_6159[1]_i_5 
       (.I0(diff_2_reg_5797[48]),
        .I1(diff_2_reg_5797[49]),
        .O(\tmp_179_reg_6159[1]_i_5_n_4 ));
  FDRE \tmp_179_reg_6159_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_179_reg_6159_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[48]),
        .R(1'b0));
  FDRE \tmp_179_reg_6159_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_179_reg_6159_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[49]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_179_reg_6159_reg[1]_i_1 
       (.CI(\tmp_180_reg_6165_reg[1]_i_1_n_4 ),
        .CO({\tmp_179_reg_6159_reg[1]_i_1_n_4 ,\tmp_179_reg_6159_reg[1]_i_1_n_5 ,\tmp_179_reg_6159_reg[1]_i_1_n_6 ,\tmp_179_reg_6159_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_150_reg_5832,diff_2_reg_5797[50:48]}),
        .O({\tmp_179_reg_6159_reg[1]_i_1_n_8 ,\tmp_179_reg_6159_reg[1]_i_1_n_9 ,\tmp_179_reg_6159_reg[1]_i_1_n_10 ,\tmp_179_reg_6159_reg[1]_i_1_n_11 }),
        .S({p_1_out[50],\tmp_179_reg_6159[1]_i_3_n_4 ,p_1_out[48],\tmp_179_reg_6159[1]_i_5_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_17_reg_5167[0]_i_1 
       (.I0(reg_414[35]),
        .I1(\tmp_reg_5097_reg[0]_0 [35]),
        .O(diff_fu_816_p2[35]));
  FDRE \tmp_17_reg_5167_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[35]),
        .Q(tmp_17_reg_5167),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_180_reg_6165[1]_i_2 
       (.I0(tmp_152_reg_5842),
        .O(p_1_out[46]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_180_reg_6165[1]_i_3 
       (.I0(diff_2_reg_5797[46]),
        .I1(tmp_152_reg_5842),
        .O(\tmp_180_reg_6165[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_180_reg_6165[1]_i_4 
       (.I0(tmp_153_reg_5847),
        .O(p_1_out[44]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_180_reg_6165[1]_i_5 
       (.I0(diff_2_reg_5797[44]),
        .I1(tmp_153_reg_5847),
        .O(\tmp_180_reg_6165[1]_i_5_n_4 ));
  FDRE \tmp_180_reg_6165_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_180_reg_6165_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[44]),
        .R(1'b0));
  FDRE \tmp_180_reg_6165_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_180_reg_6165_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[45]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_180_reg_6165_reg[1]_i_1 
       (.CI(\tmp_181_reg_6171_reg[1]_i_1_n_4 ),
        .CO({\tmp_180_reg_6165_reg[1]_i_1_n_4 ,\tmp_180_reg_6165_reg[1]_i_1_n_5 ,\tmp_180_reg_6165_reg[1]_i_1_n_6 ,\tmp_180_reg_6165_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_152_reg_5842,diff_2_reg_5797[46],tmp_153_reg_5847,diff_2_reg_5797[44]}),
        .O({\tmp_180_reg_6165_reg[1]_i_1_n_8 ,\tmp_180_reg_6165_reg[1]_i_1_n_9 ,\tmp_180_reg_6165_reg[1]_i_1_n_10 ,\tmp_180_reg_6165_reg[1]_i_1_n_11 }),
        .S({p_1_out[46],\tmp_180_reg_6165[1]_i_3_n_4 ,p_1_out[44],\tmp_180_reg_6165[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_181_reg_6171[1]_i_2 
       (.I0(tmp_154_reg_5852),
        .O(p_1_out[42]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_181_reg_6171[1]_i_3 
       (.I0(diff_2_reg_5797[42]),
        .I1(tmp_154_reg_5852),
        .O(\tmp_181_reg_6171[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_181_reg_6171[1]_i_4 
       (.I0(diff_2_reg_5797[41]),
        .O(p_1_out[40]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_181_reg_6171[1]_i_5 
       (.I0(diff_2_reg_5797[40]),
        .I1(diff_2_reg_5797[41]),
        .O(\tmp_181_reg_6171[1]_i_5_n_4 ));
  FDRE \tmp_181_reg_6171_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_181_reg_6171_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[40]),
        .R(1'b0));
  FDRE \tmp_181_reg_6171_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_181_reg_6171_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[41]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_181_reg_6171_reg[1]_i_1 
       (.CI(\tmp_182_reg_6177_reg[1]_i_1_n_4 ),
        .CO({\tmp_181_reg_6171_reg[1]_i_1_n_4 ,\tmp_181_reg_6171_reg[1]_i_1_n_5 ,\tmp_181_reg_6171_reg[1]_i_1_n_6 ,\tmp_181_reg_6171_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_154_reg_5852,diff_2_reg_5797[42:40]}),
        .O({\tmp_181_reg_6171_reg[1]_i_1_n_8 ,\tmp_181_reg_6171_reg[1]_i_1_n_9 ,\tmp_181_reg_6171_reg[1]_i_1_n_10 ,\tmp_181_reg_6171_reg[1]_i_1_n_11 }),
        .S({p_1_out[42],\tmp_181_reg_6171[1]_i_3_n_4 ,p_1_out[40],\tmp_181_reg_6171[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_182_reg_6177[1]_i_2 
       (.I0(tmp_156_reg_5862),
        .O(p_1_out[38]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_182_reg_6177[1]_i_3 
       (.I0(diff_2_reg_5797[38]),
        .I1(tmp_156_reg_5862),
        .O(\tmp_182_reg_6177[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_182_reg_6177[1]_i_4 
       (.I0(tmp_157_reg_5867),
        .O(p_1_out[36]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_182_reg_6177[1]_i_5 
       (.I0(diff_2_reg_5797[36]),
        .I1(tmp_157_reg_5867),
        .O(\tmp_182_reg_6177[1]_i_5_n_4 ));
  FDRE \tmp_182_reg_6177_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_182_reg_6177_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[36]),
        .R(1'b0));
  FDRE \tmp_182_reg_6177_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_182_reg_6177_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[37]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_182_reg_6177_reg[1]_i_1 
       (.CI(\tmp_183_reg_6183_reg[1]_i_1_n_4 ),
        .CO({\tmp_182_reg_6177_reg[1]_i_1_n_4 ,\tmp_182_reg_6177_reg[1]_i_1_n_5 ,\tmp_182_reg_6177_reg[1]_i_1_n_6 ,\tmp_182_reg_6177_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_156_reg_5862,diff_2_reg_5797[38],tmp_157_reg_5867,diff_2_reg_5797[36]}),
        .O({\tmp_182_reg_6177_reg[1]_i_1_n_8 ,\tmp_182_reg_6177_reg[1]_i_1_n_9 ,\tmp_182_reg_6177_reg[1]_i_1_n_10 ,\tmp_182_reg_6177_reg[1]_i_1_n_11 }),
        .S({p_1_out[38],\tmp_182_reg_6177[1]_i_3_n_4 ,p_1_out[36],\tmp_182_reg_6177[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_183_reg_6183[1]_i_2 
       (.I0(tmp_158_reg_5872),
        .O(p_1_out[34]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_183_reg_6183[1]_i_3 
       (.I0(diff_2_reg_5797[34]),
        .I1(tmp_158_reg_5872),
        .O(\tmp_183_reg_6183[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_183_reg_6183[1]_i_4 
       (.I0(diff_2_reg_5797[33]),
        .O(p_1_out[32]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_183_reg_6183[1]_i_5 
       (.I0(diff_2_reg_5797[32]),
        .I1(diff_2_reg_5797[33]),
        .O(\tmp_183_reg_6183[1]_i_5_n_4 ));
  FDRE \tmp_183_reg_6183_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_183_reg_6183_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[32]),
        .R(1'b0));
  FDRE \tmp_183_reg_6183_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_183_reg_6183_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[33]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_183_reg_6183_reg[1]_i_1 
       (.CI(\tmp_184_reg_6189_reg[1]_i_1_n_4 ),
        .CO({\tmp_183_reg_6183_reg[1]_i_1_n_4 ,\tmp_183_reg_6183_reg[1]_i_1_n_5 ,\tmp_183_reg_6183_reg[1]_i_1_n_6 ,\tmp_183_reg_6183_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_158_reg_5872,diff_2_reg_5797[34:32]}),
        .O({\tmp_183_reg_6183_reg[1]_i_1_n_8 ,\tmp_183_reg_6183_reg[1]_i_1_n_9 ,\tmp_183_reg_6183_reg[1]_i_1_n_10 ,\tmp_183_reg_6183_reg[1]_i_1_n_11 }),
        .S({p_1_out[34],\tmp_183_reg_6183[1]_i_3_n_4 ,p_1_out[32],\tmp_183_reg_6183[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_184_reg_6189[1]_i_2 
       (.I0(tmp_160_reg_5882),
        .O(p_1_out[30]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_184_reg_6189[1]_i_3 
       (.I0(diff_2_reg_5797[30]),
        .I1(tmp_160_reg_5882),
        .O(\tmp_184_reg_6189[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_184_reg_6189[1]_i_4 
       (.I0(tmp_161_reg_5887),
        .O(p_1_out[28]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_184_reg_6189[1]_i_5 
       (.I0(diff_2_reg_5797[28]),
        .I1(tmp_161_reg_5887),
        .O(\tmp_184_reg_6189[1]_i_5_n_4 ));
  FDRE \tmp_184_reg_6189_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_184_reg_6189_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[28]),
        .R(1'b0));
  FDRE \tmp_184_reg_6189_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_184_reg_6189_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[29]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_184_reg_6189_reg[1]_i_1 
       (.CI(\tmp_185_reg_6195_reg[1]_i_1_n_4 ),
        .CO({\tmp_184_reg_6189_reg[1]_i_1_n_4 ,\tmp_184_reg_6189_reg[1]_i_1_n_5 ,\tmp_184_reg_6189_reg[1]_i_1_n_6 ,\tmp_184_reg_6189_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_160_reg_5882,diff_2_reg_5797[30],tmp_161_reg_5887,diff_2_reg_5797[28]}),
        .O({\tmp_184_reg_6189_reg[1]_i_1_n_8 ,\tmp_184_reg_6189_reg[1]_i_1_n_9 ,\tmp_184_reg_6189_reg[1]_i_1_n_10 ,\tmp_184_reg_6189_reg[1]_i_1_n_11 }),
        .S({p_1_out[30],\tmp_184_reg_6189[1]_i_3_n_4 ,p_1_out[28],\tmp_184_reg_6189[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_185_reg_6195[1]_i_2 
       (.I0(tmp_162_reg_5892),
        .O(p_1_out[26]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_185_reg_6195[1]_i_3 
       (.I0(diff_2_reg_5797[26]),
        .I1(tmp_162_reg_5892),
        .O(\tmp_185_reg_6195[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_185_reg_6195[1]_i_4 
       (.I0(diff_2_reg_5797[25]),
        .O(p_1_out[24]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_185_reg_6195[1]_i_5 
       (.I0(diff_2_reg_5797[24]),
        .I1(diff_2_reg_5797[25]),
        .O(\tmp_185_reg_6195[1]_i_5_n_4 ));
  FDRE \tmp_185_reg_6195_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_185_reg_6195_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[24]),
        .R(1'b0));
  FDRE \tmp_185_reg_6195_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_185_reg_6195_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[25]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_185_reg_6195_reg[1]_i_1 
       (.CI(\tmp_186_reg_6201_reg[1]_i_1_n_4 ),
        .CO({\tmp_185_reg_6195_reg[1]_i_1_n_4 ,\tmp_185_reg_6195_reg[1]_i_1_n_5 ,\tmp_185_reg_6195_reg[1]_i_1_n_6 ,\tmp_185_reg_6195_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_162_reg_5892,diff_2_reg_5797[26:24]}),
        .O({\tmp_185_reg_6195_reg[1]_i_1_n_8 ,\tmp_185_reg_6195_reg[1]_i_1_n_9 ,\tmp_185_reg_6195_reg[1]_i_1_n_10 ,\tmp_185_reg_6195_reg[1]_i_1_n_11 }),
        .S({p_1_out[26],\tmp_185_reg_6195[1]_i_3_n_4 ,p_1_out[24],\tmp_185_reg_6195[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_186_reg_6201[1]_i_2 
       (.I0(tmp_164_reg_5902),
        .O(p_1_out[22]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_186_reg_6201[1]_i_3 
       (.I0(diff_2_reg_5797[22]),
        .I1(tmp_164_reg_5902),
        .O(\tmp_186_reg_6201[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_186_reg_6201[1]_i_4 
       (.I0(tmp_165_reg_5907),
        .O(p_1_out[20]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_186_reg_6201[1]_i_5 
       (.I0(diff_2_reg_5797[20]),
        .I1(tmp_165_reg_5907),
        .O(\tmp_186_reg_6201[1]_i_5_n_4 ));
  FDRE \tmp_186_reg_6201_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_186_reg_6201_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[20]),
        .R(1'b0));
  FDRE \tmp_186_reg_6201_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_186_reg_6201_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[21]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_186_reg_6201_reg[1]_i_1 
       (.CI(\tmp_187_reg_6207_reg[1]_i_1_n_4 ),
        .CO({\tmp_186_reg_6201_reg[1]_i_1_n_4 ,\tmp_186_reg_6201_reg[1]_i_1_n_5 ,\tmp_186_reg_6201_reg[1]_i_1_n_6 ,\tmp_186_reg_6201_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_164_reg_5902,diff_2_reg_5797[22],tmp_165_reg_5907,diff_2_reg_5797[20]}),
        .O({\tmp_186_reg_6201_reg[1]_i_1_n_8 ,\tmp_186_reg_6201_reg[1]_i_1_n_9 ,\tmp_186_reg_6201_reg[1]_i_1_n_10 ,\tmp_186_reg_6201_reg[1]_i_1_n_11 }),
        .S({p_1_out[22],\tmp_186_reg_6201[1]_i_3_n_4 ,p_1_out[20],\tmp_186_reg_6201[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_187_reg_6207[1]_i_2 
       (.I0(tmp_166_reg_5912),
        .O(p_1_out[18]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_187_reg_6207[1]_i_3 
       (.I0(diff_2_reg_5797[18]),
        .I1(tmp_166_reg_5912),
        .O(\tmp_187_reg_6207[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_187_reg_6207[1]_i_4 
       (.I0(diff_2_reg_5797[17]),
        .O(p_1_out[16]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_187_reg_6207[1]_i_5 
       (.I0(diff_2_reg_5797[16]),
        .I1(diff_2_reg_5797[17]),
        .O(\tmp_187_reg_6207[1]_i_5_n_4 ));
  FDRE \tmp_187_reg_6207_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_187_reg_6207_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[16]),
        .R(1'b0));
  FDRE \tmp_187_reg_6207_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_187_reg_6207_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[17]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_187_reg_6207_reg[1]_i_1 
       (.CI(\tmp_188_reg_6213_reg[1]_i_1_n_4 ),
        .CO({\tmp_187_reg_6207_reg[1]_i_1_n_4 ,\tmp_187_reg_6207_reg[1]_i_1_n_5 ,\tmp_187_reg_6207_reg[1]_i_1_n_6 ,\tmp_187_reg_6207_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_166_reg_5912,diff_2_reg_5797[18:16]}),
        .O({\tmp_187_reg_6207_reg[1]_i_1_n_8 ,\tmp_187_reg_6207_reg[1]_i_1_n_9 ,\tmp_187_reg_6207_reg[1]_i_1_n_10 ,\tmp_187_reg_6207_reg[1]_i_1_n_11 }),
        .S({p_1_out[18],\tmp_187_reg_6207[1]_i_3_n_4 ,p_1_out[16],\tmp_187_reg_6207[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_188_reg_6213[1]_i_2 
       (.I0(tmp_168_reg_5922),
        .O(p_1_out[14]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_188_reg_6213[1]_i_3 
       (.I0(diff_2_reg_5797[14]),
        .I1(tmp_168_reg_5922),
        .O(\tmp_188_reg_6213[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_188_reg_6213[1]_i_4 
       (.I0(tmp_169_reg_5927),
        .O(p_1_out[12]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_188_reg_6213[1]_i_5 
       (.I0(diff_2_reg_5797[12]),
        .I1(tmp_169_reg_5927),
        .O(\tmp_188_reg_6213[1]_i_5_n_4 ));
  FDRE \tmp_188_reg_6213_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_188_reg_6213_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[12]),
        .R(1'b0));
  FDRE \tmp_188_reg_6213_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_188_reg_6213_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[13]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_188_reg_6213_reg[1]_i_1 
       (.CI(\tmp_189_reg_6219_reg[1]_i_1_n_4 ),
        .CO({\tmp_188_reg_6213_reg[1]_i_1_n_4 ,\tmp_188_reg_6213_reg[1]_i_1_n_5 ,\tmp_188_reg_6213_reg[1]_i_1_n_6 ,\tmp_188_reg_6213_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_168_reg_5922,diff_2_reg_5797[14],tmp_169_reg_5927,diff_2_reg_5797[12]}),
        .O({\tmp_188_reg_6213_reg[1]_i_1_n_8 ,\tmp_188_reg_6213_reg[1]_i_1_n_9 ,\tmp_188_reg_6213_reg[1]_i_1_n_10 ,\tmp_188_reg_6213_reg[1]_i_1_n_11 }),
        .S({p_1_out[14],\tmp_188_reg_6213[1]_i_3_n_4 ,p_1_out[12],\tmp_188_reg_6213[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_189_reg_6219[1]_i_2 
       (.I0(tmp_170_reg_5932),
        .O(p_1_out[10]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_189_reg_6219[1]_i_3 
       (.I0(diff_2_reg_5797[10]),
        .I1(tmp_170_reg_5932),
        .O(\tmp_189_reg_6219[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_189_reg_6219[1]_i_4 
       (.I0(diff_2_reg_5797[9]),
        .O(p_1_out[8]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_189_reg_6219[1]_i_5 
       (.I0(diff_2_reg_5797[8]),
        .I1(diff_2_reg_5797[9]),
        .O(\tmp_189_reg_6219[1]_i_5_n_4 ));
  FDRE \tmp_189_reg_6219_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_189_reg_6219_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[8]),
        .R(1'b0));
  FDRE \tmp_189_reg_6219_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_189_reg_6219_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_189_reg_6219_reg[1]_i_1 
       (.CI(\tmp_190_reg_6225_reg[1]_i_1_n_4 ),
        .CO({\tmp_189_reg_6219_reg[1]_i_1_n_4 ,\tmp_189_reg_6219_reg[1]_i_1_n_5 ,\tmp_189_reg_6219_reg[1]_i_1_n_6 ,\tmp_189_reg_6219_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_170_reg_5932,diff_2_reg_5797[10:8]}),
        .O({\tmp_189_reg_6219_reg[1]_i_1_n_8 ,\tmp_189_reg_6219_reg[1]_i_1_n_9 ,\tmp_189_reg_6219_reg[1]_i_1_n_10 ,\tmp_189_reg_6219_reg[1]_i_1_n_11 }),
        .S({p_1_out[10],\tmp_189_reg_6219[1]_i_3_n_4 ,p_1_out[8],\tmp_189_reg_6219[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_190_reg_6225[1]_i_2 
       (.I0(tmp_172_reg_5942),
        .O(p_1_out[6]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_190_reg_6225[1]_i_3 
       (.I0(diff_2_reg_5797[6]),
        .I1(tmp_172_reg_5942),
        .O(\tmp_190_reg_6225[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_190_reg_6225[1]_i_4 
       (.I0(tmp_173_reg_5947),
        .O(p_1_out[4]));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_190_reg_6225[1]_i_5 
       (.I0(diff_2_reg_5797[4]),
        .I1(tmp_173_reg_5947),
        .O(\tmp_190_reg_6225[1]_i_5_n_4 ));
  FDRE \tmp_190_reg_6225_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(p_0_in[0]),
        .Q(and_ln21_4_cast_fu_3704_p31[4]),
        .R(1'b0));
  FDRE \tmp_190_reg_6225_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(p_0_in[1]),
        .Q(and_ln21_4_cast_fu_3704_p31[5]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_190_reg_6225_reg[1]_i_1 
       (.CI(\trunc_ln21_2_reg_6231_reg[1]_i_1_n_4 ),
        .CO({\tmp_190_reg_6225_reg[1]_i_1_n_4 ,\tmp_190_reg_6225_reg[1]_i_1_n_5 ,\tmp_190_reg_6225_reg[1]_i_1_n_6 ,\tmp_190_reg_6225_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({tmp_172_reg_5942,diff_2_reg_5797[6],tmp_173_reg_5947,diff_2_reg_5797[4]}),
        .O({\tmp_190_reg_6225_reg[1]_i_1_n_8 ,\tmp_190_reg_6225_reg[1]_i_1_n_9 ,p_0_in}),
        .S({p_1_out[6],\tmp_190_reg_6225[1]_i_3_n_4 ,p_1_out[4],\tmp_190_reg_6225[1]_i_5_n_4 }));
  FDRE \tmp_191_reg_6237_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_176_reg_6142_reg[1]_i_1_n_9 ),
        .Q(tmp_191_reg_6237[0]),
        .R(1'b0));
  FDRE \tmp_191_reg_6237_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_176_reg_6142_reg[1]_i_1_n_8 ),
        .Q(tmp_191_reg_6237[1]),
        .R(1'b0));
  FDRE \tmp_192_reg_6242_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_177_reg_6147_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[56]),
        .R(1'b0));
  FDRE \tmp_192_reg_6242_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_177_reg_6147_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[57]),
        .R(1'b0));
  FDRE \tmp_193_reg_6248_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_178_reg_6153_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[52]),
        .R(1'b0));
  FDRE \tmp_193_reg_6248_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_178_reg_6153_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[53]),
        .R(1'b0));
  FDRE \tmp_194_reg_6254_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_179_reg_6159_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[48]),
        .R(1'b0));
  FDRE \tmp_194_reg_6254_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_179_reg_6159_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[49]),
        .R(1'b0));
  FDRE \tmp_195_reg_6260_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_180_reg_6165_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[44]),
        .R(1'b0));
  FDRE \tmp_195_reg_6260_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_180_reg_6165_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[45]),
        .R(1'b0));
  FDRE \tmp_196_reg_6266_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_181_reg_6171_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[40]),
        .R(1'b0));
  FDRE \tmp_196_reg_6266_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_181_reg_6171_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[41]),
        .R(1'b0));
  FDRE \tmp_197_reg_6272_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_182_reg_6177_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[36]),
        .R(1'b0));
  FDRE \tmp_197_reg_6272_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_182_reg_6177_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[37]),
        .R(1'b0));
  FDRE \tmp_198_reg_6278_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_183_reg_6183_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[32]),
        .R(1'b0));
  FDRE \tmp_198_reg_6278_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_183_reg_6183_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[33]),
        .R(1'b0));
  FDRE \tmp_199_reg_6284_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_184_reg_6189_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[28]),
        .R(1'b0));
  FDRE \tmp_199_reg_6284_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_184_reg_6189_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[29]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_19_reg_5177[0]_i_1 
       (.I0(reg_414[31]),
        .I1(\tmp_reg_5097_reg[0]_0 [31]),
        .O(diff_fu_816_p2[31]));
  FDRE \tmp_19_reg_5177_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[31]),
        .Q(tmp_19_reg_5177),
        .R(1'b0));
  FDRE \tmp_200_reg_6290_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_185_reg_6195_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[24]),
        .R(1'b0));
  FDRE \tmp_200_reg_6290_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_185_reg_6195_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[25]),
        .R(1'b0));
  FDRE \tmp_201_reg_6296_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_186_reg_6201_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[20]),
        .R(1'b0));
  FDRE \tmp_201_reg_6296_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_186_reg_6201_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[21]),
        .R(1'b0));
  FDRE \tmp_202_reg_6302_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_187_reg_6207_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[16]),
        .R(1'b0));
  FDRE \tmp_202_reg_6302_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_187_reg_6207_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[17]),
        .R(1'b0));
  FDRE \tmp_203_reg_6308_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_188_reg_6213_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[12]),
        .R(1'b0));
  FDRE \tmp_203_reg_6308_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_188_reg_6213_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[13]),
        .R(1'b0));
  FDRE \tmp_204_reg_6314_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_189_reg_6219_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[8]),
        .R(1'b0));
  FDRE \tmp_204_reg_6314_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_189_reg_6219_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[9]),
        .R(1'b0));
  FDRE \tmp_205_reg_6320_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_190_reg_6225_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[4]),
        .R(1'b0));
  FDRE \tmp_205_reg_6320_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_190_reg_6225_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[5]),
        .R(1'b0));
  FDRE \tmp_206_reg_6326_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_2_reg_6231_reg[1]_i_1_n_9 ),
        .Q(and_ln21_5_cast_fu_3807_p31[0]),
        .R(1'b0));
  FDRE \tmp_206_reg_6326_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_2_reg_6231_reg[1]_i_1_n_8 ),
        .Q(and_ln21_5_cast_fu_3807_p31[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[10]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[13]),
        .I1(and_ln21_4_cast_fu_3704_p31[13]),
        .O(\tmp_207_reg_6619[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[10]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[12]),
        .I1(and_ln21_4_cast_fu_3704_p31[12]),
        .O(\tmp_207_reg_6619[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[18]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[21]),
        .I1(and_ln21_4_cast_fu_3704_p31[21]),
        .O(\tmp_207_reg_6619[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[18]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[20]),
        .I1(and_ln21_4_cast_fu_3704_p31[20]),
        .O(\tmp_207_reg_6619[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[26]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[29]),
        .I1(and_ln21_4_cast_fu_3704_p31[29]),
        .O(\tmp_207_reg_6619[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[26]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[28]),
        .I1(and_ln21_4_cast_fu_3704_p31[28]),
        .O(\tmp_207_reg_6619[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[2]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[5]),
        .I1(and_ln21_4_cast_fu_3704_p31[5]),
        .O(\tmp_207_reg_6619[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[2]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[4]),
        .I1(and_ln21_4_cast_fu_3704_p31[4]),
        .O(\tmp_207_reg_6619[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[34]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[37]),
        .I1(and_ln21_4_cast_fu_3704_p31[37]),
        .O(\tmp_207_reg_6619[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[34]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[36]),
        .I1(and_ln21_4_cast_fu_3704_p31[36]),
        .O(\tmp_207_reg_6619[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[42]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[45]),
        .I1(and_ln21_4_cast_fu_3704_p31[45]),
        .O(\tmp_207_reg_6619[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[42]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[44]),
        .I1(and_ln21_4_cast_fu_3704_p31[44]),
        .O(\tmp_207_reg_6619[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[50]_i_2 
       (.I0(and_ln21_5_cast_fu_3807_p31[53]),
        .I1(and_ln21_4_cast_fu_3704_p31[53]),
        .O(\tmp_207_reg_6619[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[50]_i_3 
       (.I0(and_ln21_5_cast_fu_3807_p31[52]),
        .I1(and_ln21_4_cast_fu_3704_p31[52]),
        .O(\tmp_207_reg_6619[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[58]_i_2 
       (.I0(tmp_191_reg_6237[1]),
        .I1(tmp_176_reg_6142[1]),
        .O(\tmp_207_reg_6619[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_207_reg_6619[58]_i_3 
       (.I0(tmp_191_reg_6237[0]),
        .I1(tmp_176_reg_6142[0]),
        .O(\tmp_207_reg_6619[58]_i_3_n_4 ));
  FDRE \tmp_207_reg_6619_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[4]),
        .Q(tmp_207_reg_6619[0]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[10] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[14]),
        .Q(tmp_207_reg_6619[10]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[10]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[14],\NLW_tmp_207_reg_6619_reg[10]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[13:12]}),
        .O({\NLW_tmp_207_reg_6619_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[13:12]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[10]_i_2_n_4 ,\tmp_207_reg_6619[10]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[16] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[20]),
        .Q(tmp_207_reg_6619[16]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[17] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[21]),
        .Q(tmp_207_reg_6619[17]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[18] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[22]),
        .Q(tmp_207_reg_6619[18]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[18]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[22],\NLW_tmp_207_reg_6619_reg[18]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[21:20]}),
        .O({\NLW_tmp_207_reg_6619_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[21:20]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[18]_i_2_n_4 ,\tmp_207_reg_6619[18]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[5]),
        .Q(tmp_207_reg_6619[1]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[24] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[28]),
        .Q(tmp_207_reg_6619[24]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[25] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[29]),
        .Q(tmp_207_reg_6619[25]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[26] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[30]),
        .Q(tmp_207_reg_6619[26]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[26]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[30],\NLW_tmp_207_reg_6619_reg[26]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[29:28]}),
        .O({\NLW_tmp_207_reg_6619_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[29:28]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[26]_i_2_n_4 ,\tmp_207_reg_6619[26]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[6]),
        .Q(tmp_207_reg_6619[2]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[2]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[6],\NLW_tmp_207_reg_6619_reg[2]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[5:4]}),
        .O({\NLW_tmp_207_reg_6619_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[5:4]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[2]_i_2_n_4 ,\tmp_207_reg_6619[2]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[32] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[36]),
        .Q(tmp_207_reg_6619[32]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[33] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[37]),
        .Q(tmp_207_reg_6619[33]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[34] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[38]),
        .Q(tmp_207_reg_6619[34]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[34]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[38],\NLW_tmp_207_reg_6619_reg[34]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[37:36]}),
        .O({\NLW_tmp_207_reg_6619_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[37:36]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[34]_i_2_n_4 ,\tmp_207_reg_6619[34]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[40] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[44]),
        .Q(tmp_207_reg_6619[40]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[41] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[45]),
        .Q(tmp_207_reg_6619[41]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[42] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[46]),
        .Q(tmp_207_reg_6619[42]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[42]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[46],\NLW_tmp_207_reg_6619_reg[42]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[45:44]}),
        .O({\NLW_tmp_207_reg_6619_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[45:44]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[42]_i_2_n_4 ,\tmp_207_reg_6619[42]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[48] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[52]),
        .Q(tmp_207_reg_6619[48]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[49] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[53]),
        .Q(tmp_207_reg_6619[49]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[50] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[54]),
        .Q(tmp_207_reg_6619[50]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[50]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[54],\NLW_tmp_207_reg_6619_reg[50]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_5_cast_fu_3807_p31[53:52]}),
        .O({\NLW_tmp_207_reg_6619_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[53:52]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[50]_i_2_n_4 ,\tmp_207_reg_6619[50]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[56] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[60]),
        .Q(tmp_207_reg_6619[56]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[57] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[61]),
        .Q(tmp_207_reg_6619[57]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[58] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[62]),
        .Q(tmp_207_reg_6619[58]),
        .R(1'b0));
  CARRY4 \tmp_207_reg_6619_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_207_reg_6619_reg[58]_i_1_CO_UNCONNECTED [3],add_ln21_2_fu_3866_p2[62],\NLW_tmp_207_reg_6619_reg[58]_i_1_CO_UNCONNECTED [1],\tmp_207_reg_6619_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,tmp_191_reg_6237}),
        .O({\NLW_tmp_207_reg_6619_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln21_2_fu_3866_p2[61:60]}),
        .S({1'b0,1'b1,\tmp_207_reg_6619[58]_i_2_n_4 ,\tmp_207_reg_6619[58]_i_3_n_4 }));
  FDRE \tmp_207_reg_6619_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[12]),
        .Q(tmp_207_reg_6619[8]),
        .R(1'b0));
  FDRE \tmp_207_reg_6619_reg[9] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_2_fu_3866_p2[13]),
        .Q(tmp_207_reg_6619[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_208_reg_6654[3]_i_2 
       (.I0(tmp_207_reg_6619[50]),
        .I1(add_ln18_2_reg_6614[50]),
        .O(\tmp_208_reg_6654[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_208_reg_6654[3]_i_3 
       (.I0(tmp_207_reg_6619[49]),
        .I1(add_ln18_2_reg_6614[49]),
        .O(\tmp_208_reg_6654[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_208_reg_6654[3]_i_4 
       (.I0(tmp_207_reg_6619[48]),
        .I1(add_ln18_2_reg_6614[48]),
        .O(\tmp_208_reg_6654[3]_i_4_n_4 ));
  FDRE \tmp_208_reg_6654_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_208_reg_6654_reg[3]_i_1_n_11 ),
        .Q(tmp_208_reg_6654[0]),
        .R(1'b0));
  FDRE \tmp_208_reg_6654_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_208_reg_6654_reg[3]_i_1_n_10 ),
        .Q(tmp_208_reg_6654[1]),
        .R(1'b0));
  FDRE \tmp_208_reg_6654_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_208_reg_6654_reg[3]_i_1_n_9 ),
        .Q(tmp_208_reg_6654[2]),
        .R(1'b0));
  FDRE \tmp_208_reg_6654_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_208_reg_6654_reg[3]_i_1_n_4 ),
        .Q(tmp_208_reg_6654[3]),
        .R(1'b0));
  CARRY4 \tmp_208_reg_6654_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_208_reg_6654_reg[3]_i_1_n_4 ,\NLW_tmp_208_reg_6654_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_208_reg_6654_reg[3]_i_1_n_6 ,\tmp_208_reg_6654_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[50:48]}),
        .O({\NLW_tmp_208_reg_6654_reg[3]_i_1_O_UNCONNECTED [3],\tmp_208_reg_6654_reg[3]_i_1_n_9 ,\tmp_208_reg_6654_reg[3]_i_1_n_10 ,\tmp_208_reg_6654_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_208_reg_6654[3]_i_2_n_4 ,\tmp_208_reg_6654[3]_i_3_n_4 ,\tmp_208_reg_6654[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_209_reg_6660[3]_i_2 
       (.I0(tmp_207_reg_6619[42]),
        .I1(add_ln18_2_reg_6614[42]),
        .O(\tmp_209_reg_6660[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_209_reg_6660[3]_i_3 
       (.I0(tmp_207_reg_6619[41]),
        .I1(add_ln18_2_reg_6614[41]),
        .O(\tmp_209_reg_6660[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_209_reg_6660[3]_i_4 
       (.I0(tmp_207_reg_6619[40]),
        .I1(add_ln18_2_reg_6614[40]),
        .O(\tmp_209_reg_6660[3]_i_4_n_4 ));
  FDRE \tmp_209_reg_6660_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_209_reg_6660_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_5_fu_4540_p1[32]),
        .R(1'b0));
  FDRE \tmp_209_reg_6660_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_209_reg_6660_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_5_fu_4540_p1[33]),
        .R(1'b0));
  FDRE \tmp_209_reg_6660_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_209_reg_6660_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_5_fu_4540_p1[34]),
        .R(1'b0));
  FDRE \tmp_209_reg_6660_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_209_reg_6660_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_5_fu_4540_p1[35]),
        .R(1'b0));
  CARRY4 \tmp_209_reg_6660_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_209_reg_6660_reg[3]_i_1_n_4 ,\NLW_tmp_209_reg_6660_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_209_reg_6660_reg[3]_i_1_n_6 ,\tmp_209_reg_6660_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[42:40]}),
        .O({\NLW_tmp_209_reg_6660_reg[3]_i_1_O_UNCONNECTED [3],\tmp_209_reg_6660_reg[3]_i_1_n_9 ,\tmp_209_reg_6660_reg[3]_i_1_n_10 ,\tmp_209_reg_6660_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_209_reg_6660[3]_i_2_n_4 ,\tmp_209_reg_6660[3]_i_3_n_4 ,\tmp_209_reg_6660[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_20_reg_5182[0]_i_1 
       (.I0(reg_414[29]),
        .I1(\tmp_reg_5097_reg[0]_0 [29]),
        .O(diff_fu_816_p2[29]));
  FDRE \tmp_20_reg_5182_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[29]),
        .Q(tmp_20_reg_5182),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_210_reg_6666[3]_i_2 
       (.I0(tmp_207_reg_6619[34]),
        .I1(add_ln18_2_reg_6614[34]),
        .O(\tmp_210_reg_6666[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_210_reg_6666[3]_i_3 
       (.I0(tmp_207_reg_6619[33]),
        .I1(add_ln18_2_reg_6614[33]),
        .O(\tmp_210_reg_6666[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_210_reg_6666[3]_i_4 
       (.I0(tmp_207_reg_6619[32]),
        .I1(add_ln18_2_reg_6614[32]),
        .O(\tmp_210_reg_6666[3]_i_4_n_4 ));
  FDRE \tmp_210_reg_6666_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_210_reg_6666_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_5_fu_4540_p1[24]),
        .R(1'b0));
  FDRE \tmp_210_reg_6666_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_210_reg_6666_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_5_fu_4540_p1[25]),
        .R(1'b0));
  FDRE \tmp_210_reg_6666_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_210_reg_6666_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_5_fu_4540_p1[26]),
        .R(1'b0));
  FDRE \tmp_210_reg_6666_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_210_reg_6666_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_5_fu_4540_p1[27]),
        .R(1'b0));
  CARRY4 \tmp_210_reg_6666_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_210_reg_6666_reg[3]_i_1_n_4 ,\NLW_tmp_210_reg_6666_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_210_reg_6666_reg[3]_i_1_n_6 ,\tmp_210_reg_6666_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[34:32]}),
        .O({\NLW_tmp_210_reg_6666_reg[3]_i_1_O_UNCONNECTED [3],\tmp_210_reg_6666_reg[3]_i_1_n_9 ,\tmp_210_reg_6666_reg[3]_i_1_n_10 ,\tmp_210_reg_6666_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_210_reg_6666[3]_i_2_n_4 ,\tmp_210_reg_6666[3]_i_3_n_4 ,\tmp_210_reg_6666[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_211_reg_6672[3]_i_2 
       (.I0(tmp_207_reg_6619[26]),
        .I1(add_ln18_2_reg_6614[26]),
        .O(\tmp_211_reg_6672[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_211_reg_6672[3]_i_3 
       (.I0(tmp_207_reg_6619[25]),
        .I1(add_ln18_2_reg_6614[25]),
        .O(\tmp_211_reg_6672[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_211_reg_6672[3]_i_4 
       (.I0(tmp_207_reg_6619[24]),
        .I1(add_ln18_2_reg_6614[24]),
        .O(\tmp_211_reg_6672[3]_i_4_n_4 ));
  FDRE \tmp_211_reg_6672_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_211_reg_6672_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_5_fu_4540_p1[16]),
        .R(1'b0));
  FDRE \tmp_211_reg_6672_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_211_reg_6672_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_5_fu_4540_p1[17]),
        .R(1'b0));
  FDRE \tmp_211_reg_6672_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_211_reg_6672_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_5_fu_4540_p1[18]),
        .R(1'b0));
  FDRE \tmp_211_reg_6672_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_211_reg_6672_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_5_fu_4540_p1[19]),
        .R(1'b0));
  CARRY4 \tmp_211_reg_6672_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_211_reg_6672_reg[3]_i_1_n_4 ,\NLW_tmp_211_reg_6672_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_211_reg_6672_reg[3]_i_1_n_6 ,\tmp_211_reg_6672_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[26:24]}),
        .O({\NLW_tmp_211_reg_6672_reg[3]_i_1_O_UNCONNECTED [3],\tmp_211_reg_6672_reg[3]_i_1_n_9 ,\tmp_211_reg_6672_reg[3]_i_1_n_10 ,\tmp_211_reg_6672_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_211_reg_6672[3]_i_2_n_4 ,\tmp_211_reg_6672[3]_i_3_n_4 ,\tmp_211_reg_6672[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_212_reg_6678[3]_i_2 
       (.I0(tmp_207_reg_6619[18]),
        .I1(add_ln18_2_reg_6614[18]),
        .O(\tmp_212_reg_6678[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_212_reg_6678[3]_i_3 
       (.I0(tmp_207_reg_6619[17]),
        .I1(add_ln18_2_reg_6614[17]),
        .O(\tmp_212_reg_6678[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_212_reg_6678[3]_i_4 
       (.I0(tmp_207_reg_6619[16]),
        .I1(add_ln18_2_reg_6614[16]),
        .O(\tmp_212_reg_6678[3]_i_4_n_4 ));
  FDRE \tmp_212_reg_6678_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_212_reg_6678_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_5_fu_4540_p1[8]),
        .R(1'b0));
  FDRE \tmp_212_reg_6678_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_212_reg_6678_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_5_fu_4540_p1[9]),
        .R(1'b0));
  FDRE \tmp_212_reg_6678_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_212_reg_6678_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_5_fu_4540_p1[10]),
        .R(1'b0));
  FDRE \tmp_212_reg_6678_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_212_reg_6678_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_5_fu_4540_p1[11]),
        .R(1'b0));
  CARRY4 \tmp_212_reg_6678_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_212_reg_6678_reg[3]_i_1_n_4 ,\NLW_tmp_212_reg_6678_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_212_reg_6678_reg[3]_i_1_n_6 ,\tmp_212_reg_6678_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[18:16]}),
        .O({\NLW_tmp_212_reg_6678_reg[3]_i_1_O_UNCONNECTED [3],\tmp_212_reg_6678_reg[3]_i_1_n_9 ,\tmp_212_reg_6678_reg[3]_i_1_n_10 ,\tmp_212_reg_6678_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_212_reg_6678[3]_i_2_n_4 ,\tmp_212_reg_6678[3]_i_3_n_4 ,\tmp_212_reg_6678[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_213_reg_6684[3]_i_2 
       (.I0(tmp_207_reg_6619[10]),
        .I1(add_ln18_2_reg_6614[10]),
        .O(\tmp_213_reg_6684[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_213_reg_6684[3]_i_3 
       (.I0(tmp_207_reg_6619[9]),
        .I1(add_ln18_2_reg_6614[9]),
        .O(\tmp_213_reg_6684[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_213_reg_6684[3]_i_4 
       (.I0(tmp_207_reg_6619[8]),
        .I1(add_ln18_2_reg_6614[8]),
        .O(\tmp_213_reg_6684[3]_i_4_n_4 ));
  FDRE \tmp_213_reg_6684_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_213_reg_6684_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_5_fu_4540_p1[0]),
        .R(1'b0));
  FDRE \tmp_213_reg_6684_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_213_reg_6684_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_5_fu_4540_p1[1]),
        .R(1'b0));
  FDRE \tmp_213_reg_6684_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_213_reg_6684_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_5_fu_4540_p1[2]),
        .R(1'b0));
  FDRE \tmp_213_reg_6684_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_213_reg_6684_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_5_fu_4540_p1[3]),
        .R(1'b0));
  CARRY4 \tmp_213_reg_6684_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_213_reg_6684_reg[3]_i_1_n_4 ,\NLW_tmp_213_reg_6684_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_213_reg_6684_reg[3]_i_1_n_6 ,\tmp_213_reg_6684_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[10:8]}),
        .O({\NLW_tmp_213_reg_6684_reg[3]_i_1_O_UNCONNECTED [3],\tmp_213_reg_6684_reg[3]_i_1_n_9 ,\tmp_213_reg_6684_reg[3]_i_1_n_10 ,\tmp_213_reg_6684_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_213_reg_6684[3]_i_2_n_4 ,\tmp_213_reg_6684[3]_i_3_n_4 ,\tmp_213_reg_6684[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_214_reg_6695[3]_i_2 
       (.I0(tmp_207_reg_6619[58]),
        .I1(add_ln18_2_reg_6614[58]),
        .O(\tmp_214_reg_6695[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_214_reg_6695[3]_i_3 
       (.I0(tmp_207_reg_6619[57]),
        .I1(add_ln18_2_reg_6614[57]),
        .O(\tmp_214_reg_6695[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_214_reg_6695[3]_i_4 
       (.I0(tmp_207_reg_6619[56]),
        .I1(add_ln18_2_reg_6614[56]),
        .O(\tmp_214_reg_6695[3]_i_4_n_4 ));
  FDRE \tmp_214_reg_6695_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_214_reg_6695_reg[3]_i_1_n_11 ),
        .Q(tmp_214_reg_6695[0]),
        .R(1'b0));
  FDRE \tmp_214_reg_6695_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_214_reg_6695_reg[3]_i_1_n_10 ),
        .Q(tmp_214_reg_6695[1]),
        .R(1'b0));
  FDRE \tmp_214_reg_6695_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_214_reg_6695_reg[3]_i_1_n_9 ),
        .Q(tmp_214_reg_6695[2]),
        .R(1'b0));
  FDRE \tmp_214_reg_6695_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_214_reg_6695_reg[3]_i_1_n_4 ),
        .Q(tmp_214_reg_6695[3]),
        .R(1'b0));
  CARRY4 \tmp_214_reg_6695_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_214_reg_6695_reg[3]_i_1_n_4 ,\NLW_tmp_214_reg_6695_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_214_reg_6695_reg[3]_i_1_n_6 ,\tmp_214_reg_6695_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[58:56]}),
        .O({\NLW_tmp_214_reg_6695_reg[3]_i_1_O_UNCONNECTED [3],\tmp_214_reg_6695_reg[3]_i_1_n_9 ,\tmp_214_reg_6695_reg[3]_i_1_n_10 ,\tmp_214_reg_6695_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_214_reg_6695[3]_i_2_n_4 ,\tmp_214_reg_6695[3]_i_3_n_4 ,\tmp_214_reg_6695[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[35]_i_2 
       (.I0(tmp_214_reg_6695[3]),
        .I1(tmp_208_reg_6654[3]),
        .O(\tmp_215_reg_6771[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[35]_i_3 
       (.I0(tmp_214_reg_6695[2]),
        .I1(tmp_208_reg_6654[2]),
        .O(\tmp_215_reg_6771[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[35]_i_4 
       (.I0(tmp_214_reg_6695[1]),
        .I1(tmp_208_reg_6654[1]),
        .O(\tmp_215_reg_6771[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[35]_i_5 
       (.I0(tmp_214_reg_6695[0]),
        .I1(tmp_208_reg_6654[0]),
        .O(\tmp_215_reg_6771[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[3]_i_2 
       (.I0(zext_ln23_5_fu_4540_p1[19]),
        .I1(zext_ln23_5_fu_4540_p1[11]),
        .O(\tmp_215_reg_6771[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[3]_i_3 
       (.I0(zext_ln23_5_fu_4540_p1[18]),
        .I1(zext_ln23_5_fu_4540_p1[10]),
        .O(\tmp_215_reg_6771[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[3]_i_4 
       (.I0(zext_ln23_5_fu_4540_p1[17]),
        .I1(zext_ln23_5_fu_4540_p1[9]),
        .O(\tmp_215_reg_6771[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_215_reg_6771[3]_i_5 
       (.I0(zext_ln23_5_fu_4540_p1[16]),
        .I1(zext_ln23_5_fu_4540_p1[8]),
        .O(\tmp_215_reg_6771[3]_i_5_n_4 ));
  FDRE \tmp_215_reg_6771_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[16]),
        .Q(tmp_215_reg_6771[0]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[17]),
        .Q(tmp_215_reg_6771[1]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[18]),
        .Q(tmp_215_reg_6771[2]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[48]),
        .Q(tmp_215_reg_6771[32]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[49]),
        .Q(tmp_215_reg_6771[33]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[50]),
        .Q(tmp_215_reg_6771[34]),
        .R(1'b0));
  FDRE \tmp_215_reg_6771_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[51]),
        .Q(tmp_215_reg_6771[35]),
        .R(1'b0));
  CARRY4 \tmp_215_reg_6771_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\tmp_215_reg_6771_reg[35]_i_1_n_4 ,\tmp_215_reg_6771_reg[35]_i_1_n_5 ,\tmp_215_reg_6771_reg[35]_i_1_n_6 ,\tmp_215_reg_6771_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_214_reg_6695),
        .O(add_ln23_2_fu_4550_p2[51:48]),
        .S({\tmp_215_reg_6771[35]_i_2_n_4 ,\tmp_215_reg_6771[35]_i_3_n_4 ,\tmp_215_reg_6771[35]_i_4_n_4 ,\tmp_215_reg_6771[35]_i_5_n_4 }));
  FDRE \tmp_215_reg_6771_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[52]),
        .Q(tmp_215_reg_6771[36]),
        .R(1'b0));
  CARRY4 \tmp_215_reg_6771_reg[36]_i_1 
       (.CI(\tmp_215_reg_6771_reg[35]_i_1_n_4 ),
        .CO({\NLW_tmp_215_reg_6771_reg[36]_i_1_CO_UNCONNECTED [3:1],add_ln23_2_fu_4550_p2[52]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_215_reg_6771_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \tmp_215_reg_6771_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[19]),
        .Q(tmp_215_reg_6771[3]),
        .R(1'b0));
  CARRY4 \tmp_215_reg_6771_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_215_reg_6771_reg[3]_i_1_n_4 ,\tmp_215_reg_6771_reg[3]_i_1_n_5 ,\tmp_215_reg_6771_reg[3]_i_1_n_6 ,\tmp_215_reg_6771_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_5_fu_4540_p1[19:16]),
        .O(add_ln23_2_fu_4550_p2[19:16]),
        .S({\tmp_215_reg_6771[3]_i_2_n_4 ,\tmp_215_reg_6771[3]_i_3_n_4 ,\tmp_215_reg_6771[3]_i_4_n_4 ,\tmp_215_reg_6771[3]_i_5_n_4 }));
  FDRE \tmp_215_reg_6771_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_2_fu_4550_p2[20]),
        .Q(tmp_215_reg_6771[4]),
        .R(1'b0));
  CARRY4 \tmp_215_reg_6771_reg[4]_i_1 
       (.CI(\tmp_215_reg_6771_reg[3]_i_1_n_4 ),
        .CO({\NLW_tmp_215_reg_6771_reg[4]_i_1_CO_UNCONNECTED [3:1],add_ln23_2_fu_4550_p2[20]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_215_reg_6771_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_216_reg_5962[0]_i_1 
       (.I0(\reg_418_reg_n_4_[63] ),
        .I1(reg_423[63]),
        .O(grp_fu_427_p2[63]));
  FDRE \tmp_216_reg_5962_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[63]),
        .Q(tmp_216_reg_5962),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_217_reg_5967[0]_i_1 
       (.I0(\reg_418_reg_n_4_[61] ),
        .I1(reg_423[61]),
        .O(grp_fu_427_p2[61]));
  FDRE \tmp_217_reg_5967_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[61]),
        .Q(tmp_217_reg_5967),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_218_reg_5972[0]_i_1 
       (.I0(\reg_418_reg_n_4_[59] ),
        .I1(reg_423[59]),
        .O(grp_fu_427_p2[59]));
  FDRE \tmp_218_reg_5972_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[59]),
        .Q(tmp_218_reg_5972),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_219_reg_5977[0]_i_1 
       (.I0(\reg_418_reg_n_4_[57] ),
        .I1(reg_423[57]),
        .O(grp_fu_427_p2[57]));
  FDRE \tmp_219_reg_5977_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[57]),
        .Q(tmp_219_reg_5977),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_21_reg_5187[0]_i_1 
       (.I0(reg_414[27]),
        .I1(\tmp_reg_5097_reg[0]_0 [27]),
        .O(diff_fu_816_p2[27]));
  FDRE \tmp_21_reg_5187_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[27]),
        .Q(tmp_21_reg_5187),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_220_reg_5982[0]_i_1 
       (.I0(\reg_418_reg_n_4_[55] ),
        .I1(reg_423[55]),
        .O(grp_fu_427_p2[55]));
  FDRE \tmp_220_reg_5982_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[55]),
        .Q(tmp_220_reg_5982),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_221_reg_5987[0]_i_1 
       (.I0(\reg_418_reg_n_4_[53] ),
        .I1(reg_423[53]),
        .O(grp_fu_427_p2[53]));
  FDRE \tmp_221_reg_5987_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[53]),
        .Q(tmp_221_reg_5987),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_222_reg_5992[0]_i_1 
       (.I0(\reg_418_reg_n_4_[51] ),
        .I1(reg_423[51]),
        .O(grp_fu_427_p2[51]));
  FDRE \tmp_222_reg_5992_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[51]),
        .Q(tmp_222_reg_5992),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_223_reg_5997[0]_i_1 
       (.I0(\reg_418_reg_n_4_[49] ),
        .I1(reg_423[49]),
        .O(grp_fu_427_p2[49]));
  FDRE \tmp_223_reg_5997_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[49]),
        .Q(tmp_223_reg_5997),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_224_reg_6002[0]_i_1 
       (.I0(\reg_418_reg_n_4_[47] ),
        .I1(reg_423[47]),
        .O(grp_fu_427_p2[47]));
  FDRE \tmp_224_reg_6002_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[47]),
        .Q(tmp_224_reg_6002),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_225_reg_6007[0]_i_1 
       (.I0(\reg_418_reg_n_4_[45] ),
        .I1(reg_423[45]),
        .O(grp_fu_427_p2[45]));
  FDRE \tmp_225_reg_6007_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[45]),
        .Q(tmp_225_reg_6007),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_226_reg_6012[0]_i_1 
       (.I0(\reg_418_reg_n_4_[43] ),
        .I1(reg_423[43]),
        .O(grp_fu_427_p2[43]));
  FDRE \tmp_226_reg_6012_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[43]),
        .Q(tmp_226_reg_6012),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_227_reg_6017[0]_i_1 
       (.I0(\reg_418_reg_n_4_[41] ),
        .I1(reg_423[41]),
        .O(grp_fu_427_p2[41]));
  FDRE \tmp_227_reg_6017_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[41]),
        .Q(tmp_227_reg_6017),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_228_reg_6022[0]_i_1 
       (.I0(\reg_418_reg_n_4_[39] ),
        .I1(reg_423[39]),
        .O(grp_fu_427_p2[39]));
  FDRE \tmp_228_reg_6022_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[39]),
        .Q(tmp_228_reg_6022),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_229_reg_6027[0]_i_1 
       (.I0(\reg_418_reg_n_4_[37] ),
        .I1(reg_423[37]),
        .O(grp_fu_427_p2[37]));
  FDRE \tmp_229_reg_6027_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[37]),
        .Q(tmp_229_reg_6027),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_230_reg_6032[0]_i_1 
       (.I0(\reg_418_reg_n_4_[35] ),
        .I1(reg_423[35]),
        .O(grp_fu_427_p2[35]));
  FDRE \tmp_230_reg_6032_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[35]),
        .Q(tmp_230_reg_6032),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_231_reg_6037[0]_i_1 
       (.I0(\reg_418_reg_n_4_[33] ),
        .I1(reg_423[33]),
        .O(grp_fu_427_p2[33]));
  FDRE \tmp_231_reg_6037_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[33]),
        .Q(tmp_231_reg_6037),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_232_reg_6042[0]_i_1 
       (.I0(\reg_418_reg_n_4_[31] ),
        .I1(reg_423[31]),
        .O(grp_fu_427_p2[31]));
  FDRE \tmp_232_reg_6042_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[31]),
        .Q(tmp_232_reg_6042),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_233_reg_6047[0]_i_1 
       (.I0(\reg_418_reg_n_4_[29] ),
        .I1(reg_423[29]),
        .O(grp_fu_427_p2[29]));
  FDRE \tmp_233_reg_6047_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[29]),
        .Q(tmp_233_reg_6047),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_234_reg_6052[0]_i_1 
       (.I0(\reg_418_reg_n_4_[27] ),
        .I1(reg_423[27]),
        .O(grp_fu_427_p2[27]));
  FDRE \tmp_234_reg_6052_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[27]),
        .Q(tmp_234_reg_6052),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_235_reg_6057[0]_i_1 
       (.I0(\reg_418_reg_n_4_[25] ),
        .I1(reg_423[25]),
        .O(grp_fu_427_p2[25]));
  FDRE \tmp_235_reg_6057_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[25]),
        .Q(tmp_235_reg_6057),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_236_reg_6062[0]_i_1 
       (.I0(\reg_418_reg_n_4_[23] ),
        .I1(reg_423[23]),
        .O(grp_fu_427_p2[23]));
  FDRE \tmp_236_reg_6062_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[23]),
        .Q(tmp_236_reg_6062),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_237_reg_6067[0]_i_1 
       (.I0(\reg_418_reg_n_4_[21] ),
        .I1(reg_423[21]),
        .O(grp_fu_427_p2[21]));
  FDRE \tmp_237_reg_6067_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[21]),
        .Q(tmp_237_reg_6067),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_238_reg_6072[0]_i_1 
       (.I0(\reg_418_reg_n_4_[19] ),
        .I1(reg_423[19]),
        .O(grp_fu_427_p2[19]));
  FDRE \tmp_238_reg_6072_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[19]),
        .Q(tmp_238_reg_6072),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_239_reg_6077[0]_i_1 
       (.I0(\reg_418_reg_n_4_[17] ),
        .I1(reg_423[17]),
        .O(grp_fu_427_p2[17]));
  FDRE \tmp_239_reg_6077_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[17]),
        .Q(tmp_239_reg_6077),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_23_reg_5197[0]_i_1 
       (.I0(reg_414[23]),
        .I1(\tmp_reg_5097_reg[0]_0 [23]),
        .O(diff_fu_816_p2[23]));
  FDRE \tmp_23_reg_5197_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[23]),
        .Q(tmp_23_reg_5197),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_240_reg_6082[0]_i_1 
       (.I0(\reg_418_reg_n_4_[15] ),
        .I1(reg_423[15]),
        .O(grp_fu_427_p2[15]));
  FDRE \tmp_240_reg_6082_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[15]),
        .Q(tmp_240_reg_6082),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_241_reg_6087[0]_i_1 
       (.I0(\reg_418_reg_n_4_[13] ),
        .I1(reg_423[13]),
        .O(grp_fu_427_p2[13]));
  FDRE \tmp_241_reg_6087_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[13]),
        .Q(tmp_241_reg_6087),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_242_reg_6092[0]_i_1 
       (.I0(\reg_418_reg_n_4_[11] ),
        .I1(reg_423[11]),
        .O(grp_fu_427_p2[11]));
  FDRE \tmp_242_reg_6092_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[11]),
        .Q(tmp_242_reg_6092),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_243_reg_6097[0]_i_1 
       (.I0(\reg_418_reg_n_4_[9] ),
        .I1(reg_423[9]),
        .O(grp_fu_427_p2[9]));
  FDRE \tmp_243_reg_6097_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[9]),
        .Q(tmp_243_reg_6097),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_244_reg_6102[0]_i_1 
       (.I0(\reg_418_reg_n_4_[7] ),
        .I1(reg_423[7]),
        .O(grp_fu_427_p2[7]));
  FDRE \tmp_244_reg_6102_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[7]),
        .Q(tmp_244_reg_6102),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_245_reg_6107[0]_i_1 
       (.I0(\reg_418_reg_n_4_[5] ),
        .I1(reg_423[5]),
        .O(grp_fu_427_p2[5]));
  FDRE \tmp_245_reg_6107_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[5]),
        .Q(tmp_245_reg_6107),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_246_reg_6112[0]_i_1 
       (.I0(\reg_418_reg_n_4_[3] ),
        .I1(reg_423[3]),
        .O(grp_fu_427_p2[3]));
  FDRE \tmp_246_reg_6112_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[3]),
        .Q(tmp_246_reg_6112),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hB800)) 
    \tmp_247_reg_6117[0]_i_1 
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .I3(ap_CS_fsm_pp0_stage3),
        .O(ap_ready_int));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_247_reg_6117[0]_i_2 
       (.I0(\reg_418_reg_n_4_[1] ),
        .I1(reg_423[1]),
        .O(grp_fu_427_p2[1]));
  FDRE \tmp_247_reg_6117_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready_int),
        .D(grp_fu_427_p2[1]),
        .Q(tmp_247_reg_6117),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_248_reg_6332[1]_i_2 
       (.I0(reg_689[63]),
        .O(\tmp_248_reg_6332[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_248_reg_6332[1]_i_3 
       (.I0(reg_689[62]),
        .I1(tmp_216_reg_5962),
        .O(\tmp_248_reg_6332[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_248_reg_6332[1]_i_4 
       (.I0(reg_689[61]),
        .O(\tmp_248_reg_6332[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_248_reg_6332[1]_i_5 
       (.I0(reg_689[60]),
        .I1(tmp_217_reg_5967),
        .O(\tmp_248_reg_6332[1]_i_5_n_4 ));
  FDRE \tmp_248_reg_6332_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_248_reg_6332_reg[1]_i_1_n_11 ),
        .Q(tmp_248_reg_6332[0]),
        .R(1'b0));
  FDRE \tmp_248_reg_6332_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_248_reg_6332_reg[1]_i_1_n_10 ),
        .Q(tmp_248_reg_6332[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_248_reg_6332_reg[1]_i_1 
       (.CI(\tmp_249_reg_6337_reg[1]_i_1_n_4 ),
        .CO({\NLW_tmp_248_reg_6332_reg[1]_i_1_CO_UNCONNECTED [3],\tmp_248_reg_6332_reg[1]_i_1_n_5 ,\tmp_248_reg_6332_reg[1]_i_1_n_6 ,\tmp_248_reg_6332_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,reg_689[62:60]}),
        .O({\tmp_248_reg_6332_reg[1]_i_1_n_8 ,\tmp_248_reg_6332_reg[1]_i_1_n_9 ,\tmp_248_reg_6332_reg[1]_i_1_n_10 ,\tmp_248_reg_6332_reg[1]_i_1_n_11 }),
        .S({\tmp_248_reg_6332[1]_i_2_n_4 ,\tmp_248_reg_6332[1]_i_3_n_4 ,\tmp_248_reg_6332[1]_i_4_n_4 ,\tmp_248_reg_6332[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_249_reg_6337[1]_i_2 
       (.I0(reg_689[59]),
        .O(\tmp_249_reg_6337[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_249_reg_6337[1]_i_3 
       (.I0(reg_689[58]),
        .I1(tmp_218_reg_5972),
        .O(\tmp_249_reg_6337[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_249_reg_6337[1]_i_4 
       (.I0(reg_689[57]),
        .O(\tmp_249_reg_6337[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_249_reg_6337[1]_i_5 
       (.I0(reg_689[56]),
        .I1(tmp_219_reg_5977),
        .O(\tmp_249_reg_6337[1]_i_5_n_4 ));
  FDRE \tmp_249_reg_6337_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_249_reg_6337_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[56]),
        .R(1'b0));
  FDRE \tmp_249_reg_6337_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_249_reg_6337_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[57]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_249_reg_6337_reg[1]_i_1 
       (.CI(\tmp_250_reg_6343_reg[1]_i_1_n_4 ),
        .CO({\tmp_249_reg_6337_reg[1]_i_1_n_4 ,\tmp_249_reg_6337_reg[1]_i_1_n_5 ,\tmp_249_reg_6337_reg[1]_i_1_n_6 ,\tmp_249_reg_6337_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[59:56]),
        .O({\tmp_249_reg_6337_reg[1]_i_1_n_8 ,\tmp_249_reg_6337_reg[1]_i_1_n_9 ,\tmp_249_reg_6337_reg[1]_i_1_n_10 ,\tmp_249_reg_6337_reg[1]_i_1_n_11 }),
        .S({\tmp_249_reg_6337[1]_i_2_n_4 ,\tmp_249_reg_6337[1]_i_3_n_4 ,\tmp_249_reg_6337[1]_i_4_n_4 ,\tmp_249_reg_6337[1]_i_5_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_24_reg_5202[0]_i_1 
       (.I0(reg_414[21]),
        .I1(\tmp_reg_5097_reg[0]_0 [21]),
        .O(diff_fu_816_p2[21]));
  FDRE \tmp_24_reg_5202_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[21]),
        .Q(tmp_24_reg_5202),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_250_reg_6343[1]_i_2 
       (.I0(reg_689[55]),
        .O(\tmp_250_reg_6343[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_250_reg_6343[1]_i_3 
       (.I0(reg_689[54]),
        .I1(tmp_220_reg_5982),
        .O(\tmp_250_reg_6343[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_250_reg_6343[1]_i_4 
       (.I0(reg_689[53]),
        .O(\tmp_250_reg_6343[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_250_reg_6343[1]_i_5 
       (.I0(reg_689[52]),
        .I1(tmp_221_reg_5987),
        .O(\tmp_250_reg_6343[1]_i_5_n_4 ));
  FDRE \tmp_250_reg_6343_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_250_reg_6343_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[52]),
        .R(1'b0));
  FDRE \tmp_250_reg_6343_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_250_reg_6343_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[53]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_250_reg_6343_reg[1]_i_1 
       (.CI(\tmp_251_reg_6349_reg[1]_i_1_n_4 ),
        .CO({\tmp_250_reg_6343_reg[1]_i_1_n_4 ,\tmp_250_reg_6343_reg[1]_i_1_n_5 ,\tmp_250_reg_6343_reg[1]_i_1_n_6 ,\tmp_250_reg_6343_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[55:52]),
        .O({\tmp_250_reg_6343_reg[1]_i_1_n_8 ,\tmp_250_reg_6343_reg[1]_i_1_n_9 ,\tmp_250_reg_6343_reg[1]_i_1_n_10 ,\tmp_250_reg_6343_reg[1]_i_1_n_11 }),
        .S({\tmp_250_reg_6343[1]_i_2_n_4 ,\tmp_250_reg_6343[1]_i_3_n_4 ,\tmp_250_reg_6343[1]_i_4_n_4 ,\tmp_250_reg_6343[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_251_reg_6349[1]_i_2 
       (.I0(reg_689[51]),
        .O(\tmp_251_reg_6349[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_251_reg_6349[1]_i_3 
       (.I0(reg_689[50]),
        .I1(tmp_222_reg_5992),
        .O(\tmp_251_reg_6349[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_251_reg_6349[1]_i_4 
       (.I0(reg_689[49]),
        .O(\tmp_251_reg_6349[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_251_reg_6349[1]_i_5 
       (.I0(reg_689[48]),
        .I1(tmp_223_reg_5997),
        .O(\tmp_251_reg_6349[1]_i_5_n_4 ));
  FDRE \tmp_251_reg_6349_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_251_reg_6349_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[48]),
        .R(1'b0));
  FDRE \tmp_251_reg_6349_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_251_reg_6349_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[49]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_251_reg_6349_reg[1]_i_1 
       (.CI(\tmp_252_reg_6355_reg[1]_i_1_n_4 ),
        .CO({\tmp_251_reg_6349_reg[1]_i_1_n_4 ,\tmp_251_reg_6349_reg[1]_i_1_n_5 ,\tmp_251_reg_6349_reg[1]_i_1_n_6 ,\tmp_251_reg_6349_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[51:48]),
        .O({\tmp_251_reg_6349_reg[1]_i_1_n_8 ,\tmp_251_reg_6349_reg[1]_i_1_n_9 ,\tmp_251_reg_6349_reg[1]_i_1_n_10 ,\tmp_251_reg_6349_reg[1]_i_1_n_11 }),
        .S({\tmp_251_reg_6349[1]_i_2_n_4 ,\tmp_251_reg_6349[1]_i_3_n_4 ,\tmp_251_reg_6349[1]_i_4_n_4 ,\tmp_251_reg_6349[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_252_reg_6355[1]_i_2 
       (.I0(reg_689[47]),
        .O(\tmp_252_reg_6355[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_252_reg_6355[1]_i_3 
       (.I0(reg_689[46]),
        .I1(tmp_224_reg_6002),
        .O(\tmp_252_reg_6355[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_252_reg_6355[1]_i_4 
       (.I0(reg_689[45]),
        .O(\tmp_252_reg_6355[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_252_reg_6355[1]_i_5 
       (.I0(reg_689[44]),
        .I1(tmp_225_reg_6007),
        .O(\tmp_252_reg_6355[1]_i_5_n_4 ));
  FDRE \tmp_252_reg_6355_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_252_reg_6355_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[44]),
        .R(1'b0));
  FDRE \tmp_252_reg_6355_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_252_reg_6355_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[45]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_252_reg_6355_reg[1]_i_1 
       (.CI(\tmp_253_reg_6361_reg[1]_i_1_n_4 ),
        .CO({\tmp_252_reg_6355_reg[1]_i_1_n_4 ,\tmp_252_reg_6355_reg[1]_i_1_n_5 ,\tmp_252_reg_6355_reg[1]_i_1_n_6 ,\tmp_252_reg_6355_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[47:44]),
        .O({\tmp_252_reg_6355_reg[1]_i_1_n_8 ,\tmp_252_reg_6355_reg[1]_i_1_n_9 ,\tmp_252_reg_6355_reg[1]_i_1_n_10 ,\tmp_252_reg_6355_reg[1]_i_1_n_11 }),
        .S({\tmp_252_reg_6355[1]_i_2_n_4 ,\tmp_252_reg_6355[1]_i_3_n_4 ,\tmp_252_reg_6355[1]_i_4_n_4 ,\tmp_252_reg_6355[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_253_reg_6361[1]_i_2 
       (.I0(reg_689[43]),
        .O(\tmp_253_reg_6361[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_253_reg_6361[1]_i_3 
       (.I0(reg_689[42]),
        .I1(tmp_226_reg_6012),
        .O(\tmp_253_reg_6361[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_253_reg_6361[1]_i_4 
       (.I0(reg_689[41]),
        .O(\tmp_253_reg_6361[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_253_reg_6361[1]_i_5 
       (.I0(reg_689[40]),
        .I1(tmp_227_reg_6017),
        .O(\tmp_253_reg_6361[1]_i_5_n_4 ));
  FDRE \tmp_253_reg_6361_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_253_reg_6361_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[40]),
        .R(1'b0));
  FDRE \tmp_253_reg_6361_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_253_reg_6361_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[41]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_253_reg_6361_reg[1]_i_1 
       (.CI(\tmp_254_reg_6367_reg[1]_i_1_n_4 ),
        .CO({\tmp_253_reg_6361_reg[1]_i_1_n_4 ,\tmp_253_reg_6361_reg[1]_i_1_n_5 ,\tmp_253_reg_6361_reg[1]_i_1_n_6 ,\tmp_253_reg_6361_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[43:40]),
        .O({\tmp_253_reg_6361_reg[1]_i_1_n_8 ,\tmp_253_reg_6361_reg[1]_i_1_n_9 ,\tmp_253_reg_6361_reg[1]_i_1_n_10 ,\tmp_253_reg_6361_reg[1]_i_1_n_11 }),
        .S({\tmp_253_reg_6361[1]_i_2_n_4 ,\tmp_253_reg_6361[1]_i_3_n_4 ,\tmp_253_reg_6361[1]_i_4_n_4 ,\tmp_253_reg_6361[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_254_reg_6367[1]_i_2 
       (.I0(reg_689[39]),
        .O(\tmp_254_reg_6367[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_254_reg_6367[1]_i_3 
       (.I0(reg_689[38]),
        .I1(tmp_228_reg_6022),
        .O(\tmp_254_reg_6367[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_254_reg_6367[1]_i_4 
       (.I0(reg_689[37]),
        .O(\tmp_254_reg_6367[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_254_reg_6367[1]_i_5 
       (.I0(reg_689[36]),
        .I1(tmp_229_reg_6027),
        .O(\tmp_254_reg_6367[1]_i_5_n_4 ));
  FDRE \tmp_254_reg_6367_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_254_reg_6367_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[36]),
        .R(1'b0));
  FDRE \tmp_254_reg_6367_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_254_reg_6367_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[37]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_254_reg_6367_reg[1]_i_1 
       (.CI(\tmp_255_reg_6373_reg[1]_i_1_n_4 ),
        .CO({\tmp_254_reg_6367_reg[1]_i_1_n_4 ,\tmp_254_reg_6367_reg[1]_i_1_n_5 ,\tmp_254_reg_6367_reg[1]_i_1_n_6 ,\tmp_254_reg_6367_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[39:36]),
        .O({\tmp_254_reg_6367_reg[1]_i_1_n_8 ,\tmp_254_reg_6367_reg[1]_i_1_n_9 ,\tmp_254_reg_6367_reg[1]_i_1_n_10 ,\tmp_254_reg_6367_reg[1]_i_1_n_11 }),
        .S({\tmp_254_reg_6367[1]_i_2_n_4 ,\tmp_254_reg_6367[1]_i_3_n_4 ,\tmp_254_reg_6367[1]_i_4_n_4 ,\tmp_254_reg_6367[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_255_reg_6373[1]_i_2 
       (.I0(reg_689[35]),
        .O(\tmp_255_reg_6373[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_255_reg_6373[1]_i_3 
       (.I0(reg_689[34]),
        .I1(tmp_230_reg_6032),
        .O(\tmp_255_reg_6373[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_255_reg_6373[1]_i_4 
       (.I0(reg_689[33]),
        .O(\tmp_255_reg_6373[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_255_reg_6373[1]_i_5 
       (.I0(reg_689[32]),
        .I1(tmp_231_reg_6037),
        .O(\tmp_255_reg_6373[1]_i_5_n_4 ));
  FDRE \tmp_255_reg_6373_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_255_reg_6373_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[32]),
        .R(1'b0));
  FDRE \tmp_255_reg_6373_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_255_reg_6373_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[33]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_255_reg_6373_reg[1]_i_1 
       (.CI(\tmp_256_reg_6379_reg[1]_i_1_n_4 ),
        .CO({\tmp_255_reg_6373_reg[1]_i_1_n_4 ,\tmp_255_reg_6373_reg[1]_i_1_n_5 ,\tmp_255_reg_6373_reg[1]_i_1_n_6 ,\tmp_255_reg_6373_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[35:32]),
        .O({\tmp_255_reg_6373_reg[1]_i_1_n_8 ,\tmp_255_reg_6373_reg[1]_i_1_n_9 ,\tmp_255_reg_6373_reg[1]_i_1_n_10 ,\tmp_255_reg_6373_reg[1]_i_1_n_11 }),
        .S({\tmp_255_reg_6373[1]_i_2_n_4 ,\tmp_255_reg_6373[1]_i_3_n_4 ,\tmp_255_reg_6373[1]_i_4_n_4 ,\tmp_255_reg_6373[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_256_reg_6379[1]_i_2 
       (.I0(reg_689[31]),
        .O(\tmp_256_reg_6379[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_256_reg_6379[1]_i_3 
       (.I0(reg_689[30]),
        .I1(tmp_232_reg_6042),
        .O(\tmp_256_reg_6379[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_256_reg_6379[1]_i_4 
       (.I0(reg_689[29]),
        .O(\tmp_256_reg_6379[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_256_reg_6379[1]_i_5 
       (.I0(reg_689[28]),
        .I1(tmp_233_reg_6047),
        .O(\tmp_256_reg_6379[1]_i_5_n_4 ));
  FDRE \tmp_256_reg_6379_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_256_reg_6379_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[28]),
        .R(1'b0));
  FDRE \tmp_256_reg_6379_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_256_reg_6379_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[29]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_256_reg_6379_reg[1]_i_1 
       (.CI(\tmp_257_reg_6385_reg[1]_i_1_n_4 ),
        .CO({\tmp_256_reg_6379_reg[1]_i_1_n_4 ,\tmp_256_reg_6379_reg[1]_i_1_n_5 ,\tmp_256_reg_6379_reg[1]_i_1_n_6 ,\tmp_256_reg_6379_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[31:28]),
        .O({\tmp_256_reg_6379_reg[1]_i_1_n_8 ,\tmp_256_reg_6379_reg[1]_i_1_n_9 ,\tmp_256_reg_6379_reg[1]_i_1_n_10 ,\tmp_256_reg_6379_reg[1]_i_1_n_11 }),
        .S({\tmp_256_reg_6379[1]_i_2_n_4 ,\tmp_256_reg_6379[1]_i_3_n_4 ,\tmp_256_reg_6379[1]_i_4_n_4 ,\tmp_256_reg_6379[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_257_reg_6385[1]_i_2 
       (.I0(reg_689[27]),
        .O(\tmp_257_reg_6385[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_257_reg_6385[1]_i_3 
       (.I0(reg_689[26]),
        .I1(tmp_234_reg_6052),
        .O(\tmp_257_reg_6385[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_257_reg_6385[1]_i_4 
       (.I0(reg_689[25]),
        .O(\tmp_257_reg_6385[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_257_reg_6385[1]_i_5 
       (.I0(reg_689[24]),
        .I1(tmp_235_reg_6057),
        .O(\tmp_257_reg_6385[1]_i_5_n_4 ));
  FDRE \tmp_257_reg_6385_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_257_reg_6385_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[24]),
        .R(1'b0));
  FDRE \tmp_257_reg_6385_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_257_reg_6385_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[25]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_257_reg_6385_reg[1]_i_1 
       (.CI(\tmp_258_reg_6391_reg[1]_i_1_n_4 ),
        .CO({\tmp_257_reg_6385_reg[1]_i_1_n_4 ,\tmp_257_reg_6385_reg[1]_i_1_n_5 ,\tmp_257_reg_6385_reg[1]_i_1_n_6 ,\tmp_257_reg_6385_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[27:24]),
        .O({\tmp_257_reg_6385_reg[1]_i_1_n_8 ,\tmp_257_reg_6385_reg[1]_i_1_n_9 ,\tmp_257_reg_6385_reg[1]_i_1_n_10 ,\tmp_257_reg_6385_reg[1]_i_1_n_11 }),
        .S({\tmp_257_reg_6385[1]_i_2_n_4 ,\tmp_257_reg_6385[1]_i_3_n_4 ,\tmp_257_reg_6385[1]_i_4_n_4 ,\tmp_257_reg_6385[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_258_reg_6391[1]_i_2 
       (.I0(reg_689[23]),
        .O(\tmp_258_reg_6391[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_258_reg_6391[1]_i_3 
       (.I0(reg_689[22]),
        .I1(tmp_236_reg_6062),
        .O(\tmp_258_reg_6391[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_258_reg_6391[1]_i_4 
       (.I0(reg_689[21]),
        .O(\tmp_258_reg_6391[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_258_reg_6391[1]_i_5 
       (.I0(reg_689[20]),
        .I1(tmp_237_reg_6067),
        .O(\tmp_258_reg_6391[1]_i_5_n_4 ));
  FDRE \tmp_258_reg_6391_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_258_reg_6391_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[20]),
        .R(1'b0));
  FDRE \tmp_258_reg_6391_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_258_reg_6391_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[21]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_258_reg_6391_reg[1]_i_1 
       (.CI(\tmp_259_reg_6397_reg[1]_i_1_n_4 ),
        .CO({\tmp_258_reg_6391_reg[1]_i_1_n_4 ,\tmp_258_reg_6391_reg[1]_i_1_n_5 ,\tmp_258_reg_6391_reg[1]_i_1_n_6 ,\tmp_258_reg_6391_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[23:20]),
        .O({\tmp_258_reg_6391_reg[1]_i_1_n_8 ,\tmp_258_reg_6391_reg[1]_i_1_n_9 ,\tmp_258_reg_6391_reg[1]_i_1_n_10 ,\tmp_258_reg_6391_reg[1]_i_1_n_11 }),
        .S({\tmp_258_reg_6391[1]_i_2_n_4 ,\tmp_258_reg_6391[1]_i_3_n_4 ,\tmp_258_reg_6391[1]_i_4_n_4 ,\tmp_258_reg_6391[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_259_reg_6397[1]_i_2 
       (.I0(reg_689[19]),
        .O(\tmp_259_reg_6397[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_259_reg_6397[1]_i_3 
       (.I0(reg_689[18]),
        .I1(tmp_238_reg_6072),
        .O(\tmp_259_reg_6397[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_259_reg_6397[1]_i_4 
       (.I0(reg_689[17]),
        .O(\tmp_259_reg_6397[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_259_reg_6397[1]_i_5 
       (.I0(reg_689[16]),
        .I1(tmp_239_reg_6077),
        .O(\tmp_259_reg_6397[1]_i_5_n_4 ));
  FDRE \tmp_259_reg_6397_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_259_reg_6397_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[16]),
        .R(1'b0));
  FDRE \tmp_259_reg_6397_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_259_reg_6397_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[17]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_259_reg_6397_reg[1]_i_1 
       (.CI(\tmp_260_reg_6403_reg[1]_i_1_n_4 ),
        .CO({\tmp_259_reg_6397_reg[1]_i_1_n_4 ,\tmp_259_reg_6397_reg[1]_i_1_n_5 ,\tmp_259_reg_6397_reg[1]_i_1_n_6 ,\tmp_259_reg_6397_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[19:16]),
        .O({\tmp_259_reg_6397_reg[1]_i_1_n_8 ,\tmp_259_reg_6397_reg[1]_i_1_n_9 ,\tmp_259_reg_6397_reg[1]_i_1_n_10 ,\tmp_259_reg_6397_reg[1]_i_1_n_11 }),
        .S({\tmp_259_reg_6397[1]_i_2_n_4 ,\tmp_259_reg_6397[1]_i_3_n_4 ,\tmp_259_reg_6397[1]_i_4_n_4 ,\tmp_259_reg_6397[1]_i_5_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_25_reg_5207[0]_i_1 
       (.I0(reg_414[19]),
        .I1(\tmp_reg_5097_reg[0]_0 [19]),
        .O(diff_fu_816_p2[19]));
  FDRE \tmp_25_reg_5207_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[19]),
        .Q(tmp_25_reg_5207),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_260_reg_6403[1]_i_2 
       (.I0(reg_689[15]),
        .O(\tmp_260_reg_6403[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_260_reg_6403[1]_i_3 
       (.I0(reg_689[14]),
        .I1(tmp_240_reg_6082),
        .O(\tmp_260_reg_6403[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_260_reg_6403[1]_i_4 
       (.I0(reg_689[13]),
        .O(\tmp_260_reg_6403[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_260_reg_6403[1]_i_5 
       (.I0(reg_689[12]),
        .I1(tmp_241_reg_6087),
        .O(\tmp_260_reg_6403[1]_i_5_n_4 ));
  FDRE \tmp_260_reg_6403_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_260_reg_6403_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[12]),
        .R(1'b0));
  FDRE \tmp_260_reg_6403_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_260_reg_6403_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[13]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_260_reg_6403_reg[1]_i_1 
       (.CI(\tmp_261_reg_6409_reg[1]_i_1_n_4 ),
        .CO({\tmp_260_reg_6403_reg[1]_i_1_n_4 ,\tmp_260_reg_6403_reg[1]_i_1_n_5 ,\tmp_260_reg_6403_reg[1]_i_1_n_6 ,\tmp_260_reg_6403_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[15:12]),
        .O({\tmp_260_reg_6403_reg[1]_i_1_n_8 ,\tmp_260_reg_6403_reg[1]_i_1_n_9 ,\tmp_260_reg_6403_reg[1]_i_1_n_10 ,\tmp_260_reg_6403_reg[1]_i_1_n_11 }),
        .S({\tmp_260_reg_6403[1]_i_2_n_4 ,\tmp_260_reg_6403[1]_i_3_n_4 ,\tmp_260_reg_6403[1]_i_4_n_4 ,\tmp_260_reg_6403[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_261_reg_6409[1]_i_2 
       (.I0(reg_689[11]),
        .O(\tmp_261_reg_6409[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_261_reg_6409[1]_i_3 
       (.I0(reg_689[10]),
        .I1(tmp_242_reg_6092),
        .O(\tmp_261_reg_6409[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_261_reg_6409[1]_i_4 
       (.I0(reg_689[9]),
        .O(\tmp_261_reg_6409[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_261_reg_6409[1]_i_5 
       (.I0(reg_689[8]),
        .I1(tmp_243_reg_6097),
        .O(\tmp_261_reg_6409[1]_i_5_n_4 ));
  FDRE \tmp_261_reg_6409_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_261_reg_6409_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[8]),
        .R(1'b0));
  FDRE \tmp_261_reg_6409_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_261_reg_6409_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_261_reg_6409_reg[1]_i_1 
       (.CI(\tmp_262_reg_6415_reg[1]_i_1_n_4 ),
        .CO({\tmp_261_reg_6409_reg[1]_i_1_n_4 ,\tmp_261_reg_6409_reg[1]_i_1_n_5 ,\tmp_261_reg_6409_reg[1]_i_1_n_6 ,\tmp_261_reg_6409_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[11:8]),
        .O({\tmp_261_reg_6409_reg[1]_i_1_n_8 ,\tmp_261_reg_6409_reg[1]_i_1_n_9 ,\tmp_261_reg_6409_reg[1]_i_1_n_10 ,\tmp_261_reg_6409_reg[1]_i_1_n_11 }),
        .S({\tmp_261_reg_6409[1]_i_2_n_4 ,\tmp_261_reg_6409[1]_i_3_n_4 ,\tmp_261_reg_6409[1]_i_4_n_4 ,\tmp_261_reg_6409[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_262_reg_6415[1]_i_2 
       (.I0(reg_689[7]),
        .O(\tmp_262_reg_6415[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_262_reg_6415[1]_i_3 
       (.I0(reg_689[6]),
        .I1(tmp_244_reg_6102),
        .O(\tmp_262_reg_6415[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tmp_262_reg_6415[1]_i_4 
       (.I0(reg_689[5]),
        .O(\tmp_262_reg_6415[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \tmp_262_reg_6415[1]_i_5 
       (.I0(reg_689[4]),
        .I1(tmp_245_reg_6107),
        .O(\tmp_262_reg_6415[1]_i_5_n_4 ));
  FDRE \tmp_262_reg_6415_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_262_reg_6415_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[4]),
        .R(1'b0));
  FDRE \tmp_262_reg_6415_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_262_reg_6415_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[5]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tmp_262_reg_6415_reg[1]_i_1 
       (.CI(\trunc_ln21_3_reg_6421_reg[1]_i_1_n_4 ),
        .CO({\tmp_262_reg_6415_reg[1]_i_1_n_4 ,\tmp_262_reg_6415_reg[1]_i_1_n_5 ,\tmp_262_reg_6415_reg[1]_i_1_n_6 ,\tmp_262_reg_6415_reg[1]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(reg_689[7:4]),
        .O({\tmp_262_reg_6415_reg[1]_i_1_n_8 ,\tmp_262_reg_6415_reg[1]_i_1_n_9 ,\tmp_262_reg_6415_reg[1]_i_1_n_10 ,\tmp_262_reg_6415_reg[1]_i_1_n_11 }),
        .S({\tmp_262_reg_6415[1]_i_2_n_4 ,\tmp_262_reg_6415[1]_i_3_n_4 ,\tmp_262_reg_6415[1]_i_4_n_4 ,\tmp_262_reg_6415[1]_i_5_n_4 }));
  FDRE \tmp_263_reg_6427_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_248_reg_6332_reg[1]_i_1_n_9 ),
        .Q(tmp_263_reg_6427[0]),
        .R(1'b0));
  FDRE \tmp_263_reg_6427_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_248_reg_6332_reg[1]_i_1_n_8 ),
        .Q(tmp_263_reg_6427[1]),
        .R(1'b0));
  FDRE \tmp_264_reg_6432_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_249_reg_6337_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[56]),
        .R(1'b0));
  FDRE \tmp_264_reg_6432_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_249_reg_6337_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[57]),
        .R(1'b0));
  FDRE \tmp_265_reg_6438_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_250_reg_6343_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[52]),
        .R(1'b0));
  FDRE \tmp_265_reg_6438_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_250_reg_6343_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[53]),
        .R(1'b0));
  FDRE \tmp_266_reg_6444_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_251_reg_6349_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[48]),
        .R(1'b0));
  FDRE \tmp_266_reg_6444_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_251_reg_6349_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[49]),
        .R(1'b0));
  FDRE \tmp_267_reg_6450_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_252_reg_6355_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[44]),
        .R(1'b0));
  FDRE \tmp_267_reg_6450_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_252_reg_6355_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[45]),
        .R(1'b0));
  FDRE \tmp_268_reg_6456_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_253_reg_6361_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[40]),
        .R(1'b0));
  FDRE \tmp_268_reg_6456_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_253_reg_6361_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[41]),
        .R(1'b0));
  FDRE \tmp_269_reg_6462_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_254_reg_6367_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[36]),
        .R(1'b0));
  FDRE \tmp_269_reg_6462_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_254_reg_6367_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[37]),
        .R(1'b0));
  FDRE \tmp_270_reg_6468_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_255_reg_6373_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[32]),
        .R(1'b0));
  FDRE \tmp_270_reg_6468_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_255_reg_6373_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[33]),
        .R(1'b0));
  FDRE \tmp_271_reg_6474_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_256_reg_6379_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[28]),
        .R(1'b0));
  FDRE \tmp_271_reg_6474_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_256_reg_6379_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[29]),
        .R(1'b0));
  FDRE \tmp_272_reg_6480_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_257_reg_6385_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[24]),
        .R(1'b0));
  FDRE \tmp_272_reg_6480_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_257_reg_6385_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[25]),
        .R(1'b0));
  FDRE \tmp_273_reg_6486_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_258_reg_6391_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[20]),
        .R(1'b0));
  FDRE \tmp_273_reg_6486_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_258_reg_6391_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[21]),
        .R(1'b0));
  FDRE \tmp_274_reg_6492_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_259_reg_6397_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[16]),
        .R(1'b0));
  FDRE \tmp_274_reg_6492_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_259_reg_6397_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[17]),
        .R(1'b0));
  FDRE \tmp_275_reg_6498_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_260_reg_6403_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[12]),
        .R(1'b0));
  FDRE \tmp_275_reg_6498_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_260_reg_6403_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[13]),
        .R(1'b0));
  FDRE \tmp_276_reg_6504_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_261_reg_6409_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[8]),
        .R(1'b0));
  FDRE \tmp_276_reg_6504_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_261_reg_6409_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[9]),
        .R(1'b0));
  FDRE \tmp_277_reg_6510_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_262_reg_6415_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[4]),
        .R(1'b0));
  FDRE \tmp_277_reg_6510_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\tmp_262_reg_6415_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[5]),
        .R(1'b0));
  FDRE \tmp_278_reg_6516_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_3_reg_6421_reg[1]_i_1_n_9 ),
        .Q(and_ln21_7_cast_fu_4035_p31[0]),
        .R(1'b0));
  FDRE \tmp_278_reg_6516_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_3_reg_6421_reg[1]_i_1_n_8 ),
        .Q(and_ln21_7_cast_fu_4035_p31[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[10]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[13]),
        .I1(and_ln21_6_cast_fu_3932_p31[13]),
        .O(\tmp_279_reg_6629[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[10]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[12]),
        .I1(and_ln21_6_cast_fu_3932_p31[12]),
        .O(\tmp_279_reg_6629[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[18]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[21]),
        .I1(and_ln21_6_cast_fu_3932_p31[21]),
        .O(\tmp_279_reg_6629[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[18]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[20]),
        .I1(and_ln21_6_cast_fu_3932_p31[20]),
        .O(\tmp_279_reg_6629[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[26]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[29]),
        .I1(and_ln21_6_cast_fu_3932_p31[29]),
        .O(\tmp_279_reg_6629[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[26]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[28]),
        .I1(and_ln21_6_cast_fu_3932_p31[28]),
        .O(\tmp_279_reg_6629[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[2]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[5]),
        .I1(and_ln21_6_cast_fu_3932_p31[5]),
        .O(\tmp_279_reg_6629[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[2]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[4]),
        .I1(and_ln21_6_cast_fu_3932_p31[4]),
        .O(\tmp_279_reg_6629[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[34]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[37]),
        .I1(and_ln21_6_cast_fu_3932_p31[37]),
        .O(\tmp_279_reg_6629[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[34]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[36]),
        .I1(and_ln21_6_cast_fu_3932_p31[36]),
        .O(\tmp_279_reg_6629[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[42]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[45]),
        .I1(and_ln21_6_cast_fu_3932_p31[45]),
        .O(\tmp_279_reg_6629[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[42]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[44]),
        .I1(and_ln21_6_cast_fu_3932_p31[44]),
        .O(\tmp_279_reg_6629[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[50]_i_2 
       (.I0(and_ln21_7_cast_fu_4035_p31[53]),
        .I1(and_ln21_6_cast_fu_3932_p31[53]),
        .O(\tmp_279_reg_6629[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[50]_i_3 
       (.I0(and_ln21_7_cast_fu_4035_p31[52]),
        .I1(and_ln21_6_cast_fu_3932_p31[52]),
        .O(\tmp_279_reg_6629[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[58]_i_2 
       (.I0(tmp_263_reg_6427[1]),
        .I1(tmp_248_reg_6332[1]),
        .O(\tmp_279_reg_6629[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_279_reg_6629[58]_i_3 
       (.I0(tmp_263_reg_6427[0]),
        .I1(tmp_248_reg_6332[0]),
        .O(\tmp_279_reg_6629[58]_i_3_n_4 ));
  FDRE \tmp_279_reg_6629_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[4]),
        .Q(tmp_279_reg_6629[0]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[10] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[14]),
        .Q(tmp_279_reg_6629[10]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[10]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[14],\NLW_tmp_279_reg_6629_reg[10]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[13:12]}),
        .O({\NLW_tmp_279_reg_6629_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[13:12]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[10]_i_2_n_4 ,\tmp_279_reg_6629[10]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[16] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[20]),
        .Q(tmp_279_reg_6629[16]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[17] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[21]),
        .Q(tmp_279_reg_6629[17]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[18] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[22]),
        .Q(tmp_279_reg_6629[18]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[18]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[22],\NLW_tmp_279_reg_6629_reg[18]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[21:20]}),
        .O({\NLW_tmp_279_reg_6629_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[21:20]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[18]_i_2_n_4 ,\tmp_279_reg_6629[18]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[5]),
        .Q(tmp_279_reg_6629[1]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[24] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[28]),
        .Q(tmp_279_reg_6629[24]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[25] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[29]),
        .Q(tmp_279_reg_6629[25]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[26] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[30]),
        .Q(tmp_279_reg_6629[26]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[26]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[30],\NLW_tmp_279_reg_6629_reg[26]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[29:28]}),
        .O({\NLW_tmp_279_reg_6629_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[29:28]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[26]_i_2_n_4 ,\tmp_279_reg_6629[26]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[6]),
        .Q(tmp_279_reg_6629[2]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[2]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[6],\NLW_tmp_279_reg_6629_reg[2]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[5:4]}),
        .O({\NLW_tmp_279_reg_6629_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[5:4]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[2]_i_2_n_4 ,\tmp_279_reg_6629[2]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[32] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[36]),
        .Q(tmp_279_reg_6629[32]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[33] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[37]),
        .Q(tmp_279_reg_6629[33]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[34] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[38]),
        .Q(tmp_279_reg_6629[34]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[34]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[38],\NLW_tmp_279_reg_6629_reg[34]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[37:36]}),
        .O({\NLW_tmp_279_reg_6629_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[37:36]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[34]_i_2_n_4 ,\tmp_279_reg_6629[34]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[40] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[44]),
        .Q(tmp_279_reg_6629[40]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[41] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[45]),
        .Q(tmp_279_reg_6629[41]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[42] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[46]),
        .Q(tmp_279_reg_6629[42]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[42]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[46],\NLW_tmp_279_reg_6629_reg[42]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[45:44]}),
        .O({\NLW_tmp_279_reg_6629_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[45:44]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[42]_i_2_n_4 ,\tmp_279_reg_6629[42]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[48] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[52]),
        .Q(tmp_279_reg_6629[48]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[49] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[53]),
        .Q(tmp_279_reg_6629[49]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[50] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[54]),
        .Q(tmp_279_reg_6629[50]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[50]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[54],\NLW_tmp_279_reg_6629_reg[50]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,and_ln21_7_cast_fu_4035_p31[53:52]}),
        .O({\NLW_tmp_279_reg_6629_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[53:52]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[50]_i_2_n_4 ,\tmp_279_reg_6629[50]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[56] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[60]),
        .Q(tmp_279_reg_6629[56]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[57] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[61]),
        .Q(tmp_279_reg_6629[57]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[58] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[62]),
        .Q(tmp_279_reg_6629[58]),
        .R(1'b0));
  CARRY4 \tmp_279_reg_6629_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_279_reg_6629_reg[58]_i_1_CO_UNCONNECTED [3],add_ln21_3_fu_4094_p2[62],\NLW_tmp_279_reg_6629_reg[58]_i_1_CO_UNCONNECTED [1],\tmp_279_reg_6629_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,tmp_263_reg_6427}),
        .O({\NLW_tmp_279_reg_6629_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln21_3_fu_4094_p2[61:60]}),
        .S({1'b0,1'b1,\tmp_279_reg_6629[58]_i_2_n_4 ,\tmp_279_reg_6629[58]_i_3_n_4 }));
  FDRE \tmp_279_reg_6629_reg[8] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[12]),
        .Q(tmp_279_reg_6629[8]),
        .R(1'b0));
  FDRE \tmp_279_reg_6629_reg[9] 
       (.C(ap_clk),
        .CE(Q),
        .D(add_ln21_3_fu_4094_p2[13]),
        .Q(tmp_279_reg_6629[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_27_reg_5217[0]_i_1 
       (.I0(reg_414[15]),
        .I1(\tmp_reg_5097_reg[0]_0 [15]),
        .O(diff_fu_816_p2[15]));
  FDRE \tmp_27_reg_5217_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[15]),
        .Q(tmp_27_reg_5217),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_280_reg_6700[3]_i_2 
       (.I0(tmp_279_reg_6629[50]),
        .I1(add_ln18_3_reg_6624[50]),
        .O(\tmp_280_reg_6700[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_280_reg_6700[3]_i_3 
       (.I0(tmp_279_reg_6629[49]),
        .I1(add_ln18_3_reg_6624[49]),
        .O(\tmp_280_reg_6700[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_280_reg_6700[3]_i_4 
       (.I0(tmp_279_reg_6629[48]),
        .I1(add_ln18_3_reg_6624[48]),
        .O(\tmp_280_reg_6700[3]_i_4_n_4 ));
  FDRE \tmp_280_reg_6700_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_280_reg_6700_reg[3]_i_1_n_11 ),
        .Q(tmp_280_reg_6700[0]),
        .R(1'b0));
  FDRE \tmp_280_reg_6700_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_280_reg_6700_reg[3]_i_1_n_10 ),
        .Q(tmp_280_reg_6700[1]),
        .R(1'b0));
  FDRE \tmp_280_reg_6700_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_280_reg_6700_reg[3]_i_1_n_9 ),
        .Q(tmp_280_reg_6700[2]),
        .R(1'b0));
  FDRE \tmp_280_reg_6700_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_280_reg_6700_reg[3]_i_1_n_4 ),
        .Q(tmp_280_reg_6700[3]),
        .R(1'b0));
  CARRY4 \tmp_280_reg_6700_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_280_reg_6700_reg[3]_i_1_n_4 ,\NLW_tmp_280_reg_6700_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_280_reg_6700_reg[3]_i_1_n_6 ,\tmp_280_reg_6700_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[50:48]}),
        .O({\NLW_tmp_280_reg_6700_reg[3]_i_1_O_UNCONNECTED [3],\tmp_280_reg_6700_reg[3]_i_1_n_9 ,\tmp_280_reg_6700_reg[3]_i_1_n_10 ,\tmp_280_reg_6700_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_280_reg_6700[3]_i_2_n_4 ,\tmp_280_reg_6700[3]_i_3_n_4 ,\tmp_280_reg_6700[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_281_reg_6706[3]_i_2 
       (.I0(tmp_279_reg_6629[42]),
        .I1(add_ln18_3_reg_6624[42]),
        .O(\tmp_281_reg_6706[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_281_reg_6706[3]_i_3 
       (.I0(tmp_279_reg_6629[41]),
        .I1(add_ln18_3_reg_6624[41]),
        .O(\tmp_281_reg_6706[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_281_reg_6706[3]_i_4 
       (.I0(tmp_279_reg_6629[40]),
        .I1(add_ln18_3_reg_6624[40]),
        .O(\tmp_281_reg_6706[3]_i_4_n_4 ));
  FDRE \tmp_281_reg_6706_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_281_reg_6706_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_7_fu_4624_p1[32]),
        .R(1'b0));
  FDRE \tmp_281_reg_6706_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_281_reg_6706_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_7_fu_4624_p1[33]),
        .R(1'b0));
  FDRE \tmp_281_reg_6706_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_281_reg_6706_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_7_fu_4624_p1[34]),
        .R(1'b0));
  FDRE \tmp_281_reg_6706_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_281_reg_6706_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_7_fu_4624_p1[35]),
        .R(1'b0));
  CARRY4 \tmp_281_reg_6706_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_281_reg_6706_reg[3]_i_1_n_4 ,\NLW_tmp_281_reg_6706_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_281_reg_6706_reg[3]_i_1_n_6 ,\tmp_281_reg_6706_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[42:40]}),
        .O({\NLW_tmp_281_reg_6706_reg[3]_i_1_O_UNCONNECTED [3],\tmp_281_reg_6706_reg[3]_i_1_n_9 ,\tmp_281_reg_6706_reg[3]_i_1_n_10 ,\tmp_281_reg_6706_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_281_reg_6706[3]_i_2_n_4 ,\tmp_281_reg_6706[3]_i_3_n_4 ,\tmp_281_reg_6706[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_282_reg_6712[3]_i_2 
       (.I0(tmp_279_reg_6629[34]),
        .I1(add_ln18_3_reg_6624[34]),
        .O(\tmp_282_reg_6712[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_282_reg_6712[3]_i_3 
       (.I0(tmp_279_reg_6629[33]),
        .I1(add_ln18_3_reg_6624[33]),
        .O(\tmp_282_reg_6712[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_282_reg_6712[3]_i_4 
       (.I0(tmp_279_reg_6629[32]),
        .I1(add_ln18_3_reg_6624[32]),
        .O(\tmp_282_reg_6712[3]_i_4_n_4 ));
  FDRE \tmp_282_reg_6712_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_282_reg_6712_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_7_fu_4624_p1[24]),
        .R(1'b0));
  FDRE \tmp_282_reg_6712_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_282_reg_6712_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_7_fu_4624_p1[25]),
        .R(1'b0));
  FDRE \tmp_282_reg_6712_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_282_reg_6712_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_7_fu_4624_p1[26]),
        .R(1'b0));
  FDRE \tmp_282_reg_6712_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_282_reg_6712_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_7_fu_4624_p1[27]),
        .R(1'b0));
  CARRY4 \tmp_282_reg_6712_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_282_reg_6712_reg[3]_i_1_n_4 ,\NLW_tmp_282_reg_6712_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_282_reg_6712_reg[3]_i_1_n_6 ,\tmp_282_reg_6712_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[34:32]}),
        .O({\NLW_tmp_282_reg_6712_reg[3]_i_1_O_UNCONNECTED [3],\tmp_282_reg_6712_reg[3]_i_1_n_9 ,\tmp_282_reg_6712_reg[3]_i_1_n_10 ,\tmp_282_reg_6712_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_282_reg_6712[3]_i_2_n_4 ,\tmp_282_reg_6712[3]_i_3_n_4 ,\tmp_282_reg_6712[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_283_reg_6718[3]_i_2 
       (.I0(tmp_279_reg_6629[26]),
        .I1(add_ln18_3_reg_6624[26]),
        .O(\tmp_283_reg_6718[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_283_reg_6718[3]_i_3 
       (.I0(tmp_279_reg_6629[25]),
        .I1(add_ln18_3_reg_6624[25]),
        .O(\tmp_283_reg_6718[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_283_reg_6718[3]_i_4 
       (.I0(tmp_279_reg_6629[24]),
        .I1(add_ln18_3_reg_6624[24]),
        .O(\tmp_283_reg_6718[3]_i_4_n_4 ));
  FDRE \tmp_283_reg_6718_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_283_reg_6718_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_7_fu_4624_p1[16]),
        .R(1'b0));
  FDRE \tmp_283_reg_6718_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_283_reg_6718_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_7_fu_4624_p1[17]),
        .R(1'b0));
  FDRE \tmp_283_reg_6718_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_283_reg_6718_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_7_fu_4624_p1[18]),
        .R(1'b0));
  FDRE \tmp_283_reg_6718_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_283_reg_6718_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_7_fu_4624_p1[19]),
        .R(1'b0));
  CARRY4 \tmp_283_reg_6718_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_283_reg_6718_reg[3]_i_1_n_4 ,\NLW_tmp_283_reg_6718_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_283_reg_6718_reg[3]_i_1_n_6 ,\tmp_283_reg_6718_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[26:24]}),
        .O({\NLW_tmp_283_reg_6718_reg[3]_i_1_O_UNCONNECTED [3],\tmp_283_reg_6718_reg[3]_i_1_n_9 ,\tmp_283_reg_6718_reg[3]_i_1_n_10 ,\tmp_283_reg_6718_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_283_reg_6718[3]_i_2_n_4 ,\tmp_283_reg_6718[3]_i_3_n_4 ,\tmp_283_reg_6718[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_284_reg_6724[3]_i_2 
       (.I0(tmp_279_reg_6629[18]),
        .I1(add_ln18_3_reg_6624[18]),
        .O(\tmp_284_reg_6724[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_284_reg_6724[3]_i_3 
       (.I0(tmp_279_reg_6629[17]),
        .I1(add_ln18_3_reg_6624[17]),
        .O(\tmp_284_reg_6724[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_284_reg_6724[3]_i_4 
       (.I0(tmp_279_reg_6629[16]),
        .I1(add_ln18_3_reg_6624[16]),
        .O(\tmp_284_reg_6724[3]_i_4_n_4 ));
  FDRE \tmp_284_reg_6724_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_284_reg_6724_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_7_fu_4624_p1[8]),
        .R(1'b0));
  FDRE \tmp_284_reg_6724_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_284_reg_6724_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_7_fu_4624_p1[9]),
        .R(1'b0));
  FDRE \tmp_284_reg_6724_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_284_reg_6724_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_7_fu_4624_p1[10]),
        .R(1'b0));
  FDRE \tmp_284_reg_6724_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_284_reg_6724_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_7_fu_4624_p1[11]),
        .R(1'b0));
  CARRY4 \tmp_284_reg_6724_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_284_reg_6724_reg[3]_i_1_n_4 ,\NLW_tmp_284_reg_6724_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_284_reg_6724_reg[3]_i_1_n_6 ,\tmp_284_reg_6724_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[18:16]}),
        .O({\NLW_tmp_284_reg_6724_reg[3]_i_1_O_UNCONNECTED [3],\tmp_284_reg_6724_reg[3]_i_1_n_9 ,\tmp_284_reg_6724_reg[3]_i_1_n_10 ,\tmp_284_reg_6724_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_284_reg_6724[3]_i_2_n_4 ,\tmp_284_reg_6724[3]_i_3_n_4 ,\tmp_284_reg_6724[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_285_reg_6730[3]_i_2 
       (.I0(tmp_279_reg_6629[10]),
        .I1(add_ln18_3_reg_6624[10]),
        .O(\tmp_285_reg_6730[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_285_reg_6730[3]_i_3 
       (.I0(tmp_279_reg_6629[9]),
        .I1(add_ln18_3_reg_6624[9]),
        .O(\tmp_285_reg_6730[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_285_reg_6730[3]_i_4 
       (.I0(tmp_279_reg_6629[8]),
        .I1(add_ln18_3_reg_6624[8]),
        .O(\tmp_285_reg_6730[3]_i_4_n_4 ));
  FDRE \tmp_285_reg_6730_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_285_reg_6730_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_7_fu_4624_p1[0]),
        .R(1'b0));
  FDRE \tmp_285_reg_6730_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_285_reg_6730_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_7_fu_4624_p1[1]),
        .R(1'b0));
  FDRE \tmp_285_reg_6730_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_285_reg_6730_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_7_fu_4624_p1[2]),
        .R(1'b0));
  FDRE \tmp_285_reg_6730_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_285_reg_6730_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_7_fu_4624_p1[3]),
        .R(1'b0));
  CARRY4 \tmp_285_reg_6730_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_285_reg_6730_reg[3]_i_1_n_4 ,\NLW_tmp_285_reg_6730_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_285_reg_6730_reg[3]_i_1_n_6 ,\tmp_285_reg_6730_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[10:8]}),
        .O({\NLW_tmp_285_reg_6730_reg[3]_i_1_O_UNCONNECTED [3],\tmp_285_reg_6730_reg[3]_i_1_n_9 ,\tmp_285_reg_6730_reg[3]_i_1_n_10 ,\tmp_285_reg_6730_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_285_reg_6730[3]_i_2_n_4 ,\tmp_285_reg_6730[3]_i_3_n_4 ,\tmp_285_reg_6730[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_286_reg_6741[3]_i_2 
       (.I0(tmp_279_reg_6629[58]),
        .I1(add_ln18_3_reg_6624[58]),
        .O(\tmp_286_reg_6741[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_286_reg_6741[3]_i_3 
       (.I0(tmp_279_reg_6629[57]),
        .I1(add_ln18_3_reg_6624[57]),
        .O(\tmp_286_reg_6741[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_286_reg_6741[3]_i_4 
       (.I0(tmp_279_reg_6629[56]),
        .I1(add_ln18_3_reg_6624[56]),
        .O(\tmp_286_reg_6741[3]_i_4_n_4 ));
  FDRE \tmp_286_reg_6741_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_286_reg_6741_reg[3]_i_1_n_11 ),
        .Q(tmp_286_reg_6741[0]),
        .R(1'b0));
  FDRE \tmp_286_reg_6741_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_286_reg_6741_reg[3]_i_1_n_10 ),
        .Q(tmp_286_reg_6741[1]),
        .R(1'b0));
  FDRE \tmp_286_reg_6741_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_286_reg_6741_reg[3]_i_1_n_9 ),
        .Q(tmp_286_reg_6741[2]),
        .R(1'b0));
  FDRE \tmp_286_reg_6741_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\tmp_286_reg_6741_reg[3]_i_1_n_4 ),
        .Q(tmp_286_reg_6741[3]),
        .R(1'b0));
  CARRY4 \tmp_286_reg_6741_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_286_reg_6741_reg[3]_i_1_n_4 ,\NLW_tmp_286_reg_6741_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_286_reg_6741_reg[3]_i_1_n_6 ,\tmp_286_reg_6741_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[58:56]}),
        .O({\NLW_tmp_286_reg_6741_reg[3]_i_1_O_UNCONNECTED [3],\tmp_286_reg_6741_reg[3]_i_1_n_9 ,\tmp_286_reg_6741_reg[3]_i_1_n_10 ,\tmp_286_reg_6741_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_286_reg_6741[3]_i_2_n_4 ,\tmp_286_reg_6741[3]_i_3_n_4 ,\tmp_286_reg_6741[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[35]_i_2 
       (.I0(tmp_286_reg_6741[3]),
        .I1(tmp_280_reg_6700[3]),
        .O(\tmp_287_reg_6781[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[35]_i_3 
       (.I0(tmp_286_reg_6741[2]),
        .I1(tmp_280_reg_6700[2]),
        .O(\tmp_287_reg_6781[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[35]_i_4 
       (.I0(tmp_286_reg_6741[1]),
        .I1(tmp_280_reg_6700[1]),
        .O(\tmp_287_reg_6781[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[35]_i_5 
       (.I0(tmp_286_reg_6741[0]),
        .I1(tmp_280_reg_6700[0]),
        .O(\tmp_287_reg_6781[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[3]_i_2 
       (.I0(zext_ln23_7_fu_4624_p1[19]),
        .I1(zext_ln23_7_fu_4624_p1[11]),
        .O(\tmp_287_reg_6781[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[3]_i_3 
       (.I0(zext_ln23_7_fu_4624_p1[18]),
        .I1(zext_ln23_7_fu_4624_p1[10]),
        .O(\tmp_287_reg_6781[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[3]_i_4 
       (.I0(zext_ln23_7_fu_4624_p1[17]),
        .I1(zext_ln23_7_fu_4624_p1[9]),
        .O(\tmp_287_reg_6781[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_287_reg_6781[3]_i_5 
       (.I0(zext_ln23_7_fu_4624_p1[16]),
        .I1(zext_ln23_7_fu_4624_p1[8]),
        .O(\tmp_287_reg_6781[3]_i_5_n_4 ));
  FDRE \tmp_287_reg_6781_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[16]),
        .Q(tmp_287_reg_6781[0]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[17]),
        .Q(tmp_287_reg_6781[1]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[18]),
        .Q(tmp_287_reg_6781[2]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[48]),
        .Q(tmp_287_reg_6781[32]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[49]),
        .Q(tmp_287_reg_6781[33]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[50]),
        .Q(tmp_287_reg_6781[34]),
        .R(1'b0));
  FDRE \tmp_287_reg_6781_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[51]),
        .Q(tmp_287_reg_6781[35]),
        .R(1'b0));
  CARRY4 \tmp_287_reg_6781_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\tmp_287_reg_6781_reg[35]_i_1_n_4 ,\tmp_287_reg_6781_reg[35]_i_1_n_5 ,\tmp_287_reg_6781_reg[35]_i_1_n_6 ,\tmp_287_reg_6781_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_286_reg_6741),
        .O(add_ln23_3_fu_4634_p2[51:48]),
        .S({\tmp_287_reg_6781[35]_i_2_n_4 ,\tmp_287_reg_6781[35]_i_3_n_4 ,\tmp_287_reg_6781[35]_i_4_n_4 ,\tmp_287_reg_6781[35]_i_5_n_4 }));
  FDRE \tmp_287_reg_6781_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[52]),
        .Q(tmp_287_reg_6781[36]),
        .R(1'b0));
  CARRY4 \tmp_287_reg_6781_reg[36]_i_1 
       (.CI(\tmp_287_reg_6781_reg[35]_i_1_n_4 ),
        .CO({\NLW_tmp_287_reg_6781_reg[36]_i_1_CO_UNCONNECTED [3:1],add_ln23_3_fu_4634_p2[52]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_287_reg_6781_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \tmp_287_reg_6781_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[19]),
        .Q(tmp_287_reg_6781[3]),
        .R(1'b0));
  CARRY4 \tmp_287_reg_6781_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_287_reg_6781_reg[3]_i_1_n_4 ,\tmp_287_reg_6781_reg[3]_i_1_n_5 ,\tmp_287_reg_6781_reg[3]_i_1_n_6 ,\tmp_287_reg_6781_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_7_fu_4624_p1[19:16]),
        .O(add_ln23_3_fu_4634_p2[19:16]),
        .S({\tmp_287_reg_6781[3]_i_2_n_4 ,\tmp_287_reg_6781[3]_i_3_n_4 ,\tmp_287_reg_6781[3]_i_4_n_4 ,\tmp_287_reg_6781[3]_i_5_n_4 }));
  FDRE \tmp_287_reg_6781_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln23_3_fu_4634_p2[20]),
        .Q(tmp_287_reg_6781[4]),
        .R(1'b0));
  CARRY4 \tmp_287_reg_6781_reg[4]_i_1 
       (.CI(\tmp_287_reg_6781_reg[3]_i_1_n_4 ),
        .CO({\NLW_tmp_287_reg_6781_reg[4]_i_1_CO_UNCONNECTED [3:1],add_ln23_3_fu_4634_p2[20]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_287_reg_6781_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_28_reg_5222[0]_i_1 
       (.I0(reg_414[13]),
        .I1(\tmp_reg_5097_reg[0]_0 [13]),
        .O(diff_fu_816_p2[13]));
  FDRE \tmp_28_reg_5222_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[13]),
        .Q(tmp_28_reg_5222),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_29_reg_5227[0]_i_1 
       (.I0(reg_414[11]),
        .I1(\tmp_reg_5097_reg[0]_0 [11]),
        .O(diff_fu_816_p2[11]));
  FDRE \tmp_29_reg_5227_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[11]),
        .Q(tmp_29_reg_5227),
        .R(1'b0));
  FDRE \tmp_2_reg_5422_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__13_n_11),
        .Q(zext_ln21_fu_2290_p1[56]),
        .R(1'b0));
  FDRE \tmp_2_reg_5422_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__13_n_10),
        .Q(zext_ln21_fu_2290_p1[57]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_31_reg_5237[0]_i_1 
       (.I0(reg_414[7]),
        .I1(\tmp_reg_5097_reg[0]_0 [7]),
        .O(diff_fu_816_p2[7]));
  FDRE \tmp_31_reg_5237_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[7]),
        .Q(tmp_31_reg_5237),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_32_reg_5242[0]_i_1 
       (.I0(reg_414[5]),
        .I1(\tmp_reg_5097_reg[0]_0 [5]),
        .O(diff_fu_816_p2[5]));
  FDRE \tmp_32_reg_5242_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[5]),
        .Q(tmp_32_reg_5242),
        .R(1'b0));
  FDRE \tmp_34_reg_5434_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__11_n_11),
        .Q(zext_ln21_fu_2290_p1[48]),
        .R(1'b0));
  FDRE \tmp_34_reg_5434_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__11_n_10),
        .Q(zext_ln21_fu_2290_p1[49]),
        .R(1'b0));
  FDRE \tmp_35_reg_5440_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__10_n_11),
        .Q(zext_ln21_fu_2290_p1[44]),
        .R(1'b0));
  FDRE \tmp_35_reg_5440_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__10_n_10),
        .Q(zext_ln21_fu_2290_p1[45]),
        .R(1'b0));
  FDRE \tmp_36_reg_5446_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__9_n_11),
        .Q(zext_ln21_fu_2290_p1[40]),
        .R(1'b0));
  FDRE \tmp_36_reg_5446_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__9_n_10),
        .Q(zext_ln21_fu_2290_p1[41]),
        .R(1'b0));
  FDRE \tmp_37_reg_5452_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__8_n_11),
        .Q(zext_ln21_fu_2290_p1[36]),
        .R(1'b0));
  FDRE \tmp_37_reg_5452_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__8_n_10),
        .Q(zext_ln21_fu_2290_p1[37]),
        .R(1'b0));
  FDRE \tmp_38_reg_5458_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__7_n_11),
        .Q(zext_ln21_fu_2290_p1[32]),
        .R(1'b0));
  FDRE \tmp_38_reg_5458_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__7_n_10),
        .Q(zext_ln21_fu_2290_p1[33]),
        .R(1'b0));
  FDRE \tmp_39_reg_5464_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__6_n_11),
        .Q(zext_ln21_fu_2290_p1[28]),
        .R(1'b0));
  FDRE \tmp_39_reg_5464_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__6_n_10),
        .Q(zext_ln21_fu_2290_p1[29]),
        .R(1'b0));
  FDRE \tmp_3_reg_5428_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__12_n_11),
        .Q(zext_ln21_fu_2290_p1[52]),
        .R(1'b0));
  FDRE \tmp_3_reg_5428_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__12_n_10),
        .Q(zext_ln21_fu_2290_p1[53]),
        .R(1'b0));
  FDRE \tmp_40_reg_5470_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__5_n_11),
        .Q(zext_ln21_fu_2290_p1[24]),
        .R(1'b0));
  FDRE \tmp_40_reg_5470_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__5_n_10),
        .Q(zext_ln21_fu_2290_p1[25]),
        .R(1'b0));
  FDRE \tmp_41_reg_5476_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__4_n_11),
        .Q(zext_ln21_fu_2290_p1[20]),
        .R(1'b0));
  FDRE \tmp_41_reg_5476_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__4_n_10),
        .Q(zext_ln21_fu_2290_p1[21]),
        .R(1'b0));
  FDRE \tmp_42_reg_5482_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__3_n_11),
        .Q(zext_ln21_fu_2290_p1[16]),
        .R(1'b0));
  FDRE \tmp_42_reg_5482_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__3_n_10),
        .Q(zext_ln21_fu_2290_p1[17]),
        .R(1'b0));
  FDRE \tmp_43_reg_5488_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__2_n_11),
        .Q(zext_ln21_fu_2290_p1[12]),
        .R(1'b0));
  FDRE \tmp_43_reg_5488_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__2_n_10),
        .Q(zext_ln21_fu_2290_p1[13]),
        .R(1'b0));
  FDRE \tmp_44_reg_5494_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__1_n_11),
        .Q(zext_ln21_fu_2290_p1[8]),
        .R(1'b0));
  FDRE \tmp_44_reg_5494_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__1_n_10),
        .Q(zext_ln21_fu_2290_p1[9]),
        .R(1'b0));
  FDRE \tmp_45_reg_5500_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__0_n_11),
        .Q(zext_ln21_fu_2290_p1[4]),
        .R(1'b0));
  FDRE \tmp_45_reg_5500_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__0_n_10),
        .Q(zext_ln21_fu_2290_p1[5]),
        .R(1'b0));
  FDRE \tmp_46_reg_5512_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__14_n_9),
        .Q(zext_ln21_1_fu_2393_p1[60]),
        .R(1'b0));
  FDRE \tmp_46_reg_5512_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__14_n_8),
        .Q(zext_ln21_1_fu_2393_p1[61]),
        .R(1'b0));
  FDRE \tmp_47_reg_5517_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__13_n_9),
        .Q(zext_ln21_1_fu_2393_p1[56]),
        .R(1'b0));
  FDRE \tmp_47_reg_5517_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__13_n_8),
        .Q(zext_ln21_1_fu_2393_p1[57]),
        .R(1'b0));
  FDRE \tmp_48_reg_5523_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__12_n_9),
        .Q(zext_ln21_1_fu_2393_p1[52]),
        .R(1'b0));
  FDRE \tmp_48_reg_5523_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__12_n_8),
        .Q(zext_ln21_1_fu_2393_p1[53]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_4_reg_5102[0]_i_1 
       (.I0(reg_414[61]),
        .I1(\tmp_reg_5097_reg[0]_0 [61]),
        .O(diff_fu_816_p2[61]));
  FDRE \tmp_4_reg_5102_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[61]),
        .Q(tmp_4_reg_5102),
        .R(1'b0));
  FDRE \tmp_50_reg_5529_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__11_n_9),
        .Q(zext_ln21_1_fu_2393_p1[48]),
        .R(1'b0));
  FDRE \tmp_50_reg_5529_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__11_n_8),
        .Q(zext_ln21_1_fu_2393_p1[49]),
        .R(1'b0));
  FDRE \tmp_51_reg_5535_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__10_n_9),
        .Q(zext_ln21_1_fu_2393_p1[44]),
        .R(1'b0));
  FDRE \tmp_51_reg_5535_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__10_n_8),
        .Q(zext_ln21_1_fu_2393_p1[45]),
        .R(1'b0));
  FDRE \tmp_52_reg_5541_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__9_n_9),
        .Q(zext_ln21_1_fu_2393_p1[40]),
        .R(1'b0));
  FDRE \tmp_52_reg_5541_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__9_n_8),
        .Q(zext_ln21_1_fu_2393_p1[41]),
        .R(1'b0));
  FDRE \tmp_53_reg_5547_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__8_n_9),
        .Q(zext_ln21_1_fu_2393_p1[36]),
        .R(1'b0));
  FDRE \tmp_53_reg_5547_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__8_n_8),
        .Q(zext_ln21_1_fu_2393_p1[37]),
        .R(1'b0));
  FDRE \tmp_54_reg_5553_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__7_n_9),
        .Q(zext_ln21_1_fu_2393_p1[32]),
        .R(1'b0));
  FDRE \tmp_54_reg_5553_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__7_n_8),
        .Q(zext_ln21_1_fu_2393_p1[33]),
        .R(1'b0));
  FDRE \tmp_55_reg_5559_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__6_n_9),
        .Q(zext_ln21_1_fu_2393_p1[28]),
        .R(1'b0));
  FDRE \tmp_55_reg_5559_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__6_n_8),
        .Q(zext_ln21_1_fu_2393_p1[29]),
        .R(1'b0));
  FDRE \tmp_56_reg_5565_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__5_n_9),
        .Q(zext_ln21_1_fu_2393_p1[24]),
        .R(1'b0));
  FDRE \tmp_56_reg_5565_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__5_n_8),
        .Q(zext_ln21_1_fu_2393_p1[25]),
        .R(1'b0));
  FDRE \tmp_57_reg_5571_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__4_n_9),
        .Q(zext_ln21_1_fu_2393_p1[20]),
        .R(1'b0));
  FDRE \tmp_57_reg_5571_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__4_n_8),
        .Q(zext_ln21_1_fu_2393_p1[21]),
        .R(1'b0));
  FDRE \tmp_58_reg_5577_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__3_n_9),
        .Q(zext_ln21_1_fu_2393_p1[16]),
        .R(1'b0));
  FDRE \tmp_58_reg_5577_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__3_n_8),
        .Q(zext_ln21_1_fu_2393_p1[17]),
        .R(1'b0));
  FDRE \tmp_59_reg_5583_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__2_n_9),
        .Q(zext_ln21_1_fu_2393_p1[12]),
        .R(1'b0));
  FDRE \tmp_59_reg_5583_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__2_n_8),
        .Q(zext_ln21_1_fu_2393_p1[13]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_5_reg_5107[0]_i_1 
       (.I0(reg_414[59]),
        .I1(\tmp_reg_5097_reg[0]_0 [59]),
        .O(diff_fu_816_p2[59]));
  FDRE \tmp_5_reg_5107_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[59]),
        .Q(tmp_5_reg_5107),
        .R(1'b0));
  FDRE \tmp_60_reg_5589_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__1_n_9),
        .Q(zext_ln21_1_fu_2393_p1[8]),
        .R(1'b0));
  FDRE \tmp_60_reg_5589_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__1_n_8),
        .Q(zext_ln21_1_fu_2393_p1[9]),
        .R(1'b0));
  FDRE \tmp_61_reg_5595_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__0_n_9),
        .Q(zext_ln21_1_fu_2393_p1[4]),
        .R(1'b0));
  FDRE \tmp_61_reg_5595_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__0_n_8),
        .Q(zext_ln21_1_fu_2393_p1[5]),
        .R(1'b0));
  FDRE \tmp_62_reg_5601_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry_n_9),
        .Q(zext_ln21_1_fu_2393_p1[0]),
        .R(1'b0));
  FDRE \tmp_62_reg_5601_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry_n_8),
        .Q(zext_ln21_1_fu_2393_p1[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[10]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[13]),
        .I1(zext_ln21_fu_2290_p1[13]),
        .O(\tmp_63_reg_6122[10]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[10]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[12]),
        .I1(zext_ln21_fu_2290_p1[12]),
        .O(\tmp_63_reg_6122[10]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[18]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[21]),
        .I1(zext_ln21_fu_2290_p1[21]),
        .O(\tmp_63_reg_6122[18]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[18]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[20]),
        .I1(zext_ln21_fu_2290_p1[20]),
        .O(\tmp_63_reg_6122[18]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[26]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[29]),
        .I1(zext_ln21_fu_2290_p1[29]),
        .O(\tmp_63_reg_6122[26]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[26]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[28]),
        .I1(zext_ln21_fu_2290_p1[28]),
        .O(\tmp_63_reg_6122[26]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[2]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[5]),
        .I1(zext_ln21_fu_2290_p1[5]),
        .O(\tmp_63_reg_6122[2]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[2]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[4]),
        .I1(zext_ln21_fu_2290_p1[4]),
        .O(\tmp_63_reg_6122[2]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[34]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[37]),
        .I1(zext_ln21_fu_2290_p1[37]),
        .O(\tmp_63_reg_6122[34]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[34]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[36]),
        .I1(zext_ln21_fu_2290_p1[36]),
        .O(\tmp_63_reg_6122[34]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[42]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[45]),
        .I1(zext_ln21_fu_2290_p1[45]),
        .O(\tmp_63_reg_6122[42]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[42]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[44]),
        .I1(zext_ln21_fu_2290_p1[44]),
        .O(\tmp_63_reg_6122[42]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[50]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[53]),
        .I1(zext_ln21_fu_2290_p1[53]),
        .O(\tmp_63_reg_6122[50]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[50]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[52]),
        .I1(zext_ln21_fu_2290_p1[52]),
        .O(\tmp_63_reg_6122[50]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[58]_i_2 
       (.I0(zext_ln21_1_fu_2393_p1[61]),
        .I1(zext_ln21_fu_2290_p1[61]),
        .O(\tmp_63_reg_6122[58]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_63_reg_6122[58]_i_3 
       (.I0(zext_ln21_1_fu_2393_p1[60]),
        .I1(zext_ln21_fu_2290_p1[60]),
        .O(\tmp_63_reg_6122[58]_i_3_n_4 ));
  FDRE \tmp_63_reg_6122_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[4]),
        .Q(tmp_63_reg_6122[0]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[14]),
        .Q(tmp_63_reg_6122[10]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[10]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[14],\NLW_tmp_63_reg_6122_reg[10]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[10]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[13:12]}),
        .O({\NLW_tmp_63_reg_6122_reg[10]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[13:12]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[10]_i_2_n_4 ,\tmp_63_reg_6122[10]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[20]),
        .Q(tmp_63_reg_6122[16]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[21]),
        .Q(tmp_63_reg_6122[17]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[22]),
        .Q(tmp_63_reg_6122[18]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[18]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[18]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[22],\NLW_tmp_63_reg_6122_reg[18]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[18]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[21:20]}),
        .O({\NLW_tmp_63_reg_6122_reg[18]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[21:20]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[18]_i_2_n_4 ,\tmp_63_reg_6122[18]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[5]),
        .Q(tmp_63_reg_6122[1]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[28]),
        .Q(tmp_63_reg_6122[24]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[29]),
        .Q(tmp_63_reg_6122[25]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[30]),
        .Q(tmp_63_reg_6122[26]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[26]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[26]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[30],\NLW_tmp_63_reg_6122_reg[26]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[26]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[29:28]}),
        .O({\NLW_tmp_63_reg_6122_reg[26]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[29:28]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[26]_i_2_n_4 ,\tmp_63_reg_6122[26]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[6]),
        .Q(tmp_63_reg_6122[2]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[2]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[6],\NLW_tmp_63_reg_6122_reg[2]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[2]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[5:4]}),
        .O({\NLW_tmp_63_reg_6122_reg[2]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[5:4]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[2]_i_2_n_4 ,\tmp_63_reg_6122[2]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[36]),
        .Q(tmp_63_reg_6122[32]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[37]),
        .Q(tmp_63_reg_6122[33]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[38]),
        .Q(tmp_63_reg_6122[34]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[34]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[34]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[38],\NLW_tmp_63_reg_6122_reg[34]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[34]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[37:36]}),
        .O({\NLW_tmp_63_reg_6122_reg[34]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[37:36]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[34]_i_2_n_4 ,\tmp_63_reg_6122[34]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[44]),
        .Q(tmp_63_reg_6122[40]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[45]),
        .Q(tmp_63_reg_6122[41]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[46]),
        .Q(tmp_63_reg_6122[42]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[42]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[42]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[46],\NLW_tmp_63_reg_6122_reg[42]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[42]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[45:44]}),
        .O({\NLW_tmp_63_reg_6122_reg[42]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[45:44]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[42]_i_2_n_4 ,\tmp_63_reg_6122[42]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[52]),
        .Q(tmp_63_reg_6122[48]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[53]),
        .Q(tmp_63_reg_6122[49]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[54]),
        .Q(tmp_63_reg_6122[50]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[50]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[50]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[54],\NLW_tmp_63_reg_6122_reg[50]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[50]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[53:52]}),
        .O({\NLW_tmp_63_reg_6122_reg[50]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[53:52]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[50]_i_2_n_4 ,\tmp_63_reg_6122[50]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[60]),
        .Q(tmp_63_reg_6122[56]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[61]),
        .Q(tmp_63_reg_6122[57]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[62]),
        .Q(tmp_63_reg_6122[58]),
        .R(1'b0));
  CARRY4 \tmp_63_reg_6122_reg[58]_i_1 
       (.CI(1'b0),
        .CO({\NLW_tmp_63_reg_6122_reg[58]_i_1_CO_UNCONNECTED [3],add_ln21_1_fu_2397_p2[62],\NLW_tmp_63_reg_6122_reg[58]_i_1_CO_UNCONNECTED [1],\tmp_63_reg_6122_reg[58]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zext_ln21_1_fu_2393_p1[61:60]}),
        .O({\NLW_tmp_63_reg_6122_reg[58]_i_1_O_UNCONNECTED [3:2],add_ln21_1_fu_2397_p2[61:60]}),
        .S({1'b0,1'b1,\tmp_63_reg_6122[58]_i_2_n_4 ,\tmp_63_reg_6122[58]_i_3_n_4 }));
  FDRE \tmp_63_reg_6122_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[12]),
        .Q(tmp_63_reg_6122[8]),
        .R(1'b0));
  FDRE \tmp_63_reg_6122_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(add_ln21_1_fu_2397_p2[13]),
        .Q(tmp_63_reg_6122[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_64_reg_6522[3]_i_2 
       (.I0(add_ln18_reg_6127[50]),
        .I1(tmp_63_reg_6122[50]),
        .O(\tmp_64_reg_6522[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_64_reg_6522[3]_i_3 
       (.I0(add_ln18_reg_6127[49]),
        .I1(tmp_63_reg_6122[49]),
        .O(\tmp_64_reg_6522[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_64_reg_6522[3]_i_4 
       (.I0(add_ln18_reg_6127[48]),
        .I1(tmp_63_reg_6122[48]),
        .O(\tmp_64_reg_6522[3]_i_4_n_4 ));
  FDRE \tmp_64_reg_6522_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_64_reg_6522_reg[3]_i_1_n_11 ),
        .Q(tmp_64_reg_6522[0]),
        .R(1'b0));
  FDRE \tmp_64_reg_6522_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_64_reg_6522_reg[3]_i_1_n_10 ),
        .Q(tmp_64_reg_6522[1]),
        .R(1'b0));
  FDRE \tmp_64_reg_6522_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_64_reg_6522_reg[3]_i_1_n_9 ),
        .Q(tmp_64_reg_6522[2]),
        .R(1'b0));
  FDRE \tmp_64_reg_6522_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_64_reg_6522_reg[3]_i_1_n_4 ),
        .Q(tmp_64_reg_6522[3]),
        .R(1'b0));
  CARRY4 \tmp_64_reg_6522_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_64_reg_6522_reg[3]_i_1_n_4 ,\NLW_tmp_64_reg_6522_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_64_reg_6522_reg[3]_i_1_n_6 ,\tmp_64_reg_6522_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[50:48]}),
        .O({\NLW_tmp_64_reg_6522_reg[3]_i_1_O_UNCONNECTED [3],\tmp_64_reg_6522_reg[3]_i_1_n_9 ,\tmp_64_reg_6522_reg[3]_i_1_n_10 ,\tmp_64_reg_6522_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_64_reg_6522[3]_i_2_n_4 ,\tmp_64_reg_6522[3]_i_3_n_4 ,\tmp_64_reg_6522[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_65_reg_6528[3]_i_2 
       (.I0(add_ln18_reg_6127[42]),
        .I1(tmp_63_reg_6122[42]),
        .O(\tmp_65_reg_6528[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_65_reg_6528[3]_i_3 
       (.I0(add_ln18_reg_6127[41]),
        .I1(tmp_63_reg_6122[41]),
        .O(\tmp_65_reg_6528[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_65_reg_6528[3]_i_4 
       (.I0(add_ln18_reg_6127[40]),
        .I1(tmp_63_reg_6122[40]),
        .O(\tmp_65_reg_6528[3]_i_4_n_4 ));
  FDRE \tmp_65_reg_6528_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_65_reg_6528_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_1_fu_4164_p1[32]),
        .R(1'b0));
  FDRE \tmp_65_reg_6528_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_65_reg_6528_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_1_fu_4164_p1[33]),
        .R(1'b0));
  FDRE \tmp_65_reg_6528_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_65_reg_6528_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_1_fu_4164_p1[34]),
        .R(1'b0));
  FDRE \tmp_65_reg_6528_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_65_reg_6528_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_1_fu_4164_p1[35]),
        .R(1'b0));
  CARRY4 \tmp_65_reg_6528_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_65_reg_6528_reg[3]_i_1_n_4 ,\NLW_tmp_65_reg_6528_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_65_reg_6528_reg[3]_i_1_n_6 ,\tmp_65_reg_6528_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[42:40]}),
        .O({\NLW_tmp_65_reg_6528_reg[3]_i_1_O_UNCONNECTED [3],\tmp_65_reg_6528_reg[3]_i_1_n_9 ,\tmp_65_reg_6528_reg[3]_i_1_n_10 ,\tmp_65_reg_6528_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_65_reg_6528[3]_i_2_n_4 ,\tmp_65_reg_6528[3]_i_3_n_4 ,\tmp_65_reg_6528[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_66_reg_6534[3]_i_2 
       (.I0(add_ln18_reg_6127[34]),
        .I1(tmp_63_reg_6122[34]),
        .O(\tmp_66_reg_6534[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_66_reg_6534[3]_i_3 
       (.I0(add_ln18_reg_6127[33]),
        .I1(tmp_63_reg_6122[33]),
        .O(\tmp_66_reg_6534[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_66_reg_6534[3]_i_4 
       (.I0(add_ln18_reg_6127[32]),
        .I1(tmp_63_reg_6122[32]),
        .O(\tmp_66_reg_6534[3]_i_4_n_4 ));
  FDRE \tmp_66_reg_6534_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_66_reg_6534_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_1_fu_4164_p1[24]),
        .R(1'b0));
  FDRE \tmp_66_reg_6534_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_66_reg_6534_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_1_fu_4164_p1[25]),
        .R(1'b0));
  FDRE \tmp_66_reg_6534_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_66_reg_6534_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_1_fu_4164_p1[26]),
        .R(1'b0));
  FDRE \tmp_66_reg_6534_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_66_reg_6534_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_1_fu_4164_p1[27]),
        .R(1'b0));
  CARRY4 \tmp_66_reg_6534_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_66_reg_6534_reg[3]_i_1_n_4 ,\NLW_tmp_66_reg_6534_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_66_reg_6534_reg[3]_i_1_n_6 ,\tmp_66_reg_6534_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[34:32]}),
        .O({\NLW_tmp_66_reg_6534_reg[3]_i_1_O_UNCONNECTED [3],\tmp_66_reg_6534_reg[3]_i_1_n_9 ,\tmp_66_reg_6534_reg[3]_i_1_n_10 ,\tmp_66_reg_6534_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_66_reg_6534[3]_i_2_n_4 ,\tmp_66_reg_6534[3]_i_3_n_4 ,\tmp_66_reg_6534[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_67_reg_6540[3]_i_2 
       (.I0(add_ln18_reg_6127[26]),
        .I1(tmp_63_reg_6122[26]),
        .O(\tmp_67_reg_6540[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_67_reg_6540[3]_i_3 
       (.I0(add_ln18_reg_6127[25]),
        .I1(tmp_63_reg_6122[25]),
        .O(\tmp_67_reg_6540[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_67_reg_6540[3]_i_4 
       (.I0(add_ln18_reg_6127[24]),
        .I1(tmp_63_reg_6122[24]),
        .O(\tmp_67_reg_6540[3]_i_4_n_4 ));
  FDRE \tmp_67_reg_6540_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_67_reg_6540_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_1_fu_4164_p1[16]),
        .R(1'b0));
  FDRE \tmp_67_reg_6540_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_67_reg_6540_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_1_fu_4164_p1[17]),
        .R(1'b0));
  FDRE \tmp_67_reg_6540_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_67_reg_6540_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_1_fu_4164_p1[18]),
        .R(1'b0));
  FDRE \tmp_67_reg_6540_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_67_reg_6540_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_1_fu_4164_p1[19]),
        .R(1'b0));
  CARRY4 \tmp_67_reg_6540_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_67_reg_6540_reg[3]_i_1_n_4 ,\NLW_tmp_67_reg_6540_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_67_reg_6540_reg[3]_i_1_n_6 ,\tmp_67_reg_6540_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[26:24]}),
        .O({\NLW_tmp_67_reg_6540_reg[3]_i_1_O_UNCONNECTED [3],\tmp_67_reg_6540_reg[3]_i_1_n_9 ,\tmp_67_reg_6540_reg[3]_i_1_n_10 ,\tmp_67_reg_6540_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_67_reg_6540[3]_i_2_n_4 ,\tmp_67_reg_6540[3]_i_3_n_4 ,\tmp_67_reg_6540[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_68_reg_6546[3]_i_2 
       (.I0(add_ln18_reg_6127[18]),
        .I1(tmp_63_reg_6122[18]),
        .O(\tmp_68_reg_6546[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_68_reg_6546[3]_i_3 
       (.I0(add_ln18_reg_6127[17]),
        .I1(tmp_63_reg_6122[17]),
        .O(\tmp_68_reg_6546[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_68_reg_6546[3]_i_4 
       (.I0(add_ln18_reg_6127[16]),
        .I1(tmp_63_reg_6122[16]),
        .O(\tmp_68_reg_6546[3]_i_4_n_4 ));
  FDRE \tmp_68_reg_6546_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_68_reg_6546_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_1_fu_4164_p1[8]),
        .R(1'b0));
  FDRE \tmp_68_reg_6546_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_68_reg_6546_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_1_fu_4164_p1[9]),
        .R(1'b0));
  FDRE \tmp_68_reg_6546_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_68_reg_6546_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_1_fu_4164_p1[10]),
        .R(1'b0));
  FDRE \tmp_68_reg_6546_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_68_reg_6546_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_1_fu_4164_p1[11]),
        .R(1'b0));
  CARRY4 \tmp_68_reg_6546_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_68_reg_6546_reg[3]_i_1_n_4 ,\NLW_tmp_68_reg_6546_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_68_reg_6546_reg[3]_i_1_n_6 ,\tmp_68_reg_6546_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[18:16]}),
        .O({\NLW_tmp_68_reg_6546_reg[3]_i_1_O_UNCONNECTED [3],\tmp_68_reg_6546_reg[3]_i_1_n_9 ,\tmp_68_reg_6546_reg[3]_i_1_n_10 ,\tmp_68_reg_6546_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_68_reg_6546[3]_i_2_n_4 ,\tmp_68_reg_6546[3]_i_3_n_4 ,\tmp_68_reg_6546[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_69_reg_6552[3]_i_2 
       (.I0(add_ln18_reg_6127[10]),
        .I1(tmp_63_reg_6122[10]),
        .O(\tmp_69_reg_6552[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_69_reg_6552[3]_i_3 
       (.I0(add_ln18_reg_6127[9]),
        .I1(tmp_63_reg_6122[9]),
        .O(\tmp_69_reg_6552[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_69_reg_6552[3]_i_4 
       (.I0(add_ln18_reg_6127[8]),
        .I1(tmp_63_reg_6122[8]),
        .O(\tmp_69_reg_6552[3]_i_4_n_4 ));
  FDRE \tmp_69_reg_6552_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_69_reg_6552_reg[3]_i_1_n_11 ),
        .Q(zext_ln23_1_fu_4164_p1[0]),
        .R(1'b0));
  FDRE \tmp_69_reg_6552_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_69_reg_6552_reg[3]_i_1_n_10 ),
        .Q(zext_ln23_1_fu_4164_p1[1]),
        .R(1'b0));
  FDRE \tmp_69_reg_6552_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_69_reg_6552_reg[3]_i_1_n_9 ),
        .Q(zext_ln23_1_fu_4164_p1[2]),
        .R(1'b0));
  FDRE \tmp_69_reg_6552_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_69_reg_6552_reg[3]_i_1_n_4 ),
        .Q(zext_ln23_1_fu_4164_p1[3]),
        .R(1'b0));
  CARRY4 \tmp_69_reg_6552_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_69_reg_6552_reg[3]_i_1_n_4 ,\NLW_tmp_69_reg_6552_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_69_reg_6552_reg[3]_i_1_n_6 ,\tmp_69_reg_6552_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[10:8]}),
        .O({\NLW_tmp_69_reg_6552_reg[3]_i_1_O_UNCONNECTED [3],\tmp_69_reg_6552_reg[3]_i_1_n_9 ,\tmp_69_reg_6552_reg[3]_i_1_n_10 ,\tmp_69_reg_6552_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_69_reg_6552[3]_i_2_n_4 ,\tmp_69_reg_6552[3]_i_3_n_4 ,\tmp_69_reg_6552[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_70_reg_6563[3]_i_2 
       (.I0(add_ln18_reg_6127[58]),
        .I1(tmp_63_reg_6122[58]),
        .O(\tmp_70_reg_6563[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_70_reg_6563[3]_i_3 
       (.I0(add_ln18_reg_6127[57]),
        .I1(tmp_63_reg_6122[57]),
        .O(\tmp_70_reg_6563[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_70_reg_6563[3]_i_4 
       (.I0(add_ln18_reg_6127[56]),
        .I1(tmp_63_reg_6122[56]),
        .O(\tmp_70_reg_6563[3]_i_4_n_4 ));
  FDRE \tmp_70_reg_6563_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_70_reg_6563_reg[3]_i_1_n_11 ),
        .Q(tmp_70_reg_6563[0]),
        .R(1'b0));
  FDRE \tmp_70_reg_6563_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_70_reg_6563_reg[3]_i_1_n_10 ),
        .Q(tmp_70_reg_6563[1]),
        .R(1'b0));
  FDRE \tmp_70_reg_6563_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_70_reg_6563_reg[3]_i_1_n_9 ),
        .Q(tmp_70_reg_6563[2]),
        .R(1'b0));
  FDRE \tmp_70_reg_6563_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\tmp_70_reg_6563_reg[3]_i_1_n_4 ),
        .Q(tmp_70_reg_6563[3]),
        .R(1'b0));
  CARRY4 \tmp_70_reg_6563_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_70_reg_6563_reg[3]_i_1_n_4 ,\NLW_tmp_70_reg_6563_reg[3]_i_1_CO_UNCONNECTED [2],\tmp_70_reg_6563_reg[3]_i_1_n_6 ,\tmp_70_reg_6563_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[58:56]}),
        .O({\NLW_tmp_70_reg_6563_reg[3]_i_1_O_UNCONNECTED [3],\tmp_70_reg_6563_reg[3]_i_1_n_9 ,\tmp_70_reg_6563_reg[3]_i_1_n_10 ,\tmp_70_reg_6563_reg[3]_i_1_n_11 }),
        .S({1'b1,\tmp_70_reg_6563[3]_i_2_n_4 ,\tmp_70_reg_6563[3]_i_3_n_4 ,\tmp_70_reg_6563[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[35]_i_2 
       (.I0(tmp_70_reg_6563[3]),
        .I1(tmp_64_reg_6522[3]),
        .O(\tmp_71_reg_6639[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[35]_i_3 
       (.I0(tmp_70_reg_6563[2]),
        .I1(tmp_64_reg_6522[2]),
        .O(\tmp_71_reg_6639[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[35]_i_4 
       (.I0(tmp_70_reg_6563[1]),
        .I1(tmp_64_reg_6522[1]),
        .O(\tmp_71_reg_6639[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[35]_i_5 
       (.I0(tmp_70_reg_6563[0]),
        .I1(tmp_64_reg_6522[0]),
        .O(\tmp_71_reg_6639[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[3]_i_2 
       (.I0(zext_ln23_1_fu_4164_p1[19]),
        .I1(zext_ln23_1_fu_4164_p1[11]),
        .O(\tmp_71_reg_6639[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[3]_i_3 
       (.I0(zext_ln23_1_fu_4164_p1[18]),
        .I1(zext_ln23_1_fu_4164_p1[10]),
        .O(\tmp_71_reg_6639[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[3]_i_4 
       (.I0(zext_ln23_1_fu_4164_p1[17]),
        .I1(zext_ln23_1_fu_4164_p1[9]),
        .O(\tmp_71_reg_6639[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_71_reg_6639[3]_i_5 
       (.I0(zext_ln23_1_fu_4164_p1[16]),
        .I1(zext_ln23_1_fu_4164_p1[8]),
        .O(\tmp_71_reg_6639[3]_i_5_n_4 ));
  FDRE \tmp_71_reg_6639_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[16]),
        .Q(tmp_71_reg_6639[0]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[17]),
        .Q(tmp_71_reg_6639[1]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[18]),
        .Q(tmp_71_reg_6639[2]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[48]),
        .Q(tmp_71_reg_6639[32]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[49]),
        .Q(tmp_71_reg_6639[33]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[50]),
        .Q(tmp_71_reg_6639[34]),
        .R(1'b0));
  FDRE \tmp_71_reg_6639_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[51]),
        .Q(tmp_71_reg_6639[35]),
        .R(1'b0));
  CARRY4 \tmp_71_reg_6639_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\tmp_71_reg_6639_reg[35]_i_1_n_4 ,\tmp_71_reg_6639_reg[35]_i_1_n_5 ,\tmp_71_reg_6639_reg[35]_i_1_n_6 ,\tmp_71_reg_6639_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_70_reg_6563),
        .O(add_ln23_fu_4174_p2[51:48]),
        .S({\tmp_71_reg_6639[35]_i_2_n_4 ,\tmp_71_reg_6639[35]_i_3_n_4 ,\tmp_71_reg_6639[35]_i_4_n_4 ,\tmp_71_reg_6639[35]_i_5_n_4 }));
  FDRE \tmp_71_reg_6639_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[52]),
        .Q(tmp_71_reg_6639[36]),
        .R(1'b0));
  CARRY4 \tmp_71_reg_6639_reg[36]_i_1 
       (.CI(\tmp_71_reg_6639_reg[35]_i_1_n_4 ),
        .CO({\NLW_tmp_71_reg_6639_reg[36]_i_1_CO_UNCONNECTED [3:1],add_ln23_fu_4174_p2[52]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_71_reg_6639_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \tmp_71_reg_6639_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[19]),
        .Q(tmp_71_reg_6639[3]),
        .R(1'b0));
  CARRY4 \tmp_71_reg_6639_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tmp_71_reg_6639_reg[3]_i_1_n_4 ,\tmp_71_reg_6639_reg[3]_i_1_n_5 ,\tmp_71_reg_6639_reg[3]_i_1_n_6 ,\tmp_71_reg_6639_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_1_fu_4164_p1[19:16]),
        .O(add_ln23_fu_4174_p2[19:16]),
        .S({\tmp_71_reg_6639[3]_i_2_n_4 ,\tmp_71_reg_6639[3]_i_3_n_4 ,\tmp_71_reg_6639[3]_i_4_n_4 ,\tmp_71_reg_6639[3]_i_5_n_4 }));
  FDRE \tmp_71_reg_6639_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(add_ln23_fu_4174_p2[20]),
        .Q(tmp_71_reg_6639[4]),
        .R(1'b0));
  CARRY4 \tmp_71_reg_6639_reg[4]_i_1 
       (.CI(\tmp_71_reg_6639_reg[3]_i_1_n_4 ),
        .CO({\NLW_tmp_71_reg_6639_reg[4]_i_1_CO_UNCONNECTED [3:1],add_ln23_fu_4174_p2[20]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_tmp_71_reg_6639_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \tmp_72_reg_5257_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[63]),
        .Q(tmp_72_reg_5257),
        .R(1'b0));
  FDRE \tmp_73_reg_5262_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[61]),
        .Q(tmp_73_reg_5262),
        .R(1'b0));
  FDRE \tmp_74_reg_5267_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[59]),
        .Q(tmp_74_reg_5267),
        .R(1'b0));
  FDRE \tmp_75_reg_5272_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[57]),
        .Q(tmp_75_reg_5272),
        .R(1'b0));
  FDRE \tmp_76_reg_5277_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[55]),
        .Q(tmp_76_reg_5277),
        .R(1'b0));
  FDRE \tmp_77_reg_5282_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[53]),
        .Q(tmp_77_reg_5282),
        .R(1'b0));
  FDRE \tmp_78_reg_5287_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[51]),
        .Q(tmp_78_reg_5287),
        .R(1'b0));
  FDRE \tmp_79_reg_5292_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[49]),
        .Q(tmp_79_reg_5292),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_7_reg_5117[0]_i_1 
       (.I0(reg_414[55]),
        .I1(\tmp_reg_5097_reg[0]_0 [55]),
        .O(diff_fu_816_p2[55]));
  FDRE \tmp_7_reg_5117_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[55]),
        .Q(tmp_7_reg_5117),
        .R(1'b0));
  FDRE \tmp_80_reg_5297_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[47]),
        .Q(tmp_80_reg_5297),
        .R(1'b0));
  FDRE \tmp_81_reg_5302_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[45]),
        .Q(tmp_81_reg_5302),
        .R(1'b0));
  FDRE \tmp_82_reg_5307_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[43]),
        .Q(tmp_82_reg_5307),
        .R(1'b0));
  FDRE \tmp_83_reg_5312_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[41]),
        .Q(tmp_83_reg_5312),
        .R(1'b0));
  FDRE \tmp_84_reg_5317_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[39]),
        .Q(tmp_84_reg_5317),
        .R(1'b0));
  FDRE \tmp_85_reg_5322_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[37]),
        .Q(tmp_85_reg_5322),
        .R(1'b0));
  FDRE \tmp_86_reg_5327_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[35]),
        .Q(tmp_86_reg_5327),
        .R(1'b0));
  FDRE \tmp_87_reg_5332_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[33]),
        .Q(tmp_87_reg_5332),
        .R(1'b0));
  FDRE \tmp_88_reg_5337_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[31]),
        .Q(tmp_88_reg_5337),
        .R(1'b0));
  FDRE \tmp_89_reg_5342_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[29]),
        .Q(tmp_89_reg_5342),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_8_reg_5122[0]_i_1 
       (.I0(reg_414[53]),
        .I1(\tmp_reg_5097_reg[0]_0 [53]),
        .O(diff_fu_816_p2[53]));
  FDRE \tmp_8_reg_5122_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[53]),
        .Q(tmp_8_reg_5122),
        .R(1'b0));
  FDRE \tmp_90_reg_5347_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[27]),
        .Q(tmp_90_reg_5347),
        .R(1'b0));
  FDRE \tmp_91_reg_5352_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[25]),
        .Q(tmp_91_reg_5352),
        .R(1'b0));
  FDRE \tmp_92_reg_5357_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[23]),
        .Q(tmp_92_reg_5357),
        .R(1'b0));
  FDRE \tmp_93_reg_5362_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[21]),
        .Q(tmp_93_reg_5362),
        .R(1'b0));
  FDRE \tmp_94_reg_5367_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[19]),
        .Q(tmp_94_reg_5367),
        .R(1'b0));
  FDRE \tmp_95_reg_5372_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[17]),
        .Q(tmp_95_reg_5372),
        .R(1'b0));
  FDRE \tmp_96_reg_5377_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[15]),
        .Q(tmp_96_reg_5377),
        .R(1'b0));
  FDRE \tmp_97_reg_5382_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[13]),
        .Q(tmp_97_reg_5382),
        .R(1'b0));
  FDRE \tmp_98_reg_5387_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[11]),
        .Q(tmp_98_reg_5387),
        .R(1'b0));
  FDRE \tmp_99_reg_5392_reg[0] 
       (.C(ap_clk),
        .CE(reg_4141),
        .D(grp_fu_427_p2[9]),
        .Q(tmp_99_reg_5392),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_9_reg_5127[0]_i_1 
       (.I0(reg_414[51]),
        .I1(\tmp_reg_5097_reg[0]_0 [51]),
        .O(diff_fu_816_p2[51]));
  FDRE \tmp_9_reg_5127_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[51]),
        .Q(tmp_9_reg_5127),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tmp_reg_5097[0]_i_1 
       (.I0(reg_414[63]),
        .I1(\tmp_reg_5097_reg[0]_0 [63]),
        .O(diff_fu_816_p2[63]));
  FDRE \tmp_reg_5097_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(diff_fu_816_p2[63]),
        .Q(tmp_reg_5097),
        .R(1'b0));
  FDRE \tmp_s_reg_5417_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__14_n_11),
        .Q(zext_ln21_fu_2290_p1[60]),
        .R(1'b0));
  FDRE \tmp_s_reg_5417_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry__14_n_10),
        .Q(zext_ln21_fu_2290_p1[61]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    training_labels_ce0_INST_0
       (.I0(ap_CS_fsm_pp0_stage0),
        .I1(ap_enable_reg_pp0_iter2),
        .O(training_labels_ce0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hF808)) 
    training_samples_ce1_INST_0
       (.I0(Q),
        .I1(ap_enable_reg_pp0_iter0_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(training_samples_ce1));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[35]_i_2 
       (.I0(zext_ln23_1_fu_4164_p1[35]),
        .I1(zext_ln23_1_fu_4164_p1[27]),
        .O(\trunc_ln18_1_reg_6634[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[35]_i_3 
       (.I0(zext_ln23_1_fu_4164_p1[34]),
        .I1(zext_ln23_1_fu_4164_p1[26]),
        .O(\trunc_ln18_1_reg_6634[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[35]_i_4 
       (.I0(zext_ln23_1_fu_4164_p1[33]),
        .I1(zext_ln23_1_fu_4164_p1[25]),
        .O(\trunc_ln18_1_reg_6634[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[35]_i_5 
       (.I0(zext_ln23_1_fu_4164_p1[32]),
        .I1(zext_ln23_1_fu_4164_p1[24]),
        .O(\trunc_ln18_1_reg_6634[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[3]_i_2 
       (.I0(zext_ln23_1_fu_4164_p1[3]),
        .I1(trunc_ln18_reg_6558[3]),
        .O(\trunc_ln18_1_reg_6634[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[3]_i_3 
       (.I0(zext_ln23_1_fu_4164_p1[2]),
        .I1(trunc_ln18_reg_6558[2]),
        .O(\trunc_ln18_1_reg_6634[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[3]_i_4 
       (.I0(zext_ln23_1_fu_4164_p1[1]),
        .I1(trunc_ln18_reg_6558[1]),
        .O(\trunc_ln18_1_reg_6634[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_1_reg_6634[3]_i_5 
       (.I0(zext_ln23_1_fu_4164_p1[0]),
        .I1(trunc_ln18_reg_6558[0]),
        .O(\trunc_ln18_1_reg_6634[3]_i_5_n_4 ));
  FDRE \trunc_ln18_1_reg_6634_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[0]),
        .Q(trunc_ln18_1_reg_6634[0]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[1]),
        .Q(trunc_ln18_1_reg_6634[1]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[2]),
        .Q(trunc_ln18_1_reg_6634[2]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[32]),
        .Q(trunc_ln18_1_reg_6634[32]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[33]),
        .Q(trunc_ln18_1_reg_6634[33]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[34]),
        .Q(trunc_ln18_1_reg_6634[34]),
        .R(1'b0));
  FDRE \trunc_ln18_1_reg_6634_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[35]),
        .Q(trunc_ln18_1_reg_6634[35]),
        .R(1'b0));
  CARRY4 \trunc_ln18_1_reg_6634_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_1_reg_6634_reg[35]_i_1_n_4 ,\trunc_ln18_1_reg_6634_reg[35]_i_1_n_5 ,\trunc_ln18_1_reg_6634_reg[35]_i_1_n_6 ,\trunc_ln18_1_reg_6634_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_1_fu_4164_p1[35:32]),
        .O(trunc_ln18_1_fu_4180_p1[35:32]),
        .S({\trunc_ln18_1_reg_6634[35]_i_2_n_4 ,\trunc_ln18_1_reg_6634[35]_i_3_n_4 ,\trunc_ln18_1_reg_6634[35]_i_4_n_4 ,\trunc_ln18_1_reg_6634[35]_i_5_n_4 }));
  FDRE \trunc_ln18_1_reg_6634_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[36]),
        .Q(trunc_ln18_1_reg_6634[36]),
        .R(1'b0));
  CARRY4 \trunc_ln18_1_reg_6634_reg[36]_i_1 
       (.CI(\trunc_ln18_1_reg_6634_reg[35]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_1_reg_6634_reg[36]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_1_fu_4180_p1[36]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_1_reg_6634_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \trunc_ln18_1_reg_6634_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[3]),
        .Q(trunc_ln18_1_reg_6634[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_1_reg_6634_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_1_reg_6634_reg[3]_i_1_n_4 ,\trunc_ln18_1_reg_6634_reg[3]_i_1_n_5 ,\trunc_ln18_1_reg_6634_reg[3]_i_1_n_6 ,\trunc_ln18_1_reg_6634_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_1_fu_4164_p1[3:0]),
        .O(trunc_ln18_1_fu_4180_p1[3:0]),
        .S({\trunc_ln18_1_reg_6634[3]_i_2_n_4 ,\trunc_ln18_1_reg_6634[3]_i_3_n_4 ,\trunc_ln18_1_reg_6634[3]_i_4_n_4 ,\trunc_ln18_1_reg_6634[3]_i_5_n_4 }));
  FDRE \trunc_ln18_1_reg_6634_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_1_fu_4180_p1[4]),
        .Q(trunc_ln18_1_reg_6634[4]),
        .R(1'b0));
  CARRY4 \trunc_ln18_1_reg_6634_reg[4]_i_1 
       (.CI(\trunc_ln18_1_reg_6634_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_1_reg_6634_reg[4]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_1_fu_4180_p1[4]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_1_reg_6634_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_2_reg_6604[3]_i_2 
       (.I0(tmp_135_reg_6137[2]),
        .I1(add_ln18_1_reg_6132[2]),
        .O(\trunc_ln18_2_reg_6604[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_2_reg_6604[3]_i_3 
       (.I0(tmp_135_reg_6137[1]),
        .I1(add_ln18_1_reg_6132[1]),
        .O(\trunc_ln18_2_reg_6604[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_2_reg_6604[3]_i_4 
       (.I0(tmp_135_reg_6137[0]),
        .I1(add_ln18_1_reg_6132[0]),
        .O(\trunc_ln18_2_reg_6604[3]_i_4_n_4 ));
  FDRE \trunc_ln18_2_reg_6604_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_2_reg_6604_reg[3]_i_1_n_11 ),
        .Q(trunc_ln18_2_reg_6604[0]),
        .R(1'b0));
  FDRE \trunc_ln18_2_reg_6604_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_2_reg_6604_reg[3]_i_1_n_10 ),
        .Q(trunc_ln18_2_reg_6604[1]),
        .R(1'b0));
  FDRE \trunc_ln18_2_reg_6604_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_2_reg_6604_reg[3]_i_1_n_9 ),
        .Q(trunc_ln18_2_reg_6604[2]),
        .R(1'b0));
  FDRE \trunc_ln18_2_reg_6604_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_2_reg_6604_reg[3]_i_1_n_4 ),
        .Q(trunc_ln18_2_reg_6604[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_2_reg_6604_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_2_reg_6604_reg[3]_i_1_n_4 ,\NLW_trunc_ln18_2_reg_6604_reg[3]_i_1_CO_UNCONNECTED [2],\trunc_ln18_2_reg_6604_reg[3]_i_1_n_6 ,\trunc_ln18_2_reg_6604_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_135_reg_6137[2:0]}),
        .O({\NLW_trunc_ln18_2_reg_6604_reg[3]_i_1_O_UNCONNECTED [3],\trunc_ln18_2_reg_6604_reg[3]_i_1_n_9 ,\trunc_ln18_2_reg_6604_reg[3]_i_1_n_10 ,\trunc_ln18_2_reg_6604_reg[3]_i_1_n_11 }),
        .S({1'b1,\trunc_ln18_2_reg_6604[3]_i_2_n_4 ,\trunc_ln18_2_reg_6604[3]_i_3_n_4 ,\trunc_ln18_2_reg_6604[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[35]_i_2 
       (.I0(zext_ln23_3_fu_4248_p1[35]),
        .I1(zext_ln23_3_fu_4248_p1[27]),
        .O(\trunc_ln18_3_reg_6644[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[35]_i_3 
       (.I0(zext_ln23_3_fu_4248_p1[34]),
        .I1(zext_ln23_3_fu_4248_p1[26]),
        .O(\trunc_ln18_3_reg_6644[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[35]_i_4 
       (.I0(zext_ln23_3_fu_4248_p1[33]),
        .I1(zext_ln23_3_fu_4248_p1[25]),
        .O(\trunc_ln18_3_reg_6644[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[35]_i_5 
       (.I0(zext_ln23_3_fu_4248_p1[32]),
        .I1(zext_ln23_3_fu_4248_p1[24]),
        .O(\trunc_ln18_3_reg_6644[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[3]_i_2 
       (.I0(zext_ln23_3_fu_4248_p1[3]),
        .I1(trunc_ln18_2_reg_6604[3]),
        .O(\trunc_ln18_3_reg_6644[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[3]_i_3 
       (.I0(zext_ln23_3_fu_4248_p1[2]),
        .I1(trunc_ln18_2_reg_6604[2]),
        .O(\trunc_ln18_3_reg_6644[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[3]_i_4 
       (.I0(zext_ln23_3_fu_4248_p1[1]),
        .I1(trunc_ln18_2_reg_6604[1]),
        .O(\trunc_ln18_3_reg_6644[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_3_reg_6644[3]_i_5 
       (.I0(zext_ln23_3_fu_4248_p1[0]),
        .I1(trunc_ln18_2_reg_6604[0]),
        .O(\trunc_ln18_3_reg_6644[3]_i_5_n_4 ));
  FDRE \trunc_ln18_3_reg_6644_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[0]),
        .Q(trunc_ln18_3_reg_6644[0]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[1]),
        .Q(trunc_ln18_3_reg_6644[1]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[2]),
        .Q(trunc_ln18_3_reg_6644[2]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[32]),
        .Q(trunc_ln18_3_reg_6644[32]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[33]),
        .Q(trunc_ln18_3_reg_6644[33]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[34]),
        .Q(trunc_ln18_3_reg_6644[34]),
        .R(1'b0));
  FDRE \trunc_ln18_3_reg_6644_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[35]),
        .Q(trunc_ln18_3_reg_6644[35]),
        .R(1'b0));
  CARRY4 \trunc_ln18_3_reg_6644_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_3_reg_6644_reg[35]_i_1_n_4 ,\trunc_ln18_3_reg_6644_reg[35]_i_1_n_5 ,\trunc_ln18_3_reg_6644_reg[35]_i_1_n_6 ,\trunc_ln18_3_reg_6644_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_3_fu_4248_p1[35:32]),
        .O(trunc_ln18_3_fu_4264_p1[35:32]),
        .S({\trunc_ln18_3_reg_6644[35]_i_2_n_4 ,\trunc_ln18_3_reg_6644[35]_i_3_n_4 ,\trunc_ln18_3_reg_6644[35]_i_4_n_4 ,\trunc_ln18_3_reg_6644[35]_i_5_n_4 }));
  FDRE \trunc_ln18_3_reg_6644_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[36]),
        .Q(trunc_ln18_3_reg_6644[36]),
        .R(1'b0));
  CARRY4 \trunc_ln18_3_reg_6644_reg[36]_i_1 
       (.CI(\trunc_ln18_3_reg_6644_reg[35]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_3_reg_6644_reg[36]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_3_fu_4264_p1[36]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_3_reg_6644_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \trunc_ln18_3_reg_6644_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[3]),
        .Q(trunc_ln18_3_reg_6644[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_3_reg_6644_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_3_reg_6644_reg[3]_i_1_n_4 ,\trunc_ln18_3_reg_6644_reg[3]_i_1_n_5 ,\trunc_ln18_3_reg_6644_reg[3]_i_1_n_6 ,\trunc_ln18_3_reg_6644_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_3_fu_4248_p1[3:0]),
        .O(trunc_ln18_3_fu_4264_p1[3:0]),
        .S({\trunc_ln18_3_reg_6644[3]_i_2_n_4 ,\trunc_ln18_3_reg_6644[3]_i_3_n_4 ,\trunc_ln18_3_reg_6644[3]_i_4_n_4 ,\trunc_ln18_3_reg_6644[3]_i_5_n_4 }));
  FDRE \trunc_ln18_3_reg_6644_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(trunc_ln18_3_fu_4264_p1[4]),
        .Q(trunc_ln18_3_reg_6644[4]),
        .R(1'b0));
  CARRY4 \trunc_ln18_3_reg_6644_reg[4]_i_1 
       (.CI(\trunc_ln18_3_reg_6644_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_3_reg_6644_reg[4]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_3_fu_4264_p1[4]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_3_reg_6644_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_4_reg_6690[3]_i_2 
       (.I0(tmp_207_reg_6619[2]),
        .I1(add_ln18_2_reg_6614[2]),
        .O(\trunc_ln18_4_reg_6690[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_4_reg_6690[3]_i_3 
       (.I0(tmp_207_reg_6619[1]),
        .I1(add_ln18_2_reg_6614[1]),
        .O(\trunc_ln18_4_reg_6690[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_4_reg_6690[3]_i_4 
       (.I0(tmp_207_reg_6619[0]),
        .I1(add_ln18_2_reg_6614[0]),
        .O(\trunc_ln18_4_reg_6690[3]_i_4_n_4 ));
  FDRE \trunc_ln18_4_reg_6690_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_4_reg_6690_reg[3]_i_1_n_11 ),
        .Q(trunc_ln18_4_reg_6690[0]),
        .R(1'b0));
  FDRE \trunc_ln18_4_reg_6690_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_4_reg_6690_reg[3]_i_1_n_10 ),
        .Q(trunc_ln18_4_reg_6690[1]),
        .R(1'b0));
  FDRE \trunc_ln18_4_reg_6690_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_4_reg_6690_reg[3]_i_1_n_9 ),
        .Q(trunc_ln18_4_reg_6690[2]),
        .R(1'b0));
  FDRE \trunc_ln18_4_reg_6690_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_4_reg_6690_reg[3]_i_1_n_4 ),
        .Q(trunc_ln18_4_reg_6690[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_4_reg_6690_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_4_reg_6690_reg[3]_i_1_n_4 ,\NLW_trunc_ln18_4_reg_6690_reg[3]_i_1_CO_UNCONNECTED [2],\trunc_ln18_4_reg_6690_reg[3]_i_1_n_6 ,\trunc_ln18_4_reg_6690_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_207_reg_6619[2:0]}),
        .O({\NLW_trunc_ln18_4_reg_6690_reg[3]_i_1_O_UNCONNECTED [3],\trunc_ln18_4_reg_6690_reg[3]_i_1_n_9 ,\trunc_ln18_4_reg_6690_reg[3]_i_1_n_10 ,\trunc_ln18_4_reg_6690_reg[3]_i_1_n_11 }),
        .S({1'b1,\trunc_ln18_4_reg_6690[3]_i_2_n_4 ,\trunc_ln18_4_reg_6690[3]_i_3_n_4 ,\trunc_ln18_4_reg_6690[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[35]_i_2 
       (.I0(zext_ln23_5_fu_4540_p1[35]),
        .I1(zext_ln23_5_fu_4540_p1[27]),
        .O(\trunc_ln18_5_reg_6766[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[35]_i_3 
       (.I0(zext_ln23_5_fu_4540_p1[34]),
        .I1(zext_ln23_5_fu_4540_p1[26]),
        .O(\trunc_ln18_5_reg_6766[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[35]_i_4 
       (.I0(zext_ln23_5_fu_4540_p1[33]),
        .I1(zext_ln23_5_fu_4540_p1[25]),
        .O(\trunc_ln18_5_reg_6766[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[35]_i_5 
       (.I0(zext_ln23_5_fu_4540_p1[32]),
        .I1(zext_ln23_5_fu_4540_p1[24]),
        .O(\trunc_ln18_5_reg_6766[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[3]_i_2 
       (.I0(zext_ln23_5_fu_4540_p1[3]),
        .I1(trunc_ln18_4_reg_6690[3]),
        .O(\trunc_ln18_5_reg_6766[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[3]_i_3 
       (.I0(zext_ln23_5_fu_4540_p1[2]),
        .I1(trunc_ln18_4_reg_6690[2]),
        .O(\trunc_ln18_5_reg_6766[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[3]_i_4 
       (.I0(zext_ln23_5_fu_4540_p1[1]),
        .I1(trunc_ln18_4_reg_6690[1]),
        .O(\trunc_ln18_5_reg_6766[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_5_reg_6766[3]_i_5 
       (.I0(zext_ln23_5_fu_4540_p1[0]),
        .I1(trunc_ln18_4_reg_6690[0]),
        .O(\trunc_ln18_5_reg_6766[3]_i_5_n_4 ));
  FDRE \trunc_ln18_5_reg_6766_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[0]),
        .Q(trunc_ln18_5_reg_6766[0]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[1]),
        .Q(trunc_ln18_5_reg_6766[1]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[2]),
        .Q(trunc_ln18_5_reg_6766[2]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[32]),
        .Q(trunc_ln18_5_reg_6766[32]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[33]),
        .Q(trunc_ln18_5_reg_6766[33]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[34]),
        .Q(trunc_ln18_5_reg_6766[34]),
        .R(1'b0));
  FDRE \trunc_ln18_5_reg_6766_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[35]),
        .Q(trunc_ln18_5_reg_6766[35]),
        .R(1'b0));
  CARRY4 \trunc_ln18_5_reg_6766_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_5_reg_6766_reg[35]_i_1_n_4 ,\trunc_ln18_5_reg_6766_reg[35]_i_1_n_5 ,\trunc_ln18_5_reg_6766_reg[35]_i_1_n_6 ,\trunc_ln18_5_reg_6766_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_5_fu_4540_p1[35:32]),
        .O(trunc_ln18_5_fu_4556_p1[35:32]),
        .S({\trunc_ln18_5_reg_6766[35]_i_2_n_4 ,\trunc_ln18_5_reg_6766[35]_i_3_n_4 ,\trunc_ln18_5_reg_6766[35]_i_4_n_4 ,\trunc_ln18_5_reg_6766[35]_i_5_n_4 }));
  FDRE \trunc_ln18_5_reg_6766_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[36]),
        .Q(trunc_ln18_5_reg_6766[36]),
        .R(1'b0));
  CARRY4 \trunc_ln18_5_reg_6766_reg[36]_i_1 
       (.CI(\trunc_ln18_5_reg_6766_reg[35]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_5_reg_6766_reg[36]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_5_fu_4556_p1[36]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_5_reg_6766_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \trunc_ln18_5_reg_6766_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[3]),
        .Q(trunc_ln18_5_reg_6766[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_5_reg_6766_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_5_reg_6766_reg[3]_i_1_n_4 ,\trunc_ln18_5_reg_6766_reg[3]_i_1_n_5 ,\trunc_ln18_5_reg_6766_reg[3]_i_1_n_6 ,\trunc_ln18_5_reg_6766_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_5_fu_4540_p1[3:0]),
        .O(trunc_ln18_5_fu_4556_p1[3:0]),
        .S({\trunc_ln18_5_reg_6766[3]_i_2_n_4 ,\trunc_ln18_5_reg_6766[3]_i_3_n_4 ,\trunc_ln18_5_reg_6766[3]_i_4_n_4 ,\trunc_ln18_5_reg_6766[3]_i_5_n_4 }));
  FDRE \trunc_ln18_5_reg_6766_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_5_fu_4556_p1[4]),
        .Q(trunc_ln18_5_reg_6766[4]),
        .R(1'b0));
  CARRY4 \trunc_ln18_5_reg_6766_reg[4]_i_1 
       (.CI(\trunc_ln18_5_reg_6766_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_5_reg_6766_reg[4]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_5_fu_4556_p1[4]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_5_reg_6766_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_6_reg_6736[3]_i_2 
       (.I0(tmp_279_reg_6629[2]),
        .I1(add_ln18_3_reg_6624[2]),
        .O(\trunc_ln18_6_reg_6736[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_6_reg_6736[3]_i_3 
       (.I0(tmp_279_reg_6629[1]),
        .I1(add_ln18_3_reg_6624[1]),
        .O(\trunc_ln18_6_reg_6736[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_6_reg_6736[3]_i_4 
       (.I0(tmp_279_reg_6629[0]),
        .I1(add_ln18_3_reg_6624[0]),
        .O(\trunc_ln18_6_reg_6736[3]_i_4_n_4 ));
  FDRE \trunc_ln18_6_reg_6736_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_6_reg_6736_reg[3]_i_1_n_11 ),
        .Q(trunc_ln18_6_reg_6736[0]),
        .R(1'b0));
  FDRE \trunc_ln18_6_reg_6736_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_6_reg_6736_reg[3]_i_1_n_10 ),
        .Q(trunc_ln18_6_reg_6736[1]),
        .R(1'b0));
  FDRE \trunc_ln18_6_reg_6736_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_6_reg_6736_reg[3]_i_1_n_9 ),
        .Q(trunc_ln18_6_reg_6736[2]),
        .R(1'b0));
  FDRE \trunc_ln18_6_reg_6736_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage2),
        .D(\trunc_ln18_6_reg_6736_reg[3]_i_1_n_4 ),
        .Q(trunc_ln18_6_reg_6736[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_6_reg_6736_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_6_reg_6736_reg[3]_i_1_n_4 ,\NLW_trunc_ln18_6_reg_6736_reg[3]_i_1_CO_UNCONNECTED [2],\trunc_ln18_6_reg_6736_reg[3]_i_1_n_6 ,\trunc_ln18_6_reg_6736_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_279_reg_6629[2:0]}),
        .O({\NLW_trunc_ln18_6_reg_6736_reg[3]_i_1_O_UNCONNECTED [3],\trunc_ln18_6_reg_6736_reg[3]_i_1_n_9 ,\trunc_ln18_6_reg_6736_reg[3]_i_1_n_10 ,\trunc_ln18_6_reg_6736_reg[3]_i_1_n_11 }),
        .S({1'b1,\trunc_ln18_6_reg_6736[3]_i_2_n_4 ,\trunc_ln18_6_reg_6736[3]_i_3_n_4 ,\trunc_ln18_6_reg_6736[3]_i_4_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[35]_i_2 
       (.I0(zext_ln23_7_fu_4624_p1[35]),
        .I1(zext_ln23_7_fu_4624_p1[27]),
        .O(\trunc_ln18_7_reg_6776[35]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[35]_i_3 
       (.I0(zext_ln23_7_fu_4624_p1[34]),
        .I1(zext_ln23_7_fu_4624_p1[26]),
        .O(\trunc_ln18_7_reg_6776[35]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[35]_i_4 
       (.I0(zext_ln23_7_fu_4624_p1[33]),
        .I1(zext_ln23_7_fu_4624_p1[25]),
        .O(\trunc_ln18_7_reg_6776[35]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[35]_i_5 
       (.I0(zext_ln23_7_fu_4624_p1[32]),
        .I1(zext_ln23_7_fu_4624_p1[24]),
        .O(\trunc_ln18_7_reg_6776[35]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[3]_i_2 
       (.I0(zext_ln23_7_fu_4624_p1[3]),
        .I1(trunc_ln18_6_reg_6736[3]),
        .O(\trunc_ln18_7_reg_6776[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[3]_i_3 
       (.I0(zext_ln23_7_fu_4624_p1[2]),
        .I1(trunc_ln18_6_reg_6736[2]),
        .O(\trunc_ln18_7_reg_6776[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[3]_i_4 
       (.I0(zext_ln23_7_fu_4624_p1[1]),
        .I1(trunc_ln18_6_reg_6736[1]),
        .O(\trunc_ln18_7_reg_6776[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_7_reg_6776[3]_i_5 
       (.I0(zext_ln23_7_fu_4624_p1[0]),
        .I1(trunc_ln18_6_reg_6736[0]),
        .O(\trunc_ln18_7_reg_6776[3]_i_5_n_4 ));
  FDRE \trunc_ln18_7_reg_6776_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[0]),
        .Q(trunc_ln18_7_reg_6776[0]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[1]),
        .Q(trunc_ln18_7_reg_6776[1]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[2]),
        .Q(trunc_ln18_7_reg_6776[2]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[32]),
        .Q(trunc_ln18_7_reg_6776[32]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[33]),
        .Q(trunc_ln18_7_reg_6776[33]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[34]),
        .Q(trunc_ln18_7_reg_6776[34]),
        .R(1'b0));
  FDRE \trunc_ln18_7_reg_6776_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[35]),
        .Q(trunc_ln18_7_reg_6776[35]),
        .R(1'b0));
  CARRY4 \trunc_ln18_7_reg_6776_reg[35]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_7_reg_6776_reg[35]_i_1_n_4 ,\trunc_ln18_7_reg_6776_reg[35]_i_1_n_5 ,\trunc_ln18_7_reg_6776_reg[35]_i_1_n_6 ,\trunc_ln18_7_reg_6776_reg[35]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_7_fu_4624_p1[35:32]),
        .O(trunc_ln18_7_fu_4640_p1[35:32]),
        .S({\trunc_ln18_7_reg_6776[35]_i_2_n_4 ,\trunc_ln18_7_reg_6776[35]_i_3_n_4 ,\trunc_ln18_7_reg_6776[35]_i_4_n_4 ,\trunc_ln18_7_reg_6776[35]_i_5_n_4 }));
  FDRE \trunc_ln18_7_reg_6776_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[36]),
        .Q(trunc_ln18_7_reg_6776[36]),
        .R(1'b0));
  CARRY4 \trunc_ln18_7_reg_6776_reg[36]_i_1 
       (.CI(\trunc_ln18_7_reg_6776_reg[35]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_7_reg_6776_reg[36]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_7_fu_4640_p1[36]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_7_reg_6776_reg[36]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \trunc_ln18_7_reg_6776_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[3]),
        .Q(trunc_ln18_7_reg_6776[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_7_reg_6776_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_7_reg_6776_reg[3]_i_1_n_4 ,\trunc_ln18_7_reg_6776_reg[3]_i_1_n_5 ,\trunc_ln18_7_reg_6776_reg[3]_i_1_n_6 ,\trunc_ln18_7_reg_6776_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(zext_ln23_7_fu_4624_p1[3:0]),
        .O(trunc_ln18_7_fu_4640_p1[3:0]),
        .S({\trunc_ln18_7_reg_6776[3]_i_2_n_4 ,\trunc_ln18_7_reg_6776[3]_i_3_n_4 ,\trunc_ln18_7_reg_6776[3]_i_4_n_4 ,\trunc_ln18_7_reg_6776[3]_i_5_n_4 }));
  FDRE \trunc_ln18_7_reg_6776_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(trunc_ln18_7_fu_4640_p1[4]),
        .Q(trunc_ln18_7_reg_6776[4]),
        .R(1'b0));
  CARRY4 \trunc_ln18_7_reg_6776_reg[4]_i_1 
       (.CI(\trunc_ln18_7_reg_6776_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln18_7_reg_6776_reg[4]_i_1_CO_UNCONNECTED [3:1],trunc_ln18_7_fu_4640_p1[4]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_trunc_ln18_7_reg_6776_reg[4]_i_1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_reg_6558[3]_i_2 
       (.I0(add_ln18_reg_6127[2]),
        .I1(tmp_63_reg_6122[2]),
        .O(\trunc_ln18_reg_6558[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_reg_6558[3]_i_3 
       (.I0(add_ln18_reg_6127[1]),
        .I1(tmp_63_reg_6122[1]),
        .O(\trunc_ln18_reg_6558[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln18_reg_6558[3]_i_4 
       (.I0(add_ln18_reg_6127[0]),
        .I1(tmp_63_reg_6122[0]),
        .O(\trunc_ln18_reg_6558[3]_i_4_n_4 ));
  FDRE \trunc_ln18_reg_6558_reg[0] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_reg_6558_reg[3]_i_1_n_11 ),
        .Q(trunc_ln18_reg_6558[0]),
        .R(1'b0));
  FDRE \trunc_ln18_reg_6558_reg[1] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_reg_6558_reg[3]_i_1_n_10 ),
        .Q(trunc_ln18_reg_6558[1]),
        .R(1'b0));
  FDRE \trunc_ln18_reg_6558_reg[2] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_reg_6558_reg[3]_i_1_n_9 ),
        .Q(trunc_ln18_reg_6558[2]),
        .R(1'b0));
  FDRE \trunc_ln18_reg_6558_reg[3] 
       (.C(ap_clk),
        .CE(Q),
        .D(\trunc_ln18_reg_6558_reg[3]_i_1_n_4 ),
        .Q(trunc_ln18_reg_6558[3]),
        .R(1'b0));
  CARRY4 \trunc_ln18_reg_6558_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln18_reg_6558_reg[3]_i_1_n_4 ,\NLW_trunc_ln18_reg_6558_reg[3]_i_1_CO_UNCONNECTED [2],\trunc_ln18_reg_6558_reg[3]_i_1_n_6 ,\trunc_ln18_reg_6558_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,add_ln18_reg_6127[2:0]}),
        .O({\NLW_trunc_ln18_reg_6558_reg[3]_i_1_O_UNCONNECTED [3],\trunc_ln18_reg_6558_reg[3]_i_1_n_9 ,\trunc_ln18_reg_6558_reg[3]_i_1_n_10 ,\trunc_ln18_reg_6558_reg[3]_i_1_n_11 }),
        .S({1'b1,\trunc_ln18_reg_6558[3]_i_2_n_4 ,\trunc_ln18_reg_6558[3]_i_3_n_4 ,\trunc_ln18_reg_6558[3]_i_4_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_1_reg_5696[1]_i_2 
       (.I0(reg_689[3]),
        .O(\trunc_ln21_1_reg_5696[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_1_reg_5696[1]_i_3 
       (.I0(reg_689[2]),
        .I1(tmp_102_reg_5407),
        .O(\trunc_ln21_1_reg_5696[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_1_reg_5696[1]_i_4 
       (.I0(reg_689[1]),
        .O(\trunc_ln21_1_reg_5696[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_1_reg_5696[1]_i_5 
       (.I0(reg_689[0]),
        .I1(tmp_103_reg_5412),
        .O(\trunc_ln21_1_reg_5696[1]_i_5_n_4 ));
  FDRE \trunc_ln21_1_reg_5696_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln21_1_reg_5696_reg[1]_i_1_n_11 ),
        .Q(and_ln21_2_cast_fu_2469_p31[0]),
        .R(1'b0));
  FDRE \trunc_ln21_1_reg_5696_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln21_1_reg_5696_reg[1]_i_1_n_10 ),
        .Q(and_ln21_2_cast_fu_2469_p31[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \trunc_ln21_1_reg_5696_reg[1]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln21_1_reg_5696_reg[1]_i_1_n_4 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_5 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_6 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_7 }),
        .CYINIT(1'b1),
        .DI(reg_689[3:0]),
        .O({\trunc_ln21_1_reg_5696_reg[1]_i_1_n_8 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_9 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_10 ,\trunc_ln21_1_reg_5696_reg[1]_i_1_n_11 }),
        .S({\trunc_ln21_1_reg_5696[1]_i_2_n_4 ,\trunc_ln21_1_reg_5696[1]_i_3_n_4 ,\trunc_ln21_1_reg_5696[1]_i_4_n_4 ,\trunc_ln21_1_reg_5696[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_2_reg_6231[1]_i_2 
       (.I0(tmp_174_reg_5952),
        .O(p_1_out[2]));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_2_reg_6231[1]_i_3 
       (.I0(diff_2_reg_5797[2]),
        .I1(tmp_174_reg_5952),
        .O(\trunc_ln21_2_reg_6231[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_2_reg_6231[1]_i_4 
       (.I0(tmp_175_reg_5957),
        .O(p_1_out[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_2_reg_6231[1]_i_5 
       (.I0(diff_2_reg_5797[0]),
        .I1(tmp_175_reg_5957),
        .O(\trunc_ln21_2_reg_6231[1]_i_5_n_4 ));
  FDRE \trunc_ln21_2_reg_6231_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_2_reg_6231_reg[1]_i_1_n_11 ),
        .Q(and_ln21_4_cast_fu_3704_p31[0]),
        .R(1'b0));
  FDRE \trunc_ln21_2_reg_6231_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_2_reg_6231_reg[1]_i_1_n_10 ),
        .Q(and_ln21_4_cast_fu_3704_p31[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \trunc_ln21_2_reg_6231_reg[1]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln21_2_reg_6231_reg[1]_i_1_n_4 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_5 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_6 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_7 }),
        .CYINIT(1'b1),
        .DI({tmp_174_reg_5952,diff_2_reg_5797[2],tmp_175_reg_5957,diff_2_reg_5797[0]}),
        .O({\trunc_ln21_2_reg_6231_reg[1]_i_1_n_8 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_9 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_10 ,\trunc_ln21_2_reg_6231_reg[1]_i_1_n_11 }),
        .S({p_1_out[2],\trunc_ln21_2_reg_6231[1]_i_3_n_4 ,p_1_out[0],\trunc_ln21_2_reg_6231[1]_i_5_n_4 }));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_3_reg_6421[1]_i_2 
       (.I0(reg_689[3]),
        .O(\trunc_ln21_3_reg_6421[1]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_3_reg_6421[1]_i_3 
       (.I0(reg_689[2]),
        .I1(tmp_246_reg_6112),
        .O(\trunc_ln21_3_reg_6421[1]_i_3_n_4 ));
  LUT1 #(
    .INIT(2'h1)) 
    \trunc_ln21_3_reg_6421[1]_i_4 
       (.I0(reg_689[1]),
        .O(\trunc_ln21_3_reg_6421[1]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h9)) 
    \trunc_ln21_3_reg_6421[1]_i_5 
       (.I0(reg_689[0]),
        .I1(tmp_247_reg_6117),
        .O(\trunc_ln21_3_reg_6421[1]_i_5_n_4 ));
  FDRE \trunc_ln21_3_reg_6421_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_3_reg_6421_reg[1]_i_1_n_11 ),
        .Q(and_ln21_6_cast_fu_3932_p31[0]),
        .R(1'b0));
  FDRE \trunc_ln21_3_reg_6421_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln21_3_reg_6421_reg[1]_i_1_n_10 ),
        .Q(and_ln21_6_cast_fu_3932_p31[1]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \trunc_ln21_3_reg_6421_reg[1]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln21_3_reg_6421_reg[1]_i_1_n_4 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_5 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_6 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_7 }),
        .CYINIT(1'b1),
        .DI(reg_689[3:0]),
        .O({\trunc_ln21_3_reg_6421_reg[1]_i_1_n_8 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_9 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_10 ,\trunc_ln21_3_reg_6421_reg[1]_i_1_n_11 }),
        .S({\trunc_ln21_3_reg_6421[1]_i_2_n_4 ,\trunc_ln21_3_reg_6421[1]_i_3_n_4 ,\trunc_ln21_3_reg_6421[1]_i_4_n_4 ,\trunc_ln21_3_reg_6421[1]_i_5_n_4 }));
  FDRE \trunc_ln21_reg_5506_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry_n_11),
        .Q(zext_ln21_fu_2290_p1[0]),
        .R(1'b0));
  FDRE \trunc_ln21_reg_5506_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(sub_ln20_fu_1184_p2_carry_n_10),
        .Q(zext_ln21_fu_2290_p1[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_1_reg_6751[3]_i_2 
       (.I0(tmp_71_reg_6639[35]),
        .I1(trunc_ln18_1_reg_6634[35]),
        .O(\trunc_ln25_1_reg_6751[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_1_reg_6751[3]_i_3 
       (.I0(tmp_71_reg_6639[34]),
        .I1(trunc_ln18_1_reg_6634[34]),
        .O(\trunc_ln25_1_reg_6751[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_1_reg_6751[3]_i_4 
       (.I0(tmp_71_reg_6639[33]),
        .I1(trunc_ln18_1_reg_6634[33]),
        .O(\trunc_ln25_1_reg_6751[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_1_reg_6751[3]_i_5 
       (.I0(tmp_71_reg_6639[32]),
        .I1(trunc_ln18_1_reg_6634[32]),
        .O(\trunc_ln25_1_reg_6751[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_1_reg_6751[5]_i_2 
       (.I0(tmp_71_reg_6639[36]),
        .I1(trunc_ln18_1_reg_6634[36]),
        .O(\trunc_ln25_1_reg_6751[5]_i_2_n_4 ));
  FDRE \trunc_ln25_1_reg_6751_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_1_reg_6751[0]),
        .R(1'b0));
  FDRE \trunc_ln25_1_reg_6751_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_1_reg_6751[1]),
        .R(1'b0));
  FDRE \trunc_ln25_1_reg_6751_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_1_reg_6751[2]),
        .R(1'b0));
  FDRE \trunc_ln25_1_reg_6751_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_1_reg_6751[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_1_reg_6751_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_1_reg_6751_reg[3]_i_1_n_4 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_5 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_6 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_71_reg_6639[35:32]),
        .O({\trunc_ln25_1_reg_6751_reg[3]_i_1_n_8 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_9 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_10 ,\trunc_ln25_1_reg_6751_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_1_reg_6751[3]_i_2_n_4 ,\trunc_ln25_1_reg_6751[3]_i_3_n_4 ,\trunc_ln25_1_reg_6751[3]_i_4_n_4 ,\trunc_ln25_1_reg_6751[3]_i_5_n_4 }));
  FDRE \trunc_ln25_1_reg_6751_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_1_reg_6751[4]),
        .R(1'b0));
  FDRE \trunc_ln25_1_reg_6751_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_1_reg_6751_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_1_reg_6751[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_1_reg_6751_reg[5]_i_1 
       (.CI(\trunc_ln25_1_reg_6751_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_1_reg_6751_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_1_reg_6751_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_1_reg_6751_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_71_reg_6639[36]}),
        .O({\NLW_trunc_ln25_1_reg_6751_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_1_reg_6751_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_1_reg_6751[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_2_reg_6756[3]_i_2 
       (.I0(tmp_143_reg_6649[3]),
        .I1(trunc_ln18_3_reg_6644[3]),
        .O(\trunc_ln25_2_reg_6756[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_2_reg_6756[3]_i_3 
       (.I0(tmp_143_reg_6649[2]),
        .I1(trunc_ln18_3_reg_6644[2]),
        .O(\trunc_ln25_2_reg_6756[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_2_reg_6756[3]_i_4 
       (.I0(tmp_143_reg_6649[1]),
        .I1(trunc_ln18_3_reg_6644[1]),
        .O(\trunc_ln25_2_reg_6756[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_2_reg_6756[3]_i_5 
       (.I0(tmp_143_reg_6649[0]),
        .I1(trunc_ln18_3_reg_6644[0]),
        .O(\trunc_ln25_2_reg_6756[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_2_reg_6756[5]_i_2 
       (.I0(tmp_143_reg_6649[4]),
        .I1(trunc_ln18_3_reg_6644[4]),
        .O(\trunc_ln25_2_reg_6756[5]_i_2_n_4 ));
  FDRE \trunc_ln25_2_reg_6756_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_2_reg_6756[0]),
        .R(1'b0));
  FDRE \trunc_ln25_2_reg_6756_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_2_reg_6756[1]),
        .R(1'b0));
  FDRE \trunc_ln25_2_reg_6756_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_2_reg_6756[2]),
        .R(1'b0));
  FDRE \trunc_ln25_2_reg_6756_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_2_reg_6756[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_2_reg_6756_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_2_reg_6756_reg[3]_i_1_n_4 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_5 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_6 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_143_reg_6649[3:0]),
        .O({\trunc_ln25_2_reg_6756_reg[3]_i_1_n_8 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_9 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_10 ,\trunc_ln25_2_reg_6756_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_2_reg_6756[3]_i_2_n_4 ,\trunc_ln25_2_reg_6756[3]_i_3_n_4 ,\trunc_ln25_2_reg_6756[3]_i_4_n_4 ,\trunc_ln25_2_reg_6756[3]_i_5_n_4 }));
  FDRE \trunc_ln25_2_reg_6756_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_2_reg_6756[4]),
        .R(1'b0));
  FDRE \trunc_ln25_2_reg_6756_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_2_reg_6756_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_2_reg_6756[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_2_reg_6756_reg[5]_i_1 
       (.CI(\trunc_ln25_2_reg_6756_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_2_reg_6756_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_2_reg_6756_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_2_reg_6756_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_143_reg_6649[4]}),
        .O({\NLW_trunc_ln25_2_reg_6756_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_2_reg_6756_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_2_reg_6756[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_3_reg_6761[3]_i_2 
       (.I0(tmp_143_reg_6649[35]),
        .I1(trunc_ln18_3_reg_6644[35]),
        .O(\trunc_ln25_3_reg_6761[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_3_reg_6761[3]_i_3 
       (.I0(tmp_143_reg_6649[34]),
        .I1(trunc_ln18_3_reg_6644[34]),
        .O(\trunc_ln25_3_reg_6761[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_3_reg_6761[3]_i_4 
       (.I0(tmp_143_reg_6649[33]),
        .I1(trunc_ln18_3_reg_6644[33]),
        .O(\trunc_ln25_3_reg_6761[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_3_reg_6761[3]_i_5 
       (.I0(tmp_143_reg_6649[32]),
        .I1(trunc_ln18_3_reg_6644[32]),
        .O(\trunc_ln25_3_reg_6761[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_3_reg_6761[5]_i_2 
       (.I0(tmp_143_reg_6649[36]),
        .I1(trunc_ln18_3_reg_6644[36]),
        .O(\trunc_ln25_3_reg_6761[5]_i_2_n_4 ));
  FDRE \trunc_ln25_3_reg_6761_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_3_reg_6761[0]),
        .R(1'b0));
  FDRE \trunc_ln25_3_reg_6761_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_3_reg_6761[1]),
        .R(1'b0));
  FDRE \trunc_ln25_3_reg_6761_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_3_reg_6761[2]),
        .R(1'b0));
  FDRE \trunc_ln25_3_reg_6761_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_3_reg_6761[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_3_reg_6761_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_3_reg_6761_reg[3]_i_1_n_4 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_5 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_6 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_143_reg_6649[35:32]),
        .O({\trunc_ln25_3_reg_6761_reg[3]_i_1_n_8 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_9 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_10 ,\trunc_ln25_3_reg_6761_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_3_reg_6761[3]_i_2_n_4 ,\trunc_ln25_3_reg_6761[3]_i_3_n_4 ,\trunc_ln25_3_reg_6761[3]_i_4_n_4 ,\trunc_ln25_3_reg_6761[3]_i_5_n_4 }));
  FDRE \trunc_ln25_3_reg_6761_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_3_reg_6761[4]),
        .R(1'b0));
  FDRE \trunc_ln25_3_reg_6761_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_3_reg_6761_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_3_reg_6761[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_3_reg_6761_reg[5]_i_1 
       (.CI(\trunc_ln25_3_reg_6761_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_3_reg_6761_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_3_reg_6761_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_3_reg_6761_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_143_reg_6649[36]}),
        .O({\NLW_trunc_ln25_3_reg_6761_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_3_reg_6761_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_3_reg_6761[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_4_reg_6801[3]_i_2 
       (.I0(tmp_215_reg_6771[3]),
        .I1(trunc_ln18_5_reg_6766[3]),
        .O(\trunc_ln25_4_reg_6801[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_4_reg_6801[3]_i_3 
       (.I0(tmp_215_reg_6771[2]),
        .I1(trunc_ln18_5_reg_6766[2]),
        .O(\trunc_ln25_4_reg_6801[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_4_reg_6801[3]_i_4 
       (.I0(tmp_215_reg_6771[1]),
        .I1(trunc_ln18_5_reg_6766[1]),
        .O(\trunc_ln25_4_reg_6801[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_4_reg_6801[3]_i_5 
       (.I0(tmp_215_reg_6771[0]),
        .I1(trunc_ln18_5_reg_6766[0]),
        .O(\trunc_ln25_4_reg_6801[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_4_reg_6801[5]_i_2 
       (.I0(tmp_215_reg_6771[4]),
        .I1(trunc_ln18_5_reg_6766[4]),
        .O(\trunc_ln25_4_reg_6801[5]_i_2_n_4 ));
  FDRE \trunc_ln25_4_reg_6801_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_4_reg_6801[0]),
        .R(1'b0));
  FDRE \trunc_ln25_4_reg_6801_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_4_reg_6801[1]),
        .R(1'b0));
  FDRE \trunc_ln25_4_reg_6801_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_4_reg_6801[2]),
        .R(1'b0));
  FDRE \trunc_ln25_4_reg_6801_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_4_reg_6801[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_4_reg_6801_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_4_reg_6801_reg[3]_i_1_n_4 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_5 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_6 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_215_reg_6771[3:0]),
        .O({\trunc_ln25_4_reg_6801_reg[3]_i_1_n_8 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_9 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_10 ,\trunc_ln25_4_reg_6801_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_4_reg_6801[3]_i_2_n_4 ,\trunc_ln25_4_reg_6801[3]_i_3_n_4 ,\trunc_ln25_4_reg_6801[3]_i_4_n_4 ,\trunc_ln25_4_reg_6801[3]_i_5_n_4 }));
  FDRE \trunc_ln25_4_reg_6801_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_4_reg_6801[4]),
        .R(1'b0));
  FDRE \trunc_ln25_4_reg_6801_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_4_reg_6801_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_4_reg_6801[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_4_reg_6801_reg[5]_i_1 
       (.CI(\trunc_ln25_4_reg_6801_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_4_reg_6801_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_4_reg_6801_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_4_reg_6801_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_215_reg_6771[4]}),
        .O({\NLW_trunc_ln25_4_reg_6801_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_4_reg_6801_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_4_reg_6801[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_5_reg_6806[3]_i_2 
       (.I0(tmp_215_reg_6771[35]),
        .I1(trunc_ln18_5_reg_6766[35]),
        .O(\trunc_ln25_5_reg_6806[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_5_reg_6806[3]_i_3 
       (.I0(tmp_215_reg_6771[34]),
        .I1(trunc_ln18_5_reg_6766[34]),
        .O(\trunc_ln25_5_reg_6806[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_5_reg_6806[3]_i_4 
       (.I0(tmp_215_reg_6771[33]),
        .I1(trunc_ln18_5_reg_6766[33]),
        .O(\trunc_ln25_5_reg_6806[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_5_reg_6806[3]_i_5 
       (.I0(tmp_215_reg_6771[32]),
        .I1(trunc_ln18_5_reg_6766[32]),
        .O(\trunc_ln25_5_reg_6806[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_5_reg_6806[5]_i_2 
       (.I0(tmp_215_reg_6771[36]),
        .I1(trunc_ln18_5_reg_6766[36]),
        .O(\trunc_ln25_5_reg_6806[5]_i_2_n_4 ));
  FDRE \trunc_ln25_5_reg_6806_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_5_reg_6806[0]),
        .R(1'b0));
  FDRE \trunc_ln25_5_reg_6806_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_5_reg_6806[1]),
        .R(1'b0));
  FDRE \trunc_ln25_5_reg_6806_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_5_reg_6806[2]),
        .R(1'b0));
  FDRE \trunc_ln25_5_reg_6806_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_5_reg_6806[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_5_reg_6806_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_5_reg_6806_reg[3]_i_1_n_4 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_5 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_6 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_215_reg_6771[35:32]),
        .O({\trunc_ln25_5_reg_6806_reg[3]_i_1_n_8 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_9 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_10 ,\trunc_ln25_5_reg_6806_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_5_reg_6806[3]_i_2_n_4 ,\trunc_ln25_5_reg_6806[3]_i_3_n_4 ,\trunc_ln25_5_reg_6806[3]_i_4_n_4 ,\trunc_ln25_5_reg_6806[3]_i_5_n_4 }));
  FDRE \trunc_ln25_5_reg_6806_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_5_reg_6806[4]),
        .R(1'b0));
  FDRE \trunc_ln25_5_reg_6806_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_5_reg_6806_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_5_reg_6806[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_5_reg_6806_reg[5]_i_1 
       (.CI(\trunc_ln25_5_reg_6806_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_5_reg_6806_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_5_reg_6806_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_5_reg_6806_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_215_reg_6771[36]}),
        .O({\NLW_trunc_ln25_5_reg_6806_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_5_reg_6806_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_5_reg_6806[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_6_reg_6811[3]_i_2 
       (.I0(tmp_287_reg_6781[3]),
        .I1(trunc_ln18_7_reg_6776[3]),
        .O(\trunc_ln25_6_reg_6811[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_6_reg_6811[3]_i_3 
       (.I0(tmp_287_reg_6781[2]),
        .I1(trunc_ln18_7_reg_6776[2]),
        .O(\trunc_ln25_6_reg_6811[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_6_reg_6811[3]_i_4 
       (.I0(tmp_287_reg_6781[1]),
        .I1(trunc_ln18_7_reg_6776[1]),
        .O(\trunc_ln25_6_reg_6811[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_6_reg_6811[3]_i_5 
       (.I0(tmp_287_reg_6781[0]),
        .I1(trunc_ln18_7_reg_6776[0]),
        .O(\trunc_ln25_6_reg_6811[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_6_reg_6811[5]_i_2 
       (.I0(tmp_287_reg_6781[4]),
        .I1(trunc_ln18_7_reg_6776[4]),
        .O(\trunc_ln25_6_reg_6811[5]_i_2_n_4 ));
  FDRE \trunc_ln25_6_reg_6811_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_6_reg_6811[0]),
        .R(1'b0));
  FDRE \trunc_ln25_6_reg_6811_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_6_reg_6811[1]),
        .R(1'b0));
  FDRE \trunc_ln25_6_reg_6811_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_6_reg_6811[2]),
        .R(1'b0));
  FDRE \trunc_ln25_6_reg_6811_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_6_reg_6811[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_6_reg_6811_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_6_reg_6811_reg[3]_i_1_n_4 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_5 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_6 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_287_reg_6781[3:0]),
        .O({\trunc_ln25_6_reg_6811_reg[3]_i_1_n_8 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_9 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_10 ,\trunc_ln25_6_reg_6811_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_6_reg_6811[3]_i_2_n_4 ,\trunc_ln25_6_reg_6811[3]_i_3_n_4 ,\trunc_ln25_6_reg_6811[3]_i_4_n_4 ,\trunc_ln25_6_reg_6811[3]_i_5_n_4 }));
  FDRE \trunc_ln25_6_reg_6811_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_6_reg_6811[4]),
        .R(1'b0));
  FDRE \trunc_ln25_6_reg_6811_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_6_reg_6811_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_6_reg_6811[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_6_reg_6811_reg[5]_i_1 
       (.CI(\trunc_ln25_6_reg_6811_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_6_reg_6811_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_6_reg_6811_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_6_reg_6811_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_287_reg_6781[4]}),
        .O({\NLW_trunc_ln25_6_reg_6811_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_6_reg_6811_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_6_reg_6811[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_7_reg_6816[3]_i_2 
       (.I0(tmp_287_reg_6781[35]),
        .I1(trunc_ln18_7_reg_6776[35]),
        .O(\trunc_ln25_7_reg_6816[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_7_reg_6816[3]_i_3 
       (.I0(tmp_287_reg_6781[34]),
        .I1(trunc_ln18_7_reg_6776[34]),
        .O(\trunc_ln25_7_reg_6816[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_7_reg_6816[3]_i_4 
       (.I0(tmp_287_reg_6781[33]),
        .I1(trunc_ln18_7_reg_6776[33]),
        .O(\trunc_ln25_7_reg_6816[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_7_reg_6816[3]_i_5 
       (.I0(tmp_287_reg_6781[32]),
        .I1(trunc_ln18_7_reg_6776[32]),
        .O(\trunc_ln25_7_reg_6816[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_7_reg_6816[5]_i_2 
       (.I0(tmp_287_reg_6781[36]),
        .I1(trunc_ln18_7_reg_6776[36]),
        .O(\trunc_ln25_7_reg_6816[5]_i_2_n_4 ));
  FDRE \trunc_ln25_7_reg_6816_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_7_reg_6816[0]),
        .R(1'b0));
  FDRE \trunc_ln25_7_reg_6816_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_7_reg_6816[1]),
        .R(1'b0));
  FDRE \trunc_ln25_7_reg_6816_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_7_reg_6816[2]),
        .R(1'b0));
  FDRE \trunc_ln25_7_reg_6816_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_7_reg_6816[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_7_reg_6816_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_7_reg_6816_reg[3]_i_1_n_4 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_5 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_6 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_287_reg_6781[35:32]),
        .O({\trunc_ln25_7_reg_6816_reg[3]_i_1_n_8 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_9 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_10 ,\trunc_ln25_7_reg_6816_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_7_reg_6816[3]_i_2_n_4 ,\trunc_ln25_7_reg_6816[3]_i_3_n_4 ,\trunc_ln25_7_reg_6816[3]_i_4_n_4 ,\trunc_ln25_7_reg_6816[3]_i_5_n_4 }));
  FDRE \trunc_ln25_7_reg_6816_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_7_reg_6816[4]),
        .R(1'b0));
  FDRE \trunc_ln25_7_reg_6816_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(\trunc_ln25_7_reg_6816_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_7_reg_6816[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_7_reg_6816_reg[5]_i_1 
       (.CI(\trunc_ln25_7_reg_6816_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_7_reg_6816_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_7_reg_6816_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_7_reg_6816_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_287_reg_6781[36]}),
        .O({\NLW_trunc_ln25_7_reg_6816_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_7_reg_6816_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_7_reg_6816[5]_i_2_n_4 }));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_reg_6746[3]_i_2 
       (.I0(tmp_71_reg_6639[3]),
        .I1(trunc_ln18_1_reg_6634[3]),
        .O(\trunc_ln25_reg_6746[3]_i_2_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_reg_6746[3]_i_3 
       (.I0(tmp_71_reg_6639[2]),
        .I1(trunc_ln18_1_reg_6634[2]),
        .O(\trunc_ln25_reg_6746[3]_i_3_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_reg_6746[3]_i_4 
       (.I0(tmp_71_reg_6639[1]),
        .I1(trunc_ln18_1_reg_6634[1]),
        .O(\trunc_ln25_reg_6746[3]_i_4_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_reg_6746[3]_i_5 
       (.I0(tmp_71_reg_6639[0]),
        .I1(trunc_ln18_1_reg_6634[0]),
        .O(\trunc_ln25_reg_6746[3]_i_5_n_4 ));
  LUT2 #(
    .INIT(4'h6)) 
    \trunc_ln25_reg_6746[5]_i_2 
       (.I0(tmp_71_reg_6639[4]),
        .I1(trunc_ln18_1_reg_6634[4]),
        .O(\trunc_ln25_reg_6746[5]_i_2_n_4 ));
  FDRE \trunc_ln25_reg_6746_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[3]_i_1_n_11 ),
        .Q(trunc_ln25_reg_6746[0]),
        .R(1'b0));
  FDRE \trunc_ln25_reg_6746_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[3]_i_1_n_10 ),
        .Q(trunc_ln25_reg_6746[1]),
        .R(1'b0));
  FDRE \trunc_ln25_reg_6746_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[3]_i_1_n_9 ),
        .Q(trunc_ln25_reg_6746[2]),
        .R(1'b0));
  FDRE \trunc_ln25_reg_6746_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[3]_i_1_n_8 ),
        .Q(trunc_ln25_reg_6746[3]),
        .R(1'b0));
  CARRY4 \trunc_ln25_reg_6746_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\trunc_ln25_reg_6746_reg[3]_i_1_n_4 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_5 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_6 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI(tmp_71_reg_6639[3:0]),
        .O({\trunc_ln25_reg_6746_reg[3]_i_1_n_8 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_9 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_10 ,\trunc_ln25_reg_6746_reg[3]_i_1_n_11 }),
        .S({\trunc_ln25_reg_6746[3]_i_2_n_4 ,\trunc_ln25_reg_6746[3]_i_3_n_4 ,\trunc_ln25_reg_6746[3]_i_4_n_4 ,\trunc_ln25_reg_6746[3]_i_5_n_4 }));
  FDRE \trunc_ln25_reg_6746_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[5]_i_1_n_11 ),
        .Q(trunc_ln25_reg_6746[4]),
        .R(1'b0));
  FDRE \trunc_ln25_reg_6746_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(\trunc_ln25_reg_6746_reg[5]_i_1_n_6 ),
        .Q(trunc_ln25_reg_6746[5]),
        .R(1'b0));
  CARRY4 \trunc_ln25_reg_6746_reg[5]_i_1 
       (.CI(\trunc_ln25_reg_6746_reg[3]_i_1_n_4 ),
        .CO({\NLW_trunc_ln25_reg_6746_reg[5]_i_1_CO_UNCONNECTED [3:2],\trunc_ln25_reg_6746_reg[5]_i_1_n_6 ,\NLW_trunc_ln25_reg_6746_reg[5]_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,tmp_71_reg_6639[4]}),
        .O({\NLW_trunc_ln25_reg_6746_reg[5]_i_1_O_UNCONNECTED [3:1],\trunc_ln25_reg_6746_reg[5]_i_1_n_11 }),
        .S({1'b0,1'b0,1'b1,\trunc_ln25_reg_6746[5]_i_2_n_4 }));
endmodule

(* ORIG_REF_NAME = "DigitRec_DigitRec_Pipeline_VITIS_LOOP_69_1" *) 
module bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_VITIS_LOOP_69_1
   (D,
    p_0_in,
    E,
    \p_load_reg_78_reg[0] ,
    \p_load_reg_78_reg[1] ,
    \p_load_reg_78_reg[2] ,
    \p_load_reg_78_reg[3] ,
    d0,
    \ap_CS_fsm_reg[5] ,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg,
    Q,
    \tmp_reg_130_reg[3]_0 ,
    \tmp_reg_130_reg[3]_1 ,
    \tmp_reg_130_reg[3]_2 ,
    ap_enable_reg_pp0_iter1,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg,
    grp_DigitRec_Pipeline_3_fu_172_votes_address0,
    \votes_load_reg_140_reg[31]_0 );
  output [1:0]D;
  output p_0_in;
  output [0:0]E;
  output \p_load_reg_78_reg[0] ;
  output \p_load_reg_78_reg[1] ;
  output \p_load_reg_78_reg[2] ;
  output \p_load_reg_78_reg[3] ;
  output [31:0]d0;
  output \ap_CS_fsm_reg[5] ;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg;
  input [3:0]Q;
  input [3:0]\tmp_reg_130_reg[3]_0 ;
  input [3:0]\tmp_reg_130_reg[3]_1 ;
  input [3:0]\tmp_reg_130_reg[3]_2 ;
  input ap_enable_reg_pp0_iter1;
  input grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  input [3:0]grp_DigitRec_Pipeline_3_fu_172_votes_address0;
  input [31:0]\votes_load_reg_140_reg[31]_0 ;

  wire [1:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [31:0]add_ln70_fu_114_p2;
  wire [31:0]add_ln70_reg_145;
  wire \add_ln70_reg_145_reg[12]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[12]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[12]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[12]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[16]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[16]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[16]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[16]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[20]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[20]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[20]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[20]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[24]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[24]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[24]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[24]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[28]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[28]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[28]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[28]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[31]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[31]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[4]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[4]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[4]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[4]_i_1_n_7 ;
  wire \add_ln70_reg_145_reg[8]_i_1_n_4 ;
  wire \add_ln70_reg_145_reg[8]_i_1_n_5 ;
  wire \add_ln70_reg_145_reg[8]_i_1_n_6 ;
  wire \add_ln70_reg_145_reg[8]_i_1_n_7 ;
  wire ap_CS_fsm_pp0_stage0;
  wire ap_CS_fsm_pp0_stage1;
  wire ap_CS_fsm_pp0_stage2;
  wire ap_CS_fsm_pp0_stage3;
  wire \ap_CS_fsm_reg[5] ;
  wire [1:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_0;
  wire ap_enable_reg_pp0_iter1_i_1__0_n_4;
  wire ap_loop_init_int;
  wire ap_rst;
  wire [31:0]d0;
  wire flow_control_loop_pipe_sequential_init_U_n_5;
  wire [3:0]grp_DigitRec_Pipeline_3_fu_172_votes_address0;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  wire \i_2_fu_38[0]_i_1_n_4 ;
  wire \i_2_fu_38[1]_i_1_n_4 ;
  wire \i_2_fu_38_reg_n_4_[0] ;
  wire \i_2_fu_38_reg_n_4_[1] ;
  wire p_0_in;
  wire \p_load_reg_78_reg[0] ;
  wire \p_load_reg_78_reg[1] ;
  wire \p_load_reg_78_reg[2] ;
  wire \p_load_reg_78_reg[3] ;
  wire \q0[31]_i_2_n_4 ;
  wire [3:0]tmp_fu_93_p5;
  wire [3:0]tmp_reg_130;
  wire [3:0]\tmp_reg_130_reg[3]_0 ;
  wire [3:0]\tmp_reg_130_reg[3]_1 ;
  wire [3:0]\tmp_reg_130_reg[3]_2 ;
  wire [3:0]votes_addr_reg_135;
  wire [31:0]votes_load_reg_140;
  wire votes_load_reg_1400;
  wire [31:0]\votes_load_reg_140_reg[31]_0 ;
  wire [3:2]\NLW_add_ln70_reg_145_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_add_ln70_reg_145_reg[31]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \add_ln70_reg_145[0]_i_1 
       (.I0(votes_load_reg_140[0]),
        .O(add_ln70_fu_114_p2[0]));
  FDRE \add_ln70_reg_145_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[0]),
        .Q(add_ln70_reg_145[0]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[10]),
        .Q(add_ln70_reg_145[10]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[11]),
        .Q(add_ln70_reg_145[11]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[12]),
        .Q(add_ln70_reg_145[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[12]_i_1 
       (.CI(\add_ln70_reg_145_reg[8]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[12]_i_1_n_4 ,\add_ln70_reg_145_reg[12]_i_1_n_5 ,\add_ln70_reg_145_reg[12]_i_1_n_6 ,\add_ln70_reg_145_reg[12]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[12:9]),
        .S(votes_load_reg_140[12:9]));
  FDRE \add_ln70_reg_145_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[13]),
        .Q(add_ln70_reg_145[13]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[14]),
        .Q(add_ln70_reg_145[14]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[15]),
        .Q(add_ln70_reg_145[15]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[16]),
        .Q(add_ln70_reg_145[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[16]_i_1 
       (.CI(\add_ln70_reg_145_reg[12]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[16]_i_1_n_4 ,\add_ln70_reg_145_reg[16]_i_1_n_5 ,\add_ln70_reg_145_reg[16]_i_1_n_6 ,\add_ln70_reg_145_reg[16]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[16:13]),
        .S(votes_load_reg_140[16:13]));
  FDRE \add_ln70_reg_145_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[17]),
        .Q(add_ln70_reg_145[17]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[18]),
        .Q(add_ln70_reg_145[18]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[19]),
        .Q(add_ln70_reg_145[19]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[1]),
        .Q(add_ln70_reg_145[1]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[20]),
        .Q(add_ln70_reg_145[20]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[20]_i_1 
       (.CI(\add_ln70_reg_145_reg[16]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[20]_i_1_n_4 ,\add_ln70_reg_145_reg[20]_i_1_n_5 ,\add_ln70_reg_145_reg[20]_i_1_n_6 ,\add_ln70_reg_145_reg[20]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[20:17]),
        .S(votes_load_reg_140[20:17]));
  FDRE \add_ln70_reg_145_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[21]),
        .Q(add_ln70_reg_145[21]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[22]),
        .Q(add_ln70_reg_145[22]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[23]),
        .Q(add_ln70_reg_145[23]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[24]),
        .Q(add_ln70_reg_145[24]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[24]_i_1 
       (.CI(\add_ln70_reg_145_reg[20]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[24]_i_1_n_4 ,\add_ln70_reg_145_reg[24]_i_1_n_5 ,\add_ln70_reg_145_reg[24]_i_1_n_6 ,\add_ln70_reg_145_reg[24]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[24:21]),
        .S(votes_load_reg_140[24:21]));
  FDRE \add_ln70_reg_145_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[25]),
        .Q(add_ln70_reg_145[25]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[26]),
        .Q(add_ln70_reg_145[26]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[27]),
        .Q(add_ln70_reg_145[27]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[28]),
        .Q(add_ln70_reg_145[28]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[28]_i_1 
       (.CI(\add_ln70_reg_145_reg[24]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[28]_i_1_n_4 ,\add_ln70_reg_145_reg[28]_i_1_n_5 ,\add_ln70_reg_145_reg[28]_i_1_n_6 ,\add_ln70_reg_145_reg[28]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[28:25]),
        .S(votes_load_reg_140[28:25]));
  FDRE \add_ln70_reg_145_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[29]),
        .Q(add_ln70_reg_145[29]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[2]),
        .Q(add_ln70_reg_145[2]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[30]),
        .Q(add_ln70_reg_145[30]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[31]),
        .Q(add_ln70_reg_145[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[31]_i_1 
       (.CI(\add_ln70_reg_145_reg[28]_i_1_n_4 ),
        .CO({\NLW_add_ln70_reg_145_reg[31]_i_1_CO_UNCONNECTED [3:2],\add_ln70_reg_145_reg[31]_i_1_n_6 ,\add_ln70_reg_145_reg[31]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_add_ln70_reg_145_reg[31]_i_1_O_UNCONNECTED [3],add_ln70_fu_114_p2[31:29]}),
        .S({1'b0,votes_load_reg_140[31:29]}));
  FDRE \add_ln70_reg_145_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[3]),
        .Q(add_ln70_reg_145[3]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[4]),
        .Q(add_ln70_reg_145[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\add_ln70_reg_145_reg[4]_i_1_n_4 ,\add_ln70_reg_145_reg[4]_i_1_n_5 ,\add_ln70_reg_145_reg[4]_i_1_n_6 ,\add_ln70_reg_145_reg[4]_i_1_n_7 }),
        .CYINIT(votes_load_reg_140[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[4:1]),
        .S(votes_load_reg_140[4:1]));
  FDRE \add_ln70_reg_145_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[5]),
        .Q(add_ln70_reg_145[5]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[6]),
        .Q(add_ln70_reg_145[6]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[7]),
        .Q(add_ln70_reg_145[7]),
        .R(1'b0));
  FDRE \add_ln70_reg_145_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[8]),
        .Q(add_ln70_reg_145[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \add_ln70_reg_145_reg[8]_i_1 
       (.CI(\add_ln70_reg_145_reg[4]_i_1_n_4 ),
        .CO({\add_ln70_reg_145_reg[8]_i_1_n_4 ,\add_ln70_reg_145_reg[8]_i_1_n_5 ,\add_ln70_reg_145_reg[8]_i_1_n_6 ,\add_ln70_reg_145_reg[8]_i_1_n_7 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln70_fu_114_p2[8:5]),
        .S(votes_load_reg_140[8:5]));
  FDRE \add_ln70_reg_145_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage3),
        .D(add_ln70_fu_114_p2[9]),
        .Q(add_ln70_reg_145[9]),
        .R(1'b0));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(ap_CS_fsm_pp0_stage0),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_pp0_stage1),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_pp0_stage1),
        .Q(ap_CS_fsm_pp0_stage2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_pp0_stage2),
        .Q(ap_CS_fsm_pp0_stage3),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter0_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(flow_control_loop_pipe_sequential_init_U_n_5),
        .Q(ap_enable_reg_pp0_iter0_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000440050555000)) 
    ap_enable_reg_pp0_iter1_i_1__0
       (.I0(ap_rst),
        .I1(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .I3(ap_CS_fsm_pp0_stage3),
        .I4(ap_enable_reg_pp0_iter1_0),
        .I5(ap_CS_fsm_pp0_stage0),
        .O(ap_enable_reg_pp0_iter1_i_1__0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1__0_n_4),
        .Q(ap_enable_reg_pp0_iter1_0),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_0 flow_control_loop_pipe_sequential_init_U
       (.D(ap_NS_fsm),
        .Q({ap_CS_fsm_pp0_stage3,ap_CS_fsm_pp0_stage2,ap_CS_fsm_pp0_stage1,ap_CS_fsm_pp0_stage0}),
        .\ap_CS_fsm_reg[5] (\ap_CS_fsm_reg[5] ),
        .\ap_CS_fsm_reg[6] (D),
        .\ap_CS_fsm_reg[7] (Q[2:1]),
        .ap_clk(ap_clk),
        .ap_done_cache_reg_0(\i_2_fu_38_reg_n_4_[0] ),
        .ap_done_cache_reg_1(\i_2_fu_38_reg_n_4_[1] ),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter1_0(ap_enable_reg_pp0_iter1_0),
        .ap_loop_init_int(ap_loop_init_int),
        .ap_rst(ap_rst),
        .ap_rst_0(flow_control_loop_pipe_sequential_init_U_n_5),
        .grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .\tmp_reg_130_reg[3] (\tmp_reg_130_reg[3]_0 ),
        .\tmp_reg_130_reg[3]_0 (\tmp_reg_130_reg[3]_1 ),
        .\tmp_reg_130_reg[3]_1 (\tmp_reg_130_reg[3]_2 ),
        .\trunc_ln107_reg_510_reg[3] (tmp_fu_93_p5));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'hFDAAAAAA)) 
    \i_2_fu_38[0]_i_1 
       (.I0(\i_2_fu_38_reg_n_4_[0] ),
        .I1(ap_loop_init_int),
        .I2(\i_2_fu_38_reg_n_4_[1] ),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .O(\i_2_fu_38[0]_i_1_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h32F0F0F0)) 
    \i_2_fu_38[1]_i_1 
       (.I0(\i_2_fu_38_reg_n_4_[0] ),
        .I1(ap_loop_init_int),
        .I2(\i_2_fu_38_reg_n_4_[1] ),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .O(\i_2_fu_38[1]_i_1_n_4 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_2_fu_38_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\i_2_fu_38[0]_i_1_n_4 ),
        .Q(\i_2_fu_38_reg_n_4_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_2_fu_38_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\i_2_fu_38[1]_i_1_n_4 ),
        .Q(\i_2_fu_38_reg_n_4_[1] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFEAAA0000EAAA)) 
    \q0[31]_i_1 
       (.I0(\q0[31]_i_2_n_4 ),
        .I1(Q[2]),
        .I2(ap_CS_fsm_pp0_stage1),
        .I3(ap_enable_reg_pp0_iter0),
        .I4(Q[3]),
        .I5(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(E));
  LUT5 #(
    .INIT(32'hF8080808)) 
    \q0[31]_i_2 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(ap_enable_reg_pp0_iter1_0),
        .O(\q0[31]_i_2_n_4 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \q0[31]_i_3 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .O(ap_enable_reg_pp0_iter0));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_0_0_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[0]),
        .O(d0[0]));
  LUT6 #(
    .INIT(64'hF0CCCCCCAAAAAAAA)) 
    ram_reg_0_15_0_0_i_10
       (.I0(grp_DigitRec_Pipeline_3_fu_172_votes_address0[3]),
        .I1(tmp_reg_130[3]),
        .I2(votes_addr_reg_135[3]),
        .I3(ap_enable_reg_pp0_iter1_0),
        .I4(ap_CS_fsm_pp0_stage0),
        .I5(Q[2]),
        .O(\p_load_reg_78_reg[3] ));
  LUT6 #(
    .INIT(64'h8F80808000000000)) 
    ram_reg_0_15_0_0_i_2
       (.I0(ap_enable_reg_pp0_iter1_0),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(ap_enable_reg_pp0_iter1),
        .I5(E),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'hF0CCCCCCAAAAAAAA)) 
    ram_reg_0_15_0_0_i_7
       (.I0(grp_DigitRec_Pipeline_3_fu_172_votes_address0[0]),
        .I1(tmp_reg_130[0]),
        .I2(votes_addr_reg_135[0]),
        .I3(ap_enable_reg_pp0_iter1_0),
        .I4(ap_CS_fsm_pp0_stage0),
        .I5(Q[2]),
        .O(\p_load_reg_78_reg[0] ));
  LUT6 #(
    .INIT(64'hF0CCCCCCAAAAAAAA)) 
    ram_reg_0_15_0_0_i_8
       (.I0(grp_DigitRec_Pipeline_3_fu_172_votes_address0[1]),
        .I1(tmp_reg_130[1]),
        .I2(votes_addr_reg_135[1]),
        .I3(ap_enable_reg_pp0_iter1_0),
        .I4(ap_CS_fsm_pp0_stage0),
        .I5(Q[2]),
        .O(\p_load_reg_78_reg[1] ));
  LUT6 #(
    .INIT(64'hF0CCCCCCAAAAAAAA)) 
    ram_reg_0_15_0_0_i_9
       (.I0(grp_DigitRec_Pipeline_3_fu_172_votes_address0[2]),
        .I1(tmp_reg_130[2]),
        .I2(votes_addr_reg_135[2]),
        .I3(ap_enable_reg_pp0_iter1_0),
        .I4(ap_CS_fsm_pp0_stage0),
        .I5(Q[2]),
        .O(\p_load_reg_78_reg[2] ));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_10_10_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[10]),
        .O(d0[10]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_11_11_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[11]),
        .O(d0[11]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_12_12_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[12]),
        .O(d0[12]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_13_13_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[13]),
        .O(d0[13]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_14_14_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[14]),
        .O(d0[14]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_15_15_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[15]),
        .O(d0[15]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_16_16_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[16]),
        .O(d0[16]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_17_17_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[17]),
        .O(d0[17]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_18_18_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[18]),
        .O(d0[18]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_19_19_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[19]),
        .O(d0[19]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_1_1_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[1]),
        .O(d0[1]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_20_20_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[20]),
        .O(d0[20]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_21_21_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[21]),
        .O(d0[21]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_22_22_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[22]),
        .O(d0[22]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_23_23_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[23]),
        .O(d0[23]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_24_24_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[24]),
        .O(d0[24]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_25_25_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[25]),
        .O(d0[25]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_26_26_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[26]),
        .O(d0[26]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_27_27_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[27]),
        .O(d0[27]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_28_28_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[28]),
        .O(d0[28]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_29_29_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[29]),
        .O(d0[29]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_2_2_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[2]),
        .O(d0[2]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_30_30_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[30]),
        .O(d0[30]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_31_31_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[31]),
        .O(d0[31]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_3_3_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[3]),
        .O(d0[3]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_4_4_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[4]),
        .O(d0[4]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_5_5_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[5]),
        .O(d0[5]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_6_6_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[6]),
        .O(d0[6]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_7_7_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[7]),
        .O(d0[7]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_8_8_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[8]),
        .O(d0[8]));
  LUT2 #(
    .INIT(4'h8)) 
    ram_reg_0_15_9_9_i_1
       (.I0(Q[2]),
        .I1(add_ln70_reg_145[9]),
        .O(d0[9]));
  FDRE \tmp_reg_130_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(tmp_fu_93_p5[0]),
        .Q(tmp_reg_130[0]),
        .R(1'b0));
  FDRE \tmp_reg_130_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(tmp_fu_93_p5[1]),
        .Q(tmp_reg_130[1]),
        .R(1'b0));
  FDRE \tmp_reg_130_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(tmp_fu_93_p5[2]),
        .Q(tmp_reg_130[2]),
        .R(1'b0));
  FDRE \tmp_reg_130_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage0),
        .D(tmp_fu_93_p5[3]),
        .Q(tmp_reg_130[3]),
        .R(1'b0));
  FDRE \votes_addr_reg_135_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage1),
        .D(tmp_reg_130[0]),
        .Q(votes_addr_reg_135[0]),
        .R(1'b0));
  FDRE \votes_addr_reg_135_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage1),
        .D(tmp_reg_130[1]),
        .Q(votes_addr_reg_135[1]),
        .R(1'b0));
  FDRE \votes_addr_reg_135_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage1),
        .D(tmp_reg_130[2]),
        .Q(votes_addr_reg_135[2]),
        .R(1'b0));
  FDRE \votes_addr_reg_135_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_pp0_stage1),
        .D(tmp_reg_130[3]),
        .Q(votes_addr_reg_135[3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA808)) 
    \votes_load_reg_140[31]_i_1 
       (.I0(ap_CS_fsm_pp0_stage2),
        .I1(ap_enable_reg_pp0_iter0_reg),
        .I2(ap_CS_fsm_pp0_stage0),
        .I3(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .O(votes_load_reg_1400));
  FDRE \votes_load_reg_140_reg[0] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [0]),
        .Q(votes_load_reg_140[0]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[10] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [10]),
        .Q(votes_load_reg_140[10]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[11] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [11]),
        .Q(votes_load_reg_140[11]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[12] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [12]),
        .Q(votes_load_reg_140[12]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[13] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [13]),
        .Q(votes_load_reg_140[13]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[14] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [14]),
        .Q(votes_load_reg_140[14]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[15] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [15]),
        .Q(votes_load_reg_140[15]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[16] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [16]),
        .Q(votes_load_reg_140[16]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[17] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [17]),
        .Q(votes_load_reg_140[17]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[18] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [18]),
        .Q(votes_load_reg_140[18]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[19] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [19]),
        .Q(votes_load_reg_140[19]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[1] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [1]),
        .Q(votes_load_reg_140[1]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[20] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [20]),
        .Q(votes_load_reg_140[20]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[21] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [21]),
        .Q(votes_load_reg_140[21]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[22] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [22]),
        .Q(votes_load_reg_140[22]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[23] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [23]),
        .Q(votes_load_reg_140[23]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[24] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [24]),
        .Q(votes_load_reg_140[24]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[25] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [25]),
        .Q(votes_load_reg_140[25]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[26] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [26]),
        .Q(votes_load_reg_140[26]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[27] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [27]),
        .Q(votes_load_reg_140[27]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[28] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [28]),
        .Q(votes_load_reg_140[28]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[29] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [29]),
        .Q(votes_load_reg_140[29]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[2] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [2]),
        .Q(votes_load_reg_140[2]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[30] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [30]),
        .Q(votes_load_reg_140[30]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[31] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [31]),
        .Q(votes_load_reg_140[31]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[3] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [3]),
        .Q(votes_load_reg_140[3]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[4] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [4]),
        .Q(votes_load_reg_140[4]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[5] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [5]),
        .Q(votes_load_reg_140[5]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[6] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [6]),
        .Q(votes_load_reg_140[6]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[7] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [7]),
        .Q(votes_load_reg_140[7]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[8] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [8]),
        .Q(votes_load_reg_140[8]),
        .R(1'b0));
  FDRE \votes_load_reg_140_reg[9] 
       (.C(ap_clk),
        .CE(votes_load_reg_1400),
        .D(\votes_load_reg_140_reg[31]_0 [9]),
        .Q(votes_load_reg_140[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2" *) 
module bd_0_hls_inst_0_DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2
   (votes_address0,
    D,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg,
    results_d0,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg,
    Q,
    \q0_reg[31] ,
    \q0_reg[31]_0 ,
    \q0_reg[31]_1 ,
    \q0_reg[31]_2 ,
    \votes_load_reg_183_reg[31]_0 );
  output [3:0]votes_address0;
  output [1:0]D;
  output grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg;
  output [3:0]results_d0;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  input [1:0]Q;
  input \q0_reg[31] ;
  input \q0_reg[31]_0 ;
  input \q0_reg[31]_1 ;
  input \q0_reg[31]_2 ;
  input [31:0]\votes_load_reg_183_reg[31]_0 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter3;
  wire ap_loop_exit_ready_pp0_iter1_reg;
  wire ap_loop_exit_ready_pp0_iter2_reg;
  wire ap_loop_init;
  wire ap_rst;
  wire [31:1]ap_sig_allocacmp_max_vote_1_load;
  wire flow_control_loop_pipe_sequential_init_U_n_4;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg;
  wire [3:0]grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0;
  wire [3:0]i_1_reg_169_pp0_iter2_reg;
  wire [3:0]i_2_fu_90_p2;
  wire i_fu_420;
  wire \i_fu_42_reg_n_4_[0] ;
  wire \i_fu_42_reg_n_4_[1] ;
  wire \i_fu_42_reg_n_4_[2] ;
  wire \i_fu_42_reg_n_4_[3] ;
  wire icmp_ln74_fu_109_p2_carry__0_i_1_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_2_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_3_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_4_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_5_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_6_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_7_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_i_8_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_n_4;
  wire icmp_ln74_fu_109_p2_carry__0_n_5;
  wire icmp_ln74_fu_109_p2_carry__0_n_6;
  wire icmp_ln74_fu_109_p2_carry__0_n_7;
  wire icmp_ln74_fu_109_p2_carry__1_i_1_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_2_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_3_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_4_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_5_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_6_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_7_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_i_8_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_n_4;
  wire icmp_ln74_fu_109_p2_carry__1_n_5;
  wire icmp_ln74_fu_109_p2_carry__1_n_6;
  wire icmp_ln74_fu_109_p2_carry__1_n_7;
  wire icmp_ln74_fu_109_p2_carry__2_i_1_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_2_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_3_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_4_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_5_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_6_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_7_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_i_8_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_n_4;
  wire icmp_ln74_fu_109_p2_carry__2_n_5;
  wire icmp_ln74_fu_109_p2_carry__2_n_6;
  wire icmp_ln74_fu_109_p2_carry__2_n_7;
  wire icmp_ln74_fu_109_p2_carry_i_1_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_2_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_3_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_4_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_5_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_6_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_7_n_4;
  wire icmp_ln74_fu_109_p2_carry_i_8_n_4;
  wire icmp_ln74_fu_109_p2_carry_n_4;
  wire icmp_ln74_fu_109_p2_carry_n_5;
  wire icmp_ln74_fu_109_p2_carry_n_6;
  wire icmp_ln74_fu_109_p2_carry_n_7;
  wire icmp_ln74_reg_189;
  wire max_label_fu_34;
  wire [31:0]max_vote_1_fu_38;
  wire [31:0]max_vote_fu_114_p3;
  wire [31:0]max_vote_reg_194;
  wire \q0_reg[31] ;
  wire \q0_reg[31]_0 ;
  wire \q0_reg[31]_1 ;
  wire \q0_reg[31]_2 ;
  wire [3:0]results_d0;
  wire [3:0]votes_address0;
  wire [31:0]votes_load_reg_183;
  wire [31:0]\votes_load_reg_183_reg[31]_0 ;
  wire [3:0]NLW_icmp_ln74_fu_109_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln74_fu_109_p2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln74_fu_109_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln74_fu_109_p2_carry__2_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(flow_control_loop_pipe_sequential_init_U_n_4),
        .Q(ap_enable_reg_pp0_iter1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1),
        .Q(ap_enable_reg_pp0_iter2),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter3_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2),
        .Q(ap_enable_reg_pp0_iter3),
        .R(ap_rst));
  FDRE ap_loop_exit_ready_pp0_iter1_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready),
        .Q(ap_loop_exit_ready_pp0_iter1_reg),
        .R(1'b0));
  FDRE ap_loop_exit_ready_pp0_iter2_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_exit_ready_pp0_iter1_reg),
        .Q(ap_loop_exit_ready_pp0_iter2_reg),
        .R(1'b0));
  bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U
       (.D(D),
        .Q(Q),
        .ap_clk(ap_clk),
        .ap_loop_exit_ready_pp0_iter1_reg_reg(\i_fu_42_reg_n_4_[3] ),
        .ap_loop_exit_ready_pp0_iter1_reg_reg_0(\i_fu_42_reg_n_4_[2] ),
        .ap_loop_exit_ready_pp0_iter1_reg_reg_1(\i_fu_42_reg_n_4_[0] ),
        .ap_loop_exit_ready_pp0_iter1_reg_reg_2(\i_fu_42_reg_n_4_[1] ),
        .ap_loop_exit_ready_pp0_iter2_reg(ap_loop_exit_ready_pp0_iter2_reg),
        .ap_loop_init(ap_loop_init),
        .ap_rst(ap_rst),
        .ap_rst_0(flow_control_loop_pipe_sequential_init_U_n_4),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg),
        .grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0),
        .i_2_fu_90_p2(i_2_fu_90_p2),
        .i_fu_420(i_fu_420),
        .\q0_reg[31] (\q0_reg[31] ),
        .\q0_reg[31]_0 (\q0_reg[31]_0 ),
        .\q0_reg[31]_1 (\q0_reg[31]_1 ),
        .\q0_reg[31]_2 (\q0_reg[31]_2 ),
        .votes_address0(votes_address0));
  (* srl_bus_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg " *) 
  (* srl_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg[0]_srl3 " *) 
  SRL16E \i_1_reg_169_pp0_iter2_reg_reg[0]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(ap_clk),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[0]),
        .Q(i_1_reg_169_pp0_iter2_reg[0]));
  (* srl_bus_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg " *) 
  (* srl_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg[1]_srl3 " *) 
  SRL16E \i_1_reg_169_pp0_iter2_reg_reg[1]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(ap_clk),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[1]),
        .Q(i_1_reg_169_pp0_iter2_reg[1]));
  (* srl_bus_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg " *) 
  (* srl_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg[2]_srl3 " *) 
  SRL16E \i_1_reg_169_pp0_iter2_reg_reg[2]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(ap_clk),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[2]),
        .Q(i_1_reg_169_pp0_iter2_reg[2]));
  (* srl_bus_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg " *) 
  (* srl_name = "inst/\\grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209/i_1_reg_169_pp0_iter2_reg_reg[3]_srl3 " *) 
  SRL16E \i_1_reg_169_pp0_iter2_reg_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(ap_clk),
        .D(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[3]),
        .Q(i_1_reg_169_pp0_iter2_reg[3]));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_42_reg[0] 
       (.C(ap_clk),
        .CE(i_fu_420),
        .D(i_2_fu_90_p2[0]),
        .Q(\i_fu_42_reg_n_4_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_42_reg[1] 
       (.C(ap_clk),
        .CE(i_fu_420),
        .D(i_2_fu_90_p2[1]),
        .Q(\i_fu_42_reg_n_4_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_42_reg[2] 
       (.C(ap_clk),
        .CE(i_fu_420),
        .D(i_2_fu_90_p2[2]),
        .Q(\i_fu_42_reg_n_4_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_42_reg[3] 
       (.C(ap_clk),
        .CE(i_fu_420),
        .D(i_2_fu_90_p2[3]),
        .Q(\i_fu_42_reg_n_4_[3] ),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln74_fu_109_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln74_fu_109_p2_carry_n_4,icmp_ln74_fu_109_p2_carry_n_5,icmp_ln74_fu_109_p2_carry_n_6,icmp_ln74_fu_109_p2_carry_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln74_fu_109_p2_carry_i_1_n_4,icmp_ln74_fu_109_p2_carry_i_2_n_4,icmp_ln74_fu_109_p2_carry_i_3_n_4,icmp_ln74_fu_109_p2_carry_i_4_n_4}),
        .O(NLW_icmp_ln74_fu_109_p2_carry_O_UNCONNECTED[3:0]),
        .S({icmp_ln74_fu_109_p2_carry_i_5_n_4,icmp_ln74_fu_109_p2_carry_i_6_n_4,icmp_ln74_fu_109_p2_carry_i_7_n_4,icmp_ln74_fu_109_p2_carry_i_8_n_4}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln74_fu_109_p2_carry__0
       (.CI(icmp_ln74_fu_109_p2_carry_n_4),
        .CO({icmp_ln74_fu_109_p2_carry__0_n_4,icmp_ln74_fu_109_p2_carry__0_n_5,icmp_ln74_fu_109_p2_carry__0_n_6,icmp_ln74_fu_109_p2_carry__0_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln74_fu_109_p2_carry__0_i_1_n_4,icmp_ln74_fu_109_p2_carry__0_i_2_n_4,icmp_ln74_fu_109_p2_carry__0_i_3_n_4,icmp_ln74_fu_109_p2_carry__0_i_4_n_4}),
        .O(NLW_icmp_ln74_fu_109_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({icmp_ln74_fu_109_p2_carry__0_i_5_n_4,icmp_ln74_fu_109_p2_carry__0_i_6_n_4,icmp_ln74_fu_109_p2_carry__0_i_7_n_4,icmp_ln74_fu_109_p2_carry__0_i_8_n_4}));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__0_i_1
       (.I0(votes_load_reg_183[14]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[14]),
        .I3(max_vote_reg_194[14]),
        .I4(ap_sig_allocacmp_max_vote_1_load[15]),
        .I5(votes_load_reg_183[15]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_1_n_4));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__0_i_10
       (.I0(max_vote_reg_194[13]),
        .I1(max_vote_1_fu_38[13]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[13]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__0_i_11
       (.I0(max_vote_reg_194[11]),
        .I1(max_vote_1_fu_38[11]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[11]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__0_i_12
       (.I0(max_vote_reg_194[9]),
        .I1(max_vote_1_fu_38[9]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[9]));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__0_i_2
       (.I0(votes_load_reg_183[12]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[12]),
        .I3(max_vote_reg_194[12]),
        .I4(ap_sig_allocacmp_max_vote_1_load[13]),
        .I5(votes_load_reg_183[13]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_2_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__0_i_3
       (.I0(votes_load_reg_183[10]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[10]),
        .I3(max_vote_reg_194[10]),
        .I4(ap_sig_allocacmp_max_vote_1_load[11]),
        .I5(votes_load_reg_183[11]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_3_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__0_i_4
       (.I0(votes_load_reg_183[8]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[8]),
        .I3(max_vote_reg_194[8]),
        .I4(ap_sig_allocacmp_max_vote_1_load[9]),
        .I5(votes_load_reg_183[9]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_4_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__0_i_5
       (.I0(votes_load_reg_183[14]),
        .I1(max_vote_reg_194[14]),
        .I2(max_vote_1_fu_38[14]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[15]),
        .I5(ap_sig_allocacmp_max_vote_1_load[15]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_5_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__0_i_6
       (.I0(votes_load_reg_183[12]),
        .I1(max_vote_reg_194[12]),
        .I2(max_vote_1_fu_38[12]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[13]),
        .I5(ap_sig_allocacmp_max_vote_1_load[13]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_6_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__0_i_7
       (.I0(votes_load_reg_183[10]),
        .I1(max_vote_reg_194[10]),
        .I2(max_vote_1_fu_38[10]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[11]),
        .I5(ap_sig_allocacmp_max_vote_1_load[11]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_7_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__0_i_8
       (.I0(votes_load_reg_183[8]),
        .I1(max_vote_reg_194[8]),
        .I2(max_vote_1_fu_38[8]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[9]),
        .I5(ap_sig_allocacmp_max_vote_1_load[9]),
        .O(icmp_ln74_fu_109_p2_carry__0_i_8_n_4));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__0_i_9
       (.I0(max_vote_reg_194[15]),
        .I1(max_vote_1_fu_38[15]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[15]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln74_fu_109_p2_carry__1
       (.CI(icmp_ln74_fu_109_p2_carry__0_n_4),
        .CO({icmp_ln74_fu_109_p2_carry__1_n_4,icmp_ln74_fu_109_p2_carry__1_n_5,icmp_ln74_fu_109_p2_carry__1_n_6,icmp_ln74_fu_109_p2_carry__1_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln74_fu_109_p2_carry__1_i_1_n_4,icmp_ln74_fu_109_p2_carry__1_i_2_n_4,icmp_ln74_fu_109_p2_carry__1_i_3_n_4,icmp_ln74_fu_109_p2_carry__1_i_4_n_4}),
        .O(NLW_icmp_ln74_fu_109_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({icmp_ln74_fu_109_p2_carry__1_i_5_n_4,icmp_ln74_fu_109_p2_carry__1_i_6_n_4,icmp_ln74_fu_109_p2_carry__1_i_7_n_4,icmp_ln74_fu_109_p2_carry__1_i_8_n_4}));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__1_i_1
       (.I0(votes_load_reg_183[22]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[22]),
        .I3(max_vote_reg_194[22]),
        .I4(ap_sig_allocacmp_max_vote_1_load[23]),
        .I5(votes_load_reg_183[23]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_1_n_4));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__1_i_10
       (.I0(max_vote_reg_194[21]),
        .I1(max_vote_1_fu_38[21]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[21]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__1_i_11
       (.I0(max_vote_reg_194[19]),
        .I1(max_vote_1_fu_38[19]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[19]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__1_i_12
       (.I0(max_vote_reg_194[17]),
        .I1(max_vote_1_fu_38[17]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[17]));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__1_i_2
       (.I0(votes_load_reg_183[20]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[20]),
        .I3(max_vote_reg_194[20]),
        .I4(ap_sig_allocacmp_max_vote_1_load[21]),
        .I5(votes_load_reg_183[21]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_2_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__1_i_3
       (.I0(votes_load_reg_183[18]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[18]),
        .I3(max_vote_reg_194[18]),
        .I4(ap_sig_allocacmp_max_vote_1_load[19]),
        .I5(votes_load_reg_183[19]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_3_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__1_i_4
       (.I0(votes_load_reg_183[16]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[16]),
        .I3(max_vote_reg_194[16]),
        .I4(ap_sig_allocacmp_max_vote_1_load[17]),
        .I5(votes_load_reg_183[17]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_4_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__1_i_5
       (.I0(votes_load_reg_183[22]),
        .I1(max_vote_reg_194[22]),
        .I2(max_vote_1_fu_38[22]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[23]),
        .I5(ap_sig_allocacmp_max_vote_1_load[23]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_5_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__1_i_6
       (.I0(votes_load_reg_183[20]),
        .I1(max_vote_reg_194[20]),
        .I2(max_vote_1_fu_38[20]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[21]),
        .I5(ap_sig_allocacmp_max_vote_1_load[21]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_6_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__1_i_7
       (.I0(votes_load_reg_183[18]),
        .I1(max_vote_reg_194[18]),
        .I2(max_vote_1_fu_38[18]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[19]),
        .I5(ap_sig_allocacmp_max_vote_1_load[19]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_7_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__1_i_8
       (.I0(votes_load_reg_183[16]),
        .I1(max_vote_reg_194[16]),
        .I2(max_vote_1_fu_38[16]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[17]),
        .I5(ap_sig_allocacmp_max_vote_1_load[17]),
        .O(icmp_ln74_fu_109_p2_carry__1_i_8_n_4));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__1_i_9
       (.I0(max_vote_reg_194[23]),
        .I1(max_vote_1_fu_38[23]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[23]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 icmp_ln74_fu_109_p2_carry__2
       (.CI(icmp_ln74_fu_109_p2_carry__1_n_4),
        .CO({icmp_ln74_fu_109_p2_carry__2_n_4,icmp_ln74_fu_109_p2_carry__2_n_5,icmp_ln74_fu_109_p2_carry__2_n_6,icmp_ln74_fu_109_p2_carry__2_n_7}),
        .CYINIT(1'b0),
        .DI({icmp_ln74_fu_109_p2_carry__2_i_1_n_4,icmp_ln74_fu_109_p2_carry__2_i_2_n_4,icmp_ln74_fu_109_p2_carry__2_i_3_n_4,icmp_ln74_fu_109_p2_carry__2_i_4_n_4}),
        .O(NLW_icmp_ln74_fu_109_p2_carry__2_O_UNCONNECTED[3:0]),
        .S({icmp_ln74_fu_109_p2_carry__2_i_5_n_4,icmp_ln74_fu_109_p2_carry__2_i_6_n_4,icmp_ln74_fu_109_p2_carry__2_i_7_n_4,icmp_ln74_fu_109_p2_carry__2_i_8_n_4}));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__2_i_1
       (.I0(votes_load_reg_183[30]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[30]),
        .I3(max_vote_reg_194[30]),
        .I4(votes_load_reg_183[31]),
        .I5(ap_sig_allocacmp_max_vote_1_load[31]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_1_n_4));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__2_i_10
       (.I0(max_vote_reg_194[29]),
        .I1(max_vote_1_fu_38[29]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[29]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__2_i_11
       (.I0(max_vote_reg_194[27]),
        .I1(max_vote_1_fu_38[27]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[27]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__2_i_12
       (.I0(max_vote_reg_194[25]),
        .I1(max_vote_1_fu_38[25]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[25]));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__2_i_2
       (.I0(votes_load_reg_183[28]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[28]),
        .I3(max_vote_reg_194[28]),
        .I4(ap_sig_allocacmp_max_vote_1_load[29]),
        .I5(votes_load_reg_183[29]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_2_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__2_i_3
       (.I0(votes_load_reg_183[26]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[26]),
        .I3(max_vote_reg_194[26]),
        .I4(ap_sig_allocacmp_max_vote_1_load[27]),
        .I5(votes_load_reg_183[27]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_3_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry__2_i_4
       (.I0(votes_load_reg_183[24]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[24]),
        .I3(max_vote_reg_194[24]),
        .I4(ap_sig_allocacmp_max_vote_1_load[25]),
        .I5(votes_load_reg_183[25]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_4_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__2_i_5
       (.I0(votes_load_reg_183[30]),
        .I1(max_vote_reg_194[30]),
        .I2(max_vote_1_fu_38[30]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(ap_sig_allocacmp_max_vote_1_load[31]),
        .I5(votes_load_reg_183[31]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_5_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__2_i_6
       (.I0(votes_load_reg_183[28]),
        .I1(max_vote_reg_194[28]),
        .I2(max_vote_1_fu_38[28]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[29]),
        .I5(ap_sig_allocacmp_max_vote_1_load[29]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_6_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__2_i_7
       (.I0(votes_load_reg_183[26]),
        .I1(max_vote_reg_194[26]),
        .I2(max_vote_1_fu_38[26]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[27]),
        .I5(ap_sig_allocacmp_max_vote_1_load[27]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_7_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry__2_i_8
       (.I0(votes_load_reg_183[24]),
        .I1(max_vote_reg_194[24]),
        .I2(max_vote_1_fu_38[24]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[25]),
        .I5(ap_sig_allocacmp_max_vote_1_load[25]),
        .O(icmp_ln74_fu_109_p2_carry__2_i_8_n_4));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry__2_i_9
       (.I0(max_vote_reg_194[31]),
        .I1(max_vote_1_fu_38[31]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[31]));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry_i_1
       (.I0(votes_load_reg_183[6]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[6]),
        .I3(max_vote_reg_194[6]),
        .I4(ap_sig_allocacmp_max_vote_1_load[7]),
        .I5(votes_load_reg_183[7]),
        .O(icmp_ln74_fu_109_p2_carry_i_1_n_4));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry_i_10
       (.I0(max_vote_reg_194[5]),
        .I1(max_vote_1_fu_38[5]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[5]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry_i_11
       (.I0(max_vote_reg_194[3]),
        .I1(max_vote_1_fu_38[3]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[3]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry_i_12
       (.I0(max_vote_reg_194[1]),
        .I1(max_vote_1_fu_38[1]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[1]));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry_i_2
       (.I0(votes_load_reg_183[4]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[4]),
        .I3(max_vote_reg_194[4]),
        .I4(ap_sig_allocacmp_max_vote_1_load[5]),
        .I5(votes_load_reg_183[5]),
        .O(icmp_ln74_fu_109_p2_carry_i_2_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry_i_3
       (.I0(votes_load_reg_183[2]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[2]),
        .I3(max_vote_reg_194[2]),
        .I4(ap_sig_allocacmp_max_vote_1_load[3]),
        .I5(votes_load_reg_183[3]),
        .O(icmp_ln74_fu_109_p2_carry_i_3_n_4));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A)) 
    icmp_ln74_fu_109_p2_carry_i_4
       (.I0(votes_load_reg_183[0]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(max_vote_1_fu_38[0]),
        .I3(max_vote_reg_194[0]),
        .I4(ap_sig_allocacmp_max_vote_1_load[1]),
        .I5(votes_load_reg_183[1]),
        .O(icmp_ln74_fu_109_p2_carry_i_4_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry_i_5
       (.I0(votes_load_reg_183[6]),
        .I1(max_vote_reg_194[6]),
        .I2(max_vote_1_fu_38[6]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[7]),
        .I5(ap_sig_allocacmp_max_vote_1_load[7]),
        .O(icmp_ln74_fu_109_p2_carry_i_5_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry_i_6
       (.I0(votes_load_reg_183[4]),
        .I1(max_vote_reg_194[4]),
        .I2(max_vote_1_fu_38[4]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[5]),
        .I5(ap_sig_allocacmp_max_vote_1_load[5]),
        .O(icmp_ln74_fu_109_p2_carry_i_6_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry_i_7
       (.I0(votes_load_reg_183[2]),
        .I1(max_vote_reg_194[2]),
        .I2(max_vote_1_fu_38[2]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[3]),
        .I5(ap_sig_allocacmp_max_vote_1_load[3]),
        .O(icmp_ln74_fu_109_p2_carry_i_7_n_4));
  LUT6 #(
    .INIT(64'h99A50000000099A5)) 
    icmp_ln74_fu_109_p2_carry_i_8
       (.I0(votes_load_reg_183[0]),
        .I1(max_vote_reg_194[0]),
        .I2(max_vote_1_fu_38[0]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(votes_load_reg_183[1]),
        .I5(ap_sig_allocacmp_max_vote_1_load[1]),
        .O(icmp_ln74_fu_109_p2_carry_i_8_n_4));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    icmp_ln74_fu_109_p2_carry_i_9
       (.I0(max_vote_reg_194[7]),
        .I1(max_vote_1_fu_38[7]),
        .I2(ap_enable_reg_pp0_iter3),
        .O(ap_sig_allocacmp_max_vote_1_load[7]));
  FDRE \icmp_ln74_reg_189_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln74_fu_109_p2_carry__2_n_4),
        .Q(icmp_ln74_reg_189),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \max_label_fu_34[3]_i_2 
       (.I0(ap_enable_reg_pp0_iter3),
        .I1(icmp_ln74_reg_189),
        .O(max_label_fu_34));
  FDRE #(
    .INIT(1'b0)) 
    \max_label_fu_34_reg[0] 
       (.C(ap_clk),
        .CE(max_label_fu_34),
        .D(i_1_reg_169_pp0_iter2_reg[0]),
        .Q(results_d0[0]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_label_fu_34_reg[1] 
       (.C(ap_clk),
        .CE(max_label_fu_34),
        .D(i_1_reg_169_pp0_iter2_reg[1]),
        .Q(results_d0[1]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_label_fu_34_reg[2] 
       (.C(ap_clk),
        .CE(max_label_fu_34),
        .D(i_1_reg_169_pp0_iter2_reg[2]),
        .Q(results_d0[2]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_label_fu_34_reg[3] 
       (.C(ap_clk),
        .CE(max_label_fu_34),
        .D(i_1_reg_169_pp0_iter2_reg[3]),
        .Q(results_d0[3]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[0] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[0]),
        .Q(max_vote_1_fu_38[0]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[10] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[10]),
        .Q(max_vote_1_fu_38[10]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[11] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[11]),
        .Q(max_vote_1_fu_38[11]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[12] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[12]),
        .Q(max_vote_1_fu_38[12]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[13] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[13]),
        .Q(max_vote_1_fu_38[13]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[14] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[14]),
        .Q(max_vote_1_fu_38[14]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[15] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[15]),
        .Q(max_vote_1_fu_38[15]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[16] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[16]),
        .Q(max_vote_1_fu_38[16]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[17] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[17]),
        .Q(max_vote_1_fu_38[17]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[18] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[18]),
        .Q(max_vote_1_fu_38[18]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[19] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[19]),
        .Q(max_vote_1_fu_38[19]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[1] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[1]),
        .Q(max_vote_1_fu_38[1]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[20] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[20]),
        .Q(max_vote_1_fu_38[20]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[21] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[21]),
        .Q(max_vote_1_fu_38[21]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[22] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[22]),
        .Q(max_vote_1_fu_38[22]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[23] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[23]),
        .Q(max_vote_1_fu_38[23]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[24] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[24]),
        .Q(max_vote_1_fu_38[24]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[25] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[25]),
        .Q(max_vote_1_fu_38[25]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[26] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[26]),
        .Q(max_vote_1_fu_38[26]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[27] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[27]),
        .Q(max_vote_1_fu_38[27]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[28] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[28]),
        .Q(max_vote_1_fu_38[28]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[29] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[29]),
        .Q(max_vote_1_fu_38[29]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[2]),
        .Q(max_vote_1_fu_38[2]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[30] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[30]),
        .Q(max_vote_1_fu_38[30]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[31] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[31]),
        .Q(max_vote_1_fu_38[31]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[3]),
        .Q(max_vote_1_fu_38[3]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[4]),
        .Q(max_vote_1_fu_38[4]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[5]),
        .Q(max_vote_1_fu_38[5]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[6]),
        .Q(max_vote_1_fu_38[6]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[7] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[7]),
        .Q(max_vote_1_fu_38[7]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[8] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[8]),
        .Q(max_vote_1_fu_38[8]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \max_vote_1_fu_38_reg[9] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter3),
        .D(max_vote_reg_194[9]),
        .Q(max_vote_1_fu_38[9]),
        .R(ap_loop_init));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[0]_i_1 
       (.I0(votes_load_reg_183[0]),
        .I1(max_vote_reg_194[0]),
        .I2(max_vote_1_fu_38[0]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[0]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[10]_i_1 
       (.I0(votes_load_reg_183[10]),
        .I1(max_vote_reg_194[10]),
        .I2(max_vote_1_fu_38[10]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[10]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[11]_i_1 
       (.I0(votes_load_reg_183[11]),
        .I1(max_vote_reg_194[11]),
        .I2(max_vote_1_fu_38[11]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[11]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[12]_i_1 
       (.I0(votes_load_reg_183[12]),
        .I1(max_vote_reg_194[12]),
        .I2(max_vote_1_fu_38[12]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[12]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[13]_i_1 
       (.I0(votes_load_reg_183[13]),
        .I1(max_vote_reg_194[13]),
        .I2(max_vote_1_fu_38[13]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[13]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[14]_i_1 
       (.I0(votes_load_reg_183[14]),
        .I1(max_vote_reg_194[14]),
        .I2(max_vote_1_fu_38[14]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[14]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[15]_i_1 
       (.I0(votes_load_reg_183[15]),
        .I1(max_vote_reg_194[15]),
        .I2(max_vote_1_fu_38[15]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[15]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[16]_i_1 
       (.I0(votes_load_reg_183[16]),
        .I1(max_vote_reg_194[16]),
        .I2(max_vote_1_fu_38[16]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[16]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[17]_i_1 
       (.I0(votes_load_reg_183[17]),
        .I1(max_vote_reg_194[17]),
        .I2(max_vote_1_fu_38[17]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[17]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[18]_i_1 
       (.I0(votes_load_reg_183[18]),
        .I1(max_vote_reg_194[18]),
        .I2(max_vote_1_fu_38[18]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[18]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[19]_i_1 
       (.I0(votes_load_reg_183[19]),
        .I1(max_vote_reg_194[19]),
        .I2(max_vote_1_fu_38[19]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[19]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[1]_i_1 
       (.I0(votes_load_reg_183[1]),
        .I1(max_vote_reg_194[1]),
        .I2(max_vote_1_fu_38[1]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[1]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[20]_i_1 
       (.I0(votes_load_reg_183[20]),
        .I1(max_vote_reg_194[20]),
        .I2(max_vote_1_fu_38[20]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[20]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[21]_i_1 
       (.I0(votes_load_reg_183[21]),
        .I1(max_vote_reg_194[21]),
        .I2(max_vote_1_fu_38[21]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[21]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[22]_i_1 
       (.I0(votes_load_reg_183[22]),
        .I1(max_vote_reg_194[22]),
        .I2(max_vote_1_fu_38[22]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[22]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[23]_i_1 
       (.I0(votes_load_reg_183[23]),
        .I1(max_vote_reg_194[23]),
        .I2(max_vote_1_fu_38[23]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[23]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[24]_i_1 
       (.I0(votes_load_reg_183[24]),
        .I1(max_vote_reg_194[24]),
        .I2(max_vote_1_fu_38[24]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[24]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[25]_i_1 
       (.I0(votes_load_reg_183[25]),
        .I1(max_vote_reg_194[25]),
        .I2(max_vote_1_fu_38[25]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[25]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[26]_i_1 
       (.I0(votes_load_reg_183[26]),
        .I1(max_vote_reg_194[26]),
        .I2(max_vote_1_fu_38[26]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[26]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[27]_i_1 
       (.I0(votes_load_reg_183[27]),
        .I1(max_vote_reg_194[27]),
        .I2(max_vote_1_fu_38[27]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[27]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[28]_i_1 
       (.I0(votes_load_reg_183[28]),
        .I1(max_vote_reg_194[28]),
        .I2(max_vote_1_fu_38[28]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[28]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[29]_i_1 
       (.I0(votes_load_reg_183[29]),
        .I1(max_vote_reg_194[29]),
        .I2(max_vote_1_fu_38[29]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[29]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[2]_i_1 
       (.I0(votes_load_reg_183[2]),
        .I1(max_vote_reg_194[2]),
        .I2(max_vote_1_fu_38[2]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[2]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[30]_i_1 
       (.I0(votes_load_reg_183[30]),
        .I1(max_vote_reg_194[30]),
        .I2(max_vote_1_fu_38[30]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[30]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[31]_i_1 
       (.I0(votes_load_reg_183[31]),
        .I1(max_vote_reg_194[31]),
        .I2(max_vote_1_fu_38[31]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[31]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[3]_i_1 
       (.I0(votes_load_reg_183[3]),
        .I1(max_vote_reg_194[3]),
        .I2(max_vote_1_fu_38[3]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[3]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[4]_i_1 
       (.I0(votes_load_reg_183[4]),
        .I1(max_vote_reg_194[4]),
        .I2(max_vote_1_fu_38[4]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[5]_i_1 
       (.I0(votes_load_reg_183[5]),
        .I1(max_vote_reg_194[5]),
        .I2(max_vote_1_fu_38[5]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[5]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[6]_i_1 
       (.I0(votes_load_reg_183[6]),
        .I1(max_vote_reg_194[6]),
        .I2(max_vote_1_fu_38[6]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[7]_i_1 
       (.I0(votes_load_reg_183[7]),
        .I1(max_vote_reg_194[7]),
        .I2(max_vote_1_fu_38[7]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[7]));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[8]_i_1 
       (.I0(votes_load_reg_183[8]),
        .I1(max_vote_reg_194[8]),
        .I2(max_vote_1_fu_38[8]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[8]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \max_vote_reg_194[9]_i_1 
       (.I0(votes_load_reg_183[9]),
        .I1(max_vote_reg_194[9]),
        .I2(max_vote_1_fu_38[9]),
        .I3(ap_enable_reg_pp0_iter3),
        .I4(icmp_ln74_fu_109_p2_carry__2_n_4),
        .O(max_vote_fu_114_p3[9]));
  FDRE \max_vote_reg_194_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[0]),
        .Q(max_vote_reg_194[0]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[10] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[10]),
        .Q(max_vote_reg_194[10]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[11] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[11]),
        .Q(max_vote_reg_194[11]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[12] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[12]),
        .Q(max_vote_reg_194[12]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[13] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[13]),
        .Q(max_vote_reg_194[13]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[14] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[14]),
        .Q(max_vote_reg_194[14]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[15] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[15]),
        .Q(max_vote_reg_194[15]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[16] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[16]),
        .Q(max_vote_reg_194[16]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[17] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[17]),
        .Q(max_vote_reg_194[17]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[18] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[18]),
        .Q(max_vote_reg_194[18]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[19] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[19]),
        .Q(max_vote_reg_194[19]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[1]),
        .Q(max_vote_reg_194[1]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[20] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[20]),
        .Q(max_vote_reg_194[20]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[21] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[21]),
        .Q(max_vote_reg_194[21]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[22] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[22]),
        .Q(max_vote_reg_194[22]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[23] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[23]),
        .Q(max_vote_reg_194[23]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[24] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[24]),
        .Q(max_vote_reg_194[24]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[25] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[25]),
        .Q(max_vote_reg_194[25]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[26] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[26]),
        .Q(max_vote_reg_194[26]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[27] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[27]),
        .Q(max_vote_reg_194[27]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[28] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[28]),
        .Q(max_vote_reg_194[28]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[29] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[29]),
        .Q(max_vote_reg_194[29]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[2]),
        .Q(max_vote_reg_194[2]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[30] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[30]),
        .Q(max_vote_reg_194[30]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[31] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[31]),
        .Q(max_vote_reg_194[31]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[3]),
        .Q(max_vote_reg_194[3]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[4]),
        .Q(max_vote_reg_194[4]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[5]),
        .Q(max_vote_reg_194[5]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[6]),
        .Q(max_vote_reg_194[6]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[7]),
        .Q(max_vote_reg_194[7]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[8]),
        .Q(max_vote_reg_194[8]),
        .R(1'b0));
  FDRE \max_vote_reg_194_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(max_vote_fu_114_p3[9]),
        .Q(max_vote_reg_194[9]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [0]),
        .Q(votes_load_reg_183[0]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[10] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [10]),
        .Q(votes_load_reg_183[10]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[11] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [11]),
        .Q(votes_load_reg_183[11]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[12] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [12]),
        .Q(votes_load_reg_183[12]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[13] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [13]),
        .Q(votes_load_reg_183[13]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[14] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [14]),
        .Q(votes_load_reg_183[14]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[15] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [15]),
        .Q(votes_load_reg_183[15]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[16] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [16]),
        .Q(votes_load_reg_183[16]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[17] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [17]),
        .Q(votes_load_reg_183[17]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[18] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [18]),
        .Q(votes_load_reg_183[18]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[19] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [19]),
        .Q(votes_load_reg_183[19]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [1]),
        .Q(votes_load_reg_183[1]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[20] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [20]),
        .Q(votes_load_reg_183[20]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[21] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [21]),
        .Q(votes_load_reg_183[21]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[22] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [22]),
        .Q(votes_load_reg_183[22]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[23] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [23]),
        .Q(votes_load_reg_183[23]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[24] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [24]),
        .Q(votes_load_reg_183[24]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[25] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [25]),
        .Q(votes_load_reg_183[25]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[26] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [26]),
        .Q(votes_load_reg_183[26]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[27] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [27]),
        .Q(votes_load_reg_183[27]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[28] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [28]),
        .Q(votes_load_reg_183[28]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[29] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [29]),
        .Q(votes_load_reg_183[29]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [2]),
        .Q(votes_load_reg_183[2]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[30] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [30]),
        .Q(votes_load_reg_183[30]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[31] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [31]),
        .Q(votes_load_reg_183[31]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [3]),
        .Q(votes_load_reg_183[3]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [4]),
        .Q(votes_load_reg_183[4]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [5]),
        .Q(votes_load_reg_183[5]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [6]),
        .Q(votes_load_reg_183[6]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [7]),
        .Q(votes_load_reg_183[7]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [8]),
        .Q(votes_load_reg_183[8]),
        .R(1'b0));
  FDRE \votes_load_reg_183_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\votes_load_reg_183_reg[31]_0 [9]),
        .Q(votes_load_reg_183[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "DigitRec_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init
   (ap_rst_0,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready,
    i_fu_420,
    votes_address0,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0,
    ap_loop_init,
    D,
    i_2_fu_90_p2,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg,
    ap_rst,
    ap_clk,
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg,
    ap_loop_exit_ready_pp0_iter1_reg_reg,
    ap_loop_exit_ready_pp0_iter1_reg_reg_0,
    ap_loop_exit_ready_pp0_iter1_reg_reg_1,
    ap_loop_exit_ready_pp0_iter1_reg_reg_2,
    Q,
    \q0_reg[31] ,
    \q0_reg[31]_0 ,
    \q0_reg[31]_1 ,
    \q0_reg[31]_2 ,
    ap_loop_exit_ready_pp0_iter2_reg);
  output ap_rst_0;
  output grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready;
  output i_fu_420;
  output [3:0]votes_address0;
  output [3:0]grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0;
  output ap_loop_init;
  output [1:0]D;
  output [3:0]i_2_fu_90_p2;
  output grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg;
  input ap_rst;
  input ap_clk;
  input grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  input ap_loop_exit_ready_pp0_iter1_reg_reg;
  input ap_loop_exit_ready_pp0_iter1_reg_reg_0;
  input ap_loop_exit_ready_pp0_iter1_reg_reg_1;
  input ap_loop_exit_ready_pp0_iter1_reg_reg_2;
  input [1:0]Q;
  input \q0_reg[31] ;
  input \q0_reg[31]_0 ;
  input \q0_reg[31]_1 ;
  input \q0_reg[31]_2 ;
  input ap_loop_exit_ready_pp0_iter2_reg;

  wire [1:0]D;
  wire [1:0]Q;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1__3_n_4;
  wire ap_loop_exit_ready_pp0_iter1_reg_reg;
  wire ap_loop_exit_ready_pp0_iter1_reg_reg_0;
  wire ap_loop_exit_ready_pp0_iter1_reg_reg_1;
  wire ap_loop_exit_ready_pp0_iter1_reg_reg_2;
  wire ap_loop_exit_ready_pp0_iter2_reg;
  wire ap_loop_init;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1__3_n_4;
  wire ap_rst;
  wire ap_rst_0;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_2_n_4;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg;
  wire [3:0]grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0;
  wire [3:0]i_2_fu_90_p2;
  wire i_fu_420;
  wire \q0_reg[31] ;
  wire \q0_reg[31]_0 ;
  wire \q0_reg[31]_1 ;
  wire \q0_reg[31]_2 ;
  wire [3:0]votes_address0;

  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'hFFFF0B00)) 
    \ap_CS_fsm[8]_i_1 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I1(ap_done_cache),
        .I2(ap_loop_exit_ready_pp0_iter2_reg),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h88A8)) 
    \ap_CS_fsm[9]_i_1 
       (.I0(Q[1]),
        .I1(ap_loop_exit_ready_pp0_iter2_reg),
        .I2(ap_done_cache),
        .I3(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(D[1]));
  LUT3 #(
    .INIT(8'hDC)) 
    ap_done_cache_i_1__3
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I1(ap_loop_exit_ready_pp0_iter2_reg),
        .I2(ap_done_cache),
        .O(ap_done_cache_i_1__3_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1__3_n_4),
        .Q(ap_done_cache),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h04)) 
    ap_enable_reg_pp0_iter1_i_1__1
       (.I0(ap_rst),
        .I1(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_2_n_4),
        .O(ap_rst_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    ap_loop_exit_ready_pp0_iter1_reg_i_1
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I4(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I5(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_ready));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hEFEE)) 
    ap_loop_init_int_i_1__3
       (.I0(ap_loop_exit_ready_pp0_iter2_reg),
        .I1(ap_rst),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(ap_loop_init_int),
        .O(ap_loop_init_int_i_1__3_n_4));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1__3_n_4),
        .Q(ap_loop_init_int),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_1
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_2_n_4),
        .I1(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I2(Q[0]),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_reg));
  LUT6 #(
    .INIT(64'h0002020200000000)) 
    grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_2
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I1(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I2(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I3(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I4(ap_loop_init_int),
        .I5(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg_i_2_n_4));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_169_pp0_iter2_reg_reg[0]_srl3_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[0]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_169_pp0_iter2_reg_reg[1]_srl3_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[1]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_169_pp0_iter2_reg_reg[2]_srl3_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[2]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_169_pp0_iter2_reg_reg[3]_srl3_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .O(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_votes_address0[3]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \i_fu_42[0]_i_1 
       (.I0(ap_loop_init_int),
        .I1(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .O(i_2_fu_90_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h12)) 
    \i_fu_42[1]_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I1(ap_loop_init_int),
        .I2(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .O(i_2_fu_90_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h060A)) 
    \i_fu_42[2]_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I1(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I2(ap_loop_init_int),
        .I3(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .O(i_2_fu_90_p2[2]));
  LUT6 #(
    .INIT(64'hF0F0F0D0F0F0F0F0)) 
    \i_fu_42[3]_i_1 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I4(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I5(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .O(i_fu_420));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'h060A0A0A)) 
    \i_fu_42[3]_i_2 
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .I1(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I2(ap_loop_init_int),
        .I3(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I4(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .O(i_2_fu_90_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \max_label_fu_34[3]_i_1 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I1(ap_loop_init_int),
        .O(ap_loop_init));
  LUT5 #(
    .INIT(32'h2AFF2A00)) 
    ram_reg_0_15_0_0_i_3
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_1),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(Q[1]),
        .I4(\q0_reg[31]_2 ),
        .O(votes_address0[0]));
  LUT5 #(
    .INIT(32'h2AFF2A00)) 
    ram_reg_0_15_0_0_i_4
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_2),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(Q[1]),
        .I4(\q0_reg[31]_0 ),
        .O(votes_address0[1]));
  LUT5 #(
    .INIT(32'h2AFF2A00)) 
    ram_reg_0_15_0_0_i_5
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg_0),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(Q[1]),
        .I4(\q0_reg[31]_1 ),
        .O(votes_address0[2]));
  LUT5 #(
    .INIT(32'h2AFF2A00)) 
    ram_reg_0_15_0_0_i_6
       (.I0(ap_loop_exit_ready_pp0_iter1_reg_reg),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209_ap_start_reg),
        .I3(Q[1]),
        .I4(\q0_reg[31] ),
        .O(votes_address0[3]));
endmodule

(* ORIG_REF_NAME = "DigitRec_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_0
   (ap_loop_init_int,
    ap_rst_0,
    D,
    \ap_CS_fsm_reg[6] ,
    \trunc_ln107_reg_510_reg[3] ,
    \ap_CS_fsm_reg[5] ,
    ap_rst,
    ap_clk,
    Q,
    ap_enable_reg_pp0_iter0,
    ap_enable_reg_pp0_iter0_reg,
    ap_done_cache_reg_0,
    grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg,
    ap_enable_reg_pp0_iter1_0,
    \ap_CS_fsm_reg[7] ,
    ap_done_cache_reg_1,
    \tmp_reg_130_reg[3] ,
    \tmp_reg_130_reg[3]_0 ,
    \tmp_reg_130_reg[3]_1 );
  output ap_loop_init_int;
  output ap_rst_0;
  output [1:0]D;
  output [1:0]\ap_CS_fsm_reg[6] ;
  output [3:0]\trunc_ln107_reg_510_reg[3] ;
  output \ap_CS_fsm_reg[5] ;
  input ap_rst;
  input ap_clk;
  input [3:0]Q;
  input ap_enable_reg_pp0_iter0;
  input ap_enable_reg_pp0_iter0_reg;
  input ap_done_cache_reg_0;
  input grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg;
  input ap_enable_reg_pp0_iter1_0;
  input [1:0]\ap_CS_fsm_reg[7] ;
  input ap_done_cache_reg_1;
  input [3:0]\tmp_reg_130_reg[3] ;
  input [3:0]\tmp_reg_130_reg[3]_0 ;
  input [3:0]\tmp_reg_130_reg[3]_1 ;

  wire [1:0]D;
  wire [3:0]Q;
  wire [0:0]add_ln69_fu_87_p2;
  wire \ap_CS_fsm[7]_i_2_n_4 ;
  wire \ap_CS_fsm_reg[5] ;
  wire [1:0]\ap_CS_fsm_reg[6] ;
  wire [1:0]\ap_CS_fsm_reg[7] ;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1__2_n_4;
  wire ap_done_cache_reg_0;
  wire ap_done_cache_reg_1;
  wire ap_done_reg1;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1_0;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1__2_n_4;
  wire ap_rst;
  wire ap_rst_0;
  wire grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg;
  wire [3:0]\tmp_reg_130_reg[3] ;
  wire [3:0]\tmp_reg_130_reg[3]_0 ;
  wire [3:0]\tmp_reg_130_reg[3]_1 ;
  wire [3:0]\trunc_ln107_reg_510_reg[3] ;

  LUT6 #(
    .INIT(64'hFFFFFFFF008022A2)) 
    \ap_CS_fsm[0]_i_1__0 
       (.I0(Q[0]),
        .I1(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I2(ap_done_cache_reg_0),
        .I3(\ap_CS_fsm[7]_i_2_n_4 ),
        .I4(ap_enable_reg_pp0_iter1_0),
        .I5(Q[3]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000010100000100)) 
    \ap_CS_fsm[1]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(ap_enable_reg_pp0_iter1_0),
        .I4(ap_done_reg1),
        .I5(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFFFF0B00)) 
    \ap_CS_fsm[6]_i_1 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I1(ap_done_cache),
        .I2(ap_done_reg1),
        .I3(\ap_CS_fsm_reg[7] [1]),
        .I4(\ap_CS_fsm_reg[7] [0]),
        .O(\ap_CS_fsm_reg[6] [0]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \ap_CS_fsm[6]_i_2 
       (.I0(ap_done_cache_reg_0),
        .I1(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I2(Q[0]),
        .I3(ap_loop_init_int),
        .I4(ap_done_cache_reg_1),
        .O(ap_done_reg1));
  LUT6 #(
    .INIT(64'h0A0A8A0A00008000)) 
    \ap_CS_fsm[7]_i_1 
       (.I0(\ap_CS_fsm_reg[7] [1]),
        .I1(Q[0]),
        .I2(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I3(ap_done_cache_reg_0),
        .I4(\ap_CS_fsm[7]_i_2_n_4 ),
        .I5(ap_done_cache),
        .O(\ap_CS_fsm_reg[6] [1]));
  LUT4 #(
    .INIT(16'h80FF)) 
    \ap_CS_fsm[7]_i_2 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I1(Q[0]),
        .I2(ap_loop_init_int),
        .I3(ap_done_cache_reg_1),
        .O(\ap_CS_fsm[7]_i_2_n_4 ));
  LUT6 #(
    .INIT(64'h0800FFFF08000000)) 
    ap_done_cache_i_1__2
       (.I0(ap_done_cache_reg_0),
        .I1(Q[0]),
        .I2(ap_loop_init_int),
        .I3(ap_done_cache_reg_1),
        .I4(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I5(ap_done_cache),
        .O(ap_done_cache_i_1__2_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1__2_n_4),
        .Q(ap_done_cache),
        .R(ap_rst));
  LUT6 #(
    .INIT(64'h5055000044444444)) 
    ap_enable_reg_pp0_iter0_reg_i_1__0
       (.I0(ap_rst),
        .I1(ap_enable_reg_pp0_iter0_reg),
        .I2(\ap_CS_fsm[7]_i_2_n_4 ),
        .I3(ap_done_cache_reg_0),
        .I4(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I5(Q[0]),
        .O(ap_rst_0));
  LUT5 #(
    .INIT(32'hEFFFEEEE)) 
    ap_loop_init_int_i_1__2
       (.I0(ap_done_reg1),
        .I1(ap_rst),
        .I2(Q[3]),
        .I3(ap_enable_reg_pp0_iter0),
        .I4(ap_loop_init_int),
        .O(ap_loop_init_int_i_1__2_n_4));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1__2_n_4),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFBFFAAAAFFFFAAAA)) 
    grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg_i_1
       (.I0(\ap_CS_fsm_reg[7] [0]),
        .I1(ap_done_cache_reg_1),
        .I2(ap_loop_init_int),
        .I3(Q[0]),
        .I4(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I5(ap_done_cache_reg_0),
        .O(\ap_CS_fsm_reg[5] ));
  LUT5 #(
    .INIT(32'hF0CCAAAA)) 
    \tmp_reg_130[0]_i_1 
       (.I0(\tmp_reg_130_reg[3] [0]),
        .I1(\tmp_reg_130_reg[3]_0 [0]),
        .I2(\tmp_reg_130_reg[3]_1 [0]),
        .I3(add_ln69_fu_87_p2),
        .I4(\ap_CS_fsm[7]_i_2_n_4 ),
        .O(\trunc_ln107_reg_510_reg[3] [0]));
  LUT5 #(
    .INIT(32'hF0CCAAAA)) 
    \tmp_reg_130[1]_i_1 
       (.I0(\tmp_reg_130_reg[3] [1]),
        .I1(\tmp_reg_130_reg[3]_0 [1]),
        .I2(\tmp_reg_130_reg[3]_1 [1]),
        .I3(add_ln69_fu_87_p2),
        .I4(\ap_CS_fsm[7]_i_2_n_4 ),
        .O(\trunc_ln107_reg_510_reg[3] [1]));
  LUT5 #(
    .INIT(32'hF0CCAAAA)) 
    \tmp_reg_130[2]_i_1 
       (.I0(\tmp_reg_130_reg[3] [2]),
        .I1(\tmp_reg_130_reg[3]_0 [2]),
        .I2(\tmp_reg_130_reg[3]_1 [2]),
        .I3(add_ln69_fu_87_p2),
        .I4(\ap_CS_fsm[7]_i_2_n_4 ),
        .O(\trunc_ln107_reg_510_reg[3] [2]));
  LUT5 #(
    .INIT(32'hF0CCAAAA)) 
    \tmp_reg_130[3]_i_1 
       (.I0(\tmp_reg_130_reg[3] [3]),
        .I1(\tmp_reg_130_reg[3]_0 [3]),
        .I2(\tmp_reg_130_reg[3]_1 [3]),
        .I3(add_ln69_fu_87_p2),
        .I4(\ap_CS_fsm[7]_i_2_n_4 ),
        .O(\trunc_ln107_reg_510_reg[3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h80FF)) 
    \tmp_reg_130[3]_i_2 
       (.I0(grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201_ap_start_reg),
        .I1(Q[0]),
        .I2(ap_loop_init_int),
        .I3(ap_done_cache_reg_0),
        .O(add_ln69_fu_87_p2));
endmodule

(* ORIG_REF_NAME = "DigitRec_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_1
   (ap_enable_reg_pp0_iter0,
    D,
    E,
    i_1_fu_24204_out,
    \ap_CS_fsm_reg[1] ,
    \ap_CS_fsm_reg[1]_0 ,
    \i_1_fu_242_reg[7] ,
    training_samples_address0,
    \ap_CS_fsm_reg[1]_1 ,
    \ap_CS_fsm_reg[1]_2 ,
    \ap_CS_fsm_reg[1]_3 ,
    \labels_2_1_fu_78_reg[3] ,
    \labels_1_1_fu_74_reg[3] ,
    \labels_0_1_fu_70_reg[3] ,
    \dists_0_1_fu_58_reg[8] ,
    zext_ln108_fu_748_p1,
    grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg,
    ap_rst,
    ap_clk,
    Q,
    ap_loop_exit_ready_pp0_iter2_reg,
    grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg,
    \dists_0_0_fu_62_reg[8] ,
    ap_enable_reg_pp0_iter3,
    icmp_ln53_reg_6897,
    or_ln55_reg_6914,
    icmp_ln55_1_reg_6909,
    icmp_ln55_reg_6904,
    \training_samples_address0[13] ,
    \icmp_ln107_reg_5042_reg[0] ,
    \icmp_ln107_reg_5042_reg[0]_0 ,
    \training_samples_address0[13]_0 ,
    \dists_1_0_fu_66_reg[8] ,
    \dists_1_0_fu_66_reg[8]_0 ,
    \dists_1_0_fu_66_reg[8]_1 ,
    \dists_2_0_fu_70_reg[8] ,
    \dists_2_0_fu_70_reg[8]_0 ,
    \dists_2_0_fu_70_reg[8]_1 ,
    \labels_2_3_fu_254_reg[3] ,
    \labels_2_3_fu_254_reg[3]_0 ,
    \labels_1_3_fu_250_reg[3] ,
    \labels_0_3_fu_246_reg[3] ,
    \dists_0_0_fu_62_reg[8]_0 ,
    \dists_0_0_fu_62_reg[8]_1 ,
    \dists_0_0_fu_62_reg[8]_2 ,
    ap_enable_reg_pp0_iter0_reg);
  output ap_enable_reg_pp0_iter0;
  output [1:0]D;
  output [0:0]E;
  output i_1_fu_24204_out;
  output [0:0]\ap_CS_fsm_reg[1] ;
  output [0:0]\ap_CS_fsm_reg[1]_0 ;
  output \i_1_fu_242_reg[7] ;
  output [11:0]training_samples_address0;
  output [8:0]\ap_CS_fsm_reg[1]_1 ;
  output [8:0]\ap_CS_fsm_reg[1]_2 ;
  output [0:0]\ap_CS_fsm_reg[1]_3 ;
  output [3:0]\labels_2_1_fu_78_reg[3] ;
  output [3:0]\labels_1_1_fu_74_reg[3] ;
  output [3:0]\labels_0_1_fu_70_reg[3] ;
  output [8:0]\dists_0_1_fu_58_reg[8] ;
  output [0:0]zext_ln108_fu_748_p1;
  output grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg;
  input ap_rst;
  input ap_clk;
  input [2:0]Q;
  input ap_loop_exit_ready_pp0_iter2_reg;
  input grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg;
  input [1:0]\dists_0_0_fu_62_reg[8] ;
  input ap_enable_reg_pp0_iter3;
  input icmp_ln53_reg_6897;
  input or_ln55_reg_6914;
  input icmp_ln55_1_reg_6909;
  input icmp_ln55_reg_6904;
  input [11:0]\training_samples_address0[13] ;
  input \icmp_ln107_reg_5042_reg[0] ;
  input \icmp_ln107_reg_5042_reg[0]_0 ;
  input [11:0]\training_samples_address0[13]_0 ;
  input [8:0]\dists_1_0_fu_66_reg[8] ;
  input [8:0]\dists_1_0_fu_66_reg[8]_0 ;
  input [8:0]\dists_1_0_fu_66_reg[8]_1 ;
  input [8:0]\dists_2_0_fu_70_reg[8] ;
  input [8:0]\dists_2_0_fu_70_reg[8]_0 ;
  input [8:0]\dists_2_0_fu_70_reg[8]_1 ;
  input [3:0]\labels_2_3_fu_254_reg[3] ;
  input [3:0]\labels_2_3_fu_254_reg[3]_0 ;
  input [3:0]\labels_1_3_fu_250_reg[3] ;
  input [3:0]\labels_0_3_fu_246_reg[3] ;
  input [8:0]\dists_0_0_fu_62_reg[8]_0 ;
  input [8:0]\dists_0_0_fu_62_reg[8]_1 ;
  input [8:0]\dists_0_0_fu_62_reg[8]_2 ;
  input ap_enable_reg_pp0_iter0_reg;

  wire [1:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [0:0]\ap_CS_fsm_reg[1] ;
  wire [0:0]\ap_CS_fsm_reg[1]_0 ;
  wire [8:0]\ap_CS_fsm_reg[1]_1 ;
  wire [8:0]\ap_CS_fsm_reg[1]_2 ;
  wire [0:0]\ap_CS_fsm_reg[1]_3 ;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1_n_4;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter3;
  wire ap_loop_exit_ready_pp0_iter2_reg;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1__1_n_4;
  wire ap_rst;
  wire [1:0]\dists_0_0_fu_62_reg[8] ;
  wire [8:0]\dists_0_0_fu_62_reg[8]_0 ;
  wire [8:0]\dists_0_0_fu_62_reg[8]_1 ;
  wire [8:0]\dists_0_0_fu_62_reg[8]_2 ;
  wire [8:0]\dists_0_1_fu_58_reg[8] ;
  wire [8:0]\dists_1_0_fu_66_reg[8] ;
  wire [8:0]\dists_1_0_fu_66_reg[8]_0 ;
  wire [8:0]\dists_1_0_fu_66_reg[8]_1 ;
  wire [8:0]\dists_2_0_fu_70_reg[8] ;
  wire [8:0]\dists_2_0_fu_70_reg[8]_0 ;
  wire [8:0]\dists_2_0_fu_70_reg[8]_1 ;
  wire grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg;
  wire grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg;
  wire i_1_fu_24204_out;
  wire \i_1_fu_242_reg[7] ;
  wire \icmp_ln107_reg_5042_reg[0] ;
  wire \icmp_ln107_reg_5042_reg[0]_0 ;
  wire icmp_ln53_reg_6897;
  wire icmp_ln55_1_reg_6909;
  wire icmp_ln55_reg_6904;
  wire [3:0]\labels_0_1_fu_70_reg[3] ;
  wire [3:0]\labels_0_3_fu_246_reg[3] ;
  wire [3:0]\labels_1_1_fu_74_reg[3] ;
  wire [3:0]\labels_1_3_fu_250_reg[3] ;
  wire [3:0]\labels_2_1_fu_78_reg[3] ;
  wire [3:0]\labels_2_3_fu_254_reg[3] ;
  wire [3:0]\labels_2_3_fu_254_reg[3]_0 ;
  wire or_ln55_reg_6914;
  wire [11:0]training_samples_address0;
  wire [11:0]\training_samples_address0[13] ;
  wire [11:0]\training_samples_address0[13]_0 ;
  wire [0:0]zext_ln108_fu_748_p1;

  LUT6 #(
    .INIT(64'hFFFFFFFF0BBB0000)) 
    \ap_CS_fsm[4]_i_1 
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(ap_done_cache),
        .I2(ap_loop_exit_ready_pp0_iter2_reg),
        .I3(Q[1]),
        .I4(\dists_0_0_fu_62_reg[8] [1]),
        .I5(\dists_0_0_fu_62_reg[8] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h8080AA80)) 
    \ap_CS_fsm[5]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8] [1]),
        .I1(Q[1]),
        .I2(ap_loop_exit_ready_pp0_iter2_reg),
        .I3(ap_done_cache),
        .I4(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hD5C0)) 
    ap_done_cache_i_1
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(ap_loop_exit_ready_pp0_iter2_reg),
        .I2(Q[1]),
        .I3(ap_done_cache),
        .O(ap_done_cache_i_1_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1_n_4),
        .Q(ap_done_cache),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ap_enable_reg_pp0_iter0_reg_i_1
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(Q[0]),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .O(ap_enable_reg_pp0_iter0));
  LUT6 #(
    .INIT(64'hFFFFFF70FF70FF70)) 
    ap_loop_init_int_i_1__1
       (.I0(ap_enable_reg_pp0_iter0),
        .I1(Q[2]),
        .I2(ap_loop_init_int),
        .I3(ap_rst),
        .I4(ap_loop_exit_ready_pp0_iter2_reg),
        .I5(Q[1]),
        .O(ap_loop_init_int_i_1__1_n_4));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1__1_n_4),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[0]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [0]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [0]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [0]),
        .O(\dists_0_1_fu_58_reg[8] [0]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[1]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [1]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [1]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [1]),
        .O(\dists_0_1_fu_58_reg[8] [1]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[2]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [2]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [2]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [2]),
        .O(\dists_0_1_fu_58_reg[8] [2]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[3]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [3]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [3]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [3]),
        .O(\dists_0_1_fu_58_reg[8] [3]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[4]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [4]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [4]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [4]),
        .O(\dists_0_1_fu_58_reg[8] [4]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[5]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [5]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [5]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [5]),
        .O(\dists_0_1_fu_58_reg[8] [5]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[6]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [6]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [6]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [6]),
        .O(\dists_0_1_fu_58_reg[8] [6]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[7]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [7]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [7]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [7]),
        .O(\dists_0_1_fu_58_reg[8] [7]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \dists_0_0_fu_62[8]_i_1 
       (.I0(\dists_0_0_fu_62_reg[8]_0 [8]),
        .I1(i_1_fu_24204_out),
        .I2(\dists_0_0_fu_62_reg[8]_1 [8]),
        .I3(Q[1]),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(\dists_0_0_fu_62_reg[8]_2 [8]),
        .O(\dists_0_1_fu_58_reg[8] [8]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[0]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [0]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [0]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [0]),
        .O(\ap_CS_fsm_reg[1]_1 [0]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[1]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [1]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [1]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [1]),
        .O(\ap_CS_fsm_reg[1]_1 [1]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[2]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [2]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [2]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [2]),
        .O(\ap_CS_fsm_reg[1]_1 [2]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[3]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [3]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [3]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [3]),
        .O(\ap_CS_fsm_reg[1]_1 [3]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[4]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [4]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [4]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [4]),
        .O(\ap_CS_fsm_reg[1]_1 [4]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[5]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [5]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [5]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [5]),
        .O(\ap_CS_fsm_reg[1]_1 [5]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[6]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [6]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [6]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [6]),
        .O(\ap_CS_fsm_reg[1]_1 [6]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[7]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [7]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [7]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [7]),
        .O(\ap_CS_fsm_reg[1]_1 [7]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_1_0_fu_66[8]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_1_0_fu_66_reg[8] [8]),
        .I3(\dists_1_0_fu_66_reg[8]_0 [8]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_1_0_fu_66_reg[8]_1 [8]),
        .O(\ap_CS_fsm_reg[1]_1 [8]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[0]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [0]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [0]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [0]),
        .O(\ap_CS_fsm_reg[1]_2 [0]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[1]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [1]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [1]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [1]),
        .O(\ap_CS_fsm_reg[1]_2 [1]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[2]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [2]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [2]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [2]),
        .O(\ap_CS_fsm_reg[1]_2 [2]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[3]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [3]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [3]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [3]),
        .O(\ap_CS_fsm_reg[1]_2 [3]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[4]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [4]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [4]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [4]),
        .O(\ap_CS_fsm_reg[1]_2 [4]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[5]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [5]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [5]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [5]),
        .O(\ap_CS_fsm_reg[1]_2 [5]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[6]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [6]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [6]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [6]),
        .O(\ap_CS_fsm_reg[1]_2 [6]));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[7]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [7]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [7]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [7]),
        .O(\ap_CS_fsm_reg[1]_2 [7]));
  LUT6 #(
    .INIT(64'hF888888800000000)) 
    \dists_2_0_fu_70[8]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(ap_loop_init_int),
        .I3(Q[0]),
        .I4(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I5(\dists_0_0_fu_62_reg[8] [1]),
        .O(\ap_CS_fsm_reg[1]_3 ));
  LUT6 #(
    .INIT(64'hFFFFF7800000F780)) 
    \dists_2_0_fu_70[8]_i_2 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(\dists_2_0_fu_70_reg[8] [8]),
        .I3(\dists_2_0_fu_70_reg[8]_0 [8]),
        .I4(i_1_fu_24204_out),
        .I5(\dists_2_0_fu_70_reg[8]_1 [8]),
        .O(\ap_CS_fsm_reg[1]_2 [8]));
  LUT3 #(
    .INIT(8'h80)) 
    \i_1_fu_242[11]_i_1 
       (.I0(ap_loop_init_int),
        .I1(Q[0]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .O(i_1_fu_24204_out));
  LUT6 #(
    .INIT(64'h2A00FFFF2A00AA00)) 
    \icmp_ln107_reg_5042[0]_i_1 
       (.I0(\training_samples_address0[13] [7]),
        .I1(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\icmp_ln107_reg_5042_reg[0] ),
        .I4(Q[0]),
        .I5(\icmp_ln107_reg_5042_reg[0]_0 ),
        .O(\i_1_fu_242_reg[7] ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_0_3_fu_246[0]_i_1 
       (.I0(\labels_0_3_fu_246_reg[3] [0]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [0]),
        .O(\labels_0_1_fu_70_reg[3] [0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_0_3_fu_246[1]_i_1 
       (.I0(\labels_0_3_fu_246_reg[3] [1]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [1]),
        .O(\labels_0_1_fu_70_reg[3] [1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_0_3_fu_246[2]_i_1 
       (.I0(\labels_0_3_fu_246_reg[3] [2]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [2]),
        .O(\labels_0_1_fu_70_reg[3] [2]));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \labels_0_3_fu_246[3]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(icmp_ln55_reg_6904),
        .I3(icmp_ln53_reg_6897),
        .I4(i_1_fu_24204_out),
        .O(\ap_CS_fsm_reg[1]_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_0_3_fu_246[3]_i_2 
       (.I0(\labels_0_3_fu_246_reg[3] [3]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [3]),
        .O(\labels_0_1_fu_70_reg[3] [3]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_1_3_fu_250[0]_i_1 
       (.I0(\labels_1_3_fu_250_reg[3] [0]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [0]),
        .O(\labels_1_1_fu_74_reg[3] [0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_1_3_fu_250[1]_i_1 
       (.I0(\labels_1_3_fu_250_reg[3] [1]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [1]),
        .O(\labels_1_1_fu_74_reg[3] [1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_1_3_fu_250[2]_i_1 
       (.I0(\labels_1_3_fu_250_reg[3] [2]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [2]),
        .O(\labels_1_1_fu_74_reg[3] [2]));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \labels_1_3_fu_250[3]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(icmp_ln55_1_reg_6909),
        .I3(icmp_ln53_reg_6897),
        .I4(i_1_fu_24204_out),
        .O(\ap_CS_fsm_reg[1] ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_1_3_fu_250[3]_i_2 
       (.I0(\labels_1_3_fu_250_reg[3] [3]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [3]),
        .O(\labels_1_1_fu_74_reg[3] [3]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_2_3_fu_254[0]_i_1 
       (.I0(\labels_2_3_fu_254_reg[3] [0]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [0]),
        .O(\labels_2_1_fu_78_reg[3] [0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_2_3_fu_254[1]_i_1 
       (.I0(\labels_2_3_fu_254_reg[3] [1]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [1]),
        .O(\labels_2_1_fu_78_reg[3] [1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_2_3_fu_254[2]_i_1 
       (.I0(\labels_2_3_fu_254_reg[3] [2]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [2]),
        .O(\labels_2_1_fu_78_reg[3] [2]));
  LUT5 #(
    .INIT(32'hFFFF0080)) 
    \labels_2_3_fu_254[3]_i_1 
       (.I0(Q[1]),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(icmp_ln53_reg_6897),
        .I3(or_ln55_reg_6914),
        .I4(i_1_fu_24204_out),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \labels_2_3_fu_254[3]_i_2 
       (.I0(\labels_2_3_fu_254_reg[3] [3]),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(\labels_2_3_fu_254_reg[3]_0 [3]),
        .O(\labels_2_1_fu_78_reg[3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \shl_ln_reg_5046[13]_i_1 
       (.I0(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I1(ap_loop_init_int),
        .I2(Q[0]),
        .O(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \shl_ln_reg_5046[9]_i_1 
       (.I0(\training_samples_address0[13] [7]),
        .I1(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I2(ap_loop_init_int),
        .O(zext_ln108_fu_748_p1));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[10]_INST_0 
       (.I0(\training_samples_address0[13]_0 [8]),
        .I1(\training_samples_address0[13] [8]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[11]_INST_0 
       (.I0(\training_samples_address0[13]_0 [9]),
        .I1(\training_samples_address0[13] [9]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[9]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[12]_INST_0 
       (.I0(\training_samples_address0[13]_0 [10]),
        .I1(\training_samples_address0[13] [10]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[13]_INST_0 
       (.I0(\training_samples_address0[13]_0 [11]),
        .I1(\training_samples_address0[13] [11]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[11]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[2]_INST_0 
       (.I0(\training_samples_address0[13]_0 [0]),
        .I1(\training_samples_address0[13] [0]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[3]_INST_0 
       (.I0(\training_samples_address0[13]_0 [1]),
        .I1(\training_samples_address0[13] [1]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[4]_INST_0 
       (.I0(\training_samples_address0[13]_0 [2]),
        .I1(\training_samples_address0[13] [2]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[5]_INST_0 
       (.I0(\training_samples_address0[13]_0 [3]),
        .I1(\training_samples_address0[13] [3]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[6]_INST_0 
       (.I0(\training_samples_address0[13]_0 [4]),
        .I1(\training_samples_address0[13] [4]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[4]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[7]_INST_0 
       (.I0(\training_samples_address0[13]_0 [5]),
        .I1(\training_samples_address0[13] [5]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[5]));
  LUT6 #(
    .INIT(64'hAAAAAAAA0CCCCCCC)) 
    \training_samples_address1[8]_INST_0 
       (.I0(\training_samples_address0[13]_0 [6]),
        .I1(\training_samples_address0[13] [6]),
        .I2(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I3(Q[0]),
        .I4(ap_loop_init_int),
        .I5(Q[1]),
        .O(training_samples_address0[6]));
  LUT6 #(
    .INIT(64'h88B8B8B8B8B8B8B8)) 
    \training_samples_address1[9]_INST_0 
       (.I0(\training_samples_address0[13]_0 [7]),
        .I1(Q[1]),
        .I2(\training_samples_address0[13] [7]),
        .I3(grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177_ap_start_reg),
        .I4(Q[0]),
        .I5(ap_loop_init_int),
        .O(training_samples_address0[7]));
endmodule

(* ORIG_REF_NAME = "DigitRec_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_2
   (ap_loop_init_int,
    SR,
    \i_fu_54_reg[0] ,
    D,
    \i_fu_54_reg[1] ,
    E,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0,
    \t_fu_58_reg[2] ,
    \i_fu_54_reg[0]_0 ,
    ap_rst,
    ap_clk,
    ap_done_cache_reg_0,
    grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg,
    ap_done_cache_reg_1,
    \ap_CS_fsm_reg[2] ,
    Q,
    ap_done_cache,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg,
    \t_fu_58_reg[0] );
  output ap_loop_init_int;
  output [0:0]SR;
  output [0:0]\i_fu_54_reg[0] ;
  output [1:0]D;
  output [0:0]\i_fu_54_reg[1] ;
  output [0:0]E;
  output grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  output \t_fu_58_reg[2] ;
  output \i_fu_54_reg[0]_0 ;
  input ap_rst;
  input ap_clk;
  input ap_done_cache_reg_0;
  input grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg;
  input ap_done_cache_reg_1;
  input \ap_CS_fsm_reg[2] ;
  input [1:0]Q;
  input ap_done_cache;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  input [8:0]\t_fu_58_reg[0] ;

  wire [1:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire \ap_CS_fsm[3]_i_3_n_4 ;
  wire \ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_0;
  wire ap_done_cache_i_1__0_n_4;
  wire ap_done_cache_reg_0;
  wire ap_done_cache_reg_1;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1_n_4;
  wire ap_rst;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  wire grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg;
  wire [0:0]\i_fu_54_reg[0] ;
  wire \i_fu_54_reg[0]_0 ;
  wire [0:0]\i_fu_54_reg[1] ;
  wire [8:0]\t_fu_58_reg[0] ;
  wire \t_fu_58_reg[2] ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFF005700)) 
    \ap_CS_fsm[2]_i_1__0 
       (.I0(\ap_CS_fsm_reg[2] ),
        .I1(ap_done_cache_0),
        .I2(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I3(Q[1]),
        .I4(\ap_CS_fsm[3]_i_3_n_4 ),
        .I5(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h0000A800)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(\ap_CS_fsm_reg[2] ),
        .I1(ap_done_cache_0),
        .I2(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I3(Q[1]),
        .I4(\ap_CS_fsm[3]_i_3_n_4 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFF11111FFF1111)) 
    \ap_CS_fsm[3]_i_3 
       (.I0(ap_done_cache),
        .I1(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .I2(ap_done_cache_reg_1),
        .I3(ap_done_cache_reg_0),
        .I4(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I5(ap_loop_init_int),
        .O(\ap_CS_fsm[3]_i_3_n_4 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h40FF4000)) 
    ap_done_cache_i_1__0
       (.I0(ap_loop_init_int),
        .I1(ap_done_cache_reg_0),
        .I2(ap_done_cache_reg_1),
        .I3(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I4(ap_done_cache_0),
        .O(ap_done_cache_i_1__0_n_4));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1__0_n_4),
        .Q(ap_done_cache_0),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAAFFEAAA)) 
    ap_loop_init_int_i_1
       (.I0(ap_rst),
        .I1(ap_done_cache_reg_1),
        .I2(ap_done_cache_reg_0),
        .I3(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I4(ap_loop_init_int),
        .O(ap_loop_init_int_i_1_n_4));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1_n_4),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    ap_ready_INST_0_i_1
       (.I0(\t_fu_58_reg[0] [2]),
        .I1(\t_fu_58_reg[0] [3]),
        .I2(\t_fu_58_reg[0] [0]),
        .I3(\t_fu_58_reg[0] [1]),
        .I4(\t_fu_58_reg[0] [8]),
        .I5(\t_fu_58_reg[0] [4]),
        .O(\t_fu_58_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFF070)) 
    grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg_i_1
       (.I0(ap_done_cache_reg_1),
        .I1(ap_done_cache_reg_0),
        .I2(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I3(ap_loop_init_int),
        .I4(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .O(\i_fu_54_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hC0C4)) 
    \labels_0_1_fu_70[3]_i_1 
       (.I0(ap_done_cache_reg_0),
        .I1(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(ap_done_cache_reg_1),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \labels_1_1_fu_74[3]_i_1 
       (.I0(ap_done_cache_reg_0),
        .I1(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(ap_done_cache_reg_1),
        .O(\i_fu_54_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \labels_2_1_fu_78[3]_i_1 
       (.I0(ap_done_cache_reg_1),
        .I1(ap_done_cache_reg_0),
        .I2(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I3(ap_loop_init_int),
        .O(\i_fu_54_reg[0] ));
  LUT2 #(
    .INIT(4'h8)) 
    \labels_2_1_fu_78[3]_i_2 
       (.I0(grp_DigitRec_Pipeline_SET_KNN_SET_fu_156_ap_start_reg),
        .I1(ap_loop_init_int),
        .O(E));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \t_fu_58[8]_i_2 
       (.I0(Q[0]),
        .I1(\t_fu_58_reg[0] [7]),
        .I2(\t_fu_58_reg[0] [6]),
        .I3(\t_fu_58_reg[0] [5]),
        .I4(\t_fu_58_reg[2] ),
        .O(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0));
endmodule

(* ORIG_REF_NAME = "DigitRec_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_DigitRec_flow_control_loop_pipe_sequential_init_3
   (ap_done_cache,
    ap_sig_allocacmp_p_load,
    empty_fu_240,
    ap_loop_init_int_reg_0,
    empty_568_fu_56_p2,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg,
    ap_rst,
    ap_clk,
    \p_load_reg_78_reg[0] ,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg,
    \p_load_reg_78_reg[2] ,
    \p_load_reg_78_reg[3] ,
    ap_enable_reg_pp0_iter1_reg,
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0);
  output ap_done_cache;
  output [3:0]ap_sig_allocacmp_p_load;
  output empty_fu_240;
  output ap_loop_init_int_reg_0;
  output [3:0]empty_568_fu_56_p2;
  output grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg;
  input ap_rst;
  input ap_clk;
  input \p_load_reg_78_reg[0] ;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  input \p_load_reg_78_reg[2] ;
  input \p_load_reg_78_reg[3] ;
  input ap_enable_reg_pp0_iter1_reg;
  input grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;

  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1__1_n_4;
  wire ap_enable_reg_pp0_iter1_reg;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1__0_n_4;
  wire ap_loop_init_int_reg_0;
  wire ap_rst;
  wire [3:0]ap_sig_allocacmp_p_load;
  wire [3:0]empty_568_fu_56_p2;
  wire empty_fu_240;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_ready;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0;
  wire grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg;
  wire \p_load_reg_78_reg[0] ;
  wire \p_load_reg_78_reg[2] ;
  wire \p_load_reg_78_reg[3] ;

  LUT6 #(
    .INIT(64'h00000400FFFFFFFF)) 
    \ap_CS_fsm[3]_i_2 
       (.I0(ap_loop_init_int),
        .I1(ap_enable_reg_pp0_iter1_reg),
        .I2(\p_load_reg_78_reg[0] ),
        .I3(\p_load_reg_78_reg[3] ),
        .I4(\p_load_reg_78_reg[2] ),
        .I5(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(ap_loop_init_int_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ap_done_cache_i_1__1
       (.I0(grp_DigitRec_Pipeline_3_fu_172_ap_ready),
        .I1(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .I2(ap_done_cache),
        .O(ap_done_cache_i_1__1_n_4));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    ap_done_cache_i_2
       (.I0(ap_loop_init_int),
        .I1(ap_enable_reg_pp0_iter1_reg),
        .I2(\p_load_reg_78_reg[0] ),
        .I3(\p_load_reg_78_reg[3] ),
        .I4(\p_load_reg_78_reg[2] ),
        .I5(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(grp_DigitRec_Pipeline_3_fu_172_ap_ready));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1__1_n_4),
        .Q(ap_done_cache),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFF2)) 
    ap_loop_init_int_i_1__0
       (.I0(ap_loop_init_int),
        .I1(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .I2(ap_rst),
        .I3(grp_DigitRec_Pipeline_3_fu_172_ap_ready),
        .O(ap_loop_init_int_i_1__0_n_4));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1__0_n_4),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \empty_fu_24[0]_i_1 
       (.I0(ap_loop_init_int),
        .I1(\p_load_reg_78_reg[0] ),
        .O(empty_568_fu_56_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \empty_fu_24[1]_i_1 
       (.I0(\p_load_reg_78_reg[0] ),
        .I1(ap_enable_reg_pp0_iter1_reg),
        .I2(ap_loop_init_int),
        .O(empty_568_fu_56_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1222)) 
    \empty_fu_24[2]_i_1 
       (.I0(\p_load_reg_78_reg[2] ),
        .I1(ap_loop_init_int),
        .I2(ap_enable_reg_pp0_iter1_reg),
        .I3(\p_load_reg_78_reg[0] ),
        .O(empty_568_fu_56_p2[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAA8AAAAA)) 
    \empty_fu_24[3]_i_1 
       (.I0(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .I1(\p_load_reg_78_reg[2] ),
        .I2(\p_load_reg_78_reg[3] ),
        .I3(\p_load_reg_78_reg[0] ),
        .I4(ap_enable_reg_pp0_iter1_reg),
        .I5(ap_loop_init_int),
        .O(empty_fu_240));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h006A00AA)) 
    \empty_fu_24[3]_i_2 
       (.I0(\p_load_reg_78_reg[3] ),
        .I1(\p_load_reg_78_reg[0] ),
        .I2(ap_enable_reg_pp0_iter1_reg),
        .I3(ap_loop_init_int),
        .I4(\p_load_reg_78_reg[2] ),
        .O(empty_568_fu_56_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hDC)) 
    grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_i_1
       (.I0(grp_DigitRec_Pipeline_3_fu_172_ap_ready),
        .I1(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg0),
        .I2(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \p_load_reg_78[0]_i_1 
       (.I0(\p_load_reg_78_reg[0] ),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(ap_sig_allocacmp_p_load[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \p_load_reg_78[1]_i_1 
       (.I0(ap_enable_reg_pp0_iter1_reg),
        .I1(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .I2(ap_loop_init_int),
        .O(ap_sig_allocacmp_p_load[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \p_load_reg_78[2]_i_1 
       (.I0(\p_load_reg_78_reg[2] ),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(ap_sig_allocacmp_p_load[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \p_load_reg_78[3]_i_1 
       (.I0(\p_load_reg_78_reg[3] ),
        .I1(ap_loop_init_int),
        .I2(grp_DigitRec_Pipeline_3_fu_172_ap_start_reg),
        .O(ap_sig_allocacmp_p_load[3]));
endmodule

(* ORIG_REF_NAME = "DigitRec_votes_RAM_AUTO_1R1W" *) 
module bd_0_hls_inst_0_DigitRec_votes_RAM_AUTO_1R1W
   (q0,
    E,
    ap_clk,
    d0,
    p_0_in,
    votes_address0);
  output [31:0]q0;
  input [0:0]E;
  input ap_clk;
  input [31:0]d0;
  input p_0_in;
  input [3:0]votes_address0;

  wire [0:0]E;
  wire ap_clk;
  wire [31:0]d0;
  wire p_0_in;
  wire [31:0]q0;
  wire [31:0]q00;
  wire [3:0]votes_address0;

  FDRE \q0_reg[0] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[0]),
        .Q(q0[0]),
        .R(1'b0));
  FDRE \q0_reg[10] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[10]),
        .Q(q0[10]),
        .R(1'b0));
  FDRE \q0_reg[11] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[11]),
        .Q(q0[11]),
        .R(1'b0));
  FDRE \q0_reg[12] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[12]),
        .Q(q0[12]),
        .R(1'b0));
  FDRE \q0_reg[13] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[13]),
        .Q(q0[13]),
        .R(1'b0));
  FDRE \q0_reg[14] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[14]),
        .Q(q0[14]),
        .R(1'b0));
  FDRE \q0_reg[15] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[15]),
        .Q(q0[15]),
        .R(1'b0));
  FDRE \q0_reg[16] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[16]),
        .Q(q0[16]),
        .R(1'b0));
  FDRE \q0_reg[17] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[17]),
        .Q(q0[17]),
        .R(1'b0));
  FDRE \q0_reg[18] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[18]),
        .Q(q0[18]),
        .R(1'b0));
  FDRE \q0_reg[19] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[19]),
        .Q(q0[19]),
        .R(1'b0));
  FDRE \q0_reg[1] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[1]),
        .Q(q0[1]),
        .R(1'b0));
  FDRE \q0_reg[20] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[20]),
        .Q(q0[20]),
        .R(1'b0));
  FDRE \q0_reg[21] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[21]),
        .Q(q0[21]),
        .R(1'b0));
  FDRE \q0_reg[22] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[22]),
        .Q(q0[22]),
        .R(1'b0));
  FDRE \q0_reg[23] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[23]),
        .Q(q0[23]),
        .R(1'b0));
  FDRE \q0_reg[24] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[24]),
        .Q(q0[24]),
        .R(1'b0));
  FDRE \q0_reg[25] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[25]),
        .Q(q0[25]),
        .R(1'b0));
  FDRE \q0_reg[26] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[26]),
        .Q(q0[26]),
        .R(1'b0));
  FDRE \q0_reg[27] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[27]),
        .Q(q0[27]),
        .R(1'b0));
  FDRE \q0_reg[28] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[28]),
        .Q(q0[28]),
        .R(1'b0));
  FDRE \q0_reg[29] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[29]),
        .Q(q0[29]),
        .R(1'b0));
  FDRE \q0_reg[2] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[2]),
        .Q(q0[2]),
        .R(1'b0));
  FDRE \q0_reg[30] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[30]),
        .Q(q0[30]),
        .R(1'b0));
  FDRE \q0_reg[31] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[31]),
        .Q(q0[31]),
        .R(1'b0));
  FDRE \q0_reg[3] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[3]),
        .Q(q0[3]),
        .R(1'b0));
  FDRE \q0_reg[4] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[4]),
        .Q(q0[4]),
        .R(1'b0));
  FDRE \q0_reg[5] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[5]),
        .Q(q0[5]),
        .R(1'b0));
  FDRE \q0_reg[6] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[6]),
        .Q(q0[6]),
        .R(1'b0));
  FDRE \q0_reg[7] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[7]),
        .Q(q0[7]),
        .R(1'b0));
  FDRE \q0_reg[8] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[8]),
        .Q(q0[8]),
        .R(1'b0));
  FDRE \q0_reg[9] 
       (.C(ap_clk),
        .CE(E),
        .D(q00[9]),
        .Q(q0[9]),
        .R(1'b0));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_0_0
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[0]),
        .O(q00[0]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "10" *) 
  (* ram_slice_end = "10" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_10_10
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[10]),
        .O(q00[10]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "11" *) 
  (* ram_slice_end = "11" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_11_11
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[11]),
        .O(q00[11]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "12" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_12_12
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[12]),
        .O(q00[12]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "13" *) 
  (* ram_slice_end = "13" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_13_13
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[13]),
        .O(q00[13]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "14" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_14_14
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[14]),
        .O(q00[14]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_15_15
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[15]),
        .O(q00[15]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "16" *) 
  (* ram_slice_end = "16" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_16_16
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[16]),
        .O(q00[16]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "17" *) 
  (* ram_slice_end = "17" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_17_17
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[17]),
        .O(q00[17]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "18" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_18_18
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[18]),
        .O(q00[18]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "19" *) 
  (* ram_slice_end = "19" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_19_19
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[19]),
        .O(q00[19]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "1" *) 
  (* ram_slice_end = "1" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_1_1
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[1]),
        .O(q00[1]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "20" *) 
  (* ram_slice_end = "20" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_20_20
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[20]),
        .O(q00[20]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "21" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_21_21
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[21]),
        .O(q00[21]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "22" *) 
  (* ram_slice_end = "22" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_22_22
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[22]),
        .O(q00[22]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "23" *) 
  (* ram_slice_end = "23" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_23_23
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[23]),
        .O(q00[23]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "24" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_24_24
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[24]),
        .O(q00[24]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "25" *) 
  (* ram_slice_end = "25" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_25_25
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[25]),
        .O(q00[25]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "26" *) 
  (* ram_slice_end = "26" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_26_26
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[26]),
        .O(q00[26]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "27" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_27_27
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[27]),
        .O(q00[27]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "28" *) 
  (* ram_slice_end = "28" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_28_28
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[28]),
        .O(q00[28]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "29" *) 
  (* ram_slice_end = "29" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_29_29
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[29]),
        .O(q00[29]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_2_2
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[2]),
        .O(q00[2]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "30" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_30_30
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[30]),
        .O(q00[30]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_31_31
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[31]),
        .O(q00[31]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_3_3
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[3]),
        .O(q00[3]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_4_4
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[4]),
        .O(q00[4]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_5_5
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[5]),
        .O(q00[5]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_6_6
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[6]),
        .O(q00[6]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_7_7
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[7]),
        .O(q00[7]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_8_8
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[8]),
        .O(q00[8]),
        .WCLK(ap_clk),
        .WE(p_0_in));
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "votes_U/ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "9" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    ram_reg_0_15_9_9
       (.A0(votes_address0[0]),
        .A1(votes_address0[1]),
        .A2(votes_address0[2]),
        .A3(votes_address0[3]),
        .A4(1'b0),
        .D(d0[9]),
        .O(q00[9]),
        .WCLK(ap_clk),
        .WE(p_0_in));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
