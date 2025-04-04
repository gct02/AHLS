// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Apr  3 20:47:36 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/SHA/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "sha_stream,Vivado 2023.2" *)
module bd_0_hls_inst_0(indata_ce0, in_i_ce0, outdata_ce0, outdata_we0, 
  ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, indata_address0, indata_q0, in_i_address0, 
  in_i_q0, outdata_address0, outdata_d0)
/* synthesis syn_black_box black_box_pad_pin="indata_ce0,in_i_ce0,outdata_ce0,outdata_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,indata_address0[13:0],indata_q0[7:0],in_i_address0[0:0],in_i_q0[31:0],outdata_address0[2:0],outdata_d0[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output indata_ce0;
  output in_i_ce0;
  output outdata_ce0;
  output outdata_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [13:0]indata_address0;
  input [7:0]indata_q0;
  output [0:0]in_i_address0;
  input [31:0]in_i_q0;
  output [2:0]outdata_address0;
  output [31:0]outdata_d0;
endmodule
