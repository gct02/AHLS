//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  2 18:54:01 2025
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
    work_x_address0,
    work_x_address1,
    work_x_ce0,
    work_x_ce1,
    work_x_d0,
    work_x_d1,
    work_x_q0,
    work_x_q1,
    work_x_we0,
    work_x_we1,
    work_y_address0,
    work_y_address1,
    work_y_ce0,
    work_y_ce1,
    work_y_d0,
    work_y_d1,
    work_y_q0,
    work_y_q1,
    work_y_we0,
    work_y_we1);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [8:0]work_x_address0;
  output [8:0]work_x_address1;
  output work_x_ce0;
  output work_x_ce1;
  output [63:0]work_x_d0;
  output [63:0]work_x_d1;
  input [63:0]work_x_q0;
  input [63:0]work_x_q1;
  output work_x_we0;
  output work_x_we1;
  output [8:0]work_y_address0;
  output [8:0]work_y_address1;
  output work_y_ce0;
  output work_y_ce1;
  output [63:0]work_y_d0;
  output [63:0]work_y_d1;
  input [63:0]work_y_q0;
  input [63:0]work_y_q1;
  output work_y_we0;
  output work_y_we1;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [8:0]work_x_address0;
  wire [8:0]work_x_address1;
  wire work_x_ce0;
  wire work_x_ce1;
  wire [63:0]work_x_d0;
  wire [63:0]work_x_d1;
  wire [63:0]work_x_q0;
  wire [63:0]work_x_q1;
  wire work_x_we0;
  wire work_x_we1;
  wire [8:0]work_y_address0;
  wire [8:0]work_y_address1;
  wire work_y_ce0;
  wire work_y_ce1;
  wire [63:0]work_y_d0;
  wire [63:0]work_y_d1;
  wire [63:0]work_y_q0;
  wire [63:0]work_y_q1;
  wire work_y_we0;
  wire work_y_we1;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .work_x_address0(work_x_address0),
        .work_x_address1(work_x_address1),
        .work_x_ce0(work_x_ce0),
        .work_x_ce1(work_x_ce1),
        .work_x_d0(work_x_d0),
        .work_x_d1(work_x_d1),
        .work_x_q0(work_x_q0),
        .work_x_q1(work_x_q1),
        .work_x_we0(work_x_we0),
        .work_x_we1(work_x_we1),
        .work_y_address0(work_y_address0),
        .work_y_address1(work_y_address1),
        .work_y_ce0(work_y_ce0),
        .work_y_ce1(work_y_ce1),
        .work_y_d0(work_y_d0),
        .work_y_d1(work_y_d1),
        .work_y_q0(work_y_q0),
        .work_y_q1(work_y_q1),
        .work_y_we0(work_y_we0),
        .work_y_we1(work_y_we1));
endmodule
