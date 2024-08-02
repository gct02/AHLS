//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Fri Aug  2 16:01:56 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
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
    data_address0,
    data_ce0,
    data_q0,
    label_r_address0,
    label_r_ce0,
    label_r_q0,
    theta_address0,
    theta_address1,
    theta_ce0,
    theta_ce1,
    theta_d0,
    theta_q0,
    theta_q1,
    theta_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DATA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DATA_ADDRESS0, LAYERED_METADATA undef" *) output [16:0]data_address0;
  output data_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DATA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DATA_Q0, LAYERED_METADATA undef" *) input [31:0]data_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LABEL_R_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LABEL_R_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]label_r_address0;
  output label_r_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LABEL_R_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LABEL_R_Q0, LAYERED_METADATA undef" *) input [7:0]label_r_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.THETA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.THETA_ADDRESS0, LAYERED_METADATA undef" *) output [9:0]theta_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.THETA_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.THETA_ADDRESS1, LAYERED_METADATA undef" *) output [9:0]theta_address1;
  output theta_ce0;
  output theta_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.THETA_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.THETA_D0, LAYERED_METADATA undef" *) output [31:0]theta_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.THETA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.THETA_Q0, LAYERED_METADATA undef" *) input [31:0]theta_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.THETA_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.THETA_Q1, LAYERED_METADATA undef" *) input [31:0]theta_q1;
  output theta_we0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [31:0]data_q0_0_1;
  wire [16:0]hls_inst_data_address0;
  wire hls_inst_data_ce0;
  wire [6:0]hls_inst_label_r_address0;
  wire hls_inst_label_r_ce0;
  wire [9:0]hls_inst_theta_address0;
  wire [9:0]hls_inst_theta_address1;
  wire hls_inst_theta_ce0;
  wire hls_inst_theta_ce1;
  wire [31:0]hls_inst_theta_d0;
  wire hls_inst_theta_we0;
  wire [7:0]label_r_q0_0_1;
  wire [31:0]theta_q0_0_1;
  wire [31:0]theta_q1_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign data_address0[16:0] = hls_inst_data_address0;
  assign data_ce0 = hls_inst_data_ce0;
  assign data_q0_0_1 = data_q0[31:0];
  assign label_r_address0[6:0] = hls_inst_label_r_address0;
  assign label_r_ce0 = hls_inst_label_r_ce0;
  assign label_r_q0_0_1 = label_r_q0[7:0];
  assign theta_address0[9:0] = hls_inst_theta_address0;
  assign theta_address1[9:0] = hls_inst_theta_address1;
  assign theta_ce0 = hls_inst_theta_ce0;
  assign theta_ce1 = hls_inst_theta_ce1;
  assign theta_d0[31:0] = hls_inst_theta_d0;
  assign theta_q0_0_1 = theta_q0[31:0];
  assign theta_q1_0_1 = theta_q1[31:0];
  assign theta_we0 = hls_inst_theta_we0;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .data_address0(hls_inst_data_address0),
        .data_ce0(hls_inst_data_ce0),
        .data_q0(data_q0_0_1),
        .label_r_address0(hls_inst_label_r_address0),
        .label_r_ce0(hls_inst_label_r_ce0),
        .label_r_q0(label_r_q0_0_1),
        .theta_address0(hls_inst_theta_address0),
        .theta_address1(hls_inst_theta_address1),
        .theta_ce0(hls_inst_theta_ce0),
        .theta_ce1(hls_inst_theta_ce1),
        .theta_d0(hls_inst_theta_d0),
        .theta_q0(theta_q0_0_1),
        .theta_q1(theta_q1_0_1),
        .theta_we0(hls_inst_theta_we0));
endmodule
