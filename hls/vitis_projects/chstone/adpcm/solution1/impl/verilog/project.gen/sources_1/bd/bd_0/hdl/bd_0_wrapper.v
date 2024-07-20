//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sun Jun 23 07:23:36 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
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
    compressed_address0,
    compressed_ce0,
    compressed_d0,
    compressed_q0,
    compressed_we0,
    input_samples_address0,
    input_samples_address1,
    input_samples_ce0,
    input_samples_ce1,
    input_samples_q0,
    input_samples_q1,
    result_address0,
    result_address1,
    result_ce0,
    result_ce1,
    result_d0,
    result_d1,
    result_we0,
    result_we1);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [11:0]compressed_address0;
  output compressed_ce0;
  output [31:0]compressed_d0;
  input [31:0]compressed_q0;
  output compressed_we0;
  output [12:0]input_samples_address0;
  output [12:0]input_samples_address1;
  output input_samples_ce0;
  output input_samples_ce1;
  input [31:0]input_samples_q0;
  input [31:0]input_samples_q1;
  output [12:0]result_address0;
  output [12:0]result_address1;
  output result_ce0;
  output result_ce1;
  output [31:0]result_d0;
  output [31:0]result_d1;
  output result_we0;
  output result_we1;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [11:0]compressed_address0;
  wire compressed_ce0;
  wire [31:0]compressed_d0;
  wire [31:0]compressed_q0;
  wire compressed_we0;
  wire [12:0]input_samples_address0;
  wire [12:0]input_samples_address1;
  wire input_samples_ce0;
  wire input_samples_ce1;
  wire [31:0]input_samples_q0;
  wire [31:0]input_samples_q1;
  wire [12:0]result_address0;
  wire [12:0]result_address1;
  wire result_ce0;
  wire result_ce1;
  wire [31:0]result_d0;
  wire [31:0]result_d1;
  wire result_we0;
  wire result_we1;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .compressed_address0(compressed_address0),
        .compressed_ce0(compressed_ce0),
        .compressed_d0(compressed_d0),
        .compressed_q0(compressed_q0),
        .compressed_we0(compressed_we0),
        .input_samples_address0(input_samples_address0),
        .input_samples_address1(input_samples_address1),
        .input_samples_ce0(input_samples_ce0),
        .input_samples_ce1(input_samples_ce1),
        .input_samples_q0(input_samples_q0),
        .input_samples_q1(input_samples_q1),
        .result_address0(result_address0),
        .result_address1(result_address1),
        .result_ce0(result_ce0),
        .result_ce1(result_ce1),
        .result_d0(result_d0),
        .result_d1(result_d1),
        .result_we0(result_we0),
        .result_we1(result_we1));
endmodule
