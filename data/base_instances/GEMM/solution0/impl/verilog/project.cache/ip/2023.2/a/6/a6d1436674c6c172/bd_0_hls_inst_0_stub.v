// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Mar 29 15:44:18 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bbgemm,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(m1_ce0, m2_ce0, prod_ce0, prod_we0, ap_clk, ap_rst, 
  ap_start, ap_done, ap_idle, ap_ready, m1_address0, m1_q0, m2_address0, m2_q0, prod_address0, 
  prod_d0, prod_q0)
/* synthesis syn_black_box black_box_pad_pin="m1_ce0,m2_ce0,prod_ce0,prod_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,m1_address0[11:0],m1_q0[63:0],m2_address0[11:0],m2_q0[63:0],prod_address0[11:0],prod_d0[63:0],prod_q0[63:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output m1_ce0;
  output m2_ce0;
  output prod_ce0;
  output prod_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [11:0]m1_address0;
  input [63:0]m1_q0;
  output [11:0]m2_address0;
  input [63:0]m2_q0;
  output [11:0]prod_address0;
  output [63:0]prod_d0;
  input [63:0]prod_q0;
endmodule
