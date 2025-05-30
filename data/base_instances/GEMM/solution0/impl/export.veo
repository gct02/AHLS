// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
bbgemm export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .m1_address0(m1_address0),       // output [11:0] m1_address0
  .m1_ce0(m1_ce0),       // output  m1_ce0
  .m1_q0(m1_q0),       // input [63:0] m1_q0
  .m2_address0(m2_address0),       // output [11:0] m2_address0
  .m2_ce0(m2_ce0),       // output  m2_ce0
  .m2_q0(m2_q0),       // input [63:0] m2_q0
  .prod_address0(prod_address0),       // output [11:0] prod_address0
  .prod_ce0(prod_ce0),       // output  prod_ce0
  .prod_we0(prod_we0),       // output  prod_we0
  .prod_d0(prod_d0),       // output [63:0] prod_d0
  .prod_q0(prod_q0)        // input [63:0] prod_q0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

