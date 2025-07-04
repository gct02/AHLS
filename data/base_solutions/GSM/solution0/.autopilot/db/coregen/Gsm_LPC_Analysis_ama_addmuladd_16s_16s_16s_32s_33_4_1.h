// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1__HH__
#define __Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1__HH__
#include "Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int din3_WIDTH,
    int dout_WIDTH>
SC_MODULE(Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_in< sc_dt::sc_lv<din3_WIDTH> >   din3;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1 Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U;

    SC_CTOR(Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1):  Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U ("Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U") {
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.clk(clk);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.rst(reset);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.ce(ce);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.in0(din0);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.in1(din1);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.in2(din2);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.in3(din3);
        Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1_DSP48_1_U.dout(dout);

    }

};

#endif //
