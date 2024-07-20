//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sun Jun 23 07:07:09 2024
//Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (Data_address0,
    Data_ce0,
    Data_q0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    result_h_address0,
    result_h_ce0,
    result_h_d0,
    result_h_we0,
    result_size,
    result_size_ap_vld,
    result_w_address0,
    result_w_ce0,
    result_w_d0,
    result_w_we0,
    result_x_address0,
    result_x_ce0,
    result_x_d0,
    result_x_we0,
    result_y_address0,
    result_y_ce0,
    result_y_d0,
    result_y_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DATA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DATA_ADDRESS0, LAYERED_METADATA undef" *) output [16:0]Data_address0;
  output Data_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DATA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DATA_Q0, LAYERED_METADATA undef" *) input [7:0]Data_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_H_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_H_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]result_h_address0;
  output result_h_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_H_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_H_D0, LAYERED_METADATA undef" *) output [31:0]result_h_d0;
  output result_h_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_SIZE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_SIZE, LAYERED_METADATA undef" *) output [31:0]result_size;
  output result_size_ap_vld;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_W_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_W_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]result_w_address0;
  output result_w_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_W_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_W_D0, LAYERED_METADATA undef" *) output [31:0]result_w_d0;
  output result_w_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_X_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_X_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]result_x_address0;
  output result_x_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_X_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_X_D0, LAYERED_METADATA undef" *) output [31:0]result_x_d0;
  output result_x_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_Y_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_Y_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]result_y_address0;
  output result_y_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT_Y_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT_Y_D0, LAYERED_METADATA undef" *) output [31:0]result_y_d0;
  output result_y_we0;

  wire [7:0]Data_q0_0_1;
  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [16:0]hls_inst_Data_address0;
  wire hls_inst_Data_ce0;
  wire [6:0]hls_inst_result_h_address0;
  wire hls_inst_result_h_ce0;
  wire [31:0]hls_inst_result_h_d0;
  wire hls_inst_result_h_we0;
  wire [31:0]hls_inst_result_size;
  wire hls_inst_result_size_ap_vld;
  wire [6:0]hls_inst_result_w_address0;
  wire hls_inst_result_w_ce0;
  wire [31:0]hls_inst_result_w_d0;
  wire hls_inst_result_w_we0;
  wire [6:0]hls_inst_result_x_address0;
  wire hls_inst_result_x_ce0;
  wire [31:0]hls_inst_result_x_d0;
  wire hls_inst_result_x_we0;
  wire [6:0]hls_inst_result_y_address0;
  wire hls_inst_result_y_ce0;
  wire [31:0]hls_inst_result_y_d0;
  wire hls_inst_result_y_we0;

  assign Data_address0[16:0] = hls_inst_Data_address0;
  assign Data_ce0 = hls_inst_Data_ce0;
  assign Data_q0_0_1 = Data_q0[7:0];
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign result_h_address0[6:0] = hls_inst_result_h_address0;
  assign result_h_ce0 = hls_inst_result_h_ce0;
  assign result_h_d0[31:0] = hls_inst_result_h_d0;
  assign result_h_we0 = hls_inst_result_h_we0;
  assign result_size[31:0] = hls_inst_result_size;
  assign result_size_ap_vld = hls_inst_result_size_ap_vld;
  assign result_w_address0[6:0] = hls_inst_result_w_address0;
  assign result_w_ce0 = hls_inst_result_w_ce0;
  assign result_w_d0[31:0] = hls_inst_result_w_d0;
  assign result_w_we0 = hls_inst_result_w_we0;
  assign result_x_address0[6:0] = hls_inst_result_x_address0;
  assign result_x_ce0 = hls_inst_result_x_ce0;
  assign result_x_d0[31:0] = hls_inst_result_x_d0;
  assign result_x_we0 = hls_inst_result_x_we0;
  assign result_y_address0[6:0] = hls_inst_result_y_address0;
  assign result_y_ce0 = hls_inst_result_y_ce0;
  assign result_y_d0[31:0] = hls_inst_result_y_d0;
  assign result_y_we0 = hls_inst_result_y_we0;
  bd_0_hls_inst_0 hls_inst
       (.Data_address0(hls_inst_Data_address0),
        .Data_ce0(hls_inst_Data_ce0),
        .Data_q0(Data_q0_0_1),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .result_h_address0(hls_inst_result_h_address0),
        .result_h_ce0(hls_inst_result_h_ce0),
        .result_h_d0(hls_inst_result_h_d0),
        .result_h_we0(hls_inst_result_h_we0),
        .result_size(hls_inst_result_size),
        .result_size_ap_vld(hls_inst_result_size_ap_vld),
        .result_w_address0(hls_inst_result_w_address0),
        .result_w_ce0(hls_inst_result_w_ce0),
        .result_w_d0(hls_inst_result_w_d0),
        .result_w_we0(hls_inst_result_w_we0),
        .result_x_address0(hls_inst_result_x_address0),
        .result_x_ce0(hls_inst_result_x_ce0),
        .result_x_d0(hls_inst_result_x_d0),
        .result_x_we0(hls_inst_result_x_we0),
        .result_y_address0(hls_inst_result_y_address0),
        .result_y_ce0(hls_inst_result_y_ce0),
        .result_y_d0(hls_inst_result_y_d0),
        .result_y_we0(hls_inst_result_y_we0));
endmodule
