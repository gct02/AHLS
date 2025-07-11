//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Wed Jul  9 03:33:31 2025
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
    biases1_address0,
    biases1_ce0,
    biases1_d0,
    biases1_q0,
    biases1_we0,
    biases2_address0,
    biases2_ce0,
    biases2_d0,
    biases2_q0,
    biases2_we0,
    biases3_address0,
    biases3_ce0,
    biases3_d0,
    biases3_q0,
    biases3_we0,
    training_data_address0,
    training_data_ce0,
    training_data_q0,
    training_targets_address0,
    training_targets_ce0,
    training_targets_q0,
    weights1_address0,
    weights1_ce0,
    weights1_d0,
    weights1_q0,
    weights1_we0,
    weights2_address0,
    weights2_ce0,
    weights2_d0,
    weights2_q0,
    weights2_we0,
    weights3_address0,
    weights3_ce0,
    weights3_d0,
    weights3_q0,
    weights3_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES1_ADDRESS0, LAYERED_METADATA undef" *) output [5:0]biases1_address0;
  output biases1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES1_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES1_D0, LAYERED_METADATA undef" *) output [63:0]biases1_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES1_Q0, LAYERED_METADATA undef" *) input [63:0]biases1_q0;
  output biases1_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES2_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES2_ADDRESS0, LAYERED_METADATA undef" *) output [5:0]biases2_address0;
  output biases2_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES2_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES2_D0, LAYERED_METADATA undef" *) output [63:0]biases2_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES2_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES2_Q0, LAYERED_METADATA undef" *) input [63:0]biases2_q0;
  output biases2_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES3_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES3_ADDRESS0, LAYERED_METADATA undef" *) output [1:0]biases3_address0;
  output biases3_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES3_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES3_D0, LAYERED_METADATA undef" *) output [63:0]biases3_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BIASES3_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BIASES3_Q0, LAYERED_METADATA undef" *) input [63:0]biases3_q0;
  output biases3_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.TRAINING_DATA_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.TRAINING_DATA_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]training_data_address0;
  output training_data_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.TRAINING_DATA_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.TRAINING_DATA_Q0, LAYERED_METADATA undef" *) input [63:0]training_data_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.TRAINING_TARGETS_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.TRAINING_TARGETS_ADDRESS0, LAYERED_METADATA undef" *) output [8:0]training_targets_address0;
  output training_targets_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.TRAINING_TARGETS_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.TRAINING_TARGETS_Q0, LAYERED_METADATA undef" *) input [63:0]training_targets_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS1_ADDRESS0, LAYERED_METADATA undef" *) output [9:0]weights1_address0;
  output weights1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS1_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS1_D0, LAYERED_METADATA undef" *) output [63:0]weights1_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS1_Q0, LAYERED_METADATA undef" *) input [63:0]weights1_q0;
  output weights1_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS2_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS2_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]weights2_address0;
  output weights2_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS2_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS2_D0, LAYERED_METADATA undef" *) output [63:0]weights2_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS2_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS2_Q0, LAYERED_METADATA undef" *) input [63:0]weights2_q0;
  output weights2_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS3_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS3_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]weights3_address0;
  output weights3_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS3_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS3_D0, LAYERED_METADATA undef" *) output [63:0]weights3_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.WEIGHTS3_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.WEIGHTS3_Q0, LAYERED_METADATA undef" *) input [63:0]weights3_q0;
  output weights3_we0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [63:0]biases1_q0_0_1;
  wire [63:0]biases2_q0_0_1;
  wire [63:0]biases3_q0_0_1;
  wire [5:0]hls_inst_biases1_address0;
  wire hls_inst_biases1_ce0;
  wire [63:0]hls_inst_biases1_d0;
  wire hls_inst_biases1_we0;
  wire [5:0]hls_inst_biases2_address0;
  wire hls_inst_biases2_ce0;
  wire [63:0]hls_inst_biases2_d0;
  wire hls_inst_biases2_we0;
  wire [1:0]hls_inst_biases3_address0;
  wire hls_inst_biases3_ce0;
  wire [63:0]hls_inst_biases3_d0;
  wire hls_inst_biases3_we0;
  wire [11:0]hls_inst_training_data_address0;
  wire hls_inst_training_data_ce0;
  wire [8:0]hls_inst_training_targets_address0;
  wire hls_inst_training_targets_ce0;
  wire [9:0]hls_inst_weights1_address0;
  wire hls_inst_weights1_ce0;
  wire [63:0]hls_inst_weights1_d0;
  wire hls_inst_weights1_we0;
  wire [11:0]hls_inst_weights2_address0;
  wire hls_inst_weights2_ce0;
  wire [63:0]hls_inst_weights2_d0;
  wire hls_inst_weights2_we0;
  wire [7:0]hls_inst_weights3_address0;
  wire hls_inst_weights3_ce0;
  wire [63:0]hls_inst_weights3_d0;
  wire hls_inst_weights3_we0;
  wire [63:0]training_data_q0_0_1;
  wire [63:0]training_targets_q0_0_1;
  wire [63:0]weights1_q0_0_1;
  wire [63:0]weights2_q0_0_1;
  wire [63:0]weights3_q0_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign biases1_address0[5:0] = hls_inst_biases1_address0;
  assign biases1_ce0 = hls_inst_biases1_ce0;
  assign biases1_d0[63:0] = hls_inst_biases1_d0;
  assign biases1_q0_0_1 = biases1_q0[63:0];
  assign biases1_we0 = hls_inst_biases1_we0;
  assign biases2_address0[5:0] = hls_inst_biases2_address0;
  assign biases2_ce0 = hls_inst_biases2_ce0;
  assign biases2_d0[63:0] = hls_inst_biases2_d0;
  assign biases2_q0_0_1 = biases2_q0[63:0];
  assign biases2_we0 = hls_inst_biases2_we0;
  assign biases3_address0[1:0] = hls_inst_biases3_address0;
  assign biases3_ce0 = hls_inst_biases3_ce0;
  assign biases3_d0[63:0] = hls_inst_biases3_d0;
  assign biases3_q0_0_1 = biases3_q0[63:0];
  assign biases3_we0 = hls_inst_biases3_we0;
  assign training_data_address0[11:0] = hls_inst_training_data_address0;
  assign training_data_ce0 = hls_inst_training_data_ce0;
  assign training_data_q0_0_1 = training_data_q0[63:0];
  assign training_targets_address0[8:0] = hls_inst_training_targets_address0;
  assign training_targets_ce0 = hls_inst_training_targets_ce0;
  assign training_targets_q0_0_1 = training_targets_q0[63:0];
  assign weights1_address0[9:0] = hls_inst_weights1_address0;
  assign weights1_ce0 = hls_inst_weights1_ce0;
  assign weights1_d0[63:0] = hls_inst_weights1_d0;
  assign weights1_q0_0_1 = weights1_q0[63:0];
  assign weights1_we0 = hls_inst_weights1_we0;
  assign weights2_address0[11:0] = hls_inst_weights2_address0;
  assign weights2_ce0 = hls_inst_weights2_ce0;
  assign weights2_d0[63:0] = hls_inst_weights2_d0;
  assign weights2_q0_0_1 = weights2_q0[63:0];
  assign weights2_we0 = hls_inst_weights2_we0;
  assign weights3_address0[7:0] = hls_inst_weights3_address0;
  assign weights3_ce0 = hls_inst_weights3_ce0;
  assign weights3_d0[63:0] = hls_inst_weights3_d0;
  assign weights3_q0_0_1 = weights3_q0[63:0];
  assign weights3_we0 = hls_inst_weights3_we0;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .biases1_address0(hls_inst_biases1_address0),
        .biases1_ce0(hls_inst_biases1_ce0),
        .biases1_d0(hls_inst_biases1_d0),
        .biases1_q0(biases1_q0_0_1),
        .biases1_we0(hls_inst_biases1_we0),
        .biases2_address0(hls_inst_biases2_address0),
        .biases2_ce0(hls_inst_biases2_ce0),
        .biases2_d0(hls_inst_biases2_d0),
        .biases2_q0(biases2_q0_0_1),
        .biases2_we0(hls_inst_biases2_we0),
        .biases3_address0(hls_inst_biases3_address0),
        .biases3_ce0(hls_inst_biases3_ce0),
        .biases3_d0(hls_inst_biases3_d0),
        .biases3_q0(biases3_q0_0_1),
        .biases3_we0(hls_inst_biases3_we0),
        .training_data_address0(hls_inst_training_data_address0),
        .training_data_ce0(hls_inst_training_data_ce0),
        .training_data_q0(training_data_q0_0_1),
        .training_targets_address0(hls_inst_training_targets_address0),
        .training_targets_ce0(hls_inst_training_targets_ce0),
        .training_targets_q0(training_targets_q0_0_1),
        .weights1_address0(hls_inst_weights1_address0),
        .weights1_ce0(hls_inst_weights1_ce0),
        .weights1_d0(hls_inst_weights1_d0),
        .weights1_q0(weights1_q0_0_1),
        .weights1_we0(hls_inst_weights1_we0),
        .weights2_address0(hls_inst_weights2_address0),
        .weights2_ce0(hls_inst_weights2_ce0),
        .weights2_d0(hls_inst_weights2_d0),
        .weights2_q0(weights2_q0_0_1),
        .weights2_we0(hls_inst_weights2_we0),
        .weights3_address0(hls_inst_weights3_address0),
        .weights3_ce0(hls_inst_weights3_ce0),
        .weights3_d0(hls_inst_weights3_d0),
        .weights3_q0(weights3_q0_0_1),
        .weights3_we0(hls_inst_weights3_we0));
endmodule
