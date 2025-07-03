//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  2 18:15:55 2025
//Host        : H410M-H-V3 running 64-bit Linux Mint 20.2
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    m1_address0,
    m1_ce0,
    m1_q0,
    m2_address0,
    m2_ce0,
    m2_q0,
    prod_address0,
    prod_ce0,
    prod_d0,
    prod_q0,
    prod_we0);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [11:0]m1_address0;
  output m1_ce0;
  input [63:0]m1_q0;
  output [11:0]m2_address0;
  output m2_ce0;
  input [63:0]m2_q0;
  output [11:0]prod_address0;
  output prod_ce0;
  output [63:0]prod_d0;
  input [63:0]prod_q0;
  output prod_we0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [11:0]m1_address0;
  wire m1_ce0;
  wire [63:0]m1_q0;
  wire [11:0]m2_address0;
  wire m2_ce0;
  wire [63:0]m2_q0;
  wire [11:0]prod_address0;
  wire prod_ce0;
  wire [63:0]prod_d0;
  wire [63:0]prod_q0;
  wire prod_we0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .m1_address0(m1_address0),
        .m1_ce0(m1_ce0),
        .m1_q0(m1_q0),
        .m2_address0(m2_address0),
        .m2_ce0(m2_ce0),
        .m2_q0(m2_q0),
        .prod_address0(prod_address0),
        .prod_ce0(prod_ce0),
        .prod_d0(prod_d0),
        .prod_q0(prod_q0),
        .prod_we0(prod_we0));
endmodule
