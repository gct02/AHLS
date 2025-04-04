//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sat Mar 29 16:06:30 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (C_address0,
    C_address1,
    C_ce0,
    C_ce1,
    C_q0,
    C_q1,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    orig_address0,
    orig_address1,
    orig_ce0,
    orig_ce1,
    orig_q0,
    orig_q1,
    sol_address0,
    sol_address1,
    sol_ce0,
    sol_ce1,
    sol_d0,
    sol_d1,
    sol_we0,
    sol_we1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.C_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.C_ADDRESS0, LAYERED_METADATA undef" *) output [0:0]C_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.C_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.C_ADDRESS1, LAYERED_METADATA undef" *) output [0:0]C_address1;
  output C_ce0;
  output C_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.C_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.C_Q0, LAYERED_METADATA undef" *) input [31:0]C_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.C_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.C_Q1, LAYERED_METADATA undef" *) input [31:0]C_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]orig_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_ADDRESS1, LAYERED_METADATA undef" *) output [10:0]orig_address1;
  output orig_ce0;
  output orig_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_Q0, LAYERED_METADATA undef" *) input [31:0]orig_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_Q1, LAYERED_METADATA undef" *) input [31:0]orig_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]sol_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_ADDRESS1, LAYERED_METADATA undef" *) output [10:0]sol_address1;
  output sol_ce0;
  output sol_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_D0, LAYERED_METADATA undef" *) output [31:0]sol_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_D1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_D1, LAYERED_METADATA undef" *) output [31:0]sol_d1;
  output sol_we0;
  output sol_we1;

  wire [31:0]C_q0_0_1;
  wire [31:0]C_q1_0_1;
  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [0:0]hls_inst_C_address0;
  wire [0:0]hls_inst_C_address1;
  wire hls_inst_C_ce0;
  wire hls_inst_C_ce1;
  wire [10:0]hls_inst_orig_address0;
  wire [10:0]hls_inst_orig_address1;
  wire hls_inst_orig_ce0;
  wire hls_inst_orig_ce1;
  wire [10:0]hls_inst_sol_address0;
  wire [10:0]hls_inst_sol_address1;
  wire hls_inst_sol_ce0;
  wire hls_inst_sol_ce1;
  wire [31:0]hls_inst_sol_d0;
  wire [31:0]hls_inst_sol_d1;
  wire hls_inst_sol_we0;
  wire hls_inst_sol_we1;
  wire [31:0]orig_q0_0_1;
  wire [31:0]orig_q1_0_1;

  assign C_address0[0] = hls_inst_C_address0;
  assign C_address1[0] = hls_inst_C_address1;
  assign C_ce0 = hls_inst_C_ce0;
  assign C_ce1 = hls_inst_C_ce1;
  assign C_q0_0_1 = C_q0[31:0];
  assign C_q1_0_1 = C_q1[31:0];
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign orig_address0[10:0] = hls_inst_orig_address0;
  assign orig_address1[10:0] = hls_inst_orig_address1;
  assign orig_ce0 = hls_inst_orig_ce0;
  assign orig_ce1 = hls_inst_orig_ce1;
  assign orig_q0_0_1 = orig_q0[31:0];
  assign orig_q1_0_1 = orig_q1[31:0];
  assign sol_address0[10:0] = hls_inst_sol_address0;
  assign sol_address1[10:0] = hls_inst_sol_address1;
  assign sol_ce0 = hls_inst_sol_ce0;
  assign sol_ce1 = hls_inst_sol_ce1;
  assign sol_d0[31:0] = hls_inst_sol_d0;
  assign sol_d1[31:0] = hls_inst_sol_d1;
  assign sol_we0 = hls_inst_sol_we0;
  assign sol_we1 = hls_inst_sol_we1;
  bd_0_hls_inst_0 hls_inst
       (.C_address0(hls_inst_C_address0),
        .C_address1(hls_inst_C_address1),
        .C_ce0(hls_inst_C_ce0),
        .C_ce1(hls_inst_C_ce1),
        .C_q0(C_q0_0_1),
        .C_q1(C_q1_0_1),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .orig_address0(hls_inst_orig_address0),
        .orig_address1(hls_inst_orig_address1),
        .orig_ce0(hls_inst_orig_ce0),
        .orig_ce1(hls_inst_orig_ce1),
        .orig_q0(orig_q0_0_1),
        .orig_q1(orig_q1_0_1),
        .sol_address0(hls_inst_sol_address0),
        .sol_address1(hls_inst_sol_address1),
        .sol_ce0(hls_inst_sol_ce0),
        .sol_ce1(hls_inst_sol_ce1),
        .sol_d0(hls_inst_sol_d0),
        .sol_d1(hls_inst_sol_d1),
        .sol_we0(hls_inst_sol_we0),
        .sol_we1(hls_inst_sol_we1));
endmodule
