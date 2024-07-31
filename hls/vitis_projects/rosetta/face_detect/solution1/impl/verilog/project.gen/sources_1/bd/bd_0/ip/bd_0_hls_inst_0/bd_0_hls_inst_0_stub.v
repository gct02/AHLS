// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Jul 30 14:29:56 2024
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/vitis_projects/rosetta/face_detect/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "face_detect,Vivado 2023.2" *)
module bd_0_hls_inst_0(Data_ce0, result_x_ce0, result_x_we0, 
  result_y_ce0, result_y_we0, result_w_ce0, result_w_we0, result_h_ce0, result_h_we0, 
  result_size_ap_vld, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, Data_address0, Data_q0, 
  result_x_address0, result_x_d0, result_y_address0, result_y_d0, result_w_address0, 
  result_w_d0, result_h_address0, result_h_d0, result_size)
/* synthesis syn_black_box black_box_pad_pin="Data_ce0,result_x_ce0,result_x_we0,result_y_ce0,result_y_we0,result_w_ce0,result_w_we0,result_h_ce0,result_h_we0,result_size_ap_vld,ap_rst,ap_start,ap_done,ap_idle,ap_ready,Data_address0[16:0],Data_q0[7:0],result_x_address0[6:0],result_x_d0[31:0],result_y_address0[6:0],result_y_d0[31:0],result_w_address0[6:0],result_w_d0[31:0],result_h_address0[6:0],result_h_d0[31:0],result_size[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output Data_ce0;
  output result_x_ce0;
  output result_x_we0;
  output result_y_ce0;
  output result_y_we0;
  output result_w_ce0;
  output result_w_we0;
  output result_h_ce0;
  output result_h_we0;
  output result_size_ap_vld;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [16:0]Data_address0;
  input [7:0]Data_q0;
  output [6:0]result_x_address0;
  output [31:0]result_x_d0;
  output [6:0]result_y_address0;
  output [31:0]result_y_d0;
  output [6:0]result_w_address0;
  output [31:0]result_w_d0;
  output [6:0]result_h_address0;
  output [31:0]result_h_d0;
  output [31:0]result_size;
endmodule
