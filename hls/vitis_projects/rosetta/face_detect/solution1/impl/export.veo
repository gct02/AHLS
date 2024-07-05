// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
face_detect export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .Data_address0(Data_address0),       // output [16:0] Data_address0
  .Data_ce0(Data_ce0),       // output  Data_ce0
  .Data_q0(Data_q0),       // input [7:0] Data_q0
  .result_x_address0(result_x_address0),       // output [6:0] result_x_address0
  .result_x_ce0(result_x_ce0),       // output  result_x_ce0
  .result_x_we0(result_x_we0),       // output  result_x_we0
  .result_x_d0(result_x_d0),       // output [31:0] result_x_d0
  .result_y_address0(result_y_address0),       // output [6:0] result_y_address0
  .result_y_ce0(result_y_ce0),       // output  result_y_ce0
  .result_y_we0(result_y_we0),       // output  result_y_we0
  .result_y_d0(result_y_d0),       // output [31:0] result_y_d0
  .result_w_address0(result_w_address0),       // output [6:0] result_w_address0
  .result_w_ce0(result_w_ce0),       // output  result_w_ce0
  .result_w_we0(result_w_we0),       // output  result_w_we0
  .result_w_d0(result_w_d0),       // output [31:0] result_w_d0
  .result_h_address0(result_h_address0),       // output [6:0] result_h_address0
  .result_h_ce0(result_h_ce0),       // output  result_h_ce0
  .result_h_we0(result_h_we0),       // output  result_h_we0
  .result_h_d0(result_h_d0),       // output [31:0] result_h_d0
  .result_size(result_size),       // output [31:0] result_size
  .result_size_ap_vld(result_size_ap_vld)        // output  result_size_ap_vld
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

