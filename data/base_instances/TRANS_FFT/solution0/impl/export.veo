// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
fft1D_512 export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .work_x_address0(work_x_address0),       // output [8:0] work_x_address0
  .work_x_ce0(work_x_ce0),       // output  work_x_ce0
  .work_x_we0(work_x_we0),       // output  work_x_we0
  .work_x_d0(work_x_d0),       // output [63:0] work_x_d0
  .work_x_q0(work_x_q0),       // input [63:0] work_x_q0
  .work_x_address1(work_x_address1),       // output [8:0] work_x_address1
  .work_x_ce1(work_x_ce1),       // output  work_x_ce1
  .work_x_we1(work_x_we1),       // output  work_x_we1
  .work_x_d1(work_x_d1),       // output [63:0] work_x_d1
  .work_x_q1(work_x_q1),       // input [63:0] work_x_q1
  .work_y_address0(work_y_address0),       // output [8:0] work_y_address0
  .work_y_ce0(work_y_ce0),       // output  work_y_ce0
  .work_y_we0(work_y_we0),       // output  work_y_we0
  .work_y_d0(work_y_d0),       // output [63:0] work_y_d0
  .work_y_q0(work_y_q0),       // input [63:0] work_y_q0
  .work_y_address1(work_y_address1),       // output [8:0] work_y_address1
  .work_y_ce1(work_y_ce1),       // output  work_y_ce1
  .work_y_we1(work_y_we1),       // output  work_y_we1
  .work_y_d1(work_y_d1),       // output [63:0] work_y_d1
  .work_y_q1(work_y_q1)        // input [63:0] work_y_q1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

