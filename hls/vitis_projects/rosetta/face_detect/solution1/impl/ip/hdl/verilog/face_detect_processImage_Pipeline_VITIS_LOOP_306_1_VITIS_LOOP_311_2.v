// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module face_detect_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sum_col,
        bound,
        IMG1_data_address0,
        IMG1_data_ce0,
        IMG1_data_q0,
        SUM1_data_address0,
        SUM1_data_ce0,
        SUM1_data_we0,
        SUM1_data_d0,
        SUM1_data_q0,
        SQSUM1_data_address0,
        SQSUM1_data_ce0,
        SQSUM1_data_we0,
        SQSUM1_data_d0,
        SQSUM1_data_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] sum_col;
input  [63:0] bound;
output  [16:0] IMG1_data_address0;
output   IMG1_data_ce0;
input  [7:0] IMG1_data_q0;
output  [16:0] SUM1_data_address0;
output   SUM1_data_ce0;
output   SUM1_data_we0;
output  [31:0] SUM1_data_d0;
input  [31:0] SUM1_data_q0;
output  [16:0] SQSUM1_data_address0;
output   SQSUM1_data_ce0;
output   SQSUM1_data_we0;
output  [31:0] SQSUM1_data_d0;
input  [31:0] SQSUM1_data_q0;

reg ap_idle;
reg IMG1_data_ce0;
reg[16:0] SUM1_data_address0;
reg SUM1_data_ce0;
reg SUM1_data_we0;
reg[16:0] SQSUM1_data_address0;
reg SQSUM1_data_ce0;
reg SQSUM1_data_we0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln306_fu_219_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [16:0] x_1_reg_552;
wire    ap_block_pp0_stage1_11001;
wire   [0:0] icmp_ln311_fu_214_p2;
reg   [0:0] icmp_ln311_reg_557;
reg   [0:0] icmp_ln311_reg_557_pp0_iter1_reg;
reg   [0:0] icmp_ln311_reg_557_pp0_iter2_reg;
reg   [0:0] icmp_ln311_reg_557_pp0_iter3_reg;
reg   [0:0] icmp_ln306_reg_565;
wire   [63:0] add_ln306_1_fu_224_p2;
reg   [63:0] add_ln306_1_reg_569;
reg   [30:0] y_load_reg_574;
wire   [30:0] add_ln306_fu_233_p2;
reg   [30:0] add_ln306_reg_579;
wire   [16:0] select_ln306_fu_239_p3;
reg   [16:0] select_ln306_reg_584;
wire   [30:0] select_ln306_3_fu_245_p3;
reg   [30:0] select_ln306_3_reg_590;
reg   [30:0] select_ln306_3_reg_590_pp0_iter2_reg;
reg   [30:0] select_ln306_3_reg_590_pp0_iter3_reg;
wire   [16:0] add_ln313_fu_274_p2;
reg   [16:0] add_ln313_reg_595;
wire   [7:0] empty_fu_284_p2;
reg   [7:0] empty_reg_600;
wire   [16:0] add_ln311_fu_290_p2;
reg   [16:0] add_ln311_reg_606;
wire   [16:0] add_ln322_fu_327_p2;
reg   [16:0] add_ln322_reg_611;
wire   [16:0] add_ln313_1_fu_333_p2;
reg   [16:0] add_ln313_1_reg_616;
wire   [63:0] zext_ln313_fu_341_p1;
reg   [63:0] zext_ln313_reg_621;
reg   [63:0] zext_ln313_reg_621_pp0_iter3_reg;
reg   [63:0] zext_ln313_reg_621_pp0_iter4_reg;
reg   [63:0] zext_ln313_reg_621_pp0_iter5_reg;
wire   [16:0] add_ln322_1_fu_345_p2;
reg   [16:0] add_ln322_1_reg_634;
wire   [63:0] zext_ln322_2_fu_349_p1;
reg   [63:0] zext_ln322_2_reg_639;
reg   [63:0] zext_ln322_2_reg_639_pp0_iter3_reg;
reg   [7:0] it_reg_651;
wire   [15:0] zext_ln315_1_fu_366_p1;
wire   [31:0] t_fu_369_p2;
reg   [31:0] t_reg_663;
reg   [31:0] SUM1_data_load_reg_670;
wire   [0:0] addr_cmp16_fu_378_p2;
reg   [0:0] addr_cmp16_reg_675;
wire   [0:0] cmp9_i_fu_387_p2;
reg   [0:0] cmp9_i_reg_680;
reg   [0:0] cmp9_i_reg_680_pp0_iter4_reg;
wire   [31:0] t_2_fu_406_p3;
reg   [31:0] t_2_reg_685;
wire   [0:0] addr_cmp_fu_430_p2;
reg   [0:0] addr_cmp_reg_701;
wire   [31:0] grp_fu_471_p3;
reg   [31:0] tq_reg_706;
reg   [31:0] SQSUM1_data_load_reg_713;
wire   [31:0] tq_2_fu_457_p3;
reg   [31:0] tq_2_reg_718;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage1;
reg   [63:0] reuse_addr_reg13_fu_56;
wire    ap_loop_init;
reg   [31:0] reuse_reg12_fu_60;
reg   [63:0] reuse_addr_reg_fu_64;
reg   [31:0] reuse_reg_fu_68;
reg   [31:0] s_fu_72;
reg   [31:0] sq_fu_76;
reg   [31:0] ap_sig_allocacmp_sq_load;
reg   [16:0] x_fu_80;
reg   [16:0] ap_sig_allocacmp_x_1;
reg   [30:0] y_fu_84;
reg   [63:0] indvar_flatten_fu_88;
wire   [31:0] zext_ln311_fu_210_p1;
wire   [8:0] trunc_ln313_1_fu_254_p1;
wire   [10:0] trunc_ln313_fu_250_p1;
wire   [16:0] tmp_6_fu_258_p3;
wire   [16:0] tmp_7_fu_266_p3;
wire   [7:0] trunc_ln306_fu_280_p1;
wire   [15:0] tmp_8_fu_305_p3;
wire   [13:0] tmp_9_fu_316_p3;
wire   [16:0] zext_ln322_fu_312_p1;
wire   [16:0] zext_ln322_1_fu_323_p1;
wire   [31:0] zext_ln315_fu_363_p1;
wire   [31:0] select_ln306_2_fu_356_p3;
wire   [31:0] reuse_select17_fu_395_p3;
wire   [31:0] t_1_fu_401_p2;
wire   [31:0] reuse_select_fu_446_p3;
(* use_dsp48 = "no" *) wire   [31:0] tq_1_fu_452_p2;
wire   [7:0] grp_fu_471_p0;
wire   [7:0] grp_fu_471_p1;
wire   [31:0] grp_fu_471_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [1:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to5;
reg    ap_done_pending_pp0;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 reuse_addr_reg13_fu_56 = 64'd0;
#0 reuse_reg12_fu_60 = 32'd0;
#0 reuse_addr_reg_fu_64 = 64'd0;
#0 reuse_reg_fu_68 = 32'd0;
#0 s_fu_72 = 32'd0;
#0 sq_fu_76 = 32'd0;
#0 x_fu_80 = 17'd0;
#0 y_fu_84 = 31'd0;
#0 indvar_flatten_fu_88 = 64'd0;
#0 ap_done_reg = 1'b0;
end

face_detect_mac_muladd_8ns_8ns_32ns_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mac_muladd_8ns_8ns_32ns_32_4_1_U11(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_471_p0),
    .din1(grp_fu_471_p1),
    .din2(grp_fu_471_p2),
    .ce(1'b1),
    .dout(grp_fu_471_p3)
);

face_detect_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_88 <= 64'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln306_reg_565 == 1'd0))) begin
            indvar_flatten_fu_88 <= add_ln306_1_reg_569;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_addr_reg13_fu_56 <= 64'd18446744073709551615;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            reuse_addr_reg13_fu_56 <= zext_ln313_reg_621;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_addr_reg_fu_64 <= 64'd18446744073709551615;
        end else if ((ap_enable_reg_pp0_iter4 == 1'b1)) begin
            reuse_addr_reg_fu_64 <= zext_ln313_reg_621_pp0_iter3_reg;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_reg12_fu_60 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter4 == 1'b1)) begin
            reuse_reg12_fu_60 <= t_2_reg_685;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        reuse_reg_fu_68 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        reuse_reg_fu_68 <= tq_2_reg_718;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_fu_72 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        s_fu_72 <= t_reg_663;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            sq_fu_76 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter5 == 1'b1)) begin
            sq_fu_76 <= tq_reg_706;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        x_fu_80 <= 17'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        x_fu_80 <= add_ln311_reg_606;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            y_fu_84 <= 31'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln306_reg_565 == 1'd0))) begin
            y_fu_84 <= select_ln306_3_fu_245_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        SQSUM1_data_load_reg_713 <= SQSUM1_data_q0;
        tq_reg_706 <= grp_fu_471_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SUM1_data_load_reg_670 <= SUM1_data_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln306_1_reg_569 <= add_ln306_1_fu_224_p2;
        add_ln306_reg_579 <= add_ln306_fu_233_p2;
        add_ln313_1_reg_616 <= add_ln313_1_fu_333_p2;
        add_ln322_reg_611[16 : 6] <= add_ln322_fu_327_p2[16 : 6];
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        cmp9_i_reg_680 <= cmp9_i_fu_387_p2;
        cmp9_i_reg_680_pp0_iter4_reg <= cmp9_i_reg_680;
        icmp_ln306_reg_565 <= icmp_ln306_fu_219_p2;
        icmp_ln311_reg_557 <= icmp_ln311_fu_214_p2;
        icmp_ln311_reg_557_pp0_iter1_reg <= icmp_ln311_reg_557;
        icmp_ln311_reg_557_pp0_iter2_reg <= icmp_ln311_reg_557_pp0_iter1_reg;
        icmp_ln311_reg_557_pp0_iter3_reg <= icmp_ln311_reg_557_pp0_iter2_reg;
        it_reg_651 <= IMG1_data_q0;
        t_2_reg_685 <= t_2_fu_406_p3;
        x_1_reg_552 <= ap_sig_allocacmp_x_1;
        y_load_reg_574 <= y_fu_84;
        zext_ln322_2_reg_639[16 : 0] <= zext_ln322_2_fu_349_p1[16 : 0];
        zext_ln322_2_reg_639_pp0_iter3_reg[16 : 0] <= zext_ln322_2_reg_639[16 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln311_reg_606 <= add_ln311_fu_290_p2;
        add_ln313_reg_595[16 : 6] <= add_ln313_fu_274_p2[16 : 6];
        add_ln322_1_reg_634 <= add_ln322_1_fu_345_p2;
        addr_cmp16_reg_675 <= addr_cmp16_fu_378_p2;
        addr_cmp_reg_701 <= addr_cmp_fu_430_p2;
        empty_reg_600 <= empty_fu_284_p2;
        select_ln306_3_reg_590 <= select_ln306_3_fu_245_p3;
        select_ln306_3_reg_590_pp0_iter2_reg <= select_ln306_3_reg_590;
        select_ln306_3_reg_590_pp0_iter3_reg <= select_ln306_3_reg_590_pp0_iter2_reg;
        select_ln306_reg_584 <= select_ln306_fu_239_p3;
        t_reg_663 <= t_fu_369_p2;
        tq_2_reg_718 <= tq_2_fu_457_p3;
        zext_ln313_reg_621[16 : 0] <= zext_ln313_fu_341_p1[16 : 0];
        zext_ln313_reg_621_pp0_iter3_reg[16 : 0] <= zext_ln313_reg_621[16 : 0];
        zext_ln313_reg_621_pp0_iter4_reg[16 : 0] <= zext_ln313_reg_621_pp0_iter3_reg[16 : 0];
        zext_ln313_reg_621_pp0_iter5_reg[16 : 0] <= zext_ln313_reg_621_pp0_iter4_reg[16 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        IMG1_data_ce0 = 1'b1;
    end else begin
        IMG1_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        SQSUM1_data_address0 = zext_ln313_reg_621_pp0_iter5_reg;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SQSUM1_data_address0 = zext_ln322_2_reg_639_pp0_iter3_reg;
    end else begin
        SQSUM1_data_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        SQSUM1_data_ce0 = 1'b1;
    end else begin
        SQSUM1_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        SQSUM1_data_we0 = 1'b1;
    end else begin
        SQSUM1_data_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SUM1_data_address0 = zext_ln313_reg_621_pp0_iter3_reg;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        SUM1_data_address0 = zext_ln322_2_fu_349_p1;
    end else begin
        SUM1_data_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        SUM1_data_ce0 = 1'b1;
    end else begin
        SUM1_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SUM1_data_we0 = 1'b1;
    end else begin
        SUM1_data_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln306_fu_219_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (~((ap_loop_exit_ready == 1'b0) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b0) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b0) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0))) begin
        ap_done_pending_pp0 = 1'b1;
    end else begin
        ap_done_pending_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to5 = 1'b1;
    end else begin
        ap_idle_pp0_1to5 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter5 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_sq_load = tq_reg_706;
    end else begin
        ap_sig_allocacmp_sq_load = sq_fu_76;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_x_1 = add_ln311_reg_606;
    end else begin
        ap_sig_allocacmp_x_1 = x_fu_80;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_done_pending_pp0 == 1'b0) & (ap_idle_pp0_1to5 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign IMG1_data_address0 = zext_ln313_fu_341_p1;

assign SQSUM1_data_d0 = tq_2_reg_718;

assign SUM1_data_d0 = t_2_reg_685;

assign add_ln306_1_fu_224_p2 = (indvar_flatten_fu_88 + 64'd1);

assign add_ln306_fu_233_p2 = (y_fu_84 + 31'd1);

assign add_ln311_fu_290_p2 = (select_ln306_fu_239_p3 + 17'd1);

assign add_ln313_1_fu_333_p2 = (add_ln313_reg_595 + select_ln306_reg_584);

assign add_ln313_fu_274_p2 = (tmp_6_fu_258_p3 + tmp_7_fu_266_p3);

assign add_ln322_1_fu_345_p2 = (add_ln322_reg_611 + select_ln306_reg_584);

assign add_ln322_fu_327_p2 = (zext_ln322_fu_312_p1 + zext_ln322_1_fu_323_p1);

assign addr_cmp16_fu_378_p2 = ((reuse_addr_reg13_fu_56 == zext_ln322_2_reg_639) ? 1'b1 : 1'b0);

assign addr_cmp_fu_430_p2 = ((reuse_addr_reg_fu_64 == zext_ln322_2_reg_639_pp0_iter3_reg) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign cmp9_i_fu_387_p2 = ((select_ln306_3_reg_590_pp0_iter3_reg == 31'd0) ? 1'b1 : 1'b0);

assign empty_fu_284_p2 = ($signed(trunc_ln306_fu_280_p1) + $signed(8'd255));

assign grp_fu_471_p0 = zext_ln315_1_fu_366_p1;

assign grp_fu_471_p1 = zext_ln315_1_fu_366_p1;

assign grp_fu_471_p2 = ((icmp_ln311_reg_557_pp0_iter3_reg[0:0] == 1'b1) ? ap_sig_allocacmp_sq_load : 32'd0);

assign icmp_ln306_fu_219_p2 = ((indvar_flatten_fu_88 == bound) ? 1'b1 : 1'b0);

assign icmp_ln311_fu_214_p2 = (($signed(zext_ln311_fu_210_p1) < $signed(sum_col)) ? 1'b1 : 1'b0);

assign reuse_select17_fu_395_p3 = ((addr_cmp16_reg_675[0:0] == 1'b1) ? reuse_reg12_fu_60 : SUM1_data_load_reg_670);

assign reuse_select_fu_446_p3 = ((addr_cmp_reg_701[0:0] == 1'b1) ? reuse_reg_fu_68 : SQSUM1_data_load_reg_713);

assign select_ln306_2_fu_356_p3 = ((icmp_ln311_reg_557_pp0_iter2_reg[0:0] == 1'b1) ? s_fu_72 : 32'd0);

assign select_ln306_3_fu_245_p3 = ((icmp_ln311_reg_557[0:0] == 1'b1) ? y_load_reg_574 : add_ln306_reg_579);

assign select_ln306_fu_239_p3 = ((icmp_ln311_reg_557[0:0] == 1'b1) ? x_1_reg_552 : 17'd0);

assign t_1_fu_401_p2 = (reuse_select17_fu_395_p3 + t_reg_663);

assign t_2_fu_406_p3 = ((cmp9_i_fu_387_p2[0:0] == 1'b1) ? t_reg_663 : t_1_fu_401_p2);

assign t_fu_369_p2 = (zext_ln315_fu_363_p1 + select_ln306_2_fu_356_p3);

assign tmp_6_fu_258_p3 = {{trunc_ln313_1_fu_254_p1}, {8'd0}};

assign tmp_7_fu_266_p3 = {{trunc_ln313_fu_250_p1}, {6'd0}};

assign tmp_8_fu_305_p3 = {{empty_reg_600}, {8'd0}};

assign tmp_9_fu_316_p3 = {{empty_reg_600}, {6'd0}};

assign tq_1_fu_452_p2 = (reuse_select_fu_446_p3 + tq_reg_706);

assign tq_2_fu_457_p3 = ((cmp9_i_reg_680_pp0_iter4_reg[0:0] == 1'b1) ? tq_reg_706 : tq_1_fu_452_p2);

assign trunc_ln306_fu_280_p1 = select_ln306_3_fu_245_p3[7:0];

assign trunc_ln313_1_fu_254_p1 = select_ln306_3_fu_245_p3[8:0];

assign trunc_ln313_fu_250_p1 = select_ln306_3_fu_245_p3[10:0];

assign zext_ln311_fu_210_p1 = ap_sig_allocacmp_x_1;

assign zext_ln313_fu_341_p1 = add_ln313_1_reg_616;

assign zext_ln315_1_fu_366_p1 = it_reg_651;

assign zext_ln315_fu_363_p1 = it_reg_651;

assign zext_ln322_1_fu_323_p1 = tmp_9_fu_316_p3;

assign zext_ln322_2_fu_349_p1 = add_ln322_1_reg_634;

assign zext_ln322_fu_312_p1 = tmp_8_fu_305_p3;

always @ (posedge ap_clk) begin
    add_ln313_reg_595[5:0] <= 6'b000000;
    add_ln322_reg_611[5:0] <= 6'b000000;
    zext_ln313_reg_621[63:17] <= 47'b00000000000000000000000000000000000000000000000;
    zext_ln313_reg_621_pp0_iter3_reg[63:17] <= 47'b00000000000000000000000000000000000000000000000;
    zext_ln313_reg_621_pp0_iter4_reg[63:17] <= 47'b00000000000000000000000000000000000000000000000;
    zext_ln313_reg_621_pp0_iter5_reg[63:17] <= 47'b00000000000000000000000000000000000000000000000;
    zext_ln322_2_reg_639[63:17] <= 47'b00000000000000000000000000000000000000000000000;
    zext_ln322_2_reg_639_pp0_iter3_reg[63:17] <= 47'b00000000000000000000000000000000000000000000000;
end

endmodule //face_detect_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2