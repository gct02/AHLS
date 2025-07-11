//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 03:57:43 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (LARc_address0,
    LARc_address1,
    LARc_ce0,
    LARc_ce1,
    LARc_d0,
    LARc_d1,
    LARc_q0,
    LARc_q1,
    LARc_we0,
    LARc_we1,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    indata_address0,
    indata_address1,
    indata_ce0,
    indata_ce1,
    indata_d0,
    indata_d1,
    indata_q0,
    indata_q1,
    indata_we0,
    indata_we1);
  output [2:0]LARc_address0;
  output [2:0]LARc_address1;
  output LARc_ce0;
  output LARc_ce1;
  output [15:0]LARc_d0;
  output [15:0]LARc_d1;
  input [15:0]LARc_q0;
  input [15:0]LARc_q1;
  output LARc_we0;
  output LARc_we1;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [7:0]indata_address0;
  output [7:0]indata_address1;
  output indata_ce0;
  output indata_ce1;
  output [15:0]indata_d0;
  output [15:0]indata_d1;
  input [15:0]indata_q0;
  input [15:0]indata_q1;
  output indata_we0;
  output indata_we1;

  wire [2:0]LARc_address0;
  wire [2:0]LARc_address1;
  wire LARc_ce0;
  wire LARc_ce1;
  wire [15:0]LARc_d0;
  wire [15:0]LARc_d1;
  wire [15:0]LARc_q0;
  wire [15:0]LARc_q1;
  wire LARc_we0;
  wire LARc_we1;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [7:0]indata_address0;
  wire [7:0]indata_address1;
  wire indata_ce0;
  wire indata_ce1;
  wire [15:0]indata_d0;
  wire [15:0]indata_d1;
  wire [15:0]indata_q0;
  wire [15:0]indata_q1;
  wire indata_we0;
  wire indata_we1;

  bd_0 bd_0_i
       (.LARc_address0(LARc_address0),
        .LARc_address1(LARc_address1),
        .LARc_ce0(LARc_ce0),
        .LARc_ce1(LARc_ce1),
        .LARc_d0(LARc_d0),
        .LARc_d1(LARc_d1),
        .LARc_q0(LARc_q0),
        .LARc_q1(LARc_q1),
        .LARc_we0(LARc_we0),
        .LARc_we1(LARc_we1),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .indata_address0(indata_address0),
        .indata_address1(indata_address1),
        .indata_ce0(indata_ce0),
        .indata_ce1(indata_ce1),
        .indata_d0(indata_d0),
        .indata_d1(indata_d1),
        .indata_q0(indata_q0),
        .indata_q1(indata_q1),
        .indata_we0(indata_we0),
        .indata_we1(indata_we1));
endmodule
