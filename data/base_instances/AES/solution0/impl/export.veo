// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
aes_main export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .statemt_address0(statemt_address0),       // output [4:0] statemt_address0
  .statemt_ce0(statemt_ce0),       // output  statemt_ce0
  .statemt_we0(statemt_we0),       // output  statemt_we0
  .statemt_d0(statemt_d0),       // output [31:0] statemt_d0
  .statemt_q0(statemt_q0),       // input [31:0] statemt_q0
  .statemt_address1(statemt_address1),       // output [4:0] statemt_address1
  .statemt_ce1(statemt_ce1),       // output  statemt_ce1
  .statemt_we1(statemt_we1),       // output  statemt_we1
  .statemt_d1(statemt_d1),       // output [31:0] statemt_d1
  .statemt_q1(statemt_q1),       // input [31:0] statemt_q1
  .key_address0(key_address0),       // output [4:0] key_address0
  .key_ce0(key_ce0),       // output  key_ce0
  .key_q0(key_q0),       // input [31:0] key_q0
  .ap_return(ap_return)        // output [31:0] ap_return
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

