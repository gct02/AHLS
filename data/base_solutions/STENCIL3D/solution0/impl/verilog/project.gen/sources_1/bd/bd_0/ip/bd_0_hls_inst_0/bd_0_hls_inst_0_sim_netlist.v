// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu May 29 20:04:09 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/STENCIL3D/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.v
// Design      : bd_0_hls_inst_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,stencil3d,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "stencil3d,Vivado 2023.2" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module bd_0_hls_inst_0
   (C_ce0,
    C_ce1,
    orig_ce0,
    orig_ce1,
    sol_ce0,
    sol_we0,
    sol_ce1,
    sol_we1,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    C_address0,
    C_q0,
    C_address1,
    C_q1,
    orig_address0,
    orig_q0,
    orig_address1,
    orig_q1,
    sol_address0,
    sol_d0,
    sol_address1,
    sol_d1);
  output C_ce0;
  output C_ce1;
  output orig_ce0;
  output orig_ce1;
  output sol_ce0;
  output sol_we0;
  output sol_ce1;
  output sol_we1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 C_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME C_address0, LAYERED_METADATA undef" *) output [0:0]C_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 C_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME C_q0, LAYERED_METADATA undef" *) input [31:0]C_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 C_address1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME C_address1, LAYERED_METADATA undef" *) output [0:0]C_address1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 C_q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME C_q1, LAYERED_METADATA undef" *) input [31:0]C_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 orig_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME orig_address0, LAYERED_METADATA undef" *) output [10:0]orig_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 orig_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME orig_q0, LAYERED_METADATA undef" *) input [31:0]orig_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 orig_address1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME orig_address1, LAYERED_METADATA undef" *) output [10:0]orig_address1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 orig_q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME orig_q1, LAYERED_METADATA undef" *) input [31:0]orig_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 sol_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sol_address0, LAYERED_METADATA undef" *) output [10:0]sol_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 sol_d0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sol_d0, LAYERED_METADATA undef" *) output [31:0]sol_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 sol_address1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sol_address1, LAYERED_METADATA undef" *) output [10:0]sol_address1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 sol_d1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sol_d1, LAYERED_METADATA undef" *) output [31:0]sol_d1;

  wire \<const0> ;
  wire \<const1> ;
  wire C_ce0;
  wire C_ce1;
  wire [31:0]C_q0;
  wire [31:0]C_q1;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [10:0]orig_address0;
  wire [10:0]orig_address1;
  wire orig_ce0;
  wire orig_ce1;
  wire [31:0]orig_q0;
  wire [31:0]orig_q1;
  wire [10:0]sol_address0;
  wire [10:0]sol_address1;
  wire sol_ce0;
  wire sol_ce1;
  wire [31:0]sol_d0;
  wire [31:0]sol_d1;
  wire sol_we0;
  wire sol_we1;
  wire [0:0]NLW_inst_C_address0_UNCONNECTED;
  wire [0:0]NLW_inst_C_address1_UNCONNECTED;

  assign C_address0[0] = \<const1> ;
  assign C_address1[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "20'b00000000000000000001" *) 
  (* ap_ST_fsm_state10 = "20'b00000000001000000000" *) 
  (* ap_ST_fsm_state11 = "20'b00000000010000000000" *) 
  (* ap_ST_fsm_state12 = "20'b00000000100000000000" *) 
  (* ap_ST_fsm_state13 = "20'b00000001000000000000" *) 
  (* ap_ST_fsm_state14 = "20'b00000010000000000000" *) 
  (* ap_ST_fsm_state15 = "20'b00000100000000000000" *) 
  (* ap_ST_fsm_state16 = "20'b00001000000000000000" *) 
  (* ap_ST_fsm_state17 = "20'b00010000000000000000" *) 
  (* ap_ST_fsm_state18 = "20'b00100000000000000000" *) 
  (* ap_ST_fsm_state19 = "20'b01000000000000000000" *) 
  (* ap_ST_fsm_state2 = "20'b00000000000000000010" *) 
  (* ap_ST_fsm_state20 = "20'b10000000000000000000" *) 
  (* ap_ST_fsm_state3 = "20'b00000000000000000100" *) 
  (* ap_ST_fsm_state4 = "20'b00000000000000001000" *) 
  (* ap_ST_fsm_state5 = "20'b00000000000000010000" *) 
  (* ap_ST_fsm_state6 = "20'b00000000000000100000" *) 
  (* ap_ST_fsm_state7 = "20'b00000000000001000000" *) 
  (* ap_ST_fsm_state8 = "20'b00000000000010000000" *) 
  (* ap_ST_fsm_state9 = "20'b00000000000100000000" *) 
  bd_0_hls_inst_0_stencil3d inst
       (.C_address0(NLW_inst_C_address0_UNCONNECTED[0]),
        .C_address1(NLW_inst_C_address1_UNCONNECTED[0]),
        .C_ce0(C_ce0),
        .C_ce1(C_ce1),
        .C_q0(C_q0),
        .C_q1(C_q1),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .orig_address0(orig_address0),
        .orig_address1(orig_address1),
        .orig_ce0(orig_ce0),
        .orig_ce1(orig_ce1),
        .orig_q0(orig_q0),
        .orig_q1(orig_q1),
        .sol_address0(sol_address0),
        .sol_address1(sol_address1),
        .sol_ce0(sol_ce0),
        .sol_ce1(sol_ce1),
        .sol_d0(sol_d0),
        .sol_d1(sol_d1),
        .sol_we0(sol_we0),
        .sol_we1(sol_we1));
endmodule

(* ORIG_REF_NAME = "stencil3d" *) (* ap_ST_fsm_state1 = "20'b00000000000000000001" *) (* ap_ST_fsm_state10 = "20'b00000000001000000000" *) 
(* ap_ST_fsm_state11 = "20'b00000000010000000000" *) (* ap_ST_fsm_state12 = "20'b00000000100000000000" *) (* ap_ST_fsm_state13 = "20'b00000001000000000000" *) 
(* ap_ST_fsm_state14 = "20'b00000010000000000000" *) (* ap_ST_fsm_state15 = "20'b00000100000000000000" *) (* ap_ST_fsm_state16 = "20'b00001000000000000000" *) 
(* ap_ST_fsm_state17 = "20'b00010000000000000000" *) (* ap_ST_fsm_state18 = "20'b00100000000000000000" *) (* ap_ST_fsm_state19 = "20'b01000000000000000000" *) 
(* ap_ST_fsm_state2 = "20'b00000000000000000010" *) (* ap_ST_fsm_state20 = "20'b10000000000000000000" *) (* ap_ST_fsm_state3 = "20'b00000000000000000100" *) 
(* ap_ST_fsm_state4 = "20'b00000000000000001000" *) (* ap_ST_fsm_state5 = "20'b00000000000000010000" *) (* ap_ST_fsm_state6 = "20'b00000000000000100000" *) 
(* ap_ST_fsm_state7 = "20'b00000000000001000000" *) (* ap_ST_fsm_state8 = "20'b00000000000010000000" *) (* ap_ST_fsm_state9 = "20'b00000000000100000000" *) 
(* hls_module = "yes" *) 
module bd_0_hls_inst_0_stencil3d
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    C_address0,
    C_ce0,
    C_q0,
    C_address1,
    C_ce1,
    C_q1,
    orig_address0,
    orig_ce0,
    orig_q0,
    orig_address1,
    orig_ce1,
    orig_q1,
    sol_address0,
    sol_ce0,
    sol_we0,
    sol_d0,
    sol_address1,
    sol_ce1,
    sol_we1,
    sol_d1);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [0:0]C_address0;
  output C_ce0;
  input [31:0]C_q0;
  output [0:0]C_address1;
  output C_ce1;
  input [31:0]C_q1;
  output [10:0]orig_address0;
  output orig_ce0;
  input [31:0]orig_q0;
  output [10:0]orig_address1;
  output orig_ce1;
  input [31:0]orig_q1;
  output [10:0]sol_address0;
  output sol_ce0;
  output sol_we0;
  output [31:0]sol_d0;
  output [10:0]sol_address1;
  output sol_ce1;
  output sol_we1;
  output [31:0]sol_d1;

  wire \<const0> ;
  wire C_ce0;
  wire [31:0]C_load_1_reg_1003;
  wire [31:0]C_load_reg_998;
  wire [31:0]C_q0;
  wire [31:0]C_q1;
  wire [4:0]add_ln15_fu_404_p2;
  wire [4:0]add_ln15_reg_846;
  wire [3:0]add_ln17_fu_437_p2;
  wire [3:0]add_ln17_reg_871;
  wire [7:3]add_ln20_fu_465_p2;
  wire [7:0]add_ln20_reg_886;
  wire \add_ln20_reg_886[7]_i_2_n_6 ;
  wire \add_ln20_reg_886_reg[7]_i_1_n_10 ;
  wire \add_ln20_reg_886_reg[7]_i_1_n_11 ;
  wire \add_ln20_reg_886_reg[7]_i_1_n_12 ;
  wire \add_ln20_reg_886_reg[7]_i_1_n_13 ;
  wire [3:1]add_ln23_fu_550_p2;
  wire [3:0]add_ln25_fu_516_p2;
  wire [3:0]add_ln25_reg_922;
  wire [3:0]add_ln31_fu_611_p2;
  wire [3:0]add_ln33_fu_605_p2;
  wire [3:0]add_ln33_reg_993;
  wire [2:0]add_ln53_fu_762_p2;
  wire [2:0]add_ln53_reg_1098;
  wire [31:0]add_ln57_5_fu_831_p2;
  wire [31:0]add_ln57_fu_802_p2;
  wire [31:0]add_ln57_reg_1113;
  wire \add_ln57_reg_1113[15]_i_2_n_6 ;
  wire \add_ln57_reg_1113[15]_i_3_n_6 ;
  wire \add_ln57_reg_1113[15]_i_4_n_6 ;
  wire \add_ln57_reg_1113[15]_i_5_n_6 ;
  wire \add_ln57_reg_1113[15]_i_6_n_6 ;
  wire \add_ln57_reg_1113[15]_i_7_n_6 ;
  wire \add_ln57_reg_1113[15]_i_8_n_6 ;
  wire \add_ln57_reg_1113[15]_i_9_n_6 ;
  wire \add_ln57_reg_1113[23]_i_2_n_6 ;
  wire \add_ln57_reg_1113[23]_i_3_n_6 ;
  wire \add_ln57_reg_1113[23]_i_4_n_6 ;
  wire \add_ln57_reg_1113[23]_i_5_n_6 ;
  wire \add_ln57_reg_1113[23]_i_6_n_6 ;
  wire \add_ln57_reg_1113[23]_i_7_n_6 ;
  wire \add_ln57_reg_1113[23]_i_8_n_6 ;
  wire \add_ln57_reg_1113[23]_i_9_n_6 ;
  wire \add_ln57_reg_1113[31]_i_2_n_6 ;
  wire \add_ln57_reg_1113[31]_i_3_n_6 ;
  wire \add_ln57_reg_1113[31]_i_4_n_6 ;
  wire \add_ln57_reg_1113[31]_i_5_n_6 ;
  wire \add_ln57_reg_1113[31]_i_6_n_6 ;
  wire \add_ln57_reg_1113[31]_i_7_n_6 ;
  wire \add_ln57_reg_1113[31]_i_8_n_6 ;
  wire \add_ln57_reg_1113[31]_i_9_n_6 ;
  wire \add_ln57_reg_1113[7]_i_2_n_6 ;
  wire \add_ln57_reg_1113[7]_i_3_n_6 ;
  wire \add_ln57_reg_1113[7]_i_4_n_6 ;
  wire \add_ln57_reg_1113[7]_i_5_n_6 ;
  wire \add_ln57_reg_1113[7]_i_6_n_6 ;
  wire \add_ln57_reg_1113[7]_i_7_n_6 ;
  wire \add_ln57_reg_1113[7]_i_8_n_6 ;
  wire \add_ln57_reg_1113[7]_i_9_n_6 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_10 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_11 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_12 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_13 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_6 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_7 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_8 ;
  wire \add_ln57_reg_1113_reg[15]_i_1_n_9 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_10 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_11 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_12 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_13 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_6 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_7 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_8 ;
  wire \add_ln57_reg_1113_reg[23]_i_1_n_9 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_10 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_11 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_12 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_13 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_7 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_8 ;
  wire \add_ln57_reg_1113_reg[31]_i_1_n_9 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_10 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_11 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_12 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_13 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_6 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_7 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_8 ;
  wire \add_ln57_reg_1113_reg[7]_i_1_n_9 ;
  wire [10:0]add_ln_fu_526_p4;
  wire \ap_CS_fsm_reg_n_6_[0] ;
  wire ap_CS_fsm_state10;
  wire ap_CS_fsm_state11;
  wire ap_CS_fsm_state12;
  wire ap_CS_fsm_state13;
  wire ap_CS_fsm_state14;
  wire ap_CS_fsm_state15;
  wire ap_CS_fsm_state16;
  wire ap_CS_fsm_state17;
  wire ap_CS_fsm_state18;
  wire ap_CS_fsm_state19;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state20;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire ap_CS_fsm_state5;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state8;
  wire [15:0]ap_NS_fsm;
  wire ap_NS_fsm1;
  wire ap_NS_fsm10_out;
  wire ap_NS_fsm11_out;
  wire ap_NS_fsm12_out;
  wire ap_NS_fsm13_out;
  wire ap_NS_fsm14_out;
  wire ap_NS_fsm15_out;
  wire ap_NS_fsm16_out;
  wire ap_NS_fsm17_out;
  wire ap_clk;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [10:0]data1;
  wire [6:3]data3;
  wire [10:6]data4;
  wire [6:3]data6;
  wire [10:7]empty_14_reg_907;
  wire [7:4]empty_15_fu_662_p2;
  wire [7:0]empty_15_reg_1034;
  wire \empty_15_reg_1034_reg[7]_i_1_n_12 ;
  wire \empty_15_reg_1034_reg[7]_i_1_n_13 ;
  wire [7:5]empty_16_fu_671_p2;
  wire [7:5]empty_16_reg_1039;
  wire \empty_16_reg_1039[7]_i_2_n_6 ;
  wire \empty_16_reg_1039[7]_i_3_n_6 ;
  wire \empty_16_reg_1039[7]_i_4_n_6 ;
  wire \empty_16_reg_1039_reg[7]_i_1_n_12 ;
  wire \empty_16_reg_1039_reg[7]_i_1_n_13 ;
  wire [3:0]i_2_fu_112;
  wire i_2_fu_1120;
  wire \i_fu_104[0]_i_1_n_6 ;
  wire [1:0]indvars_iv_next19_fu_676_p2;
  wire \indvars_iv_next19_reg_1044[2]_i_1_n_6 ;
  wire \indvars_iv_next19_reg_1044[3]_i_1_n_6 ;
  wire [3:0]indvars_iv_next33_fu_630_p2;
  wire [3:0]indvars_iv_next33_reg_1020;
  wire j_2_reg_3560;
  wire \j_fu_100_reg_n_6_[0] ;
  wire \j_fu_100_reg_n_6_[1] ;
  wire \j_fu_100_reg_n_6_[2] ;
  wire \j_fu_100_reg_n_6_[3] ;
  wire \j_fu_100_reg_n_6_[4] ;
  wire k_1_reg_3340;
  wire k_2_reg_3680;
  wire k_reg_3230;
  wire mul_32s_32s_32_1_1_U1_n_22;
  wire mul_32s_32s_32_1_1_U1_n_23;
  wire mul_32s_32s_32_1_1_U1_n_24;
  wire mul_32s_32s_32_1_1_U1_n_25;
  wire mul_32s_32s_32_1_1_U1_n_26;
  wire mul_32s_32s_32_1_1_U1_n_27;
  wire mul_32s_32s_32_1_1_U1_n_28;
  wire mul_32s_32s_32_1_1_U1_n_29;
  wire mul_32s_32s_32_1_1_U1_n_30;
  wire mul_32s_32s_32_1_1_U1_n_31;
  wire mul_32s_32s_32_1_1_U1_n_32;
  wire mul_32s_32s_32_1_1_U1_n_33;
  wire mul_32s_32s_32_1_1_U1_n_34;
  wire mul_32s_32s_32_1_1_U1_n_35;
  wire mul_32s_32s_32_1_1_U1_n_36;
  wire mul_32s_32s_32_1_1_U1_n_37;
  wire [31:0]mul_ln57_1_reg_1118;
  wire [31:0]mul_ln57_reg_1078;
  wire [3:0]or_ln_fu_457_p3;
  wire [10:0]orig_address0;
  wire \orig_address0[0]_INST_0_i_1_n_6 ;
  wire \orig_address0[10]_INST_0_i_1_n_6 ;
  wire \orig_address0[10]_INST_0_i_2_n_6 ;
  wire \orig_address0[10]_INST_0_i_3_n_6 ;
  wire \orig_address0[1]_INST_0_i_1_n_6 ;
  wire \orig_address0[2]_INST_0_i_1_n_6 ;
  wire \orig_address0[2]_INST_0_i_2_n_6 ;
  wire \orig_address0[3]_INST_0_i_1_n_6 ;
  wire \orig_address0[3]_INST_0_i_2_n_6 ;
  wire \orig_address0[3]_INST_0_i_3_n_6 ;
  wire \orig_address0[4]_INST_0_i_1_n_6 ;
  wire \orig_address0[4]_INST_0_i_2_n_6 ;
  wire \orig_address0[4]_INST_0_i_3_n_6 ;
  wire \orig_address0[5]_INST_0_i_1_n_6 ;
  wire \orig_address0[5]_INST_0_i_2_n_6 ;
  wire \orig_address0[5]_INST_0_i_3_n_6 ;
  wire \orig_address0[6]_INST_0_i_1_n_6 ;
  wire \orig_address0[6]_INST_0_i_2_n_6 ;
  wire \orig_address0[6]_INST_0_i_3_n_6 ;
  wire \orig_address0[7]_INST_0_i_1_n_6 ;
  wire \orig_address0[7]_INST_0_i_2_n_6 ;
  wire \orig_address0[7]_INST_0_i_3_n_6 ;
  wire \orig_address0[8]_INST_0_i_1_n_6 ;
  wire \orig_address0[8]_INST_0_i_2_n_6 ;
  wire \orig_address0[9]_INST_0_i_1_n_6 ;
  wire \orig_address0[9]_INST_0_i_2_n_6 ;
  wire [10:0]orig_address1;
  wire \orig_address1[10]_INST_0_i_1_n_6 ;
  wire \orig_address1[1]_INST_0_i_1_n_6 ;
  wire \orig_address1[2]_INST_0_i_1_n_6 ;
  wire \orig_address1[3]_INST_0_i_1_n_6 ;
  wire \orig_address1[4]_INST_0_i_1_n_6 ;
  wire \orig_address1[5]_INST_0_i_1_n_6 ;
  wire \orig_address1[6]_INST_0_i_1_n_6 ;
  wire \orig_address1[7]_INST_0_i_1_n_6 ;
  wire \orig_address1[8]_INST_0_i_1_n_6 ;
  wire \orig_address1[9]_INST_0_i_1_n_6 ;
  wire orig_ce0;
  wire orig_ce1;
  wire [31:0]orig_load_8_reg_1083;
  wire [31:0]orig_q0;
  wire [31:0]orig_q1;
  wire [31:0]p_1_in;
  wire [31:0]reg_385;
  wire \reg_385[31]_i_1_n_6 ;
  wire [10:7]shl_ln_fu_580_p4;
  wire [10:0]sol_address0;
  wire \sol_address0[3]_INST_0_i_1_n_6 ;
  wire \sol_address0[4]_INST_0_i_1_n_6 ;
  wire \sol_address0[5]_INST_0_i_1_n_6 ;
  wire \sol_address0[6]_INST_0_i_1_n_6 ;
  wire \sol_address0[6]_INST_0_i_2_n_6 ;
  wire \sol_address0[6]_INST_0_i_3_n_6 ;
  wire [10:0]sol_address1;
  wire sol_ce0;
  wire sol_ce1;
  wire [31:0]sol_d1;
  wire \sol_d1[15]_INST_0_i_1_n_10 ;
  wire \sol_d1[15]_INST_0_i_1_n_11 ;
  wire \sol_d1[15]_INST_0_i_1_n_12 ;
  wire \sol_d1[15]_INST_0_i_1_n_13 ;
  wire \sol_d1[15]_INST_0_i_1_n_6 ;
  wire \sol_d1[15]_INST_0_i_1_n_7 ;
  wire \sol_d1[15]_INST_0_i_1_n_8 ;
  wire \sol_d1[15]_INST_0_i_1_n_9 ;
  wire \sol_d1[15]_INST_0_i_2_n_6 ;
  wire \sol_d1[15]_INST_0_i_3_n_6 ;
  wire \sol_d1[15]_INST_0_i_4_n_6 ;
  wire \sol_d1[15]_INST_0_i_5_n_6 ;
  wire \sol_d1[15]_INST_0_i_6_n_6 ;
  wire \sol_d1[15]_INST_0_i_7_n_6 ;
  wire \sol_d1[15]_INST_0_i_8_n_6 ;
  wire \sol_d1[15]_INST_0_i_9_n_6 ;
  wire \sol_d1[23]_INST_0_i_1_n_10 ;
  wire \sol_d1[23]_INST_0_i_1_n_11 ;
  wire \sol_d1[23]_INST_0_i_1_n_12 ;
  wire \sol_d1[23]_INST_0_i_1_n_13 ;
  wire \sol_d1[23]_INST_0_i_1_n_6 ;
  wire \sol_d1[23]_INST_0_i_1_n_7 ;
  wire \sol_d1[23]_INST_0_i_1_n_8 ;
  wire \sol_d1[23]_INST_0_i_1_n_9 ;
  wire \sol_d1[23]_INST_0_i_2_n_6 ;
  wire \sol_d1[23]_INST_0_i_3_n_6 ;
  wire \sol_d1[23]_INST_0_i_4_n_6 ;
  wire \sol_d1[23]_INST_0_i_5_n_6 ;
  wire \sol_d1[23]_INST_0_i_6_n_6 ;
  wire \sol_d1[23]_INST_0_i_7_n_6 ;
  wire \sol_d1[23]_INST_0_i_8_n_6 ;
  wire \sol_d1[23]_INST_0_i_9_n_6 ;
  wire \sol_d1[31]_INST_0_i_1_n_10 ;
  wire \sol_d1[31]_INST_0_i_1_n_11 ;
  wire \sol_d1[31]_INST_0_i_1_n_12 ;
  wire \sol_d1[31]_INST_0_i_1_n_13 ;
  wire \sol_d1[31]_INST_0_i_1_n_7 ;
  wire \sol_d1[31]_INST_0_i_1_n_8 ;
  wire \sol_d1[31]_INST_0_i_1_n_9 ;
  wire \sol_d1[31]_INST_0_i_2_n_6 ;
  wire \sol_d1[31]_INST_0_i_3_n_6 ;
  wire \sol_d1[31]_INST_0_i_4_n_6 ;
  wire \sol_d1[31]_INST_0_i_5_n_6 ;
  wire \sol_d1[31]_INST_0_i_6_n_6 ;
  wire \sol_d1[31]_INST_0_i_7_n_6 ;
  wire \sol_d1[31]_INST_0_i_8_n_6 ;
  wire \sol_d1[31]_INST_0_i_9_n_6 ;
  wire \sol_d1[7]_INST_0_i_1_n_10 ;
  wire \sol_d1[7]_INST_0_i_1_n_11 ;
  wire \sol_d1[7]_INST_0_i_1_n_12 ;
  wire \sol_d1[7]_INST_0_i_1_n_13 ;
  wire \sol_d1[7]_INST_0_i_1_n_6 ;
  wire \sol_d1[7]_INST_0_i_1_n_7 ;
  wire \sol_d1[7]_INST_0_i_1_n_8 ;
  wire \sol_d1[7]_INST_0_i_1_n_9 ;
  wire \sol_d1[7]_INST_0_i_2_n_6 ;
  wire \sol_d1[7]_INST_0_i_3_n_6 ;
  wire \sol_d1[7]_INST_0_i_4_n_6 ;
  wire \sol_d1[7]_INST_0_i_5_n_6 ;
  wire \sol_d1[7]_INST_0_i_6_n_6 ;
  wire \sol_d1[7]_INST_0_i_7_n_6 ;
  wire \sol_d1[7]_INST_0_i_8_n_6 ;
  wire \sol_d1[7]_INST_0_i_9_n_6 ;
  wire [3:0]tmp2_cast_fu_667_p1;
  wire [3:1]tmp3_fu_682_p2;
  wire [3:1]tmp3_reg_1050;
  wire [6:3]tmp_1_reg_851;
  wire [31:16]tmp_product__3;
  wire [6:3]zext_ln19_reg_876_reg;
  wire [7:0]zext_ln20_reg_891_reg;
  wire [10:3]zext_ln27_reg_927;
  wire [10:0]zext_ln28_reg_937_reg;
  wire [7:0]zext_ln36_reg_983_reg;
  wire [10:0]zext_ln48_reg_1058_reg;
  wire [7:4]\NLW_add_ln20_reg_886_reg[7]_i_1_CO_UNCONNECTED ;
  wire [7:5]\NLW_add_ln20_reg_886_reg[7]_i_1_O_UNCONNECTED ;
  wire [7:7]\NLW_add_ln57_reg_1113_reg[31]_i_1_CO_UNCONNECTED ;
  wire [7:2]\NLW_empty_15_reg_1034_reg[7]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_empty_15_reg_1034_reg[7]_i_1_O_UNCONNECTED ;
  wire [7:2]\NLW_empty_16_reg_1039_reg[7]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_empty_16_reg_1039_reg[7]_i_1_O_UNCONNECTED ;
  wire [7:7]\NLW_sol_d1[31]_INST_0_i_1_CO_UNCONNECTED ;

  assign C_address0[0] = \<const0> ;
  assign C_address1[0] = \<const0> ;
  assign C_ce1 = C_ce0;
  assign ap_done = ap_ready;
  assign sol_d0[31:0] = orig_q0;
  assign sol_we0 = sol_ce0;
  assign sol_we1 = sol_ce1;
  FDRE \C_load_1_reg_1003_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[0]),
        .Q(C_load_1_reg_1003[0]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[10]),
        .Q(C_load_1_reg_1003[10]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[11]),
        .Q(C_load_1_reg_1003[11]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[12]),
        .Q(C_load_1_reg_1003[12]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[13]),
        .Q(C_load_1_reg_1003[13]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[14]),
        .Q(C_load_1_reg_1003[14]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[15]),
        .Q(C_load_1_reg_1003[15]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[16]),
        .Q(C_load_1_reg_1003[16]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[17]),
        .Q(C_load_1_reg_1003[17]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[18]),
        .Q(C_load_1_reg_1003[18]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[19]),
        .Q(C_load_1_reg_1003[19]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[1]),
        .Q(C_load_1_reg_1003[1]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[20]),
        .Q(C_load_1_reg_1003[20]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[21]),
        .Q(C_load_1_reg_1003[21]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[22]),
        .Q(C_load_1_reg_1003[22]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[23]),
        .Q(C_load_1_reg_1003[23]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[24]),
        .Q(C_load_1_reg_1003[24]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[25]),
        .Q(C_load_1_reg_1003[25]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[26]),
        .Q(C_load_1_reg_1003[26]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[27]),
        .Q(C_load_1_reg_1003[27]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[28]),
        .Q(C_load_1_reg_1003[28]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[29]),
        .Q(C_load_1_reg_1003[29]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[2]),
        .Q(C_load_1_reg_1003[2]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[30]),
        .Q(C_load_1_reg_1003[30]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[31]),
        .Q(C_load_1_reg_1003[31]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[3]),
        .Q(C_load_1_reg_1003[3]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[4]),
        .Q(C_load_1_reg_1003[4]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[5]),
        .Q(C_load_1_reg_1003[5]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[6]),
        .Q(C_load_1_reg_1003[6]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[7]),
        .Q(C_load_1_reg_1003[7]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[8]),
        .Q(C_load_1_reg_1003[8]),
        .R(1'b0));
  FDRE \C_load_1_reg_1003_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q0[9]),
        .Q(C_load_1_reg_1003[9]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[0]),
        .Q(C_load_reg_998[0]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[10]),
        .Q(C_load_reg_998[10]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[11]),
        .Q(C_load_reg_998[11]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[12]),
        .Q(C_load_reg_998[12]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[13]),
        .Q(C_load_reg_998[13]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[14]),
        .Q(C_load_reg_998[14]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[15]),
        .Q(C_load_reg_998[15]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[16]),
        .Q(C_load_reg_998[16]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[17]),
        .Q(C_load_reg_998[17]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[18]),
        .Q(C_load_reg_998[18]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[19]),
        .Q(C_load_reg_998[19]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[1]),
        .Q(C_load_reg_998[1]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[20]),
        .Q(C_load_reg_998[20]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[21]),
        .Q(C_load_reg_998[21]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[22]),
        .Q(C_load_reg_998[22]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[23]),
        .Q(C_load_reg_998[23]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[24]),
        .Q(C_load_reg_998[24]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[25]),
        .Q(C_load_reg_998[25]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[26]),
        .Q(C_load_reg_998[26]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[27]),
        .Q(C_load_reg_998[27]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[28]),
        .Q(C_load_reg_998[28]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[29]),
        .Q(C_load_reg_998[29]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[2]),
        .Q(C_load_reg_998[2]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[30]),
        .Q(C_load_reg_998[30]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[31]),
        .Q(C_load_reg_998[31]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[3]),
        .Q(C_load_reg_998[3]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[4]),
        .Q(C_load_reg_998[4]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[5]),
        .Q(C_load_reg_998[5]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[6]),
        .Q(C_load_reg_998[6]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[7]),
        .Q(C_load_reg_998[7]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[8]),
        .Q(C_load_reg_998[8]),
        .R(1'b0));
  FDRE \C_load_reg_998_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state12),
        .D(C_q1[9]),
        .Q(C_load_reg_998[9]),
        .R(1'b0));
  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln15_reg_846[0]_i_1 
       (.I0(\j_fu_100_reg_n_6_[0] ),
        .O(add_ln15_fu_404_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln15_reg_846[1]_i_1 
       (.I0(\j_fu_100_reg_n_6_[0] ),
        .I1(\j_fu_100_reg_n_6_[1] ),
        .O(add_ln15_fu_404_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \add_ln15_reg_846[2]_i_1 
       (.I0(\j_fu_100_reg_n_6_[2] ),
        .I1(\j_fu_100_reg_n_6_[0] ),
        .I2(\j_fu_100_reg_n_6_[1] ),
        .O(add_ln15_fu_404_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \add_ln15_reg_846[3]_i_1 
       (.I0(\j_fu_100_reg_n_6_[1] ),
        .I1(\j_fu_100_reg_n_6_[0] ),
        .I2(\j_fu_100_reg_n_6_[2] ),
        .I3(\j_fu_100_reg_n_6_[3] ),
        .O(add_ln15_fu_404_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \add_ln15_reg_846[4]_i_1 
       (.I0(\j_fu_100_reg_n_6_[4] ),
        .I1(\j_fu_100_reg_n_6_[1] ),
        .I2(\j_fu_100_reg_n_6_[0] ),
        .I3(\j_fu_100_reg_n_6_[2] ),
        .I4(\j_fu_100_reg_n_6_[3] ),
        .O(add_ln15_fu_404_p2[4]));
  FDRE \add_ln15_reg_846_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(add_ln15_fu_404_p2[0]),
        .Q(add_ln15_reg_846[0]),
        .R(1'b0));
  FDRE \add_ln15_reg_846_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(add_ln15_fu_404_p2[1]),
        .Q(add_ln15_reg_846[1]),
        .R(1'b0));
  FDRE \add_ln15_reg_846_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(add_ln15_fu_404_p2[2]),
        .Q(add_ln15_reg_846[2]),
        .R(1'b0));
  FDRE \add_ln15_reg_846_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(add_ln15_fu_404_p2[3]),
        .Q(add_ln15_reg_846[3]),
        .R(1'b0));
  FDRE \add_ln15_reg_846_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(add_ln15_fu_404_p2[4]),
        .Q(add_ln15_reg_846[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln17_reg_871[0]_i_1 
       (.I0(or_ln_fu_457_p3[0]),
        .O(add_ln17_fu_437_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln17_reg_871[1]_i_1 
       (.I0(or_ln_fu_457_p3[0]),
        .I1(or_ln_fu_457_p3[1]),
        .O(add_ln17_fu_437_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \add_ln17_reg_871[2]_i_1 
       (.I0(or_ln_fu_457_p3[2]),
        .I1(or_ln_fu_457_p3[1]),
        .I2(or_ln_fu_457_p3[0]),
        .O(add_ln17_fu_437_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \add_ln17_reg_871[3]_i_1 
       (.I0(or_ln_fu_457_p3[3]),
        .I1(or_ln_fu_457_p3[2]),
        .I2(or_ln_fu_457_p3[0]),
        .I3(or_ln_fu_457_p3[1]),
        .O(add_ln17_fu_437_p2[3]));
  FDRE \add_ln17_reg_871_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln17_fu_437_p2[0]),
        .Q(add_ln17_reg_871[0]),
        .R(1'b0));
  FDRE \add_ln17_reg_871_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln17_fu_437_p2[1]),
        .Q(add_ln17_reg_871[1]),
        .R(1'b0));
  FDRE \add_ln17_reg_871_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln17_fu_437_p2[2]),
        .Q(add_ln17_reg_871[2]),
        .R(1'b0));
  FDRE \add_ln17_reg_871_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln17_fu_437_p2[3]),
        .Q(add_ln17_reg_871[3]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln20_reg_886[7]_i_2 
       (.I0(or_ln_fu_457_p3[3]),
        .I1(tmp_1_reg_851[3]),
        .O(\add_ln20_reg_886[7]_i_2_n_6 ));
  FDRE \add_ln20_reg_886_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(or_ln_fu_457_p3[0]),
        .Q(add_ln20_reg_886[0]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(or_ln_fu_457_p3[1]),
        .Q(add_ln20_reg_886[1]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(or_ln_fu_457_p3[2]),
        .Q(add_ln20_reg_886[2]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_465_p2[3]),
        .Q(add_ln20_reg_886[3]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_465_p2[4]),
        .Q(add_ln20_reg_886[4]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_465_p2[5]),
        .Q(add_ln20_reg_886[5]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_465_p2[6]),
        .Q(add_ln20_reg_886[6]),
        .R(1'b0));
  FDRE \add_ln20_reg_886_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_465_p2[7]),
        .Q(add_ln20_reg_886[7]),
        .R(1'b0));
  CARRY8 \add_ln20_reg_886_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\NLW_add_ln20_reg_886_reg[7]_i_1_CO_UNCONNECTED [7:4],\add_ln20_reg_886_reg[7]_i_1_n_10 ,\add_ln20_reg_886_reg[7]_i_1_n_11 ,\add_ln20_reg_886_reg[7]_i_1_n_12 ,\add_ln20_reg_886_reg[7]_i_1_n_13 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,or_ln_fu_457_p3[3]}),
        .O({\NLW_add_ln20_reg_886_reg[7]_i_1_O_UNCONNECTED [7:5],add_ln20_fu_465_p2}),
        .S({1'b0,1'b0,1'b0,1'b1,tmp_1_reg_851[6:4],\add_ln20_reg_886[7]_i_2_n_6 }));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln25_reg_922[0]_i_1 
       (.I0(add_ln_fu_526_p4[0]),
        .O(add_ln25_fu_516_p2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln25_reg_922[1]_i_1 
       (.I0(add_ln_fu_526_p4[0]),
        .I1(add_ln_fu_526_p4[1]),
        .O(add_ln25_fu_516_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \add_ln25_reg_922[2]_i_1 
       (.I0(add_ln_fu_526_p4[2]),
        .I1(add_ln_fu_526_p4[1]),
        .I2(add_ln_fu_526_p4[0]),
        .O(add_ln25_fu_516_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \add_ln25_reg_922[3]_i_1 
       (.I0(add_ln_fu_526_p4[3]),
        .I1(add_ln_fu_526_p4[0]),
        .I2(add_ln_fu_526_p4[1]),
        .I3(add_ln_fu_526_p4[2]),
        .O(add_ln25_fu_516_p2[3]));
  FDRE \add_ln25_reg_922_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln25_fu_516_p2[0]),
        .Q(add_ln25_reg_922[0]),
        .R(1'b0));
  FDRE \add_ln25_reg_922_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln25_fu_516_p2[1]),
        .Q(add_ln25_reg_922[1]),
        .R(1'b0));
  FDRE \add_ln25_reg_922_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln25_fu_516_p2[2]),
        .Q(add_ln25_reg_922[2]),
        .R(1'b0));
  FDRE \add_ln25_reg_922_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln25_fu_516_p2[3]),
        .Q(add_ln25_reg_922[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln33_reg_993[0]_i_1 
       (.I0(data3[3]),
        .O(add_ln33_fu_605_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln33_reg_993[1]_i_1 
       (.I0(data3[4]),
        .I1(data3[3]),
        .O(add_ln33_fu_605_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \add_ln33_reg_993[2]_i_1 
       (.I0(data3[4]),
        .I1(data3[3]),
        .I2(data3[5]),
        .O(add_ln33_fu_605_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \add_ln33_reg_993[3]_i_1 
       (.I0(data3[6]),
        .I1(data3[4]),
        .I2(data3[3]),
        .I3(data3[5]),
        .O(add_ln33_fu_605_p2[3]));
  FDRE \add_ln33_reg_993_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(add_ln33_fu_605_p2[0]),
        .Q(add_ln33_reg_993[0]),
        .R(1'b0));
  FDRE \add_ln33_reg_993_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(add_ln33_fu_605_p2[1]),
        .Q(add_ln33_reg_993[1]),
        .R(1'b0));
  FDRE \add_ln33_reg_993_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(add_ln33_fu_605_p2[2]),
        .Q(add_ln33_reg_993[2]),
        .R(1'b0));
  FDRE \add_ln33_reg_993_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(add_ln33_fu_605_p2[3]),
        .Q(add_ln33_reg_993[3]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln53_reg_1098[0]_i_1 
       (.I0(data1[0]),
        .O(add_ln53_fu_762_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln53_reg_1098[1]_i_1 
       (.I0(data1[1]),
        .I1(data1[0]),
        .O(add_ln53_fu_762_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \add_ln53_reg_1098[2]_i_1 
       (.I0(data1[2]),
        .I1(data1[0]),
        .I2(data1[1]),
        .O(add_ln53_fu_762_p2[2]));
  FDRE \add_ln53_reg_1098_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln53_fu_762_p2[0]),
        .Q(add_ln53_reg_1098[0]),
        .R(1'b0));
  FDRE \add_ln53_reg_1098_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln53_fu_762_p2[1]),
        .Q(add_ln53_reg_1098[1]),
        .R(1'b0));
  FDRE \add_ln53_reg_1098_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln53_fu_762_p2[2]),
        .Q(add_ln53_reg_1098[2]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_2 
       (.I0(reg_385[15]),
        .I1(orig_q0[15]),
        .O(\add_ln57_reg_1113[15]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_3 
       (.I0(reg_385[14]),
        .I1(orig_q0[14]),
        .O(\add_ln57_reg_1113[15]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_4 
       (.I0(reg_385[13]),
        .I1(orig_q0[13]),
        .O(\add_ln57_reg_1113[15]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_5 
       (.I0(reg_385[12]),
        .I1(orig_q0[12]),
        .O(\add_ln57_reg_1113[15]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_6 
       (.I0(reg_385[11]),
        .I1(orig_q0[11]),
        .O(\add_ln57_reg_1113[15]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_7 
       (.I0(reg_385[10]),
        .I1(orig_q0[10]),
        .O(\add_ln57_reg_1113[15]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_8 
       (.I0(reg_385[9]),
        .I1(orig_q0[9]),
        .O(\add_ln57_reg_1113[15]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[15]_i_9 
       (.I0(reg_385[8]),
        .I1(orig_q0[8]),
        .O(\add_ln57_reg_1113[15]_i_9_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_2 
       (.I0(reg_385[23]),
        .I1(orig_q0[23]),
        .O(\add_ln57_reg_1113[23]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_3 
       (.I0(reg_385[22]),
        .I1(orig_q0[22]),
        .O(\add_ln57_reg_1113[23]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_4 
       (.I0(reg_385[21]),
        .I1(orig_q0[21]),
        .O(\add_ln57_reg_1113[23]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_5 
       (.I0(reg_385[20]),
        .I1(orig_q0[20]),
        .O(\add_ln57_reg_1113[23]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_6 
       (.I0(reg_385[19]),
        .I1(orig_q0[19]),
        .O(\add_ln57_reg_1113[23]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_7 
       (.I0(reg_385[18]),
        .I1(orig_q0[18]),
        .O(\add_ln57_reg_1113[23]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_8 
       (.I0(reg_385[17]),
        .I1(orig_q0[17]),
        .O(\add_ln57_reg_1113[23]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[23]_i_9 
       (.I0(reg_385[16]),
        .I1(orig_q0[16]),
        .O(\add_ln57_reg_1113[23]_i_9_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_2 
       (.I0(orig_q0[31]),
        .I1(reg_385[31]),
        .O(\add_ln57_reg_1113[31]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_3 
       (.I0(reg_385[30]),
        .I1(orig_q0[30]),
        .O(\add_ln57_reg_1113[31]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_4 
       (.I0(reg_385[29]),
        .I1(orig_q0[29]),
        .O(\add_ln57_reg_1113[31]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_5 
       (.I0(reg_385[28]),
        .I1(orig_q0[28]),
        .O(\add_ln57_reg_1113[31]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_6 
       (.I0(reg_385[27]),
        .I1(orig_q0[27]),
        .O(\add_ln57_reg_1113[31]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_7 
       (.I0(reg_385[26]),
        .I1(orig_q0[26]),
        .O(\add_ln57_reg_1113[31]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_8 
       (.I0(reg_385[25]),
        .I1(orig_q0[25]),
        .O(\add_ln57_reg_1113[31]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[31]_i_9 
       (.I0(reg_385[24]),
        .I1(orig_q0[24]),
        .O(\add_ln57_reg_1113[31]_i_9_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_2 
       (.I0(reg_385[7]),
        .I1(orig_q0[7]),
        .O(\add_ln57_reg_1113[7]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_3 
       (.I0(reg_385[6]),
        .I1(orig_q0[6]),
        .O(\add_ln57_reg_1113[7]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_4 
       (.I0(reg_385[5]),
        .I1(orig_q0[5]),
        .O(\add_ln57_reg_1113[7]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_5 
       (.I0(reg_385[4]),
        .I1(orig_q0[4]),
        .O(\add_ln57_reg_1113[7]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_6 
       (.I0(reg_385[3]),
        .I1(orig_q0[3]),
        .O(\add_ln57_reg_1113[7]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_7 
       (.I0(reg_385[2]),
        .I1(orig_q0[2]),
        .O(\add_ln57_reg_1113[7]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_8 
       (.I0(reg_385[1]),
        .I1(orig_q0[1]),
        .O(\add_ln57_reg_1113[7]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln57_reg_1113[7]_i_9 
       (.I0(reg_385[0]),
        .I1(orig_q0[0]),
        .O(\add_ln57_reg_1113[7]_i_9_n_6 ));
  FDRE \add_ln57_reg_1113_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[0]),
        .Q(add_ln57_reg_1113[0]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[10]),
        .Q(add_ln57_reg_1113[10]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[11]),
        .Q(add_ln57_reg_1113[11]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[12]),
        .Q(add_ln57_reg_1113[12]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[13]),
        .Q(add_ln57_reg_1113[13]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[14]),
        .Q(add_ln57_reg_1113[14]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[15]),
        .Q(add_ln57_reg_1113[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \add_ln57_reg_1113_reg[15]_i_1 
       (.CI(\add_ln57_reg_1113_reg[7]_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\add_ln57_reg_1113_reg[15]_i_1_n_6 ,\add_ln57_reg_1113_reg[15]_i_1_n_7 ,\add_ln57_reg_1113_reg[15]_i_1_n_8 ,\add_ln57_reg_1113_reg[15]_i_1_n_9 ,\add_ln57_reg_1113_reg[15]_i_1_n_10 ,\add_ln57_reg_1113_reg[15]_i_1_n_11 ,\add_ln57_reg_1113_reg[15]_i_1_n_12 ,\add_ln57_reg_1113_reg[15]_i_1_n_13 }),
        .DI(reg_385[15:8]),
        .O(add_ln57_fu_802_p2[15:8]),
        .S({\add_ln57_reg_1113[15]_i_2_n_6 ,\add_ln57_reg_1113[15]_i_3_n_6 ,\add_ln57_reg_1113[15]_i_4_n_6 ,\add_ln57_reg_1113[15]_i_5_n_6 ,\add_ln57_reg_1113[15]_i_6_n_6 ,\add_ln57_reg_1113[15]_i_7_n_6 ,\add_ln57_reg_1113[15]_i_8_n_6 ,\add_ln57_reg_1113[15]_i_9_n_6 }));
  FDRE \add_ln57_reg_1113_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[16]),
        .Q(add_ln57_reg_1113[16]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[17]),
        .Q(add_ln57_reg_1113[17]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[18]),
        .Q(add_ln57_reg_1113[18]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[19]),
        .Q(add_ln57_reg_1113[19]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[1]),
        .Q(add_ln57_reg_1113[1]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[20]),
        .Q(add_ln57_reg_1113[20]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[21]),
        .Q(add_ln57_reg_1113[21]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[22]),
        .Q(add_ln57_reg_1113[22]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[23]),
        .Q(add_ln57_reg_1113[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \add_ln57_reg_1113_reg[23]_i_1 
       (.CI(\add_ln57_reg_1113_reg[15]_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\add_ln57_reg_1113_reg[23]_i_1_n_6 ,\add_ln57_reg_1113_reg[23]_i_1_n_7 ,\add_ln57_reg_1113_reg[23]_i_1_n_8 ,\add_ln57_reg_1113_reg[23]_i_1_n_9 ,\add_ln57_reg_1113_reg[23]_i_1_n_10 ,\add_ln57_reg_1113_reg[23]_i_1_n_11 ,\add_ln57_reg_1113_reg[23]_i_1_n_12 ,\add_ln57_reg_1113_reg[23]_i_1_n_13 }),
        .DI(reg_385[23:16]),
        .O(add_ln57_fu_802_p2[23:16]),
        .S({\add_ln57_reg_1113[23]_i_2_n_6 ,\add_ln57_reg_1113[23]_i_3_n_6 ,\add_ln57_reg_1113[23]_i_4_n_6 ,\add_ln57_reg_1113[23]_i_5_n_6 ,\add_ln57_reg_1113[23]_i_6_n_6 ,\add_ln57_reg_1113[23]_i_7_n_6 ,\add_ln57_reg_1113[23]_i_8_n_6 ,\add_ln57_reg_1113[23]_i_9_n_6 }));
  FDRE \add_ln57_reg_1113_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[24]),
        .Q(add_ln57_reg_1113[24]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[25]),
        .Q(add_ln57_reg_1113[25]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[26]),
        .Q(add_ln57_reg_1113[26]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[27]),
        .Q(add_ln57_reg_1113[27]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[28]),
        .Q(add_ln57_reg_1113[28]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[29]),
        .Q(add_ln57_reg_1113[29]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[2]),
        .Q(add_ln57_reg_1113[2]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[30]),
        .Q(add_ln57_reg_1113[30]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[31]),
        .Q(add_ln57_reg_1113[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \add_ln57_reg_1113_reg[31]_i_1 
       (.CI(\add_ln57_reg_1113_reg[23]_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\NLW_add_ln57_reg_1113_reg[31]_i_1_CO_UNCONNECTED [7],\add_ln57_reg_1113_reg[31]_i_1_n_7 ,\add_ln57_reg_1113_reg[31]_i_1_n_8 ,\add_ln57_reg_1113_reg[31]_i_1_n_9 ,\add_ln57_reg_1113_reg[31]_i_1_n_10 ,\add_ln57_reg_1113_reg[31]_i_1_n_11 ,\add_ln57_reg_1113_reg[31]_i_1_n_12 ,\add_ln57_reg_1113_reg[31]_i_1_n_13 }),
        .DI({1'b0,reg_385[30:24]}),
        .O(add_ln57_fu_802_p2[31:24]),
        .S({\add_ln57_reg_1113[31]_i_2_n_6 ,\add_ln57_reg_1113[31]_i_3_n_6 ,\add_ln57_reg_1113[31]_i_4_n_6 ,\add_ln57_reg_1113[31]_i_5_n_6 ,\add_ln57_reg_1113[31]_i_6_n_6 ,\add_ln57_reg_1113[31]_i_7_n_6 ,\add_ln57_reg_1113[31]_i_8_n_6 ,\add_ln57_reg_1113[31]_i_9_n_6 }));
  FDRE \add_ln57_reg_1113_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[3]),
        .Q(add_ln57_reg_1113[3]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[4]),
        .Q(add_ln57_reg_1113[4]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[5]),
        .Q(add_ln57_reg_1113[5]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[6]),
        .Q(add_ln57_reg_1113[6]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[7]),
        .Q(add_ln57_reg_1113[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \add_ln57_reg_1113_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\add_ln57_reg_1113_reg[7]_i_1_n_6 ,\add_ln57_reg_1113_reg[7]_i_1_n_7 ,\add_ln57_reg_1113_reg[7]_i_1_n_8 ,\add_ln57_reg_1113_reg[7]_i_1_n_9 ,\add_ln57_reg_1113_reg[7]_i_1_n_10 ,\add_ln57_reg_1113_reg[7]_i_1_n_11 ,\add_ln57_reg_1113_reg[7]_i_1_n_12 ,\add_ln57_reg_1113_reg[7]_i_1_n_13 }),
        .DI(reg_385[7:0]),
        .O(add_ln57_fu_802_p2[7:0]),
        .S({\add_ln57_reg_1113[7]_i_2_n_6 ,\add_ln57_reg_1113[7]_i_3_n_6 ,\add_ln57_reg_1113[7]_i_4_n_6 ,\add_ln57_reg_1113[7]_i_5_n_6 ,\add_ln57_reg_1113[7]_i_6_n_6 ,\add_ln57_reg_1113[7]_i_7_n_6 ,\add_ln57_reg_1113[7]_i_8_n_6 ,\add_ln57_reg_1113[7]_i_9_n_6 }));
  FDRE \add_ln57_reg_1113_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[8]),
        .Q(add_ln57_reg_1113[8]),
        .R(1'b0));
  FDRE \add_ln57_reg_1113_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state18),
        .D(add_ln57_fu_802_p2[9]),
        .Q(add_ln57_reg_1113[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_ready),
        .I1(ap_start),
        .I2(\ap_CS_fsm_reg_n_6_[0] ),
        .O(ap_NS_fsm[0]));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \ap_CS_fsm[10]_i_1 
       (.I0(ap_CS_fsm_state10),
        .I1(data3[6]),
        .I2(data3[5]),
        .I3(data3[3]),
        .I4(data3[4]),
        .O(ap_NS_fsm[10]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \ap_CS_fsm[11]_i_1 
       (.I0(C_ce0),
        .I1(shl_ln_fu_580_p4[10]),
        .I2(shl_ln_fu_580_p4[8]),
        .I3(shl_ln_fu_580_p4[7]),
        .I4(shl_ln_fu_580_p4[9]),
        .O(i_2_fu_1120));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \ap_CS_fsm[12]_i_1 
       (.I0(ap_CS_fsm_state12),
        .I1(tmp2_cast_fu_667_p1[3]),
        .I2(tmp2_cast_fu_667_p1[2]),
        .I3(tmp2_cast_fu_667_p1[1]),
        .I4(tmp2_cast_fu_667_p1[0]),
        .I5(ap_CS_fsm_state14),
        .O(ap_NS_fsm[12]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    \ap_CS_fsm[13]_i_1 
       (.I0(j_2_reg_3560),
        .I1(data1[2]),
        .I2(data1[0]),
        .I3(data1[1]),
        .I4(ap_CS_fsm_state15),
        .O(ap_NS_fsm[13]));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    \ap_CS_fsm[14]_i_1 
       (.I0(ap_CS_fsm_state20),
        .I1(tmp2_cast_fu_667_p1[3]),
        .I2(tmp2_cast_fu_667_p1[2]),
        .I3(tmp2_cast_fu_667_p1[1]),
        .I4(tmp2_cast_fu_667_p1[0]),
        .I5(ap_CS_fsm_state14),
        .O(ap_NS_fsm[14]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h2AAA)) 
    \ap_CS_fsm[15]_i_1 
       (.I0(ap_CS_fsm_state15),
        .I1(data1[1]),
        .I2(data1[0]),
        .I3(data1[2]),
        .O(ap_NS_fsm[15]));
  LUT3 #(
    .INIT(8'hF8)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_start),
        .I1(\ap_CS_fsm_reg_n_6_[0] ),
        .I2(ap_NS_fsm15_out),
        .O(ap_NS_fsm[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(ap_CS_fsm_state5),
        .I1(k_reg_3230),
        .O(ap_NS_fsm[2]));
  LUT5 #(
    .INIT(32'hAAAAAA8A)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(ap_CS_fsm_state3),
        .I1(or_ln_fu_457_p3[2]),
        .I2(or_ln_fu_457_p3[3]),
        .I3(or_ln_fu_457_p3[0]),
        .I4(or_ln_fu_457_p3[1]),
        .O(ap_NS_fsm[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAAABAAAAAA)) 
    \ap_CS_fsm[5]_i_1 
       (.I0(ap_NS_fsm16_out),
        .I1(add_ln_fu_526_p4[2]),
        .I2(add_ln_fu_526_p4[1]),
        .I3(add_ln_fu_526_p4[3]),
        .I4(ap_CS_fsm_state7),
        .I5(add_ln_fu_526_p4[0]),
        .O(ap_NS_fsm[5]));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    \ap_CS_fsm[6]_i_1 
       (.I0(ap_CS_fsm_state8),
        .I1(add_ln_fu_526_p4[10]),
        .I2(add_ln_fu_526_p4[9]),
        .I3(add_ln_fu_526_p4[8]),
        .I4(add_ln_fu_526_p4[7]),
        .I5(ap_CS_fsm_state6),
        .O(ap_NS_fsm[6]));
  LUT5 #(
    .INIT(32'hFF00EF00)) 
    \ap_CS_fsm[7]_i_1 
       (.I0(add_ln_fu_526_p4[2]),
        .I1(add_ln_fu_526_p4[1]),
        .I2(add_ln_fu_526_p4[3]),
        .I3(ap_CS_fsm_state7),
        .I4(add_ln_fu_526_p4[0]),
        .O(ap_NS_fsm[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \ap_CS_fsm[8]_i_1 
       (.I0(add_ln_fu_526_p4[10]),
        .I1(add_ln_fu_526_p4[9]),
        .I2(add_ln_fu_526_p4[8]),
        .I3(add_ln_fu_526_p4[7]),
        .I4(ap_CS_fsm_state6),
        .I5(ap_NS_fsm11_out),
        .O(ap_NS_fsm[8]));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAAAAAA)) 
    \ap_CS_fsm[9]_i_1 
       (.I0(ap_CS_fsm_state11),
        .I1(shl_ln_fu_580_p4[9]),
        .I2(shl_ln_fu_580_p4[7]),
        .I3(shl_ln_fu_580_p4[8]),
        .I4(shl_ln_fu_580_p4[10]),
        .I5(C_ce0),
        .O(ap_NS_fsm[9]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_6_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[10] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[10]),
        .Q(ap_CS_fsm_state11),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[11] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(i_2_fu_1120),
        .Q(ap_CS_fsm_state12),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[12] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[12]),
        .Q(ap_CS_fsm_state13),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[13] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[13]),
        .Q(ap_CS_fsm_state14),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[14] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[14]),
        .Q(ap_CS_fsm_state15),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[15] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[15]),
        .Q(ap_CS_fsm_state16),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[16] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_state16),
        .Q(ap_CS_fsm_state17),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[17] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_state17),
        .Q(ap_CS_fsm_state18),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[18] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_state18),
        .Q(ap_CS_fsm_state19),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[19] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_CS_fsm_state19),
        .Q(ap_CS_fsm_state20),
        .R(ap_rst));
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
        .D(ap_CS_fsm_state4),
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
        .Q(C_ce0),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[9]),
        .Q(ap_CS_fsm_state10),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_6_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    ap_ready_INST_0
       (.I0(ap_CS_fsm_state13),
        .I1(i_2_fu_112[1]),
        .I2(i_2_fu_112[0]),
        .I3(i_2_fu_112[2]),
        .I4(i_2_fu_112[3]),
        .O(ap_ready));
  FDRE \empty_14_reg_907_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln_fu_526_p4[10]),
        .Q(empty_14_reg_907[10]),
        .R(1'b0));
  FDRE \empty_14_reg_907_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln_fu_526_p4[7]),
        .Q(empty_14_reg_907[7]),
        .R(1'b0));
  FDRE \empty_14_reg_907_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln_fu_526_p4[8]),
        .Q(empty_14_reg_907[8]),
        .R(1'b0));
  FDRE \empty_14_reg_907_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln_fu_526_p4[9]),
        .Q(empty_14_reg_907[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \empty_15_reg_1034[4]_i_1 
       (.I0(data1[7]),
        .O(empty_15_fu_662_p2[4]));
  FDRE \empty_15_reg_1034_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp2_cast_fu_667_p1[0]),
        .Q(empty_15_reg_1034[0]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp2_cast_fu_667_p1[1]),
        .Q(empty_15_reg_1034[1]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp2_cast_fu_667_p1[2]),
        .Q(empty_15_reg_1034[2]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp2_cast_fu_667_p1[3]),
        .Q(empty_15_reg_1034[3]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_15_fu_662_p2[4]),
        .Q(empty_15_reg_1034[4]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_15_fu_662_p2[5]),
        .Q(empty_15_reg_1034[5]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_15_fu_662_p2[6]),
        .Q(empty_15_reg_1034[6]),
        .R(1'b0));
  FDRE \empty_15_reg_1034_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_15_fu_662_p2[7]),
        .Q(empty_15_reg_1034[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \empty_15_reg_1034_reg[7]_i_1 
       (.CI(data1[7]),
        .CI_TOP(1'b0),
        .CO({\NLW_empty_15_reg_1034_reg[7]_i_1_CO_UNCONNECTED [7:2],\empty_15_reg_1034_reg[7]_i_1_n_12 ,\empty_15_reg_1034_reg[7]_i_1_n_13 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_empty_15_reg_1034_reg[7]_i_1_O_UNCONNECTED [7:3],empty_15_fu_662_p2[7:5]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,data1[10:8]}));
  LUT1 #(
    .INIT(2'h1)) 
    \empty_16_reg_1039[7]_i_2 
       (.I0(data1[10]),
        .O(\empty_16_reg_1039[7]_i_2_n_6 ));
  LUT1 #(
    .INIT(2'h1)) 
    \empty_16_reg_1039[7]_i_3 
       (.I0(data1[9]),
        .O(\empty_16_reg_1039[7]_i_3_n_6 ));
  LUT1 #(
    .INIT(2'h1)) 
    \empty_16_reg_1039[7]_i_4 
       (.I0(data1[8]),
        .O(\empty_16_reg_1039[7]_i_4_n_6 ));
  FDRE \empty_16_reg_1039_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_16_fu_671_p2[5]),
        .Q(empty_16_reg_1039[5]),
        .R(1'b0));
  FDRE \empty_16_reg_1039_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_16_fu_671_p2[6]),
        .Q(empty_16_reg_1039[6]),
        .R(1'b0));
  FDRE \empty_16_reg_1039_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(empty_16_fu_671_p2[7]),
        .Q(empty_16_reg_1039[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \empty_16_reg_1039_reg[7]_i_1 
       (.CI(data1[7]),
        .CI_TOP(1'b0),
        .CO({\NLW_empty_16_reg_1039_reg[7]_i_1_CO_UNCONNECTED [7:2],\empty_16_reg_1039_reg[7]_i_1_n_12 ,\empty_16_reg_1039_reg[7]_i_1_n_13 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,data1[9:8]}),
        .O({\NLW_empty_16_reg_1039_reg[7]_i_1_O_UNCONNECTED [7:3],empty_16_fu_671_p2}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,\empty_16_reg_1039[7]_i_2_n_6 ,\empty_16_reg_1039[7]_i_3_n_6 ,\empty_16_reg_1039[7]_i_4_n_6 }));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \i_1_fu_108[0]_i_1 
       (.I0(shl_ln_fu_580_p4[7]),
        .O(add_ln31_fu_611_p2[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \i_1_fu_108[1]_i_1 
       (.I0(shl_ln_fu_580_p4[7]),
        .I1(shl_ln_fu_580_p4[8]),
        .O(add_ln31_fu_611_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \i_1_fu_108[2]_i_1 
       (.I0(shl_ln_fu_580_p4[9]),
        .I1(shl_ln_fu_580_p4[7]),
        .I2(shl_ln_fu_580_p4[8]),
        .O(add_ln31_fu_611_p2[2]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \i_1_fu_108[3]_i_1 
       (.I0(ap_CS_fsm_state6),
        .I1(add_ln_fu_526_p4[7]),
        .I2(add_ln_fu_526_p4[8]),
        .I3(add_ln_fu_526_p4[9]),
        .I4(add_ln_fu_526_p4[10]),
        .O(ap_NS_fsm14_out));
  LUT5 #(
    .INIT(32'h80000000)) 
    \i_1_fu_108[3]_i_2 
       (.I0(data3[4]),
        .I1(data3[3]),
        .I2(data3[5]),
        .I3(data3[6]),
        .I4(ap_CS_fsm_state10),
        .O(ap_NS_fsm11_out));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \i_1_fu_108[3]_i_3 
       (.I0(shl_ln_fu_580_p4[10]),
        .I1(shl_ln_fu_580_p4[8]),
        .I2(shl_ln_fu_580_p4[7]),
        .I3(shl_ln_fu_580_p4[9]),
        .O(add_ln31_fu_611_p2[3]));
  FDSE #(
    .INIT(1'b0)) 
    \i_1_fu_108_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln31_fu_611_p2[0]),
        .Q(shl_ln_fu_580_p4[7]),
        .S(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_108_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln31_fu_611_p2[1]),
        .Q(shl_ln_fu_580_p4[8]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_108_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln31_fu_611_p2[2]),
        .Q(shl_ln_fu_580_p4[9]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_1_fu_108_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln31_fu_611_p2[3]),
        .Q(shl_ln_fu_580_p4[10]),
        .R(ap_NS_fsm14_out));
  LUT5 #(
    .INIT(32'h80000000)) 
    \i_2_fu_112[3]_i_1 
       (.I0(ap_CS_fsm_state14),
        .I1(tmp2_cast_fu_667_p1[0]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .I3(tmp2_cast_fu_667_p1[2]),
        .I4(tmp2_cast_fu_667_p1[3]),
        .O(ap_NS_fsm10_out));
  FDSE #(
    .INIT(1'b0)) 
    \i_2_fu_112_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm10_out),
        .D(indvars_iv_next33_reg_1020[0]),
        .Q(i_2_fu_112[0]),
        .S(i_2_fu_1120));
  FDRE #(
    .INIT(1'b0)) 
    \i_2_fu_112_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm10_out),
        .D(indvars_iv_next33_reg_1020[1]),
        .Q(i_2_fu_112[1]),
        .R(i_2_fu_1120));
  FDRE #(
    .INIT(1'b0)) 
    \i_2_fu_112_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm10_out),
        .D(indvars_iv_next33_reg_1020[2]),
        .Q(i_2_fu_112[2]),
        .R(i_2_fu_1120));
  FDRE #(
    .INIT(1'b0)) 
    \i_2_fu_112_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm10_out),
        .D(indvars_iv_next33_reg_1020[3]),
        .Q(i_2_fu_112[3]),
        .R(i_2_fu_1120));
  FDRE \i_5_reg_1008_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(i_2_fu_112[0]),
        .Q(data1[7]),
        .R(1'b0));
  FDRE \i_5_reg_1008_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(i_2_fu_112[1]),
        .Q(data1[8]),
        .R(1'b0));
  FDRE \i_5_reg_1008_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(i_2_fu_112[2]),
        .Q(data1[9]),
        .R(1'b0));
  FDRE \i_5_reg_1008_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(i_2_fu_112[3]),
        .Q(data1[10]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \i_fu_104[0]_i_1 
       (.I0(add_ln_fu_526_p4[7]),
        .O(\i_fu_104[0]_i_1_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_fu_104[1]_i_1 
       (.I0(add_ln_fu_526_p4[8]),
        .I1(add_ln_fu_526_p4[7]),
        .O(add_ln23_fu_550_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \i_fu_104[2]_i_1 
       (.I0(add_ln_fu_526_p4[9]),
        .I1(add_ln_fu_526_p4[8]),
        .I2(add_ln_fu_526_p4[7]),
        .O(add_ln23_fu_550_p2[2]));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \i_fu_104[3]_i_1 
       (.I0(ap_CS_fsm_state2),
        .I1(\j_fu_100_reg_n_6_[2] ),
        .I2(\j_fu_100_reg_n_6_[4] ),
        .I3(\j_fu_100_reg_n_6_[3] ),
        .I4(\j_fu_100_reg_n_6_[0] ),
        .I5(\j_fu_100_reg_n_6_[1] ),
        .O(ap_NS_fsm16_out));
  LUT5 #(
    .INIT(32'h00000040)) 
    \i_fu_104[3]_i_2 
       (.I0(add_ln_fu_526_p4[0]),
        .I1(ap_CS_fsm_state7),
        .I2(add_ln_fu_526_p4[3]),
        .I3(add_ln_fu_526_p4[1]),
        .I4(add_ln_fu_526_p4[2]),
        .O(ap_NS_fsm13_out));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \i_fu_104[3]_i_3 
       (.I0(add_ln_fu_526_p4[7]),
        .I1(add_ln_fu_526_p4[8]),
        .I2(add_ln_fu_526_p4[9]),
        .I3(add_ln_fu_526_p4[10]),
        .O(add_ln23_fu_550_p2[3]));
  FDSE #(
    .INIT(1'b0)) 
    \i_fu_104_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm13_out),
        .D(\i_fu_104[0]_i_1_n_6 ),
        .Q(add_ln_fu_526_p4[7]),
        .S(ap_NS_fsm16_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_104_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm13_out),
        .D(add_ln23_fu_550_p2[1]),
        .Q(add_ln_fu_526_p4[8]),
        .R(ap_NS_fsm16_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_104_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm13_out),
        .D(add_ln23_fu_550_p2[2]),
        .Q(add_ln_fu_526_p4[9]),
        .R(ap_NS_fsm16_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_104_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm13_out),
        .D(add_ln23_fu_550_p2[3]),
        .Q(add_ln_fu_526_p4[10]),
        .R(ap_NS_fsm16_out));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \indvars_iv_next19_reg_1044[0]_i_1 
       (.I0(tmp2_cast_fu_667_p1[0]),
        .O(indvars_iv_next19_fu_676_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \indvars_iv_next19_reg_1044[1]_i_1 
       (.I0(tmp2_cast_fu_667_p1[1]),
        .I1(tmp2_cast_fu_667_p1[0]),
        .O(indvars_iv_next19_fu_676_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \indvars_iv_next19_reg_1044[2]_i_1 
       (.I0(tmp2_cast_fu_667_p1[2]),
        .I1(tmp2_cast_fu_667_p1[0]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .O(\indvars_iv_next19_reg_1044[2]_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \indvars_iv_next19_reg_1044[3]_i_1 
       (.I0(tmp2_cast_fu_667_p1[3]),
        .I1(tmp2_cast_fu_667_p1[2]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .I3(tmp2_cast_fu_667_p1[0]),
        .O(\indvars_iv_next19_reg_1044[3]_i_1_n_6 ));
  FDRE \indvars_iv_next19_reg_1044_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(indvars_iv_next19_fu_676_p2[0]),
        .Q(data1[3]),
        .R(1'b0));
  FDRE \indvars_iv_next19_reg_1044_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(indvars_iv_next19_fu_676_p2[1]),
        .Q(data1[4]),
        .R(1'b0));
  FDRE \indvars_iv_next19_reg_1044_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(\indvars_iv_next19_reg_1044[2]_i_1_n_6 ),
        .Q(data1[5]),
        .R(1'b0));
  FDRE \indvars_iv_next19_reg_1044_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(\indvars_iv_next19_reg_1044[3]_i_1_n_6 ),
        .Q(data1[6]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \indvars_iv_next33_reg_1020[0]_i_1 
       (.I0(i_2_fu_112[0]),
        .O(indvars_iv_next33_fu_630_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \indvars_iv_next33_reg_1020[1]_i_1 
       (.I0(i_2_fu_112[0]),
        .I1(i_2_fu_112[1]),
        .O(indvars_iv_next33_fu_630_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \indvars_iv_next33_reg_1020[2]_i_1 
       (.I0(i_2_fu_112[2]),
        .I1(i_2_fu_112[0]),
        .I2(i_2_fu_112[1]),
        .O(indvars_iv_next33_fu_630_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \indvars_iv_next33_reg_1020[3]_i_1 
       (.I0(i_2_fu_112[1]),
        .I1(i_2_fu_112[0]),
        .I2(i_2_fu_112[2]),
        .I3(i_2_fu_112[3]),
        .O(indvars_iv_next33_fu_630_p2[3]));
  FDRE \indvars_iv_next33_reg_1020_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(indvars_iv_next33_fu_630_p2[0]),
        .Q(indvars_iv_next33_reg_1020[0]),
        .R(1'b0));
  FDRE \indvars_iv_next33_reg_1020_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(indvars_iv_next33_fu_630_p2[1]),
        .Q(indvars_iv_next33_reg_1020[1]),
        .R(1'b0));
  FDRE \indvars_iv_next33_reg_1020_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(indvars_iv_next33_fu_630_p2[2]),
        .Q(indvars_iv_next33_reg_1020[2]),
        .R(1'b0));
  FDRE \indvars_iv_next33_reg_1020_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state13),
        .D(indvars_iv_next33_fu_630_p2[3]),
        .Q(indvars_iv_next33_reg_1020[3]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \j_1_reg_345[3]_i_1 
       (.I0(C_ce0),
        .I1(shl_ln_fu_580_p4[10]),
        .I2(shl_ln_fu_580_p4[8]),
        .I3(shl_ln_fu_580_p4[7]),
        .I4(shl_ln_fu_580_p4[9]),
        .O(ap_NS_fsm12_out));
  FDSE \j_1_reg_345_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state11),
        .D(add_ln33_reg_993[0]),
        .Q(data3[3]),
        .S(ap_NS_fsm12_out));
  FDRE \j_1_reg_345_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state11),
        .D(add_ln33_reg_993[1]),
        .Q(data3[4]),
        .R(ap_NS_fsm12_out));
  FDRE \j_1_reg_345_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state11),
        .D(add_ln33_reg_993[2]),
        .Q(data3[5]),
        .R(ap_NS_fsm12_out));
  FDRE \j_1_reg_345_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state11),
        .D(add_ln33_reg_993[3]),
        .Q(data3[6]),
        .R(ap_NS_fsm12_out));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \j_2_reg_356[3]_i_1 
       (.I0(ap_CS_fsm_state13),
        .I1(i_2_fu_112[1]),
        .I2(i_2_fu_112[0]),
        .I3(i_2_fu_112[2]),
        .I4(i_2_fu_112[3]),
        .O(j_2_reg_3560));
  LUT4 #(
    .INIT(16'h8000)) 
    \j_2_reg_356[3]_i_2 
       (.I0(ap_CS_fsm_state15),
        .I1(data1[1]),
        .I2(data1[0]),
        .I3(data1[2]),
        .O(ap_NS_fsm1));
  FDSE \j_2_reg_356_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(data1[3]),
        .Q(tmp2_cast_fu_667_p1[0]),
        .S(j_2_reg_3560));
  FDRE \j_2_reg_356_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(data1[4]),
        .Q(tmp2_cast_fu_667_p1[1]),
        .R(j_2_reg_3560));
  FDRE \j_2_reg_356_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(data1[5]),
        .Q(tmp2_cast_fu_667_p1[2]),
        .R(j_2_reg_3560));
  FDRE \j_2_reg_356_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(data1[6]),
        .Q(tmp2_cast_fu_667_p1[3]),
        .R(j_2_reg_3560));
  LUT2 #(
    .INIT(4'h8)) 
    \j_fu_100[4]_i_1 
       (.I0(\ap_CS_fsm_reg_n_6_[0] ),
        .I1(ap_start),
        .O(ap_NS_fsm17_out));
  LUT5 #(
    .INIT(32'h00000020)) 
    \j_fu_100[4]_i_2 
       (.I0(ap_CS_fsm_state3),
        .I1(or_ln_fu_457_p3[2]),
        .I2(or_ln_fu_457_p3[3]),
        .I3(or_ln_fu_457_p3[0]),
        .I4(or_ln_fu_457_p3[1]),
        .O(ap_NS_fsm15_out));
  FDRE #(
    .INIT(1'b0)) 
    \j_fu_100_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm15_out),
        .D(add_ln15_reg_846[0]),
        .Q(\j_fu_100_reg_n_6_[0] ),
        .R(ap_NS_fsm17_out));
  FDRE #(
    .INIT(1'b0)) 
    \j_fu_100_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm15_out),
        .D(add_ln15_reg_846[1]),
        .Q(\j_fu_100_reg_n_6_[1] ),
        .R(ap_NS_fsm17_out));
  FDRE #(
    .INIT(1'b0)) 
    \j_fu_100_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm15_out),
        .D(add_ln15_reg_846[2]),
        .Q(\j_fu_100_reg_n_6_[2] ),
        .R(ap_NS_fsm17_out));
  FDRE #(
    .INIT(1'b0)) 
    \j_fu_100_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm15_out),
        .D(add_ln15_reg_846[3]),
        .Q(\j_fu_100_reg_n_6_[3] ),
        .R(ap_NS_fsm17_out));
  FDRE #(
    .INIT(1'b0)) 
    \j_fu_100_reg[4] 
       (.C(ap_clk),
        .CE(ap_NS_fsm15_out),
        .D(add_ln15_reg_846[4]),
        .Q(\j_fu_100_reg_n_6_[4] ),
        .R(ap_NS_fsm17_out));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \k_1_reg_334[3]_i_1 
       (.I0(ap_CS_fsm_state6),
        .I1(add_ln_fu_526_p4[7]),
        .I2(add_ln_fu_526_p4[8]),
        .I3(add_ln_fu_526_p4[9]),
        .I4(add_ln_fu_526_p4[10]),
        .O(k_1_reg_3340));
  FDRE \k_1_reg_334_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state8),
        .D(add_ln25_reg_922[0]),
        .Q(add_ln_fu_526_p4[0]),
        .R(k_1_reg_3340));
  FDRE \k_1_reg_334_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state8),
        .D(add_ln25_reg_922[1]),
        .Q(add_ln_fu_526_p4[1]),
        .R(k_1_reg_3340));
  FDRE \k_1_reg_334_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state8),
        .D(add_ln25_reg_922[2]),
        .Q(add_ln_fu_526_p4[2]),
        .R(k_1_reg_3340));
  FDRE \k_1_reg_334_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state8),
        .D(add_ln25_reg_922[3]),
        .Q(add_ln_fu_526_p4[3]),
        .R(k_1_reg_3340));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \k_2_reg_368[2]_i_1 
       (.I0(ap_CS_fsm_state14),
        .I1(tmp2_cast_fu_667_p1[0]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .I3(tmp2_cast_fu_667_p1[2]),
        .I4(tmp2_cast_fu_667_p1[3]),
        .O(k_2_reg_3680));
  FDSE \k_2_reg_368_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state20),
        .D(add_ln53_reg_1098[0]),
        .Q(data1[0]),
        .S(k_2_reg_3680));
  FDRE \k_2_reg_368_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state20),
        .D(add_ln53_reg_1098[1]),
        .Q(data1[1]),
        .R(k_2_reg_3680));
  FDRE \k_2_reg_368_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state20),
        .D(add_ln53_reg_1098[2]),
        .Q(data1[2]),
        .R(k_2_reg_3680));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAA8A)) 
    \k_reg_323[3]_i_1 
       (.I0(ap_CS_fsm_state2),
        .I1(\j_fu_100_reg_n_6_[2] ),
        .I2(\j_fu_100_reg_n_6_[4] ),
        .I3(\j_fu_100_reg_n_6_[3] ),
        .I4(\j_fu_100_reg_n_6_[0] ),
        .I5(\j_fu_100_reg_n_6_[1] ),
        .O(k_reg_3230));
  FDRE \k_reg_323_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state5),
        .D(add_ln17_reg_871[0]),
        .Q(or_ln_fu_457_p3[0]),
        .R(k_reg_3230));
  FDRE \k_reg_323_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state5),
        .D(add_ln17_reg_871[1]),
        .Q(or_ln_fu_457_p3[1]),
        .R(k_reg_3230));
  FDRE \k_reg_323_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state5),
        .D(add_ln17_reg_871[2]),
        .Q(or_ln_fu_457_p3[2]),
        .R(k_reg_3230));
  FDRE \k_reg_323_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state5),
        .D(add_ln17_reg_871[3]),
        .Q(or_ln_fu_457_p3[3]),
        .R(k_reg_3230));
  bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1 mul_32s_32s_32_1_1_U1
       (.D({tmp_product__3,mul_32s_32s_32_1_1_U1_n_22,mul_32s_32s_32_1_1_U1_n_23,mul_32s_32s_32_1_1_U1_n_24,mul_32s_32s_32_1_1_U1_n_25,mul_32s_32s_32_1_1_U1_n_26,mul_32s_32s_32_1_1_U1_n_27,mul_32s_32s_32_1_1_U1_n_28,mul_32s_32s_32_1_1_U1_n_29,mul_32s_32s_32_1_1_U1_n_30,mul_32s_32s_32_1_1_U1_n_31,mul_32s_32s_32_1_1_U1_n_32,mul_32s_32s_32_1_1_U1_n_33,mul_32s_32s_32_1_1_U1_n_34,mul_32s_32s_32_1_1_U1_n_35,mul_32s_32s_32_1_1_U1_n_36,mul_32s_32s_32_1_1_U1_n_37}),
        .DSP_A_B_DATA_INST(C_load_1_reg_1003),
        .DSP_A_B_DATA_INST_0(ap_CS_fsm_state19),
        .DSP_A_B_DATA_INST_1(C_load_reg_998),
        .Q(reg_385),
        .orig_q0(orig_q0),
        .orig_q1(orig_q1),
        .tmp_product__1_i_16_0(orig_load_8_reg_1083),
        .tmp_product__1_i_32_0(add_ln57_reg_1113));
  FDRE \mul_ln57_1_reg_1118_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_37),
        .Q(mul_ln57_1_reg_1118[0]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_27),
        .Q(mul_ln57_1_reg_1118[10]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_26),
        .Q(mul_ln57_1_reg_1118[11]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_25),
        .Q(mul_ln57_1_reg_1118[12]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_24),
        .Q(mul_ln57_1_reg_1118[13]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_23),
        .Q(mul_ln57_1_reg_1118[14]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_22),
        .Q(mul_ln57_1_reg_1118[15]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[16]),
        .Q(mul_ln57_1_reg_1118[16]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[17]),
        .Q(mul_ln57_1_reg_1118[17]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[18]),
        .Q(mul_ln57_1_reg_1118[18]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[19]),
        .Q(mul_ln57_1_reg_1118[19]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_36),
        .Q(mul_ln57_1_reg_1118[1]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[20]),
        .Q(mul_ln57_1_reg_1118[20]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[21]),
        .Q(mul_ln57_1_reg_1118[21]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[22]),
        .Q(mul_ln57_1_reg_1118[22]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[23]),
        .Q(mul_ln57_1_reg_1118[23]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[24]),
        .Q(mul_ln57_1_reg_1118[24]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[25]),
        .Q(mul_ln57_1_reg_1118[25]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[26]),
        .Q(mul_ln57_1_reg_1118[26]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[27]),
        .Q(mul_ln57_1_reg_1118[27]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[28]),
        .Q(mul_ln57_1_reg_1118[28]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[29]),
        .Q(mul_ln57_1_reg_1118[29]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_35),
        .Q(mul_ln57_1_reg_1118[2]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[30]),
        .Q(mul_ln57_1_reg_1118[30]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(tmp_product__3[31]),
        .Q(mul_ln57_1_reg_1118[31]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_34),
        .Q(mul_ln57_1_reg_1118[3]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_33),
        .Q(mul_ln57_1_reg_1118[4]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_32),
        .Q(mul_ln57_1_reg_1118[5]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_31),
        .Q(mul_ln57_1_reg_1118[6]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_30),
        .Q(mul_ln57_1_reg_1118[7]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_29),
        .Q(mul_ln57_1_reg_1118[8]),
        .R(1'b0));
  FDRE \mul_ln57_1_reg_1118_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state19),
        .D(mul_32s_32s_32_1_1_U1_n_28),
        .Q(mul_ln57_1_reg_1118[9]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_37),
        .Q(mul_ln57_reg_1078[0]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_27),
        .Q(mul_ln57_reg_1078[10]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_26),
        .Q(mul_ln57_reg_1078[11]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_25),
        .Q(mul_ln57_reg_1078[12]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_24),
        .Q(mul_ln57_reg_1078[13]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_23),
        .Q(mul_ln57_reg_1078[14]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_22),
        .Q(mul_ln57_reg_1078[15]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[16]),
        .Q(mul_ln57_reg_1078[16]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[17]),
        .Q(mul_ln57_reg_1078[17]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[18]),
        .Q(mul_ln57_reg_1078[18]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[19]),
        .Q(mul_ln57_reg_1078[19]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_36),
        .Q(mul_ln57_reg_1078[1]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[20]),
        .Q(mul_ln57_reg_1078[20]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[21]),
        .Q(mul_ln57_reg_1078[21]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[22]),
        .Q(mul_ln57_reg_1078[22]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[23]),
        .Q(mul_ln57_reg_1078[23]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[24]),
        .Q(mul_ln57_reg_1078[24]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[25]),
        .Q(mul_ln57_reg_1078[25]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[26]),
        .Q(mul_ln57_reg_1078[26]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[27]),
        .Q(mul_ln57_reg_1078[27]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[28]),
        .Q(mul_ln57_reg_1078[28]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[29]),
        .Q(mul_ln57_reg_1078[29]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_35),
        .Q(mul_ln57_reg_1078[2]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[30]),
        .Q(mul_ln57_reg_1078[30]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(tmp_product__3[31]),
        .Q(mul_ln57_reg_1078[31]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_34),
        .Q(mul_ln57_reg_1078[3]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_33),
        .Q(mul_ln57_reg_1078[4]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_32),
        .Q(mul_ln57_reg_1078[5]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_31),
        .Q(mul_ln57_reg_1078[6]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_30),
        .Q(mul_ln57_reg_1078[7]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_29),
        .Q(mul_ln57_reg_1078[8]),
        .R(1'b0));
  FDRE \mul_ln57_reg_1078_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state16),
        .D(mul_32s_32s_32_1_1_U1_n_28),
        .Q(mul_ln57_reg_1078[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0FF00FF00FF004F4)) 
    \orig_address0[0]_INST_0 
       (.I0(ap_CS_fsm_state10),
        .I1(\orig_address0[0]_INST_0_i_1_n_6 ),
        .I2(ap_CS_fsm_state18),
        .I3(data1[0]),
        .I4(ap_CS_fsm_state16),
        .I5(ap_CS_fsm_state17),
        .O(orig_address0[0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hFB0BF808)) 
    \orig_address0[0]_INST_0_i_1 
       (.I0(add_ln20_reg_886[0]),
        .I1(ap_CS_fsm_state4),
        .I2(ap_CS_fsm_state7),
        .I3(add_ln_fu_526_p4[0]),
        .I4(or_ln_fu_457_p3[0]),
        .O(\orig_address0[0]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFC8FFC8FFC88888)) 
    \orig_address0[10]_INST_0 
       (.I0(ap_CS_fsm_state18),
        .I1(data1[10]),
        .I2(ap_CS_fsm_state17),
        .I3(\orig_address0[10]_INST_0_i_1_n_6 ),
        .I4(\orig_address0[10]_INST_0_i_2_n_6 ),
        .I5(\orig_address0[10]_INST_0_i_3_n_6 ),
        .O(orig_address0[10]));
  LUT6 #(
    .INIT(64'h0505050100050001)) 
    \orig_address0[10]_INST_0_i_1 
       (.I0(ap_CS_fsm_state18),
        .I1(ap_CS_fsm_state10),
        .I2(ap_CS_fsm_state17),
        .I3(ap_CS_fsm_state16),
        .I4(shl_ln_fu_580_p4[10]),
        .I5(empty_15_reg_1034[7]),
        .O(\orig_address0[10]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'h7FFF800000000000)) 
    \orig_address0[10]_INST_0_i_2 
       (.I0(add_ln_fu_526_p4[3]),
        .I1(empty_14_reg_907[7]),
        .I2(empty_14_reg_907[8]),
        .I3(empty_14_reg_907[9]),
        .I4(empty_14_reg_907[10]),
        .I5(ap_CS_fsm_state7),
        .O(\orig_address0[10]_INST_0_i_2_n_6 ));
  LUT6 #(
    .INIT(64'hFEFEFFFEFEFEFEFE)) 
    \orig_address0[10]_INST_0_i_3 
       (.I0(ap_CS_fsm_state17),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state10),
        .I3(ap_CS_fsm_state4),
        .I4(ap_CS_fsm_state7),
        .I5(add_ln20_reg_886[7]),
        .O(\orig_address0[10]_INST_0_i_3_n_6 ));
  LUT6 #(
    .INIT(64'h00FFFF00AB01AB01)) 
    \orig_address0[1]_INST_0 
       (.I0(\orig_address0[2]_INST_0_i_2_n_6 ),
        .I1(ap_CS_fsm_state10),
        .I2(\orig_address0[1]_INST_0_i_1_n_6 ),
        .I3(data1[1]),
        .I4(data1[0]),
        .I5(ap_CS_fsm_state18),
        .O(orig_address0[1]));
  LUT5 #(
    .INIT(32'h0047FF47)) 
    \orig_address0[1]_INST_0_i_1 
       (.I0(add_ln20_reg_886[1]),
        .I1(ap_CS_fsm_state4),
        .I2(or_ln_fu_457_p3[1]),
        .I3(ap_CS_fsm_state7),
        .I4(add_ln_fu_526_p4[1]),
        .O(\orig_address0[1]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'h7F7F7F708F808F80)) 
    \orig_address0[2]_INST_0 
       (.I0(data1[0]),
        .I1(data1[1]),
        .I2(ap_CS_fsm_state18),
        .I3(\orig_address0[2]_INST_0_i_1_n_6 ),
        .I4(\orig_address0[2]_INST_0_i_2_n_6 ),
        .I5(data1[2]),
        .O(orig_address0[2]));
  LUT6 #(
    .INIT(64'h4545404545404040)) 
    \orig_address0[2]_INST_0_i_1 
       (.I0(\orig_address0[6]_INST_0_i_3_n_6 ),
        .I1(add_ln_fu_526_p4[2]),
        .I2(ap_CS_fsm_state7),
        .I3(ap_CS_fsm_state4),
        .I4(add_ln20_reg_886[2]),
        .I5(or_ln_fu_457_p3[2]),
        .O(\orig_address0[2]_INST_0_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \orig_address0[2]_INST_0_i_2 
       (.I0(ap_CS_fsm_state17),
        .I1(ap_CS_fsm_state16),
        .O(\orig_address0[2]_INST_0_i_2_n_6 ));
  LUT6 #(
    .INIT(64'hEEE0EEEEE0E0E0E0)) 
    \orig_address0[3]_INST_0 
       (.I0(\orig_address0[3]_INST_0_i_1_n_6 ),
        .I1(\orig_address0[3]_INST_0_i_2_n_6 ),
        .I2(\orig_address0[3]_INST_0_i_3_n_6 ),
        .I3(data3[3]),
        .I4(ap_CS_fsm_state10),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(orig_address0[3]));
  LUT6 #(
    .INIT(64'hFFFF00AC00AC00AC)) 
    \orig_address0[3]_INST_0_i_1 
       (.I0(add_ln20_reg_886[3]),
        .I1(data6[3]),
        .I2(ap_CS_fsm_state4),
        .I3(ap_CS_fsm_state7),
        .I4(ap_CS_fsm_state18),
        .I5(tmp2_cast_fu_667_p1[0]),
        .O(\orig_address0[3]_INST_0_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hFEFFFEFE)) 
    \orig_address0[3]_INST_0_i_2 
       (.I0(ap_CS_fsm_state17),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state10),
        .I3(add_ln_fu_526_p4[3]),
        .I4(ap_CS_fsm_state7),
        .O(\orig_address0[3]_INST_0_i_2_n_6 ));
  LUT6 #(
    .INIT(64'hBBBB8888B888B888)) 
    \orig_address0[3]_INST_0_i_3 
       (.I0(tmp2_cast_fu_667_p1[0]),
        .I1(ap_CS_fsm_state18),
        .I2(ap_CS_fsm_state16),
        .I3(empty_15_reg_1034[0]),
        .I4(data1[3]),
        .I5(ap_CS_fsm_state17),
        .O(\orig_address0[3]_INST_0_i_3_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h8B88)) 
    \orig_address0[4]_INST_0 
       (.I0(tmp2_cast_fu_667_p1[1]),
        .I1(ap_CS_fsm_state18),
        .I2(\orig_address0[4]_INST_0_i_1_n_6 ),
        .I3(\orig_address0[4]_INST_0_i_2_n_6 ),
        .O(orig_address0[4]));
  LUT6 #(
    .INIT(64'h3350335F33503350)) 
    \orig_address0[4]_INST_0_i_1 
       (.I0(empty_15_reg_1034[1]),
        .I1(data1[4]),
        .I2(ap_CS_fsm_state16),
        .I3(ap_CS_fsm_state17),
        .I4(data3[4]),
        .I5(ap_CS_fsm_state10),
        .O(\orig_address0[4]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFF0C05FFFFFCF5)) 
    \orig_address0[4]_INST_0_i_2 
       (.I0(\orig_address0[4]_INST_0_i_3_n_6 ),
        .I1(add_ln20_reg_886[4]),
        .I2(ap_CS_fsm_state7),
        .I3(ap_CS_fsm_state4),
        .I4(\orig_address0[6]_INST_0_i_3_n_6 ),
        .I5(add_ln_fu_526_p4[3]),
        .O(\orig_address0[4]_INST_0_i_2_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \orig_address0[4]_INST_0_i_3 
       (.I0(tmp_1_reg_851[4]),
        .I1(tmp_1_reg_851[3]),
        .I2(or_ln_fu_457_p3[3]),
        .O(\orig_address0[4]_INST_0_i_3_n_6 ));
  LUT4 #(
    .INIT(16'h8B88)) 
    \orig_address0[5]_INST_0 
       (.I0(tmp2_cast_fu_667_p1[2]),
        .I1(ap_CS_fsm_state18),
        .I2(\orig_address0[5]_INST_0_i_1_n_6 ),
        .I3(\orig_address0[5]_INST_0_i_2_n_6 ),
        .O(orig_address0[5]));
  LUT6 #(
    .INIT(64'h330533F5330033F0)) 
    \orig_address0[5]_INST_0_i_1 
       (.I0(data3[5]),
        .I1(data1[5]),
        .I2(ap_CS_fsm_state16),
        .I3(ap_CS_fsm_state17),
        .I4(empty_15_reg_1034[2]),
        .I5(ap_CS_fsm_state10),
        .O(\orig_address0[5]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFF0C05FFFFFCF5)) 
    \orig_address0[5]_INST_0_i_2 
       (.I0(\orig_address0[5]_INST_0_i_3_n_6 ),
        .I1(add_ln20_reg_886[5]),
        .I2(ap_CS_fsm_state7),
        .I3(ap_CS_fsm_state4),
        .I4(\orig_address0[6]_INST_0_i_3_n_6 ),
        .I5(add_ln_fu_526_p4[3]),
        .O(\orig_address0[5]_INST_0_i_2_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h9555)) 
    \orig_address0[5]_INST_0_i_3 
       (.I0(tmp_1_reg_851[5]),
        .I1(or_ln_fu_457_p3[3]),
        .I2(tmp_1_reg_851[3]),
        .I3(tmp_1_reg_851[4]),
        .O(\orig_address0[5]_INST_0_i_3_n_6 ));
  LUT4 #(
    .INIT(16'h8B88)) 
    \orig_address0[6]_INST_0 
       (.I0(tmp2_cast_fu_667_p1[3]),
        .I1(ap_CS_fsm_state18),
        .I2(\orig_address0[6]_INST_0_i_1_n_6 ),
        .I3(\orig_address0[6]_INST_0_i_2_n_6 ),
        .O(orig_address0[6]));
  LUT6 #(
    .INIT(64'h3333333355550F00)) 
    \orig_address0[6]_INST_0_i_1 
       (.I0(empty_15_reg_1034[3]),
        .I1(data1[6]),
        .I2(data3[6]),
        .I3(ap_CS_fsm_state10),
        .I4(ap_CS_fsm_state16),
        .I5(ap_CS_fsm_state17),
        .O(\orig_address0[6]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hCFFFCFCCCFEECFEE)) 
    \orig_address0[6]_INST_0_i_2 
       (.I0(data6[6]),
        .I1(\orig_address0[6]_INST_0_i_3_n_6 ),
        .I2(add_ln_fu_526_p4[3]),
        .I3(ap_CS_fsm_state7),
        .I4(add_ln20_reg_886[6]),
        .I5(ap_CS_fsm_state4),
        .O(\orig_address0[6]_INST_0_i_2_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \orig_address0[6]_INST_0_i_3 
       (.I0(ap_CS_fsm_state10),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state17),
        .O(\orig_address0[6]_INST_0_i_3_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'hAAAA8808)) 
    \orig_address0[7]_INST_0 
       (.I0(\orig_address0[7]_INST_0_i_1_n_6 ),
        .I1(\orig_address0[7]_INST_0_i_2_n_6 ),
        .I2(ap_CS_fsm_state10),
        .I3(shl_ln_fu_580_p4[7]),
        .I4(\orig_address0[7]_INST_0_i_3_n_6 ),
        .O(orig_address0[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF282828)) 
    \orig_address0[7]_INST_0_i_1 
       (.I0(ap_CS_fsm_state7),
        .I1(add_ln_fu_526_p4[3]),
        .I2(empty_14_reg_907[7]),
        .I3(ap_CS_fsm_state18),
        .I4(data1[7]),
        .I5(\orig_address0[10]_INST_0_i_3_n_6 ),
        .O(\orig_address0[7]_INST_0_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \orig_address0[7]_INST_0_i_2 
       (.I0(ap_CS_fsm_state18),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state17),
        .O(\orig_address0[7]_INST_0_i_2_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hABA8A8A8)) 
    \orig_address0[7]_INST_0_i_3 
       (.I0(data1[7]),
        .I1(ap_CS_fsm_state17),
        .I2(ap_CS_fsm_state18),
        .I3(ap_CS_fsm_state16),
        .I4(empty_15_reg_1034[4]),
        .O(\orig_address0[7]_INST_0_i_3_n_6 ));
  LUT6 #(
    .INIT(64'h88888888BBBB88B8)) 
    \orig_address0[8]_INST_0 
       (.I0(data1[8]),
        .I1(ap_CS_fsm_state18),
        .I2(ap_CS_fsm_state7),
        .I3(\orig_address0[8]_INST_0_i_1_n_6 ),
        .I4(\orig_address0[10]_INST_0_i_3_n_6 ),
        .I5(\orig_address0[8]_INST_0_i_2_n_6 ),
        .O(orig_address0[8]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \orig_address0[8]_INST_0_i_1 
       (.I0(empty_14_reg_907[8]),
        .I1(empty_14_reg_907[7]),
        .I2(add_ln_fu_526_p4[3]),
        .O(\orig_address0[8]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'h505350505C5F5C5C)) 
    \orig_address0[8]_INST_0_i_2 
       (.I0(data1[8]),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state17),
        .I3(shl_ln_fu_580_p4[8]),
        .I4(ap_CS_fsm_state10),
        .I5(empty_15_reg_1034[5]),
        .O(\orig_address0[8]_INST_0_i_2_n_6 ));
  LUT6 #(
    .INIT(64'hFFC8FFC8FFC88888)) 
    \orig_address0[9]_INST_0 
       (.I0(ap_CS_fsm_state18),
        .I1(data1[9]),
        .I2(ap_CS_fsm_state17),
        .I3(\orig_address0[9]_INST_0_i_1_n_6 ),
        .I4(\orig_address0[10]_INST_0_i_3_n_6 ),
        .I5(\orig_address0[9]_INST_0_i_2_n_6 ),
        .O(orig_address0[9]));
  LUT6 #(
    .INIT(64'h0504050501000101)) 
    \orig_address0[9]_INST_0_i_1 
       (.I0(ap_CS_fsm_state18),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state17),
        .I3(shl_ln_fu_580_p4[9]),
        .I4(ap_CS_fsm_state10),
        .I5(empty_15_reg_1034[6]),
        .O(\orig_address0[9]_INST_0_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \orig_address0[9]_INST_0_i_2 
       (.I0(ap_CS_fsm_state7),
        .I1(empty_14_reg_907[8]),
        .I2(empty_14_reg_907[7]),
        .I3(add_ln_fu_526_p4[3]),
        .I4(empty_14_reg_907[9]),
        .O(\orig_address0[9]_INST_0_i_2_n_6 ));
  LUT6 #(
    .INIT(64'hCFCFCFC066666666)) 
    \orig_address1[0]_INST_0 
       (.I0(ap_CS_fsm_state18),
        .I1(data1[0]),
        .I2(ap_CS_fsm_state15),
        .I3(ap_CS_fsm_state10),
        .I4(add_ln_fu_526_p4[0]),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(orig_address1[0]));
  LUT6 #(
    .INIT(64'hFFFFFFEAAAAAAAEA)) 
    \orig_address1[10]_INST_0 
       (.I0(\orig_address1[10]_INST_0_i_1_n_6 ),
        .I1(empty_16_reg_1039[7]),
        .I2(ap_CS_fsm_state16),
        .I3(ap_CS_fsm_state18),
        .I4(ap_CS_fsm_state17),
        .I5(data1[10]),
        .O(orig_address1[10]));
  LUT6 #(
    .INIT(64'hFF00B8B800000000)) 
    \orig_address1[10]_INST_0_i_1 
       (.I0(shl_ln_fu_580_p4[10]),
        .I1(ap_CS_fsm_state10),
        .I2(add_ln_fu_526_p4[10]),
        .I3(data1[10]),
        .I4(ap_CS_fsm_state15),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(\orig_address1[10]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'h99CC99CC99CC990F)) 
    \orig_address1[1]_INST_0 
       (.I0(data1[0]),
        .I1(data1[1]),
        .I2(\orig_address1[1]_INST_0_i_1_n_6 ),
        .I3(ap_CS_fsm_state18),
        .I4(ap_CS_fsm_state16),
        .I5(ap_CS_fsm_state17),
        .O(orig_address1[1]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h4447)) 
    \orig_address1[1]_INST_0_i_1 
       (.I0(data1[1]),
        .I1(ap_CS_fsm_state15),
        .I2(ap_CS_fsm_state10),
        .I3(add_ln_fu_526_p4[1]),
        .O(\orig_address1[1]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hBBB8FFFFBBB80000)) 
    \orig_address1[2]_INST_0 
       (.I0(data1[2]),
        .I1(ap_CS_fsm_state15),
        .I2(ap_CS_fsm_state10),
        .I3(add_ln_fu_526_p4[2]),
        .I4(\orig_address0[7]_INST_0_i_2_n_6 ),
        .I5(\orig_address1[2]_INST_0_i_1_n_6 ),
        .O(orig_address1[2]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hAA9A)) 
    \orig_address1[2]_INST_0_i_1 
       (.I0(data1[2]),
        .I1(data1[0]),
        .I2(ap_CS_fsm_state18),
        .I3(data1[1]),
        .O(\orig_address1[2]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFEBAAAAAAAAA)) 
    \orig_address1[3]_INST_0 
       (.I0(\orig_address0[3]_INST_0_i_3_n_6 ),
        .I1(ap_CS_fsm_state10),
        .I2(add_ln_fu_526_p4[3]),
        .I3(data3[3]),
        .I4(ap_CS_fsm_state15),
        .I5(\orig_address1[3]_INST_0_i_1_n_6 ),
        .O(orig_address1[3]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h01000101)) 
    \orig_address1[3]_INST_0_i_1 
       (.I0(ap_CS_fsm_state17),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state18),
        .I3(tmp2_cast_fu_667_p1[0]),
        .I4(ap_CS_fsm_state15),
        .O(\orig_address1[3]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000F088)) 
    \orig_address1[4]_INST_0 
       (.I0(empty_15_reg_1034[1]),
        .I1(ap_CS_fsm_state16),
        .I2(tmp3_reg_1050[1]),
        .I3(ap_CS_fsm_state17),
        .I4(ap_CS_fsm_state18),
        .I5(\orig_address1[4]_INST_0_i_1_n_6 ),
        .O(orig_address1[4]));
  LUT6 #(
    .INIT(64'hE0E0E0E0ECA0A0A0)) 
    \orig_address1[4]_INST_0_i_1 
       (.I0(ap_CS_fsm_state18),
        .I1(\orig_address0[7]_INST_0_i_2_n_6 ),
        .I2(tmp2_cast_fu_667_p1[1]),
        .I3(ap_CS_fsm_state10),
        .I4(data3[4]),
        .I5(ap_CS_fsm_state15),
        .O(\orig_address1[4]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000F088)) 
    \orig_address1[5]_INST_0 
       (.I0(empty_15_reg_1034[2]),
        .I1(ap_CS_fsm_state16),
        .I2(tmp3_reg_1050[2]),
        .I3(ap_CS_fsm_state17),
        .I4(ap_CS_fsm_state18),
        .I5(\orig_address1[5]_INST_0_i_1_n_6 ),
        .O(orig_address1[5]));
  LUT6 #(
    .INIT(64'hCFC8C8C888888888)) 
    \orig_address1[5]_INST_0_i_1 
       (.I0(ap_CS_fsm_state18),
        .I1(tmp2_cast_fu_667_p1[2]),
        .I2(ap_CS_fsm_state15),
        .I3(ap_CS_fsm_state10),
        .I4(data3[5]),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(\orig_address1[5]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000F088)) 
    \orig_address1[6]_INST_0 
       (.I0(empty_15_reg_1034[3]),
        .I1(ap_CS_fsm_state16),
        .I2(tmp3_reg_1050[3]),
        .I3(ap_CS_fsm_state17),
        .I4(ap_CS_fsm_state18),
        .I5(\orig_address1[6]_INST_0_i_1_n_6 ),
        .O(orig_address1[6]));
  LUT6 #(
    .INIT(64'hCFC8C8C888888888)) 
    \orig_address1[6]_INST_0_i_1 
       (.I0(ap_CS_fsm_state18),
        .I1(tmp2_cast_fu_667_p1[3]),
        .I2(ap_CS_fsm_state15),
        .I3(ap_CS_fsm_state10),
        .I4(data3[6]),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(\orig_address1[6]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF80008)) 
    \orig_address1[7]_INST_0 
       (.I0(empty_15_reg_1034[4]),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state18),
        .I3(ap_CS_fsm_state17),
        .I4(data1[7]),
        .I5(\orig_address1[7]_INST_0_i_1_n_6 ),
        .O(orig_address1[7]));
  LUT6 #(
    .INIT(64'h8C8C8C8080808C80)) 
    \orig_address1[7]_INST_0_i_1 
       (.I0(data1[7]),
        .I1(\orig_address0[7]_INST_0_i_2_n_6 ),
        .I2(ap_CS_fsm_state15),
        .I3(add_ln_fu_526_p4[7]),
        .I4(ap_CS_fsm_state10),
        .I5(shl_ln_fu_580_p4[7]),
        .O(\orig_address1[7]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFEAAAAAAAEA)) 
    \orig_address1[8]_INST_0 
       (.I0(\orig_address1[8]_INST_0_i_1_n_6 ),
        .I1(empty_16_reg_1039[5]),
        .I2(ap_CS_fsm_state16),
        .I3(ap_CS_fsm_state18),
        .I4(ap_CS_fsm_state17),
        .I5(data1[8]),
        .O(orig_address1[8]));
  LUT6 #(
    .INIT(64'hFF00B8B800000000)) 
    \orig_address1[8]_INST_0_i_1 
       (.I0(shl_ln_fu_580_p4[8]),
        .I1(ap_CS_fsm_state10),
        .I2(add_ln_fu_526_p4[8]),
        .I3(data1[8]),
        .I4(ap_CS_fsm_state15),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(\orig_address1[8]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFEAAAAAAAEA)) 
    \orig_address1[9]_INST_0 
       (.I0(\orig_address1[9]_INST_0_i_1_n_6 ),
        .I1(empty_16_reg_1039[6]),
        .I2(ap_CS_fsm_state16),
        .I3(ap_CS_fsm_state18),
        .I4(ap_CS_fsm_state17),
        .I5(data1[9]),
        .O(orig_address1[9]));
  LUT6 #(
    .INIT(64'hFF00B8B800000000)) 
    \orig_address1[9]_INST_0_i_1 
       (.I0(shl_ln_fu_580_p4[9]),
        .I1(ap_CS_fsm_state10),
        .I2(add_ln_fu_526_p4[9]),
        .I3(data1[9]),
        .I4(ap_CS_fsm_state15),
        .I5(\orig_address0[7]_INST_0_i_2_n_6 ),
        .O(\orig_address1[9]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    orig_ce0_INST_0
       (.I0(ap_CS_fsm_state10),
        .I1(\orig_address0[2]_INST_0_i_2_n_6 ),
        .I2(ap_CS_fsm_state18),
        .I3(ap_CS_fsm_state7),
        .I4(ap_CS_fsm_state4),
        .I5(ap_CS_fsm_state3),
        .O(orig_ce0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    orig_ce1_INST_0
       (.I0(ap_CS_fsm_state10),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state17),
        .I3(ap_CS_fsm_state18),
        .I4(ap_CS_fsm_state15),
        .I5(ap_CS_fsm_state7),
        .O(orig_ce1));
  FDRE \orig_load_8_reg_1083_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[0]),
        .Q(orig_load_8_reg_1083[0]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[10]),
        .Q(orig_load_8_reg_1083[10]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[11]),
        .Q(orig_load_8_reg_1083[11]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[12]),
        .Q(orig_load_8_reg_1083[12]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[13]),
        .Q(orig_load_8_reg_1083[13]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[14]),
        .Q(orig_load_8_reg_1083[14]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[15]),
        .Q(orig_load_8_reg_1083[15]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[16]),
        .Q(orig_load_8_reg_1083[16]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[17]),
        .Q(orig_load_8_reg_1083[17]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[18]),
        .Q(orig_load_8_reg_1083[18]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[19]),
        .Q(orig_load_8_reg_1083[19]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[1]),
        .Q(orig_load_8_reg_1083[1]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[20]),
        .Q(orig_load_8_reg_1083[20]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[21]),
        .Q(orig_load_8_reg_1083[21]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[22]),
        .Q(orig_load_8_reg_1083[22]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[23]),
        .Q(orig_load_8_reg_1083[23]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[24]),
        .Q(orig_load_8_reg_1083[24]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[25]),
        .Q(orig_load_8_reg_1083[25]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[26]),
        .Q(orig_load_8_reg_1083[26]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[27]),
        .Q(orig_load_8_reg_1083[27]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[28]),
        .Q(orig_load_8_reg_1083[28]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[29]),
        .Q(orig_load_8_reg_1083[29]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[2]),
        .Q(orig_load_8_reg_1083[2]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[30]),
        .Q(orig_load_8_reg_1083[30]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[31]),
        .Q(orig_load_8_reg_1083[31]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[3]),
        .Q(orig_load_8_reg_1083[3]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[4]),
        .Q(orig_load_8_reg_1083[4]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[5]),
        .Q(orig_load_8_reg_1083[5]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[6]),
        .Q(orig_load_8_reg_1083[6]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[7]),
        .Q(orig_load_8_reg_1083[7]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[8]),
        .Q(orig_load_8_reg_1083[8]),
        .R(1'b0));
  FDRE \orig_load_8_reg_1083_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state17),
        .D(orig_q1[9]),
        .Q(orig_load_8_reg_1083[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[0]_i_1 
       (.I0(orig_q1[0]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[0]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[10]_i_1 
       (.I0(orig_q1[10]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[10]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[11]_i_1 
       (.I0(orig_q1[11]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[11]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[12]_i_1 
       (.I0(orig_q1[12]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[12]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[13]_i_1 
       (.I0(orig_q1[13]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[13]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[14]_i_1 
       (.I0(orig_q1[14]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[14]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[15]_i_1 
       (.I0(orig_q1[15]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[15]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[16]_i_1 
       (.I0(orig_q1[16]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[16]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[17]_i_1 
       (.I0(orig_q1[17]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[17]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[18]_i_1 
       (.I0(orig_q1[18]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[18]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[19]_i_1 
       (.I0(orig_q1[19]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[19]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[1]_i_1 
       (.I0(orig_q1[1]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[1]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[20]_i_1 
       (.I0(orig_q1[20]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[20]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[21]_i_1 
       (.I0(orig_q1[21]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[21]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[22]_i_1 
       (.I0(orig_q1[22]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[22]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[23]_i_1 
       (.I0(orig_q1[23]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[23]),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[24]_i_1 
       (.I0(orig_q1[24]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[24]),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[25]_i_1 
       (.I0(orig_q1[25]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[25]),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[26]_i_1 
       (.I0(orig_q1[26]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[26]),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[27]_i_1 
       (.I0(orig_q1[27]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[27]),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[28]_i_1 
       (.I0(orig_q1[28]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[28]),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[29]_i_1 
       (.I0(orig_q1[29]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[29]),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[2]_i_1 
       (.I0(orig_q1[2]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[2]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[30]_i_1 
       (.I0(orig_q1[30]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[30]),
        .O(p_1_in[30]));
  LUT2 #(
    .INIT(4'hE)) 
    \reg_385[31]_i_1 
       (.I0(ap_CS_fsm_state17),
        .I1(ap_CS_fsm_state18),
        .O(\reg_385[31]_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[31]_i_2 
       (.I0(orig_q1[31]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[31]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[3]_i_1 
       (.I0(orig_q1[3]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[3]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[4]_i_1 
       (.I0(orig_q1[4]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[4]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[5]_i_1 
       (.I0(orig_q1[5]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[5]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[6]_i_1 
       (.I0(orig_q1[6]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[6]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[7]_i_1 
       (.I0(orig_q1[7]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[7]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[8]_i_1 
       (.I0(orig_q1[8]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[8]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_385[9]_i_1 
       (.I0(orig_q1[9]),
        .I1(ap_CS_fsm_state18),
        .I2(orig_q0[9]),
        .O(p_1_in[9]));
  FDRE \reg_385_reg[0] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[0]),
        .Q(reg_385[0]),
        .R(1'b0));
  FDRE \reg_385_reg[10] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[10]),
        .Q(reg_385[10]),
        .R(1'b0));
  FDRE \reg_385_reg[11] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[11]),
        .Q(reg_385[11]),
        .R(1'b0));
  FDRE \reg_385_reg[12] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[12]),
        .Q(reg_385[12]),
        .R(1'b0));
  FDRE \reg_385_reg[13] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[13]),
        .Q(reg_385[13]),
        .R(1'b0));
  FDRE \reg_385_reg[14] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[14]),
        .Q(reg_385[14]),
        .R(1'b0));
  FDRE \reg_385_reg[15] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[15]),
        .Q(reg_385[15]),
        .R(1'b0));
  FDRE \reg_385_reg[16] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[16]),
        .Q(reg_385[16]),
        .R(1'b0));
  FDRE \reg_385_reg[17] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[17]),
        .Q(reg_385[17]),
        .R(1'b0));
  FDRE \reg_385_reg[18] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[18]),
        .Q(reg_385[18]),
        .R(1'b0));
  FDRE \reg_385_reg[19] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[19]),
        .Q(reg_385[19]),
        .R(1'b0));
  FDRE \reg_385_reg[1] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[1]),
        .Q(reg_385[1]),
        .R(1'b0));
  FDRE \reg_385_reg[20] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[20]),
        .Q(reg_385[20]),
        .R(1'b0));
  FDRE \reg_385_reg[21] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[21]),
        .Q(reg_385[21]),
        .R(1'b0));
  FDRE \reg_385_reg[22] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[22]),
        .Q(reg_385[22]),
        .R(1'b0));
  FDRE \reg_385_reg[23] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[23]),
        .Q(reg_385[23]),
        .R(1'b0));
  FDRE \reg_385_reg[24] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[24]),
        .Q(reg_385[24]),
        .R(1'b0));
  FDRE \reg_385_reg[25] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[25]),
        .Q(reg_385[25]),
        .R(1'b0));
  FDRE \reg_385_reg[26] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[26]),
        .Q(reg_385[26]),
        .R(1'b0));
  FDRE \reg_385_reg[27] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[27]),
        .Q(reg_385[27]),
        .R(1'b0));
  FDRE \reg_385_reg[28] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[28]),
        .Q(reg_385[28]),
        .R(1'b0));
  FDRE \reg_385_reg[29] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[29]),
        .Q(reg_385[29]),
        .R(1'b0));
  FDRE \reg_385_reg[2] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[2]),
        .Q(reg_385[2]),
        .R(1'b0));
  FDRE \reg_385_reg[30] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[30]),
        .Q(reg_385[30]),
        .R(1'b0));
  FDRE \reg_385_reg[31] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[31]),
        .Q(reg_385[31]),
        .R(1'b0));
  FDRE \reg_385_reg[3] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[3]),
        .Q(reg_385[3]),
        .R(1'b0));
  FDRE \reg_385_reg[4] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[4]),
        .Q(reg_385[4]),
        .R(1'b0));
  FDRE \reg_385_reg[5] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[5]),
        .Q(reg_385[5]),
        .R(1'b0));
  FDRE \reg_385_reg[6] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[6]),
        .Q(reg_385[6]),
        .R(1'b0));
  FDRE \reg_385_reg[7] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[7]),
        .Q(reg_385[7]),
        .R(1'b0));
  FDRE \reg_385_reg[8] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[8]),
        .Q(reg_385[8]),
        .R(1'b0));
  FDRE \reg_385_reg[9] 
       (.C(ap_clk),
        .CE(\reg_385[31]_i_1_n_6 ),
        .D(p_1_in[9]),
        .Q(reg_385[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAACFC0)) 
    \sol_address0[0]_INST_0 
       (.I0(zext_ln28_reg_937_reg[0]),
        .I1(zext_ln20_reg_891_reg[0]),
        .I2(ap_CS_fsm_state5),
        .I3(add_ln20_reg_886[0]),
        .I4(ap_CS_fsm_state8),
        .I5(ap_CS_fsm_state11),
        .O(sol_address0[0]));
  LUT6 #(
    .INIT(64'hFFFFF0880000F088)) 
    \sol_address0[10]_INST_0 
       (.I0(ap_CS_fsm_state5),
        .I1(zext_ln20_reg_891_reg[7]),
        .I2(zext_ln28_reg_937_reg[10]),
        .I3(ap_CS_fsm_state8),
        .I4(ap_CS_fsm_state11),
        .I5(zext_ln36_reg_983_reg[7]),
        .O(sol_address0[10]));
  LUT6 #(
    .INIT(64'h00000000AAAACFC0)) 
    \sol_address0[1]_INST_0 
       (.I0(zext_ln28_reg_937_reg[1]),
        .I1(zext_ln20_reg_891_reg[1]),
        .I2(ap_CS_fsm_state5),
        .I3(add_ln20_reg_886[1]),
        .I4(ap_CS_fsm_state8),
        .I5(ap_CS_fsm_state11),
        .O(sol_address0[1]));
  LUT6 #(
    .INIT(64'h00000000AAAACFC0)) 
    \sol_address0[2]_INST_0 
       (.I0(zext_ln28_reg_937_reg[2]),
        .I1(zext_ln20_reg_891_reg[2]),
        .I2(ap_CS_fsm_state5),
        .I3(add_ln20_reg_886[2]),
        .I4(ap_CS_fsm_state8),
        .I5(ap_CS_fsm_state11),
        .O(sol_address0[2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'hFBEAEAEA)) 
    \sol_address0[3]_INST_0 
       (.I0(\sol_address0[3]_INST_0_i_1_n_6 ),
        .I1(ap_CS_fsm_state11),
        .I2(zext_ln36_reg_983_reg[0]),
        .I3(zext_ln28_reg_937_reg[6]),
        .I4(ap_CS_fsm_state8),
        .O(sol_address0[3]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h11100010)) 
    \sol_address0[3]_INST_0_i_1 
       (.I0(ap_CS_fsm_state11),
        .I1(ap_CS_fsm_state8),
        .I2(zext_ln19_reg_876_reg[3]),
        .I3(ap_CS_fsm_state5),
        .I4(zext_ln20_reg_891_reg[3]),
        .O(\sol_address0[3]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB800)) 
    \sol_address0[4]_INST_0 
       (.I0(zext_ln20_reg_891_reg[4]),
        .I1(ap_CS_fsm_state5),
        .I2(zext_ln19_reg_876_reg[4]),
        .I3(\sol_address0[6]_INST_0_i_1_n_6 ),
        .I4(\sol_address0[4]_INST_0_i_1_n_6 ),
        .I5(\sol_address0[6]_INST_0_i_2_n_6 ),
        .O(sol_address0[4]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sol_address0[4]_INST_0_i_1 
       (.I0(ap_CS_fsm_state11),
        .I1(zext_ln36_reg_983_reg[1]),
        .O(\sol_address0[4]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB800)) 
    \sol_address0[5]_INST_0 
       (.I0(zext_ln20_reg_891_reg[5]),
        .I1(ap_CS_fsm_state5),
        .I2(zext_ln19_reg_876_reg[5]),
        .I3(\sol_address0[6]_INST_0_i_1_n_6 ),
        .I4(\sol_address0[5]_INST_0_i_1_n_6 ),
        .I5(\sol_address0[6]_INST_0_i_2_n_6 ),
        .O(sol_address0[5]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sol_address0[5]_INST_0_i_1 
       (.I0(ap_CS_fsm_state11),
        .I1(zext_ln36_reg_983_reg[2]),
        .O(\sol_address0[5]_INST_0_i_1_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFB800)) 
    \sol_address0[6]_INST_0 
       (.I0(zext_ln20_reg_891_reg[6]),
        .I1(ap_CS_fsm_state5),
        .I2(zext_ln19_reg_876_reg[6]),
        .I3(\sol_address0[6]_INST_0_i_1_n_6 ),
        .I4(\sol_address0[6]_INST_0_i_2_n_6 ),
        .I5(\sol_address0[6]_INST_0_i_3_n_6 ),
        .O(sol_address0[6]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sol_address0[6]_INST_0_i_1 
       (.I0(ap_CS_fsm_state8),
        .I1(ap_CS_fsm_state11),
        .O(\sol_address0[6]_INST_0_i_1_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \sol_address0[6]_INST_0_i_2 
       (.I0(zext_ln28_reg_937_reg[6]),
        .I1(ap_CS_fsm_state8),
        .I2(ap_CS_fsm_state11),
        .O(\sol_address0[6]_INST_0_i_2_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sol_address0[6]_INST_0_i_3 
       (.I0(ap_CS_fsm_state11),
        .I1(zext_ln36_reg_983_reg[3]),
        .O(\sol_address0[6]_INST_0_i_3_n_6 ));
  LUT6 #(
    .INIT(64'hFFFFF0880000F088)) 
    \sol_address0[7]_INST_0 
       (.I0(ap_CS_fsm_state5),
        .I1(zext_ln20_reg_891_reg[7]),
        .I2(zext_ln28_reg_937_reg[7]),
        .I3(ap_CS_fsm_state8),
        .I4(ap_CS_fsm_state11),
        .I5(zext_ln36_reg_983_reg[4]),
        .O(sol_address0[7]));
  LUT6 #(
    .INIT(64'hFFFFF0880000F088)) 
    \sol_address0[8]_INST_0 
       (.I0(ap_CS_fsm_state5),
        .I1(zext_ln20_reg_891_reg[7]),
        .I2(zext_ln28_reg_937_reg[8]),
        .I3(ap_CS_fsm_state8),
        .I4(ap_CS_fsm_state11),
        .I5(zext_ln36_reg_983_reg[5]),
        .O(sol_address0[8]));
  LUT6 #(
    .INIT(64'hFFFFF0880000F088)) 
    \sol_address0[9]_INST_0 
       (.I0(ap_CS_fsm_state5),
        .I1(zext_ln20_reg_891_reg[7]),
        .I2(zext_ln28_reg_937_reg[9]),
        .I3(ap_CS_fsm_state8),
        .I4(ap_CS_fsm_state11),
        .I5(zext_ln36_reg_983_reg[6]),
        .O(sol_address0[9]));
  LUT4 #(
    .INIT(16'hBBB8)) 
    \sol_address1[0]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[0]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln28_reg_937_reg[0]),
        .O(sol_address1[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \sol_address1[10]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[10]),
        .I1(ap_CS_fsm_state20),
        .I2(zext_ln36_reg_983_reg[7]),
        .I3(ap_CS_fsm_state11),
        .I4(zext_ln27_reg_927[10]),
        .O(sol_address1[10]));
  LUT4 #(
    .INIT(16'hBBB8)) 
    \sol_address1[1]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[1]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln28_reg_937_reg[1]),
        .O(sol_address1[1]));
  LUT4 #(
    .INIT(16'hBBB8)) 
    \sol_address1[2]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[2]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln28_reg_937_reg[2]),
        .O(sol_address1[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \sol_address1[3]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[3]),
        .I1(ap_CS_fsm_state20),
        .I2(zext_ln36_reg_983_reg[0]),
        .I3(ap_CS_fsm_state11),
        .I4(zext_ln27_reg_927[3]),
        .O(sol_address1[3]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \sol_address1[4]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[4]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln36_reg_983_reg[1]),
        .O(sol_address1[4]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \sol_address1[5]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[5]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln36_reg_983_reg[2]),
        .O(sol_address1[5]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \sol_address1[6]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[6]),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state11),
        .I3(zext_ln36_reg_983_reg[3]),
        .O(sol_address1[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \sol_address1[7]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[7]),
        .I1(ap_CS_fsm_state20),
        .I2(zext_ln36_reg_983_reg[4]),
        .I3(ap_CS_fsm_state11),
        .I4(zext_ln27_reg_927[7]),
        .O(sol_address1[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \sol_address1[8]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[8]),
        .I1(ap_CS_fsm_state20),
        .I2(zext_ln36_reg_983_reg[5]),
        .I3(ap_CS_fsm_state11),
        .I4(zext_ln27_reg_927[8]),
        .O(sol_address1[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \sol_address1[9]_INST_0 
       (.I0(zext_ln48_reg_1058_reg[9]),
        .I1(ap_CS_fsm_state20),
        .I2(zext_ln36_reg_983_reg[6]),
        .I3(ap_CS_fsm_state11),
        .I4(zext_ln27_reg_927[9]),
        .O(sol_address1[9]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[0]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[0]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[0]),
        .O(sol_d1[0]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[10]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[10]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[10]),
        .O(sol_d1[10]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[11]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[11]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[11]),
        .O(sol_d1[11]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[12]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[12]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[12]),
        .O(sol_d1[12]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[13]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[13]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[13]),
        .O(sol_d1[13]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[14]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[14]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[14]),
        .O(sol_d1[14]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[15]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[15]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[15]),
        .O(sol_d1[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sol_d1[15]_INST_0_i_1 
       (.CI(\sol_d1[7]_INST_0_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\sol_d1[15]_INST_0_i_1_n_6 ,\sol_d1[15]_INST_0_i_1_n_7 ,\sol_d1[15]_INST_0_i_1_n_8 ,\sol_d1[15]_INST_0_i_1_n_9 ,\sol_d1[15]_INST_0_i_1_n_10 ,\sol_d1[15]_INST_0_i_1_n_11 ,\sol_d1[15]_INST_0_i_1_n_12 ,\sol_d1[15]_INST_0_i_1_n_13 }),
        .DI(mul_ln57_1_reg_1118[15:8]),
        .O(add_ln57_5_fu_831_p2[15:8]),
        .S({\sol_d1[15]_INST_0_i_2_n_6 ,\sol_d1[15]_INST_0_i_3_n_6 ,\sol_d1[15]_INST_0_i_4_n_6 ,\sol_d1[15]_INST_0_i_5_n_6 ,\sol_d1[15]_INST_0_i_6_n_6 ,\sol_d1[15]_INST_0_i_7_n_6 ,\sol_d1[15]_INST_0_i_8_n_6 ,\sol_d1[15]_INST_0_i_9_n_6 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_2 
       (.I0(mul_ln57_1_reg_1118[15]),
        .I1(mul_ln57_reg_1078[15]),
        .O(\sol_d1[15]_INST_0_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_3 
       (.I0(mul_ln57_1_reg_1118[14]),
        .I1(mul_ln57_reg_1078[14]),
        .O(\sol_d1[15]_INST_0_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_4 
       (.I0(mul_ln57_1_reg_1118[13]),
        .I1(mul_ln57_reg_1078[13]),
        .O(\sol_d1[15]_INST_0_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_5 
       (.I0(mul_ln57_1_reg_1118[12]),
        .I1(mul_ln57_reg_1078[12]),
        .O(\sol_d1[15]_INST_0_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_6 
       (.I0(mul_ln57_1_reg_1118[11]),
        .I1(mul_ln57_reg_1078[11]),
        .O(\sol_d1[15]_INST_0_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_7 
       (.I0(mul_ln57_1_reg_1118[10]),
        .I1(mul_ln57_reg_1078[10]),
        .O(\sol_d1[15]_INST_0_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_8 
       (.I0(mul_ln57_1_reg_1118[9]),
        .I1(mul_ln57_reg_1078[9]),
        .O(\sol_d1[15]_INST_0_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[15]_INST_0_i_9 
       (.I0(mul_ln57_1_reg_1118[8]),
        .I1(mul_ln57_reg_1078[8]),
        .O(\sol_d1[15]_INST_0_i_9_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[16]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[16]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[16]),
        .O(sol_d1[16]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[17]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[17]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[17]),
        .O(sol_d1[17]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[18]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[18]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[18]),
        .O(sol_d1[18]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[19]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[19]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[19]),
        .O(sol_d1[19]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[1]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[1]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[1]),
        .O(sol_d1[1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[20]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[20]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[20]),
        .O(sol_d1[20]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[21]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[21]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[21]),
        .O(sol_d1[21]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[22]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[22]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[22]),
        .O(sol_d1[22]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[23]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[23]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[23]),
        .O(sol_d1[23]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sol_d1[23]_INST_0_i_1 
       (.CI(\sol_d1[15]_INST_0_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\sol_d1[23]_INST_0_i_1_n_6 ,\sol_d1[23]_INST_0_i_1_n_7 ,\sol_d1[23]_INST_0_i_1_n_8 ,\sol_d1[23]_INST_0_i_1_n_9 ,\sol_d1[23]_INST_0_i_1_n_10 ,\sol_d1[23]_INST_0_i_1_n_11 ,\sol_d1[23]_INST_0_i_1_n_12 ,\sol_d1[23]_INST_0_i_1_n_13 }),
        .DI(mul_ln57_1_reg_1118[23:16]),
        .O(add_ln57_5_fu_831_p2[23:16]),
        .S({\sol_d1[23]_INST_0_i_2_n_6 ,\sol_d1[23]_INST_0_i_3_n_6 ,\sol_d1[23]_INST_0_i_4_n_6 ,\sol_d1[23]_INST_0_i_5_n_6 ,\sol_d1[23]_INST_0_i_6_n_6 ,\sol_d1[23]_INST_0_i_7_n_6 ,\sol_d1[23]_INST_0_i_8_n_6 ,\sol_d1[23]_INST_0_i_9_n_6 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_2 
       (.I0(mul_ln57_1_reg_1118[23]),
        .I1(mul_ln57_reg_1078[23]),
        .O(\sol_d1[23]_INST_0_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_3 
       (.I0(mul_ln57_1_reg_1118[22]),
        .I1(mul_ln57_reg_1078[22]),
        .O(\sol_d1[23]_INST_0_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_4 
       (.I0(mul_ln57_1_reg_1118[21]),
        .I1(mul_ln57_reg_1078[21]),
        .O(\sol_d1[23]_INST_0_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_5 
       (.I0(mul_ln57_1_reg_1118[20]),
        .I1(mul_ln57_reg_1078[20]),
        .O(\sol_d1[23]_INST_0_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_6 
       (.I0(mul_ln57_1_reg_1118[19]),
        .I1(mul_ln57_reg_1078[19]),
        .O(\sol_d1[23]_INST_0_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_7 
       (.I0(mul_ln57_1_reg_1118[18]),
        .I1(mul_ln57_reg_1078[18]),
        .O(\sol_d1[23]_INST_0_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_8 
       (.I0(mul_ln57_1_reg_1118[17]),
        .I1(mul_ln57_reg_1078[17]),
        .O(\sol_d1[23]_INST_0_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[23]_INST_0_i_9 
       (.I0(mul_ln57_1_reg_1118[16]),
        .I1(mul_ln57_reg_1078[16]),
        .O(\sol_d1[23]_INST_0_i_9_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[24]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[24]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[24]),
        .O(sol_d1[24]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[25]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[25]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[25]),
        .O(sol_d1[25]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[26]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[26]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[26]),
        .O(sol_d1[26]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[27]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[27]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[27]),
        .O(sol_d1[27]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[28]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[28]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[28]),
        .O(sol_d1[28]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[29]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[29]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[29]),
        .O(sol_d1[29]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[2]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[2]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[2]),
        .O(sol_d1[2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[30]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[30]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[30]),
        .O(sol_d1[30]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[31]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[31]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[31]),
        .O(sol_d1[31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sol_d1[31]_INST_0_i_1 
       (.CI(\sol_d1[23]_INST_0_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sol_d1[31]_INST_0_i_1_CO_UNCONNECTED [7],\sol_d1[31]_INST_0_i_1_n_7 ,\sol_d1[31]_INST_0_i_1_n_8 ,\sol_d1[31]_INST_0_i_1_n_9 ,\sol_d1[31]_INST_0_i_1_n_10 ,\sol_d1[31]_INST_0_i_1_n_11 ,\sol_d1[31]_INST_0_i_1_n_12 ,\sol_d1[31]_INST_0_i_1_n_13 }),
        .DI({1'b0,mul_ln57_1_reg_1118[30:24]}),
        .O(add_ln57_5_fu_831_p2[31:24]),
        .S({\sol_d1[31]_INST_0_i_2_n_6 ,\sol_d1[31]_INST_0_i_3_n_6 ,\sol_d1[31]_INST_0_i_4_n_6 ,\sol_d1[31]_INST_0_i_5_n_6 ,\sol_d1[31]_INST_0_i_6_n_6 ,\sol_d1[31]_INST_0_i_7_n_6 ,\sol_d1[31]_INST_0_i_8_n_6 ,\sol_d1[31]_INST_0_i_9_n_6 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_2 
       (.I0(mul_ln57_reg_1078[31]),
        .I1(mul_ln57_1_reg_1118[31]),
        .O(\sol_d1[31]_INST_0_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_3 
       (.I0(mul_ln57_1_reg_1118[30]),
        .I1(mul_ln57_reg_1078[30]),
        .O(\sol_d1[31]_INST_0_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_4 
       (.I0(mul_ln57_1_reg_1118[29]),
        .I1(mul_ln57_reg_1078[29]),
        .O(\sol_d1[31]_INST_0_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_5 
       (.I0(mul_ln57_1_reg_1118[28]),
        .I1(mul_ln57_reg_1078[28]),
        .O(\sol_d1[31]_INST_0_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_6 
       (.I0(mul_ln57_1_reg_1118[27]),
        .I1(mul_ln57_reg_1078[27]),
        .O(\sol_d1[31]_INST_0_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_7 
       (.I0(mul_ln57_1_reg_1118[26]),
        .I1(mul_ln57_reg_1078[26]),
        .O(\sol_d1[31]_INST_0_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_8 
       (.I0(mul_ln57_1_reg_1118[25]),
        .I1(mul_ln57_reg_1078[25]),
        .O(\sol_d1[31]_INST_0_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[31]_INST_0_i_9 
       (.I0(mul_ln57_1_reg_1118[24]),
        .I1(mul_ln57_reg_1078[24]),
        .O(\sol_d1[31]_INST_0_i_9_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[3]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[3]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[3]),
        .O(sol_d1[3]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[4]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[4]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[4]),
        .O(sol_d1[4]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[5]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[5]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[5]),
        .O(sol_d1[5]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[6]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[6]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[6]),
        .O(sol_d1[6]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[7]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[7]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[7]),
        .O(sol_d1[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sol_d1[7]_INST_0_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\sol_d1[7]_INST_0_i_1_n_6 ,\sol_d1[7]_INST_0_i_1_n_7 ,\sol_d1[7]_INST_0_i_1_n_8 ,\sol_d1[7]_INST_0_i_1_n_9 ,\sol_d1[7]_INST_0_i_1_n_10 ,\sol_d1[7]_INST_0_i_1_n_11 ,\sol_d1[7]_INST_0_i_1_n_12 ,\sol_d1[7]_INST_0_i_1_n_13 }),
        .DI(mul_ln57_1_reg_1118[7:0]),
        .O(add_ln57_5_fu_831_p2[7:0]),
        .S({\sol_d1[7]_INST_0_i_2_n_6 ,\sol_d1[7]_INST_0_i_3_n_6 ,\sol_d1[7]_INST_0_i_4_n_6 ,\sol_d1[7]_INST_0_i_5_n_6 ,\sol_d1[7]_INST_0_i_6_n_6 ,\sol_d1[7]_INST_0_i_7_n_6 ,\sol_d1[7]_INST_0_i_8_n_6 ,\sol_d1[7]_INST_0_i_9_n_6 }));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_2 
       (.I0(mul_ln57_1_reg_1118[7]),
        .I1(mul_ln57_reg_1078[7]),
        .O(\sol_d1[7]_INST_0_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_3 
       (.I0(mul_ln57_1_reg_1118[6]),
        .I1(mul_ln57_reg_1078[6]),
        .O(\sol_d1[7]_INST_0_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_4 
       (.I0(mul_ln57_1_reg_1118[5]),
        .I1(mul_ln57_reg_1078[5]),
        .O(\sol_d1[7]_INST_0_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_5 
       (.I0(mul_ln57_1_reg_1118[4]),
        .I1(mul_ln57_reg_1078[4]),
        .O(\sol_d1[7]_INST_0_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_6 
       (.I0(mul_ln57_1_reg_1118[3]),
        .I1(mul_ln57_reg_1078[3]),
        .O(\sol_d1[7]_INST_0_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_7 
       (.I0(mul_ln57_1_reg_1118[2]),
        .I1(mul_ln57_reg_1078[2]),
        .O(\sol_d1[7]_INST_0_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_8 
       (.I0(mul_ln57_1_reg_1118[1]),
        .I1(mul_ln57_reg_1078[1]),
        .O(\sol_d1[7]_INST_0_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sol_d1[7]_INST_0_i_9 
       (.I0(mul_ln57_1_reg_1118[0]),
        .I1(mul_ln57_reg_1078[0]),
        .O(\sol_d1[7]_INST_0_i_9_n_6 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[8]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[8]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[8]),
        .O(sol_d1[8]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sol_d1[9]_INST_0 
       (.I0(add_ln57_5_fu_831_p2[9]),
        .I1(ap_CS_fsm_state20),
        .I2(orig_q1[9]),
        .O(sol_d1[9]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    sol_we0_INST_0
       (.I0(ap_CS_fsm_state11),
        .I1(ap_CS_fsm_state8),
        .I2(ap_CS_fsm_state5),
        .I3(ap_CS_fsm_state4),
        .O(sol_ce0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    sol_we1_INST_0
       (.I0(ap_CS_fsm_state20),
        .I1(ap_CS_fsm_state11),
        .I2(ap_CS_fsm_state8),
        .O(sol_ce1));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \tmp3_reg_1050[1]_i_1 
       (.I0(tmp2_cast_fu_667_p1[0]),
        .I1(tmp2_cast_fu_667_p1[1]),
        .O(tmp3_fu_682_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \tmp3_reg_1050[2]_i_1 
       (.I0(tmp2_cast_fu_667_p1[2]),
        .I1(tmp2_cast_fu_667_p1[0]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .O(tmp3_fu_682_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \tmp3_reg_1050[3]_i_1 
       (.I0(tmp2_cast_fu_667_p1[3]),
        .I1(tmp2_cast_fu_667_p1[2]),
        .I2(tmp2_cast_fu_667_p1[1]),
        .I3(tmp2_cast_fu_667_p1[0]),
        .O(tmp3_fu_682_p2[3]));
  FDRE \tmp3_reg_1050_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp3_fu_682_p2[1]),
        .Q(tmp3_reg_1050[1]),
        .R(1'b0));
  FDRE \tmp3_reg_1050_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp3_fu_682_p2[2]),
        .Q(tmp3_reg_1050[2]),
        .R(1'b0));
  FDRE \tmp3_reg_1050_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state14),
        .D(tmp3_fu_682_p2[3]),
        .Q(tmp3_reg_1050[3]),
        .R(1'b0));
  FDRE \tmp_1_reg_851_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(\j_fu_100_reg_n_6_[0] ),
        .Q(tmp_1_reg_851[3]),
        .R(1'b0));
  FDRE \tmp_1_reg_851_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(\j_fu_100_reg_n_6_[1] ),
        .Q(tmp_1_reg_851[4]),
        .R(1'b0));
  FDRE \tmp_1_reg_851_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(\j_fu_100_reg_n_6_[2] ),
        .Q(tmp_1_reg_851[5]),
        .R(1'b0));
  FDRE \tmp_1_reg_851_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(\j_fu_100_reg_n_6_[3] ),
        .Q(tmp_1_reg_851[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \zext_ln19_reg_876[3]_i_1 
       (.I0(or_ln_fu_457_p3[3]),
        .I1(tmp_1_reg_851[3]),
        .O(data6[3]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \zext_ln19_reg_876[4]_i_1 
       (.I0(or_ln_fu_457_p3[3]),
        .I1(tmp_1_reg_851[3]),
        .I2(tmp_1_reg_851[4]),
        .O(data6[4]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \zext_ln19_reg_876[5]_i_1 
       (.I0(tmp_1_reg_851[4]),
        .I1(tmp_1_reg_851[3]),
        .I2(or_ln_fu_457_p3[3]),
        .I3(tmp_1_reg_851[5]),
        .O(data6[5]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \zext_ln19_reg_876[6]_i_1 
       (.I0(tmp_1_reg_851[6]),
        .I1(tmp_1_reg_851[5]),
        .I2(tmp_1_reg_851[4]),
        .I3(tmp_1_reg_851[3]),
        .I4(or_ln_fu_457_p3[3]),
        .O(data6[6]));
  FDRE \zext_ln19_reg_876_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(data6[3]),
        .Q(zext_ln19_reg_876_reg[3]),
        .R(1'b0));
  FDRE \zext_ln19_reg_876_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(data6[4]),
        .Q(zext_ln19_reg_876_reg[4]),
        .R(1'b0));
  FDRE \zext_ln19_reg_876_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(data6[5]),
        .Q(zext_ln19_reg_876_reg[5]),
        .R(1'b0));
  FDRE \zext_ln19_reg_876_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(data6[6]),
        .Q(zext_ln19_reg_876_reg[6]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[0]),
        .Q(zext_ln20_reg_891_reg[0]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[1]),
        .Q(zext_ln20_reg_891_reg[1]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[2]),
        .Q(zext_ln20_reg_891_reg[2]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[3]),
        .Q(zext_ln20_reg_891_reg[3]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[4]),
        .Q(zext_ln20_reg_891_reg[4]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[5]),
        .Q(zext_ln20_reg_891_reg[5]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[6]),
        .Q(zext_ln20_reg_891_reg[6]),
        .R(1'b0));
  FDRE \zext_ln20_reg_891_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state4),
        .D(add_ln20_reg_886[7]),
        .Q(zext_ln20_reg_891_reg[7]),
        .R(1'b0));
  FDRE \zext_ln27_reg_927_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[10]),
        .Q(zext_ln27_reg_927[10]),
        .R(1'b0));
  FDRE \zext_ln27_reg_927_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[3]),
        .Q(zext_ln27_reg_927[3]),
        .R(1'b0));
  FDRE \zext_ln27_reg_927_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[7]),
        .Q(zext_ln27_reg_927[7]),
        .R(1'b0));
  FDRE \zext_ln27_reg_927_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[8]),
        .Q(zext_ln27_reg_927[8]),
        .R(1'b0));
  FDRE \zext_ln27_reg_927_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[9]),
        .Q(zext_ln27_reg_927[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \zext_ln28_reg_937[10]_i_1 
       (.I0(empty_14_reg_907[10]),
        .I1(empty_14_reg_907[9]),
        .I2(empty_14_reg_907[8]),
        .I3(empty_14_reg_907[7]),
        .I4(add_ln_fu_526_p4[3]),
        .O(data4[10]));
  LUT1 #(
    .INIT(2'h1)) 
    \zext_ln28_reg_937[6]_i_1 
       (.I0(add_ln_fu_526_p4[3]),
        .O(data4[6]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \zext_ln28_reg_937[7]_i_1 
       (.I0(add_ln_fu_526_p4[3]),
        .I1(empty_14_reg_907[7]),
        .O(data4[7]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \zext_ln28_reg_937[8]_i_1 
       (.I0(add_ln_fu_526_p4[3]),
        .I1(empty_14_reg_907[7]),
        .I2(empty_14_reg_907[8]),
        .O(data4[8]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \zext_ln28_reg_937[9]_i_1 
       (.I0(empty_14_reg_907[8]),
        .I1(empty_14_reg_907[7]),
        .I2(add_ln_fu_526_p4[3]),
        .I3(empty_14_reg_907[9]),
        .O(data4[9]));
  FDRE \zext_ln28_reg_937_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[0]),
        .Q(zext_ln28_reg_937_reg[0]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(data4[10]),
        .Q(zext_ln28_reg_937_reg[10]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[1]),
        .Q(zext_ln28_reg_937_reg[1]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(add_ln_fu_526_p4[2]),
        .Q(zext_ln28_reg_937_reg[2]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(data4[6]),
        .Q(zext_ln28_reg_937_reg[6]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(data4[7]),
        .Q(zext_ln28_reg_937_reg[7]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(data4[8]),
        .Q(zext_ln28_reg_937_reg[8]),
        .R(1'b0));
  FDRE \zext_ln28_reg_937_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state7),
        .D(data4[9]),
        .Q(zext_ln28_reg_937_reg[9]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(shl_ln_fu_580_p4[10]),
        .Q(zext_ln36_reg_983_reg[7]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(data3[3]),
        .Q(zext_ln36_reg_983_reg[0]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(data3[4]),
        .Q(zext_ln36_reg_983_reg[1]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(data3[5]),
        .Q(zext_ln36_reg_983_reg[2]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(data3[6]),
        .Q(zext_ln36_reg_983_reg[3]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(shl_ln_fu_580_p4[7]),
        .Q(zext_ln36_reg_983_reg[4]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(shl_ln_fu_580_p4[8]),
        .Q(zext_ln36_reg_983_reg[5]),
        .R(1'b0));
  FDRE \zext_ln35_reg_973_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state10),
        .D(shl_ln_fu_580_p4[9]),
        .Q(zext_ln36_reg_983_reg[6]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[0]),
        .Q(zext_ln48_reg_1058_reg[0]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[10]),
        .Q(zext_ln48_reg_1058_reg[10]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[1]),
        .Q(zext_ln48_reg_1058_reg[1]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[2]),
        .Q(zext_ln48_reg_1058_reg[2]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(tmp2_cast_fu_667_p1[0]),
        .Q(zext_ln48_reg_1058_reg[3]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(tmp2_cast_fu_667_p1[1]),
        .Q(zext_ln48_reg_1058_reg[4]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(tmp2_cast_fu_667_p1[2]),
        .Q(zext_ln48_reg_1058_reg[5]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(tmp2_cast_fu_667_p1[3]),
        .Q(zext_ln48_reg_1058_reg[6]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[7]),
        .Q(zext_ln48_reg_1058_reg[7]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[8]),
        .Q(zext_ln48_reg_1058_reg[8]),
        .R(1'b0));
  FDRE \zext_ln48_reg_1058_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state15),
        .D(data1[9]),
        .Q(zext_ln48_reg_1058_reg[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "stencil3d_mul_32s_32s_32_1_1" *) 
module bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1
   (D,
    orig_q0,
    Q,
    tmp_product__1_i_32_0,
    orig_q1,
    tmp_product__1_i_16_0,
    DSP_A_B_DATA_INST,
    DSP_A_B_DATA_INST_0,
    DSP_A_B_DATA_INST_1);
  output [31:0]D;
  input [31:0]orig_q0;
  input [31:0]Q;
  input [31:0]tmp_product__1_i_32_0;
  input [31:0]orig_q1;
  input [31:0]tmp_product__1_i_16_0;
  input [31:0]DSP_A_B_DATA_INST;
  input [0:0]DSP_A_B_DATA_INST_0;
  input [31:0]DSP_A_B_DATA_INST_1;

  wire [31:0]D;
  wire [31:0]DSP_A_B_DATA_INST;
  wire [0:0]DSP_A_B_DATA_INST_0;
  wire [31:0]DSP_A_B_DATA_INST_1;
  wire [31:0]Q;
  wire [31:0]add_ln57_4_fu_824_p2;
  wire [31:0]grp_fu_380_p0;
  wire [31:0]grp_fu_380_p1;
  wire \mul_ln57_reg_1078[23]_i_2_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_3_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_4_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_5_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_6_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_7_n_6 ;
  wire \mul_ln57_reg_1078[23]_i_8_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_2_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_3_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_4_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_5_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_6_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_7_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_8_n_6 ;
  wire \mul_ln57_reg_1078[31]_i_9_n_6 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_10 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_11 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_12 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_13 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_6 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_7 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_8 ;
  wire \mul_ln57_reg_1078_reg[23]_i_1_n_9 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_10 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_11 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_12 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_13 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_7 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_8 ;
  wire \mul_ln57_reg_1078_reg[31]_i_1_n_9 ;
  wire [31:0]orig_q0;
  wire [31:0]orig_q1;
  wire tmp_product__0_n_112;
  wire tmp_product__0_n_113;
  wire tmp_product__0_n_114;
  wire tmp_product__0_n_115;
  wire tmp_product__0_n_116;
  wire tmp_product__0_n_117;
  wire tmp_product__0_n_118;
  wire tmp_product__0_n_119;
  wire tmp_product__0_n_120;
  wire tmp_product__0_n_121;
  wire tmp_product__0_n_122;
  wire tmp_product__0_n_123;
  wire tmp_product__0_n_124;
  wire tmp_product__0_n_125;
  wire tmp_product__0_n_126;
  wire tmp_product__0_n_127;
  wire tmp_product__0_n_128;
  wire tmp_product__0_n_129;
  wire tmp_product__0_n_130;
  wire tmp_product__0_n_131;
  wire tmp_product__0_n_132;
  wire tmp_product__0_n_133;
  wire tmp_product__0_n_134;
  wire tmp_product__0_n_135;
  wire tmp_product__0_n_136;
  wire tmp_product__0_n_137;
  wire tmp_product__0_n_138;
  wire tmp_product__0_n_139;
  wire tmp_product__0_n_140;
  wire tmp_product__0_n_141;
  wire tmp_product__0_n_142;
  wire tmp_product__0_n_143;
  wire tmp_product__0_n_144;
  wire tmp_product__0_n_145;
  wire tmp_product__0_n_146;
  wire tmp_product__0_n_147;
  wire tmp_product__0_n_148;
  wire tmp_product__0_n_149;
  wire tmp_product__0_n_150;
  wire tmp_product__0_n_151;
  wire tmp_product__0_n_152;
  wire tmp_product__0_n_153;
  wire tmp_product__0_n_154;
  wire tmp_product__0_n_155;
  wire tmp_product__0_n_156;
  wire tmp_product__0_n_157;
  wire tmp_product__0_n_158;
  wire tmp_product__0_n_159;
  wire tmp_product__0_n_30;
  wire tmp_product__0_n_31;
  wire tmp_product__0_n_32;
  wire tmp_product__0_n_33;
  wire tmp_product__0_n_34;
  wire tmp_product__0_n_35;
  wire tmp_product__0_n_36;
  wire tmp_product__0_n_37;
  wire tmp_product__0_n_38;
  wire tmp_product__0_n_39;
  wire tmp_product__0_n_40;
  wire tmp_product__0_n_41;
  wire tmp_product__0_n_42;
  wire tmp_product__0_n_43;
  wire tmp_product__0_n_44;
  wire tmp_product__0_n_45;
  wire tmp_product__0_n_46;
  wire tmp_product__0_n_47;
  wire tmp_product__0_n_48;
  wire tmp_product__0_n_49;
  wire tmp_product__0_n_50;
  wire tmp_product__0_n_51;
  wire tmp_product__0_n_52;
  wire tmp_product__0_n_53;
  wire tmp_product__0_n_54;
  wire tmp_product__0_n_55;
  wire tmp_product__0_n_56;
  wire tmp_product__0_n_57;
  wire tmp_product__0_n_58;
  wire tmp_product__0_n_59;
  wire tmp_product__0_n_64;
  wire tmp_product__0_n_65;
  wire tmp_product__0_n_66;
  wire tmp_product__0_n_67;
  wire tmp_product__0_n_68;
  wire tmp_product__0_n_69;
  wire tmp_product__0_n_70;
  wire tmp_product__0_n_71;
  wire tmp_product__0_n_72;
  wire tmp_product__0_n_73;
  wire tmp_product__0_n_74;
  wire tmp_product__0_n_75;
  wire tmp_product__0_n_76;
  wire tmp_product__0_n_77;
  wire tmp_product__0_n_78;
  wire tmp_product__0_n_79;
  wire tmp_product__0_n_80;
  wire tmp_product__0_n_81;
  wire tmp_product__0_n_82;
  wire tmp_product__0_n_83;
  wire tmp_product__0_n_84;
  wire tmp_product__0_n_85;
  wire tmp_product__0_n_86;
  wire tmp_product__0_n_87;
  wire tmp_product__0_n_88;
  wire tmp_product__0_n_89;
  wire tmp_product__0_n_90;
  wire tmp_product__0_n_91;
  wire tmp_product__0_n_92;
  wire tmp_product__0_n_93;
  wire tmp_product__0_n_94;
  wire tmp_product__0_n_95;
  wire [31:0]tmp_product__1_i_16_0;
  wire tmp_product__1_i_16_n_10;
  wire tmp_product__1_i_16_n_11;
  wire tmp_product__1_i_16_n_12;
  wire tmp_product__1_i_16_n_13;
  wire tmp_product__1_i_16_n_7;
  wire tmp_product__1_i_16_n_8;
  wire tmp_product__1_i_16_n_9;
  wire tmp_product__1_i_17_n_6;
  wire tmp_product__1_i_18_n_6;
  wire tmp_product__1_i_19_n_6;
  wire tmp_product__1_i_20_n_6;
  wire tmp_product__1_i_21_n_6;
  wire tmp_product__1_i_22_n_6;
  wire tmp_product__1_i_23_n_6;
  wire tmp_product__1_i_24_n_6;
  wire tmp_product__1_i_25_n_6;
  wire tmp_product__1_i_26_n_6;
  wire tmp_product__1_i_27_n_6;
  wire tmp_product__1_i_28_n_6;
  wire tmp_product__1_i_29_n_6;
  wire tmp_product__1_i_30_n_6;
  wire tmp_product__1_i_31_n_6;
  wire [31:0]tmp_product__1_i_32_0;
  wire tmp_product__1_i_32_n_10;
  wire tmp_product__1_i_32_n_11;
  wire tmp_product__1_i_32_n_12;
  wire tmp_product__1_i_32_n_13;
  wire tmp_product__1_i_32_n_14;
  wire tmp_product__1_i_32_n_15;
  wire tmp_product__1_i_32_n_16;
  wire tmp_product__1_i_32_n_17;
  wire tmp_product__1_i_32_n_18;
  wire tmp_product__1_i_32_n_19;
  wire tmp_product__1_i_32_n_20;
  wire tmp_product__1_i_32_n_21;
  wire tmp_product__1_i_32_n_7;
  wire tmp_product__1_i_32_n_8;
  wire tmp_product__1_i_32_n_9;
  wire tmp_product__1_i_33_n_6;
  wire tmp_product__1_i_34_n_6;
  wire tmp_product__1_i_35_n_6;
  wire tmp_product__1_i_36_n_6;
  wire tmp_product__1_i_37_n_6;
  wire tmp_product__1_i_38_n_6;
  wire tmp_product__1_i_39_n_6;
  wire tmp_product__1_i_40_n_6;
  wire tmp_product__1_i_41_n_6;
  wire tmp_product__1_i_42_n_6;
  wire tmp_product__1_i_43_n_6;
  wire tmp_product__1_i_44_n_6;
  wire tmp_product__1_i_45_n_6;
  wire tmp_product__1_i_46_n_6;
  wire tmp_product__1_i_47_n_6;
  wire tmp_product__1_n_100;
  wire tmp_product__1_n_101;
  wire tmp_product__1_n_102;
  wire tmp_product__1_n_103;
  wire tmp_product__1_n_104;
  wire tmp_product__1_n_105;
  wire tmp_product__1_n_106;
  wire tmp_product__1_n_107;
  wire tmp_product__1_n_108;
  wire tmp_product__1_n_109;
  wire tmp_product__1_n_110;
  wire tmp_product__1_n_111;
  wire tmp_product__1_n_64;
  wire tmp_product__1_n_65;
  wire tmp_product__1_n_66;
  wire tmp_product__1_n_67;
  wire tmp_product__1_n_68;
  wire tmp_product__1_n_69;
  wire tmp_product__1_n_70;
  wire tmp_product__1_n_71;
  wire tmp_product__1_n_72;
  wire tmp_product__1_n_73;
  wire tmp_product__1_n_74;
  wire tmp_product__1_n_75;
  wire tmp_product__1_n_76;
  wire tmp_product__1_n_77;
  wire tmp_product__1_n_78;
  wire tmp_product__1_n_79;
  wire tmp_product__1_n_80;
  wire tmp_product__1_n_81;
  wire tmp_product__1_n_82;
  wire tmp_product__1_n_83;
  wire tmp_product__1_n_84;
  wire tmp_product__1_n_85;
  wire tmp_product__1_n_86;
  wire tmp_product__1_n_87;
  wire tmp_product__1_n_88;
  wire tmp_product__1_n_89;
  wire tmp_product__1_n_90;
  wire tmp_product__1_n_91;
  wire tmp_product__1_n_92;
  wire tmp_product__1_n_93;
  wire tmp_product__1_n_94;
  wire tmp_product__1_n_95;
  wire tmp_product__1_n_96;
  wire tmp_product__1_n_97;
  wire tmp_product__1_n_98;
  wire tmp_product__1_n_99;
  wire tmp_product_i_100_n_6;
  wire tmp_product_i_101_n_6;
  wire tmp_product_i_102_n_6;
  wire tmp_product_i_103_n_6;
  wire tmp_product_i_104_n_6;
  wire tmp_product_i_105_n_6;
  wire tmp_product_i_106_n_6;
  wire tmp_product_i_107_n_6;
  wire tmp_product_i_108_n_6;
  wire tmp_product_i_109_n_6;
  wire tmp_product_i_110_n_6;
  wire tmp_product_i_111_n_6;
  wire tmp_product_i_112_n_6;
  wire tmp_product_i_113_n_6;
  wire tmp_product_i_114_n_6;
  wire tmp_product_i_115_n_6;
  wire tmp_product_i_116_n_6;
  wire tmp_product_i_117_n_6;
  wire tmp_product_i_118_n_6;
  wire tmp_product_i_119_n_6;
  wire tmp_product_i_120_n_6;
  wire tmp_product_i_121_n_6;
  wire tmp_product_i_122_n_6;
  wire tmp_product_i_123_n_6;
  wire tmp_product_i_124_n_6;
  wire tmp_product_i_125_n_6;
  wire tmp_product_i_126_n_6;
  wire tmp_product_i_127_n_6;
  wire tmp_product_i_128_n_6;
  wire tmp_product_i_129_n_6;
  wire tmp_product_i_130_n_6;
  wire tmp_product_i_131_n_6;
  wire tmp_product_i_132_n_6;
  wire tmp_product_i_33_n_10;
  wire tmp_product_i_33_n_11;
  wire tmp_product_i_33_n_12;
  wire tmp_product_i_33_n_13;
  wire tmp_product_i_33_n_6;
  wire tmp_product_i_33_n_7;
  wire tmp_product_i_33_n_8;
  wire tmp_product_i_33_n_9;
  wire tmp_product_i_34_n_10;
  wire tmp_product_i_34_n_11;
  wire tmp_product_i_34_n_12;
  wire tmp_product_i_34_n_13;
  wire tmp_product_i_34_n_6;
  wire tmp_product_i_34_n_7;
  wire tmp_product_i_34_n_8;
  wire tmp_product_i_34_n_9;
  wire tmp_product_i_35_n_10;
  wire tmp_product_i_35_n_11;
  wire tmp_product_i_35_n_12;
  wire tmp_product_i_35_n_13;
  wire tmp_product_i_35_n_6;
  wire tmp_product_i_35_n_7;
  wire tmp_product_i_35_n_8;
  wire tmp_product_i_35_n_9;
  wire tmp_product_i_36_n_6;
  wire tmp_product_i_37_n_6;
  wire tmp_product_i_38_n_6;
  wire tmp_product_i_39_n_6;
  wire tmp_product_i_40_n_6;
  wire tmp_product_i_41_n_6;
  wire tmp_product_i_42_n_6;
  wire tmp_product_i_43_n_6;
  wire tmp_product_i_44_n_6;
  wire tmp_product_i_45_n_6;
  wire tmp_product_i_46_n_6;
  wire tmp_product_i_47_n_6;
  wire tmp_product_i_48_n_6;
  wire tmp_product_i_49_n_6;
  wire tmp_product_i_50_n_6;
  wire tmp_product_i_51_n_6;
  wire tmp_product_i_52_n_6;
  wire tmp_product_i_53_n_6;
  wire tmp_product_i_54_n_6;
  wire tmp_product_i_55_n_6;
  wire tmp_product_i_56_n_6;
  wire tmp_product_i_57_n_6;
  wire tmp_product_i_58_n_6;
  wire tmp_product_i_59_n_6;
  wire tmp_product_i_60_n_6;
  wire tmp_product_i_61_n_6;
  wire tmp_product_i_62_n_6;
  wire tmp_product_i_63_n_6;
  wire tmp_product_i_64_n_6;
  wire tmp_product_i_65_n_6;
  wire tmp_product_i_66_n_6;
  wire tmp_product_i_67_n_6;
  wire tmp_product_i_68_n_6;
  wire tmp_product_i_69_n_6;
  wire tmp_product_i_70_n_6;
  wire tmp_product_i_71_n_6;
  wire tmp_product_i_72_n_6;
  wire tmp_product_i_73_n_6;
  wire tmp_product_i_74_n_6;
  wire tmp_product_i_75_n_6;
  wire tmp_product_i_76_n_6;
  wire tmp_product_i_77_n_6;
  wire tmp_product_i_78_n_6;
  wire tmp_product_i_79_n_6;
  wire tmp_product_i_80_n_6;
  wire tmp_product_i_81_n_6;
  wire tmp_product_i_82_n_6;
  wire tmp_product_i_83_n_10;
  wire tmp_product_i_83_n_11;
  wire tmp_product_i_83_n_12;
  wire tmp_product_i_83_n_13;
  wire tmp_product_i_83_n_14;
  wire tmp_product_i_83_n_15;
  wire tmp_product_i_83_n_16;
  wire tmp_product_i_83_n_17;
  wire tmp_product_i_83_n_18;
  wire tmp_product_i_83_n_19;
  wire tmp_product_i_83_n_20;
  wire tmp_product_i_83_n_21;
  wire tmp_product_i_83_n_6;
  wire tmp_product_i_83_n_7;
  wire tmp_product_i_83_n_8;
  wire tmp_product_i_83_n_9;
  wire tmp_product_i_84_n_10;
  wire tmp_product_i_84_n_11;
  wire tmp_product_i_84_n_12;
  wire tmp_product_i_84_n_13;
  wire tmp_product_i_84_n_14;
  wire tmp_product_i_84_n_15;
  wire tmp_product_i_84_n_16;
  wire tmp_product_i_84_n_17;
  wire tmp_product_i_84_n_18;
  wire tmp_product_i_84_n_19;
  wire tmp_product_i_84_n_20;
  wire tmp_product_i_84_n_21;
  wire tmp_product_i_84_n_6;
  wire tmp_product_i_84_n_7;
  wire tmp_product_i_84_n_8;
  wire tmp_product_i_84_n_9;
  wire tmp_product_i_85_n_10;
  wire tmp_product_i_85_n_11;
  wire tmp_product_i_85_n_12;
  wire tmp_product_i_85_n_13;
  wire tmp_product_i_85_n_14;
  wire tmp_product_i_85_n_15;
  wire tmp_product_i_85_n_16;
  wire tmp_product_i_85_n_17;
  wire tmp_product_i_85_n_18;
  wire tmp_product_i_85_n_19;
  wire tmp_product_i_85_n_20;
  wire tmp_product_i_85_n_21;
  wire tmp_product_i_85_n_6;
  wire tmp_product_i_85_n_7;
  wire tmp_product_i_85_n_8;
  wire tmp_product_i_85_n_9;
  wire tmp_product_i_86_n_6;
  wire tmp_product_i_87_n_6;
  wire tmp_product_i_88_n_6;
  wire tmp_product_i_89_n_6;
  wire tmp_product_i_90_n_6;
  wire tmp_product_i_91_n_6;
  wire tmp_product_i_92_n_6;
  wire tmp_product_i_93_n_6;
  wire tmp_product_i_94_n_6;
  wire tmp_product_i_95_n_6;
  wire tmp_product_i_96_n_6;
  wire tmp_product_i_97_n_6;
  wire tmp_product_i_98_n_6;
  wire tmp_product_i_99_n_6;
  wire tmp_product_n_100;
  wire tmp_product_n_101;
  wire tmp_product_n_102;
  wire tmp_product_n_103;
  wire tmp_product_n_104;
  wire tmp_product_n_105;
  wire tmp_product_n_106;
  wire tmp_product_n_107;
  wire tmp_product_n_108;
  wire tmp_product_n_109;
  wire tmp_product_n_110;
  wire tmp_product_n_111;
  wire tmp_product_n_112;
  wire tmp_product_n_113;
  wire tmp_product_n_114;
  wire tmp_product_n_115;
  wire tmp_product_n_116;
  wire tmp_product_n_117;
  wire tmp_product_n_118;
  wire tmp_product_n_119;
  wire tmp_product_n_120;
  wire tmp_product_n_121;
  wire tmp_product_n_122;
  wire tmp_product_n_123;
  wire tmp_product_n_124;
  wire tmp_product_n_125;
  wire tmp_product_n_126;
  wire tmp_product_n_127;
  wire tmp_product_n_128;
  wire tmp_product_n_129;
  wire tmp_product_n_130;
  wire tmp_product_n_131;
  wire tmp_product_n_132;
  wire tmp_product_n_133;
  wire tmp_product_n_134;
  wire tmp_product_n_135;
  wire tmp_product_n_136;
  wire tmp_product_n_137;
  wire tmp_product_n_138;
  wire tmp_product_n_139;
  wire tmp_product_n_140;
  wire tmp_product_n_141;
  wire tmp_product_n_142;
  wire tmp_product_n_143;
  wire tmp_product_n_144;
  wire tmp_product_n_145;
  wire tmp_product_n_146;
  wire tmp_product_n_147;
  wire tmp_product_n_148;
  wire tmp_product_n_149;
  wire tmp_product_n_150;
  wire tmp_product_n_151;
  wire tmp_product_n_152;
  wire tmp_product_n_153;
  wire tmp_product_n_154;
  wire tmp_product_n_155;
  wire tmp_product_n_156;
  wire tmp_product_n_157;
  wire tmp_product_n_158;
  wire tmp_product_n_159;
  wire tmp_product_n_64;
  wire tmp_product_n_65;
  wire tmp_product_n_66;
  wire tmp_product_n_67;
  wire tmp_product_n_68;
  wire tmp_product_n_69;
  wire tmp_product_n_70;
  wire tmp_product_n_71;
  wire tmp_product_n_72;
  wire tmp_product_n_73;
  wire tmp_product_n_74;
  wire tmp_product_n_75;
  wire tmp_product_n_76;
  wire tmp_product_n_77;
  wire tmp_product_n_78;
  wire tmp_product_n_79;
  wire tmp_product_n_80;
  wire tmp_product_n_81;
  wire tmp_product_n_82;
  wire tmp_product_n_83;
  wire tmp_product_n_84;
  wire tmp_product_n_85;
  wire tmp_product_n_86;
  wire tmp_product_n_87;
  wire tmp_product_n_88;
  wire tmp_product_n_89;
  wire tmp_product_n_90;
  wire tmp_product_n_91;
  wire tmp_product_n_92;
  wire tmp_product_n_93;
  wire tmp_product_n_94;
  wire tmp_product_n_95;
  wire tmp_product_n_96;
  wire tmp_product_n_97;
  wire tmp_product_n_98;
  wire tmp_product_n_99;
  wire [7:7]\NLW_mul_ln57_reg_1078_reg[31]_i_1_CO_UNCONNECTED ;
  wire NLW_tmp_product_CARRYCASCOUT_UNCONNECTED;
  wire NLW_tmp_product_MULTSIGNOUT_UNCONNECTED;
  wire NLW_tmp_product_OVERFLOW_UNCONNECTED;
  wire NLW_tmp_product_PATTERNBDETECT_UNCONNECTED;
  wire NLW_tmp_product_PATTERNDETECT_UNCONNECTED;
  wire NLW_tmp_product_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_tmp_product_ACOUT_UNCONNECTED;
  wire [17:0]NLW_tmp_product_BCOUT_UNCONNECTED;
  wire [3:0]NLW_tmp_product_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_tmp_product_XOROUT_UNCONNECTED;
  wire NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_tmp_product__0_OVERFLOW_UNCONNECTED;
  wire NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_tmp_product__0_UNDERFLOW_UNCONNECTED;
  wire [17:0]NLW_tmp_product__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_tmp_product__0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_tmp_product__0_XOROUT_UNCONNECTED;
  wire NLW_tmp_product__1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_tmp_product__1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_tmp_product__1_OVERFLOW_UNCONNECTED;
  wire NLW_tmp_product__1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_tmp_product__1_PATTERNDETECT_UNCONNECTED;
  wire NLW_tmp_product__1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_tmp_product__1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_tmp_product__1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_tmp_product__1_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_tmp_product__1_PCOUT_UNCONNECTED;
  wire [7:0]NLW_tmp_product__1_XOROUT_UNCONNECTED;
  wire [7:7]NLW_tmp_product__1_i_16_CO_UNCONNECTED;
  wire [7:7]NLW_tmp_product__1_i_32_CO_UNCONNECTED;

  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_2 
       (.I0(tmp_product__1_n_105),
        .I1(tmp_product_n_105),
        .O(\mul_ln57_reg_1078[23]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_3 
       (.I0(tmp_product__1_n_106),
        .I1(tmp_product_n_106),
        .O(\mul_ln57_reg_1078[23]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_4 
       (.I0(tmp_product__1_n_107),
        .I1(tmp_product_n_107),
        .O(\mul_ln57_reg_1078[23]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_5 
       (.I0(tmp_product__1_n_108),
        .I1(tmp_product_n_108),
        .O(\mul_ln57_reg_1078[23]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_6 
       (.I0(tmp_product__1_n_109),
        .I1(tmp_product_n_109),
        .O(\mul_ln57_reg_1078[23]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_7 
       (.I0(tmp_product__1_n_110),
        .I1(tmp_product_n_110),
        .O(\mul_ln57_reg_1078[23]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[23]_i_8 
       (.I0(tmp_product__1_n_111),
        .I1(tmp_product_n_111),
        .O(\mul_ln57_reg_1078[23]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_2 
       (.I0(tmp_product__1_n_97),
        .I1(tmp_product_n_97),
        .O(\mul_ln57_reg_1078[31]_i_2_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_3 
       (.I0(tmp_product__1_n_98),
        .I1(tmp_product_n_98),
        .O(\mul_ln57_reg_1078[31]_i_3_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_4 
       (.I0(tmp_product__1_n_99),
        .I1(tmp_product_n_99),
        .O(\mul_ln57_reg_1078[31]_i_4_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_5 
       (.I0(tmp_product__1_n_100),
        .I1(tmp_product_n_100),
        .O(\mul_ln57_reg_1078[31]_i_5_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_6 
       (.I0(tmp_product__1_n_101),
        .I1(tmp_product_n_101),
        .O(\mul_ln57_reg_1078[31]_i_6_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_7 
       (.I0(tmp_product__1_n_102),
        .I1(tmp_product_n_102),
        .O(\mul_ln57_reg_1078[31]_i_7_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_8 
       (.I0(tmp_product__1_n_103),
        .I1(tmp_product_n_103),
        .O(\mul_ln57_reg_1078[31]_i_8_n_6 ));
  LUT2 #(
    .INIT(4'h6)) 
    \mul_ln57_reg_1078[31]_i_9 
       (.I0(tmp_product__1_n_104),
        .I1(tmp_product_n_104),
        .O(\mul_ln57_reg_1078[31]_i_9_n_6 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \mul_ln57_reg_1078_reg[23]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\mul_ln57_reg_1078_reg[23]_i_1_n_6 ,\mul_ln57_reg_1078_reg[23]_i_1_n_7 ,\mul_ln57_reg_1078_reg[23]_i_1_n_8 ,\mul_ln57_reg_1078_reg[23]_i_1_n_9 ,\mul_ln57_reg_1078_reg[23]_i_1_n_10 ,\mul_ln57_reg_1078_reg[23]_i_1_n_11 ,\mul_ln57_reg_1078_reg[23]_i_1_n_12 ,\mul_ln57_reg_1078_reg[23]_i_1_n_13 }),
        .DI({tmp_product__1_n_105,tmp_product__1_n_106,tmp_product__1_n_107,tmp_product__1_n_108,tmp_product__1_n_109,tmp_product__1_n_110,tmp_product__1_n_111,1'b0}),
        .O(D[23:16]),
        .S({\mul_ln57_reg_1078[23]_i_2_n_6 ,\mul_ln57_reg_1078[23]_i_3_n_6 ,\mul_ln57_reg_1078[23]_i_4_n_6 ,\mul_ln57_reg_1078[23]_i_5_n_6 ,\mul_ln57_reg_1078[23]_i_6_n_6 ,\mul_ln57_reg_1078[23]_i_7_n_6 ,\mul_ln57_reg_1078[23]_i_8_n_6 ,tmp_product__0_n_95}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \mul_ln57_reg_1078_reg[31]_i_1 
       (.CI(\mul_ln57_reg_1078_reg[23]_i_1_n_6 ),
        .CI_TOP(1'b0),
        .CO({\NLW_mul_ln57_reg_1078_reg[31]_i_1_CO_UNCONNECTED [7],\mul_ln57_reg_1078_reg[31]_i_1_n_7 ,\mul_ln57_reg_1078_reg[31]_i_1_n_8 ,\mul_ln57_reg_1078_reg[31]_i_1_n_9 ,\mul_ln57_reg_1078_reg[31]_i_1_n_10 ,\mul_ln57_reg_1078_reg[31]_i_1_n_11 ,\mul_ln57_reg_1078_reg[31]_i_1_n_12 ,\mul_ln57_reg_1078_reg[31]_i_1_n_13 }),
        .DI({1'b0,tmp_product__1_n_98,tmp_product__1_n_99,tmp_product__1_n_100,tmp_product__1_n_101,tmp_product__1_n_102,tmp_product__1_n_103,tmp_product__1_n_104}),
        .O(D[31:24]),
        .S({\mul_ln57_reg_1078[31]_i_2_n_6 ,\mul_ln57_reg_1078[31]_i_3_n_6 ,\mul_ln57_reg_1078[31]_i_4_n_6 ,\mul_ln57_reg_1078[31]_i_5_n_6 ,\mul_ln57_reg_1078[31]_i_6_n_6 ,\mul_ln57_reg_1078[31]_i_7_n_6 ,\mul_ln57_reg_1078[31]_i_8_n_6 ,\mul_ln57_reg_1078[31]_i_9_n_6 }));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 15x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    tmp_product
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,grp_fu_380_p1[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_tmp_product_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({grp_fu_380_p0[31],grp_fu_380_p0[31],grp_fu_380_p0[31],grp_fu_380_p0[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_tmp_product_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_tmp_product_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_tmp_product_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_tmp_product_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_tmp_product_OVERFLOW_UNCONNECTED),
        .P({tmp_product_n_64,tmp_product_n_65,tmp_product_n_66,tmp_product_n_67,tmp_product_n_68,tmp_product_n_69,tmp_product_n_70,tmp_product_n_71,tmp_product_n_72,tmp_product_n_73,tmp_product_n_74,tmp_product_n_75,tmp_product_n_76,tmp_product_n_77,tmp_product_n_78,tmp_product_n_79,tmp_product_n_80,tmp_product_n_81,tmp_product_n_82,tmp_product_n_83,tmp_product_n_84,tmp_product_n_85,tmp_product_n_86,tmp_product_n_87,tmp_product_n_88,tmp_product_n_89,tmp_product_n_90,tmp_product_n_91,tmp_product_n_92,tmp_product_n_93,tmp_product_n_94,tmp_product_n_95,tmp_product_n_96,tmp_product_n_97,tmp_product_n_98,tmp_product_n_99,tmp_product_n_100,tmp_product_n_101,tmp_product_n_102,tmp_product_n_103,tmp_product_n_104,tmp_product_n_105,tmp_product_n_106,tmp_product_n_107,tmp_product_n_108,tmp_product_n_109,tmp_product_n_110,tmp_product_n_111}),
        .PATTERNBDETECT(NLW_tmp_product_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_tmp_product_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({tmp_product_n_112,tmp_product_n_113,tmp_product_n_114,tmp_product_n_115,tmp_product_n_116,tmp_product_n_117,tmp_product_n_118,tmp_product_n_119,tmp_product_n_120,tmp_product_n_121,tmp_product_n_122,tmp_product_n_123,tmp_product_n_124,tmp_product_n_125,tmp_product_n_126,tmp_product_n_127,tmp_product_n_128,tmp_product_n_129,tmp_product_n_130,tmp_product_n_131,tmp_product_n_132,tmp_product_n_133,tmp_product_n_134,tmp_product_n_135,tmp_product_n_136,tmp_product_n_137,tmp_product_n_138,tmp_product_n_139,tmp_product_n_140,tmp_product_n_141,tmp_product_n_142,tmp_product_n_143,tmp_product_n_144,tmp_product_n_145,tmp_product_n_146,tmp_product_n_147,tmp_product_n_148,tmp_product_n_149,tmp_product_n_150,tmp_product_n_151,tmp_product_n_152,tmp_product_n_153,tmp_product_n_154,tmp_product_n_155,tmp_product_n_156,tmp_product_n_157,tmp_product_n_158,tmp_product_n_159}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_tmp_product_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_tmp_product_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    tmp_product__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,grp_fu_380_p0[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT({tmp_product__0_n_30,tmp_product__0_n_31,tmp_product__0_n_32,tmp_product__0_n_33,tmp_product__0_n_34,tmp_product__0_n_35,tmp_product__0_n_36,tmp_product__0_n_37,tmp_product__0_n_38,tmp_product__0_n_39,tmp_product__0_n_40,tmp_product__0_n_41,tmp_product__0_n_42,tmp_product__0_n_43,tmp_product__0_n_44,tmp_product__0_n_45,tmp_product__0_n_46,tmp_product__0_n_47,tmp_product__0_n_48,tmp_product__0_n_49,tmp_product__0_n_50,tmp_product__0_n_51,tmp_product__0_n_52,tmp_product__0_n_53,tmp_product__0_n_54,tmp_product__0_n_55,tmp_product__0_n_56,tmp_product__0_n_57,tmp_product__0_n_58,tmp_product__0_n_59}),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,grp_fu_380_p1[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_tmp_product__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_tmp_product__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_tmp_product__0_OVERFLOW_UNCONNECTED),
        .P({tmp_product__0_n_64,tmp_product__0_n_65,tmp_product__0_n_66,tmp_product__0_n_67,tmp_product__0_n_68,tmp_product__0_n_69,tmp_product__0_n_70,tmp_product__0_n_71,tmp_product__0_n_72,tmp_product__0_n_73,tmp_product__0_n_74,tmp_product__0_n_75,tmp_product__0_n_76,tmp_product__0_n_77,tmp_product__0_n_78,tmp_product__0_n_79,tmp_product__0_n_80,tmp_product__0_n_81,tmp_product__0_n_82,tmp_product__0_n_83,tmp_product__0_n_84,tmp_product__0_n_85,tmp_product__0_n_86,tmp_product__0_n_87,tmp_product__0_n_88,tmp_product__0_n_89,tmp_product__0_n_90,tmp_product__0_n_91,tmp_product__0_n_92,tmp_product__0_n_93,tmp_product__0_n_94,tmp_product__0_n_95,D[15:0]}),
        .PATTERNBDETECT(NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({tmp_product__0_n_112,tmp_product__0_n_113,tmp_product__0_n_114,tmp_product__0_n_115,tmp_product__0_n_116,tmp_product__0_n_117,tmp_product__0_n_118,tmp_product__0_n_119,tmp_product__0_n_120,tmp_product__0_n_121,tmp_product__0_n_122,tmp_product__0_n_123,tmp_product__0_n_124,tmp_product__0_n_125,tmp_product__0_n_126,tmp_product__0_n_127,tmp_product__0_n_128,tmp_product__0_n_129,tmp_product__0_n_130,tmp_product__0_n_131,tmp_product__0_n_132,tmp_product__0_n_133,tmp_product__0_n_134,tmp_product__0_n_135,tmp_product__0_n_136,tmp_product__0_n_137,tmp_product__0_n_138,tmp_product__0_n_139,tmp_product__0_n_140,tmp_product__0_n_141,tmp_product__0_n_142,tmp_product__0_n_143,tmp_product__0_n_144,tmp_product__0_n_145,tmp_product__0_n_146,tmp_product__0_n_147,tmp_product__0_n_148,tmp_product__0_n_149,tmp_product__0_n_150,tmp_product__0_n_151,tmp_product__0_n_152,tmp_product__0_n_153,tmp_product__0_n_154,tmp_product__0_n_155,tmp_product__0_n_156,tmp_product__0_n_157,tmp_product__0_n_158,tmp_product__0_n_159}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_tmp_product__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_tmp_product__0_XOROUT_UNCONNECTED[7:0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_1
       (.I0(DSP_A_B_DATA_INST[16]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[16]),
        .O(grp_fu_380_p0[16]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_10
       (.I0(DSP_A_B_DATA_INST[7]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[7]),
        .O(grp_fu_380_p0[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_11
       (.I0(DSP_A_B_DATA_INST[6]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[6]),
        .O(grp_fu_380_p0[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_12
       (.I0(DSP_A_B_DATA_INST[5]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[5]),
        .O(grp_fu_380_p0[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_13
       (.I0(DSP_A_B_DATA_INST[4]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[4]),
        .O(grp_fu_380_p0[4]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_14
       (.I0(DSP_A_B_DATA_INST[3]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[3]),
        .O(grp_fu_380_p0[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_15
       (.I0(DSP_A_B_DATA_INST[2]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[2]),
        .O(grp_fu_380_p0[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_16
       (.I0(DSP_A_B_DATA_INST[1]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[1]),
        .O(grp_fu_380_p0[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_17
       (.I0(DSP_A_B_DATA_INST[0]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[0]),
        .O(grp_fu_380_p0[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_2
       (.I0(DSP_A_B_DATA_INST[15]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[15]),
        .O(grp_fu_380_p0[15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_3
       (.I0(DSP_A_B_DATA_INST[14]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[14]),
        .O(grp_fu_380_p0[14]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_4
       (.I0(DSP_A_B_DATA_INST[13]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[13]),
        .O(grp_fu_380_p0[13]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_5
       (.I0(DSP_A_B_DATA_INST[12]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[12]),
        .O(grp_fu_380_p0[12]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_6
       (.I0(DSP_A_B_DATA_INST[11]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[11]),
        .O(grp_fu_380_p0[11]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_7
       (.I0(DSP_A_B_DATA_INST[10]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[10]),
        .O(grp_fu_380_p0[10]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_8
       (.I0(DSP_A_B_DATA_INST[9]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[9]),
        .O(grp_fu_380_p0[9]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__0_i_9
       (.I0(DSP_A_B_DATA_INST[8]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[8]),
        .O(grp_fu_380_p0[8]));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x15 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    tmp_product__1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({tmp_product__0_n_30,tmp_product__0_n_31,tmp_product__0_n_32,tmp_product__0_n_33,tmp_product__0_n_34,tmp_product__0_n_35,tmp_product__0_n_36,tmp_product__0_n_37,tmp_product__0_n_38,tmp_product__0_n_39,tmp_product__0_n_40,tmp_product__0_n_41,tmp_product__0_n_42,tmp_product__0_n_43,tmp_product__0_n_44,tmp_product__0_n_45,tmp_product__0_n_46,tmp_product__0_n_47,tmp_product__0_n_48,tmp_product__0_n_49,tmp_product__0_n_50,tmp_product__0_n_51,tmp_product__0_n_52,tmp_product__0_n_53,tmp_product__0_n_54,tmp_product__0_n_55,tmp_product__0_n_56,tmp_product__0_n_57,tmp_product__0_n_58,tmp_product__0_n_59}),
        .ACOUT(NLW_tmp_product__1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({grp_fu_380_p1[31],grp_fu_380_p1[31],grp_fu_380_p1[31],grp_fu_380_p1[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_tmp_product__1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_tmp_product__1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_tmp_product__1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_tmp_product__1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_tmp_product__1_OVERFLOW_UNCONNECTED),
        .P({tmp_product__1_n_64,tmp_product__1_n_65,tmp_product__1_n_66,tmp_product__1_n_67,tmp_product__1_n_68,tmp_product__1_n_69,tmp_product__1_n_70,tmp_product__1_n_71,tmp_product__1_n_72,tmp_product__1_n_73,tmp_product__1_n_74,tmp_product__1_n_75,tmp_product__1_n_76,tmp_product__1_n_77,tmp_product__1_n_78,tmp_product__1_n_79,tmp_product__1_n_80,tmp_product__1_n_81,tmp_product__1_n_82,tmp_product__1_n_83,tmp_product__1_n_84,tmp_product__1_n_85,tmp_product__1_n_86,tmp_product__1_n_87,tmp_product__1_n_88,tmp_product__1_n_89,tmp_product__1_n_90,tmp_product__1_n_91,tmp_product__1_n_92,tmp_product__1_n_93,tmp_product__1_n_94,tmp_product__1_n_95,tmp_product__1_n_96,tmp_product__1_n_97,tmp_product__1_n_98,tmp_product__1_n_99,tmp_product__1_n_100,tmp_product__1_n_101,tmp_product__1_n_102,tmp_product__1_n_103,tmp_product__1_n_104,tmp_product__1_n_105,tmp_product__1_n_106,tmp_product__1_n_107,tmp_product__1_n_108,tmp_product__1_n_109,tmp_product__1_n_110,tmp_product__1_n_111}),
        .PATTERNBDETECT(NLW_tmp_product__1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_tmp_product__1_PATTERNDETECT_UNCONNECTED),
        .PCIN({tmp_product__0_n_112,tmp_product__0_n_113,tmp_product__0_n_114,tmp_product__0_n_115,tmp_product__0_n_116,tmp_product__0_n_117,tmp_product__0_n_118,tmp_product__0_n_119,tmp_product__0_n_120,tmp_product__0_n_121,tmp_product__0_n_122,tmp_product__0_n_123,tmp_product__0_n_124,tmp_product__0_n_125,tmp_product__0_n_126,tmp_product__0_n_127,tmp_product__0_n_128,tmp_product__0_n_129,tmp_product__0_n_130,tmp_product__0_n_131,tmp_product__0_n_132,tmp_product__0_n_133,tmp_product__0_n_134,tmp_product__0_n_135,tmp_product__0_n_136,tmp_product__0_n_137,tmp_product__0_n_138,tmp_product__0_n_139,tmp_product__0_n_140,tmp_product__0_n_141,tmp_product__0_n_142,tmp_product__0_n_143,tmp_product__0_n_144,tmp_product__0_n_145,tmp_product__0_n_146,tmp_product__0_n_147,tmp_product__0_n_148,tmp_product__0_n_149,tmp_product__0_n_150,tmp_product__0_n_151,tmp_product__0_n_152,tmp_product__0_n_153,tmp_product__0_n_154,tmp_product__0_n_155,tmp_product__0_n_156,tmp_product__0_n_157,tmp_product__0_n_158,tmp_product__0_n_159}),
        .PCOUT(NLW_tmp_product__1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_tmp_product__1_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_tmp_product__1_XOROUT_UNCONNECTED[7:0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_1
       (.I0(add_ln57_4_fu_824_p2[31]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[31]),
        .O(grp_fu_380_p1[31]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_10
       (.I0(add_ln57_4_fu_824_p2[22]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[22]),
        .O(grp_fu_380_p1[22]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_11
       (.I0(add_ln57_4_fu_824_p2[21]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[21]),
        .O(grp_fu_380_p1[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_12
       (.I0(add_ln57_4_fu_824_p2[20]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[20]),
        .O(grp_fu_380_p1[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_13
       (.I0(add_ln57_4_fu_824_p2[19]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[19]),
        .O(grp_fu_380_p1[19]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_14
       (.I0(add_ln57_4_fu_824_p2[18]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[18]),
        .O(grp_fu_380_p1[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_15
       (.I0(add_ln57_4_fu_824_p2[17]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[17]),
        .O(grp_fu_380_p1[17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product__1_i_16
       (.CI(tmp_product_i_33_n_6),
        .CI_TOP(1'b0),
        .CO({NLW_tmp_product__1_i_16_CO_UNCONNECTED[7],tmp_product__1_i_16_n_7,tmp_product__1_i_16_n_8,tmp_product__1_i_16_n_9,tmp_product__1_i_16_n_10,tmp_product__1_i_16_n_11,tmp_product__1_i_16_n_12,tmp_product__1_i_16_n_13}),
        .DI({1'b0,tmp_product__1_i_17_n_6,tmp_product__1_i_18_n_6,tmp_product__1_i_19_n_6,tmp_product__1_i_20_n_6,tmp_product__1_i_21_n_6,tmp_product__1_i_22_n_6,tmp_product__1_i_23_n_6}),
        .O(add_ln57_4_fu_824_p2[31:24]),
        .S({tmp_product__1_i_24_n_6,tmp_product__1_i_25_n_6,tmp_product__1_i_26_n_6,tmp_product__1_i_27_n_6,tmp_product__1_i_28_n_6,tmp_product__1_i_29_n_6,tmp_product__1_i_30_n_6,tmp_product__1_i_31_n_6}));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_17
       (.I0(tmp_product__1_i_32_n_16),
        .I1(orig_q1[29]),
        .I2(tmp_product__1_i_16_0[29]),
        .O(tmp_product__1_i_17_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_18
       (.I0(tmp_product__1_i_32_n_17),
        .I1(orig_q1[28]),
        .I2(tmp_product__1_i_16_0[28]),
        .O(tmp_product__1_i_18_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_19
       (.I0(tmp_product__1_i_32_n_18),
        .I1(orig_q1[27]),
        .I2(tmp_product__1_i_16_0[27]),
        .O(tmp_product__1_i_19_n_6));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_2
       (.I0(add_ln57_4_fu_824_p2[30]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[30]),
        .O(grp_fu_380_p1[30]));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_20
       (.I0(tmp_product__1_i_32_n_19),
        .I1(orig_q1[26]),
        .I2(tmp_product__1_i_16_0[26]),
        .O(tmp_product__1_i_20_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_21
       (.I0(tmp_product__1_i_32_n_20),
        .I1(orig_q1[25]),
        .I2(tmp_product__1_i_16_0[25]),
        .O(tmp_product__1_i_21_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_22
       (.I0(tmp_product__1_i_32_n_21),
        .I1(orig_q1[24]),
        .I2(tmp_product__1_i_16_0[24]),
        .O(tmp_product__1_i_22_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_23
       (.I0(tmp_product_i_83_n_14),
        .I1(orig_q1[23]),
        .I2(tmp_product__1_i_16_0[23]),
        .O(tmp_product__1_i_23_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_24
       (.I0(tmp_product__1_i_16_0[30]),
        .I1(orig_q1[30]),
        .I2(tmp_product__1_i_32_n_15),
        .I3(tmp_product__1_i_16_0[31]),
        .I4(orig_q1[31]),
        .I5(tmp_product__1_i_32_n_14),
        .O(tmp_product__1_i_24_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_25
       (.I0(tmp_product__1_i_16_0[29]),
        .I1(orig_q1[29]),
        .I2(tmp_product__1_i_32_n_16),
        .I3(tmp_product__1_i_32_n_15),
        .I4(orig_q1[30]),
        .I5(tmp_product__1_i_16_0[30]),
        .O(tmp_product__1_i_25_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_26
       (.I0(tmp_product__1_i_16_0[28]),
        .I1(orig_q1[28]),
        .I2(tmp_product__1_i_32_n_17),
        .I3(tmp_product__1_i_32_n_16),
        .I4(orig_q1[29]),
        .I5(tmp_product__1_i_16_0[29]),
        .O(tmp_product__1_i_26_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_27
       (.I0(tmp_product__1_i_16_0[27]),
        .I1(orig_q1[27]),
        .I2(tmp_product__1_i_32_n_18),
        .I3(tmp_product__1_i_32_n_17),
        .I4(orig_q1[28]),
        .I5(tmp_product__1_i_16_0[28]),
        .O(tmp_product__1_i_27_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_28
       (.I0(tmp_product__1_i_16_0[26]),
        .I1(orig_q1[26]),
        .I2(tmp_product__1_i_32_n_19),
        .I3(tmp_product__1_i_32_n_18),
        .I4(orig_q1[27]),
        .I5(tmp_product__1_i_16_0[27]),
        .O(tmp_product__1_i_28_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_29
       (.I0(tmp_product__1_i_16_0[25]),
        .I1(orig_q1[25]),
        .I2(tmp_product__1_i_32_n_20),
        .I3(tmp_product__1_i_32_n_19),
        .I4(orig_q1[26]),
        .I5(tmp_product__1_i_16_0[26]),
        .O(tmp_product__1_i_29_n_6));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_3
       (.I0(add_ln57_4_fu_824_p2[29]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[29]),
        .O(grp_fu_380_p1[29]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_30
       (.I0(tmp_product__1_i_16_0[24]),
        .I1(orig_q1[24]),
        .I2(tmp_product__1_i_32_n_21),
        .I3(tmp_product__1_i_32_n_20),
        .I4(orig_q1[25]),
        .I5(tmp_product__1_i_16_0[25]),
        .O(tmp_product__1_i_30_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product__1_i_31
       (.I0(tmp_product__1_i_16_0[23]),
        .I1(orig_q1[23]),
        .I2(tmp_product_i_83_n_14),
        .I3(tmp_product__1_i_32_n_21),
        .I4(orig_q1[24]),
        .I5(tmp_product__1_i_16_0[24]),
        .O(tmp_product__1_i_31_n_6));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product__1_i_32
       (.CI(tmp_product_i_83_n_6),
        .CI_TOP(1'b0),
        .CO({NLW_tmp_product__1_i_32_CO_UNCONNECTED[7],tmp_product__1_i_32_n_7,tmp_product__1_i_32_n_8,tmp_product__1_i_32_n_9,tmp_product__1_i_32_n_10,tmp_product__1_i_32_n_11,tmp_product__1_i_32_n_12,tmp_product__1_i_32_n_13}),
        .DI({1'b0,tmp_product__1_i_33_n_6,tmp_product__1_i_34_n_6,tmp_product__1_i_35_n_6,tmp_product__1_i_36_n_6,tmp_product__1_i_37_n_6,tmp_product__1_i_38_n_6,tmp_product__1_i_39_n_6}),
        .O({tmp_product__1_i_32_n_14,tmp_product__1_i_32_n_15,tmp_product__1_i_32_n_16,tmp_product__1_i_32_n_17,tmp_product__1_i_32_n_18,tmp_product__1_i_32_n_19,tmp_product__1_i_32_n_20,tmp_product__1_i_32_n_21}),
        .S({tmp_product__1_i_40_n_6,tmp_product__1_i_41_n_6,tmp_product__1_i_42_n_6,tmp_product__1_i_43_n_6,tmp_product__1_i_44_n_6,tmp_product__1_i_45_n_6,tmp_product__1_i_46_n_6,tmp_product__1_i_47_n_6}));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_33
       (.I0(Q[29]),
        .I1(orig_q0[29]),
        .I2(tmp_product__1_i_32_0[29]),
        .O(tmp_product__1_i_33_n_6));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_34
       (.I0(Q[28]),
        .I1(orig_q0[28]),
        .I2(tmp_product__1_i_32_0[28]),
        .O(tmp_product__1_i_34_n_6));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_35
       (.I0(Q[27]),
        .I1(orig_q0[27]),
        .I2(tmp_product__1_i_32_0[27]),
        .O(tmp_product__1_i_35_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_36
       (.I0(Q[26]),
        .I1(orig_q0[26]),
        .I2(tmp_product__1_i_32_0[26]),
        .O(tmp_product__1_i_36_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_37
       (.I0(Q[25]),
        .I1(orig_q0[25]),
        .I2(tmp_product__1_i_32_0[25]),
        .O(tmp_product__1_i_37_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_38
       (.I0(Q[24]),
        .I1(orig_q0[24]),
        .I2(tmp_product__1_i_32_0[24]),
        .O(tmp_product__1_i_38_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product__1_i_39
       (.I0(Q[23]),
        .I1(orig_q0[23]),
        .I2(tmp_product__1_i_32_0[23]),
        .O(tmp_product__1_i_39_n_6));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_4
       (.I0(add_ln57_4_fu_824_p2[28]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[28]),
        .O(grp_fu_380_p1[28]));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    tmp_product__1_i_40
       (.I0(orig_q0[31]),
        .I1(Q[31]),
        .I2(tmp_product__1_i_32_0[31]),
        .I3(Q[30]),
        .I4(orig_q0[30]),
        .I5(tmp_product__1_i_32_0[30]),
        .O(tmp_product__1_i_40_n_6));
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_41
       (.I0(tmp_product__1_i_33_n_6),
        .I1(Q[30]),
        .I2(orig_q0[30]),
        .I3(tmp_product__1_i_32_0[30]),
        .O(tmp_product__1_i_41_n_6));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_42
       (.I0(Q[29]),
        .I1(orig_q0[29]),
        .I2(tmp_product__1_i_32_0[29]),
        .I3(tmp_product__1_i_34_n_6),
        .O(tmp_product__1_i_42_n_6));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_43
       (.I0(Q[28]),
        .I1(orig_q0[28]),
        .I2(tmp_product__1_i_32_0[28]),
        .I3(tmp_product__1_i_35_n_6),
        .O(tmp_product__1_i_43_n_6));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_44
       (.I0(Q[27]),
        .I1(orig_q0[27]),
        .I2(tmp_product__1_i_32_0[27]),
        .I3(tmp_product__1_i_36_n_6),
        .O(tmp_product__1_i_44_n_6));
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_45
       (.I0(Q[26]),
        .I1(orig_q0[26]),
        .I2(tmp_product__1_i_32_0[26]),
        .I3(tmp_product__1_i_37_n_6),
        .O(tmp_product__1_i_45_n_6));
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_46
       (.I0(Q[25]),
        .I1(orig_q0[25]),
        .I2(tmp_product__1_i_32_0[25]),
        .I3(tmp_product__1_i_38_n_6),
        .O(tmp_product__1_i_46_n_6));
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product__1_i_47
       (.I0(Q[24]),
        .I1(orig_q0[24]),
        .I2(tmp_product__1_i_32_0[24]),
        .I3(tmp_product__1_i_39_n_6),
        .O(tmp_product__1_i_47_n_6));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_5
       (.I0(add_ln57_4_fu_824_p2[27]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[27]),
        .O(grp_fu_380_p1[27]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_6
       (.I0(add_ln57_4_fu_824_p2[26]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[26]),
        .O(grp_fu_380_p1[26]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_7
       (.I0(add_ln57_4_fu_824_p2[25]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[25]),
        .O(grp_fu_380_p1[25]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_8
       (.I0(add_ln57_4_fu_824_p2[24]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[24]),
        .O(grp_fu_380_p1[24]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product__1_i_9
       (.I0(add_ln57_4_fu_824_p2[23]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[23]),
        .O(grp_fu_380_p1[23]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_1
       (.I0(DSP_A_B_DATA_INST[31]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[31]),
        .O(grp_fu_380_p0[31]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_10
       (.I0(DSP_A_B_DATA_INST[22]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[22]),
        .O(grp_fu_380_p0[22]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_100
       (.I0(tmp_product__1_i_32_0[16]),
        .I1(orig_q0[16]),
        .I2(Q[16]),
        .I3(Q[17]),
        .I4(orig_q0[17]),
        .I5(tmp_product__1_i_32_0[17]),
        .O(tmp_product_i_100_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_101
       (.I0(tmp_product__1_i_32_0[15]),
        .I1(orig_q0[15]),
        .I2(Q[15]),
        .I3(Q[16]),
        .I4(orig_q0[16]),
        .I5(tmp_product__1_i_32_0[16]),
        .O(tmp_product_i_101_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_102
       (.I0(Q[14]),
        .I1(orig_q0[14]),
        .I2(tmp_product__1_i_32_0[14]),
        .O(tmp_product_i_102_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_103
       (.I0(Q[13]),
        .I1(orig_q0[13]),
        .I2(tmp_product__1_i_32_0[13]),
        .O(tmp_product_i_103_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_104
       (.I0(Q[12]),
        .I1(orig_q0[12]),
        .I2(tmp_product__1_i_32_0[12]),
        .O(tmp_product_i_104_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_105
       (.I0(Q[11]),
        .I1(orig_q0[11]),
        .I2(tmp_product__1_i_32_0[11]),
        .O(tmp_product_i_105_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_106
       (.I0(Q[10]),
        .I1(orig_q0[10]),
        .I2(tmp_product__1_i_32_0[10]),
        .O(tmp_product_i_106_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_107
       (.I0(Q[9]),
        .I1(orig_q0[9]),
        .I2(tmp_product__1_i_32_0[9]),
        .O(tmp_product_i_107_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_108
       (.I0(Q[8]),
        .I1(orig_q0[8]),
        .I2(tmp_product__1_i_32_0[8]),
        .O(tmp_product_i_108_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_109
       (.I0(Q[7]),
        .I1(orig_q0[7]),
        .I2(tmp_product__1_i_32_0[7]),
        .O(tmp_product_i_109_n_6));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_11
       (.I0(DSP_A_B_DATA_INST[21]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[21]),
        .O(grp_fu_380_p0[21]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_110
       (.I0(tmp_product__1_i_32_0[14]),
        .I1(orig_q0[14]),
        .I2(Q[14]),
        .I3(Q[15]),
        .I4(orig_q0[15]),
        .I5(tmp_product__1_i_32_0[15]),
        .O(tmp_product_i_110_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_111
       (.I0(tmp_product__1_i_32_0[13]),
        .I1(orig_q0[13]),
        .I2(Q[13]),
        .I3(Q[14]),
        .I4(orig_q0[14]),
        .I5(tmp_product__1_i_32_0[14]),
        .O(tmp_product_i_111_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_112
       (.I0(tmp_product__1_i_32_0[12]),
        .I1(orig_q0[12]),
        .I2(Q[12]),
        .I3(Q[13]),
        .I4(orig_q0[13]),
        .I5(tmp_product__1_i_32_0[13]),
        .O(tmp_product_i_112_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_113
       (.I0(tmp_product__1_i_32_0[11]),
        .I1(orig_q0[11]),
        .I2(Q[11]),
        .I3(Q[12]),
        .I4(orig_q0[12]),
        .I5(tmp_product__1_i_32_0[12]),
        .O(tmp_product_i_113_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_114
       (.I0(tmp_product__1_i_32_0[10]),
        .I1(orig_q0[10]),
        .I2(Q[10]),
        .I3(Q[11]),
        .I4(orig_q0[11]),
        .I5(tmp_product__1_i_32_0[11]),
        .O(tmp_product_i_114_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_115
       (.I0(tmp_product__1_i_32_0[9]),
        .I1(orig_q0[9]),
        .I2(Q[9]),
        .I3(Q[10]),
        .I4(orig_q0[10]),
        .I5(tmp_product__1_i_32_0[10]),
        .O(tmp_product_i_115_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_116
       (.I0(tmp_product__1_i_32_0[8]),
        .I1(orig_q0[8]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(orig_q0[9]),
        .I5(tmp_product__1_i_32_0[9]),
        .O(tmp_product_i_116_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_117
       (.I0(tmp_product__1_i_32_0[7]),
        .I1(orig_q0[7]),
        .I2(Q[7]),
        .I3(Q[8]),
        .I4(orig_q0[8]),
        .I5(tmp_product__1_i_32_0[8]),
        .O(tmp_product_i_117_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_118
       (.I0(Q[6]),
        .I1(orig_q0[6]),
        .I2(tmp_product__1_i_32_0[6]),
        .O(tmp_product_i_118_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_119
       (.I0(Q[5]),
        .I1(orig_q0[5]),
        .I2(tmp_product__1_i_32_0[5]),
        .O(tmp_product_i_119_n_6));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_12
       (.I0(DSP_A_B_DATA_INST[20]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[20]),
        .O(grp_fu_380_p0[20]));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_120
       (.I0(Q[4]),
        .I1(orig_q0[4]),
        .I2(tmp_product__1_i_32_0[4]),
        .O(tmp_product_i_120_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_121
       (.I0(Q[3]),
        .I1(orig_q0[3]),
        .I2(tmp_product__1_i_32_0[3]),
        .O(tmp_product_i_121_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_122
       (.I0(Q[2]),
        .I1(orig_q0[2]),
        .I2(tmp_product__1_i_32_0[2]),
        .O(tmp_product_i_122_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_123
       (.I0(Q[1]),
        .I1(orig_q0[1]),
        .I2(tmp_product__1_i_32_0[1]),
        .O(tmp_product_i_123_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_124
       (.I0(orig_q0[0]),
        .I1(Q[0]),
        .I2(tmp_product__1_i_32_0[0]),
        .O(tmp_product_i_124_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_125
       (.I0(tmp_product__1_i_32_0[6]),
        .I1(orig_q0[6]),
        .I2(Q[6]),
        .I3(Q[7]),
        .I4(orig_q0[7]),
        .I5(tmp_product__1_i_32_0[7]),
        .O(tmp_product_i_125_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_126
       (.I0(tmp_product__1_i_32_0[5]),
        .I1(orig_q0[5]),
        .I2(Q[5]),
        .I3(Q[6]),
        .I4(orig_q0[6]),
        .I5(tmp_product__1_i_32_0[6]),
        .O(tmp_product_i_126_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_127
       (.I0(tmp_product__1_i_32_0[4]),
        .I1(orig_q0[4]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(orig_q0[5]),
        .I5(tmp_product__1_i_32_0[5]),
        .O(tmp_product_i_127_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_128
       (.I0(tmp_product__1_i_32_0[3]),
        .I1(orig_q0[3]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(orig_q0[4]),
        .I5(tmp_product__1_i_32_0[4]),
        .O(tmp_product_i_128_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_129
       (.I0(tmp_product__1_i_32_0[2]),
        .I1(orig_q0[2]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(orig_q0[3]),
        .I5(tmp_product__1_i_32_0[3]),
        .O(tmp_product_i_129_n_6));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_13
       (.I0(DSP_A_B_DATA_INST[19]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[19]),
        .O(grp_fu_380_p0[19]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_130
       (.I0(tmp_product__1_i_32_0[1]),
        .I1(orig_q0[1]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(orig_q0[2]),
        .I5(tmp_product__1_i_32_0[2]),
        .O(tmp_product_i_130_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_131
       (.I0(tmp_product__1_i_32_0[0]),
        .I1(Q[0]),
        .I2(orig_q0[0]),
        .I3(Q[1]),
        .I4(orig_q0[1]),
        .I5(tmp_product__1_i_32_0[1]),
        .O(tmp_product_i_131_n_6));
  LUT3 #(
    .INIT(8'h96)) 
    tmp_product_i_132
       (.I0(orig_q0[0]),
        .I1(tmp_product__1_i_32_0[0]),
        .I2(Q[0]),
        .O(tmp_product_i_132_n_6));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_14
       (.I0(DSP_A_B_DATA_INST[18]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[18]),
        .O(grp_fu_380_p0[18]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_15
       (.I0(DSP_A_B_DATA_INST[17]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[17]),
        .O(grp_fu_380_p0[17]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_16
       (.I0(add_ln57_4_fu_824_p2[16]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[16]),
        .O(grp_fu_380_p1[16]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_17
       (.I0(add_ln57_4_fu_824_p2[15]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[15]),
        .O(grp_fu_380_p1[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_18
       (.I0(add_ln57_4_fu_824_p2[14]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[14]),
        .O(grp_fu_380_p1[14]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_19
       (.I0(add_ln57_4_fu_824_p2[13]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[13]),
        .O(grp_fu_380_p1[13]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_2
       (.I0(DSP_A_B_DATA_INST[30]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[30]),
        .O(grp_fu_380_p0[30]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_20
       (.I0(add_ln57_4_fu_824_p2[12]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[12]),
        .O(grp_fu_380_p1[12]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_21
       (.I0(add_ln57_4_fu_824_p2[11]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[11]),
        .O(grp_fu_380_p1[11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_22
       (.I0(add_ln57_4_fu_824_p2[10]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[10]),
        .O(grp_fu_380_p1[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_23
       (.I0(add_ln57_4_fu_824_p2[9]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[9]),
        .O(grp_fu_380_p1[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_24
       (.I0(add_ln57_4_fu_824_p2[8]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[8]),
        .O(grp_fu_380_p1[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_25
       (.I0(add_ln57_4_fu_824_p2[7]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[7]),
        .O(grp_fu_380_p1[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_26
       (.I0(add_ln57_4_fu_824_p2[6]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[6]),
        .O(grp_fu_380_p1[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_27
       (.I0(add_ln57_4_fu_824_p2[5]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[5]),
        .O(grp_fu_380_p1[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_28
       (.I0(add_ln57_4_fu_824_p2[4]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[4]),
        .O(grp_fu_380_p1[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_29
       (.I0(add_ln57_4_fu_824_p2[3]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[3]),
        .O(grp_fu_380_p1[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_3
       (.I0(DSP_A_B_DATA_INST[29]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[29]),
        .O(grp_fu_380_p0[29]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_30
       (.I0(add_ln57_4_fu_824_p2[2]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[2]),
        .O(grp_fu_380_p1[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_31
       (.I0(add_ln57_4_fu_824_p2[1]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[1]),
        .O(grp_fu_380_p1[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_32
       (.I0(add_ln57_4_fu_824_p2[0]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(DSP_A_B_DATA_INST_1[0]),
        .O(grp_fu_380_p1[0]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_33
       (.CI(tmp_product_i_34_n_6),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_33_n_6,tmp_product_i_33_n_7,tmp_product_i_33_n_8,tmp_product_i_33_n_9,tmp_product_i_33_n_10,tmp_product_i_33_n_11,tmp_product_i_33_n_12,tmp_product_i_33_n_13}),
        .DI({tmp_product_i_36_n_6,tmp_product_i_37_n_6,tmp_product_i_38_n_6,tmp_product_i_39_n_6,tmp_product_i_40_n_6,tmp_product_i_41_n_6,tmp_product_i_42_n_6,tmp_product_i_43_n_6}),
        .O(add_ln57_4_fu_824_p2[23:16]),
        .S({tmp_product_i_44_n_6,tmp_product_i_45_n_6,tmp_product_i_46_n_6,tmp_product_i_47_n_6,tmp_product_i_48_n_6,tmp_product_i_49_n_6,tmp_product_i_50_n_6,tmp_product_i_51_n_6}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_34
       (.CI(tmp_product_i_35_n_6),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_34_n_6,tmp_product_i_34_n_7,tmp_product_i_34_n_8,tmp_product_i_34_n_9,tmp_product_i_34_n_10,tmp_product_i_34_n_11,tmp_product_i_34_n_12,tmp_product_i_34_n_13}),
        .DI({tmp_product_i_52_n_6,tmp_product_i_53_n_6,tmp_product_i_54_n_6,tmp_product_i_55_n_6,tmp_product_i_56_n_6,tmp_product_i_57_n_6,tmp_product_i_58_n_6,tmp_product_i_59_n_6}),
        .O(add_ln57_4_fu_824_p2[15:8]),
        .S({tmp_product_i_60_n_6,tmp_product_i_61_n_6,tmp_product_i_62_n_6,tmp_product_i_63_n_6,tmp_product_i_64_n_6,tmp_product_i_65_n_6,tmp_product_i_66_n_6,tmp_product_i_67_n_6}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_35
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_35_n_6,tmp_product_i_35_n_7,tmp_product_i_35_n_8,tmp_product_i_35_n_9,tmp_product_i_35_n_10,tmp_product_i_35_n_11,tmp_product_i_35_n_12,tmp_product_i_35_n_13}),
        .DI({tmp_product_i_68_n_6,tmp_product_i_69_n_6,tmp_product_i_70_n_6,tmp_product_i_71_n_6,tmp_product_i_72_n_6,tmp_product_i_73_n_6,tmp_product_i_74_n_6,1'b0}),
        .O(add_ln57_4_fu_824_p2[7:0]),
        .S({tmp_product_i_75_n_6,tmp_product_i_76_n_6,tmp_product_i_77_n_6,tmp_product_i_78_n_6,tmp_product_i_79_n_6,tmp_product_i_80_n_6,tmp_product_i_81_n_6,tmp_product_i_82_n_6}));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_36
       (.I0(tmp_product_i_83_n_15),
        .I1(orig_q1[22]),
        .I2(tmp_product__1_i_16_0[22]),
        .O(tmp_product_i_36_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_37
       (.I0(tmp_product_i_83_n_16),
        .I1(orig_q1[21]),
        .I2(tmp_product__1_i_16_0[21]),
        .O(tmp_product_i_37_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_38
       (.I0(tmp_product_i_83_n_17),
        .I1(orig_q1[20]),
        .I2(tmp_product__1_i_16_0[20]),
        .O(tmp_product_i_38_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_39
       (.I0(tmp_product_i_83_n_18),
        .I1(orig_q1[19]),
        .I2(tmp_product__1_i_16_0[19]),
        .O(tmp_product_i_39_n_6));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_4
       (.I0(DSP_A_B_DATA_INST[28]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[28]),
        .O(grp_fu_380_p0[28]));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_40
       (.I0(tmp_product_i_83_n_19),
        .I1(orig_q1[18]),
        .I2(tmp_product__1_i_16_0[18]),
        .O(tmp_product_i_40_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_41
       (.I0(tmp_product_i_83_n_20),
        .I1(orig_q1[17]),
        .I2(tmp_product__1_i_16_0[17]),
        .O(tmp_product_i_41_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_42
       (.I0(tmp_product_i_83_n_21),
        .I1(orig_q1[16]),
        .I2(tmp_product__1_i_16_0[16]),
        .O(tmp_product_i_42_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_43
       (.I0(tmp_product_i_84_n_14),
        .I1(orig_q1[15]),
        .I2(tmp_product__1_i_16_0[15]),
        .O(tmp_product_i_43_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_44
       (.I0(tmp_product__1_i_16_0[22]),
        .I1(orig_q1[22]),
        .I2(tmp_product_i_83_n_15),
        .I3(tmp_product_i_83_n_14),
        .I4(orig_q1[23]),
        .I5(tmp_product__1_i_16_0[23]),
        .O(tmp_product_i_44_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_45
       (.I0(tmp_product__1_i_16_0[21]),
        .I1(orig_q1[21]),
        .I2(tmp_product_i_83_n_16),
        .I3(tmp_product_i_83_n_15),
        .I4(orig_q1[22]),
        .I5(tmp_product__1_i_16_0[22]),
        .O(tmp_product_i_45_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_46
       (.I0(tmp_product__1_i_16_0[20]),
        .I1(orig_q1[20]),
        .I2(tmp_product_i_83_n_17),
        .I3(tmp_product_i_83_n_16),
        .I4(orig_q1[21]),
        .I5(tmp_product__1_i_16_0[21]),
        .O(tmp_product_i_46_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_47
       (.I0(tmp_product__1_i_16_0[19]),
        .I1(orig_q1[19]),
        .I2(tmp_product_i_83_n_18),
        .I3(tmp_product_i_83_n_17),
        .I4(orig_q1[20]),
        .I5(tmp_product__1_i_16_0[20]),
        .O(tmp_product_i_47_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_48
       (.I0(tmp_product__1_i_16_0[18]),
        .I1(orig_q1[18]),
        .I2(tmp_product_i_83_n_19),
        .I3(tmp_product_i_83_n_18),
        .I4(orig_q1[19]),
        .I5(tmp_product__1_i_16_0[19]),
        .O(tmp_product_i_48_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_49
       (.I0(tmp_product__1_i_16_0[17]),
        .I1(orig_q1[17]),
        .I2(tmp_product_i_83_n_20),
        .I3(tmp_product_i_83_n_19),
        .I4(orig_q1[18]),
        .I5(tmp_product__1_i_16_0[18]),
        .O(tmp_product_i_49_n_6));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_5
       (.I0(DSP_A_B_DATA_INST[27]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[27]),
        .O(grp_fu_380_p0[27]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_50
       (.I0(tmp_product__1_i_16_0[16]),
        .I1(orig_q1[16]),
        .I2(tmp_product_i_83_n_21),
        .I3(tmp_product_i_83_n_20),
        .I4(orig_q1[17]),
        .I5(tmp_product__1_i_16_0[17]),
        .O(tmp_product_i_50_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_51
       (.I0(tmp_product__1_i_16_0[15]),
        .I1(orig_q1[15]),
        .I2(tmp_product_i_84_n_14),
        .I3(tmp_product_i_83_n_21),
        .I4(orig_q1[16]),
        .I5(tmp_product__1_i_16_0[16]),
        .O(tmp_product_i_51_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_52
       (.I0(tmp_product_i_84_n_15),
        .I1(orig_q1[14]),
        .I2(tmp_product__1_i_16_0[14]),
        .O(tmp_product_i_52_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_53
       (.I0(tmp_product_i_84_n_16),
        .I1(orig_q1[13]),
        .I2(tmp_product__1_i_16_0[13]),
        .O(tmp_product_i_53_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_54
       (.I0(tmp_product_i_84_n_17),
        .I1(orig_q1[12]),
        .I2(tmp_product__1_i_16_0[12]),
        .O(tmp_product_i_54_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_55
       (.I0(tmp_product_i_84_n_18),
        .I1(orig_q1[11]),
        .I2(tmp_product__1_i_16_0[11]),
        .O(tmp_product_i_55_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_56
       (.I0(tmp_product_i_84_n_19),
        .I1(orig_q1[10]),
        .I2(tmp_product__1_i_16_0[10]),
        .O(tmp_product_i_56_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_57
       (.I0(tmp_product_i_84_n_20),
        .I1(orig_q1[9]),
        .I2(tmp_product__1_i_16_0[9]),
        .O(tmp_product_i_57_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_58
       (.I0(tmp_product_i_84_n_21),
        .I1(orig_q1[8]),
        .I2(tmp_product__1_i_16_0[8]),
        .O(tmp_product_i_58_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_59
       (.I0(tmp_product_i_85_n_14),
        .I1(orig_q1[7]),
        .I2(tmp_product__1_i_16_0[7]),
        .O(tmp_product_i_59_n_6));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_6
       (.I0(DSP_A_B_DATA_INST[26]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[26]),
        .O(grp_fu_380_p0[26]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_60
       (.I0(tmp_product__1_i_16_0[14]),
        .I1(orig_q1[14]),
        .I2(tmp_product_i_84_n_15),
        .I3(tmp_product_i_84_n_14),
        .I4(orig_q1[15]),
        .I5(tmp_product__1_i_16_0[15]),
        .O(tmp_product_i_60_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_61
       (.I0(tmp_product__1_i_16_0[13]),
        .I1(orig_q1[13]),
        .I2(tmp_product_i_84_n_16),
        .I3(tmp_product_i_84_n_15),
        .I4(orig_q1[14]),
        .I5(tmp_product__1_i_16_0[14]),
        .O(tmp_product_i_61_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_62
       (.I0(tmp_product__1_i_16_0[12]),
        .I1(orig_q1[12]),
        .I2(tmp_product_i_84_n_17),
        .I3(tmp_product_i_84_n_16),
        .I4(orig_q1[13]),
        .I5(tmp_product__1_i_16_0[13]),
        .O(tmp_product_i_62_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_63
       (.I0(tmp_product__1_i_16_0[11]),
        .I1(orig_q1[11]),
        .I2(tmp_product_i_84_n_18),
        .I3(tmp_product_i_84_n_17),
        .I4(orig_q1[12]),
        .I5(tmp_product__1_i_16_0[12]),
        .O(tmp_product_i_63_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_64
       (.I0(tmp_product__1_i_16_0[10]),
        .I1(orig_q1[10]),
        .I2(tmp_product_i_84_n_19),
        .I3(tmp_product_i_84_n_18),
        .I4(orig_q1[11]),
        .I5(tmp_product__1_i_16_0[11]),
        .O(tmp_product_i_64_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_65
       (.I0(tmp_product__1_i_16_0[9]),
        .I1(orig_q1[9]),
        .I2(tmp_product_i_84_n_20),
        .I3(tmp_product_i_84_n_19),
        .I4(orig_q1[10]),
        .I5(tmp_product__1_i_16_0[10]),
        .O(tmp_product_i_65_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_66
       (.I0(tmp_product__1_i_16_0[8]),
        .I1(orig_q1[8]),
        .I2(tmp_product_i_84_n_21),
        .I3(tmp_product_i_84_n_20),
        .I4(orig_q1[9]),
        .I5(tmp_product__1_i_16_0[9]),
        .O(tmp_product_i_66_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_67
       (.I0(tmp_product__1_i_16_0[7]),
        .I1(orig_q1[7]),
        .I2(tmp_product_i_85_n_14),
        .I3(tmp_product_i_84_n_21),
        .I4(orig_q1[8]),
        .I5(tmp_product__1_i_16_0[8]),
        .O(tmp_product_i_67_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_68
       (.I0(tmp_product_i_85_n_15),
        .I1(orig_q1[6]),
        .I2(tmp_product__1_i_16_0[6]),
        .O(tmp_product_i_68_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_69
       (.I0(tmp_product_i_85_n_16),
        .I1(orig_q1[5]),
        .I2(tmp_product__1_i_16_0[5]),
        .O(tmp_product_i_69_n_6));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_7
       (.I0(DSP_A_B_DATA_INST[25]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[25]),
        .O(grp_fu_380_p0[25]));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_70
       (.I0(tmp_product_i_85_n_17),
        .I1(orig_q1[4]),
        .I2(tmp_product__1_i_16_0[4]),
        .O(tmp_product_i_70_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_71
       (.I0(tmp_product_i_85_n_18),
        .I1(orig_q1[3]),
        .I2(tmp_product__1_i_16_0[3]),
        .O(tmp_product_i_71_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_72
       (.I0(tmp_product_i_85_n_19),
        .I1(orig_q1[2]),
        .I2(tmp_product__1_i_16_0[2]),
        .O(tmp_product_i_72_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_73
       (.I0(tmp_product_i_85_n_20),
        .I1(orig_q1[1]),
        .I2(tmp_product__1_i_16_0[1]),
        .O(tmp_product_i_73_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_74
       (.I0(orig_q1[0]),
        .I1(tmp_product_i_85_n_21),
        .I2(tmp_product__1_i_16_0[0]),
        .O(tmp_product_i_74_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_75
       (.I0(tmp_product__1_i_16_0[6]),
        .I1(orig_q1[6]),
        .I2(tmp_product_i_85_n_15),
        .I3(tmp_product_i_85_n_14),
        .I4(orig_q1[7]),
        .I5(tmp_product__1_i_16_0[7]),
        .O(tmp_product_i_75_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_76
       (.I0(tmp_product__1_i_16_0[5]),
        .I1(orig_q1[5]),
        .I2(tmp_product_i_85_n_16),
        .I3(tmp_product_i_85_n_15),
        .I4(orig_q1[6]),
        .I5(tmp_product__1_i_16_0[6]),
        .O(tmp_product_i_76_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_77
       (.I0(tmp_product__1_i_16_0[4]),
        .I1(orig_q1[4]),
        .I2(tmp_product_i_85_n_17),
        .I3(tmp_product_i_85_n_16),
        .I4(orig_q1[5]),
        .I5(tmp_product__1_i_16_0[5]),
        .O(tmp_product_i_77_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_78
       (.I0(tmp_product__1_i_16_0[3]),
        .I1(orig_q1[3]),
        .I2(tmp_product_i_85_n_18),
        .I3(tmp_product_i_85_n_17),
        .I4(orig_q1[4]),
        .I5(tmp_product__1_i_16_0[4]),
        .O(tmp_product_i_78_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_79
       (.I0(tmp_product__1_i_16_0[2]),
        .I1(orig_q1[2]),
        .I2(tmp_product_i_85_n_19),
        .I3(tmp_product_i_85_n_18),
        .I4(orig_q1[3]),
        .I5(tmp_product__1_i_16_0[3]),
        .O(tmp_product_i_79_n_6));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_8
       (.I0(DSP_A_B_DATA_INST[24]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[24]),
        .O(grp_fu_380_p0[24]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_80
       (.I0(tmp_product__1_i_16_0[1]),
        .I1(orig_q1[1]),
        .I2(tmp_product_i_85_n_20),
        .I3(tmp_product_i_85_n_19),
        .I4(orig_q1[2]),
        .I5(tmp_product__1_i_16_0[2]),
        .O(tmp_product_i_80_n_6));
  LUT4 #(
    .INIT(16'h6996)) 
    tmp_product_i_81
       (.I0(tmp_product_i_74_n_6),
        .I1(tmp_product_i_85_n_20),
        .I2(orig_q1[1]),
        .I3(tmp_product__1_i_16_0[1]),
        .O(tmp_product_i_81_n_6));
  LUT3 #(
    .INIT(8'h96)) 
    tmp_product_i_82
       (.I0(orig_q1[0]),
        .I1(tmp_product_i_85_n_21),
        .I2(tmp_product__1_i_16_0[0]),
        .O(tmp_product_i_82_n_6));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_83
       (.CI(tmp_product_i_84_n_6),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_83_n_6,tmp_product_i_83_n_7,tmp_product_i_83_n_8,tmp_product_i_83_n_9,tmp_product_i_83_n_10,tmp_product_i_83_n_11,tmp_product_i_83_n_12,tmp_product_i_83_n_13}),
        .DI({tmp_product_i_86_n_6,tmp_product_i_87_n_6,tmp_product_i_88_n_6,tmp_product_i_89_n_6,tmp_product_i_90_n_6,tmp_product_i_91_n_6,tmp_product_i_92_n_6,tmp_product_i_93_n_6}),
        .O({tmp_product_i_83_n_14,tmp_product_i_83_n_15,tmp_product_i_83_n_16,tmp_product_i_83_n_17,tmp_product_i_83_n_18,tmp_product_i_83_n_19,tmp_product_i_83_n_20,tmp_product_i_83_n_21}),
        .S({tmp_product_i_94_n_6,tmp_product_i_95_n_6,tmp_product_i_96_n_6,tmp_product_i_97_n_6,tmp_product_i_98_n_6,tmp_product_i_99_n_6,tmp_product_i_100_n_6,tmp_product_i_101_n_6}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_84
       (.CI(tmp_product_i_85_n_6),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_84_n_6,tmp_product_i_84_n_7,tmp_product_i_84_n_8,tmp_product_i_84_n_9,tmp_product_i_84_n_10,tmp_product_i_84_n_11,tmp_product_i_84_n_12,tmp_product_i_84_n_13}),
        .DI({tmp_product_i_102_n_6,tmp_product_i_103_n_6,tmp_product_i_104_n_6,tmp_product_i_105_n_6,tmp_product_i_106_n_6,tmp_product_i_107_n_6,tmp_product_i_108_n_6,tmp_product_i_109_n_6}),
        .O({tmp_product_i_84_n_14,tmp_product_i_84_n_15,tmp_product_i_84_n_16,tmp_product_i_84_n_17,tmp_product_i_84_n_18,tmp_product_i_84_n_19,tmp_product_i_84_n_20,tmp_product_i_84_n_21}),
        .S({tmp_product_i_110_n_6,tmp_product_i_111_n_6,tmp_product_i_112_n_6,tmp_product_i_113_n_6,tmp_product_i_114_n_6,tmp_product_i_115_n_6,tmp_product_i_116_n_6,tmp_product_i_117_n_6}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_i_85
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_85_n_6,tmp_product_i_85_n_7,tmp_product_i_85_n_8,tmp_product_i_85_n_9,tmp_product_i_85_n_10,tmp_product_i_85_n_11,tmp_product_i_85_n_12,tmp_product_i_85_n_13}),
        .DI({tmp_product_i_118_n_6,tmp_product_i_119_n_6,tmp_product_i_120_n_6,tmp_product_i_121_n_6,tmp_product_i_122_n_6,tmp_product_i_123_n_6,tmp_product_i_124_n_6,1'b0}),
        .O({tmp_product_i_85_n_14,tmp_product_i_85_n_15,tmp_product_i_85_n_16,tmp_product_i_85_n_17,tmp_product_i_85_n_18,tmp_product_i_85_n_19,tmp_product_i_85_n_20,tmp_product_i_85_n_21}),
        .S({tmp_product_i_125_n_6,tmp_product_i_126_n_6,tmp_product_i_127_n_6,tmp_product_i_128_n_6,tmp_product_i_129_n_6,tmp_product_i_130_n_6,tmp_product_i_131_n_6,tmp_product_i_132_n_6}));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_86
       (.I0(Q[22]),
        .I1(orig_q0[22]),
        .I2(tmp_product__1_i_32_0[22]),
        .O(tmp_product_i_86_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_87
       (.I0(Q[21]),
        .I1(orig_q0[21]),
        .I2(tmp_product__1_i_32_0[21]),
        .O(tmp_product_i_87_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_88
       (.I0(Q[20]),
        .I1(orig_q0[20]),
        .I2(tmp_product__1_i_32_0[20]),
        .O(tmp_product_i_88_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_89
       (.I0(Q[19]),
        .I1(orig_q0[19]),
        .I2(tmp_product__1_i_32_0[19]),
        .O(tmp_product_i_89_n_6));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    tmp_product_i_9
       (.I0(DSP_A_B_DATA_INST[23]),
        .I1(DSP_A_B_DATA_INST_0),
        .I2(orig_q1[23]),
        .O(grp_fu_380_p0[23]));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_90
       (.I0(Q[18]),
        .I1(orig_q0[18]),
        .I2(tmp_product__1_i_32_0[18]),
        .O(tmp_product_i_90_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_91
       (.I0(Q[17]),
        .I1(orig_q0[17]),
        .I2(tmp_product__1_i_32_0[17]),
        .O(tmp_product_i_91_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_92
       (.I0(Q[16]),
        .I1(orig_q0[16]),
        .I2(tmp_product__1_i_32_0[16]),
        .O(tmp_product_i_92_n_6));
  LUT3 #(
    .INIT(8'hE8)) 
    tmp_product_i_93
       (.I0(Q[15]),
        .I1(orig_q0[15]),
        .I2(tmp_product__1_i_32_0[15]),
        .O(tmp_product_i_93_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_94
       (.I0(tmp_product__1_i_32_0[22]),
        .I1(orig_q0[22]),
        .I2(Q[22]),
        .I3(Q[23]),
        .I4(orig_q0[23]),
        .I5(tmp_product__1_i_32_0[23]),
        .O(tmp_product_i_94_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_95
       (.I0(tmp_product__1_i_32_0[21]),
        .I1(orig_q0[21]),
        .I2(Q[21]),
        .I3(Q[22]),
        .I4(orig_q0[22]),
        .I5(tmp_product__1_i_32_0[22]),
        .O(tmp_product_i_95_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_96
       (.I0(tmp_product__1_i_32_0[20]),
        .I1(orig_q0[20]),
        .I2(Q[20]),
        .I3(Q[21]),
        .I4(orig_q0[21]),
        .I5(tmp_product__1_i_32_0[21]),
        .O(tmp_product_i_96_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_97
       (.I0(tmp_product__1_i_32_0[19]),
        .I1(orig_q0[19]),
        .I2(Q[19]),
        .I3(Q[20]),
        .I4(orig_q0[20]),
        .I5(tmp_product__1_i_32_0[20]),
        .O(tmp_product_i_97_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_98
       (.I0(tmp_product__1_i_32_0[18]),
        .I1(orig_q0[18]),
        .I2(Q[18]),
        .I3(Q[19]),
        .I4(orig_q0[19]),
        .I5(tmp_product__1_i_32_0[19]),
        .O(tmp_product_i_98_n_6));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    tmp_product_i_99
       (.I0(tmp_product__1_i_32_0[17]),
        .I1(orig_q0[17]),
        .I2(Q[17]),
        .I3(Q[18]),
        .I4(orig_q0[18]),
        .I5(tmp_product__1_i_32_0[18]),
        .O(tmp_product_i_99_n_6));
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
