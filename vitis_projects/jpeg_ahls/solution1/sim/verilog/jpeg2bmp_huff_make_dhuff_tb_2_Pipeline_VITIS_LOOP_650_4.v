// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sext_ln650,
        code,
        huffcode_address0,
        huffcode_ce0,
        huffcode_we0,
        huffcode_d0,
        huffsize_address0,
        huffsize_ce0,
        huffsize_q0,
        size_2,
        code_2_out,
        code_2_out_ap_vld,
        add_ln651_out,
        add_ln651_out_ap_vld,
        huffsize_load_out,
        huffsize_load_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] sext_ln650;
input  [31:0] code;
output  [8:0] huffcode_address0;
output   huffcode_ce0;
output   huffcode_we0;
output  [31:0] huffcode_d0;
output  [8:0] huffsize_address0;
output   huffsize_ce0;
input  [4:0] huffsize_q0;
input  [4:0] size_2;
output  [30:0] code_2_out;
output   code_2_out_ap_vld;
output  [31:0] add_ln651_out;
output   add_ln651_out_ap_vld;
output  [4:0] huffsize_load_out;
output   huffsize_load_out_ap_vld;

reg ap_idle;
reg huffcode_ce0;
reg huffcode_we0;
reg huffsize_ce0;
reg code_2_out_ap_vld;
reg add_ln651_out_ap_vld;
reg huffsize_load_out_ap_vld;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] and_ln652_fu_192_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [30:0] trunc_ln628_fu_152_p1;
reg   [30:0] trunc_ln628_reg_216;
wire   [31:0] trunc_ln651_fu_162_p1;
reg   [31:0] trunc_ln651_reg_221;
wire   [0:0] icmp_ln652_1_fu_171_p2;
reg   [0:0] icmp_ln652_1_reg_231;
wire   [63:0] zext_ln628_fu_141_p1;
wire   [63:0] zext_ln651_fu_166_p1;
reg   [31:0] code_1_fu_46;
wire   [31:0] code_4_fu_146_p2;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_code_3;
reg   [33:0] p_2_fu_50;
wire  signed [33:0] sext_ln650_cast_fu_120_p1;
wire   [33:0] add_ln651_fu_156_p2;
reg   [33:0] ap_sig_allocacmp_p;
wire   [0:0] icmp_ln652_fu_187_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 code_1_fu_46 = 32'd0;
#0 p_2_fu_50 = 34'd0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        code_1_fu_46 <= code_4_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
    p_2_fu_50 <= add_ln651_fu_156_p2;
end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        icmp_ln652_1_reg_231 <= icmp_ln652_1_fu_171_p2;
        trunc_ln628_reg_216 <= trunc_ln628_fu_152_p1;
        trunc_ln651_reg_221 <= trunc_ln651_fu_162_p1;
    end
end

always @ (*) begin
    if (((1'd0 == and_ln652_fu_192_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        add_ln651_out_ap_vld = 1'b1;
    end else begin
        add_ln651_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1_pp0_stage0_iter0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if (((1'd0 == and_ln652_fu_192_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_code_3 = code;
    end else begin
        ap_sig_allocacmp_code_3 = code_1_fu_46;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_p = sext_ln650_cast_fu_120_p1;
    end else begin
        ap_sig_allocacmp_p = p_2_fu_50;
    end
end

always @ (*) begin
    if (((1'd0 == and_ln652_fu_192_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        code_2_out_ap_vld = 1'b1;
    end else begin
        code_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        huffcode_ce0 = 1'b1;
    end else begin
        huffcode_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        huffcode_we0 = 1'b1;
    end else begin
        huffcode_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        huffsize_ce0 = 1'b1;
    end else begin
        huffsize_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'd0 == and_ln652_fu_192_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        huffsize_load_out_ap_vld = 1'b1;
    end else begin
        huffsize_load_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln651_fu_156_p2 = (ap_sig_allocacmp_p + 34'd1);

assign add_ln651_out = trunc_ln651_reg_221;

assign and_ln652_fu_192_p2 = (icmp_ln652_fu_187_p2 & icmp_ln652_1_reg_231);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign code_2_out = trunc_ln628_reg_216;

assign code_4_fu_146_p2 = (ap_sig_allocacmp_code_3 + 32'd1);

assign huffcode_address0 = zext_ln628_fu_141_p1;

assign huffcode_d0 = ap_sig_allocacmp_code_3;

assign huffsize_address0 = zext_ln651_fu_166_p1;

assign huffsize_load_out = huffsize_q0;

assign icmp_ln652_1_fu_171_p2 = (($signed(add_ln651_fu_156_p2) < $signed(34'd257)) ? 1'b1 : 1'b0);

assign icmp_ln652_fu_187_p2 = ((huffsize_q0 == size_2) ? 1'b1 : 1'b0);

assign sext_ln650_cast_fu_120_p1 = $signed(sext_ln650);

assign trunc_ln628_fu_152_p1 = code_4_fu_146_p2[30:0];

assign trunc_ln651_fu_162_p1 = add_ln651_fu_156_p2[31:0];

assign zext_ln628_fu_141_p1 = ap_sig_allocacmp_p;

assign zext_ln651_fu_166_p1 = add_ln651_fu_156_p2;

endmodule //jpeg2bmp_huff_make_dhuff_tb_2_Pipeline_VITIS_LOOP_650_4