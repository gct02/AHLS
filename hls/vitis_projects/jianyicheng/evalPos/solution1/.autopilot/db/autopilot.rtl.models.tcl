set SynModuleInfo {
  {SRCNAME evalPos_Pipeline_VITIS_LOOP_12_1 MODELNAME evalPos_Pipeline_VITIS_LOOP_12_1 RTLNAME evalPos_evalPos_Pipeline_VITIS_LOOP_12_1
    SUBMODULES {
      {MODELNAME evalPos_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME evalPos_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME evalPos_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME evalPos_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME evalPos_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME evalPos_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME evalPos_urem_6ns_4ns_6_10_1 RTLNAME evalPos_urem_6ns_4ns_6_10_1 BINDTYPE op TYPE urem IMPL auto LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME evalPos_mul_6ns_8ns_13_1_1 RTLNAME evalPos_mul_6ns_8ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME evalPos_flow_control_loop_pipe_sequential_init RTLNAME evalPos_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME evalPos_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME evalPos MODELNAME evalPos RTLNAME evalPos IS_TOP 1
    SUBMODULES {
      {MODELNAME evalPos_sitofp_32ns_32_4_no_dsp_1 RTLNAME evalPos_sitofp_32ns_32_4_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
