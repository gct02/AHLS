// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module main_main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_address0,
        A_ce0,
        A_we0,
        A_d0,
        A_s_address0,
        A_s_ce0,
        A_s_we0,
        A_s_d0,
        u1_address0,
        u1_ce0,
        u1_we0,
        u1_d0,
        v1_address0,
        v1_ce0,
        v1_we0,
        v1_d0,
        u2_address0,
        u2_ce0,
        u2_we0,
        u2_d0,
        v2_address0,
        v2_ce0,
        v2_we0,
        v2_d0,
        w_address0,
        w_ce0,
        w_we0,
        w_d0,
        x_address0,
        x_ce0,
        x_we0,
        x_d0,
        w_s_address0,
        w_s_ce0,
        w_s_we0,
        w_s_d0,
        x_s_address0,
        x_s_ce0,
        x_s_we0,
        x_s_d0,
        y_address0,
        y_ce0,
        y_we0,
        y_d0,
        z_address0,
        z_ce0,
        z_we0,
        z_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [15:0] A_address0;
output   A_ce0;
output   A_we0;
output  [31:0] A_d0;
output  [15:0] A_s_address0;
output   A_s_ce0;
output   A_s_we0;
output  [31:0] A_s_d0;
output  [7:0] u1_address0;
output   u1_ce0;
output   u1_we0;
output  [31:0] u1_d0;
output  [7:0] v1_address0;
output   v1_ce0;
output   v1_we0;
output  [31:0] v1_d0;
output  [7:0] u2_address0;
output   u2_ce0;
output   u2_we0;
output  [31:0] u2_d0;
output  [7:0] v2_address0;
output   v2_ce0;
output   v2_we0;
output  [31:0] v2_d0;
output  [7:0] w_address0;
output   w_ce0;
output   w_we0;
output  [31:0] w_d0;
output  [7:0] x_address0;
output   x_ce0;
output   x_we0;
output  [31:0] x_d0;
output  [7:0] w_s_address0;
output   w_s_ce0;
output   w_s_we0;
output  [31:0] w_s_d0;
output  [7:0] x_s_address0;
output   x_s_ce0;
output   x_s_we0;
output  [31:0] x_s_d0;
output  [7:0] y_address0;
output   y_ce0;
output   y_we0;
output  [31:0] y_d0;
output  [7:0] z_address0;
output   z_ce0;
output   z_we0;
output  [31:0] z_d0;

reg ap_idle;
reg A_ce0;
reg A_we0;
reg A_s_ce0;
reg A_s_we0;
reg u1_ce0;
reg u1_we0;
reg v1_ce0;
reg v1_we0;
reg u2_ce0;
reg u2_we0;
reg v2_ce0;
reg v2_we0;
reg w_ce0;
reg w_we0;
reg x_ce0;
reg x_we0;
reg w_s_ce0;
reg w_s_we0;
reg x_s_ce0;
reg x_s_we0;
reg y_ce0;
reg y_we0;
reg z_ce0;
reg z_we0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln56_fu_279_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [0:0] first_iter_0_reg_248;
reg   [0:0] icmp_ln56_reg_408;
wire    ap_block_pp0_stage1_11001;
wire   [16:0] add_ln56_fu_285_p2;
reg   [16:0] add_ln56_reg_412;
wire   [0:0] or_ln56_fu_303_p2;
reg   [0:0] or_ln56_reg_417;
wire   [8:0] select_ln56_fu_309_p3;
reg   [8:0] select_ln56_reg_421;
wire   [8:0] select_ln56_1_fu_323_p3;
reg   [8:0] select_ln56_1_reg_427;
wire   [15:0] add_ln68_fu_358_p2;
reg   [15:0] add_ln68_reg_434;
wire    ap_block_pp0_stage0_11001;
reg    ap_enable_reg_pp0_iter0_reg;
reg   [0:0] ap_phi_mux_first_iter_0_phi_fu_253_p4;
wire    ap_loop_init;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln56_fu_331_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln68_fu_382_p1;
reg   [8:0] x_1_fu_68;
wire   [8:0] add_ln67_fu_364_p2;
reg   [8:0] yy_fu_72;
reg   [16:0] indvar_flatten_fu_76;
wire   [0:0] icmp_ln67_fu_297_p2;
wire   [8:0] add_ln56_1_fu_317_p2;
wire   [7:0] empty_fu_344_p1;
wire   [15:0] zext_ln67_fu_355_p1;
wire   [15:0] tmp_s_fu_347_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 x_1_fu_68 = 9'd0;
#0 yy_fu_72 = 9'd0;
#0 indvar_flatten_fu_76 = 17'd0;
#0 ap_done_reg = 1'b0;
end

main_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln56_reg_408 == 1'd0))) begin
        first_iter_0_reg_248 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        first_iter_0_reg_248 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_76 <= 17'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln56_reg_408 == 1'd0))) begin
            indvar_flatten_fu_76 <= add_ln56_reg_412;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            x_1_fu_68 <= 9'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln56_reg_408 == 1'd0))) begin
            x_1_fu_68 <= add_ln67_fu_364_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            yy_fu_72 <= 9'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln56_reg_408 == 1'd0))) begin
            yy_fu_72 <= select_ln56_1_reg_427;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln56_reg_412 <= add_ln56_fu_285_p2;
        icmp_ln56_reg_408 <= icmp_ln56_fu_279_p2;
        or_ln56_reg_417 <= or_ln56_fu_303_p2;
        select_ln56_1_reg_427 <= select_ln56_1_fu_323_p3;
        select_ln56_reg_421 <= select_ln56_fu_309_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln68_reg_434 <= add_ln68_fu_358_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        A_s_ce0 = 1'b1;
    end else begin
        A_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln56_reg_408 == 1'd0))) begin
        A_s_we0 = 1'b1;
    end else begin
        A_s_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln56_reg_408 == 1'd0))) begin
        A_we0 = 1'b1;
    end else begin
        A_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln56_fu_279_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln56_reg_408 == 1'd0))) begin
        ap_phi_mux_first_iter_0_phi_fu_253_p4 = 1'd0;
    end else begin
        ap_phi_mux_first_iter_0_phi_fu_253_p4 = first_iter_0_reg_248;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        u1_ce0 = 1'b1;
    end else begin
        u1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        u1_we0 = 1'b1;
    end else begin
        u1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        u2_ce0 = 1'b1;
    end else begin
        u2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        u2_we0 = 1'b1;
    end else begin
        u2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v1_ce0 = 1'b1;
    end else begin
        v1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        v1_we0 = 1'b1;
    end else begin
        v1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        v2_ce0 = 1'b1;
    end else begin
        v2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        v2_we0 = 1'b1;
    end else begin
        v2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        w_ce0 = 1'b1;
    end else begin
        w_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        w_s_ce0 = 1'b1;
    end else begin
        w_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        w_s_we0 = 1'b1;
    end else begin
        w_s_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        w_we0 = 1'b1;
    end else begin
        w_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        x_ce0 = 1'b1;
    end else begin
        x_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        x_s_ce0 = 1'b1;
    end else begin
        x_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        x_s_we0 = 1'b1;
    end else begin
        x_s_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        x_we0 = 1'b1;
    end else begin
        x_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        y_ce0 = 1'b1;
    end else begin
        y_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        y_we0 = 1'b1;
    end else begin
        y_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        z_ce0 = 1'b1;
    end else begin
        z_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln56_reg_417 == 1'd1) & (icmp_ln56_reg_408 == 1'd0))) begin
        z_we0 = 1'b1;
    end else begin
        z_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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

assign A_address0 = zext_ln68_fu_382_p1;

assign A_d0 = 32'd1045220557;

assign A_s_address0 = zext_ln68_fu_382_p1;

assign A_s_d0 = 32'd1045220557;

assign add_ln56_1_fu_317_p2 = (yy_fu_72 + 9'd1);

assign add_ln56_fu_285_p2 = (indvar_flatten_fu_76 + 17'd1);

assign add_ln67_fu_364_p2 = (select_ln56_reg_421 + 9'd1);

assign add_ln68_fu_358_p2 = (zext_ln67_fu_355_p1 + tmp_s_fu_347_p3);

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

assign empty_fu_344_p1 = select_ln56_1_reg_427[7:0];

assign icmp_ln56_fu_279_p2 = ((indvar_flatten_fu_76 == 17'd65536) ? 1'b1 : 1'b0);

assign icmp_ln67_fu_297_p2 = ((x_1_fu_68 == 9'd256) ? 1'b1 : 1'b0);

assign or_ln56_fu_303_p2 = (icmp_ln67_fu_297_p2 | ap_phi_mux_first_iter_0_phi_fu_253_p4);

assign select_ln56_1_fu_323_p3 = ((icmp_ln67_fu_297_p2[0:0] == 1'b1) ? add_ln56_1_fu_317_p2 : yy_fu_72);

assign select_ln56_fu_309_p3 = ((icmp_ln67_fu_297_p2[0:0] == 1'b1) ? 9'd0 : x_1_fu_68);

assign tmp_s_fu_347_p3 = {{empty_fu_344_p1}, {8'd0}};

assign u1_address0 = zext_ln56_fu_331_p1;

assign u1_d0 = 32'd1036831949;

assign u2_address0 = zext_ln56_fu_331_p1;

assign u2_d0 = 32'd1036831949;

assign v1_address0 = zext_ln56_fu_331_p1;

assign v1_d0 = 32'd1036831949;

assign v2_address0 = zext_ln56_fu_331_p1;

assign v2_d0 = 32'd1036831949;

assign w_address0 = zext_ln56_fu_331_p1;

assign w_d0 = 32'd1036831949;

assign w_s_address0 = zext_ln56_fu_331_p1;

assign w_s_d0 = 32'd1036831949;

assign x_address0 = zext_ln56_fu_331_p1;

assign x_d0 = 32'd1036831949;

assign x_s_address0 = zext_ln56_fu_331_p1;

assign x_s_d0 = 32'd1036831949;

assign y_address0 = zext_ln56_fu_331_p1;

assign y_d0 = 32'd1036831949;

assign z_address0 = zext_ln56_fu_331_p1;

assign z_d0 = 32'd1036831949;

assign zext_ln56_fu_331_p1 = select_ln56_1_reg_427;

assign zext_ln67_fu_355_p1 = select_ln56_reg_421;

assign zext_ln68_fu_382_p1 = add_ln68_reg_434;

endmodule //main_main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2