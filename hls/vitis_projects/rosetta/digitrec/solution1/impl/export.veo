// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
DigitRec export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .training_samples_address0(training_samples_address0),       // output [13:0] training_samples_address0
  .training_samples_ce0(training_samples_ce0),       // output  training_samples_ce0
  .training_samples_q0(training_samples_q0),       // input [63:0] training_samples_q0
  .training_samples_address1(training_samples_address1),       // output [13:0] training_samples_address1
  .training_samples_ce1(training_samples_ce1),       // output  training_samples_ce1
  .training_samples_q1(training_samples_q1),       // input [63:0] training_samples_q1
  .test_set_address0(test_set_address0),       // output [10:0] test_set_address0
  .test_set_ce0(test_set_ce0),       // output  test_set_ce0
  .test_set_q0(test_set_q0),       // input [63:0] test_set_q0
  .test_set_address1(test_set_address1),       // output [10:0] test_set_address1
  .test_set_ce1(test_set_ce1),       // output  test_set_ce1
  .test_set_q1(test_set_q1),       // input [63:0] test_set_q1
  .training_labels_address0(training_labels_address0),       // output [11:0] training_labels_address0
  .training_labels_ce0(training_labels_ce0),       // output  training_labels_ce0
  .training_labels_q0(training_labels_q0),       // input [7:0] training_labels_q0
  .results_address0(results_address0),       // output [8:0] results_address0
  .results_ce0(results_ce0),       // output  results_ce0
  .results_we0(results_we0),       // output  results_we0
  .results_d0(results_d0)        // output [7:0] results_d0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

