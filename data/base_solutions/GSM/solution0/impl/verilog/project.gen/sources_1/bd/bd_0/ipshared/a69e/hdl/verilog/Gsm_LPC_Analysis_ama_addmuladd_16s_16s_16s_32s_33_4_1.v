// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1 ns / 1 ps

module Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1 (
    input clk,
    input rst,
    input ce,
    input  [16 - 1:0] in0,
    input  [16 - 1:0] in1,
    input  [16 - 1:0] in2,
    input  [32 - 1:0] in3,
    output [33 - 1:0]  dout);


wire signed [18 - 1:0]     b;
wire signed [27 - 1:0]     a;
wire signed [27 - 1:0]     d;
wire signed [48 - 1:0]     c;
wire signed [45 - 1:0]     m;
wire signed [48 - 1:0]     p;
wire signed [27 - 1:0]     ad;
reg  signed [45 - 1:0]     m_reg;
reg  signed [27 - 1:0]     ad_reg;
reg  signed [18 - 1:0]     b_reg;
reg  signed [48 - 1:0]     p_reg;

assign a = $signed(in0);
assign d = $signed(in1);
assign b = $signed(in2);
assign c = $signed(in3);

assign ad = a + d;
assign m  = ad_reg * b_reg;
assign p  = m_reg + c;

always @(posedge clk) begin
    if (ce) begin
        m_reg  <= m;
        ad_reg <= ad;
        b_reg  <= b;
        p_reg  <= p;
    end
end

assign dout = p_reg;

endmodule
`timescale 1 ns / 1 ps
module Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    din2,
    din3,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter din3_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
input[din3_WIDTH - 1:0] din3;
output[dout_WIDTH - 1:0] dout;



Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1 Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .in3( din3 ),
    .dout( dout ));

endmodule

