// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
stencil3d export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .C_address0(C_address0),       // output [0:0] C_address0
  .C_ce0(C_ce0),       // output  C_ce0
  .C_q0(C_q0),       // input [31:0] C_q0
  .C_address1(C_address1),       // output [0:0] C_address1
  .C_ce1(C_ce1),       // output  C_ce1
  .C_q1(C_q1),       // input [31:0] C_q1
  .orig_address0(orig_address0),       // output [10:0] orig_address0
  .orig_ce0(orig_ce0),       // output  orig_ce0
  .orig_q0(orig_q0),       // input [31:0] orig_q0
  .orig_address1(orig_address1),       // output [10:0] orig_address1
  .orig_ce1(orig_ce1),       // output  orig_ce1
  .orig_q1(orig_q1),       // input [31:0] orig_q1
  .sol_address0(sol_address0),       // output [10:0] sol_address0
  .sol_ce0(sol_ce0),       // output  sol_ce0
  .sol_we0(sol_we0),       // output  sol_we0
  .sol_d0(sol_d0),       // output [31:0] sol_d0
  .sol_address1(sol_address1),       // output [10:0] sol_address1
  .sol_ce1(sol_ce1),       // output  sol_ce1
  .sol_we1(sol_we1),       // output  sol_we1
  .sol_d1(sol_d1)        // output [31:0] sol_d1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

