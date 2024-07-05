// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
rendering export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .triangle_3ds(triangle_3ds),       // input [71:0] triangle_3ds
  .output_r_address0(output_r_address0),       // output [15:0] output_r_address0
  .output_r_ce0(output_r_ce0),       // output  output_r_ce0
  .output_r_we0(output_r_we0),       // output  output_r_we0
  .output_r_d0(output_r_d0),       // output [7:0] output_r_d0
  .num_3d_tri(num_3d_tri)        // input [31:0] num_3d_tri
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

