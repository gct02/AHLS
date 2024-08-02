// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Aug  2 01:45:11 2024
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/vitis_projects/rosetta/digitrec/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "DigitRec,Vivado 2023.2" *)
module bd_0_hls_inst_0(training_samples_ce0, training_samples_ce1, 
  test_set_ce0, test_set_ce1, training_labels_ce0, results_ce0, results_we0, ap_clk, ap_rst, 
  ap_start, ap_done, ap_idle, ap_ready, training_samples_address0, training_samples_q0, 
  training_samples_address1, training_samples_q1, test_set_address0, test_set_q0, 
  test_set_address1, test_set_q1, training_labels_address0, training_labels_q0, 
  results_address0, results_d0)
/* synthesis syn_black_box black_box_pad_pin="training_samples_ce0,training_samples_ce1,test_set_ce0,test_set_ce1,training_labels_ce0,results_ce0,results_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,training_samples_address0[13:0],training_samples_q0[63:0],training_samples_address1[13:0],training_samples_q1[63:0],test_set_address0[10:0],test_set_q0[63:0],test_set_address1[10:0],test_set_q1[63:0],training_labels_address0[11:0],training_labels_q0[7:0],results_address0[8:0],results_d0[7:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output training_samples_ce0;
  output training_samples_ce1;
  output test_set_ce0;
  output test_set_ce1;
  output training_labels_ce0;
  output results_ce0;
  output results_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [13:0]training_samples_address0;
  input [63:0]training_samples_q0;
  output [13:0]training_samples_address1;
  input [63:0]training_samples_q1;
  output [10:0]test_set_address0;
  input [63:0]test_set_q0;
  output [10:0]test_set_address1;
  input [63:0]test_set_q1;
  output [11:0]training_labels_address0;
  input [7:0]training_labels_q0;
  output [8:0]results_address0;
  output [7:0]results_d0;
endmodule
