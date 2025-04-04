//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Mon Mar 31 15:33:33 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (LARc_address0,
    LARc_address1,
    LARc_ce0,
    LARc_ce1,
    LARc_d0,
    LARc_d1,
    LARc_q0,
    LARc_q1,
    LARc_we0,
    LARc_we1,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    indata_address0,
    indata_address1,
    indata_ce0,
    indata_ce1,
    indata_d0,
    indata_d1,
    indata_q0,
    indata_q1,
    indata_we0,
    indata_we1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_ADDRESS0, LAYERED_METADATA undef" *) output [2:0]LARc_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_ADDRESS1, LAYERED_METADATA undef" *) output [2:0]LARc_address1;
  output LARc_ce0;
  output LARc_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_D0, LAYERED_METADATA undef" *) output [15:0]LARc_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_D1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_D1, LAYERED_METADATA undef" *) output [15:0]LARc_d1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_Q0, LAYERED_METADATA undef" *) input [15:0]LARc_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LARC_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LARC_Q1, LAYERED_METADATA undef" *) input [15:0]LARc_q1;
  output LARc_we0;
  output LARc_we1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]indata_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_ADDRESS1, LAYERED_METADATA undef" *) output [7:0]indata_address1;
  output indata_ce0;
  output indata_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_D0, LAYERED_METADATA undef" *) output [15:0]indata_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_D1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_D1, LAYERED_METADATA undef" *) output [15:0]indata_d1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_Q0, LAYERED_METADATA undef" *) input [15:0]indata_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDATA_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDATA_Q1, LAYERED_METADATA undef" *) input [15:0]indata_q1;
  output indata_we0;
  output indata_we1;

  wire [15:0]LARc_q0_0_1;
  wire [15:0]LARc_q1_0_1;
  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [2:0]hls_inst_LARc_address0;
  wire [2:0]hls_inst_LARc_address1;
  wire hls_inst_LARc_ce0;
  wire hls_inst_LARc_ce1;
  wire [15:0]hls_inst_LARc_d0;
  wire [15:0]hls_inst_LARc_d1;
  wire hls_inst_LARc_we0;
  wire hls_inst_LARc_we1;
  wire [7:0]hls_inst_indata_address0;
  wire [7:0]hls_inst_indata_address1;
  wire hls_inst_indata_ce0;
  wire hls_inst_indata_ce1;
  wire [15:0]hls_inst_indata_d0;
  wire [15:0]hls_inst_indata_d1;
  wire hls_inst_indata_we0;
  wire hls_inst_indata_we1;
  wire [15:0]indata_q0_0_1;
  wire [15:0]indata_q1_0_1;

  assign LARc_address0[2:0] = hls_inst_LARc_address0;
  assign LARc_address1[2:0] = hls_inst_LARc_address1;
  assign LARc_ce0 = hls_inst_LARc_ce0;
  assign LARc_ce1 = hls_inst_LARc_ce1;
  assign LARc_d0[15:0] = hls_inst_LARc_d0;
  assign LARc_d1[15:0] = hls_inst_LARc_d1;
  assign LARc_q0_0_1 = LARc_q0[15:0];
  assign LARc_q1_0_1 = LARc_q1[15:0];
  assign LARc_we0 = hls_inst_LARc_we0;
  assign LARc_we1 = hls_inst_LARc_we1;
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign indata_address0[7:0] = hls_inst_indata_address0;
  assign indata_address1[7:0] = hls_inst_indata_address1;
  assign indata_ce0 = hls_inst_indata_ce0;
  assign indata_ce1 = hls_inst_indata_ce1;
  assign indata_d0[15:0] = hls_inst_indata_d0;
  assign indata_d1[15:0] = hls_inst_indata_d1;
  assign indata_q0_0_1 = indata_q0[15:0];
  assign indata_q1_0_1 = indata_q1[15:0];
  assign indata_we0 = hls_inst_indata_we0;
  assign indata_we1 = hls_inst_indata_we1;
  bd_0_hls_inst_0 hls_inst
       (.LARc_address0(hls_inst_LARc_address0),
        .LARc_address1(hls_inst_LARc_address1),
        .LARc_ce0(hls_inst_LARc_ce0),
        .LARc_ce1(hls_inst_LARc_ce1),
        .LARc_d0(hls_inst_LARc_d0),
        .LARc_d1(hls_inst_LARc_d1),
        .LARc_q0(LARc_q0_0_1),
        .LARc_q1(LARc_q1_0_1),
        .LARc_we0(hls_inst_LARc_we0),
        .LARc_we1(hls_inst_LARc_we1),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .indata_address0(hls_inst_indata_address0),
        .indata_address1(hls_inst_indata_address1),
        .indata_ce0(hls_inst_indata_ce0),
        .indata_ce1(hls_inst_indata_ce1),
        .indata_d0(hls_inst_indata_d0),
        .indata_d1(hls_inst_indata_d1),
        .indata_q0(indata_q0_0_1),
        .indata_q1(indata_q1_0_1),
        .indata_we0(hls_inst_indata_we0),
        .indata_we1(hls_inst_indata_we1));
endmodule
