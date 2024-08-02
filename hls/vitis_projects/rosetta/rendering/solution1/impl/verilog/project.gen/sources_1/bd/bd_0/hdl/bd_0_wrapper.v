//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Fri Aug  2 01:52:07 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    num_3d_tri,
    output_r_address0,
    output_r_ce0,
    output_r_d0,
    output_r_we0,
    triangle_3ds);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  input [31:0]num_3d_tri;
  output [15:0]output_r_address0;
  output output_r_ce0;
  output [7:0]output_r_d0;
  output output_r_we0;
  input [71:0]triangle_3ds;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [31:0]num_3d_tri;
  wire [15:0]output_r_address0;
  wire output_r_ce0;
  wire [7:0]output_r_d0;
  wire output_r_we0;
  wire [71:0]triangle_3ds;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .num_3d_tri(num_3d_tri),
        .output_r_address0(output_r_address0),
        .output_r_ce0(output_r_ce0),
        .output_r_d0(output_r_d0),
        .output_r_we0(output_r_we0),
        .triangle_3ds(triangle_3ds));
endmodule
