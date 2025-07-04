// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module aes_main_AddRoundKey (
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

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

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

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] grp_fu_146_p2;
reg   [31:0] reg_158;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [31:0] grp_fu_152_p2;
reg   [31:0] reg_163;
wire   [5:0] mul_fu_168_p3;
reg   [5:0] mul_reg_310;
wire   [5:0] add_ln471_fu_200_p2;
reg   [5:0] add_ln471_reg_318;
wire    ap_CS_fsm_state2;
wire   [3:0] shl_ln_fu_229_p3;
reg   [3:0] shl_ln_reg_333;
reg   [4:0] statemt_addr_reg_339;
reg   [4:0] statemt_addr_49_reg_344;
reg   [4:0] statemt_addr_50_reg_359;
reg   [4:0] statemt_addr_51_reg_364;
wire   [63:0] zext_ln471_fu_205_p1;
wire   [0:0] icmp_ln469_fu_184_p2;
wire   [63:0] zext_ln472_1_fu_220_p1;
wire   [63:0] zext_ln471_1_fu_237_p1;
wire   [63:0] zext_ln472_fu_248_p1;
wire   [63:0] zext_ln473_1_fu_267_p1;
wire   [63:0] zext_ln474_1_fu_278_p1;
wire   [63:0] zext_ln473_fu_288_p1;
wire   [63:0] zext_ln474_fu_298_p1;
reg   [2:0] j_fu_54;
wire   [2:0] add_ln469_fu_190_p2;
wire    ap_CS_fsm_state5;
wire   [5:0] zext_ln469_fu_196_p1;
wire   [7:0] zext_ln471_3_fu_210_p1;
wire   [7:0] add_ln472_fu_214_p2;
wire   [1:0] trunc_ln471_fu_225_p1;
wire   [3:0] or_ln472_fu_242_p2;
wire   [8:0] zext_ln471_2_fu_258_p1;
wire   [8:0] add_ln473_fu_261_p2;
wire   [8:0] add_ln474_fu_272_p2;
wire   [3:0] or_ln473_fu_283_p2;
wire   [3:0] or_ln474_fu_293_p2;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 j_fu_54 = 3'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_fu_54 <= 3'd0;
    end else if (((icmp_ln469_fu_184_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_fu_54 <= add_ln469_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln471_reg_318 <= add_ln471_fu_200_p2;
        shl_ln_reg_333[3 : 2] <= shl_ln_fu_229_p3[3 : 2];
        statemt_addr_49_reg_344[3 : 2] <= zext_ln472_fu_248_p1[3 : 2];
        statemt_addr_reg_339[3 : 2] <= zext_ln471_1_fu_237_p1[3 : 2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        mul_reg_310[5 : 2] <= mul_fu_168_p3[5 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        reg_158 <= grp_fu_146_p2;
        reg_163 <= grp_fu_152_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        statemt_addr_50_reg_359[3 : 2] <= zext_ln473_fu_288_p1[3 : 2];
        statemt_addr_51_reg_364[3 : 2] <= zext_ln474_fu_298_p1[3 : 2];
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

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((icmp_ln469_fu_184_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
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
    if (((icmp_ln469_fu_184_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        statemt_address0 = statemt_addr_51_reg_364;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        statemt_address0 = statemt_addr_49_reg_344;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        statemt_address0 = zext_ln474_fu_298_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        statemt_address0 = zext_ln472_fu_248_p1;
    end else begin
        statemt_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        statemt_address1 = statemt_addr_50_reg_359;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        statemt_address1 = statemt_addr_reg_339;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        statemt_address1 = zext_ln473_fu_288_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        statemt_address1 = zext_ln471_1_fu_237_p1;
    end else begin
        statemt_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        statemt_ce0 = 1'b1;
    end else begin
        statemt_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        statemt_ce1 = 1'b1;
    end else begin
        statemt_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        statemt_we0 = 1'b1;
    end else begin
        statemt_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        statemt_we1 = 1'b1;
    end else begin
        statemt_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address0 = zext_ln474_1_fu_278_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address0 = zext_ln472_1_fu_220_p1;
    end else begin
        word_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        word_address1 = zext_ln473_1_fu_267_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        word_address1 = zext_ln471_fu_205_p1;
    end else begin
        word_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3))) begin
        word_ce0 = 1'b1;
    end else begin
        word_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3))) begin
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
            if (((icmp_ln469_fu_184_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
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
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln469_fu_190_p2 = (j_fu_54 + 3'd1);

assign add_ln471_fu_200_p2 = (zext_ln469_fu_196_p1 + mul_reg_310);

assign add_ln472_fu_214_p2 = (zext_ln471_3_fu_210_p1 + 8'd120);

assign add_ln473_fu_261_p2 = (zext_ln471_2_fu_258_p1 + 9'd240);

assign add_ln474_fu_272_p2 = ($signed(zext_ln471_2_fu_258_p1) + $signed(9'd360));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign grp_fu_146_p2 = (word_q1 ^ statemt_q1);

assign grp_fu_152_p2 = (word_q0 ^ statemt_q0);

assign icmp_ln469_fu_184_p2 = ((j_fu_54 == 3'd4) ? 1'b1 : 1'b0);

assign mul_fu_168_p3 = {{n}, {2'd0}};

assign or_ln472_fu_242_p2 = (shl_ln_fu_229_p3 | 4'd1);

assign or_ln473_fu_283_p2 = (shl_ln_reg_333 | 4'd2);

assign or_ln474_fu_293_p2 = (shl_ln_reg_333 | 4'd3);

assign shl_ln_fu_229_p3 = {{trunc_ln471_fu_225_p1}, {2'd0}};

assign statemt_d0 = reg_163;

assign statemt_d1 = reg_158;

assign trunc_ln471_fu_225_p1 = j_fu_54[1:0];

assign zext_ln469_fu_196_p1 = j_fu_54;

assign zext_ln471_1_fu_237_p1 = shl_ln_fu_229_p3;

assign zext_ln471_2_fu_258_p1 = add_ln471_reg_318;

assign zext_ln471_3_fu_210_p1 = add_ln471_fu_200_p2;

assign zext_ln471_fu_205_p1 = add_ln471_fu_200_p2;

assign zext_ln472_1_fu_220_p1 = add_ln472_fu_214_p2;

assign zext_ln472_fu_248_p1 = or_ln472_fu_242_p2;

assign zext_ln473_1_fu_267_p1 = add_ln473_fu_261_p2;

assign zext_ln473_fu_288_p1 = or_ln473_fu_283_p2;

assign zext_ln474_1_fu_278_p1 = add_ln474_fu_272_p2;

assign zext_ln474_fu_298_p1 = or_ln474_fu_293_p2;

always @ (posedge ap_clk) begin
    mul_reg_310[1:0] <= 2'b00;
    shl_ln_reg_333[1:0] <= 2'b00;
    statemt_addr_reg_339[1:0] <= 2'b00;
    statemt_addr_reg_339[4] <= 1'b0;
    statemt_addr_49_reg_344[1:0] <= 2'b01;
    statemt_addr_49_reg_344[4] <= 1'b0;
    statemt_addr_50_reg_359[1:0] <= 2'b10;
    statemt_addr_50_reg_359[4] <= 1'b0;
    statemt_addr_51_reg_364[1:0] <= 2'b11;
    statemt_addr_51_reg_364[4] <= 1'b0;
end

endmodule //aes_main_AddRoundKey
