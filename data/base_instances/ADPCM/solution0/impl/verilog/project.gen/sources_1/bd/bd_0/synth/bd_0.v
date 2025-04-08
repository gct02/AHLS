//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Tue Mar 25 17:17:18 2025
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
    decoded_address0,
    decoded_address1,
    decoded_ce0,
    decoded_ce1,
    decoded_d0,
    decoded_d1,
    decoded_we0,
    decoded_we1,
    encoded_address0,
    encoded_ce0,
    encoded_d0,
    encoded_q0,
    encoded_we0,
    in_data_address0,
    in_data_address1,
    in_data_ce0,
    in_data_ce1,
    in_data_q0,
    in_data_q1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DECODED_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DECODED_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]decoded_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DECODED_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DECODED_ADDRESS1, LAYERED_METADATA undef" *) output [6:0]decoded_address1;
  output decoded_ce0;
  output decoded_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DECODED_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DECODED_D0, LAYERED_METADATA undef" *) output [31:0]decoded_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DECODED_D1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DECODED_D1, LAYERED_METADATA undef" *) output [31:0]decoded_d1;
  output decoded_we0;
  output decoded_we1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ENCODED_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ENCODED_ADDRESS0, LAYERED_METADATA undef" *) output [5:0]encoded_address0;
  output encoded_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ENCODED_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ENCODED_D0, LAYERED_METADATA undef" *) output [31:0]encoded_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ENCODED_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ENCODED_Q0, LAYERED_METADATA undef" *) input [31:0]encoded_q0;
  output encoded_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_DATA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_DATA_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]in_data_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_DATA_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_DATA_ADDRESS1, LAYERED_METADATA undef" *) output [6:0]in_data_address1;
  output in_data_ce0;
  output in_data_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_DATA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_DATA_Q0, LAYERED_METADATA undef" *) input [31:0]in_data_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_DATA_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_DATA_Q1, LAYERED_METADATA undef" *) input [31:0]in_data_q1;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [31:0]encoded_q0_0_1;
  wire [6:0]hls_inst_decoded_address0;
  wire [6:0]hls_inst_decoded_address1;
  wire hls_inst_decoded_ce0;
  wire hls_inst_decoded_ce1;
  wire [31:0]hls_inst_decoded_d0;
  wire [31:0]hls_inst_decoded_d1;
  wire hls_inst_decoded_we0;
  wire hls_inst_decoded_we1;
  wire [5:0]hls_inst_encoded_address0;
  wire hls_inst_encoded_ce0;
  wire [31:0]hls_inst_encoded_d0;
  wire hls_inst_encoded_we0;
  wire [6:0]hls_inst_in_data_address0;
  wire [6:0]hls_inst_in_data_address1;
  wire hls_inst_in_data_ce0;
  wire hls_inst_in_data_ce1;
  wire [31:0]in_data_q0_0_1;
  wire [31:0]in_data_q1_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign decoded_address0[6:0] = hls_inst_decoded_address0;
  assign decoded_address1[6:0] = hls_inst_decoded_address1;
  assign decoded_ce0 = hls_inst_decoded_ce0;
  assign decoded_ce1 = hls_inst_decoded_ce1;
  assign decoded_d0[31:0] = hls_inst_decoded_d0;
  assign decoded_d1[31:0] = hls_inst_decoded_d1;
  assign decoded_we0 = hls_inst_decoded_we0;
  assign decoded_we1 = hls_inst_decoded_we1;
  assign encoded_address0[5:0] = hls_inst_encoded_address0;
  assign encoded_ce0 = hls_inst_encoded_ce0;
  assign encoded_d0[31:0] = hls_inst_encoded_d0;
  assign encoded_q0_0_1 = encoded_q0[31:0];
  assign encoded_we0 = hls_inst_encoded_we0;
  assign in_data_address0[6:0] = hls_inst_in_data_address0;
  assign in_data_address1[6:0] = hls_inst_in_data_address1;
  assign in_data_ce0 = hls_inst_in_data_ce0;
  assign in_data_ce1 = hls_inst_in_data_ce1;
  assign in_data_q0_0_1 = in_data_q0[31:0];
  assign in_data_q1_0_1 = in_data_q1[31:0];
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .decoded_address0(hls_inst_decoded_address0),
        .decoded_address1(hls_inst_decoded_address1),
        .decoded_ce0(hls_inst_decoded_ce0),
        .decoded_ce1(hls_inst_decoded_ce1),
        .decoded_d0(hls_inst_decoded_d0),
        .decoded_d1(hls_inst_decoded_d1),
        .decoded_we0(hls_inst_decoded_we0),
        .decoded_we1(hls_inst_decoded_we1),
        .encoded_address0(hls_inst_encoded_address0),
        .encoded_ce0(hls_inst_encoded_ce0),
        .encoded_d0(hls_inst_encoded_d0),
        .encoded_q0(encoded_q0_0_1),
        .encoded_we0(hls_inst_encoded_we0),
        .in_data_address0(hls_inst_in_data_address0),
        .in_data_address1(hls_inst_in_data_address1),
        .in_data_ce0(hls_inst_in_data_ce0),
        .in_data_ce1(hls_inst_in_data_ce1),
        .in_data_q0(in_data_q0_0_1),
        .in_data_q1(in_data_q1_0_1));
endmodule
