// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Mar 29 16:07:12 2025
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
(* X_CORE_INFO = "stencil3d,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(C_ce0, C_ce1, orig_ce0, orig_ce1, sol_ce0, sol_we0, 
  sol_ce1, sol_we1, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, C_address0, C_q0, C_address1, 
  C_q1, orig_address0, orig_q0, orig_address1, orig_q1, sol_address0, sol_d0, sol_address1, sol_d1)
/* synthesis syn_black_box black_box_pad_pin="C_ce0,C_ce1,orig_ce0,orig_ce1,sol_ce0,sol_we0,sol_ce1,sol_we1,ap_rst,ap_start,ap_done,ap_idle,ap_ready,C_address0[0:0],C_q0[31:0],C_address1[0:0],C_q1[31:0],orig_address0[10:0],orig_q0[31:0],orig_address1[10:0],orig_q1[31:0],sol_address0[10:0],sol_d0[31:0],sol_address1[10:0],sol_d1[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output C_ce0;
  output C_ce1;
  output orig_ce0;
  output orig_ce1;
  output sol_ce0;
  output sol_we0;
  output sol_ce1;
  output sol_we1;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [0:0]C_address0;
  input [31:0]C_q0;
  output [0:0]C_address1;
  input [31:0]C_q1;
  output [10:0]orig_address0;
  input [31:0]orig_q0;
  output [10:0]orig_address1;
  input [31:0]orig_q1;
  output [10:0]sol_address0;
  output [31:0]sol_d0;
  output [10:0]sol_address1;
  output [31:0]sol_d1;
endmodule
