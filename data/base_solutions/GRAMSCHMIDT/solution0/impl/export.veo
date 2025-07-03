// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
kernel_gramschmidt export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .ni(ni),       // input [31:0] ni
  .nj(nj),       // input [31:0] nj
  .A_address0(A_address0),       // output [17:0] A_address0
  .A_ce0(A_ce0),       // output  A_ce0
  .A_we0(A_we0),       // output  A_we0
  .A_d0(A_d0),       // output [63:0] A_d0
  .A_q0(A_q0),       // input [63:0] A_q0
  .R_address0(R_address0),       // output [17:0] R_address0
  .R_ce0(R_ce0),       // output  R_ce0
  .R_we0(R_we0),       // output  R_we0
  .R_d0(R_d0),       // output [63:0] R_d0
  .Q_address0(Q_address0),       // output [17:0] Q_address0
  .Q_ce0(Q_ce0),       // output  Q_ce0
  .Q_we0(Q_we0),       // output  Q_we0
  .Q_d0(Q_d0),       // output [63:0] Q_d0
  .Q_q0(Q_q0)        // input [63:0] Q_q0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

