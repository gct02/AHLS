// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        huffcode_address0,
        huffcode_ce0,
        huffcode_q0,
        huffcode_address1,
        huffcode_ce1,
        huffcode_q1,
        p_dhtbl_ml_out,
        p_dhtbl_ml_out_ap_vld,
        p_jinfo_ac_dhuff_tbl_maxcode_address0,
        p_jinfo_ac_dhuff_tbl_maxcode_ce0,
        p_jinfo_ac_dhuff_tbl_maxcode_we0,
        p_jinfo_ac_dhuff_tbl_maxcode_d0,
        p_jinfo_ac_dhuff_tbl_maxcode_address1,
        p_jinfo_ac_dhuff_tbl_maxcode_ce1,
        p_jinfo_ac_dhuff_tbl_maxcode_we1,
        p_jinfo_ac_dhuff_tbl_maxcode_d1,
        p_jinfo_dc_xhuff_tbl_bits_address0,
        p_jinfo_dc_xhuff_tbl_bits_ce0,
        p_jinfo_dc_xhuff_tbl_bits_q0,
        p_jinfo_ac_dhuff_tbl_valptr_address0,
        p_jinfo_ac_dhuff_tbl_valptr_ce0,
        p_jinfo_ac_dhuff_tbl_valptr_we0,
        p_jinfo_ac_dhuff_tbl_valptr_d0,
        p_jinfo_ac_dhuff_tbl_mincode_address0,
        p_jinfo_ac_dhuff_tbl_mincode_ce0,
        p_jinfo_ac_dhuff_tbl_mincode_we0,
        p_jinfo_ac_dhuff_tbl_mincode_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [8:0] huffcode_address0;
output   huffcode_ce0;
input  [31:0] huffcode_q0;
output  [8:0] huffcode_address1;
output   huffcode_ce1;
input  [31:0] huffcode_q1;
output  [6:0] p_dhtbl_ml_out;
output   p_dhtbl_ml_out_ap_vld;
output  [6:0] p_jinfo_ac_dhuff_tbl_maxcode_address0;
output   p_jinfo_ac_dhuff_tbl_maxcode_ce0;
output   p_jinfo_ac_dhuff_tbl_maxcode_we0;
output  [31:0] p_jinfo_ac_dhuff_tbl_maxcode_d0;
output  [6:0] p_jinfo_ac_dhuff_tbl_maxcode_address1;
output   p_jinfo_ac_dhuff_tbl_maxcode_ce1;
output   p_jinfo_ac_dhuff_tbl_maxcode_we1;
output  [31:0] p_jinfo_ac_dhuff_tbl_maxcode_d1;
output  [7:0] p_jinfo_dc_xhuff_tbl_bits_address0;
output   p_jinfo_dc_xhuff_tbl_bits_ce0;
input  [7:0] p_jinfo_dc_xhuff_tbl_bits_q0;
output  [6:0] p_jinfo_ac_dhuff_tbl_valptr_address0;
output   p_jinfo_ac_dhuff_tbl_valptr_ce0;
output   p_jinfo_ac_dhuff_tbl_valptr_we0;
output  [10:0] p_jinfo_ac_dhuff_tbl_valptr_d0;
output  [6:0] p_jinfo_ac_dhuff_tbl_mincode_address0;
output   p_jinfo_ac_dhuff_tbl_mincode_ce0;
output   p_jinfo_ac_dhuff_tbl_mincode_we0;
output  [10:0] p_jinfo_ac_dhuff_tbl_mincode_d0;

reg ap_idle;
reg huffcode_ce0;
reg huffcode_ce1;
reg p_dhtbl_ml_out_ap_vld;
reg p_jinfo_ac_dhuff_tbl_maxcode_ce0;
reg p_jinfo_ac_dhuff_tbl_maxcode_we0;
reg p_jinfo_ac_dhuff_tbl_maxcode_ce1;
reg p_jinfo_ac_dhuff_tbl_maxcode_we1;
reg p_jinfo_dc_xhuff_tbl_bits_ce0;
reg p_jinfo_ac_dhuff_tbl_valptr_ce0;
reg p_jinfo_ac_dhuff_tbl_valptr_we0;
reg p_jinfo_ac_dhuff_tbl_mincode_ce0;
reg p_jinfo_ac_dhuff_tbl_mincode_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln664_fu_159_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [4:0] l_reg_285;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln664_reg_290;
reg   [6:0] p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294;
reg   [6:0] p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294_pp0_iter1_reg;
reg   [6:0] p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300;
reg   [6:0] p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300_pp0_iter1_reg;
reg   [6:0] p_jinfo_ac_dhuff_tbl_valptr_addr_reg_305;
wire   [0:0] icmp_ln665_fu_212_p2;
reg   [0:0] icmp_ln665_reg_315;
reg    ap_condition_exit_pp0_iter1_stage0;
wire   [63:0] zext_ln664_fu_165_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln669_fu_218_p1;
wire   [63:0] zext_ln671_fu_235_p1;
reg   [4:0] p_dhtbl_ml_1_fu_42;
wire   [4:0] add_ln664_fu_173_p2;
wire    ap_loop_init;
reg   [4:0] ap_sig_allocacmp_l;
reg   [31:0] p_fu_46;
wire   [31:0] p_2_fu_240_p2;
reg   [31:0] p_dhtbl_ml_fu_50;
wire   [31:0] l_cast7_fu_246_p1;
wire    ap_block_pp0_stage0_01001;
wire   [8:0] trunc_ln664_1_fu_195_p1;
wire   [8:0] add_ln670_fu_223_p2;
wire   [8:0] zext_ln665_1_fu_208_p1;
wire   [8:0] p_1_fu_229_p2;
wire   [31:0] zext_ln665_fu_204_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_262;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 p_dhtbl_ml_1_fu_42 = 5'd0;
#0 p_fu_46 = 32'd0;
#0 p_dhtbl_ml_fu_50 = 32'd0;
#0 ap_done_reg = 1'b0;
end

jpeg2bmp_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln664_fu_159_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            p_dhtbl_ml_1_fu_42 <= add_ln664_fu_173_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            p_dhtbl_ml_1_fu_42 <= 5'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
                        p_dhtbl_ml_fu_50[0] <= 1'b1;
            p_dhtbl_ml_fu_50[1] <= 1'b0;
            p_dhtbl_ml_fu_50[2] <= 1'b0;
            p_dhtbl_ml_fu_50[3] <= 1'b0;
            p_dhtbl_ml_fu_50[4] <= 1'b0;
        end else if ((1'b1 == ap_condition_262)) begin
                        p_dhtbl_ml_fu_50[4 : 0] <= l_cast7_fu_246_p1[4 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            p_fu_46 <= 32'd0;
        end else if ((1'b1 == ap_condition_262)) begin
            p_fu_46 <= p_2_fu_240_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln664_reg_290 <= icmp_ln664_fu_159_p2;
        icmp_ln665_reg_315 <= icmp_ln665_fu_212_p2;
        l_reg_285 <= ap_sig_allocacmp_l;
        p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294[4 : 0] <= zext_ln664_fu_165_p1[4 : 0];
        p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294_pp0_iter1_reg[4 : 0] <= p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294[4 : 0];
        p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300[4 : 0] <= zext_ln664_fu_165_p1[4 : 0];
        p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300_pp0_iter1_reg[4 : 0] <= p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300[4 : 0];
        p_jinfo_ac_dhuff_tbl_valptr_addr_reg_305[4 : 0] <= zext_ln664_fu_165_p1[4 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln664_fu_159_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln664_reg_290 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_l = 5'd1;
    end else begin
        ap_sig_allocacmp_l = p_dhtbl_ml_1_fu_42;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        huffcode_ce0 = 1'b1;
    end else begin
        huffcode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        huffcode_ce1 = 1'b1;
    end else begin
        huffcode_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln664_reg_290 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_dhtbl_ml_out_ap_vld = 1'b1;
    end else begin
        p_dhtbl_ml_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce1 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln665_reg_315 == 1'd0))) begin
        p_jinfo_ac_dhuff_tbl_maxcode_we0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln664_reg_290 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln665_fu_212_p2 == 1'd1))) begin
        p_jinfo_ac_dhuff_tbl_maxcode_we1 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_maxcode_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        p_jinfo_ac_dhuff_tbl_mincode_ce0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_mincode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln665_reg_315 == 1'd0))) begin
        p_jinfo_ac_dhuff_tbl_mincode_we0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_mincode_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_jinfo_ac_dhuff_tbl_valptr_ce0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_valptr_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln664_reg_290 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln665_fu_212_p2 == 1'd0))) begin
        p_jinfo_ac_dhuff_tbl_valptr_we0 = 1'b1;
    end else begin
        p_jinfo_ac_dhuff_tbl_valptr_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_jinfo_dc_xhuff_tbl_bits_ce0 = 1'b1;
    end else begin
        p_jinfo_dc_xhuff_tbl_bits_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln664_fu_173_p2 = (ap_sig_allocacmp_l + 5'd1);

assign add_ln670_fu_223_p2 = ($signed(trunc_ln664_1_fu_195_p1) + $signed(9'd511));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_262 = ((icmp_ln664_reg_290 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln665_fu_212_p2 == 1'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign huffcode_address0 = zext_ln671_fu_235_p1;

assign huffcode_address1 = zext_ln669_fu_218_p1;

assign icmp_ln664_fu_159_p2 = ((ap_sig_allocacmp_l == 5'd17) ? 1'b1 : 1'b0);

assign icmp_ln665_fu_212_p2 = ((p_jinfo_dc_xhuff_tbl_bits_q0 == 8'd0) ? 1'b1 : 1'b0);

assign l_cast7_fu_246_p1 = l_reg_285;

assign p_1_fu_229_p2 = (add_ln670_fu_223_p2 + zext_ln665_1_fu_208_p1);

assign p_2_fu_240_p2 = (zext_ln665_fu_204_p1 + p_fu_46);

assign p_dhtbl_ml_out = p_dhtbl_ml_fu_50[6:0];

assign p_jinfo_ac_dhuff_tbl_maxcode_address0 = p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294_pp0_iter1_reg;

assign p_jinfo_ac_dhuff_tbl_maxcode_address1 = p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294;

assign p_jinfo_ac_dhuff_tbl_maxcode_d0 = huffcode_q0;

assign p_jinfo_ac_dhuff_tbl_maxcode_d1 = 32'd4294967295;

assign p_jinfo_ac_dhuff_tbl_mincode_address0 = p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300_pp0_iter1_reg;

assign p_jinfo_ac_dhuff_tbl_mincode_d0 = huffcode_q1[10:0];

assign p_jinfo_ac_dhuff_tbl_valptr_address0 = p_jinfo_ac_dhuff_tbl_valptr_addr_reg_305;

assign p_jinfo_ac_dhuff_tbl_valptr_d0 = p_fu_46[10:0];

assign p_jinfo_dc_xhuff_tbl_bits_address0 = zext_ln664_fu_165_p1;

assign trunc_ln664_1_fu_195_p1 = p_fu_46[8:0];

assign zext_ln664_fu_165_p1 = ap_sig_allocacmp_l;

assign zext_ln665_1_fu_208_p1 = p_jinfo_dc_xhuff_tbl_bits_q0;

assign zext_ln665_fu_204_p1 = p_jinfo_dc_xhuff_tbl_bits_q0;

assign zext_ln669_fu_218_p1 = p_fu_46;

assign zext_ln671_fu_235_p1 = p_1_fu_229_p2;

always @ (posedge ap_clk) begin
    p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294[6:5] <= 2'b00;
    p_jinfo_ac_dhuff_tbl_maxcode_addr_reg_294_pp0_iter1_reg[6:5] <= 2'b00;
    p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300[6:5] <= 2'b00;
    p_jinfo_ac_dhuff_tbl_mincode_addr_reg_300_pp0_iter1_reg[6:5] <= 2'b00;
    p_jinfo_ac_dhuff_tbl_valptr_addr_reg_305[6:5] <= 2'b00;
    p_dhtbl_ml_fu_50[31:5] <= 27'b000000000000000000000000000;
end

endmodule //jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_664_6