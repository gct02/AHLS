//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sat Mar 29 16:06:31 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (C_address0,
    C_address1,
    C_ce0,
    C_ce1,
    C_q0,
    C_q1,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    orig_address0,
    orig_address1,
    orig_ce0,
    orig_ce1,
    orig_q0,
    orig_q1,
    sol_address0,
    sol_address1,
    sol_ce0,
    sol_ce1,
    sol_d0,
    sol_d1,
    sol_we0,
    sol_we1);
  output [0:0]C_address0;
  output [0:0]C_address1;
  output C_ce0;
  output C_ce1;
  input [31:0]C_q0;
  input [31:0]C_q1;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [10:0]orig_address0;
  output [10:0]orig_address1;
  output orig_ce0;
  output orig_ce1;
  input [31:0]orig_q0;
  input [31:0]orig_q1;
  output [10:0]sol_address0;
  output [10:0]sol_address1;
  output sol_ce0;
  output sol_ce1;
  output [31:0]sol_d0;
  output [31:0]sol_d1;
  output sol_we0;
  output sol_we1;

  wire [0:0]C_address0;
  wire [0:0]C_address1;
  wire C_ce0;
  wire C_ce1;
  wire [31:0]C_q0;
  wire [31:0]C_q1;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
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

  bd_0 bd_0_i
       (.C_address0(C_address0),
        .C_address1(C_address1),
        .C_ce0(C_ce0),
        .C_ce1(C_ce1),
        .C_q0(C_q0),
        .C_q1(C_q1),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
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
