// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module aes_main_MixColumn_AddRoundKey (
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
        n,
        word_address0,
        word_ce0,
        word_q0,
        word_address1,
        word_ce1,
        word_q1
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

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
input  [3:0] n;
output  [8:0] word_address0;
output   word_ce0;
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
reg[4:0] statemt_address1;
reg statemt_ce1;
reg statemt_we1;
reg[8:0] word_address0;
reg word_ce0;
reg[8:0] word_address1;
reg word_ce1;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [5:0] mul_fu_295_p3;
reg   [5:0] mul_reg_908;
wire   [3:0] shl_ln_fu_331_p3;
reg   [3:0] shl_ln_reg_916;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln326_fu_339_p1;
reg   [63:0] zext_ln326_reg_922;
wire   [63:0] zext_ln328_fu_350_p1;
reg   [63:0] zext_ln328_reg_932;
wire   [5:0] add_ln333_fu_355_p2;
reg   [5:0] add_ln333_reg_942;
reg   [31:0] x_9_reg_964;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln327_fu_398_p2;
reg   [0:0] icmp_ln327_reg_972;
reg   [31:0] x_reg_977;
wire   [63:0] zext_ln333_fu_409_p1;
reg   [63:0] zext_ln333_reg_985;
wire   [63:0] zext_ln333_1_fu_419_p1;
reg   [63:0] zext_ln333_1_reg_995;
reg   [31:0] word_load_reg_1015;
wire   [0:0] icmp_ln336_fu_457_p2;
reg   [0:0] icmp_ln336_reg_1020;
reg   [31:0] word_load_1_reg_1025;
wire   [31:0] xor_ln350_2_fu_733_p2;
reg   [31:0] xor_ln350_2_reg_1030;
wire    ap_CS_fsm_state4;
wire   [31:0] xor_ln359_2_fu_827_p2;
reg   [31:0] xor_ln359_2_reg_1035;
wire   [3:0] shl_ln4_fu_852_p3;
reg   [3:0] shl_ln4_reg_1043;
wire    ap_CS_fsm_state6;
wire   [63:0] zext_ln366_fu_860_p1;
reg   [63:0] zext_ln366_reg_1049;
wire   [63:0] zext_ln367_fu_871_p1;
reg   [63:0] zext_ln367_reg_1059;
wire   [63:0] zext_ln368_fu_886_p1;
reg   [63:0] zext_ln368_reg_1069;
wire    ap_CS_fsm_state7;
wire   [63:0] zext_ln369_fu_896_p1;
reg   [63:0] zext_ln369_reg_1079;
reg   [4:0] ret_address0;
reg    ret_ce0;
reg    ret_we0;
reg   [31:0] ret_d0;
wire   [31:0] ret_q0;
reg   [4:0] ret_address1;
reg    ret_ce1;
reg    ret_we1;
reg   [31:0] ret_d1;
wire   [31:0] ret_q1;
wire   [0:0] icmp_ln324_fu_311_p2;
wire   [63:0] zext_ln333_2_fu_360_p1;
wire   [63:0] zext_ln342_fu_375_p1;
wire   [63:0] zext_ln351_fu_433_p1;
wire   [63:0] zext_ln360_fu_444_p1;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln364_fu_836_p2;
wire    ap_CS_fsm_state8;
reg   [2:0] j_fu_76;
wire   [2:0] add_ln324_fu_317_p2;
reg   [2:0] j_1_fu_84;
wire   [2:0] add_ln364_fu_842_p2;
wire   [31:0] xor_ln332_2_fu_546_p2;
wire   [31:0] xor_ln341_2_fu_632_p2;
wire   [1:0] trunc_ln326_fu_327_p1;
wire   [3:0] or_ln328_fu_344_p2;
wire   [5:0] zext_ln324_fu_323_p1;
wire   [7:0] zext_ln333_4_fu_365_p1;
wire   [7:0] add_ln342_fu_369_p2;
wire   [23:0] grp_fu_275_p4;
wire   [31:0] and_ln_fu_390_p3;
wire   [3:0] or_ln333_fu_404_p2;
wire   [3:0] or_ln333_1_fu_414_p2;
wire   [8:0] zext_ln333_3_fu_424_p1;
wire   [8:0] add_ln351_fu_427_p2;
wire   [8:0] add_ln360_fu_438_p2;
wire   [23:0] grp_fu_285_p4;
wire   [31:0] and_ln2_fu_449_p3;
wire   [31:0] shl_ln326_fu_463_p2;
wire   [31:0] xor_ln327_fu_468_p2;
wire   [31:0] shl_ln329_fu_481_p2;
wire   [31:0] x_1_fu_486_p2;
wire   [23:0] tmp_4_fu_491_p4;
wire   [31:0] and_ln1_fu_501_p3;
wire   [0:0] icmp_ln330_fu_509_p2;
wire   [31:0] xor_ln330_fu_515_p2;
wire   [31:0] select_ln327_fu_474_p3;
wire   [31:0] x_2_fu_521_p3;
wire   [31:0] xor_ln332_1_fu_535_p2;
wire   [31:0] xor_ln332_3_fu_541_p2;
wire   [31:0] xor_ln332_fu_529_p2;
wire   [31:0] xor_ln336_fu_553_p2;
wire   [31:0] shl_ln338_fu_566_p2;
wire   [31:0] x_4_fu_572_p2;
wire   [23:0] tmp_7_fu_578_p4;
wire   [31:0] and_ln3_fu_588_p3;
wire   [0:0] icmp_ln339_fu_596_p2;
wire   [31:0] xor_ln339_fu_602_p2;
wire   [31:0] select_ln336_fu_559_p3;
wire   [31:0] x_5_fu_608_p3;
wire   [31:0] xor_ln341_1_fu_621_p2;
wire   [31:0] xor_ln341_3_fu_627_p2;
wire   [31:0] xor_ln341_fu_616_p2;
wire   [31:0] and_ln4_fu_639_p3;
wire   [0:0] icmp_ln345_fu_647_p2;
wire   [31:0] xor_ln345_fu_653_p2;
wire   [31:0] shl_ln347_fu_667_p2;
wire   [31:0] x_7_fu_673_p2;
wire   [23:0] tmp_s_fu_679_p4;
wire   [31:0] and_ln5_fu_689_p3;
wire   [0:0] icmp_ln348_fu_697_p2;
wire   [31:0] xor_ln348_fu_703_p2;
wire   [31:0] select_ln345_fu_659_p3;
wire   [31:0] x_8_fu_709_p3;
wire   [31:0] xor_ln350_1_fu_721_p2;
wire   [31:0] xor_ln350_3_fu_727_p2;
wire   [31:0] xor_ln350_fu_717_p2;
wire   [31:0] and_ln6_fu_739_p3;
wire   [0:0] icmp_ln354_fu_747_p2;
wire   [31:0] xor_ln354_fu_753_p2;
wire   [31:0] x_10_fu_767_p2;
wire   [23:0] tmp_3_fu_772_p4;
wire   [31:0] and_ln7_fu_782_p3;
wire   [0:0] icmp_ln357_fu_790_p2;
wire   [31:0] xor_ln357_fu_796_p2;
wire   [31:0] x_11_fu_802_p3;
wire   [31:0] select_ln354_fu_759_p3;
wire   [31:0] xor_ln359_1_fu_815_p2;
wire   [31:0] xor_ln359_3_fu_821_p2;
wire   [31:0] xor_ln359_fu_810_p2;
wire   [1:0] trunc_ln366_fu_848_p1;
wire   [3:0] or_ln367_fu_865_p2;
wire   [3:0] or_ln368_fu_881_p2;
wire   [3:0] or_ln369_fu_891_p2;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 j_fu_76 = 3'd0;
#0 j_1_fu_84 = 3'd0;
end

aes_main_MixColumn_AddRoundKey_ret_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
ret_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(ret_address0),
    .ce0(ret_ce0),
    .we0(ret_we0),
    .d0(ret_d0),
    .q0(ret_q0),
    .address1(ret_address1),
    .ce1(ret_ce1),
    .we1(ret_we1),
    .d1(ret_d1),
    .q1(ret_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln324_fu_311_p2 == 1'd1))) begin
        j_1_fu_84 <= 3'd0;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln364_fu_836_p2 == 1'd0))) begin
        j_1_fu_84 <= add_ln364_fu_842_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_fu_76 <= 3'd0;
    end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln324_fu_311_p2 == 1'd0))) begin
        j_fu_76 <= add_ln324_fu_317_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln333_reg_942 <= add_ln333_fu_355_p2;
        shl_ln_reg_916[3 : 2] <= shl_ln_fu_331_p3[3 : 2];
        zext_ln326_reg_922[3 : 2] <= zext_ln326_fu_339_p1[3 : 2];
        zext_ln328_reg_932[3 : 2] <= zext_ln328_fu_350_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln327_reg_972 <= icmp_ln327_fu_398_p2;
        icmp_ln336_reg_1020 <= icmp_ln336_fu_457_p2;
        word_load_1_reg_1025 <= word_q0;
        word_load_reg_1015 <= word_q1;
        x_9_reg_964 <= statemt_q1;
        x_reg_977 <= statemt_q0;
        zext_ln333_1_reg_995[3 : 2] <= zext_ln333_1_fu_419_p1[3 : 2];
        zext_ln333_reg_985[3 : 2] <= zext_ln333_fu_409_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        mul_reg_908[5 : 2] <= mul_fu_295_p3[5 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        shl_ln4_reg_1043[3 : 2] <= shl_ln4_fu_852_p3[3 : 2];
        zext_ln366_reg_1049[3 : 2] <= zext_ln366_fu_860_p1[3 : 2];
        zext_ln367_reg_1059[3 : 2] <= zext_ln367_fu_871_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        xor_ln350_2_reg_1030 <= xor_ln350_2_fu_733_p2;
        xor_ln359_2_reg_1035 <= xor_ln359_2_fu_827_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        zext_ln368_reg_1069[3 : 2] <= zext_ln368_fu_886_p1[3 : 2];
        zext_ln369_reg_1079[3 : 2] <= zext_ln369_fu_896_p1[3 : 2];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state6) & (icmp_ln364_fu_836_p2 == 1'd1)))) begin
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
    if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln364_fu_836_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ret_address0 = zext_ln369_fu_896_p1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        ret_address0 = zext_ln367_fu_871_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ret_address0 = zext_ln333_1_reg_995;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ret_address0 = zext_ln328_reg_932;
    end else begin
        ret_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ret_address1 = zext_ln368_fu_886_p1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        ret_address1 = zext_ln366_fu_860_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ret_address1 = zext_ln333_reg_985;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ret_address1 = zext_ln326_reg_922;
    end else begin
        ret_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4))) begin
        ret_ce0 = 1'b1;
    end else begin
        ret_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4))) begin
        ret_ce1 = 1'b1;
    end else begin
        ret_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ret_d0 = xor_ln359_2_reg_1035;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ret_d0 = xor_ln341_2_fu_632_p2;
    end else begin
        ret_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ret_d1 = xor_ln350_2_reg_1030;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ret_d1 = xor_ln332_2_fu_546_p2;
    end else begin
        ret_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        ret_we0 = 1'b1;
    end else begin
        ret_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        ret_we1 = 1'b1;
    end else begin
        ret_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_address0 = zext_ln369_reg_1079;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        statemt_address0 = zext_ln367_reg_1059;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        statemt_address0 = zext_ln333_1_fu_419_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        statemt_address0 = zext_ln328_fu_350_p1;
    end else begin
        statemt_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        statemt_address1 = zext_ln368_reg_1069;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        statemt_address1 = zext_ln366_reg_1049;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        statemt_address1 = zext_ln333_fu_409_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        statemt_address1 = zext_ln326_fu_339_p1;
    end else begin
        statemt_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7))) begin
        statemt_ce0 = 1'b1;
    end else begin
        statemt_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7))) begin
        statemt_ce1 = 1'b1;
    end else begin
        statemt_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7))) begin
        statemt_we0 = 1'b1;
    end else begin
        statemt_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7))) begin
        statemt_we1 = 1'b1;
    end else begin
        statemt_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address0 = zext_ln360_fu_444_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address0 = zext_ln342_fu_375_p1;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address1 = zext_ln351_fu_433_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address1 = zext_ln333_2_fu_360_p1;
    end else begin
        word_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        word_ce0 = 1'b1;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        word_ce1 = 1'b1;
    end else begin
        word_ce1 = 1'b0;
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
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln324_fu_311_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln364_fu_836_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln324_fu_317_p2 = (j_fu_76 + 3'd1);

assign add_ln333_fu_355_p2 = (zext_ln324_fu_323_p1 + mul_reg_908);

assign add_ln342_fu_369_p2 = (zext_ln333_4_fu_365_p1 + 8'd120);

assign add_ln351_fu_427_p2 = (zext_ln333_3_fu_424_p1 + 9'd240);

assign add_ln360_fu_438_p2 = ($signed(zext_ln333_3_fu_424_p1) + $signed(9'd360));

assign add_ln364_fu_842_p2 = (j_1_fu_84 + 3'd1);

assign and_ln1_fu_501_p3 = {{tmp_4_fu_491_p4}, {8'd0}};

assign and_ln2_fu_449_p3 = {{grp_fu_285_p4}, {8'd0}};

assign and_ln3_fu_588_p3 = {{tmp_7_fu_578_p4}, {8'd0}};

assign and_ln4_fu_639_p3 = {{grp_fu_275_p4}, {8'd0}};

assign and_ln5_fu_689_p3 = {{tmp_s_fu_679_p4}, {8'd0}};

assign and_ln6_fu_739_p3 = {{grp_fu_285_p4}, {8'd0}};

assign and_ln7_fu_782_p3 = {{tmp_3_fu_772_p4}, {8'd0}};

assign and_ln_fu_390_p3 = {{grp_fu_275_p4}, {8'd0}};

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign grp_fu_275_p4 = {{statemt_q1[30:7]}};

assign grp_fu_285_p4 = {{statemt_q0[30:7]}};

assign icmp_ln324_fu_311_p2 = ((j_fu_76 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln327_fu_398_p2 = ((and_ln_fu_390_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln330_fu_509_p2 = ((and_ln1_fu_501_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln336_fu_457_p2 = ((and_ln2_fu_449_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln339_fu_596_p2 = ((and_ln3_fu_588_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln345_fu_647_p2 = ((and_ln4_fu_639_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln348_fu_697_p2 = ((and_ln5_fu_689_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln354_fu_747_p2 = ((and_ln6_fu_739_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln357_fu_790_p2 = ((and_ln7_fu_782_p3 == 32'd256) ? 1'b1 : 1'b0);

assign icmp_ln364_fu_836_p2 = ((j_1_fu_84 == 3'd4) ? 1'b1 : 1'b0);

assign mul_fu_295_p3 = {{n}, {2'd0}};

assign or_ln328_fu_344_p2 = (shl_ln_fu_331_p3 | 4'd1);

assign or_ln333_1_fu_414_p2 = (shl_ln_reg_916 | 4'd3);

assign or_ln333_fu_404_p2 = (shl_ln_reg_916 | 4'd2);

assign or_ln367_fu_865_p2 = (shl_ln4_fu_852_p3 | 4'd1);

assign or_ln368_fu_881_p2 = (shl_ln4_reg_1043 | 4'd2);

assign or_ln369_fu_891_p2 = (shl_ln4_reg_1043 | 4'd3);

assign select_ln327_fu_474_p3 = ((icmp_ln327_reg_972[0:0] == 1'b1) ? xor_ln327_fu_468_p2 : shl_ln326_fu_463_p2);

assign select_ln336_fu_559_p3 = ((icmp_ln336_reg_1020[0:0] == 1'b1) ? xor_ln336_fu_553_p2 : shl_ln329_fu_481_p2);

assign select_ln345_fu_659_p3 = ((icmp_ln345_fu_647_p2[0:0] == 1'b1) ? xor_ln345_fu_653_p2 : shl_ln338_fu_566_p2);

assign select_ln354_fu_759_p3 = ((icmp_ln354_fu_747_p2[0:0] == 1'b1) ? xor_ln354_fu_753_p2 : shl_ln347_fu_667_p2);

assign shl_ln326_fu_463_p2 = x_9_reg_964 << 32'd1;

assign shl_ln329_fu_481_p2 = x_reg_977 << 32'd1;

assign shl_ln338_fu_566_p2 = statemt_q1 << 32'd1;

assign shl_ln347_fu_667_p2 = statemt_q0 << 32'd1;

assign shl_ln4_fu_852_p3 = {{trunc_ln366_fu_848_p1}, {2'd0}};

assign shl_ln_fu_331_p3 = {{trunc_ln326_fu_327_p1}, {2'd0}};

assign statemt_d0 = ret_q0;

assign statemt_d1 = ret_q1;

assign tmp_3_fu_772_p4 = {{x_10_fu_767_p2[31:8]}};

assign tmp_4_fu_491_p4 = {{x_1_fu_486_p2[31:8]}};

assign tmp_7_fu_578_p4 = {{x_4_fu_572_p2[31:8]}};

assign tmp_s_fu_679_p4 = {{x_7_fu_673_p2[31:8]}};

assign trunc_ln326_fu_327_p1 = j_fu_76[1:0];

assign trunc_ln366_fu_848_p1 = j_1_fu_84[1:0];

assign x_10_fu_767_p2 = (x_9_reg_964 ^ shl_ln326_fu_463_p2);

assign x_11_fu_802_p3 = ((icmp_ln357_fu_790_p2[0:0] == 1'b1) ? xor_ln357_fu_796_p2 : x_10_fu_767_p2);

assign x_1_fu_486_p2 = (x_reg_977 ^ shl_ln329_fu_481_p2);

assign x_2_fu_521_p3 = ((icmp_ln330_fu_509_p2[0:0] == 1'b1) ? xor_ln330_fu_515_p2 : x_1_fu_486_p2);

assign x_4_fu_572_p2 = (statemt_q1 ^ shl_ln338_fu_566_p2);

assign x_5_fu_608_p3 = ((icmp_ln339_fu_596_p2[0:0] == 1'b1) ? xor_ln339_fu_602_p2 : x_4_fu_572_p2);

assign x_7_fu_673_p2 = (statemt_q0 ^ shl_ln347_fu_667_p2);

assign x_8_fu_709_p3 = ((icmp_ln348_fu_697_p2[0:0] == 1'b1) ? xor_ln348_fu_703_p2 : x_7_fu_673_p2);

assign xor_ln327_fu_468_p2 = (shl_ln326_fu_463_p2 ^ 32'd283);

assign xor_ln330_fu_515_p2 = (x_1_fu_486_p2 ^ 32'd283);

assign xor_ln332_1_fu_535_p2 = (x_2_fu_521_p3 ^ select_ln327_fu_474_p3);

assign xor_ln332_2_fu_546_p2 = (xor_ln332_fu_529_p2 ^ xor_ln332_3_fu_541_p2);

assign xor_ln332_3_fu_541_p2 = (xor_ln332_1_fu_535_p2 ^ word_load_reg_1015);

assign xor_ln332_fu_529_p2 = (statemt_q1 ^ statemt_q0);

assign xor_ln336_fu_553_p2 = (shl_ln329_fu_481_p2 ^ 32'd283);

assign xor_ln339_fu_602_p2 = (x_4_fu_572_p2 ^ 32'd283);

assign xor_ln341_1_fu_621_p2 = (x_5_fu_608_p3 ^ select_ln336_fu_559_p3);

assign xor_ln341_2_fu_632_p2 = (xor_ln341_fu_616_p2 ^ xor_ln341_3_fu_627_p2);

assign xor_ln341_3_fu_627_p2 = (xor_ln341_1_fu_621_p2 ^ word_load_1_reg_1025);

assign xor_ln341_fu_616_p2 = (x_9_reg_964 ^ statemt_q0);

assign xor_ln345_fu_653_p2 = (shl_ln338_fu_566_p2 ^ 32'd283);

assign xor_ln348_fu_703_p2 = (x_7_fu_673_p2 ^ 32'd283);

assign xor_ln350_1_fu_721_p2 = (x_8_fu_709_p3 ^ select_ln345_fu_659_p3);

assign xor_ln350_2_fu_733_p2 = (xor_ln350_fu_717_p2 ^ xor_ln350_3_fu_727_p2);

assign xor_ln350_3_fu_727_p2 = (xor_ln350_1_fu_721_p2 ^ word_q1);

assign xor_ln350_fu_717_p2 = (x_reg_977 ^ x_9_reg_964);

assign xor_ln354_fu_753_p2 = (shl_ln347_fu_667_p2 ^ 32'd283);

assign xor_ln357_fu_796_p2 = (x_10_fu_767_p2 ^ 32'd283);

assign xor_ln359_1_fu_815_p2 = (x_11_fu_802_p3 ^ select_ln354_fu_759_p3);

assign xor_ln359_2_fu_827_p2 = (xor_ln359_fu_810_p2 ^ xor_ln359_3_fu_821_p2);

assign xor_ln359_3_fu_821_p2 = (xor_ln359_1_fu_815_p2 ^ word_q0);

assign xor_ln359_fu_810_p2 = (x_reg_977 ^ statemt_q1);

assign zext_ln324_fu_323_p1 = j_fu_76;

assign zext_ln326_fu_339_p1 = shl_ln_fu_331_p3;

assign zext_ln328_fu_350_p1 = or_ln328_fu_344_p2;

assign zext_ln333_1_fu_419_p1 = or_ln333_1_fu_414_p2;

assign zext_ln333_2_fu_360_p1 = add_ln333_fu_355_p2;

assign zext_ln333_3_fu_424_p1 = add_ln333_reg_942;

assign zext_ln333_4_fu_365_p1 = add_ln333_fu_355_p2;

assign zext_ln333_fu_409_p1 = or_ln333_fu_404_p2;

assign zext_ln342_fu_375_p1 = add_ln342_fu_369_p2;

assign zext_ln351_fu_433_p1 = add_ln351_fu_427_p2;

assign zext_ln360_fu_444_p1 = add_ln360_fu_438_p2;

assign zext_ln366_fu_860_p1 = shl_ln4_fu_852_p3;

assign zext_ln367_fu_871_p1 = or_ln367_fu_865_p2;

assign zext_ln368_fu_886_p1 = or_ln368_fu_881_p2;

assign zext_ln369_fu_896_p1 = or_ln369_fu_891_p2;

always @ (posedge ap_clk) begin
    mul_reg_908[1:0] <= 2'b00;
    shl_ln_reg_916[1:0] <= 2'b00;
    zext_ln326_reg_922[1:0] <= 2'b00;
    zext_ln326_reg_922[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln328_reg_932[1:0] <= 2'b01;
    zext_ln328_reg_932[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln333_reg_985[1:0] <= 2'b10;
    zext_ln333_reg_985[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln333_1_reg_995[1:0] <= 2'b11;
    zext_ln333_1_reg_995[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    shl_ln4_reg_1043[1:0] <= 2'b00;
    zext_ln366_reg_1049[1:0] <= 2'b00;
    zext_ln366_reg_1049[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln367_reg_1059[1:0] <= 2'b01;
    zext_ln367_reg_1059[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln368_reg_1069[1:0] <= 2'b10;
    zext_ln368_reg_1069[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
    zext_ln369_reg_1079[1:0] <= 2'b11;
    zext_ln369_reg_1079[63:4] <= 60'b000000000000000000000000000000000000000000000000000000000000;
end

endmodule //aes_main_MixColumn_AddRoundKey
