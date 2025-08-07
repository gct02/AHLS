// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Aug  6 20:27:23 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/BACKPROP/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "backprop,Vivado 2023.2" *)
module bd_0_hls_inst_0(weights1_ce0, weights1_we0, weights2_ce0, 
  weights2_we0, weights3_ce0, weights3_we0, biases1_ce0, biases1_we0, biases2_ce0, biases2_we0, 
  biases3_ce0, biases3_we0, training_data_ce0, training_targets_ce0, ap_clk, ap_rst, ap_start, 
  ap_done, ap_idle, ap_ready, weights1_address0, weights1_d0, weights1_q0, weights2_address0, 
  weights2_d0, weights2_q0, weights3_address0, weights3_d0, weights3_q0, biases1_address0, 
  biases1_d0, biases1_q0, biases2_address0, biases2_d0, biases2_q0, biases3_address0, 
  biases3_d0, biases3_q0, training_data_address0, training_data_q0, 
  training_targets_address0, training_targets_q0)
/* synthesis syn_black_box black_box_pad_pin="weights1_ce0,weights1_we0,weights2_ce0,weights2_we0,weights3_ce0,weights3_we0,biases1_ce0,biases1_we0,biases2_ce0,biases2_we0,biases3_ce0,biases3_we0,training_data_ce0,training_targets_ce0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,weights1_address0[9:0],weights1_d0[63:0],weights1_q0[63:0],weights2_address0[11:0],weights2_d0[63:0],weights2_q0[63:0],weights3_address0[7:0],weights3_d0[63:0],weights3_q0[63:0],biases1_address0[5:0],biases1_d0[63:0],biases1_q0[63:0],biases2_address0[5:0],biases2_d0[63:0],biases2_q0[63:0],biases3_address0[1:0],biases3_d0[63:0],biases3_q0[63:0],training_data_address0[11:0],training_data_q0[63:0],training_targets_address0[8:0],training_targets_q0[63:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output weights1_ce0;
  output weights1_we0;
  output weights2_ce0;
  output weights2_we0;
  output weights3_ce0;
  output weights3_we0;
  output biases1_ce0;
  output biases1_we0;
  output biases2_ce0;
  output biases2_we0;
  output biases3_ce0;
  output biases3_we0;
  output training_data_ce0;
  output training_targets_ce0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [9:0]weights1_address0;
  output [63:0]weights1_d0;
  input [63:0]weights1_q0;
  output [11:0]weights2_address0;
  output [63:0]weights2_d0;
  input [63:0]weights2_q0;
  output [7:0]weights3_address0;
  output [63:0]weights3_d0;
  input [63:0]weights3_q0;
  output [5:0]biases1_address0;
  output [63:0]biases1_d0;
  input [63:0]biases1_q0;
  output [5:0]biases2_address0;
  output [63:0]biases2_d0;
  input [63:0]biases2_q0;
  output [1:0]biases3_address0;
  output [63:0]biases3_d0;
  input [63:0]biases3_q0;
  output [11:0]training_data_address0;
  input [63:0]training_data_q0;
  output [8:0]training_targets_address0;
  input [63:0]training_targets_q0;
endmodule
