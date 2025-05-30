//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Fri May 30 13:02:33 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (A_address0,
    A_ce0,
    A_d0,
    A_q0,
    A_we0,
    Q_address0,
    Q_ce0,
    Q_d0,
    Q_q0,
    Q_we0,
    R_address0,
    R_ce0,
    R_d0,
    R_we0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    ni,
    nj);
  output [17:0]A_address0;
  output A_ce0;
  output [63:0]A_d0;
  input [63:0]A_q0;
  output A_we0;
  output [17:0]Q_address0;
  output Q_ce0;
  output [63:0]Q_d0;
  input [63:0]Q_q0;
  output Q_we0;
  output [17:0]R_address0;
  output R_ce0;
  output [63:0]R_d0;
  output R_we0;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  input [31:0]ni;
  input [31:0]nj;

  wire [17:0]A_address0;
  wire A_ce0;
  wire [63:0]A_d0;
  wire [63:0]A_q0;
  wire A_we0;
  wire [17:0]Q_address0;
  wire Q_ce0;
  wire [63:0]Q_d0;
  wire [63:0]Q_q0;
  wire Q_we0;
  wire [17:0]R_address0;
  wire R_ce0;
  wire [63:0]R_d0;
  wire R_we0;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [31:0]ni;
  wire [31:0]nj;

  bd_0 bd_0_i
       (.A_address0(A_address0),
        .A_ce0(A_ce0),
        .A_d0(A_d0),
        .A_q0(A_q0),
        .A_we0(A_we0),
        .Q_address0(Q_address0),
        .Q_ce0(Q_ce0),
        .Q_d0(Q_d0),
        .Q_q0(Q_q0),
        .Q_we0(Q_we0),
        .R_address0(R_address0),
        .R_ce0(R_ce0),
        .R_d0(R_d0),
        .R_we0(R_we0),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .ni(ni),
        .nj(nj));
endmodule
