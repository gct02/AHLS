//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 04:03:37 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (NL_address0,
    NL_ce0,
    NL_q0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    force_x_address0,
    force_x_ce0,
    force_x_d0,
    force_x_we0,
    force_y_address0,
    force_y_ce0,
    force_y_d0,
    force_y_we0,
    force_z_address0,
    force_z_ce0,
    force_z_d0,
    force_z_we0,
    position_x_address0,
    position_x_ce0,
    position_x_q0,
    position_y_address0,
    position_y_ce0,
    position_y_q0,
    position_z_address0,
    position_z_ce0,
    position_z_q0);
  output [11:0]NL_address0;
  output NL_ce0;
  input [31:0]NL_q0;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [7:0]force_x_address0;
  output force_x_ce0;
  output [63:0]force_x_d0;
  output force_x_we0;
  output [7:0]force_y_address0;
  output force_y_ce0;
  output [63:0]force_y_d0;
  output force_y_we0;
  output [7:0]force_z_address0;
  output force_z_ce0;
  output [63:0]force_z_d0;
  output force_z_we0;
  output [7:0]position_x_address0;
  output position_x_ce0;
  input [63:0]position_x_q0;
  output [7:0]position_y_address0;
  output position_y_ce0;
  input [63:0]position_y_q0;
  output [7:0]position_z_address0;
  output position_z_ce0;
  input [63:0]position_z_q0;

  wire [11:0]NL_address0;
  wire NL_ce0;
  wire [31:0]NL_q0;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [7:0]force_x_address0;
  wire force_x_ce0;
  wire [63:0]force_x_d0;
  wire force_x_we0;
  wire [7:0]force_y_address0;
  wire force_y_ce0;
  wire [63:0]force_y_d0;
  wire force_y_we0;
  wire [7:0]force_z_address0;
  wire force_z_ce0;
  wire [63:0]force_z_d0;
  wire force_z_we0;
  wire [7:0]position_x_address0;
  wire position_x_ce0;
  wire [63:0]position_x_q0;
  wire [7:0]position_y_address0;
  wire position_y_ce0;
  wire [63:0]position_y_q0;
  wire [7:0]position_z_address0;
  wire position_z_ce0;
  wire [63:0]position_z_q0;

  bd_0 bd_0_i
       (.NL_address0(NL_address0),
        .NL_ce0(NL_ce0),
        .NL_q0(NL_q0),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .force_x_address0(force_x_address0),
        .force_x_ce0(force_x_ce0),
        .force_x_d0(force_x_d0),
        .force_x_we0(force_x_we0),
        .force_y_address0(force_y_address0),
        .force_y_ce0(force_y_ce0),
        .force_y_d0(force_y_d0),
        .force_y_we0(force_y_we0),
        .force_z_address0(force_z_address0),
        .force_z_ce0(force_z_ce0),
        .force_z_d0(force_z_d0),
        .force_z_we0(force_z_we0),
        .position_x_address0(position_x_address0),
        .position_x_ce0(position_x_ce0),
        .position_x_q0(position_x_q0),
        .position_y_address0(position_y_address0),
        .position_y_ce0(position_y_ce0),
        .position_y_q0(position_y_q0),
        .position_z_address0(position_z_address0),
        .position_z_ce0(position_z_ce0),
        .position_z_q0(position_z_q0));
endmodule
