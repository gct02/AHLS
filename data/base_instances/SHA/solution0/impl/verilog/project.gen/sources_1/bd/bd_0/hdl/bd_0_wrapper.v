//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Thu May 29 17:33:12 2025
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
    in_i_address0,
    in_i_ce0,
    in_i_q0,
    indata_address0,
    indata_ce0,
    indata_q0,
    outdata_address0,
    outdata_ce0,
    outdata_d0,
    outdata_we0);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [0:0]in_i_address0;
  output in_i_ce0;
  input [31:0]in_i_q0;
  output [13:0]indata_address0;
  output indata_ce0;
  input [7:0]indata_q0;
  output [2:0]outdata_address0;
  output outdata_ce0;
  output [31:0]outdata_d0;
  output outdata_we0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [0:0]in_i_address0;
  wire in_i_ce0;
  wire [31:0]in_i_q0;
  wire [13:0]indata_address0;
  wire indata_ce0;
  wire [7:0]indata_q0;
  wire [2:0]outdata_address0;
  wire outdata_ce0;
  wire [31:0]outdata_d0;
  wire outdata_we0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .in_i_address0(in_i_address0),
        .in_i_ce0(in_i_ce0),
        .in_i_q0(in_i_q0),
        .indata_address0(indata_address0),
        .indata_ce0(indata_ce0),
        .indata_q0(indata_q0),
        .outdata_address0(outdata_address0),
        .outdata_ce0(outdata_ce0),
        .outdata_d0(outdata_d0),
        .outdata_we0(outdata_we0));
endmodule
