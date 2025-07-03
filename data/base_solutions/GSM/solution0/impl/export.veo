// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
Gsm_LPC_Analysis export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .indata_address0(indata_address0),       // output [7:0] indata_address0
  .indata_ce0(indata_ce0),       // output  indata_ce0
  .indata_we0(indata_we0),       // output  indata_we0
  .indata_d0(indata_d0),       // output [15:0] indata_d0
  .indata_q0(indata_q0),       // input [15:0] indata_q0
  .indata_address1(indata_address1),       // output [7:0] indata_address1
  .indata_ce1(indata_ce1),       // output  indata_ce1
  .indata_q1(indata_q1),       // input [15:0] indata_q1
  .LARc_address0(LARc_address0),       // output [2:0] LARc_address0
  .LARc_ce0(LARc_ce0),       // output  LARc_ce0
  .LARc_we0(LARc_we0),       // output  LARc_we0
  .LARc_d0(LARc_d0),       // output [15:0] LARc_d0
  .LARc_q0(LARc_q0),       // input [15:0] LARc_q0
  .LARc_address1(LARc_address1),       // output [2:0] LARc_address1
  .LARc_ce1(LARc_ce1),       // output  LARc_ce1
  .LARc_we1(LARc_we1),       // output  LARc_we1
  .LARc_d1(LARc_d1),       // output [15:0] LARc_d1
  .LARc_q1(LARc_q1)        // input [15:0] LARc_q1
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

