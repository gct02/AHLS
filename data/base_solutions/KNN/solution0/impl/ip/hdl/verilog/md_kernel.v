// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="md_kernel_md_kernel,hls_ip_2023_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.825343,HLS_SYN_LAT=262913,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=3195,HLS_SYN_LUT=3143,HLS_VERSION=2023_2}" *)

module md_kernel (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        force_x_address0,
        force_x_ce0,
        force_x_we0,
        force_x_d0,
        force_y_address0,
        force_y_ce0,
        force_y_we0,
        force_y_d0,
        force_z_address0,
        force_z_ce0,
        force_z_we0,
        force_z_d0,
        position_x_address0,
        position_x_ce0,
        position_x_q0,
        position_y_address0,
        position_y_ce0,
        position_y_q0,
        position_z_address0,
        position_z_ce0,
        position_z_q0,
        NL_address0,
        NL_ce0,
        NL_q0
);

parameter    ap_ST_fsm_state1 = 67'd1;
parameter    ap_ST_fsm_state2 = 67'd2;
parameter    ap_ST_fsm_state3 = 67'd4;
parameter    ap_ST_fsm_state4 = 67'd8;
parameter    ap_ST_fsm_state5 = 67'd16;
parameter    ap_ST_fsm_state6 = 67'd32;
parameter    ap_ST_fsm_state7 = 67'd64;
parameter    ap_ST_fsm_state8 = 67'd128;
parameter    ap_ST_fsm_state9 = 67'd256;
parameter    ap_ST_fsm_state10 = 67'd512;
parameter    ap_ST_fsm_state11 = 67'd1024;
parameter    ap_ST_fsm_state12 = 67'd2048;
parameter    ap_ST_fsm_state13 = 67'd4096;
parameter    ap_ST_fsm_state14 = 67'd8192;
parameter    ap_ST_fsm_state15 = 67'd16384;
parameter    ap_ST_fsm_state16 = 67'd32768;
parameter    ap_ST_fsm_state17 = 67'd65536;
parameter    ap_ST_fsm_state18 = 67'd131072;
parameter    ap_ST_fsm_state19 = 67'd262144;
parameter    ap_ST_fsm_state20 = 67'd524288;
parameter    ap_ST_fsm_state21 = 67'd1048576;
parameter    ap_ST_fsm_state22 = 67'd2097152;
parameter    ap_ST_fsm_state23 = 67'd4194304;
parameter    ap_ST_fsm_state24 = 67'd8388608;
parameter    ap_ST_fsm_state25 = 67'd16777216;
parameter    ap_ST_fsm_state26 = 67'd33554432;
parameter    ap_ST_fsm_state27 = 67'd67108864;
parameter    ap_ST_fsm_state28 = 67'd134217728;
parameter    ap_ST_fsm_state29 = 67'd268435456;
parameter    ap_ST_fsm_state30 = 67'd536870912;
parameter    ap_ST_fsm_state31 = 67'd1073741824;
parameter    ap_ST_fsm_state32 = 67'd2147483648;
parameter    ap_ST_fsm_state33 = 67'd4294967296;
parameter    ap_ST_fsm_state34 = 67'd8589934592;
parameter    ap_ST_fsm_state35 = 67'd17179869184;
parameter    ap_ST_fsm_state36 = 67'd34359738368;
parameter    ap_ST_fsm_state37 = 67'd68719476736;
parameter    ap_ST_fsm_state38 = 67'd137438953472;
parameter    ap_ST_fsm_state39 = 67'd274877906944;
parameter    ap_ST_fsm_state40 = 67'd549755813888;
parameter    ap_ST_fsm_state41 = 67'd1099511627776;
parameter    ap_ST_fsm_state42 = 67'd2199023255552;
parameter    ap_ST_fsm_state43 = 67'd4398046511104;
parameter    ap_ST_fsm_state44 = 67'd8796093022208;
parameter    ap_ST_fsm_state45 = 67'd17592186044416;
parameter    ap_ST_fsm_state46 = 67'd35184372088832;
parameter    ap_ST_fsm_state47 = 67'd70368744177664;
parameter    ap_ST_fsm_state48 = 67'd140737488355328;
parameter    ap_ST_fsm_state49 = 67'd281474976710656;
parameter    ap_ST_fsm_state50 = 67'd562949953421312;
parameter    ap_ST_fsm_state51 = 67'd1125899906842624;
parameter    ap_ST_fsm_state52 = 67'd2251799813685248;
parameter    ap_ST_fsm_state53 = 67'd4503599627370496;
parameter    ap_ST_fsm_state54 = 67'd9007199254740992;
parameter    ap_ST_fsm_state55 = 67'd18014398509481984;
parameter    ap_ST_fsm_state56 = 67'd36028797018963968;
parameter    ap_ST_fsm_state57 = 67'd72057594037927936;
parameter    ap_ST_fsm_state58 = 67'd144115188075855872;
parameter    ap_ST_fsm_state59 = 67'd288230376151711744;
parameter    ap_ST_fsm_state60 = 67'd576460752303423488;
parameter    ap_ST_fsm_state61 = 67'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 67'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 67'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 67'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 67'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 67'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 67'd73786976294838206464;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] force_x_address0;
output   force_x_ce0;
output   force_x_we0;
output  [63:0] force_x_d0;
output  [7:0] force_y_address0;
output   force_y_ce0;
output   force_y_we0;
output  [63:0] force_y_d0;
output  [7:0] force_z_address0;
output   force_z_ce0;
output   force_z_we0;
output  [63:0] force_z_d0;
output  [7:0] position_x_address0;
output   position_x_ce0;
input  [63:0] position_x_q0;
output  [7:0] position_y_address0;
output   position_y_ce0;
input  [63:0] position_y_q0;
output  [7:0] position_z_address0;
output   position_z_ce0;
input  [63:0] position_z_q0;
output  [11:0] NL_address0;
output   NL_ce0;
input  [31:0] NL_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg force_x_ce0;
reg force_x_we0;
reg force_y_ce0;
reg force_y_we0;
reg force_z_ce0;
reg force_z_we0;
reg[7:0] position_x_address0;
reg position_x_ce0;
reg[7:0] position_y_address0;
reg position_y_ce0;
reg[7:0] position_z_address0;
reg position_z_ce0;
reg NL_ce0;

(* fsm_encoding = "none" *) reg   [66:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [63:0] grp_fu_252_p2;
reg   [63:0] reg_270;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state17;
wire    ap_CS_fsm_state39;
wire    ap_CS_fsm_state43;
wire    ap_CS_fsm_state55;
wire    ap_CS_fsm_state59;
wire    ap_CS_fsm_state63;
wire   [63:0] grp_fu_256_p2;
reg   [63:0] reg_280;
wire   [63:0] grp_fu_236_p2;
reg   [63:0] reg_286;
wire    ap_CS_fsm_state21;
wire    ap_CS_fsm_state51;
wire   [8:0] add_ln25_fu_307_p2;
reg   [8:0] add_ln25_reg_420;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln25_fu_313_p1;
reg   [63:0] zext_ln25_reg_425;
wire   [7:0] empty_fu_320_p1;
reg   [7:0] empty_reg_447;
wire   [63:0] i_x_fu_324_p1;
reg   [63:0] i_x_reg_452;
wire    ap_CS_fsm_state3;
wire   [63:0] i_y_fu_328_p1;
reg   [63:0] i_y_reg_457;
wire   [63:0] i_z_fu_332_p1;
reg   [63:0] i_z_reg_462;
wire   [11:0] tmp_1_fu_336_p3;
reg   [11:0] tmp_1_reg_467;
wire   [4:0] add_ln33_fu_349_p2;
reg   [4:0] add_ln33_reg_475;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire   [63:0] j_x_fu_395_p1;
wire    ap_CS_fsm_state6;
wire   [63:0] j_y_fu_400_p1;
wire   [63:0] j_z_fu_405_p1;
reg   [63:0] delx_reg_515;
wire    ap_CS_fsm_state9;
wire   [63:0] grp_fu_240_p2;
reg   [63:0] dely_reg_521;
wire   [63:0] grp_fu_244_p2;
reg   [63:0] delz_reg_527;
wire   [63:0] grp_fu_265_p2;
reg   [63:0] r2inv_reg_534;
wire    ap_CS_fsm_state35;
reg   [63:0] mul5_reg_540;
wire    ap_CS_fsm_state47;
wire   [63:0] grp_fu_261_p2;
reg   [63:0] mul4_reg_545;
wire    ap_CS_fsm_state67;
reg   [4:0] j_reg_189;
reg   [63:0] fz_reg_200;
reg   [63:0] fy_reg_212;
reg   [63:0] fx_reg_224;
wire   [0:0] icmp_ln25_fu_301_p2;
wire   [63:0] zext_ln36_fu_364_p1;
wire   [0:0] icmp_ln33_fu_343_p2;
wire   [63:0] zext_ln38_fu_388_p1;
reg   [8:0] i_fu_70;
reg   [63:0] grp_fu_236_p0;
reg   [63:0] grp_fu_236_p1;
wire    ap_CS_fsm_state14;
wire    ap_CS_fsm_state18;
wire    ap_CS_fsm_state48;
wire    ap_CS_fsm_state64;
reg   [63:0] grp_fu_240_p0;
reg   [63:0] grp_fu_240_p1;
reg   [63:0] grp_fu_244_p0;
reg   [63:0] grp_fu_244_p1;
reg   [63:0] grp_fu_252_p0;
reg   [63:0] grp_fu_252_p1;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state36;
wire    ap_CS_fsm_state40;
wire    ap_CS_fsm_state44;
wire    ap_CS_fsm_state52;
wire    ap_CS_fsm_state56;
wire    ap_CS_fsm_state60;
reg   [63:0] grp_fu_256_p1;
wire    ap_CS_fsm_state22;
wire   [11:0] zext_ln33_fu_355_p1;
wire   [11:0] add_ln36_fu_359_p2;
reg   [1:0] grp_fu_236_opcode;
reg   [1:0] grp_fu_240_opcode;
reg   [1:0] grp_fu_244_opcode;
reg   [66:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
wire    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
wire    ap_ST_fsm_state37_blk;
wire    ap_ST_fsm_state38_blk;
wire    ap_ST_fsm_state39_blk;
wire    ap_ST_fsm_state40_blk;
wire    ap_ST_fsm_state41_blk;
wire    ap_ST_fsm_state42_blk;
wire    ap_ST_fsm_state43_blk;
wire    ap_ST_fsm_state44_blk;
wire    ap_ST_fsm_state45_blk;
wire    ap_ST_fsm_state46_blk;
wire    ap_ST_fsm_state47_blk;
wire    ap_ST_fsm_state48_blk;
wire    ap_ST_fsm_state49_blk;
wire    ap_ST_fsm_state50_blk;
wire    ap_ST_fsm_state51_blk;
wire    ap_ST_fsm_state52_blk;
wire    ap_ST_fsm_state53_blk;
wire    ap_ST_fsm_state54_blk;
wire    ap_ST_fsm_state55_blk;
wire    ap_ST_fsm_state56_blk;
wire    ap_ST_fsm_state57_blk;
wire    ap_ST_fsm_state58_blk;
wire    ap_ST_fsm_state59_blk;
wire    ap_ST_fsm_state60_blk;
wire    ap_ST_fsm_state61_blk;
wire    ap_ST_fsm_state62_blk;
wire    ap_ST_fsm_state63_blk;
wire    ap_ST_fsm_state64_blk;
wire    ap_ST_fsm_state65_blk;
wire    ap_ST_fsm_state66_blk;
wire    ap_ST_fsm_state67_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 67'd1;
#0 i_fu_70 = 9'd0;
end

md_kernel_dadddsub_64ns_64ns_64_4_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dadddsub_64ns_64ns_64_4_full_dsp_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_236_p0),
    .din1(grp_fu_236_p1),
    .opcode(grp_fu_236_opcode),
    .ce(1'b1),
    .dout(grp_fu_236_p2)
);

md_kernel_dadddsub_64ns_64ns_64_4_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dadddsub_64ns_64ns_64_4_full_dsp_1_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_240_p0),
    .din1(grp_fu_240_p1),
    .opcode(grp_fu_240_opcode),
    .ce(1'b1),
    .dout(grp_fu_240_p2)
);

md_kernel_dadddsub_64ns_64ns_64_4_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dadddsub_64ns_64ns_64_4_full_dsp_1_U3(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_244_p0),
    .din1(grp_fu_244_p1),
    .opcode(grp_fu_244_opcode),
    .ce(1'b1),
    .dout(grp_fu_244_p2)
);

md_kernel_dmul_64ns_64ns_64_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dmul_64ns_64ns_64_4_max_dsp_1_U4(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_252_p0),
    .din1(grp_fu_252_p1),
    .ce(1'b1),
    .dout(grp_fu_252_p2)
);

md_kernel_dmul_64ns_64ns_64_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dmul_64ns_64ns_64_4_max_dsp_1_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(dely_reg_521),
    .din1(grp_fu_256_p1),
    .ce(1'b1),
    .dout(grp_fu_256_p2)
);

md_kernel_dmul_64ns_64ns_64_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dmul_64ns_64ns_64_4_max_dsp_1_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(delz_reg_527),
    .din1(reg_270),
    .ce(1'b1),
    .dout(grp_fu_261_p2)
);

md_kernel_ddiv_64ns_64ns_64_14_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 14 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
ddiv_64ns_64ns_64_14_no_dsp_1_U7(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(64'd4607182418800017408),
    .din1(reg_286),
    .ce(1'b1),
    .dout(grp_fu_265_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fx_reg_224 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state67)) begin
        fx_reg_224 <= grp_fu_236_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fy_reg_212 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state67)) begin
        fy_reg_212 <= grp_fu_240_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fz_reg_200 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state67)) begin
        fz_reg_200 <= grp_fu_244_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_70 <= 9'd0;
    end else if (((icmp_ln33_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        i_fu_70 <= add_ln25_reg_420;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        j_reg_189 <= 5'd0;
    end else if ((1'b1 == ap_CS_fsm_state67)) begin
        j_reg_189 <= add_ln33_reg_475;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln25_reg_420 <= add_ln25_fu_307_p2;
        empty_reg_447 <= empty_fu_320_p1;
        zext_ln25_reg_425[8 : 0] <= zext_ln25_fu_313_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln33_reg_475 <= add_ln33_fu_349_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        delx_reg_515 <= grp_fu_236_p2;
        dely_reg_521 <= grp_fu_240_p2;
        delz_reg_527 <= grp_fu_244_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_x_reg_452 <= i_x_fu_324_p1;
        i_y_reg_457 <= i_y_fu_328_p1;
        i_z_reg_462 <= i_z_fu_332_p1;
        tmp_1_reg_467[11 : 4] <= tmp_1_fu_336_p3[11 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state63)) begin
        mul4_reg_545 <= grp_fu_261_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        mul5_reg_540 <= grp_fu_252_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state35)) begin
        r2inv_reg_534 <= grp_fu_265_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state63) | (1'b1 == ap_CS_fsm_state59) | (1'b1 == ap_CS_fsm_state55) | (1'b1 == ap_CS_fsm_state43) | (1'b1 == ap_CS_fsm_state39) | (1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state13))) begin
        reg_270 <= grp_fu_252_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state63) | (1'b1 == ap_CS_fsm_state13))) begin
        reg_280 <= grp_fu_256_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state51) | (1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state17))) begin
        reg_286 <= grp_fu_236_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        NL_ce0 = 1'b1;
    end else begin
        NL_ce0 = 1'b0;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

assign ap_ST_fsm_state35_blk = 1'b0;

assign ap_ST_fsm_state36_blk = 1'b0;

assign ap_ST_fsm_state37_blk = 1'b0;

assign ap_ST_fsm_state38_blk = 1'b0;

assign ap_ST_fsm_state39_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state40_blk = 1'b0;

assign ap_ST_fsm_state41_blk = 1'b0;

assign ap_ST_fsm_state42_blk = 1'b0;

assign ap_ST_fsm_state43_blk = 1'b0;

assign ap_ST_fsm_state44_blk = 1'b0;

assign ap_ST_fsm_state45_blk = 1'b0;

assign ap_ST_fsm_state46_blk = 1'b0;

assign ap_ST_fsm_state47_blk = 1'b0;

assign ap_ST_fsm_state48_blk = 1'b0;

assign ap_ST_fsm_state49_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state50_blk = 1'b0;

assign ap_ST_fsm_state51_blk = 1'b0;

assign ap_ST_fsm_state52_blk = 1'b0;

assign ap_ST_fsm_state53_blk = 1'b0;

assign ap_ST_fsm_state54_blk = 1'b0;

assign ap_ST_fsm_state55_blk = 1'b0;

assign ap_ST_fsm_state56_blk = 1'b0;

assign ap_ST_fsm_state57_blk = 1'b0;

assign ap_ST_fsm_state58_blk = 1'b0;

assign ap_ST_fsm_state59_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state60_blk = 1'b0;

assign ap_ST_fsm_state61_blk = 1'b0;

assign ap_ST_fsm_state62_blk = 1'b0;

assign ap_ST_fsm_state63_blk = 1'b0;

assign ap_ST_fsm_state64_blk = 1'b0;

assign ap_ST_fsm_state65_blk = 1'b0;

assign ap_ST_fsm_state66_blk = 1'b0;

assign ap_ST_fsm_state67_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln25_fu_301_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln25_fu_301_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        force_x_ce0 = 1'b1;
    end else begin
        force_x_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln33_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        force_x_we0 = 1'b1;
    end else begin
        force_x_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        force_y_ce0 = 1'b1;
    end else begin
        force_y_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln33_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        force_y_we0 = 1'b1;
    end else begin
        force_y_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        force_z_ce0 = 1'b1;
    end else begin
        force_z_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln33_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        force_z_we0 = 1'b1;
    end else begin
        force_z_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_236_opcode = 2'd1;
    end else if (((1'b1 == ap_CS_fsm_state64) | (1'b1 == ap_CS_fsm_state48) | (1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state14))) begin
        grp_fu_236_opcode = 2'd0;
    end else begin
        grp_fu_236_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_236_p0 = fx_reg_224;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_236_p0 = mul5_reg_540;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        grp_fu_236_p0 = reg_286;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_236_p0 = reg_270;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_236_p0 = i_x_reg_452;
    end else begin
        grp_fu_236_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_236_p1 = 64'd13835058055282163712;
    end else if (((1'b1 == ap_CS_fsm_state64) | (1'b1 == ap_CS_fsm_state18))) begin
        grp_fu_236_p1 = reg_270;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_236_p1 = reg_280;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_236_p1 = j_x_fu_395_p1;
    end else begin
        grp_fu_236_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_240_opcode = 2'd1;
    end else if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_240_opcode = 2'd0;
    end else begin
        grp_fu_240_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_240_p0 = fy_reg_212;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_240_p0 = i_y_reg_457;
    end else begin
        grp_fu_240_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_240_p1 = reg_280;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_240_p1 = j_y_fu_400_p1;
    end else begin
        grp_fu_240_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_244_opcode = 2'd1;
    end else if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_244_opcode = 2'd0;
    end else begin
        grp_fu_244_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_244_p0 = fz_reg_200;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_244_p0 = i_z_reg_462;
    end else begin
        grp_fu_244_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        grp_fu_244_p1 = mul4_reg_545;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_244_p1 = j_z_fu_405_p1;
    end else begin
        grp_fu_244_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state52) | (1'b1 == ap_CS_fsm_state44) | (1'b1 == ap_CS_fsm_state40))) begin
        grp_fu_252_p0 = reg_270;
    end else if (((1'b1 == ap_CS_fsm_state56) | (1'b1 == ap_CS_fsm_state36))) begin
        grp_fu_252_p0 = r2inv_reg_534;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_252_p0 = delz_reg_527;
    end else if (((1'b1 == ap_CS_fsm_state60) | (1'b1 == ap_CS_fsm_state10))) begin
        grp_fu_252_p0 = delx_reg_515;
    end else begin
        grp_fu_252_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state60) | (1'b1 == ap_CS_fsm_state56))) begin
        grp_fu_252_p1 = reg_270;
    end else if ((1'b1 == ap_CS_fsm_state52)) begin
        grp_fu_252_p1 = reg_286;
    end else if ((1'b1 == ap_CS_fsm_state44)) begin
        grp_fu_252_p1 = 64'd4609434218613702656;
    end else if (((1'b1 == ap_CS_fsm_state40) | (1'b1 == ap_CS_fsm_state36))) begin
        grp_fu_252_p1 = r2inv_reg_534;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_252_p1 = delz_reg_527;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_252_p1 = delx_reg_515;
    end else begin
        grp_fu_252_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state60)) begin
        grp_fu_256_p1 = reg_270;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_256_p1 = dely_reg_521;
    end else begin
        grp_fu_256_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        position_x_address0 = zext_ln38_fu_388_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        position_x_address0 = zext_ln25_fu_313_p1;
    end else begin
        position_x_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        position_x_ce0 = 1'b1;
    end else begin
        position_x_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        position_y_address0 = zext_ln38_fu_388_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        position_y_address0 = zext_ln25_fu_313_p1;
    end else begin
        position_y_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        position_y_ce0 = 1'b1;
    end else begin
        position_y_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        position_z_address0 = zext_ln38_fu_388_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        position_z_address0 = zext_ln25_fu_313_p1;
    end else begin
        position_z_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        position_z_ce0 = 1'b1;
    end else begin
        position_z_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln25_fu_301_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((icmp_ln33_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign NL_address0 = zext_ln36_fu_364_p1;

assign add_ln25_fu_307_p2 = (i_fu_70 + 9'd1);

assign add_ln33_fu_349_p2 = (j_reg_189 + 5'd1);

assign add_ln36_fu_359_p2 = (zext_ln33_fu_355_p1 + tmp_1_reg_467);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state35 = ap_CS_fsm[32'd34];

assign ap_CS_fsm_state36 = ap_CS_fsm[32'd35];

assign ap_CS_fsm_state39 = ap_CS_fsm[32'd38];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state40 = ap_CS_fsm[32'd39];

assign ap_CS_fsm_state43 = ap_CS_fsm[32'd42];

assign ap_CS_fsm_state44 = ap_CS_fsm[32'd43];

assign ap_CS_fsm_state47 = ap_CS_fsm[32'd46];

assign ap_CS_fsm_state48 = ap_CS_fsm[32'd47];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state51 = ap_CS_fsm[32'd50];

assign ap_CS_fsm_state52 = ap_CS_fsm[32'd51];

assign ap_CS_fsm_state55 = ap_CS_fsm[32'd54];

assign ap_CS_fsm_state56 = ap_CS_fsm[32'd55];

assign ap_CS_fsm_state59 = ap_CS_fsm[32'd58];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state60 = ap_CS_fsm[32'd59];

assign ap_CS_fsm_state63 = ap_CS_fsm[32'd62];

assign ap_CS_fsm_state64 = ap_CS_fsm[32'd63];

assign ap_CS_fsm_state67 = ap_CS_fsm[32'd66];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign empty_fu_320_p1 = i_fu_70[7:0];

assign force_x_address0 = zext_ln25_reg_425;

assign force_x_d0 = fx_reg_224;

assign force_y_address0 = zext_ln25_reg_425;

assign force_y_d0 = fy_reg_212;

assign force_z_address0 = zext_ln25_reg_425;

assign force_z_d0 = fz_reg_200;

assign i_x_fu_324_p1 = position_x_q0;

assign i_y_fu_328_p1 = position_y_q0;

assign i_z_fu_332_p1 = position_z_q0;

assign icmp_ln25_fu_301_p2 = ((i_fu_70 == 9'd256) ? 1'b1 : 1'b0);

assign icmp_ln33_fu_343_p2 = ((j_reg_189 == 5'd16) ? 1'b1 : 1'b0);

assign j_x_fu_395_p1 = position_x_q0;

assign j_y_fu_400_p1 = position_y_q0;

assign j_z_fu_405_p1 = position_z_q0;

assign tmp_1_fu_336_p3 = {{empty_reg_447}, {4'd0}};

assign zext_ln25_fu_313_p1 = i_fu_70;

assign zext_ln33_fu_355_p1 = j_reg_189;

assign zext_ln36_fu_364_p1 = add_ln36_fu_359_p2;

assign zext_ln38_fu_388_p1 = NL_q0;

always @ (posedge ap_clk) begin
    zext_ln25_reg_425[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    tmp_1_reg_467[3:0] <= 4'b0000;
end

endmodule //md_kernel
