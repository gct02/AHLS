// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Aug  7 01:59:58 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/TRANS_FFT/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "fft1D_512,Vivado 2023.2" *)
module bd_0_hls_inst_0(work_x_ce0, work_x_we0, work_x_ce1, work_x_we1, 
  work_y_ce0, work_y_we0, work_y_ce1, work_y_we1, ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, work_x_address0, work_x_d0, work_x_q0, work_x_address1, work_x_d1, work_x_q1, 
  work_y_address0, work_y_d0, work_y_q0, work_y_address1, work_y_d1, work_y_q1)
/* synthesis syn_black_box black_box_pad_pin="work_x_ce0,work_x_we0,work_x_ce1,work_x_we1,work_y_ce0,work_y_we0,work_y_ce1,work_y_we1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,work_x_address0[8:0],work_x_d0[63:0],work_x_q0[63:0],work_x_address1[8:0],work_x_d1[63:0],work_x_q1[63:0],work_y_address0[8:0],work_y_d0[63:0],work_y_q0[63:0],work_y_address1[8:0],work_y_d1[63:0],work_y_q1[63:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output work_x_ce0;
  output work_x_we0;
  output work_x_ce1;
  output work_x_we1;
  output work_y_ce0;
  output work_y_we0;
  output work_y_ce1;
  output work_y_we1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [8:0]work_x_address0;
  output [63:0]work_x_d0;
  input [63:0]work_x_q0;
  output [8:0]work_x_address1;
  output [63:0]work_x_d1;
  input [63:0]work_x_q1;
  output [8:0]work_y_address0;
  output [63:0]work_y_d0;
  input [63:0]work_y_q0;
  output [8:0]work_y_address1;
  output [63:0]work_y_d1;
  input [63:0]work_y_q1;
endmodule
