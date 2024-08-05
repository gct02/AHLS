// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Aug  2 16:11:56 2024
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "adpcm_main,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(input_samples_ce0, input_samples_ce1, 
  compressed_ce0, compressed_we0, result_ce0, result_we0, result_ce1, result_we1, ap_clk, ap_rst, 
  ap_start, ap_done, ap_idle, ap_ready, input_samples_address0, input_samples_q0, 
  input_samples_address1, input_samples_q1, compressed_address0, compressed_d0, 
  compressed_q0, result_address0, result_d0, result_address1, result_d1)
/* synthesis syn_black_box black_box_pad_pin="input_samples_ce0,input_samples_ce1,compressed_ce0,compressed_we0,result_ce0,result_we0,result_ce1,result_we1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,input_samples_address0[12:0],input_samples_q0[31:0],input_samples_address1[12:0],input_samples_q1[31:0],compressed_address0[11:0],compressed_d0[31:0],compressed_q0[31:0],result_address0[12:0],result_d0[31:0],result_address1[12:0],result_d1[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output input_samples_ce0;
  output input_samples_ce1;
  output compressed_ce0;
  output compressed_we0;
  output result_ce0;
  output result_we0;
  output result_ce1;
  output result_we1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [12:0]input_samples_address0;
  input [31:0]input_samples_q0;
  output [12:0]input_samples_address1;
  input [31:0]input_samples_q1;
  output [11:0]compressed_address0;
  output [31:0]compressed_d0;
  input [31:0]compressed_q0;
  output [12:0]result_address0;
  output [31:0]result_d0;
  output [12:0]result_address1;
  output [31:0]result_d1;
endmodule
