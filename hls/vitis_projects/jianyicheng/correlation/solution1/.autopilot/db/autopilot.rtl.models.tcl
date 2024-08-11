set SynModuleInfo {
  {SRCNAME correlation_Pipeline_loop_0 MODELNAME correlation_Pipeline_loop_0 RTLNAME correlation_correlation_Pipeline_loop_0
    SUBMODULES {
      {MODELNAME correlation_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME correlation_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME correlation_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME correlation_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME correlation_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME correlation_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME correlation_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME correlation_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME correlation_flow_control_loop_pipe_sequential_init RTLNAME correlation_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME correlation_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME correlation_Pipeline_VITIS_LOOP_41_1_loop_3 MODELNAME correlation_Pipeline_VITIS_LOOP_41_1_loop_3 RTLNAME correlation_correlation_Pipeline_VITIS_LOOP_41_1_loop_3}
  {SRCNAME correlation_Pipeline_VITIS_LOOP_57_3 MODELNAME correlation_Pipeline_VITIS_LOOP_57_3 RTLNAME correlation_correlation_Pipeline_VITIS_LOOP_57_3}
  {SRCNAME correlation MODELNAME correlation RTLNAME correlation IS_TOP 1
    SUBMODULES {
      {MODELNAME correlation_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME correlation_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME correlation_fdiv_32ns_32ns_32_10_no_dsp_1 RTLNAME correlation_fdiv_32ns_32ns_32_10_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 9 ALLOW_PRAGMA 1}
    }
  }
}
