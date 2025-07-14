//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 03:51:32 2025
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (A_address0,
    A_ce0,
    A_d0,
    A_q0,
    A_we0,
    Q_address0,
    Q_ce0,
    Q_d0,
    Q_q0,
    Q_we0,
    R_address0,
    R_ce0,
    R_d0,
    R_we0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    ni,
    nj);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.A_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.A_ADDRESS0, LAYERED_METADATA undef" *) output [17:0]A_address0;
  output A_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.A_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.A_D0, LAYERED_METADATA undef" *) output [63:0]A_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.A_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.A_Q0, LAYERED_METADATA undef" *) input [63:0]A_q0;
  output A_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.Q_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.Q_ADDRESS0, LAYERED_METADATA undef" *) output [17:0]Q_address0;
  output Q_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.Q_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.Q_D0, LAYERED_METADATA undef" *) output [63:0]Q_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.Q_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.Q_Q0, LAYERED_METADATA undef" *) input [63:0]Q_q0;
  output Q_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.R_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.R_ADDRESS0, LAYERED_METADATA undef" *) output [17:0]R_address0;
  output R_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.R_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.R_D0, LAYERED_METADATA undef" *) output [63:0]R_d0;
  output R_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NI DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NI, LAYERED_METADATA undef" *) input [31:0]ni;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NJ DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NJ, LAYERED_METADATA undef" *) input [31:0]nj;

  wire [63:0]A_q0_0_1;
  wire [63:0]Q_q0_0_1;
  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [17:0]hls_inst_A_address0;
  wire hls_inst_A_ce0;
  wire [63:0]hls_inst_A_d0;
  wire hls_inst_A_we0;
  wire [17:0]hls_inst_Q_address0;
  wire hls_inst_Q_ce0;
  wire [63:0]hls_inst_Q_d0;
  wire hls_inst_Q_we0;
  wire [17:0]hls_inst_R_address0;
  wire hls_inst_R_ce0;
  wire [63:0]hls_inst_R_d0;
  wire hls_inst_R_we0;
  wire [31:0]ni_0_1;
  wire [31:0]nj_0_1;

  assign A_address0[17:0] = hls_inst_A_address0;
  assign A_ce0 = hls_inst_A_ce0;
  assign A_d0[63:0] = hls_inst_A_d0;
  assign A_q0_0_1 = A_q0[63:0];
  assign A_we0 = hls_inst_A_we0;
  assign Q_address0[17:0] = hls_inst_Q_address0;
  assign Q_ce0 = hls_inst_Q_ce0;
  assign Q_d0[63:0] = hls_inst_Q_d0;
  assign Q_q0_0_1 = Q_q0[63:0];
  assign Q_we0 = hls_inst_Q_we0;
  assign R_address0[17:0] = hls_inst_R_address0;
  assign R_ce0 = hls_inst_R_ce0;
  assign R_d0[63:0] = hls_inst_R_d0;
  assign R_we0 = hls_inst_R_we0;
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign ni_0_1 = ni[31:0];
  assign nj_0_1 = nj[31:0];
  bd_0_hls_inst_0 hls_inst
       (.A_address0(hls_inst_A_address0),
        .A_ce0(hls_inst_A_ce0),
        .A_d0(hls_inst_A_d0),
        .A_q0(A_q0_0_1),
        .A_we0(hls_inst_A_we0),
        .Q_address0(hls_inst_Q_address0),
        .Q_ce0(hls_inst_Q_ce0),
        .Q_d0(hls_inst_Q_d0),
        .Q_q0(Q_q0_0_1),
        .Q_we0(hls_inst_Q_we0),
        .R_address0(hls_inst_R_address0),
        .R_ce0(hls_inst_R_ce0),
        .R_d0(hls_inst_R_d0),
        .R_we0(hls_inst_R_we0),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .ni(ni_0_1),
        .nj(nj_0_1));
endmodule
