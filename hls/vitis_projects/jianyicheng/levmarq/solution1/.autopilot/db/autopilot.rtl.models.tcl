set SynModuleInfo {
  {SRCNAME levmarq_Pipeline_VITIS_LOOP_19_3 MODELNAME levmarq_Pipeline_VITIS_LOOP_19_3 RTLNAME levmarq_levmarq_Pipeline_VITIS_LOOP_19_3
    SUBMODULES {
      {MODELNAME levmarq_flow_control_loop_pipe_sequential_init RTLNAME levmarq_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME levmarq_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME levmarq MODELNAME levmarq RTLNAME levmarq IS_TOP 1
    SUBMODULES {
      {MODELNAME levmarq_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME levmarq_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME levmarq_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME levmarq_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME levmarq_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME levmarq_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME levmarq_sitofp_32ns_32_4_no_dsp_1 RTLNAME levmarq_sitofp_32ns_32_4_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME levmarq_mul_7s_7s_7_1_1 RTLNAME levmarq_mul_7s_7s_7_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
}
