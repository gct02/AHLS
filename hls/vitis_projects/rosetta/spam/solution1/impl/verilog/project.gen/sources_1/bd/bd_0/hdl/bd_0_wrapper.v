//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sun Jun 23 07:19:17 2024
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
    data_address0,
    data_ce0,
    data_q0,
    label_r_address0,
    label_r_ce0,
    label_r_q0,
    theta_address0,
    theta_address1,
    theta_ce0,
    theta_ce1,
    theta_d0,
    theta_q0,
    theta_q1,
    theta_we0);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [16:0]data_address0;
  output data_ce0;
  input [31:0]data_q0;
  output [6:0]label_r_address0;
  output label_r_ce0;
  input [7:0]label_r_q0;
  output [9:0]theta_address0;
  output [9:0]theta_address1;
  output theta_ce0;
  output theta_ce1;
  output [31:0]theta_d0;
  input [31:0]theta_q0;
  input [31:0]theta_q1;
  output theta_we0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [16:0]data_address0;
  wire data_ce0;
  wire [31:0]data_q0;
  wire [6:0]label_r_address0;
  wire label_r_ce0;
  wire [7:0]label_r_q0;
  wire [9:0]theta_address0;
  wire [9:0]theta_address1;
  wire theta_ce0;
  wire theta_ce1;
  wire [31:0]theta_d0;
  wire [31:0]theta_q0;
  wire [31:0]theta_q1;
  wire theta_we0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .data_address0(data_address0),
        .data_ce0(data_ce0),
        .data_q0(data_q0),
        .label_r_address0(label_r_address0),
        .label_r_ce0(label_r_ce0),
        .label_r_q0(label_r_q0),
        .theta_address0(theta_address0),
        .theta_address1(theta_address1),
        .theta_ce0(theta_ce0),
        .theta_ce1(theta_ce1),
        .theta_d0(theta_d0),
        .theta_q0(theta_q0),
        .theta_q1(theta_q1),
        .theta_we0(theta_we0));
endmodule
