//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  2 18:35:26 2025
//Host        : H410M-H-V3 running 64-bit Linux Mint 20.2
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (NL_address0,
    NL_ce0,
    NL_q0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    force_x_address0,
    force_x_ce0,
    force_x_d0,
    force_x_we0,
    force_y_address0,
    force_y_ce0,
    force_y_d0,
    force_y_we0,
    force_z_address0,
    force_z_ce0,
    force_z_d0,
    force_z_we0,
    position_x_address0,
    position_x_ce0,
    position_x_q0,
    position_y_address0,
    position_y_ce0,
    position_y_q0,
    position_z_address0,
    position_z_ce0,
    position_z_q0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NL_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NL_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]NL_address0;
  output NL_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NL_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NL_Q0, LAYERED_METADATA undef" *) input [31:0]NL_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_X_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_X_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]force_x_address0;
  output force_x_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_X_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_X_D0, LAYERED_METADATA undef" *) output [63:0]force_x_d0;
  output force_x_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_Y_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_Y_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]force_y_address0;
  output force_y_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_Y_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_Y_D0, LAYERED_METADATA undef" *) output [63:0]force_y_d0;
  output force_y_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_Z_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_Z_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]force_z_address0;
  output force_z_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FORCE_Z_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FORCE_Z_D0, LAYERED_METADATA undef" *) output [63:0]force_z_d0;
  output force_z_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_X_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_X_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]position_x_address0;
  output position_x_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_X_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_X_Q0, LAYERED_METADATA undef" *) input [63:0]position_x_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_Y_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_Y_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]position_y_address0;
  output position_y_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_Y_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_Y_Q0, LAYERED_METADATA undef" *) input [63:0]position_y_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_Z_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_Z_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]position_z_address0;
  output position_z_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.POSITION_Z_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.POSITION_Z_Q0, LAYERED_METADATA undef" *) input [63:0]position_z_q0;

  wire [31:0]NL_q0_0_1;
  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [11:0]hls_inst_NL_address0;
  wire hls_inst_NL_ce0;
  wire [7:0]hls_inst_force_x_address0;
  wire hls_inst_force_x_ce0;
  wire [63:0]hls_inst_force_x_d0;
  wire hls_inst_force_x_we0;
  wire [7:0]hls_inst_force_y_address0;
  wire hls_inst_force_y_ce0;
  wire [63:0]hls_inst_force_y_d0;
  wire hls_inst_force_y_we0;
  wire [7:0]hls_inst_force_z_address0;
  wire hls_inst_force_z_ce0;
  wire [63:0]hls_inst_force_z_d0;
  wire hls_inst_force_z_we0;
  wire [7:0]hls_inst_position_x_address0;
  wire hls_inst_position_x_ce0;
  wire [7:0]hls_inst_position_y_address0;
  wire hls_inst_position_y_ce0;
  wire [7:0]hls_inst_position_z_address0;
  wire hls_inst_position_z_ce0;
  wire [63:0]position_x_q0_0_1;
  wire [63:0]position_y_q0_0_1;
  wire [63:0]position_z_q0_0_1;

  assign NL_address0[11:0] = hls_inst_NL_address0;
  assign NL_ce0 = hls_inst_NL_ce0;
  assign NL_q0_0_1 = NL_q0[31:0];
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign force_x_address0[7:0] = hls_inst_force_x_address0;
  assign force_x_ce0 = hls_inst_force_x_ce0;
  assign force_x_d0[63:0] = hls_inst_force_x_d0;
  assign force_x_we0 = hls_inst_force_x_we0;
  assign force_y_address0[7:0] = hls_inst_force_y_address0;
  assign force_y_ce0 = hls_inst_force_y_ce0;
  assign force_y_d0[63:0] = hls_inst_force_y_d0;
  assign force_y_we0 = hls_inst_force_y_we0;
  assign force_z_address0[7:0] = hls_inst_force_z_address0;
  assign force_z_ce0 = hls_inst_force_z_ce0;
  assign force_z_d0[63:0] = hls_inst_force_z_d0;
  assign force_z_we0 = hls_inst_force_z_we0;
  assign position_x_address0[7:0] = hls_inst_position_x_address0;
  assign position_x_ce0 = hls_inst_position_x_ce0;
  assign position_x_q0_0_1 = position_x_q0[63:0];
  assign position_y_address0[7:0] = hls_inst_position_y_address0;
  assign position_y_ce0 = hls_inst_position_y_ce0;
  assign position_y_q0_0_1 = position_y_q0[63:0];
  assign position_z_address0[7:0] = hls_inst_position_z_address0;
  assign position_z_ce0 = hls_inst_position_z_ce0;
  assign position_z_q0_0_1 = position_z_q0[63:0];
  bd_0_hls_inst_0 hls_inst
       (.NL_address0(hls_inst_NL_address0),
        .NL_ce0(hls_inst_NL_ce0),
        .NL_q0(NL_q0_0_1),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .force_x_address0(hls_inst_force_x_address0),
        .force_x_ce0(hls_inst_force_x_ce0),
        .force_x_d0(hls_inst_force_x_d0),
        .force_x_we0(hls_inst_force_x_we0),
        .force_y_address0(hls_inst_force_y_address0),
        .force_y_ce0(hls_inst_force_y_ce0),
        .force_y_d0(hls_inst_force_y_d0),
        .force_y_we0(hls_inst_force_y_we0),
        .force_z_address0(hls_inst_force_z_address0),
        .force_z_ce0(hls_inst_force_z_ce0),
        .force_z_d0(hls_inst_force_z_d0),
        .force_z_we0(hls_inst_force_z_we0),
        .position_x_address0(hls_inst_position_x_address0),
        .position_x_ce0(hls_inst_position_x_ce0),
        .position_x_q0(position_x_q0_0_1),
        .position_y_address0(hls_inst_position_y_address0),
        .position_y_ce0(hls_inst_position_y_ce0),
        .position_y_q0(position_y_q0_0_1),
        .position_z_address0(hls_inst_position_z_address0),
        .position_z_ce0(hls_inst_position_z_ce0),
        .position_z_q0(position_z_q0_0_1));
endmodule
