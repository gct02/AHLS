// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
top_fn export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .in_arr_address0(in_arr_address0),       // output [6:0] in_arr_address0
  .in_arr_ce0(in_arr_ce0),       // output  in_arr_ce0
  .in_arr_q0(in_arr_q0),       // input [31:0] in_arr_q0
  .out_arr_address0(out_arr_address0),       // output [6:0] out_arr_address0
  .out_arr_ce0(out_arr_ce0),       // output  out_arr_ce0
  .out_arr_we0(out_arr_we0),       // output  out_arr_we0
  .out_arr_d0(out_arr_d0),       // output [31:0] out_arr_d0
  .out_arr_q0(out_arr_q0)        // input [31:0] out_arr_q0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

