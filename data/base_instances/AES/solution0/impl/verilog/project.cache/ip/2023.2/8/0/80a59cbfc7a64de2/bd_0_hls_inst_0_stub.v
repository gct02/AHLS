// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu May 29 14:56:25 2025
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
(* X_CORE_INFO = "aes_main,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(statemt_ce0, statemt_we0, statemt_ce1, 
  statemt_we1, key_ce0, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, ap_return, 
  statemt_address0, statemt_d0, statemt_q0, statemt_address1, statemt_d1, statemt_q1, 
  key_address0, key_q0)
/* synthesis syn_black_box black_box_pad_pin="statemt_ce0,statemt_we0,statemt_ce1,statemt_we1,key_ce0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,ap_return[31:0],statemt_address0[4:0],statemt_d0[31:0],statemt_q0[31:0],statemt_address1[4:0],statemt_d1[31:0],statemt_q1[31:0],key_address0[4:0],key_q0[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output statemt_ce0;
  output statemt_we0;
  output statemt_ce1;
  output statemt_we1;
  output key_ce0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0]ap_return;
  output [4:0]statemt_address0;
  output [31:0]statemt_d0;
  input [31:0]statemt_q0;
  output [4:0]statemt_address1;
  output [31:0]statemt_d1;
  input [31:0]statemt_q1;
  output [4:0]key_address0;
  input [31:0]key_q0;
endmodule
