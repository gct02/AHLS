//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Fri Aug  2 16:10:17 2024
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
    compressed_address0,
    compressed_ce0,
    compressed_d0,
    compressed_q0,
    compressed_we0,
    input_samples_address0,
    input_samples_address1,
    input_samples_ce0,
    input_samples_ce1,
    input_samples_q0,
    input_samples_q1,
    result_address0,
    result_address1,
    result_ce0,
    result_ce1,
    result_d0,
    result_d1,
    result_we0,
    result_we1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMPRESSED_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMPRESSED_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]compressed_address0;
  output compressed_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMPRESSED_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMPRESSED_D0, LAYERED_METADATA undef" *) output [31:0]compressed_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMPRESSED_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMPRESSED_Q0, LAYERED_METADATA undef" *) input [31:0]compressed_q0;
  output compressed_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INPUT_SAMPLES_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INPUT_SAMPLES_ADDRESS0, LAYERED_METADATA undef" *) output [12:0]input_samples_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INPUT_SAMPLES_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INPUT_SAMPLES_ADDRESS1, LAYERED_METADATA undef" *) output [12:0]input_samples_address1;
  output input_samples_ce0;
  output input_samples_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INPUT_SAMPLES_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INPUT_SAMPLES_Q0, LAYERED_METADATA undef" *) input [31:0]input_samples_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INPUT_SAMPLES_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INPUT_SAMPLES_Q1, LAYERED_METADATA undef" *) input [31:0]input_samples_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_ADDRESS0, LAYERED_METADATA undef" *) output [12:0]result_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_ADDRESS1, LAYERED_METADATA undef" *) output [12:0]result_address1;
  output result_ce0;
  output result_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_D0, LAYERED_METADATA undef" *) output [31:0]result_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_D1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_D1, LAYERED_METADATA undef" *) output [31:0]result_d1;
  output result_we0;
  output result_we1;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [31:0]compressed_q0_0_1;
  wire [11:0]hls_inst_compressed_address0;
  wire hls_inst_compressed_ce0;
  wire [31:0]hls_inst_compressed_d0;
  wire hls_inst_compressed_we0;
  wire [12:0]hls_inst_input_samples_address0;
  wire [12:0]hls_inst_input_samples_address1;
  wire hls_inst_input_samples_ce0;
  wire hls_inst_input_samples_ce1;
  wire [12:0]hls_inst_result_address0;
  wire [12:0]hls_inst_result_address1;
  wire hls_inst_result_ce0;
  wire hls_inst_result_ce1;
  wire [31:0]hls_inst_result_d0;
  wire [31:0]hls_inst_result_d1;
  wire hls_inst_result_we0;
  wire hls_inst_result_we1;
  wire [31:0]input_samples_q0_0_1;
  wire [31:0]input_samples_q1_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign compressed_address0[11:0] = hls_inst_compressed_address0;
  assign compressed_ce0 = hls_inst_compressed_ce0;
  assign compressed_d0[31:0] = hls_inst_compressed_d0;
  assign compressed_q0_0_1 = compressed_q0[31:0];
  assign compressed_we0 = hls_inst_compressed_we0;
  assign input_samples_address0[12:0] = hls_inst_input_samples_address0;
  assign input_samples_address1[12:0] = hls_inst_input_samples_address1;
  assign input_samples_ce0 = hls_inst_input_samples_ce0;
  assign input_samples_ce1 = hls_inst_input_samples_ce1;
  assign input_samples_q0_0_1 = input_samples_q0[31:0];
  assign input_samples_q1_0_1 = input_samples_q1[31:0];
  assign result_address0[12:0] = hls_inst_result_address0;
  assign result_address1[12:0] = hls_inst_result_address1;
  assign result_ce0 = hls_inst_result_ce0;
  assign result_ce1 = hls_inst_result_ce1;
  assign result_d0[31:0] = hls_inst_result_d0;
  assign result_d1[31:0] = hls_inst_result_d1;
  assign result_we0 = hls_inst_result_we0;
  assign result_we1 = hls_inst_result_we1;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .compressed_address0(hls_inst_compressed_address0),
        .compressed_ce0(hls_inst_compressed_ce0),
        .compressed_d0(hls_inst_compressed_d0),
        .compressed_q0(compressed_q0_0_1),
        .compressed_we0(hls_inst_compressed_we0),
        .input_samples_address0(hls_inst_input_samples_address0),
        .input_samples_address1(hls_inst_input_samples_address1),
        .input_samples_ce0(hls_inst_input_samples_ce0),
        .input_samples_ce1(hls_inst_input_samples_ce1),
        .input_samples_q0(input_samples_q0_0_1),
        .input_samples_q1(input_samples_q1_0_1),
        .result_address0(hls_inst_result_address0),
        .result_address1(hls_inst_result_address1),
        .result_ce0(hls_inst_result_ce0),
        .result_ce1(hls_inst_result_ce1),
        .result_d0(hls_inst_result_d0),
        .result_d1(hls_inst_result_d1),
        .result_we0(hls_inst_result_we0),
        .result_we1(hls_inst_result_we1));
endmodule
