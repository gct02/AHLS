// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
sha_stream export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .indata_address0(indata_address0),       // output [13:0] indata_address0
  .indata_ce0(indata_ce0),       // output  indata_ce0
  .indata_q0(indata_q0),       // input [7:0] indata_q0
  .in_i_address0(in_i_address0),       // output [0:0] in_i_address0
  .in_i_ce0(in_i_ce0),       // output  in_i_ce0
  .in_i_q0(in_i_q0),       // input [31:0] in_i_q0
  .outdata_address0(outdata_address0),       // output [2:0] outdata_address0
  .outdata_ce0(outdata_ce0),       // output  outdata_ce0
  .outdata_we0(outdata_we0),       // output  outdata_we0
  .outdata_d0(outdata_d0)        // output [31:0] outdata_d0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

