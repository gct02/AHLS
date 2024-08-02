// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Aug  2 16:02:52 2024
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/vitis_projects/rosetta/spam/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "SgdLR,Vivado 2023.2" *)
module bd_0_hls_inst_0(data_ce0, label_r_ce0, theta_ce0, theta_we0, 
  theta_ce1, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, data_address0, data_q0, 
  label_r_address0, label_r_q0, theta_address0, theta_d0, theta_q0, theta_address1, theta_q1)
/* synthesis syn_black_box black_box_pad_pin="data_ce0,label_r_ce0,theta_ce0,theta_we0,theta_ce1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,data_address0[16:0],data_q0[31:0],label_r_address0[6:0],label_r_q0[7:0],theta_address0[9:0],theta_d0[31:0],theta_q0[31:0],theta_address1[9:0],theta_q1[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output data_ce0;
  output label_r_ce0;
  output theta_ce0;
  output theta_we0;
  output theta_ce1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [16:0]data_address0;
  input [31:0]data_q0;
  output [6:0]label_r_address0;
  input [7:0]label_r_q0;
  output [9:0]theta_address0;
  output [31:0]theta_d0;
  input [31:0]theta_q0;
  output [9:0]theta_address1;
  input [31:0]theta_q1;
endmodule
