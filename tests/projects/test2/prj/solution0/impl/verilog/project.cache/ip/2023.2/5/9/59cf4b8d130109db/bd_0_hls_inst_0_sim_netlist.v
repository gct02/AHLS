// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jul 19 17:15:22 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_sim_netlist.v
// Design      : bd_0_hls_inst_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,top_fn,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "top_fn,Vivado 2023.2" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (in_arr_ce0,
    out_arr_ce0,
    out_arr_we0,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    in_arr_address0,
    in_arr_q0,
    out_arr_address0,
    out_arr_d0,
    out_arr_q0);
  output in_arr_ce0;
  output out_arr_ce0;
  output out_arr_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 in_arr_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_arr_address0, LAYERED_METADATA undef" *) output [6:0]in_arr_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 in_arr_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_arr_q0, LAYERED_METADATA undef" *) input [31:0]in_arr_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_arr_address0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_arr_address0, LAYERED_METADATA undef" *) output [6:0]out_arr_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_arr_d0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_arr_d0, LAYERED_METADATA undef" *) output [31:0]out_arr_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_arr_q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_arr_q0, LAYERED_METADATA undef" *) input [31:0]out_arr_q0;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [6:0]in_arr_address0;
  wire in_arr_ce0;
  wire [31:0]in_arr_q0;
  wire [6:0]out_arr_address0;
  wire out_arr_ce0;
  wire [31:0]out_arr_d0;
  wire [31:0]out_arr_q0;
  wire out_arr_we0;

  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "6'b000001" *) 
  (* ap_ST_fsm_state2 = "6'b000010" *) 
  (* ap_ST_fsm_state3 = "6'b000100" *) 
  (* ap_ST_fsm_state4 = "6'b001000" *) 
  (* ap_ST_fsm_state5 = "6'b010000" *) 
  (* ap_ST_fsm_state6 = "6'b100000" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_top_fn inst
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .in_arr_address0(in_arr_address0),
        .in_arr_ce0(in_arr_ce0),
        .in_arr_q0(in_arr_q0),
        .out_arr_address0(out_arr_address0),
        .out_arr_ce0(out_arr_ce0),
        .out_arr_d0(out_arr_d0),
        .out_arr_q0(out_arr_q0),
        .out_arr_we0(out_arr_we0));
endmodule

(* ap_ST_fsm_state1 = "6'b000001" *) (* ap_ST_fsm_state2 = "6'b000010" *) (* ap_ST_fsm_state3 = "6'b000100" *) 
(* ap_ST_fsm_state4 = "6'b001000" *) (* ap_ST_fsm_state5 = "6'b010000" *) (* ap_ST_fsm_state6 = "6'b100000" *) 
(* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_top_fn
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    in_arr_address0,
    in_arr_ce0,
    in_arr_q0,
    out_arr_address0,
    out_arr_ce0,
    out_arr_we0,
    out_arr_d0,
    out_arr_q0);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [6:0]in_arr_address0;
  output in_arr_ce0;
  input [31:0]in_arr_q0;
  output [6:0]out_arr_address0;
  output out_arr_ce0;
  output out_arr_we0;
  output [31:0]out_arr_d0;
  input [31:0]out_arr_q0;

  wire [6:0]add_ln20_fu_116_p2;
  wire [6:0]add_ln20_reg_164;
  wire \add_ln20_reg_164[6]_i_2_n_0 ;
  wire [6:0]add_ln24_fu_133_p2;
  wire [6:0]add_ln24_reg_182;
  wire \add_ln24_reg_182[6]_i_2_n_0 ;
  wire \ap_CS_fsm[3]_i_1_n_0 ;
  wire \ap_CS_fsm[5]_i_1_n_0 ;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire ap_CS_fsm_state6;
  wire [4:0]ap_NS_fsm;
  wire ap_NS_fsm10_out;
  wire ap_NS_fsm11_out;
  wire ap_clk;
  wire ap_idle;
  wire ap_ready;
  wire ap_ready_INST_0_i_1_n_0;
  wire ap_rst;
  wire ap_start;
  wire \empty_reg_85[0]_i_10_n_0 ;
  wire \empty_reg_85[0]_i_11_n_0 ;
  wire \empty_reg_85[0]_i_12_n_0 ;
  wire \empty_reg_85[0]_i_13_n_0 ;
  wire \empty_reg_85[0]_i_14_n_0 ;
  wire \empty_reg_85[0]_i_15_n_0 ;
  wire \empty_reg_85[0]_i_16_n_0 ;
  wire \empty_reg_85[0]_i_17_n_0 ;
  wire \empty_reg_85[0]_i_2_n_0 ;
  wire \empty_reg_85[0]_i_3_n_0 ;
  wire \empty_reg_85[0]_i_4_n_0 ;
  wire \empty_reg_85[0]_i_5_n_0 ;
  wire \empty_reg_85[0]_i_6_n_0 ;
  wire \empty_reg_85[0]_i_7_n_0 ;
  wire \empty_reg_85[0]_i_8_n_0 ;
  wire \empty_reg_85[0]_i_9_n_0 ;
  wire \empty_reg_85[16]_i_10_n_0 ;
  wire \empty_reg_85[16]_i_11_n_0 ;
  wire \empty_reg_85[16]_i_12_n_0 ;
  wire \empty_reg_85[16]_i_13_n_0 ;
  wire \empty_reg_85[16]_i_14_n_0 ;
  wire \empty_reg_85[16]_i_15_n_0 ;
  wire \empty_reg_85[16]_i_16_n_0 ;
  wire \empty_reg_85[16]_i_17_n_0 ;
  wire \empty_reg_85[16]_i_2_n_0 ;
  wire \empty_reg_85[16]_i_3_n_0 ;
  wire \empty_reg_85[16]_i_4_n_0 ;
  wire \empty_reg_85[16]_i_5_n_0 ;
  wire \empty_reg_85[16]_i_6_n_0 ;
  wire \empty_reg_85[16]_i_7_n_0 ;
  wire \empty_reg_85[16]_i_8_n_0 ;
  wire \empty_reg_85[16]_i_9_n_0 ;
  wire \empty_reg_85[24]_i_10_n_0 ;
  wire \empty_reg_85[24]_i_11_n_0 ;
  wire \empty_reg_85[24]_i_12_n_0 ;
  wire \empty_reg_85[24]_i_13_n_0 ;
  wire \empty_reg_85[24]_i_14_n_0 ;
  wire \empty_reg_85[24]_i_15_n_0 ;
  wire \empty_reg_85[24]_i_16_n_0 ;
  wire \empty_reg_85[24]_i_2_n_0 ;
  wire \empty_reg_85[24]_i_3_n_0 ;
  wire \empty_reg_85[24]_i_4_n_0 ;
  wire \empty_reg_85[24]_i_5_n_0 ;
  wire \empty_reg_85[24]_i_6_n_0 ;
  wire \empty_reg_85[24]_i_7_n_0 ;
  wire \empty_reg_85[24]_i_8_n_0 ;
  wire \empty_reg_85[24]_i_9_n_0 ;
  wire \empty_reg_85[8]_i_10_n_0 ;
  wire \empty_reg_85[8]_i_11_n_0 ;
  wire \empty_reg_85[8]_i_12_n_0 ;
  wire \empty_reg_85[8]_i_13_n_0 ;
  wire \empty_reg_85[8]_i_14_n_0 ;
  wire \empty_reg_85[8]_i_15_n_0 ;
  wire \empty_reg_85[8]_i_16_n_0 ;
  wire \empty_reg_85[8]_i_17_n_0 ;
  wire \empty_reg_85[8]_i_2_n_0 ;
  wire \empty_reg_85[8]_i_3_n_0 ;
  wire \empty_reg_85[8]_i_4_n_0 ;
  wire \empty_reg_85[8]_i_5_n_0 ;
  wire \empty_reg_85[8]_i_6_n_0 ;
  wire \empty_reg_85[8]_i_7_n_0 ;
  wire \empty_reg_85[8]_i_8_n_0 ;
  wire \empty_reg_85[8]_i_9_n_0 ;
  wire [31:0]empty_reg_85_reg;
  wire \empty_reg_85_reg[0]_i_1_n_0 ;
  wire \empty_reg_85_reg[0]_i_1_n_1 ;
  wire \empty_reg_85_reg[0]_i_1_n_10 ;
  wire \empty_reg_85_reg[0]_i_1_n_11 ;
  wire \empty_reg_85_reg[0]_i_1_n_12 ;
  wire \empty_reg_85_reg[0]_i_1_n_13 ;
  wire \empty_reg_85_reg[0]_i_1_n_14 ;
  wire \empty_reg_85_reg[0]_i_1_n_15 ;
  wire \empty_reg_85_reg[0]_i_1_n_2 ;
  wire \empty_reg_85_reg[0]_i_1_n_3 ;
  wire \empty_reg_85_reg[0]_i_1_n_4 ;
  wire \empty_reg_85_reg[0]_i_1_n_5 ;
  wire \empty_reg_85_reg[0]_i_1_n_6 ;
  wire \empty_reg_85_reg[0]_i_1_n_7 ;
  wire \empty_reg_85_reg[0]_i_1_n_8 ;
  wire \empty_reg_85_reg[0]_i_1_n_9 ;
  wire \empty_reg_85_reg[16]_i_1_n_0 ;
  wire \empty_reg_85_reg[16]_i_1_n_1 ;
  wire \empty_reg_85_reg[16]_i_1_n_10 ;
  wire \empty_reg_85_reg[16]_i_1_n_11 ;
  wire \empty_reg_85_reg[16]_i_1_n_12 ;
  wire \empty_reg_85_reg[16]_i_1_n_13 ;
  wire \empty_reg_85_reg[16]_i_1_n_14 ;
  wire \empty_reg_85_reg[16]_i_1_n_15 ;
  wire \empty_reg_85_reg[16]_i_1_n_2 ;
  wire \empty_reg_85_reg[16]_i_1_n_3 ;
  wire \empty_reg_85_reg[16]_i_1_n_4 ;
  wire \empty_reg_85_reg[16]_i_1_n_5 ;
  wire \empty_reg_85_reg[16]_i_1_n_6 ;
  wire \empty_reg_85_reg[16]_i_1_n_7 ;
  wire \empty_reg_85_reg[16]_i_1_n_8 ;
  wire \empty_reg_85_reg[16]_i_1_n_9 ;
  wire \empty_reg_85_reg[24]_i_1_n_1 ;
  wire \empty_reg_85_reg[24]_i_1_n_10 ;
  wire \empty_reg_85_reg[24]_i_1_n_11 ;
  wire \empty_reg_85_reg[24]_i_1_n_12 ;
  wire \empty_reg_85_reg[24]_i_1_n_13 ;
  wire \empty_reg_85_reg[24]_i_1_n_14 ;
  wire \empty_reg_85_reg[24]_i_1_n_15 ;
  wire \empty_reg_85_reg[24]_i_1_n_2 ;
  wire \empty_reg_85_reg[24]_i_1_n_3 ;
  wire \empty_reg_85_reg[24]_i_1_n_4 ;
  wire \empty_reg_85_reg[24]_i_1_n_5 ;
  wire \empty_reg_85_reg[24]_i_1_n_6 ;
  wire \empty_reg_85_reg[24]_i_1_n_7 ;
  wire \empty_reg_85_reg[24]_i_1_n_8 ;
  wire \empty_reg_85_reg[24]_i_1_n_9 ;
  wire \empty_reg_85_reg[8]_i_1_n_0 ;
  wire \empty_reg_85_reg[8]_i_1_n_1 ;
  wire \empty_reg_85_reg[8]_i_1_n_10 ;
  wire \empty_reg_85_reg[8]_i_1_n_11 ;
  wire \empty_reg_85_reg[8]_i_1_n_12 ;
  wire \empty_reg_85_reg[8]_i_1_n_13 ;
  wire \empty_reg_85_reg[8]_i_1_n_14 ;
  wire \empty_reg_85_reg[8]_i_1_n_15 ;
  wire \empty_reg_85_reg[8]_i_1_n_2 ;
  wire \empty_reg_85_reg[8]_i_1_n_3 ;
  wire \empty_reg_85_reg[8]_i_1_n_4 ;
  wire \empty_reg_85_reg[8]_i_1_n_5 ;
  wire \empty_reg_85_reg[8]_i_1_n_6 ;
  wire \empty_reg_85_reg[8]_i_1_n_7 ;
  wire \empty_reg_85_reg[8]_i_1_n_8 ;
  wire \empty_reg_85_reg[8]_i_1_n_9 ;
  wire grp_init_arr_fu_96_ap_start_reg;
  wire grp_init_arr_fu_96_n_12;
  wire [6:0]i_fu_44;
  wire [6:0]in_arr_address0;
  wire in_arr_ce0;
  wire [31:0]in_arr_q0;
  wire [6:0]out_arr_addr_reg_169;
  wire [6:0]out_arr_address0;
  wire out_arr_ce0;
  wire [31:0]out_arr_d0;
  wire [31:0]out_arr_q0;
  wire out_arr_we0;
  wire [7:7]\NLW_empty_reg_85_reg[24]_i_1_CO_UNCONNECTED ;

  assign ap_done = ap_ready;
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln20_reg_164[0]_i_1 
       (.I0(i_fu_44[0]),
        .O(add_ln20_fu_116_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln20_reg_164[1]_i_1 
       (.I0(i_fu_44[0]),
        .I1(i_fu_44[1]),
        .O(add_ln20_fu_116_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \add_ln20_reg_164[2]_i_1 
       (.I0(i_fu_44[0]),
        .I1(i_fu_44[1]),
        .I2(i_fu_44[2]),
        .O(add_ln20_fu_116_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \add_ln20_reg_164[3]_i_1 
       (.I0(i_fu_44[1]),
        .I1(i_fu_44[0]),
        .I2(i_fu_44[2]),
        .I3(i_fu_44[3]),
        .O(add_ln20_fu_116_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \add_ln20_reg_164[4]_i_1 
       (.I0(i_fu_44[2]),
        .I1(i_fu_44[0]),
        .I2(i_fu_44[1]),
        .I3(i_fu_44[3]),
        .I4(i_fu_44[4]),
        .O(add_ln20_fu_116_p2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \add_ln20_reg_164[5]_i_1 
       (.I0(i_fu_44[3]),
        .I1(i_fu_44[1]),
        .I2(i_fu_44[0]),
        .I3(i_fu_44[2]),
        .I4(i_fu_44[4]),
        .I5(i_fu_44[5]),
        .O(add_ln20_fu_116_p2[5]));
  LUT3 #(
    .INIT(8'h78)) 
    \add_ln20_reg_164[6]_i_1 
       (.I0(\add_ln20_reg_164[6]_i_2_n_0 ),
        .I1(i_fu_44[5]),
        .I2(i_fu_44[6]),
        .O(add_ln20_fu_116_p2[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \add_ln20_reg_164[6]_i_2 
       (.I0(i_fu_44[4]),
        .I1(i_fu_44[2]),
        .I2(i_fu_44[0]),
        .I3(i_fu_44[1]),
        .I4(i_fu_44[3]),
        .O(\add_ln20_reg_164[6]_i_2_n_0 ));
  FDRE \add_ln20_reg_164_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[0]),
        .Q(add_ln20_reg_164[0]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[1]),
        .Q(add_ln20_reg_164[1]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[2]),
        .Q(add_ln20_reg_164[2]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[3]),
        .Q(add_ln20_reg_164[3]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[4]),
        .Q(add_ln20_reg_164[4]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[5]),
        .Q(add_ln20_reg_164[5]),
        .R(1'b0));
  FDRE \add_ln20_reg_164_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(add_ln20_fu_116_p2[6]),
        .Q(add_ln20_reg_164[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \add_ln24_reg_182[0]_i_1 
       (.I0(in_arr_address0[0]),
        .O(add_ln24_fu_133_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \add_ln24_reg_182[1]_i_1 
       (.I0(in_arr_address0[0]),
        .I1(in_arr_address0[1]),
        .O(add_ln24_fu_133_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \add_ln24_reg_182[2]_i_1 
       (.I0(in_arr_address0[0]),
        .I1(in_arr_address0[1]),
        .I2(in_arr_address0[2]),
        .O(add_ln24_fu_133_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \add_ln24_reg_182[3]_i_1 
       (.I0(in_arr_address0[1]),
        .I1(in_arr_address0[0]),
        .I2(in_arr_address0[2]),
        .I3(in_arr_address0[3]),
        .O(add_ln24_fu_133_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \add_ln24_reg_182[4]_i_1 
       (.I0(in_arr_address0[2]),
        .I1(in_arr_address0[0]),
        .I2(in_arr_address0[1]),
        .I3(in_arr_address0[3]),
        .I4(in_arr_address0[4]),
        .O(add_ln24_fu_133_p2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \add_ln24_reg_182[5]_i_1 
       (.I0(in_arr_address0[3]),
        .I1(in_arr_address0[1]),
        .I2(in_arr_address0[0]),
        .I3(in_arr_address0[2]),
        .I4(in_arr_address0[4]),
        .I5(in_arr_address0[5]),
        .O(add_ln24_fu_133_p2[5]));
  LUT3 #(
    .INIT(8'h78)) 
    \add_ln24_reg_182[6]_i_1 
       (.I0(\add_ln24_reg_182[6]_i_2_n_0 ),
        .I1(in_arr_address0[5]),
        .I2(in_arr_address0[6]),
        .O(add_ln24_fu_133_p2[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \add_ln24_reg_182[6]_i_2 
       (.I0(in_arr_address0[4]),
        .I1(in_arr_address0[2]),
        .I2(in_arr_address0[0]),
        .I3(in_arr_address0[1]),
        .I4(in_arr_address0[3]),
        .O(\add_ln24_reg_182[6]_i_2_n_0 ));
  FDRE \add_ln24_reg_182_reg[0] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[0]),
        .Q(add_ln24_reg_182[0]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[1] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[1]),
        .Q(add_ln24_reg_182[1]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[2] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[2]),
        .Q(add_ln24_reg_182[2]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[3] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[3]),
        .Q(add_ln24_reg_182[3]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[4] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[4]),
        .Q(add_ln24_reg_182[4]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[5] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[5]),
        .Q(add_ln24_reg_182[5]),
        .R(1'b0));
  FDRE \add_ln24_reg_182_reg[6] 
       (.C(ap_clk),
        .CE(in_arr_ce0),
        .D(add_ln24_fu_133_p2[6]),
        .Q(add_ln24_reg_182[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF222)) 
    \ap_CS_fsm[0]_i_1__0 
       (.I0(\ap_CS_fsm_reg_n_0_[0] ),
        .I1(ap_start),
        .I2(ap_ready),
        .I3(ap_CS_fsm_state3),
        .O(ap_NS_fsm[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(ap_CS_fsm_state3),
        .I1(ap_ready),
        .O(\ap_CS_fsm[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \ap_CS_fsm[4]_i_1 
       (.I0(ap_CS_fsm_state4),
        .I1(ap_CS_fsm_state6),
        .O(ap_NS_fsm[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ap_CS_fsm[5]_i_1 
       (.I0(in_arr_ce0),
        .I1(ap_NS_fsm11_out),
        .O(\ap_CS_fsm[5]_i_1_n_0 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
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
        .D(\ap_CS_fsm[3]_i_1_n_0 ),
        .Q(ap_CS_fsm_state4),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[4]),
        .Q(in_arr_ce0),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[5]_i_1_n_0 ),
        .Q(ap_CS_fsm_state6),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_0_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    ap_ready_INST_0
       (.I0(ap_ready_INST_0_i_1_n_0),
        .I1(i_fu_44[6]),
        .I2(i_fu_44[0]),
        .I3(i_fu_44[1]),
        .I4(ap_CS_fsm_state3),
        .O(ap_ready));
  LUT4 #(
    .INIT(16'hEFFF)) 
    ap_ready_INST_0_i_1
       (.I0(i_fu_44[3]),
        .I1(i_fu_44[4]),
        .I2(i_fu_44[2]),
        .I3(i_fu_44[5]),
        .O(ap_ready_INST_0_i_1_n_0));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_10 
       (.I0(in_arr_q0[7]),
        .I1(empty_reg_85_reg[7]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[7]),
        .O(\empty_reg_85[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_11 
       (.I0(in_arr_q0[6]),
        .I1(empty_reg_85_reg[6]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[6]),
        .O(\empty_reg_85[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_12 
       (.I0(in_arr_q0[5]),
        .I1(empty_reg_85_reg[5]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[5]),
        .O(\empty_reg_85[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_13 
       (.I0(in_arr_q0[4]),
        .I1(empty_reg_85_reg[4]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[4]),
        .O(\empty_reg_85[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_14 
       (.I0(in_arr_q0[3]),
        .I1(empty_reg_85_reg[3]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[3]),
        .O(\empty_reg_85[0]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_15 
       (.I0(in_arr_q0[2]),
        .I1(empty_reg_85_reg[2]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[2]),
        .O(\empty_reg_85[0]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_16 
       (.I0(in_arr_q0[1]),
        .I1(empty_reg_85_reg[1]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[1]),
        .O(\empty_reg_85[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[0]_i_17 
       (.I0(in_arr_q0[0]),
        .I1(empty_reg_85_reg[0]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[0]),
        .O(\empty_reg_85[0]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_2 
       (.I0(in_arr_q0[7]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_3 
       (.I0(in_arr_q0[6]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_4 
       (.I0(in_arr_q0[5]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_5 
       (.I0(in_arr_q0[4]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_6 
       (.I0(in_arr_q0[3]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_7 
       (.I0(in_arr_q0[2]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_8 
       (.I0(in_arr_q0[1]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[0]_i_9 
       (.I0(in_arr_q0[0]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[0]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_10 
       (.I0(in_arr_q0[23]),
        .I1(empty_reg_85_reg[23]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[23]),
        .O(\empty_reg_85[16]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_11 
       (.I0(in_arr_q0[22]),
        .I1(empty_reg_85_reg[22]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[22]),
        .O(\empty_reg_85[16]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_12 
       (.I0(in_arr_q0[21]),
        .I1(empty_reg_85_reg[21]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[21]),
        .O(\empty_reg_85[16]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_13 
       (.I0(in_arr_q0[20]),
        .I1(empty_reg_85_reg[20]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[20]),
        .O(\empty_reg_85[16]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_14 
       (.I0(in_arr_q0[19]),
        .I1(empty_reg_85_reg[19]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[19]),
        .O(\empty_reg_85[16]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_15 
       (.I0(in_arr_q0[18]),
        .I1(empty_reg_85_reg[18]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[18]),
        .O(\empty_reg_85[16]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_16 
       (.I0(in_arr_q0[17]),
        .I1(empty_reg_85_reg[17]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[17]),
        .O(\empty_reg_85[16]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[16]_i_17 
       (.I0(in_arr_q0[16]),
        .I1(empty_reg_85_reg[16]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[16]),
        .O(\empty_reg_85[16]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_2 
       (.I0(in_arr_q0[23]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_3 
       (.I0(in_arr_q0[22]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_4 
       (.I0(in_arr_q0[21]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_5 
       (.I0(in_arr_q0[20]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_6 
       (.I0(in_arr_q0[19]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_7 
       (.I0(in_arr_q0[18]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_8 
       (.I0(in_arr_q0[17]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[16]_i_9 
       (.I0(in_arr_q0[16]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[16]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_10 
       (.I0(in_arr_q0[30]),
        .I1(empty_reg_85_reg[30]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[30]),
        .O(\empty_reg_85[24]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_11 
       (.I0(in_arr_q0[29]),
        .I1(empty_reg_85_reg[29]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[29]),
        .O(\empty_reg_85[24]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_12 
       (.I0(in_arr_q0[28]),
        .I1(empty_reg_85_reg[28]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[28]),
        .O(\empty_reg_85[24]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_13 
       (.I0(in_arr_q0[27]),
        .I1(empty_reg_85_reg[27]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[27]),
        .O(\empty_reg_85[24]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_14 
       (.I0(in_arr_q0[26]),
        .I1(empty_reg_85_reg[26]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[26]),
        .O(\empty_reg_85[24]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_15 
       (.I0(in_arr_q0[25]),
        .I1(empty_reg_85_reg[25]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[25]),
        .O(\empty_reg_85[24]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_16 
       (.I0(in_arr_q0[24]),
        .I1(empty_reg_85_reg[24]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[24]),
        .O(\empty_reg_85[24]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_2 
       (.I0(in_arr_q0[30]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_3 
       (.I0(in_arr_q0[29]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_4 
       (.I0(in_arr_q0[28]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_5 
       (.I0(in_arr_q0[27]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_6 
       (.I0(in_arr_q0[26]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_7 
       (.I0(in_arr_q0[25]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[24]_i_8 
       (.I0(in_arr_q0[24]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[24]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[24]_i_9 
       (.I0(in_arr_q0[31]),
        .I1(empty_reg_85_reg[31]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[31]),
        .O(\empty_reg_85[24]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_10 
       (.I0(in_arr_q0[15]),
        .I1(empty_reg_85_reg[15]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[15]),
        .O(\empty_reg_85[8]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_11 
       (.I0(in_arr_q0[14]),
        .I1(empty_reg_85_reg[14]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[14]),
        .O(\empty_reg_85[8]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_12 
       (.I0(in_arr_q0[13]),
        .I1(empty_reg_85_reg[13]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[13]),
        .O(\empty_reg_85[8]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_13 
       (.I0(in_arr_q0[12]),
        .I1(empty_reg_85_reg[12]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[12]),
        .O(\empty_reg_85[8]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_14 
       (.I0(in_arr_q0[11]),
        .I1(empty_reg_85_reg[11]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[11]),
        .O(\empty_reg_85[8]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_15 
       (.I0(in_arr_q0[10]),
        .I1(empty_reg_85_reg[10]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[10]),
        .O(\empty_reg_85[8]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_16 
       (.I0(in_arr_q0[9]),
        .I1(empty_reg_85_reg[9]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[9]),
        .O(\empty_reg_85[8]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \empty_reg_85[8]_i_17 
       (.I0(in_arr_q0[8]),
        .I1(empty_reg_85_reg[8]),
        .I2(ap_CS_fsm_state4),
        .I3(out_arr_q0[8]),
        .O(\empty_reg_85[8]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_2 
       (.I0(in_arr_q0[15]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_3 
       (.I0(in_arr_q0[14]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_4 
       (.I0(in_arr_q0[13]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_5 
       (.I0(in_arr_q0[12]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_6 
       (.I0(in_arr_q0[11]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_7 
       (.I0(in_arr_q0[10]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_8 
       (.I0(in_arr_q0[9]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \empty_reg_85[8]_i_9 
       (.I0(in_arr_q0[8]),
        .I1(ap_CS_fsm_state4),
        .O(\empty_reg_85[8]_i_9_n_0 ));
  FDRE \empty_reg_85_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_15 ),
        .Q(empty_reg_85_reg[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \empty_reg_85_reg[0]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\empty_reg_85_reg[0]_i_1_n_0 ,\empty_reg_85_reg[0]_i_1_n_1 ,\empty_reg_85_reg[0]_i_1_n_2 ,\empty_reg_85_reg[0]_i_1_n_3 ,\empty_reg_85_reg[0]_i_1_n_4 ,\empty_reg_85_reg[0]_i_1_n_5 ,\empty_reg_85_reg[0]_i_1_n_6 ,\empty_reg_85_reg[0]_i_1_n_7 }),
        .DI({\empty_reg_85[0]_i_2_n_0 ,\empty_reg_85[0]_i_3_n_0 ,\empty_reg_85[0]_i_4_n_0 ,\empty_reg_85[0]_i_5_n_0 ,\empty_reg_85[0]_i_6_n_0 ,\empty_reg_85[0]_i_7_n_0 ,\empty_reg_85[0]_i_8_n_0 ,\empty_reg_85[0]_i_9_n_0 }),
        .O({\empty_reg_85_reg[0]_i_1_n_8 ,\empty_reg_85_reg[0]_i_1_n_9 ,\empty_reg_85_reg[0]_i_1_n_10 ,\empty_reg_85_reg[0]_i_1_n_11 ,\empty_reg_85_reg[0]_i_1_n_12 ,\empty_reg_85_reg[0]_i_1_n_13 ,\empty_reg_85_reg[0]_i_1_n_14 ,\empty_reg_85_reg[0]_i_1_n_15 }),
        .S({\empty_reg_85[0]_i_10_n_0 ,\empty_reg_85[0]_i_11_n_0 ,\empty_reg_85[0]_i_12_n_0 ,\empty_reg_85[0]_i_13_n_0 ,\empty_reg_85[0]_i_14_n_0 ,\empty_reg_85[0]_i_15_n_0 ,\empty_reg_85[0]_i_16_n_0 ,\empty_reg_85[0]_i_17_n_0 }));
  FDRE \empty_reg_85_reg[10] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_13 ),
        .Q(empty_reg_85_reg[10]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[11] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_12 ),
        .Q(empty_reg_85_reg[11]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[12] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_11 ),
        .Q(empty_reg_85_reg[12]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[13] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_10 ),
        .Q(empty_reg_85_reg[13]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[14] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_9 ),
        .Q(empty_reg_85_reg[14]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[15] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_8 ),
        .Q(empty_reg_85_reg[15]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[16] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_15 ),
        .Q(empty_reg_85_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \empty_reg_85_reg[16]_i_1 
       (.CI(\empty_reg_85_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\empty_reg_85_reg[16]_i_1_n_0 ,\empty_reg_85_reg[16]_i_1_n_1 ,\empty_reg_85_reg[16]_i_1_n_2 ,\empty_reg_85_reg[16]_i_1_n_3 ,\empty_reg_85_reg[16]_i_1_n_4 ,\empty_reg_85_reg[16]_i_1_n_5 ,\empty_reg_85_reg[16]_i_1_n_6 ,\empty_reg_85_reg[16]_i_1_n_7 }),
        .DI({\empty_reg_85[16]_i_2_n_0 ,\empty_reg_85[16]_i_3_n_0 ,\empty_reg_85[16]_i_4_n_0 ,\empty_reg_85[16]_i_5_n_0 ,\empty_reg_85[16]_i_6_n_0 ,\empty_reg_85[16]_i_7_n_0 ,\empty_reg_85[16]_i_8_n_0 ,\empty_reg_85[16]_i_9_n_0 }),
        .O({\empty_reg_85_reg[16]_i_1_n_8 ,\empty_reg_85_reg[16]_i_1_n_9 ,\empty_reg_85_reg[16]_i_1_n_10 ,\empty_reg_85_reg[16]_i_1_n_11 ,\empty_reg_85_reg[16]_i_1_n_12 ,\empty_reg_85_reg[16]_i_1_n_13 ,\empty_reg_85_reg[16]_i_1_n_14 ,\empty_reg_85_reg[16]_i_1_n_15 }),
        .S({\empty_reg_85[16]_i_10_n_0 ,\empty_reg_85[16]_i_11_n_0 ,\empty_reg_85[16]_i_12_n_0 ,\empty_reg_85[16]_i_13_n_0 ,\empty_reg_85[16]_i_14_n_0 ,\empty_reg_85[16]_i_15_n_0 ,\empty_reg_85[16]_i_16_n_0 ,\empty_reg_85[16]_i_17_n_0 }));
  FDRE \empty_reg_85_reg[17] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_14 ),
        .Q(empty_reg_85_reg[17]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[18] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_13 ),
        .Q(empty_reg_85_reg[18]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[19] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_12 ),
        .Q(empty_reg_85_reg[19]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_14 ),
        .Q(empty_reg_85_reg[1]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[20] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_11 ),
        .Q(empty_reg_85_reg[20]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[21] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_10 ),
        .Q(empty_reg_85_reg[21]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[22] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_9 ),
        .Q(empty_reg_85_reg[22]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[23] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[16]_i_1_n_8 ),
        .Q(empty_reg_85_reg[23]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[24] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_15 ),
        .Q(empty_reg_85_reg[24]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \empty_reg_85_reg[24]_i_1 
       (.CI(\empty_reg_85_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_empty_reg_85_reg[24]_i_1_CO_UNCONNECTED [7],\empty_reg_85_reg[24]_i_1_n_1 ,\empty_reg_85_reg[24]_i_1_n_2 ,\empty_reg_85_reg[24]_i_1_n_3 ,\empty_reg_85_reg[24]_i_1_n_4 ,\empty_reg_85_reg[24]_i_1_n_5 ,\empty_reg_85_reg[24]_i_1_n_6 ,\empty_reg_85_reg[24]_i_1_n_7 }),
        .DI({1'b0,\empty_reg_85[24]_i_2_n_0 ,\empty_reg_85[24]_i_3_n_0 ,\empty_reg_85[24]_i_4_n_0 ,\empty_reg_85[24]_i_5_n_0 ,\empty_reg_85[24]_i_6_n_0 ,\empty_reg_85[24]_i_7_n_0 ,\empty_reg_85[24]_i_8_n_0 }),
        .O({\empty_reg_85_reg[24]_i_1_n_8 ,\empty_reg_85_reg[24]_i_1_n_9 ,\empty_reg_85_reg[24]_i_1_n_10 ,\empty_reg_85_reg[24]_i_1_n_11 ,\empty_reg_85_reg[24]_i_1_n_12 ,\empty_reg_85_reg[24]_i_1_n_13 ,\empty_reg_85_reg[24]_i_1_n_14 ,\empty_reg_85_reg[24]_i_1_n_15 }),
        .S({\empty_reg_85[24]_i_9_n_0 ,\empty_reg_85[24]_i_10_n_0 ,\empty_reg_85[24]_i_11_n_0 ,\empty_reg_85[24]_i_12_n_0 ,\empty_reg_85[24]_i_13_n_0 ,\empty_reg_85[24]_i_14_n_0 ,\empty_reg_85[24]_i_15_n_0 ,\empty_reg_85[24]_i_16_n_0 }));
  FDRE \empty_reg_85_reg[25] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_14 ),
        .Q(empty_reg_85_reg[25]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[26] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_13 ),
        .Q(empty_reg_85_reg[26]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[27] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_12 ),
        .Q(empty_reg_85_reg[27]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[28] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_11 ),
        .Q(empty_reg_85_reg[28]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[29] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_10 ),
        .Q(empty_reg_85_reg[29]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_13 ),
        .Q(empty_reg_85_reg[2]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[30] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_9 ),
        .Q(empty_reg_85_reg[30]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[31] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[24]_i_1_n_8 ),
        .Q(empty_reg_85_reg[31]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_12 ),
        .Q(empty_reg_85_reg[3]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[4] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_11 ),
        .Q(empty_reg_85_reg[4]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[5] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_10 ),
        .Q(empty_reg_85_reg[5]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[6] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_9 ),
        .Q(empty_reg_85_reg[6]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[7] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[0]_i_1_n_8 ),
        .Q(empty_reg_85_reg[7]),
        .R(1'b0));
  FDRE \empty_reg_85_reg[8] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_15 ),
        .Q(empty_reg_85_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \empty_reg_85_reg[8]_i_1 
       (.CI(\empty_reg_85_reg[0]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\empty_reg_85_reg[8]_i_1_n_0 ,\empty_reg_85_reg[8]_i_1_n_1 ,\empty_reg_85_reg[8]_i_1_n_2 ,\empty_reg_85_reg[8]_i_1_n_3 ,\empty_reg_85_reg[8]_i_1_n_4 ,\empty_reg_85_reg[8]_i_1_n_5 ,\empty_reg_85_reg[8]_i_1_n_6 ,\empty_reg_85_reg[8]_i_1_n_7 }),
        .DI({\empty_reg_85[8]_i_2_n_0 ,\empty_reg_85[8]_i_3_n_0 ,\empty_reg_85[8]_i_4_n_0 ,\empty_reg_85[8]_i_5_n_0 ,\empty_reg_85[8]_i_6_n_0 ,\empty_reg_85[8]_i_7_n_0 ,\empty_reg_85[8]_i_8_n_0 ,\empty_reg_85[8]_i_9_n_0 }),
        .O({\empty_reg_85_reg[8]_i_1_n_8 ,\empty_reg_85_reg[8]_i_1_n_9 ,\empty_reg_85_reg[8]_i_1_n_10 ,\empty_reg_85_reg[8]_i_1_n_11 ,\empty_reg_85_reg[8]_i_1_n_12 ,\empty_reg_85_reg[8]_i_1_n_13 ,\empty_reg_85_reg[8]_i_1_n_14 ,\empty_reg_85_reg[8]_i_1_n_15 }),
        .S({\empty_reg_85[8]_i_10_n_0 ,\empty_reg_85[8]_i_11_n_0 ,\empty_reg_85[8]_i_12_n_0 ,\empty_reg_85[8]_i_13_n_0 ,\empty_reg_85[8]_i_14_n_0 ,\empty_reg_85[8]_i_15_n_0 ,\empty_reg_85[8]_i_16_n_0 ,\empty_reg_85[8]_i_17_n_0 }));
  FDRE \empty_reg_85_reg[9] 
       (.C(ap_clk),
        .CE(ap_NS_fsm[4]),
        .D(\empty_reg_85_reg[8]_i_1_n_14 ),
        .Q(empty_reg_85_reg[9]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_top_fn_init_arr grp_init_arr_fu_96
       (.D(ap_NS_fsm[2:1]),
        .Q({in_arr_ce0,ap_CS_fsm_state3,ap_CS_fsm_state2,\ap_CS_fsm_reg_n_0_[0] }),
        .ap_NS_fsm11_out(ap_NS_fsm11_out),
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_start_0(grp_init_arr_fu_96_n_12),
        .grp_init_arr_fu_96_ap_start_reg(grp_init_arr_fu_96_ap_start_reg),
        .in_arr_address0(in_arr_address0),
        .out_arr_address0(out_arr_address0),
        .\out_arr_address0[6] (out_arr_addr_reg_169),
        .\out_arr_address0[6]_0 (i_fu_44),
        .out_arr_ce0(out_arr_ce0),
        .out_arr_we0(out_arr_we0));
  FDRE #(
    .INIT(1'b0)) 
    grp_init_arr_fu_96_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_init_arr_fu_96_n_12),
        .Q(grp_init_arr_fu_96_ap_start_reg),
        .R(ap_rst));
  LUT2 #(
    .INIT(4'h8)) 
    \i_fu_44[6]_i_1 
       (.I0(\ap_CS_fsm_reg_n_0_[0] ),
        .I1(ap_start),
        .O(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[0]),
        .Q(i_fu_44[0]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[1]),
        .Q(i_fu_44[1]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[2]),
        .Q(i_fu_44[2]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[3]),
        .Q(i_fu_44[3]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[4] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[4]),
        .Q(i_fu_44[4]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[5] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[5]),
        .Q(i_fu_44[5]),
        .R(ap_NS_fsm10_out));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_44_reg[6] 
       (.C(ap_clk),
        .CE(ap_NS_fsm11_out),
        .D(add_ln20_reg_164[6]),
        .Q(i_fu_44[6]),
        .R(ap_NS_fsm10_out));
  FDRE \j_reg_74_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[0]),
        .Q(in_arr_address0[0]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[1]),
        .Q(in_arr_address0[1]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[2]),
        .Q(in_arr_address0[2]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[3]),
        .Q(in_arr_address0[3]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[4]),
        .Q(in_arr_address0[4]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[5]),
        .Q(in_arr_address0[5]),
        .R(ap_CS_fsm_state4));
  FDRE \j_reg_74_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state6),
        .D(add_ln24_reg_182[6]),
        .Q(in_arr_address0[6]),
        .R(ap_CS_fsm_state4));
  FDRE \out_arr_addr_reg_169_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[0]),
        .Q(out_arr_addr_reg_169[0]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[1]),
        .Q(out_arr_addr_reg_169[1]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[2]),
        .Q(out_arr_addr_reg_169[2]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[3]),
        .Q(out_arr_addr_reg_169[3]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[4]),
        .Q(out_arr_addr_reg_169[4]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[5]),
        .Q(out_arr_addr_reg_169[5]),
        .R(1'b0));
  FDRE \out_arr_addr_reg_169_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(i_fu_44[6]),
        .Q(out_arr_addr_reg_169[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[0]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[0]),
        .O(out_arr_d0[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[10]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[10]),
        .O(out_arr_d0[10]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[11]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[11]),
        .O(out_arr_d0[11]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[12]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[12]),
        .O(out_arr_d0[12]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[13]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[13]),
        .O(out_arr_d0[13]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[14]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[14]),
        .O(out_arr_d0[14]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[15]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[15]),
        .O(out_arr_d0[15]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[16]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[16]),
        .O(out_arr_d0[16]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[17]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[17]),
        .O(out_arr_d0[17]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[18]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[18]),
        .O(out_arr_d0[18]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[19]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[19]),
        .O(out_arr_d0[19]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[1]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[1]),
        .O(out_arr_d0[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[20]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[20]),
        .O(out_arr_d0[20]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[21]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[21]),
        .O(out_arr_d0[21]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[22]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[22]),
        .O(out_arr_d0[22]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[23]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[23]),
        .O(out_arr_d0[23]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[24]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[24]),
        .O(out_arr_d0[24]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[25]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[25]),
        .O(out_arr_d0[25]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[26]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[26]),
        .O(out_arr_d0[26]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[27]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[27]),
        .O(out_arr_d0[27]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[28]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[28]),
        .O(out_arr_d0[28]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[29]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[29]),
        .O(out_arr_d0[29]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[2]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[2]),
        .O(out_arr_d0[2]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[30]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[30]),
        .O(out_arr_d0[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[31]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[31]),
        .O(out_arr_d0[31]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[3]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[3]),
        .O(out_arr_d0[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[4]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[4]),
        .O(out_arr_d0[4]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[5]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[5]),
        .O(out_arr_d0[5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[6]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[6]),
        .O(out_arr_d0[6]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[7]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[7]),
        .O(out_arr_d0[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[8]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[8]),
        .O(out_arr_d0[8]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_arr_d0[9]_INST_0 
       (.I0(in_arr_ce0),
        .I1(empty_reg_85_reg[9]),
        .O(out_arr_d0[9]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_top_fn_init_arr
   (out_arr_we0,
    ap_NS_fsm11_out,
    D,
    out_arr_ce0,
    out_arr_address0,
    ap_start_0,
    grp_init_arr_fu_96_ap_start_reg,
    Q,
    ap_start,
    in_arr_address0,
    \out_arr_address0[6] ,
    \out_arr_address0[6]_0 ,
    ap_rst,
    ap_clk);
  output out_arr_we0;
  output ap_NS_fsm11_out;
  output [1:0]D;
  output out_arr_ce0;
  output [6:0]out_arr_address0;
  output ap_start_0;
  input grp_init_arr_fu_96_ap_start_reg;
  input [3:0]Q;
  input ap_start;
  input [6:0]in_arr_address0;
  input [6:0]\out_arr_address0[6] ;
  input [6:0]\out_arr_address0[6]_0 ;
  input ap_rst;
  input ap_clk;

  wire [1:0]D;
  wire [3:0]Q;
  wire [6:0]add_ln8_fu_64_p2;
  wire \ap_CS_fsm[0]_i_1_n_0 ;
  wire \ap_CS_fsm[1]_i_1_n_0 ;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_NS_fsm1;
  wire ap_NS_fsm11_out;
  wire ap_clk;
  wire ap_rst;
  wire ap_start;
  wire ap_start_0;
  wire grp_init_arr_fu_96_ap_ready;
  wire grp_init_arr_fu_96_ap_start_reg;
  wire grp_init_arr_fu_96_out_arr_ce0;
  wire grp_init_arr_fu_96_out_arr_we0;
  wire \i_fu_32[6]_i_3_n_0 ;
  wire [6:0]i_fu_32_reg;
  wire [6:0]in_arr_address0;
  wire [6:0]out_arr_address0;
  wire [6:0]\out_arr_address0[6] ;
  wire [6:0]\out_arr_address0[6]_0 ;
  wire out_arr_ce0;
  wire out_arr_we0;
  wire out_arr_we0_INST_0_i_3_n_0;
  wire out_arr_we0_INST_0_i_4_n_0;

  LUT3 #(
    .INIT(8'h74)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(grp_init_arr_fu_96_ap_start_reg),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_init_arr_fu_96_ap_ready),
        .O(\ap_CS_fsm[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(grp_init_arr_fu_96_ap_start_reg),
        .I1(grp_init_arr_fu_96_ap_ready),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .O(\ap_CS_fsm[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8F8F888F88888888)) 
    \ap_CS_fsm[1]_i_1__0 
       (.I0(Q[0]),
        .I1(ap_start),
        .I2(grp_init_arr_fu_96_ap_ready),
        .I3(\ap_CS_fsm_reg_n_0_[0] ),
        .I4(grp_init_arr_fu_96_ap_start_reg),
        .I5(Q[1]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    \ap_CS_fsm[1]_i_2 
       (.I0(out_arr_we0_INST_0_i_4_n_0),
        .I1(i_fu_32_reg[6]),
        .I2(i_fu_32_reg[0]),
        .I3(i_fu_32_reg[1]),
        .I4(grp_init_arr_fu_96_out_arr_ce0),
        .O(grp_init_arr_fu_96_ap_ready));
  LUT6 #(
    .INIT(64'hFFFFAE00AE00AE00)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(grp_init_arr_fu_96_ap_ready),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_init_arr_fu_96_ap_start_reg),
        .I3(Q[1]),
        .I4(ap_NS_fsm11_out),
        .I5(Q[3]),
        .O(D[1]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[0]_i_1_n_0 ),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[1]_i_1_n_0 ),
        .Q(grp_init_arr_fu_96_out_arr_ce0),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    grp_init_arr_fu_96_ap_start_reg_i_1
       (.I0(ap_start),
        .I1(Q[0]),
        .I2(grp_init_arr_fu_96_ap_ready),
        .I3(grp_init_arr_fu_96_ap_start_reg),
        .O(ap_start_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \i_fu_32[0]_i_1 
       (.I0(i_fu_32_reg[0]),
        .O(add_ln8_fu_64_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_fu_32[1]_i_1 
       (.I0(i_fu_32_reg[0]),
        .I1(i_fu_32_reg[1]),
        .O(add_ln8_fu_64_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \i_fu_32[2]_i_1 
       (.I0(i_fu_32_reg[0]),
        .I1(i_fu_32_reg[1]),
        .I2(i_fu_32_reg[2]),
        .O(add_ln8_fu_64_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \i_fu_32[3]_i_1 
       (.I0(i_fu_32_reg[1]),
        .I1(i_fu_32_reg[0]),
        .I2(i_fu_32_reg[2]),
        .I3(i_fu_32_reg[3]),
        .O(add_ln8_fu_64_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \i_fu_32[4]_i_1 
       (.I0(i_fu_32_reg[2]),
        .I1(i_fu_32_reg[0]),
        .I2(i_fu_32_reg[1]),
        .I3(i_fu_32_reg[3]),
        .I4(i_fu_32_reg[4]),
        .O(add_ln8_fu_64_p2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \i_fu_32[5]_i_1 
       (.I0(i_fu_32_reg[3]),
        .I1(i_fu_32_reg[1]),
        .I2(i_fu_32_reg[0]),
        .I3(i_fu_32_reg[2]),
        .I4(i_fu_32_reg[4]),
        .I5(i_fu_32_reg[5]),
        .O(add_ln8_fu_64_p2[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \i_fu_32[6]_i_1 
       (.I0(grp_init_arr_fu_96_ap_start_reg),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .O(ap_NS_fsm1));
  LUT3 #(
    .INIT(8'h78)) 
    \i_fu_32[6]_i_2 
       (.I0(\i_fu_32[6]_i_3_n_0 ),
        .I1(i_fu_32_reg[5]),
        .I2(i_fu_32_reg[6]),
        .O(add_ln8_fu_64_p2[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \i_fu_32[6]_i_3 
       (.I0(i_fu_32_reg[4]),
        .I1(i_fu_32_reg[2]),
        .I2(i_fu_32_reg[0]),
        .I3(i_fu_32_reg[1]),
        .I4(i_fu_32_reg[3]),
        .O(\i_fu_32[6]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[0] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[0]),
        .Q(i_fu_32_reg[0]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[1] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[1]),
        .Q(i_fu_32_reg[1]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[2] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[2]),
        .Q(i_fu_32_reg[2]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[3] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[3]),
        .Q(i_fu_32_reg[3]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[4] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[4]),
        .Q(i_fu_32_reg[4]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[5] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[5]),
        .Q(i_fu_32_reg[5]),
        .R(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_32_reg[6] 
       (.C(ap_clk),
        .CE(grp_init_arr_fu_96_out_arr_we0),
        .D(add_ln8_fu_64_p2[6]),
        .Q(i_fu_32_reg[6]),
        .R(ap_NS_fsm1));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[0]_INST_0 
       (.I0(\out_arr_address0[6] [0]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [0]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[0]),
        .O(out_arr_address0[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[1]_INST_0 
       (.I0(\out_arr_address0[6] [1]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [1]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[1]),
        .O(out_arr_address0[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[2]_INST_0 
       (.I0(\out_arr_address0[6] [2]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [2]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[2]),
        .O(out_arr_address0[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[3]_INST_0 
       (.I0(\out_arr_address0[6] [3]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [3]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[3]),
        .O(out_arr_address0[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[4]_INST_0 
       (.I0(\out_arr_address0[6] [4]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [4]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[4]),
        .O(out_arr_address0[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[5]_INST_0 
       (.I0(\out_arr_address0[6] [5]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [5]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[5]),
        .O(out_arr_address0[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_arr_address0[6]_INST_0 
       (.I0(\out_arr_address0[6] [6]),
        .I1(Q[3]),
        .I2(\out_arr_address0[6]_0 [6]),
        .I3(Q[2]),
        .I4(i_fu_32_reg[6]),
        .O(out_arr_address0[6]));
  LUT4 #(
    .INIT(16'hFEEE)) 
    out_arr_ce0_INST_0
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(grp_init_arr_fu_96_out_arr_ce0),
        .I3(Q[1]),
        .O(out_arr_ce0));
  LUT3 #(
    .INIT(8'hEA)) 
    out_arr_we0_INST_0
       (.I0(ap_NS_fsm11_out),
        .I1(grp_init_arr_fu_96_out_arr_we0),
        .I2(Q[1]),
        .O(out_arr_we0));
  LUT5 #(
    .INIT(32'h00000020)) 
    out_arr_we0_INST_0_i_1
       (.I0(Q[3]),
        .I1(out_arr_we0_INST_0_i_3_n_0),
        .I2(in_arr_address0[6]),
        .I3(in_arr_address0[0]),
        .I4(in_arr_address0[1]),
        .O(ap_NS_fsm11_out));
  LUT5 #(
    .INIT(32'hAAAAAA8A)) 
    out_arr_we0_INST_0_i_2
       (.I0(grp_init_arr_fu_96_out_arr_ce0),
        .I1(out_arr_we0_INST_0_i_4_n_0),
        .I2(i_fu_32_reg[6]),
        .I3(i_fu_32_reg[0]),
        .I4(i_fu_32_reg[1]),
        .O(grp_init_arr_fu_96_out_arr_we0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    out_arr_we0_INST_0_i_3
       (.I0(in_arr_address0[3]),
        .I1(in_arr_address0[4]),
        .I2(in_arr_address0[2]),
        .I3(in_arr_address0[5]),
        .O(out_arr_we0_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    out_arr_we0_INST_0_i_4
       (.I0(i_fu_32_reg[3]),
        .I1(i_fu_32_reg[4]),
        .I2(i_fu_32_reg[2]),
        .I3(i_fu_32_reg[5]),
        .O(out_arr_we0_INST_0_i_4_n_0));
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
