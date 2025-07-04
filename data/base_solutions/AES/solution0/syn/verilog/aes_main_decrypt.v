// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module aes_main_decrypt (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        statemt_address0,
        statemt_ce0,
        statemt_we0,
        statemt_d0,
        statemt_q0,
        statemt_address1,
        statemt_ce1,
        statemt_we1,
        statemt_d1,
        statemt_q1,
        key_address0,
        key_ce0,
        key_q0,
        word_address0,
        word_ce0,
        word_we0,
        word_d0,
        word_q0,
        word_address1,
        word_ce1,
        word_q1
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] statemt_address0;
output   statemt_ce0;
output   statemt_we0;
output  [31:0] statemt_d0;
input  [31:0] statemt_q0;
output  [4:0] statemt_address1;
output   statemt_ce1;
output   statemt_we1;
output  [31:0] statemt_d1;
input  [31:0] statemt_q1;
output  [4:0] key_address0;
output   key_ce0;
input  [31:0] key_q0;
output  [8:0] word_address0;
output   word_ce0;
output   word_we0;
output  [31:0] word_d0;
input  [31:0] word_q0;
output  [8:0] word_address1;
output   word_ce1;
input  [31:0] word_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[4:0] statemt_address0;
reg statemt_ce0;
reg statemt_we0;
reg[31:0] statemt_d0;
reg[4:0] statemt_address1;
reg statemt_ce1;
reg statemt_we1;
reg[31:0] statemt_d1;
reg[8:0] word_address0;
reg word_ce0;
reg word_we0;
reg[8:0] word_address1;
reg word_ce1;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] i_4_reg_125;
wire    ap_CS_fsm_state7;
wire    grp_KeySchedule_fu_52_ap_start;
wire    grp_KeySchedule_fu_52_ap_done;
wire    grp_KeySchedule_fu_52_ap_idle;
wire    grp_KeySchedule_fu_52_ap_ready;
wire   [4:0] grp_KeySchedule_fu_52_key_address0;
wire    grp_KeySchedule_fu_52_key_ce0;
wire   [8:0] grp_KeySchedule_fu_52_word_address0;
wire    grp_KeySchedule_fu_52_word_ce0;
wire    grp_KeySchedule_fu_52_word_we0;
wire   [31:0] grp_KeySchedule_fu_52_word_d0;
wire   [8:0] grp_KeySchedule_fu_52_word_address1;
wire    grp_KeySchedule_fu_52_word_ce1;
wire    grp_AddRoundKey_fu_64_ap_start;
wire    grp_AddRoundKey_fu_64_ap_done;
wire    grp_AddRoundKey_fu_64_ap_idle;
wire    grp_AddRoundKey_fu_64_ap_ready;
wire   [4:0] grp_AddRoundKey_fu_64_statemt_address0;
wire    grp_AddRoundKey_fu_64_statemt_ce0;
wire    grp_AddRoundKey_fu_64_statemt_we0;
wire   [31:0] grp_AddRoundKey_fu_64_statemt_d0;
wire   [4:0] grp_AddRoundKey_fu_64_statemt_address1;
wire    grp_AddRoundKey_fu_64_statemt_ce1;
wire    grp_AddRoundKey_fu_64_statemt_we1;
wire   [31:0] grp_AddRoundKey_fu_64_statemt_d1;
reg   [3:0] grp_AddRoundKey_fu_64_n;
wire   [8:0] grp_AddRoundKey_fu_64_word_address0;
wire    grp_AddRoundKey_fu_64_word_ce0;
wire   [8:0] grp_AddRoundKey_fu_64_word_address1;
wire    grp_AddRoundKey_fu_64_word_ce1;
wire    grp_InversShiftRow_ByteSub_fu_75_ap_start;
wire    grp_InversShiftRow_ByteSub_fu_75_ap_done;
wire    grp_InversShiftRow_ByteSub_fu_75_ap_idle;
wire    grp_InversShiftRow_ByteSub_fu_75_ap_ready;
wire   [4:0] grp_InversShiftRow_ByteSub_fu_75_statemt_address0;
wire    grp_InversShiftRow_ByteSub_fu_75_statemt_ce0;
wire    grp_InversShiftRow_ByteSub_fu_75_statemt_we0;
wire   [31:0] grp_InversShiftRow_ByteSub_fu_75_statemt_d0;
wire   [4:0] grp_InversShiftRow_ByteSub_fu_75_statemt_address1;
wire    grp_InversShiftRow_ByteSub_fu_75_statemt_ce1;
wire    grp_InversShiftRow_ByteSub_fu_75_statemt_we1;
wire   [31:0] grp_InversShiftRow_ByteSub_fu_75_statemt_d1;
wire    grp_AddRoundKey_InversMixColumn_fu_83_ap_start;
wire    grp_AddRoundKey_InversMixColumn_fu_83_ap_done;
wire    grp_AddRoundKey_InversMixColumn_fu_83_ap_idle;
wire    grp_AddRoundKey_InversMixColumn_fu_83_ap_ready;
wire   [4:0] grp_AddRoundKey_InversMixColumn_fu_83_statemt_address0;
wire    grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce0;
wire    grp_AddRoundKey_InversMixColumn_fu_83_statemt_we0;
wire   [31:0] grp_AddRoundKey_InversMixColumn_fu_83_statemt_d0;
wire   [4:0] grp_AddRoundKey_InversMixColumn_fu_83_statemt_address1;
wire    grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce1;
wire    grp_AddRoundKey_InversMixColumn_fu_83_statemt_we1;
wire   [31:0] grp_AddRoundKey_InversMixColumn_fu_83_statemt_d1;
wire   [8:0] grp_AddRoundKey_InversMixColumn_fu_83_word_address0;
wire    grp_AddRoundKey_InversMixColumn_fu_83_word_ce0;
wire   [8:0] grp_AddRoundKey_InversMixColumn_fu_83_word_address1;
wire    grp_AddRoundKey_InversMixColumn_fu_83_word_ce1;
reg    grp_KeySchedule_fu_52_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_AddRoundKey_fu_64_ap_start_reg;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln116_fu_101_p2;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state11;
reg    grp_InversShiftRow_ByteSub_fu_75_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state10;
reg    grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg;
wire    ap_CS_fsm_state8;
reg   [3:0] i_01_fu_48;
wire   [3:0] i_fu_107_p2;
reg   [10:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
#0 grp_KeySchedule_fu_52_ap_start_reg = 1'b0;
#0 grp_AddRoundKey_fu_64_ap_start_reg = 1'b0;
#0 grp_InversShiftRow_ByteSub_fu_75_ap_start_reg = 1'b0;
#0 grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg = 1'b0;
#0 i_01_fu_48 = 4'd0;
end

aes_main_KeySchedule grp_KeySchedule_fu_52(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_KeySchedule_fu_52_ap_start),
    .ap_done(grp_KeySchedule_fu_52_ap_done),
    .ap_idle(grp_KeySchedule_fu_52_ap_idle),
    .ap_ready(grp_KeySchedule_fu_52_ap_ready),
    .key_address0(grp_KeySchedule_fu_52_key_address0),
    .key_ce0(grp_KeySchedule_fu_52_key_ce0),
    .key_q0(key_q0),
    .word_address0(grp_KeySchedule_fu_52_word_address0),
    .word_ce0(grp_KeySchedule_fu_52_word_ce0),
    .word_we0(grp_KeySchedule_fu_52_word_we0),
    .word_d0(grp_KeySchedule_fu_52_word_d0),
    .word_q0(word_q0),
    .word_address1(grp_KeySchedule_fu_52_word_address1),
    .word_ce1(grp_KeySchedule_fu_52_word_ce1),
    .word_q1(word_q1)
);

aes_main_AddRoundKey grp_AddRoundKey_fu_64(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AddRoundKey_fu_64_ap_start),
    .ap_done(grp_AddRoundKey_fu_64_ap_done),
    .ap_idle(grp_AddRoundKey_fu_64_ap_idle),
    .ap_ready(grp_AddRoundKey_fu_64_ap_ready),
    .statemt_address0(grp_AddRoundKey_fu_64_statemt_address0),
    .statemt_ce0(grp_AddRoundKey_fu_64_statemt_ce0),
    .statemt_we0(grp_AddRoundKey_fu_64_statemt_we0),
    .statemt_d0(grp_AddRoundKey_fu_64_statemt_d0),
    .statemt_q0(statemt_q0),
    .statemt_address1(grp_AddRoundKey_fu_64_statemt_address1),
    .statemt_ce1(grp_AddRoundKey_fu_64_statemt_ce1),
    .statemt_we1(grp_AddRoundKey_fu_64_statemt_we1),
    .statemt_d1(grp_AddRoundKey_fu_64_statemt_d1),
    .statemt_q1(statemt_q1),
    .n(grp_AddRoundKey_fu_64_n),
    .word_address0(grp_AddRoundKey_fu_64_word_address0),
    .word_ce0(grp_AddRoundKey_fu_64_word_ce0),
    .word_q0(word_q0),
    .word_address1(grp_AddRoundKey_fu_64_word_address1),
    .word_ce1(grp_AddRoundKey_fu_64_word_ce1),
    .word_q1(word_q1)
);

aes_main_InversShiftRow_ByteSub grp_InversShiftRow_ByteSub_fu_75(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_InversShiftRow_ByteSub_fu_75_ap_start),
    .ap_done(grp_InversShiftRow_ByteSub_fu_75_ap_done),
    .ap_idle(grp_InversShiftRow_ByteSub_fu_75_ap_idle),
    .ap_ready(grp_InversShiftRow_ByteSub_fu_75_ap_ready),
    .statemt_address0(grp_InversShiftRow_ByteSub_fu_75_statemt_address0),
    .statemt_ce0(grp_InversShiftRow_ByteSub_fu_75_statemt_ce0),
    .statemt_we0(grp_InversShiftRow_ByteSub_fu_75_statemt_we0),
    .statemt_d0(grp_InversShiftRow_ByteSub_fu_75_statemt_d0),
    .statemt_q0(statemt_q0),
    .statemt_address1(grp_InversShiftRow_ByteSub_fu_75_statemt_address1),
    .statemt_ce1(grp_InversShiftRow_ByteSub_fu_75_statemt_ce1),
    .statemt_we1(grp_InversShiftRow_ByteSub_fu_75_statemt_we1),
    .statemt_d1(grp_InversShiftRow_ByteSub_fu_75_statemt_d1),
    .statemt_q1(statemt_q1)
);

aes_main_AddRoundKey_InversMixColumn grp_AddRoundKey_InversMixColumn_fu_83(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AddRoundKey_InversMixColumn_fu_83_ap_start),
    .ap_done(grp_AddRoundKey_InversMixColumn_fu_83_ap_done),
    .ap_idle(grp_AddRoundKey_InversMixColumn_fu_83_ap_idle),
    .ap_ready(grp_AddRoundKey_InversMixColumn_fu_83_ap_ready),
    .statemt_address0(grp_AddRoundKey_InversMixColumn_fu_83_statemt_address0),
    .statemt_ce0(grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce0),
    .statemt_we0(grp_AddRoundKey_InversMixColumn_fu_83_statemt_we0),
    .statemt_d0(grp_AddRoundKey_InversMixColumn_fu_83_statemt_d0),
    .statemt_q0(statemt_q0),
    .statemt_address1(grp_AddRoundKey_InversMixColumn_fu_83_statemt_address1),
    .statemt_ce1(grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce1),
    .statemt_we1(grp_AddRoundKey_InversMixColumn_fu_83_statemt_we1),
    .statemt_d1(grp_AddRoundKey_InversMixColumn_fu_83_statemt_d1),
    .statemt_q1(statemt_q1),
    .n(i_4_reg_125),
    .word_address0(grp_AddRoundKey_InversMixColumn_fu_83_word_address0),
    .word_ce0(grp_AddRoundKey_InversMixColumn_fu_83_word_ce0),
    .word_q0(word_q0),
    .word_address1(grp_AddRoundKey_InversMixColumn_fu_83_word_address1),
    .word_ce1(grp_AddRoundKey_InversMixColumn_fu_83_word_ce1),
    .word_q1(word_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln116_fu_101_p2 == 1'd0))) begin
            grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg <= 1'b1;
        end else if ((grp_AddRoundKey_InversMixColumn_fu_83_ap_ready == 1'b1)) begin
            grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AddRoundKey_fu_64_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_state7) & (icmp_ln116_fu_101_p2 == 1'd1)))) begin
            grp_AddRoundKey_fu_64_ap_start_reg <= 1'b1;
        end else if ((grp_AddRoundKey_fu_64_ap_ready == 1'b1)) begin
            grp_AddRoundKey_fu_64_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_InversShiftRow_ByteSub_fu_75_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state5))) begin
            grp_InversShiftRow_ByteSub_fu_75_ap_start_reg <= 1'b1;
        end else if ((grp_InversShiftRow_ByteSub_fu_75_ap_ready == 1'b1)) begin
            grp_InversShiftRow_ByteSub_fu_75_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_KeySchedule_fu_52_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_KeySchedule_fu_52_ap_start_reg <= 1'b1;
        end else if ((grp_KeySchedule_fu_52_ap_ready == 1'b1)) begin
            grp_KeySchedule_fu_52_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_01_fu_48 <= 4'd9;
    end else if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln116_fu_101_p2 == 1'd0))) begin
        i_01_fu_48 <= i_fu_107_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        i_4_reg_125 <= i_01_fu_48;
    end
end

always @ (*) begin
    if ((grp_InversShiftRow_ByteSub_fu_75_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_AddRoundKey_fu_64_ap_done == 1'b0)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_KeySchedule_fu_52_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_AddRoundKey_fu_64_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_InversShiftRow_ByteSub_fu_75_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((grp_AddRoundKey_InversMixColumn_fu_83_ap_done == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((grp_AddRoundKey_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_AddRoundKey_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_AddRoundKey_fu_64_n = 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_AddRoundKey_fu_64_n = 4'd10;
    end else begin
        grp_AddRoundKey_fu_64_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_address0 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_address0;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_address0 = grp_InversShiftRow_ByteSub_fu_75_statemt_address0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_address0 = grp_AddRoundKey_fu_64_statemt_address0;
    end else begin
        statemt_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_address1 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_address1;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_address1 = grp_InversShiftRow_ByteSub_fu_75_statemt_address1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_address1 = grp_AddRoundKey_fu_64_statemt_address1;
    end else begin
        statemt_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_ce0 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce0;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_ce0 = grp_InversShiftRow_ByteSub_fu_75_statemt_ce0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_ce0 = grp_AddRoundKey_fu_64_statemt_ce0;
    end else begin
        statemt_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_ce1 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_ce1;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_ce1 = grp_InversShiftRow_ByteSub_fu_75_statemt_ce1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_ce1 = grp_AddRoundKey_fu_64_statemt_ce1;
    end else begin
        statemt_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_d0 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_d0;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_d0 = grp_InversShiftRow_ByteSub_fu_75_statemt_d0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_d0 = grp_AddRoundKey_fu_64_statemt_d0;
    end else begin
        statemt_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_d1 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_d1;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_d1 = grp_InversShiftRow_ByteSub_fu_75_statemt_d1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_d1 = grp_AddRoundKey_fu_64_statemt_d1;
    end else begin
        statemt_d1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_we0 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_we0;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_we0 = grp_InversShiftRow_ByteSub_fu_75_statemt_we0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_we0 = grp_AddRoundKey_fu_64_statemt_we0;
    end else begin
        statemt_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_we1 = grp_AddRoundKey_InversMixColumn_fu_83_statemt_we1;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6))) begin
        statemt_we1 = grp_InversShiftRow_ByteSub_fu_75_statemt_we1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        statemt_we1 = grp_AddRoundKey_fu_64_statemt_we1;
    end else begin
        statemt_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        word_address0 = grp_AddRoundKey_InversMixColumn_fu_83_word_address0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        word_address0 = grp_AddRoundKey_fu_64_word_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address0 = grp_KeySchedule_fu_52_word_address0;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        word_address1 = grp_AddRoundKey_InversMixColumn_fu_83_word_address1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        word_address1 = grp_AddRoundKey_fu_64_word_address1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address1 = grp_KeySchedule_fu_52_word_address1;
    end else begin
        word_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        word_ce0 = grp_AddRoundKey_InversMixColumn_fu_83_word_ce0;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        word_ce0 = grp_AddRoundKey_fu_64_word_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_ce0 = grp_KeySchedule_fu_52_word_ce0;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        word_ce1 = grp_AddRoundKey_InversMixColumn_fu_83_word_ce1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state4))) begin
        word_ce1 = grp_AddRoundKey_fu_64_word_ce1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_ce1 = grp_KeySchedule_fu_52_word_ce1;
    end else begin
        word_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        word_we0 = grp_KeySchedule_fu_52_word_we0;
    end else begin
        word_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_KeySchedule_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_AddRoundKey_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_InversShiftRow_ByteSub_fu_75_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln116_fu_101_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (grp_AddRoundKey_InversMixColumn_fu_83_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_InversShiftRow_ByteSub_fu_75_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((grp_AddRoundKey_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign grp_AddRoundKey_InversMixColumn_fu_83_ap_start = grp_AddRoundKey_InversMixColumn_fu_83_ap_start_reg;

assign grp_AddRoundKey_fu_64_ap_start = grp_AddRoundKey_fu_64_ap_start_reg;

assign grp_InversShiftRow_ByteSub_fu_75_ap_start = grp_InversShiftRow_ByteSub_fu_75_ap_start_reg;

assign grp_KeySchedule_fu_52_ap_start = grp_KeySchedule_fu_52_ap_start_reg;

assign i_fu_107_p2 = ($signed(i_01_fu_48) + $signed(4'd15));

assign icmp_ln116_fu_101_p2 = ((i_01_fu_48 == 4'd0) ? 1'b1 : 1'b0);

assign key_address0 = grp_KeySchedule_fu_52_key_address0;

assign key_ce0 = grp_KeySchedule_fu_52_key_ce0;

assign word_d0 = grp_KeySchedule_fu_52_word_d0;

endmodule //aes_main_decrypt
