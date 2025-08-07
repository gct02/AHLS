// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jul 19 17:15:22 2025
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
(* X_CORE_INFO = "top_fn,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(in_arr_ce0, out_arr_ce0, out_arr_we0, ap_clk, 
  ap_rst, ap_start, ap_done, ap_idle, ap_ready, in_arr_address0, in_arr_q0, out_arr_address0, 
  out_arr_d0, out_arr_q0)
/* synthesis syn_black_box black_box_pad_pin="in_arr_ce0,out_arr_ce0,out_arr_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,in_arr_address0[6:0],in_arr_q0[31:0],out_arr_address0[6:0],out_arr_d0[31:0],out_arr_q0[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output in_arr_ce0;
  output out_arr_ce0;
  output out_arr_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [6:0]in_arr_address0;
  input [31:0]in_arr_q0;
  output [6:0]out_arr_address0;
  output [31:0]out_arr_d0;
  input [31:0]out_arr_q0;
endmodule
