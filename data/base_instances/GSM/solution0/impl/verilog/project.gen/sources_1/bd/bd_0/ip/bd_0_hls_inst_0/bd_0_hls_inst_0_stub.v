// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Feb 28 00:25:12 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/GSM/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Gsm_LPC_Analysis,Vivado 2023.2" *)
module bd_0_hls_inst_0(indata_ce0, indata_we0, indata_ce1, LARc_ce0, 
  LARc_we0, LARc_ce1, LARc_we1, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, 
  indata_address0, indata_d0, indata_q0, indata_address1, indata_q1, LARc_address0, LARc_d0, 
  LARc_q0, LARc_address1, LARc_d1, LARc_q1)
/* synthesis syn_black_box black_box_pad_pin="indata_ce0,indata_we0,indata_ce1,LARc_ce0,LARc_we0,LARc_ce1,LARc_we1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,indata_address0[7:0],indata_d0[15:0],indata_q0[15:0],indata_address1[7:0],indata_q1[15:0],LARc_address0[2:0],LARc_d0[15:0],LARc_q0[15:0],LARc_address1[2:0],LARc_d1[15:0],LARc_q1[15:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output indata_ce0;
  output indata_we0;
  output indata_ce1;
  output LARc_ce0;
  output LARc_we0;
  output LARc_ce1;
  output LARc_we1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [7:0]indata_address0;
  output [15:0]indata_d0;
  input [15:0]indata_q0;
  output [7:0]indata_address1;
  input [15:0]indata_q1;
  output [2:0]LARc_address0;
  output [15:0]LARc_d0;
  input [15:0]LARc_q0;
  output [2:0]LARc_address1;
  output [15:0]LARc_d1;
  input [15:0]LARc_q1;
endmodule
