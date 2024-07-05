//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sun Jun 23 22:28:35 2024
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
    ap_return,
    ap_rst,
    p,
    p_13,
    p_15,
    p_21,
    p_23,
    p_4,
    p_7,
    p_9);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  output [31:0]ap_return;
  input ap_rst;
  input [63:0]p;
  input [31:0]p_13;
  input [63:0]p_15;
  input [63:0]p_21;
  input [15:0]p_23;
  input [63:0]p_4;
  input [31:0]p_7;
  input [15:0]p_9;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire [31:0]ap_return;
  wire ap_rst;
  wire [63:0]p;
  wire [31:0]p_13;
  wire [63:0]p_15;
  wire [63:0]p_21;
  wire [15:0]p_23;
  wire [63:0]p_4;
  wire [31:0]p_7;
  wire [15:0]p_9;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_return(ap_return),
        .ap_rst(ap_rst),
        .p(p),
        .p_13(p_13),
        .p_15(p_15),
        .p_21(p_21),
        .p_23(p_23),
        .p_4(p_4),
        .p_7(p_7),
        .p_9(p_9));
endmodule
