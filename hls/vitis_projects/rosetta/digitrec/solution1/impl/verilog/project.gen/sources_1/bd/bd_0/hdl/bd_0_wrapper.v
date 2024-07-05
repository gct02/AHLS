//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sun Jun 23 07:14:24 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    results_address0,
    results_ce0,
    results_d0,
    results_we0,
    test_set_address0,
    test_set_address1,
    test_set_ce0,
    test_set_ce1,
    test_set_q0,
    test_set_q1,
    training_labels_address0,
    training_labels_ce0,
    training_labels_q0,
    training_samples_address0,
    training_samples_address1,
    training_samples_ce0,
    training_samples_ce1,
    training_samples_q0,
    training_samples_q1);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [8:0]results_address0;
  output results_ce0;
  output [7:0]results_d0;
  output results_we0;
  output [10:0]test_set_address0;
  output [10:0]test_set_address1;
  output test_set_ce0;
  output test_set_ce1;
  input [63:0]test_set_q0;
  input [63:0]test_set_q1;
  output [11:0]training_labels_address0;
  output training_labels_ce0;
  input [7:0]training_labels_q0;
  output [13:0]training_samples_address0;
  output [13:0]training_samples_address1;
  output training_samples_ce0;
  output training_samples_ce1;
  input [63:0]training_samples_q0;
  input [63:0]training_samples_q1;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [8:0]results_address0;
  wire results_ce0;
  wire [7:0]results_d0;
  wire results_we0;
  wire [10:0]test_set_address0;
  wire [10:0]test_set_address1;
  wire test_set_ce0;
  wire test_set_ce1;
  wire [63:0]test_set_q0;
  wire [63:0]test_set_q1;
  wire [11:0]training_labels_address0;
  wire training_labels_ce0;
  wire [7:0]training_labels_q0;
  wire [13:0]training_samples_address0;
  wire [13:0]training_samples_address1;
  wire training_samples_ce0;
  wire training_samples_ce1;
  wire [63:0]training_samples_q0;
  wire [63:0]training_samples_q1;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .results_address0(results_address0),
        .results_ce0(results_ce0),
        .results_d0(results_d0),
        .results_we0(results_we0),
        .test_set_address0(test_set_address0),
        .test_set_address1(test_set_address1),
        .test_set_ce0(test_set_ce0),
        .test_set_ce1(test_set_ce1),
        .test_set_q0(test_set_q0),
        .test_set_q1(test_set_q1),
        .training_labels_address0(training_labels_address0),
        .training_labels_ce0(training_labels_ce0),
        .training_labels_q0(training_labels_q0),
        .training_samples_address0(training_samples_address0),
        .training_samples_address1(training_samples_address1),
        .training_samples_ce0(training_samples_ce0),
        .training_samples_ce1(training_samples_ce1),
        .training_samples_q0(training_samples_q0),
        .training_samples_q1(training_samples_q1));
endmodule
