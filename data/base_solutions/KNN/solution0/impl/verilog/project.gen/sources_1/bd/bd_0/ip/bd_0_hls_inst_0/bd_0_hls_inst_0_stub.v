// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu May 29 16:58:50 2025
// Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/KNN/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "md_kernel,Vivado 2023.2" *)
module bd_0_hls_inst_0(force_x_ce0, force_x_we0, force_y_ce0, 
  force_y_we0, force_z_ce0, force_z_we0, position_x_ce0, position_y_ce0, position_z_ce0, 
  NL_ce0, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, force_x_address0, force_x_d0, 
  force_y_address0, force_y_d0, force_z_address0, force_z_d0, position_x_address0, 
  position_x_q0, position_y_address0, position_y_q0, position_z_address0, position_z_q0, 
  NL_address0, NL_q0)
/* synthesis syn_black_box black_box_pad_pin="force_x_ce0,force_x_we0,force_y_ce0,force_y_we0,force_z_ce0,force_z_we0,position_x_ce0,position_y_ce0,position_z_ce0,NL_ce0,ap_rst,ap_start,ap_done,ap_idle,ap_ready,force_x_address0[7:0],force_x_d0[63:0],force_y_address0[7:0],force_y_d0[63:0],force_z_address0[7:0],force_z_d0[63:0],position_x_address0[7:0],position_x_q0[63:0],position_y_address0[7:0],position_y_q0[63:0],position_z_address0[7:0],position_z_q0[63:0],NL_address0[11:0],NL_q0[31:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  output force_x_ce0;
  output force_x_we0;
  output force_y_ce0;
  output force_y_we0;
  output force_z_ce0;
  output force_z_we0;
  output position_x_ce0;
  output position_y_ce0;
  output position_z_ce0;
  output NL_ce0;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [7:0]force_x_address0;
  output [63:0]force_x_d0;
  output [7:0]force_y_address0;
  output [63:0]force_y_d0;
  output [7:0]force_z_address0;
  output [63:0]force_z_d0;
  output [7:0]position_x_address0;
  input [63:0]position_x_q0;
  output [7:0]position_y_address0;
  input [63:0]position_y_q0;
  output [7:0]position_z_address0;
  input [63:0]position_z_q0;
  output [11:0]NL_address0;
  input [31:0]NL_q0;
endmodule
