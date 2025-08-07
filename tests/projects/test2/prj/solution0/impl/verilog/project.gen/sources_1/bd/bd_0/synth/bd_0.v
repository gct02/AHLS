//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Sat Jul 19 17:14:41 2025
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
    in_arr_address0,
    in_arr_ce0,
    in_arr_q0,
    out_arr_address0,
    out_arr_ce0,
    out_arr_d0,
    out_arr_q0,
    out_arr_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_ARR_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_ARR_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]in_arr_address0;
  output in_arr_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IN_ARR_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IN_ARR_Q0, LAYERED_METADATA undef" *) input [31:0]in_arr_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_ARR_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_ARR_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]out_arr_address0;
  output out_arr_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_ARR_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_ARR_D0, LAYERED_METADATA undef" *) output [31:0]out_arr_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_ARR_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_ARR_Q0, LAYERED_METADATA undef" *) input [31:0]out_arr_q0;
  output out_arr_we0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [6:0]hls_inst_in_arr_address0;
  wire hls_inst_in_arr_ce0;
  wire [6:0]hls_inst_out_arr_address0;
  wire hls_inst_out_arr_ce0;
  wire [31:0]hls_inst_out_arr_d0;
  wire hls_inst_out_arr_we0;
  wire [31:0]in_arr_q0_0_1;
  wire [31:0]out_arr_q0_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign in_arr_address0[6:0] = hls_inst_in_arr_address0;
  assign in_arr_ce0 = hls_inst_in_arr_ce0;
  assign in_arr_q0_0_1 = in_arr_q0[31:0];
  assign out_arr_address0[6:0] = hls_inst_out_arr_address0;
  assign out_arr_ce0 = hls_inst_out_arr_ce0;
  assign out_arr_d0[31:0] = hls_inst_out_arr_d0;
  assign out_arr_q0_0_1 = out_arr_q0[31:0];
  assign out_arr_we0 = hls_inst_out_arr_we0;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .in_arr_address0(hls_inst_in_arr_address0),
        .in_arr_ce0(hls_inst_in_arr_ce0),
        .in_arr_q0(in_arr_q0_0_1),
        .out_arr_address0(hls_inst_out_arr_address0),
        .out_arr_ce0(hls_inst_out_arr_ce0),
        .out_arr_d0(hls_inst_out_arr_d0),
        .out_arr_q0(out_arr_q0_0_1),
        .out_arr_we0(hls_inst_out_arr_we0));
endmodule
