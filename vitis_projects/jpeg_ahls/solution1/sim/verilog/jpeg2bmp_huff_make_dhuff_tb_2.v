// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module jpeg2bmp_huff_make_dhuff_tb_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        p_jinfo_dc_xhuff_tbl_bits_address0,
        p_jinfo_dc_xhuff_tbl_bits_ce0,
        p_jinfo_dc_xhuff_tbl_bits_q0,
        p_jinfo_ac_dhuff_tbl_maxcode_address0,
        p_jinfo_ac_dhuff_tbl_maxcode_ce0,
        p_jinfo_ac_dhuff_tbl_maxcode_we0,
        p_jinfo_ac_dhuff_tbl_maxcode_d0,
        p_jinfo_ac_dhuff_tbl_maxcode_q0,
        p_jinfo_ac_dhuff_tbl_maxcode_address1,
        p_jinfo_ac_dhuff_tbl_maxcode_ce1,
        p_jinfo_ac_dhuff_tbl_maxcode_we1,
        p_jinfo_ac_dhuff_tbl_maxcode_d1,
        p_jinfo_ac_dhuff_tbl_valptr_address0,
        p_jinfo_ac_dhuff_tbl_valptr_ce0,
        p_jinfo_ac_dhuff_tbl_valptr_we0,
        p_jinfo_ac_dhuff_tbl_valptr_d0,
        p_jinfo_ac_dhuff_tbl_mincode_address0,
        p_jinfo_ac_dhuff_tbl_mincode_ce0,
        p_jinfo_ac_dhuff_tbl_mincode_we0,
        p_jinfo_ac_dhuff_tbl_mincode_d0,
        ap_return
);

parameter    ap_ST_fsm_state1 = 14'd1;
parameter    ap_ST_fsm_state2 = 14'd2;
parameter    ap_ST_fsm_state3 = 14'd4;
parameter    ap_ST_fsm_state4 = 14'd8;
parameter    ap_ST_fsm_state5 = 14'd16;
parameter    ap_ST_fsm_state6 = 14'd32;
parameter    ap_ST_fsm_state7 = 14'd64;
parameter    ap_ST_fsm_state8 = 14'd128;
parameter    ap_ST_fsm_state9 = 14'd256;
parameter    ap_ST_fsm_state10 = 14'd512;
parameter    ap_ST_fsm_state11 = 14'd1024;
parameter    ap_ST_fsm_state12 = 14'd2048;
parameter    ap_ST_fsm_state13 = 14'd4096;
parameter    ap_ST_fsm_state14 = 14'd8192;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] p_jinfo_dc_xhuff_tbl_bits_address0;
output   p_jinfo_dc_xhuff_tbl_bits_ce0;
input  [7:0] p_jinfo_dc_xhuff_tbl_bits_q0;
output  [6:0] p_jinfo_ac_dhuff_tbl_maxcode_address0;
output   p_jinfo_ac_dhuff_tbl_maxcode_ce0;
output   p_jinfo_ac_dhuff_tbl_maxcode_we0;
output  [31:0] p_jinfo_ac_dhuff_tbl_maxcode_d0;
input  [31:0] p_jinfo_ac_dhuff_tbl_maxcode_q0;
output  [6:0] p_jinfo_ac_dhuff_tbl_maxcode_address1;
output   p_jinfo_ac_dhuff_tbl_maxcode_ce1;
output   p_jinfo_ac_dhuff_tbl_maxcode_we1;
output  [31:0] p_jinfo_ac_dhuff_tbl_maxcode_d1;
output  [6:0] p_jinfo_ac_dhuff_tbl_valptr_address0;
output   p_jinfo_ac_dhuff_tbl_valptr_ce0;
output   p_jinfo_ac_dhuff_tbl_valptr_we0;
output  [10:0] p_jinfo_ac_dhuff_tbl_valptr_d0;
output  [6:0] p_jinfo_ac_dhuff_tbl_mincode_address0;
output   p_jinfo_ac_dhuff_tbl_mincode_ce0;
output   p_jinfo_ac_dhuff_tbl_mincode_we0;
output  [10:0] p_jinfo_ac_dhuff_tbl_mincode_d0;
output  [6:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[7:0] p_jinfo_dc_xhuff_tbl_bits_address0;
reg p_jinfo_dc_xhuff_tbl_bits_ce0;
reg[6:0] p_jinfo_ac_dhuff_tbl_maxcode_address0;
reg p_jinfo_ac_dhuff_tbl_maxcode_ce0;
reg p_jinfo_ac_dhuff_tbl_maxcode_we0;
reg[31:0] p_jinfo_ac_dhuff_tbl_maxcode_d0;
reg p_jinfo_ac_dhuff_tbl_maxcode_ce1;
reg p_jinfo_ac_dhuff_tbl_maxcode_we1;

(* fsm_encoding = "none" *) reg   [13:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln638_fu_228_p2;
reg   [0:0] icmp_ln638_reg_390;
wire    ap_CS_fsm_state3;
reg   [31:0] p_load_reg_394;
wire   [8:0] add_ln638_fu_234_p2;
reg   [8:0] add_ln638_reg_399;
wire    ap_CS_fsm_state5;
reg   [4:0] size_3_reg_409;
wire    ap_CS_fsm_state7;
reg   [6:0] p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_432;
wire    ap_CS_fsm_state12;
reg   [31:0] p_jinfo_ac_dhuff_tbl_maxcode_load_reg_437;
wire    ap_CS_fsm_state13;
reg   [8:0] huffsize_address0;
reg    huffsize_ce0;
reg    huffsize_we0;
reg   [4:0] huffsize_d0;
wire   [4:0] huffsize_q0;
reg   [8:0] huffcode_address0;
reg    huffcode_ce0;
reg    huffcode_we0;
wire   [31:0] huffcode_q0;
reg    huffcode_ce1;
wire   [31:0] huffcode_q1;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_done;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_idle;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_ready;
wire   [8:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_ce0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_we0;
wire   [4:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_d0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_done;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_idle;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_ready;
wire   [8:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_ce0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_we0;
wire   [31:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_d0;
wire   [8:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_ce0;
wire   [30:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_code_2_out;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_code_2_out_ap_vld;
wire   [31:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_add_ln651_out;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_add_ln651_out_ap_vld;
wire   [4:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out_ap_vld;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_done;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_idle;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_ready;
wire   [31:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out_ap_vld;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_done;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_idle;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_ready;
wire   [8:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce0;
wire   [8:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address1;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce1;
wire   [6:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out_ap_vld;
wire   [6:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we0;
wire   [31:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d0;
wire   [6:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address1;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce1;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we1;
wire   [31:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d1;
wire   [7:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_ce0;
wire   [6:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_ce0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_we0;
wire   [10:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_d0;
wire   [6:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_address0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_ce0;
wire    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_we0;
wire   [10:0] grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_d0;
reg    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg;
wire    ap_CS_fsm_state4;
reg    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg;
wire    ap_CS_fsm_state8;
reg   [4:0] huffsize_load_loc_fu_56;
reg    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg;
wire    ap_CS_fsm_state9;
wire   [0:0] icmp_ln654_fu_290_p2;
wire    ap_CS_fsm_state10;
reg   [31:0] code_fu_80;
reg    grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg;
wire    ap_CS_fsm_state11;
reg   [6:0] p_dhtbl_ml_loc_fu_52;
wire   [63:0] zext_ln637_fu_200_p1;
wire   [0:0] icmp_ln637_fu_194_p2;
wire   [63:0] zext_ln643_fu_205_p1;
wire   [63:0] zext_ln676_fu_309_p1;
reg   [4:0] i_fu_44;
wire   [4:0] add_ln637_1_fu_252_p2;
reg    ap_block_state4_on_subcall_done;
reg   [31:0] p_fu_48;
wire   [31:0] add_ln637_fu_241_p2;
reg   [4:0] size_2_fu_76;
wire    ap_CS_fsm_state6;
reg   [31:0] p_1_fu_84;
wire    ap_CS_fsm_state14;
wire   [31:0] add_ln676_fu_314_p2;
wire   [8:0] zext_ln638_1_fu_224_p1;
wire   [31:0] zext_ln638_fu_220_p1;
reg   [13:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 14'd1;
#0 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg = 1'b0;
#0 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg = 1'b0;
#0 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg = 1'b0;
#0 code_fu_80 = 32'd0;
#0 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg = 1'b0;
#0 i_fu_44 = 5'd0;
#0 p_fu_48 = 32'd0;
#0 size_2_fu_76 = 5'd0;
#0 p_1_fu_84 = 32'd0;
end

jpeg2bmp_huff_make_dhuff_tb_1_huffsize_RAM_AUTO_1R1W #(
    .DataWidth( 5 ),
    .AddressRange( 257 ),
    .AddressWidth( 9 ))
huffsize_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(huffsize_address0),
    .ce0(huffsize_ce0),
    .we0(huffsize_we0),
    .d0(huffsize_d0),
    .q0(huffsize_q0)
);

jpeg2bmp_huff_make_dhuff_tb_2_huffcode_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 257 ),
    .AddressWidth( 9 ))
huffcode_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(huffcode_address0),
    .ce0(huffcode_ce0),
    .we0(huffcode_we0),
    .d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_d0),
    .q0(huffcode_q0),
    .address1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address1),
    .ce1(huffcode_ce1),
    .q1(huffcode_q1)
);

jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start),
    .ap_done(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_done),
    .ap_idle(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_idle),
    .ap_ready(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_ready),
    .sext_ln638(p_load_reg_394),
    .add_ln638(add_ln638_reg_399),
    .huffsize_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_address0),
    .huffsize_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_ce0),
    .huffsize_we0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_we0),
    .huffsize_d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_d0),
    .i(i_fu_44)
);

jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start),
    .ap_done(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_done),
    .ap_idle(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_idle),
    .ap_ready(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_ready),
    .sext_ln650(p_1_fu_84),
    .code(code_fu_80),
    .huffcode_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_address0),
    .huffcode_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_ce0),
    .huffcode_we0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_we0),
    .huffcode_d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_d0),
    .huffsize_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_address0),
    .huffsize_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_ce0),
    .huffsize_q0(huffsize_q0),
    .size_2(size_2_fu_76),
    .code_2_out(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_code_2_out),
    .code_2_out_ap_vld(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_code_2_out_ap_vld),
    .add_ln651_out(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_add_ln651_out),
    .add_ln651_out_ap_vld(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_add_ln651_out_ap_vld),
    .huffsize_load_out(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out),
    .huffsize_load_out_ap_vld(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out_ap_vld)
);

jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start),
    .ap_done(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_done),
    .ap_idle(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_idle),
    .ap_ready(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_ready),
    .code_2_reload(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_code_2_out),
    .zext_ln649(size_3_reg_409),
    .zext_ln652(huffsize_load_loc_fu_56),
    .p_out(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out),
    .p_out_ap_vld(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out_ap_vld)
);

jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6 grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start),
    .ap_done(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_done),
    .ap_idle(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_idle),
    .ap_ready(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_ready),
    .huffcode_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address0),
    .huffcode_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce0),
    .huffcode_q0(huffcode_q0),
    .huffcode_address1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address1),
    .huffcode_ce1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce1),
    .huffcode_q1(huffcode_q1),
    .p_dhtbl_ml_out(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out),
    .p_dhtbl_ml_out_ap_vld(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out_ap_vld),
    .p_jinfo_ac_dhuff_tbl_maxcode_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address0),
    .p_jinfo_ac_dhuff_tbl_maxcode_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce0),
    .p_jinfo_ac_dhuff_tbl_maxcode_we0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we0),
    .p_jinfo_ac_dhuff_tbl_maxcode_d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d0),
    .p_jinfo_ac_dhuff_tbl_maxcode_address1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address1),
    .p_jinfo_ac_dhuff_tbl_maxcode_ce1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce1),
    .p_jinfo_ac_dhuff_tbl_maxcode_we1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we1),
    .p_jinfo_ac_dhuff_tbl_maxcode_d1(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d1),
    .p_jinfo_dc_xhuff_tbl_bits_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_address0),
    .p_jinfo_dc_xhuff_tbl_bits_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_ce0),
    .p_jinfo_dc_xhuff_tbl_bits_q0(p_jinfo_dc_xhuff_tbl_bits_q0),
    .p_jinfo_ac_dhuff_tbl_valptr_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_address0),
    .p_jinfo_ac_dhuff_tbl_valptr_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_ce0),
    .p_jinfo_ac_dhuff_tbl_valptr_we0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_we0),
    .p_jinfo_ac_dhuff_tbl_valptr_d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_d0),
    .p_jinfo_ac_dhuff_tbl_mincode_address0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_address0),
    .p_jinfo_ac_dhuff_tbl_mincode_ce0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_ce0),
    .p_jinfo_ac_dhuff_tbl_mincode_we0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_we0),
    .p_jinfo_ac_dhuff_tbl_mincode_d0(grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_d0)
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
        grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln638_fu_228_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg <= 1'b1;
        end else if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_ready == 1'b1)) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg <= 1'b1;
        end else if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_ready == 1'b1)) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln654_fu_290_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg <= 1'b1;
        end else if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_ready == 1'b1)) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln654_fu_290_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg <= 1'b1;
        end else if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_ready == 1'b1)) begin
            grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln637_fu_194_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        code_fu_80 <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_state10) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out_ap_vld == 1'b1))) begin
        code_fu_80 <= grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_p_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_44 <= 5'd1;
    end else if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
        i_fu_44 <= add_ln637_1_fu_252_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln637_fu_194_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        p_1_fu_84 <= 32'd0;
    end else if (((icmp_ln654_fu_290_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
        p_1_fu_84 <= grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_add_ln651_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        p_fu_48 <= 32'd0;
    end else if (((icmp_ln638_fu_228_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        p_fu_48 <= add_ln637_fu_241_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        size_2_fu_76 <= huffsize_q0;
    end else if (((icmp_ln654_fu_290_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
        size_2_fu_76 <= huffsize_load_loc_fu_56;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln638_reg_399 <= add_ln638_fu_234_p2;
        icmp_ln638_reg_390 <= icmp_ln638_fu_228_p2;
        p_load_reg_394 <= p_fu_48;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state8) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out_ap_vld == 1'b1))) begin
        huffsize_load_loc_fu_56 <= grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_load_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state11) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out_ap_vld == 1'b1))) begin
        p_dhtbl_ml_loc_fu_52 <= grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_dhtbl_ml_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_432 <= zext_ln676_fu_309_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_load_reg_437 <= p_jinfo_ac_dhuff_tbl_maxcode_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        size_3_reg_409 <= size_2_fu_76;
    end
end

always @ (*) begin
    if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_done == 1'b0)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
    end
end

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state4_on_subcall_done)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_done == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state14) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
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
    if ((1'b1 == ap_CS_fsm_state14)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        huffcode_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_address0;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        huffcode_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_address0;
    end else begin
        huffcode_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        huffcode_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce0;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        huffcode_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_ce0;
    end else begin
        huffcode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        huffcode_ce1 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_huffcode_ce1;
    end else begin
        huffcode_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        huffcode_we0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffcode_we0;
    end else begin
        huffcode_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        huffsize_address0 = 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        huffsize_address0 = zext_ln643_fu_205_p1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        huffsize_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_address0;
    end else if (((icmp_ln638_reg_390 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        huffsize_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_address0;
    end else begin
        huffsize_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        huffsize_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        huffsize_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_huffsize_ce0;
    end else if (((icmp_ln638_reg_390 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        huffsize_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_ce0;
    end else begin
        huffsize_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        huffsize_d0 = 5'd0;
    end else if (((icmp_ln638_reg_390 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        huffsize_d0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_d0;
    end else begin
        huffsize_d0 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln637_fu_194_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        huffsize_we0 = 1'b1;
    end else if (((icmp_ln638_reg_390 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        huffsize_we0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_huffsize_we0;
    end else begin
        huffsize_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_address0 = p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_432;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_address0 = zext_ln676_fu_309_p1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address0;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state12))) begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce0;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce1 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_ce1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_d0 = add_ln676_fu_314_p2;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_d0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d0;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_we0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_we0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we0;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_ac_dhuff_tbl_maxcode_we1 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_we1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_jinfo_dc_xhuff_tbl_bits_address0 = zext_ln637_fu_200_p1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_dc_xhuff_tbl_bits_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_address0;
    end else begin
        p_jinfo_dc_xhuff_tbl_bits_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_jinfo_dc_xhuff_tbl_bits_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        p_jinfo_dc_xhuff_tbl_bits_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_dc_xhuff_tbl_bits_ce0;
    end else begin
        p_jinfo_dc_xhuff_tbl_bits_ce0 = 1'b0;
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
            if (((icmp_ln637_fu_194_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
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
            if (((1'b1 == ap_CS_fsm_state8) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((icmp_ln654_fu_290_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((1'b1 == ap_CS_fsm_state11) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln637_1_fu_252_p2 = (i_fu_44 + 5'd1);

assign add_ln637_fu_241_p2 = (zext_ln638_fu_220_p1 + p_fu_48);

assign add_ln638_fu_234_p2 = (zext_ln638_1_fu_224_p1 + 9'd1);

assign add_ln676_fu_314_p2 = (p_jinfo_ac_dhuff_tbl_maxcode_load_reg_437 + 32'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state4_on_subcall_done = ((icmp_ln638_reg_390 == 1'd0) & (grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_done == 1'b0));
end

assign ap_return = p_dhtbl_ml_loc_fu_52;

assign grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_638_2_fu_135_ap_start_reg;

assign grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4_fu_143_ap_start_reg;

assign grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_657_5_fu_155_ap_start_reg;

assign grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_ap_start_reg;

assign icmp_ln637_fu_194_p2 = ((i_fu_44 == 5'd17) ? 1'b1 : 1'b0);

assign icmp_ln638_fu_228_p2 = ((p_jinfo_dc_xhuff_tbl_bits_q0 == 8'd0) ? 1'b1 : 1'b0);

assign icmp_ln654_fu_290_p2 = ((huffsize_load_loc_fu_56 == 5'd0) ? 1'b1 : 1'b0);

assign p_jinfo_ac_dhuff_tbl_maxcode_address1 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_address1;

assign p_jinfo_ac_dhuff_tbl_maxcode_d1 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_maxcode_d1;

assign p_jinfo_ac_dhuff_tbl_mincode_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_address0;

assign p_jinfo_ac_dhuff_tbl_mincode_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_ce0;

assign p_jinfo_ac_dhuff_tbl_mincode_d0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_d0;

assign p_jinfo_ac_dhuff_tbl_mincode_we0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_mincode_we0;

assign p_jinfo_ac_dhuff_tbl_valptr_address0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_address0;

assign p_jinfo_ac_dhuff_tbl_valptr_ce0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_ce0;

assign p_jinfo_ac_dhuff_tbl_valptr_d0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_d0;

assign p_jinfo_ac_dhuff_tbl_valptr_we0 = grp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6_fu_163_p_jinfo_ac_dhuff_tbl_valptr_we0;

assign zext_ln637_fu_200_p1 = i_fu_44;

assign zext_ln638_1_fu_224_p1 = p_jinfo_dc_xhuff_tbl_bits_q0;

assign zext_ln638_fu_220_p1 = p_jinfo_dc_xhuff_tbl_bits_q0;

assign zext_ln643_fu_205_p1 = p_fu_48;

assign zext_ln676_fu_309_p1 = p_dhtbl_ml_loc_fu_52;

endmodule //jpeg2bmp_huff_make_dhuff_tb_2