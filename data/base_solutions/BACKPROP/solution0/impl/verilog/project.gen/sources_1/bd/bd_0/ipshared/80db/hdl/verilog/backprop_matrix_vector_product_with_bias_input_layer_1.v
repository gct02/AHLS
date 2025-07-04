// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module backprop_matrix_vector_product_with_bias_input_layer_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        biases1_address0,
        biases1_ce0,
        biases1_q0,
        weights1_address0,
        weights1_ce0,
        weights1_q0,
        activations_address0,
        activations_ce0,
        activations_we0,
        activations_d0,
        activations_address1,
        activations_ce1,
        activations_q1,
        training_data_address0,
        training_data_ce0,
        training_data_q0,
        idx,
        grp_fu_986_p_din0,
        grp_fu_986_p_din1,
        grp_fu_986_p_opcode,
        grp_fu_986_p_dout0,
        grp_fu_986_p_ce,
        grp_fu_990_p_din0,
        grp_fu_990_p_din1,
        grp_fu_990_p_dout0,
        grp_fu_990_p_ce
);

parameter    ap_ST_fsm_state1 = 13'd1;
parameter    ap_ST_fsm_state2 = 13'd2;
parameter    ap_ST_fsm_state3 = 13'd4;
parameter    ap_ST_fsm_state4 = 13'd8;
parameter    ap_ST_fsm_state5 = 13'd16;
parameter    ap_ST_fsm_state6 = 13'd32;
parameter    ap_ST_fsm_state7 = 13'd64;
parameter    ap_ST_fsm_state8 = 13'd128;
parameter    ap_ST_fsm_state9 = 13'd256;
parameter    ap_ST_fsm_state10 = 13'd512;
parameter    ap_ST_fsm_state11 = 13'd1024;
parameter    ap_ST_fsm_state12 = 13'd2048;
parameter    ap_ST_fsm_state13 = 13'd4096;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [5:0] biases1_address0;
output   biases1_ce0;
input  [63:0] biases1_q0;
output  [9:0] weights1_address0;
output   weights1_ce0;
input  [63:0] weights1_q0;
output  [5:0] activations_address0;
output   activations_ce0;
output   activations_we0;
output  [63:0] activations_d0;
output  [5:0] activations_address1;
output   activations_ce1;
input  [63:0] activations_q1;
output  [11:0] training_data_address0;
output   training_data_ce0;
input  [63:0] training_data_q0;
input  [11:0] idx;
output  [63:0] grp_fu_986_p_din0;
output  [63:0] grp_fu_986_p_din1;
output  [0:0] grp_fu_986_p_opcode;
input  [63:0] grp_fu_986_p_dout0;
output   grp_fu_986_p_ce;
output  [63:0] grp_fu_990_p_din0;
output  [63:0] grp_fu_990_p_din1;
input  [63:0] grp_fu_990_p_dout0;
output   grp_fu_990_p_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg weights1_ce0;
reg[5:0] activations_address0;
reg activations_ce0;
reg activations_we0;
reg[63:0] activations_d0;
reg activations_ce1;
reg training_data_ce0;

(* fsm_encoding = "none" *) reg   [12:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [9:0] add_ln60_1_fu_167_p2;
reg   [9:0] add_ln60_1_reg_268;
wire    ap_CS_fsm_state2;
wire   [6:0] add_ln60_fu_179_p2;
reg   [6:0] add_ln60_reg_276;
reg   [5:0] activations_addr_reg_281;
wire   [3:0] add_ln64_fu_196_p2;
reg   [3:0] add_ln64_reg_289;
wire    ap_CS_fsm_state3;
wire   [9:0] add_ln66_fu_210_p2;
reg   [9:0] add_ln66_reg_294;
wire    ap_CS_fsm_state4;
reg   [63:0] training_data_load_reg_309;
wire   [63:0] bitcast_ln66_fu_237_p1;
wire   [63:0] bitcast_ln66_1_fu_242_p1;
reg   [63:0] mul8_reg_324;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state12;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_idle;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_ready;
wire   [5:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address0;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce0;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_we0;
wire   [63:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_d0;
wire   [5:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address1;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce1;
wire   [5:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_address0;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_ce0;
wire   [63:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din0;
wire   [63:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din1;
wire   [0:0] grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_opcode;
wire    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_ce;
reg   [3:0] i_14_reg_110;
wire   [0:0] icmp_ln60_fu_173_p2;
reg   [63:0] add113_reg_121;
reg    grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg;
wire    ap_CS_fsm_state13;
wire   [63:0] zext_ln60_fu_185_p1;
wire   [63:0] zext_ln66_1_fu_220_p1;
wire   [0:0] icmp_ln64_fu_190_p2;
wire   [63:0] zext_ln66_fu_233_p1;
reg   [9:0] phi_mul_fu_58;
reg   [6:0] j_fu_62;
reg   [63:0] grp_fu_142_p0;
reg   [63:0] grp_fu_142_p1;
wire    ap_CS_fsm_state9;
wire   [9:0] zext_ln64_1_fu_206_p1;
wire   [11:0] zext_ln64_fu_202_p1;
wire   [11:0] add_ln66_1_fu_215_p2;
reg   [1:0] grp_fu_142_opcode;
reg    grp_fu_142_ce;
reg   [12:0] ap_NS_fsm;
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
reg    ap_ST_fsm_state13_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 13'd1;
#0 grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg = 1'b0;
#0 phi_mul_fu_58 = 10'd0;
#0 j_fu_62 = 7'd0;
end

backprop_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start),
    .ap_done(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done),
    .ap_idle(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_idle),
    .ap_ready(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_ready),
    .activations_address0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address0),
    .activations_ce0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce0),
    .activations_we0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_we0),
    .activations_d0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_d0),
    .activations_address1(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address1),
    .activations_ce1(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce1),
    .activations_q1(activations_q1),
    .biases1_address0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_address0),
    .biases1_ce0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_ce0),
    .biases1_q0(biases1_q0),
    .grp_fu_142_p_din0(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din0),
    .grp_fu_142_p_din1(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din1),
    .grp_fu_142_p_opcode(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_opcode),
    .grp_fu_142_p_dout0(grp_fu_986_p_dout0),
    .grp_fu_142_p_ce(grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_ce)
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
        grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln60_fu_173_p2 == 1'd1))) begin
            grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg <= 1'b1;
        end else if ((grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_ready == 1'b1)) begin
            grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln60_fu_173_p2 == 1'd0))) begin
        add113_reg_121 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        add113_reg_121 <= grp_fu_986_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln60_fu_173_p2 == 1'd0))) begin
        i_14_reg_110 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        i_14_reg_110 <= add_ln64_reg_289;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_fu_62 <= 7'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln64_fu_190_p2 == 1'd1))) begin
        j_fu_62 <= add_ln60_reg_276;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        phi_mul_fu_58 <= 10'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln64_fu_190_p2 == 1'd1))) begin
        phi_mul_fu_58 <= add_ln60_1_reg_268;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        activations_addr_reg_281 <= zext_ln60_fu_185_p1;
        add_ln60_1_reg_268 <= add_ln60_1_fu_167_p2;
        add_ln60_reg_276 <= add_ln60_fu_179_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln64_reg_289 <= add_ln64_fu_196_p2;
        add_ln66_reg_294 <= add_ln66_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        mul8_reg_324 <= grp_fu_990_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        training_data_load_reg_309 <= training_data_q0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        activations_address0 = activations_addr_reg_281;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        activations_address0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address0;
    end else begin
        activations_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        activations_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        activations_ce0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce0;
    end else begin
        activations_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        activations_ce1 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_ce1;
    end else begin
        activations_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        activations_d0 = add113_reg_121;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        activations_d0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_d0;
    end else begin
        activations_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln64_fu_190_p2 == 1'd1))) begin
        activations_we0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        activations_we0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_we0;
    end else begin
        activations_we0 = 1'b0;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

always @ (*) begin
    if ((grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done == 1'b0)) begin
        ap_ST_fsm_state13_blk = 1'b1;
    end else begin
        ap_ST_fsm_state13_blk = 1'b0;
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

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state13) & (grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done == 1'b1)))) begin
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
    if (((1'b1 == ap_CS_fsm_state13) & (grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_142_ce = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_ce;
    end else begin
        grp_fu_142_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_142_opcode = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_opcode;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_142_opcode = 2'd0;
    end else begin
        grp_fu_142_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_142_p0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din0;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_142_p0 = add113_reg_121;
    end else begin
        grp_fu_142_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_142_p1 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_grp_fu_142_p_din1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_142_p1 = mul8_reg_324;
    end else begin
        grp_fu_142_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        training_data_ce0 = 1'b1;
    end else begin
        training_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        weights1_ce0 = 1'b1;
    end else begin
        weights1_ce0 = 1'b0;
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
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln60_fu_173_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln64_fu_190_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
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
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state13 : begin
            if (((1'b1 == ap_CS_fsm_state13) & (grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign activations_address1 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_activations_address1;

assign add_ln60_1_fu_167_p2 = (phi_mul_fu_58 + 10'd13);

assign add_ln60_fu_179_p2 = (j_fu_62 + 7'd1);

assign add_ln64_fu_196_p2 = (i_14_reg_110 + 4'd1);

assign add_ln66_1_fu_215_p2 = (zext_ln64_fu_202_p1 + idx);

assign add_ln66_fu_210_p2 = (zext_ln64_1_fu_206_p1 + phi_mul_fu_58);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign biases1_address0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_address0;

assign biases1_ce0 = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_biases1_ce0;

assign bitcast_ln66_1_fu_242_p1 = training_data_load_reg_309;

assign bitcast_ln66_fu_237_p1 = weights1_q0;

assign grp_fu_986_p_ce = grp_fu_142_ce;

assign grp_fu_986_p_din0 = grp_fu_142_p0;

assign grp_fu_986_p_din1 = grp_fu_142_p1;

assign grp_fu_986_p_opcode = grp_fu_142_opcode;

assign grp_fu_990_p_ce = 1'b1;

assign grp_fu_990_p_din0 = bitcast_ln66_fu_237_p1;

assign grp_fu_990_p_din1 = bitcast_ln66_1_fu_242_p1;

assign grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start = grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134_ap_start_reg;

assign icmp_ln60_fu_173_p2 = ((j_fu_62 == 7'd64) ? 1'b1 : 1'b0);

assign icmp_ln64_fu_190_p2 = ((i_14_reg_110 == 4'd13) ? 1'b1 : 1'b0);

assign training_data_address0 = zext_ln66_1_fu_220_p1;

assign weights1_address0 = zext_ln66_fu_233_p1;

assign zext_ln60_fu_185_p1 = j_fu_62;

assign zext_ln64_1_fu_206_p1 = i_14_reg_110;

assign zext_ln64_fu_202_p1 = i_14_reg_110;

assign zext_ln66_1_fu_220_p1 = add_ln66_1_fu_215_p2;

assign zext_ln66_fu_233_p1 = add_ln66_reg_294;

endmodule //backprop_matrix_vector_product_with_bias_input_layer_1
