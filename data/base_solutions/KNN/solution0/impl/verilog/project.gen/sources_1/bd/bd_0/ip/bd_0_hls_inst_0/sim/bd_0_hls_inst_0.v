// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
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


// IP VLNV: xilinx.com:hls:md_kernel:1.0
// IP Revision: 2114104737

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  force_x_ce0,
  force_x_we0,
  force_y_ce0,
  force_y_we0,
  force_z_ce0,
  force_z_we0,
  position_x_ce0,
  position_y_ce0,
  position_z_ce0,
  NL_ce0,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  force_x_address0,
  force_x_d0,
  force_y_address0,
  force_y_d0,
  force_z_address0,
  force_z_d0,
  position_x_address0,
  position_x_q0,
  position_y_address0,
  position_y_q0,
  position_z_address0,
  position_z_q0,
  NL_address0,
  NL_q0
);

output wire force_x_ce0;
output wire force_x_we0;
output wire force_y_ce0;
output wire force_y_we0;
output wire force_z_ce0;
output wire force_z_we0;
output wire position_x_ce0;
output wire position_y_ce0;
output wire position_z_ce0;
output wire NL_ce0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
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
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_x_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_x_address0 DATA" *)
output wire [7 : 0] force_x_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_x_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_x_d0 DATA" *)
output wire [63 : 0] force_x_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_y_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_y_address0 DATA" *)
output wire [7 : 0] force_y_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_y_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_y_d0 DATA" *)
output wire [63 : 0] force_y_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_z_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_z_address0 DATA" *)
output wire [7 : 0] force_z_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME force_z_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 force_z_d0 DATA" *)
output wire [63 : 0] force_z_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_x_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_x_address0 DATA" *)
output wire [7 : 0] position_x_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_x_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_x_q0 DATA" *)
input wire [63 : 0] position_x_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_y_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_y_address0 DATA" *)
output wire [7 : 0] position_y_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_y_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_y_q0 DATA" *)
input wire [63 : 0] position_y_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_z_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_z_address0 DATA" *)
output wire [7 : 0] position_z_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME position_z_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 position_z_q0 DATA" *)
input wire [63 : 0] position_z_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NL_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 NL_address0 DATA" *)
output wire [11 : 0] NL_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NL_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 NL_q0 DATA" *)
input wire [31 : 0] NL_q0;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  md_kernel inst (
    .force_x_ce0(force_x_ce0),
    .force_x_we0(force_x_we0),
    .force_y_ce0(force_y_ce0),
    .force_y_we0(force_y_we0),
    .force_z_ce0(force_z_ce0),
    .force_z_we0(force_z_we0),
    .position_x_ce0(position_x_ce0),
    .position_y_ce0(position_y_ce0),
    .position_z_ce0(position_z_ce0),
    .NL_ce0(NL_ce0),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .force_x_address0(force_x_address0),
    .force_x_d0(force_x_d0),
    .force_y_address0(force_y_address0),
    .force_y_d0(force_y_d0),
    .force_z_address0(force_z_address0),
    .force_z_d0(force_z_d0),
    .position_x_address0(position_x_address0),
    .position_x_q0(position_x_q0),
    .position_y_address0(position_y_address0),
    .position_y_q0(position_y_q0),
    .position_z_address0(position_z_address0),
    .position_z_q0(position_z_q0),
    .NL_address0(NL_address0),
    .NL_q0(NL_q0)
  );
endmodule
