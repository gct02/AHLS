//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 03:45:33 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    m1_address0,
    m1_ce0,
    m1_q0,
    m2_address0,
    m2_ce0,
    m2_q0,
    prod_address0,
    prod_ce0,
    prod_d0,
    prod_q0,
    prod_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M1_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]m1_address0;
  output m1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M1_Q0, LAYERED_METADATA undef" *) input [63:0]m1_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M2_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M2_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]m2_address0;
  output m2_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M2_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M2_Q0, LAYERED_METADATA undef" *) input [63:0]m2_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PROD_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PROD_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]prod_address0;
  output prod_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PROD_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PROD_D0, LAYERED_METADATA undef" *) output [63:0]prod_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PROD_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PROD_Q0, LAYERED_METADATA undef" *) input [63:0]prod_q0;
  output prod_we0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [11:0]hls_inst_m1_address0;
  wire hls_inst_m1_ce0;
  wire [11:0]hls_inst_m2_address0;
  wire hls_inst_m2_ce0;
  wire [11:0]hls_inst_prod_address0;
  wire hls_inst_prod_ce0;
  wire [63:0]hls_inst_prod_d0;
  wire hls_inst_prod_we0;
  wire [63:0]m1_q0_0_1;
  wire [63:0]m2_q0_0_1;
  wire [63:0]prod_q0_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign m1_address0[11:0] = hls_inst_m1_address0;
  assign m1_ce0 = hls_inst_m1_ce0;
  assign m1_q0_0_1 = m1_q0[63:0];
  assign m2_address0[11:0] = hls_inst_m2_address0;
  assign m2_ce0 = hls_inst_m2_ce0;
  assign m2_q0_0_1 = m2_q0[63:0];
  assign prod_address0[11:0] = hls_inst_prod_address0;
  assign prod_ce0 = hls_inst_prod_ce0;
  assign prod_d0[63:0] = hls_inst_prod_d0;
  assign prod_q0_0_1 = prod_q0[63:0];
  assign prod_we0 = hls_inst_prod_we0;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .m1_address0(hls_inst_m1_address0),
        .m1_ce0(hls_inst_m1_ce0),
        .m1_q0(m1_q0_0_1),
        .m2_address0(hls_inst_m2_address0),
        .m2_ce0(hls_inst_m2_ce0),
        .m2_q0(m2_q0_0_1),
        .prod_address0(hls_inst_prod_address0),
        .prod_ce0(hls_inst_prod_ce0),
        .prod_d0(hls_inst_prod_d0),
        .prod_q0(prod_q0_0_1),
        .prod_we0(hls_inst_prod_we0));
endmodule
