//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Fri May 30 21:17:36 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
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
    decoded_address0,
    decoded_address1,
    decoded_ce0,
    decoded_ce1,
    decoded_d0,
    decoded_d1,
    decoded_we0,
    decoded_we1,
    encoded_address0,
    encoded_ce0,
    encoded_d0,
    encoded_q0,
    encoded_we0,
    in_data_address0,
    in_data_address1,
    in_data_ce0,
    in_data_ce1,
    in_data_q0,
    in_data_q1);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [6:0]decoded_address0;
  output [6:0]decoded_address1;
  output decoded_ce0;
  output decoded_ce1;
  output [31:0]decoded_d0;
  output [31:0]decoded_d1;
  output decoded_we0;
  output decoded_we1;
  output [5:0]encoded_address0;
  output encoded_ce0;
  output [31:0]encoded_d0;
  input [31:0]encoded_q0;
  output encoded_we0;
  output [6:0]in_data_address0;
  output [6:0]in_data_address1;
  output in_data_ce0;
  output in_data_ce1;
  input [31:0]in_data_q0;
  input [31:0]in_data_q1;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [6:0]decoded_address0;
  wire [6:0]decoded_address1;
  wire decoded_ce0;
  wire decoded_ce1;
  wire [31:0]decoded_d0;
  wire [31:0]decoded_d1;
  wire decoded_we0;
  wire decoded_we1;
  wire [5:0]encoded_address0;
  wire encoded_ce0;
  wire [31:0]encoded_d0;
  wire [31:0]encoded_q0;
  wire encoded_we0;
  wire [6:0]in_data_address0;
  wire [6:0]in_data_address1;
  wire in_data_ce0;
  wire in_data_ce1;
  wire [31:0]in_data_q0;
  wire [31:0]in_data_q1;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .decoded_address0(decoded_address0),
        .decoded_address1(decoded_address1),
        .decoded_ce0(decoded_ce0),
        .decoded_ce1(decoded_ce1),
        .decoded_d0(decoded_d0),
        .decoded_d1(decoded_d1),
        .decoded_we0(decoded_we0),
        .decoded_we1(decoded_we1),
        .encoded_address0(encoded_address0),
        .encoded_ce0(encoded_ce0),
        .encoded_d0(encoded_d0),
        .encoded_q0(encoded_q0),
        .encoded_we0(encoded_we0),
        .in_data_address0(in_data_address0),
        .in_data_address1(in_data_address1),
        .in_data_ce0(in_data_ce0),
        .in_data_ce1(in_data_ce1),
        .in_data_q0(in_data_q0),
        .in_data_q1(in_data_q1));
endmodule
