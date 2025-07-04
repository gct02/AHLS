// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
md_kernel export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .force_x_address0(force_x_address0),       // output [7:0] force_x_address0
  .force_x_ce0(force_x_ce0),       // output  force_x_ce0
  .force_x_we0(force_x_we0),       // output  force_x_we0
  .force_x_d0(force_x_d0),       // output [63:0] force_x_d0
  .force_y_address0(force_y_address0),       // output [7:0] force_y_address0
  .force_y_ce0(force_y_ce0),       // output  force_y_ce0
  .force_y_we0(force_y_we0),       // output  force_y_we0
  .force_y_d0(force_y_d0),       // output [63:0] force_y_d0
  .force_z_address0(force_z_address0),       // output [7:0] force_z_address0
  .force_z_ce0(force_z_ce0),       // output  force_z_ce0
  .force_z_we0(force_z_we0),       // output  force_z_we0
  .force_z_d0(force_z_d0),       // output [63:0] force_z_d0
  .position_x_address0(position_x_address0),       // output [7:0] position_x_address0
  .position_x_ce0(position_x_ce0),       // output  position_x_ce0
  .position_x_q0(position_x_q0),       // input [63:0] position_x_q0
  .position_y_address0(position_y_address0),       // output [7:0] position_y_address0
  .position_y_ce0(position_y_ce0),       // output  position_y_ce0
  .position_y_q0(position_y_q0),       // input [63:0] position_y_q0
  .position_z_address0(position_z_address0),       // output [7:0] position_z_address0
  .position_z_ce0(position_z_ce0),       // output  position_z_ce0
  .position_z_q0(position_z_q0),       // input [63:0] position_z_q0
  .NL_address0(NL_address0),       // output [11:0] NL_address0
  .NL_ce0(NL_ce0),       // output  NL_ce0
  .NL_q0(NL_q0)        // input [31:0] NL_q0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

