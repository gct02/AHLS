// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Jul  2 18:23:46 2025
// Host        : H410M-H-V3 running 64-bit Linux Mint 20.2
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/RAISE/dataset_gen/base_solutions/GRAMSCHMIDT/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "kernel_gramschmidt,Vivado 2023.2" *)
module bd_0_hls_inst_0(A_ce0, A_we0, R_ce0, R_we0, Q_ce0, Q_we0, ap_clk, 
  ap_rst, ap_start, ap_done, ap_idle, ap_ready, ni, nj, A_address0, A_d0, A_q0, R_address0, R_d0, 
  Q_address0, Q_d0, Q_q0)
/* synthesis syn_black_box black_box_pad_pin="A_ce0,A_we0,R_ce0,R_we0,Q_ce0,Q_we0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,ni[31:0],nj[31:0],A_address0[17:0],A_d0[63:0],A_q0[63:0],R_address0[17:0],R_d0[63:0],Q_address0[17:0],Q_d0[63:0],Q_q0[63:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output A_ce0;
  output A_we0;
  output R_ce0;
  output R_we0;
  output Q_ce0;
  output Q_we0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]ni;
  input [31:0]nj;
  output [17:0]A_address0;
  output [63:0]A_d0;
  input [63:0]A_q0;
  output [17:0]R_address0;
  output [63:0]R_d0;
  output [17:0]Q_address0;
  output [63:0]Q_d0;
  input [63:0]Q_q0;
endmodule
