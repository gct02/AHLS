//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Tue Jul 30 14:25:44 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (Data_address0,
    Data_ce0,
    Data_q0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    result_h_address0,
    result_h_ce0,
    result_h_d0,
    result_h_we0,
    result_size,
    result_size_ap_vld,
    result_w_address0,
    result_w_ce0,
    result_w_d0,
    result_w_we0,
    result_x_address0,
    result_x_ce0,
    result_x_d0,
    result_x_we0,
    result_y_address0,
    result_y_ce0,
    result_y_d0,
    result_y_we0);
  output [16:0]Data_address0;
  output Data_ce0;
  input [7:0]Data_q0;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [6:0]result_h_address0;
  output result_h_ce0;
  output [31:0]result_h_d0;
  output result_h_we0;
  output [31:0]result_size;
  output result_size_ap_vld;
  output [6:0]result_w_address0;
  output result_w_ce0;
  output [31:0]result_w_d0;
  output result_w_we0;
  output [6:0]result_x_address0;
  output result_x_ce0;
  output [31:0]result_x_d0;
  output result_x_we0;
  output [6:0]result_y_address0;
  output result_y_ce0;
  output [31:0]result_y_d0;
  output result_y_we0;

  wire [16:0]Data_address0;
  wire Data_ce0;
  wire [7:0]Data_q0;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [6:0]result_h_address0;
  wire result_h_ce0;
  wire [31:0]result_h_d0;
  wire result_h_we0;
  wire [31:0]result_size;
  wire result_size_ap_vld;
  wire [6:0]result_w_address0;
  wire result_w_ce0;
  wire [31:0]result_w_d0;
  wire result_w_we0;
  wire [6:0]result_x_address0;
  wire result_x_ce0;
  wire [31:0]result_x_d0;
  wire result_x_we0;
  wire [6:0]result_y_address0;
  wire result_y_ce0;
  wire [31:0]result_y_d0;
  wire result_y_we0;

  bd_0 bd_0_i
       (.Data_address0(Data_address0),
        .Data_ce0(Data_ce0),
        .Data_q0(Data_q0),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .result_h_address0(result_h_address0),
        .result_h_ce0(result_h_ce0),
        .result_h_d0(result_h_d0),
        .result_h_we0(result_h_we0),
        .result_size(result_size),
        .result_size_ap_vld(result_size_ap_vld),
        .result_w_address0(result_w_address0),
        .result_w_ce0(result_w_ce0),
        .result_w_d0(result_w_d0),
        .result_w_we0(result_w_we0),
        .result_x_address0(result_x_address0),
        .result_x_ce0(result_x_ce0),
        .result_x_d0(result_x_d0),
        .result_x_we0(result_x_we0),
        .result_y_address0(result_y_address0),
        .result_y_ce0(result_y_ce0),
        .result_y_d0(result_y_d0),
        .result_y_we0(result_y_we0));
endmodule
