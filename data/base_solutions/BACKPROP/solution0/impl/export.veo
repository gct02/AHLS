// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
backprop export (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst(ap_rst),       // input  ap_rst
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .weights1_address0(weights1_address0),       // output [9:0] weights1_address0
  .weights1_ce0(weights1_ce0),       // output  weights1_ce0
  .weights1_we0(weights1_we0),       // output  weights1_we0
  .weights1_d0(weights1_d0),       // output [63:0] weights1_d0
  .weights1_q0(weights1_q0),       // input [63:0] weights1_q0
  .weights2_address0(weights2_address0),       // output [11:0] weights2_address0
  .weights2_ce0(weights2_ce0),       // output  weights2_ce0
  .weights2_we0(weights2_we0),       // output  weights2_we0
  .weights2_d0(weights2_d0),       // output [63:0] weights2_d0
  .weights2_q0(weights2_q0),       // input [63:0] weights2_q0
  .weights3_address0(weights3_address0),       // output [7:0] weights3_address0
  .weights3_ce0(weights3_ce0),       // output  weights3_ce0
  .weights3_we0(weights3_we0),       // output  weights3_we0
  .weights3_d0(weights3_d0),       // output [63:0] weights3_d0
  .weights3_q0(weights3_q0),       // input [63:0] weights3_q0
  .biases1_address0(biases1_address0),       // output [5:0] biases1_address0
  .biases1_ce0(biases1_ce0),       // output  biases1_ce0
  .biases1_we0(biases1_we0),       // output  biases1_we0
  .biases1_d0(biases1_d0),       // output [63:0] biases1_d0
  .biases1_q0(biases1_q0),       // input [63:0] biases1_q0
  .biases2_address0(biases2_address0),       // output [5:0] biases2_address0
  .biases2_ce0(biases2_ce0),       // output  biases2_ce0
  .biases2_we0(biases2_we0),       // output  biases2_we0
  .biases2_d0(biases2_d0),       // output [63:0] biases2_d0
  .biases2_q0(biases2_q0),       // input [63:0] biases2_q0
  .biases3_address0(biases3_address0),       // output [1:0] biases3_address0
  .biases3_ce0(biases3_ce0),       // output  biases3_ce0
  .biases3_we0(biases3_we0),       // output  biases3_we0
  .biases3_d0(biases3_d0),       // output [63:0] biases3_d0
  .biases3_q0(biases3_q0),       // input [63:0] biases3_q0
  .training_data_address0(training_data_address0),       // output [11:0] training_data_address0
  .training_data_ce0(training_data_ce0),       // output  training_data_ce0
  .training_data_q0(training_data_q0),       // input [63:0] training_data_q0
  .training_targets_address0(training_targets_address0),       // output [8:0] training_targets_address0
  .training_targets_ce0(training_targets_ce0),       // output  training_targets_ce0
  .training_targets_q0(training_targets_q0)        // input [63:0] training_targets_q0
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

