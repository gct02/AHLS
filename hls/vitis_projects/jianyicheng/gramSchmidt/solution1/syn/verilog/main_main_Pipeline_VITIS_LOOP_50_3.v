// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module main_main_Pipeline_VITIS_LOOP_50_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zext_ln52_4,
        a_s_address0,
        a_s_ce0,
        a_s_q0,
        nrm_7,
        q_s_address0,
        q_s_ce0,
        q_s_we0,
        q_s_d0,
        grp_fu_435_p_din0,
        grp_fu_435_p_din1,
        grp_fu_435_p_dout0,
        grp_fu_435_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [4:0] zext_ln52_4;
output  [9:0] a_s_address0;
output   a_s_ce0;
input  [31:0] a_s_q0;
input  [31:0] nrm_7;
output  [9:0] q_s_address0;
output   q_s_ce0;
output   q_s_we0;
output  [31:0] q_s_d0;
output  [31:0] grp_fu_435_p_din0;
output  [31:0] grp_fu_435_p_din1;
input  [31:0] grp_fu_435_p_dout0;
output   grp_fu_435_p_ce;

reg ap_idle;
reg a_s_ce0;
reg q_s_ce0;
reg q_s_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_enable_reg_pp0_iter19;
reg    ap_enable_reg_pp0_iter20;
reg    ap_enable_reg_pp0_iter21;
reg    ap_enable_reg_pp0_iter22;
reg    ap_enable_reg_pp0_iter23;
reg    ap_enable_reg_pp0_iter24;
reg    ap_enable_reg_pp0_iter25;
reg    ap_enable_reg_pp0_iter26;
reg    ap_enable_reg_pp0_iter27;
reg    ap_enable_reg_pp0_iter28;
reg    ap_enable_reg_pp0_iter29;
reg    ap_enable_reg_pp0_iter30;
reg    ap_enable_reg_pp0_iter31;
reg    ap_enable_reg_pp0_iter32;
reg    ap_enable_reg_pp0_iter33;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_fu_102_p3;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [4:0] or_ln51_fu_114_p2;
reg   [4:0] or_ln51_reg_168;
reg   [4:0] tmp_9_reg_173;
wire   [63:0] zext_ln51_fu_147_p1;
reg   [63:0] zext_ln51_reg_178;
reg   [63:0] zext_ln51_reg_178_pp0_iter2_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter3_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter4_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter5_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter6_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter7_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter8_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter9_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter10_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter11_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter12_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter13_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter14_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter15_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter16_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter17_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter18_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter19_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter20_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter21_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter22_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter23_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter24_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter25_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter26_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter27_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter28_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter29_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter30_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter31_reg;
reg   [63:0] zext_ln51_reg_178_pp0_iter32_reg;
reg   [31:0] a_load_1_reg_188;
reg   [31:0] div_i_reg_193;
wire    ap_block_pp0_stage0;
reg   [10:0] i_fu_48;
wire   [10:0] add_ln50_fu_130_p2;
wire    ap_loop_init;
reg   [10:0] ap_sig_allocacmp_i_2;
wire   [4:0] trunc_ln51_fu_110_p1;
wire   [9:0] add_ln_fu_141_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg    ap_loop_exit_ready_pp0_iter15_reg;
reg    ap_loop_exit_ready_pp0_iter16_reg;
reg    ap_loop_exit_ready_pp0_iter17_reg;
reg    ap_loop_exit_ready_pp0_iter18_reg;
reg    ap_loop_exit_ready_pp0_iter19_reg;
reg    ap_loop_exit_ready_pp0_iter20_reg;
reg    ap_loop_exit_ready_pp0_iter21_reg;
reg    ap_loop_exit_ready_pp0_iter22_reg;
reg    ap_loop_exit_ready_pp0_iter23_reg;
reg    ap_loop_exit_ready_pp0_iter24_reg;
reg    ap_loop_exit_ready_pp0_iter25_reg;
reg    ap_loop_exit_ready_pp0_iter26_reg;
reg    ap_loop_exit_ready_pp0_iter27_reg;
reg    ap_loop_exit_ready_pp0_iter28_reg;
reg    ap_loop_exit_ready_pp0_iter29_reg;
reg    ap_loop_exit_ready_pp0_iter30_reg;
reg    ap_loop_exit_ready_pp0_iter31_reg;
reg    ap_loop_exit_ready_pp0_iter32_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_enable_reg_pp0_iter19 = 1'b0;
#0 ap_enable_reg_pp0_iter20 = 1'b0;
#0 ap_enable_reg_pp0_iter21 = 1'b0;
#0 ap_enable_reg_pp0_iter22 = 1'b0;
#0 ap_enable_reg_pp0_iter23 = 1'b0;
#0 ap_enable_reg_pp0_iter24 = 1'b0;
#0 ap_enable_reg_pp0_iter25 = 1'b0;
#0 ap_enable_reg_pp0_iter26 = 1'b0;
#0 ap_enable_reg_pp0_iter27 = 1'b0;
#0 ap_enable_reg_pp0_iter28 = 1'b0;
#0 ap_enable_reg_pp0_iter29 = 1'b0;
#0 ap_enable_reg_pp0_iter30 = 1'b0;
#0 ap_enable_reg_pp0_iter31 = 1'b0;
#0 ap_enable_reg_pp0_iter32 = 1'b0;
#0 ap_enable_reg_pp0_iter33 = 1'b0;
#0 i_fu_48 = 11'd0;
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
        end else if (((ap_loop_exit_ready_pp0_iter32_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter19 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter20 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter20 <= ap_enable_reg_pp0_iter19;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter21 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter21 <= ap_enable_reg_pp0_iter20;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter22 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter21;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter23 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter23 <= ap_enable_reg_pp0_iter22;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter24 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter24 <= ap_enable_reg_pp0_iter23;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter25 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter25 <= ap_enable_reg_pp0_iter24;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter26 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter26 <= ap_enable_reg_pp0_iter25;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter27 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter27 <= ap_enable_reg_pp0_iter26;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter28 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter28 <= ap_enable_reg_pp0_iter27;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter29 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter29 <= ap_enable_reg_pp0_iter28;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter30 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter30 <= ap_enable_reg_pp0_iter29;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter31 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter31 <= ap_enable_reg_pp0_iter30;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter32 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter32 <= ap_enable_reg_pp0_iter31;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter33 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter33 <= ap_enable_reg_pp0_iter32;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (tmp_fu_102_p3 == 1'd0))) begin
            i_fu_48 <= add_ln50_fu_130_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_48 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        a_load_1_reg_188 <= a_s_q0;
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter15_reg <= ap_loop_exit_ready_pp0_iter14_reg;
        ap_loop_exit_ready_pp0_iter16_reg <= ap_loop_exit_ready_pp0_iter15_reg;
        ap_loop_exit_ready_pp0_iter17_reg <= ap_loop_exit_ready_pp0_iter16_reg;
        ap_loop_exit_ready_pp0_iter18_reg <= ap_loop_exit_ready_pp0_iter17_reg;
        ap_loop_exit_ready_pp0_iter19_reg <= ap_loop_exit_ready_pp0_iter18_reg;
        ap_loop_exit_ready_pp0_iter20_reg <= ap_loop_exit_ready_pp0_iter19_reg;
        ap_loop_exit_ready_pp0_iter21_reg <= ap_loop_exit_ready_pp0_iter20_reg;
        ap_loop_exit_ready_pp0_iter22_reg <= ap_loop_exit_ready_pp0_iter21_reg;
        ap_loop_exit_ready_pp0_iter23_reg <= ap_loop_exit_ready_pp0_iter22_reg;
        ap_loop_exit_ready_pp0_iter24_reg <= ap_loop_exit_ready_pp0_iter23_reg;
        ap_loop_exit_ready_pp0_iter25_reg <= ap_loop_exit_ready_pp0_iter24_reg;
        ap_loop_exit_ready_pp0_iter26_reg <= ap_loop_exit_ready_pp0_iter25_reg;
        ap_loop_exit_ready_pp0_iter27_reg <= ap_loop_exit_ready_pp0_iter26_reg;
        ap_loop_exit_ready_pp0_iter28_reg <= ap_loop_exit_ready_pp0_iter27_reg;
        ap_loop_exit_ready_pp0_iter29_reg <= ap_loop_exit_ready_pp0_iter28_reg;
        ap_loop_exit_ready_pp0_iter30_reg <= ap_loop_exit_ready_pp0_iter29_reg;
        ap_loop_exit_ready_pp0_iter31_reg <= ap_loop_exit_ready_pp0_iter30_reg;
        ap_loop_exit_ready_pp0_iter32_reg <= ap_loop_exit_ready_pp0_iter31_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        div_i_reg_193 <= grp_fu_435_p_dout0;
        zext_ln51_reg_178_pp0_iter10_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter9_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter11_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter10_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter12_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter11_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter13_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter12_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter14_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter13_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter15_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter14_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter16_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter15_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter17_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter16_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter18_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter17_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter19_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter18_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter20_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter19_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter21_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter20_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter22_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter21_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter23_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter22_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter24_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter23_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter25_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter24_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter26_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter25_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter27_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter26_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter28_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter27_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter29_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter28_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter2_reg[9 : 0] <= zext_ln51_reg_178[9 : 0];
        zext_ln51_reg_178_pp0_iter30_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter29_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter31_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter30_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter32_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter31_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter3_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter2_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter4_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter3_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter5_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter4_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter6_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter5_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter7_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter6_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter8_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter7_reg[9 : 0];
        zext_ln51_reg_178_pp0_iter9_reg[9 : 0] <= zext_ln51_reg_178_pp0_iter8_reg[9 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        or_ln51_reg_168 <= or_ln51_fu_114_p2;
        tmp_9_reg_173 <= {{ap_sig_allocacmp_i_2[9:5]}};
        zext_ln51_reg_178[9 : 0] <= zext_ln51_fu_147_p1[9 : 0];
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        a_s_ce0 = 1'b1;
    end else begin
        a_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_fu_102_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter32_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_idle_pp0 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter26 == 1'b0) & (ap_enable_reg_pp0_iter25 == 1'b0) & (ap_enable_reg_pp0_iter24 == 1'b0) & (ap_enable_reg_pp0_iter23 == 1'b0) & (ap_enable_reg_pp0_iter22 == 1'b0) & (ap_enable_reg_pp0_iter21 == 1'b0) & (ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter33 == 1'b0) 
    & (ap_enable_reg_pp0_iter32 == 1'b0) & (ap_enable_reg_pp0_iter31 == 1'b0) & (ap_enable_reg_pp0_iter30 == 1'b0) & (ap_enable_reg_pp0_iter29 == 1'b0) & (ap_enable_reg_pp0_iter28 == 1'b0) & (ap_enable_reg_pp0_iter27 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_2 = 11'd0;
    end else begin
        ap_sig_allocacmp_i_2 = i_fu_48;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter33 == 1'b1))) begin
        q_s_ce0 = 1'b1;
    end else begin
        q_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter33 == 1'b1))) begin
        q_s_we0 = 1'b1;
    end else begin
        q_s_we0 = 1'b0;
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

assign a_s_address0 = zext_ln51_fu_147_p1;

assign add_ln50_fu_130_p2 = (ap_sig_allocacmp_i_2 + 11'd32);

assign add_ln_fu_141_p3 = {{tmp_9_reg_173}, {or_ln51_reg_168}};

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign grp_fu_435_p_ce = 1'b1;

assign grp_fu_435_p_din0 = a_load_1_reg_188;

assign grp_fu_435_p_din1 = nrm_7;

assign or_ln51_fu_114_p2 = (zext_ln52_4 | trunc_ln51_fu_110_p1);

assign q_s_address0 = zext_ln51_reg_178_pp0_iter32_reg;

assign q_s_d0 = div_i_reg_193;

assign tmp_fu_102_p3 = ap_sig_allocacmp_i_2[32'd10];

assign trunc_ln51_fu_110_p1 = ap_sig_allocacmp_i_2[4:0];

assign zext_ln51_fu_147_p1 = add_ln_fu_141_p3;

always @ (posedge ap_clk) begin
    zext_ln51_reg_178[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter2_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter3_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter4_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter5_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter6_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter7_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter8_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter9_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter10_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter11_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter12_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter13_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter14_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter15_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter16_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter17_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter18_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter19_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter20_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter21_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter22_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter23_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter24_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter25_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter26_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter27_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter28_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter29_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter30_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter31_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
    zext_ln51_reg_178_pp0_iter32_reg[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
end

endmodule //main_main_Pipeline_VITIS_LOOP_50_3