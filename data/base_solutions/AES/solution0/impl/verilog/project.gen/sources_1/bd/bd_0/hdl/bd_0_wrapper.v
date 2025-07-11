//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 03:27:23 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
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
    ap_return,
    ap_rst,
    key_address0,
    key_ce0,
    key_q0,
    statemt_address0,
    statemt_address1,
    statemt_ce0,
    statemt_ce1,
    statemt_d0,
    statemt_d1,
    statemt_q0,
    statemt_q1,
    statemt_we0,
    statemt_we1);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  output [31:0]ap_return;
  input ap_rst;
  output [4:0]key_address0;
  output key_ce0;
  input [31:0]key_q0;
  output [4:0]statemt_address0;
  output [4:0]statemt_address1;
  output statemt_ce0;
  output statemt_ce1;
  output [31:0]statemt_d0;
  output [31:0]statemt_d1;
  input [31:0]statemt_q0;
  input [31:0]statemt_q1;
  output statemt_we0;
  output statemt_we1;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire [31:0]ap_return;
  wire ap_rst;
  wire [4:0]key_address0;
  wire key_ce0;
  wire [31:0]key_q0;
  wire [4:0]statemt_address0;
  wire [4:0]statemt_address1;
  wire statemt_ce0;
  wire statemt_ce1;
  wire [31:0]statemt_d0;
  wire [31:0]statemt_d1;
  wire [31:0]statemt_q0;
  wire [31:0]statemt_q1;
  wire statemt_we0;
  wire statemt_we1;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_return(ap_return),
        .ap_rst(ap_rst),
        .key_address0(key_address0),
        .key_ce0(key_ce0),
        .key_q0(key_q0),
        .statemt_address0(statemt_address0),
        .statemt_address1(statemt_address1),
        .statemt_ce0(statemt_ce0),
        .statemt_ce1(statemt_ce1),
        .statemt_d0(statemt_d0),
        .statemt_d1(statemt_d1),
        .statemt_q0(statemt_q0),
        .statemt_q1(statemt_q1),
        .statemt_we0(statemt_we0),
        .statemt_we1(statemt_we1));
endmodule
