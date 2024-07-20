// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:SgdLR:1.0
// IP Revision: 2113614558

(* X_CORE_INFO = "SgdLR,Vivado 2023.2" *)
(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,SgdLR,{}" *)
(* CORE_GENERATION_INFO = "bd_0_hls_inst_0,SgdLR,{x_ipProduct=Vivado 2023.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=SgdLR,x_ipVersion=1.0,x_ipCoreRevision=2113614558,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  data_ce0,
  label_r_ce0,
  theta_ce0,
  theta_we0,
  theta_ce1,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  data_address0,
  data_q0,
  label_r_address0,
  label_r_q0,
  theta_address0,
  theta_d0,
  theta_q0,
  theta_address1,
  theta_q1
);

output wire data_ce0;
output wire label_r_ce0;
output wire theta_ce0;
output wire theta_we0;
output wire theta_ce1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 200000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 data_address0 DATA" *)
output wire [16 : 0] data_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 data_q0 DATA" *)
input wire [31 : 0] data_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME label_r_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 label_r_address0 DATA" *)
output wire [6 : 0] label_r_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME label_r_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 label_r_q0 DATA" *)
input wire [7 : 0] label_r_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME theta_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 theta_address0 DATA" *)
output wire [9 : 0] theta_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME theta_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 theta_d0 DATA" *)
output wire [31 : 0] theta_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME theta_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 theta_q0 DATA" *)
input wire [31 : 0] theta_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME theta_address1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 theta_address1 DATA" *)
output wire [9 : 0] theta_address1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME theta_q1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 theta_q1 DATA" *)
input wire [31 : 0] theta_q1;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SYNTH_INST = "inst" *)
  SgdLR inst (
    .data_ce0(data_ce0),
    .label_r_ce0(label_r_ce0),
    .theta_ce0(theta_ce0),
    .theta_we0(theta_we0),
    .theta_ce1(theta_ce1),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .data_address0(data_address0),
    .data_q0(data_q0),
    .label_r_address0(label_r_address0),
    .label_r_q0(label_r_q0),
    .theta_address0(theta_address0),
    .theta_d0(theta_d0),
    .theta_q0(theta_q0),
    .theta_address1(theta_address1),
    .theta_q1(theta_q1)
  );
endmodule
