// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module main_main_Pipeline_VITIS_LOOP_188_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        results_0_address0,
        results_0_ce0,
        results_0_we0,
        results_0_d0,
        results_1_address0,
        results_1_ce0,
        results_1_we0,
        results_1_d0,
        results_2_address0,
        results_2_ce0,
        results_2_we0,
        results_2_d0,
        results_3_address0,
        results_3_ce0,
        results_3_we0,
        results_3_d0,
        results_4_address0,
        results_4_ce0,
        results_4_we0,
        results_4_d0,
        results_5_address0,
        results_5_ce0,
        results_5_we0,
        results_5_d0,
        results_6_address0,
        results_6_ce0,
        results_6_we0,
        results_6_d0,
        results_7_address0,
        results_7_ce0,
        results_7_we0,
        results_7_d0,
        results_address0,
        results_ce0,
        results_we0,
        results_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [2:0] results_0_address0;
output   results_0_ce0;
output   results_0_we0;
output  [31:0] results_0_d0;
output  [2:0] results_1_address0;
output   results_1_ce0;
output   results_1_we0;
output  [31:0] results_1_d0;
output  [2:0] results_2_address0;
output   results_2_ce0;
output   results_2_we0;
output  [31:0] results_2_d0;
output  [2:0] results_3_address0;
output   results_3_ce0;
output   results_3_we0;
output  [31:0] results_3_d0;
output  [2:0] results_4_address0;
output   results_4_ce0;
output   results_4_we0;
output  [31:0] results_4_d0;
output  [2:0] results_5_address0;
output   results_5_ce0;
output   results_5_we0;
output  [31:0] results_5_d0;
output  [2:0] results_6_address0;
output   results_6_ce0;
output   results_6_we0;
output  [31:0] results_6_d0;
output  [2:0] results_7_address0;
output   results_7_ce0;
output   results_7_we0;
output  [31:0] results_7_d0;
output  [2:0] results_address0;
output   results_ce0;
output   results_we0;
output  [31:0] results_d0;

reg ap_idle;
reg results_0_ce0;
reg results_0_we0;
reg results_1_ce0;
reg results_1_we0;
reg results_2_ce0;
reg results_2_we0;
reg results_3_ce0;
reg results_3_we0;
reg results_4_ce0;
reg results_4_we0;
reg results_5_ce0;
reg results_5_we0;
reg results_6_ce0;
reg results_6_we0;
reg results_7_ce0;
reg results_7_we0;
reg results_ce0;
reg results_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln188_fu_182_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [2:0] i_1_reg_218;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln188_fu_199_p1;
wire    ap_block_pp0_stage0;
reg   [2:0] i_fu_44;
wire   [2:0] add_ln188_fu_188_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_i_1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 i_fu_44 = 3'd0;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln188_fu_182_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_44 <= add_ln188_fu_188_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_44 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_1_reg_218 <= ap_sig_allocacmp_i_1;
    end
end

always @ (*) begin
    if (((icmp_ln188_fu_182_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 3'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_44;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_0_ce0 = 1'b1;
    end else begin
        results_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_0_we0 = 1'b1;
    end else begin
        results_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_1_ce0 = 1'b1;
    end else begin
        results_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_1_we0 = 1'b1;
    end else begin
        results_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_2_ce0 = 1'b1;
    end else begin
        results_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_2_we0 = 1'b1;
    end else begin
        results_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_3_ce0 = 1'b1;
    end else begin
        results_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_3_we0 = 1'b1;
    end else begin
        results_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_4_ce0 = 1'b1;
    end else begin
        results_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_4_we0 = 1'b1;
    end else begin
        results_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_5_ce0 = 1'b1;
    end else begin
        results_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_5_we0 = 1'b1;
    end else begin
        results_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_6_ce0 = 1'b1;
    end else begin
        results_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_6_we0 = 1'b1;
    end else begin
        results_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_7_ce0 = 1'b1;
    end else begin
        results_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_7_we0 = 1'b1;
    end else begin
        results_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_ce0 = 1'b1;
    end else begin
        results_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        results_we0 = 1'b1;
    end else begin
        results_we0 = 1'b0;
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

assign add_ln188_fu_188_p2 = (ap_sig_allocacmp_i_1 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln188_fu_182_p2 = ((ap_sig_allocacmp_i_1 == 3'd5) ? 1'b1 : 1'b0);

assign results_0_address0 = zext_ln188_fu_199_p1;

assign results_0_d0 = 32'd0;

assign results_1_address0 = zext_ln188_fu_199_p1;

assign results_1_d0 = 32'd0;

assign results_2_address0 = zext_ln188_fu_199_p1;

assign results_2_d0 = 32'd0;

assign results_3_address0 = zext_ln188_fu_199_p1;

assign results_3_d0 = 32'd0;

assign results_4_address0 = zext_ln188_fu_199_p1;

assign results_4_d0 = 32'd0;

assign results_5_address0 = zext_ln188_fu_199_p1;

assign results_5_d0 = 32'd0;

assign results_6_address0 = zext_ln188_fu_199_p1;

assign results_6_d0 = 32'd0;

assign results_7_address0 = zext_ln188_fu_199_p1;

assign results_7_d0 = 32'd0;

assign results_address0 = zext_ln188_fu_199_p1;

assign results_d0 = 32'd0;

assign zext_ln188_fu_199_p1 = i_1_reg_218;

endmodule //main_main_Pipeline_VITIS_LOOP_188_2