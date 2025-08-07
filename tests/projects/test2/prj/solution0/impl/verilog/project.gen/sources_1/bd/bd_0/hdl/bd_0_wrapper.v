//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sat Jul 19 17:14:41 2025
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
    in_arr_address0,
    in_arr_ce0,
    in_arr_q0,
    out_arr_address0,
    out_arr_ce0,
    out_arr_d0,
    out_arr_q0,
    out_arr_we0);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [6:0]in_arr_address0;
  output in_arr_ce0;
  input [31:0]in_arr_q0;
  output [6:0]out_arr_address0;
  output out_arr_ce0;
  output [31:0]out_arr_d0;
  input [31:0]out_arr_q0;
  output out_arr_we0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [6:0]in_arr_address0;
  wire in_arr_ce0;
  wire [31:0]in_arr_q0;
  wire [6:0]out_arr_address0;
  wire out_arr_ce0;
  wire [31:0]out_arr_d0;
  wire [31:0]out_arr_q0;
  wire out_arr_we0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .in_arr_address0(in_arr_address0),
        .in_arr_ce0(in_arr_ce0),
        .in_arr_q0(in_arr_q0),
        .out_arr_address0(out_arr_address0),
        .out_arr_ce0(out_arr_ce0),
        .out_arr_d0(out_arr_d0),
        .out_arr_q0(out_arr_q0),
        .out_arr_we0(out_arr_we0));
endmodule
