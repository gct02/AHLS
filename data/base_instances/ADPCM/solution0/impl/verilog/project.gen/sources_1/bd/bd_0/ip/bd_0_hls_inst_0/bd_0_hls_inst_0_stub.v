// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri May 30 21:18:44 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/ADPCM/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "adpcm_main,Vivado 2023.2" *)
module bd_0_hls_inst_0(in_data_ce0, in_data_ce1, encoded_ce0, 
  encoded_we0, decoded_ce0, decoded_we0, decoded_ce1, decoded_we1, ap_clk, ap_rst, ap_start, 
  ap_done, ap_idle, ap_ready, in_data_address0, in_data_q0, in_data_address1, in_data_q1, 
  encoded_address0, encoded_d0, encoded_q0, decoded_address0, decoded_d0, decoded_address1, 
  decoded_d1)
/* synthesis syn_black_box black_box_pad_pin="in_data_ce0,in_data_ce1,encoded_ce0,encoded_we0,decoded_ce0,decoded_we0,decoded_ce1,decoded_we1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,in_data_address0[6:0],in_data_q0[31:0],in_data_address1[6:0],in_data_q1[31:0],encoded_address0[5:0],encoded_d0[31:0],encoded_q0[31:0],decoded_address0[6:0],decoded_d0[31:0],decoded_address1[6:0],decoded_d1[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output in_data_ce0;
  output in_data_ce1;
  output encoded_ce0;
  output encoded_we0;
  output decoded_ce0;
  output decoded_we0;
  output decoded_ce1;
  output decoded_we1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [6:0]in_data_address0;
  input [31:0]in_data_q0;
  output [6:0]in_data_address1;
  input [31:0]in_data_q1;
  output [5:0]encoded_address0;
  output [31:0]encoded_d0;
  input [31:0]encoded_q0;
  output [6:0]decoded_address0;
  output [31:0]decoded_d0;
  output [6:0]decoded_address1;
  output [31:0]decoded_d1;
endmodule
