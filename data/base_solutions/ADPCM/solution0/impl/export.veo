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
  .in_data_address0(in_data_address0),       // output [6:0] in_data_address0
  .in_data_ce0(in_data_ce0),       // output  in_data_ce0
  .in_data_q0(in_data_q0),       // input [31:0] in_data_q0
  .in_data_address1(in_data_address1),       // output [6:0] in_data_address1
  .in_data_ce1(in_data_ce1),       // output  in_data_ce1
  .in_data_q1(in_data_q1),       // input [31:0] in_data_q1
  .encoded_address0(encoded_address0),       // output [5:0] encoded_address0
  .encoded_ce0(encoded_ce0),       // output  encoded_ce0
  .encoded_we0(encoded_we0),       // output  encoded_we0
  .encoded_d0(encoded_d0),       // output [31:0] encoded_d0
  .encoded_q0(encoded_q0),       // input [31:0] encoded_q0
  .decoded_address0(decoded_address0),       // output [6:0] decoded_address0
  .decoded_ce0(decoded_ce0),       // output  decoded_ce0
  .decoded_we0(decoded_we0),       // output  decoded_we0
  .decoded_d0(decoded_d0),       // output [31:0] decoded_d0
  .decoded_address1(decoded_address1),       // output [6:0] decoded_address1
  .decoded_ce1(decoded_ce1),       // output  decoded_ce1
  .decoded_we1(decoded_we1),       // output  decoded_we1
  .decoded_d1(decoded_d1)        // output [31:0] decoded_d1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

