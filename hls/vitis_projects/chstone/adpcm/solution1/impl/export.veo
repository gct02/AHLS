// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
adpcm_main export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .input_samples_address0(input_samples_address0),       // output [12:0] input_samples_address0
  .input_samples_ce0(input_samples_ce0),       // output  input_samples_ce0
  .input_samples_q0(input_samples_q0),       // input [31:0] input_samples_q0
  .input_samples_address1(input_samples_address1),       // output [12:0] input_samples_address1
  .input_samples_ce1(input_samples_ce1),       // output  input_samples_ce1
  .input_samples_q1(input_samples_q1),       // input [31:0] input_samples_q1
  .compressed_address0(compressed_address0),       // output [11:0] compressed_address0
  .compressed_ce0(compressed_ce0),       // output  compressed_ce0
  .compressed_we0(compressed_we0),       // output  compressed_we0
  .compressed_d0(compressed_d0),       // output [31:0] compressed_d0
  .compressed_q0(compressed_q0),       // input [31:0] compressed_q0
  .result_address0(result_address0),       // output [12:0] result_address0
  .result_ce0(result_ce0),       // output  result_ce0
  .result_we0(result_we0),       // output  result_we0
  .result_d0(result_d0),       // output [31:0] result_d0
  .result_address1(result_address1),       // output [12:0] result_address1
  .result_ce1(result_ce1),       // output  result_ce1
  .result_we1(result_we1),       // output  result_we1
  .result_d1(result_d1)        // output [31:0] result_d1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

