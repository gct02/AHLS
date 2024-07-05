// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Jun 23 22:40:12 2024
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
(* X_CORE_INFO = "fn1,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, ap_return, p, p_4, p_7, p_9, p_13, p_15, p_21, p_23)
/* synthesis syn_black_box black_box_pad_pin="ap_rst,ap_start,ap_done,ap_idle,ap_ready,ap_return[31:0],p[63:0],p_4[63:0],p_7[31:0],p_9[15:0],p_13[31:0],p_15[63:0],p_21[63:0],p_23[15:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0]ap_return;
  input [63:0]p;
  input [63:0]p_4;
  input [31:0]p_7;
  input [15:0]p_9;
  input [31:0]p_13;
  input [63:0]p_15;
  input [63:0]p_21;
  input [15:0]p_23;
endmodule
