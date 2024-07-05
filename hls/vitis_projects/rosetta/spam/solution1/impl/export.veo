// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
SgdLR export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .data_address0(data_address0),       // output [16:0] data_address0
  .data_ce0(data_ce0),       // output  data_ce0
  .data_q0(data_q0),       // input [31:0] data_q0
  .label_r_address0(label_r_address0),       // output [6:0] label_r_address0
  .label_r_ce0(label_r_ce0),       // output  label_r_ce0
  .label_r_q0(label_r_q0),       // input [7:0] label_r_q0
  .theta_address0(theta_address0),       // output [9:0] theta_address0
  .theta_ce0(theta_ce0),       // output  theta_ce0
  .theta_we0(theta_we0),       // output  theta_we0
  .theta_d0(theta_d0),       // output [31:0] theta_d0
  .theta_q0(theta_q0),       // input [31:0] theta_q0
  .theta_address1(theta_address1),       // output [9:0] theta_address1
  .theta_ce1(theta_ce1),       // output  theta_ce1
  .theta_q1(theta_q1)        // input [31:0] theta_q1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

