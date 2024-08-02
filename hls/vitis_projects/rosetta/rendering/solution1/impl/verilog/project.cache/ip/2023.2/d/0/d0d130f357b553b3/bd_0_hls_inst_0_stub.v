// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Fri Aug  2 01:53:18 2024
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
(* X_CORE_INFO = "rendering,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(output_r_ce0, output_r_we0, ap_clk, ap_rst, 
  ap_start, ap_done, ap_idle, ap_ready, triangle_3ds, output_r_address0, output_r_d0, num_3d_tri)
/* synthesis syn_black_box black_box_pad_pin="output_r_ce0,output_r_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,triangle_3ds[71:0],output_r_address0[15:0],output_r_d0[7:0],num_3d_tri[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output output_r_ce0;
  output output_r_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [71:0]triangle_3ds;
  output [15:0]output_r_address0;
  output [7:0]output_r_d0;
  input [31:0]num_3d_tri;
endmodule
