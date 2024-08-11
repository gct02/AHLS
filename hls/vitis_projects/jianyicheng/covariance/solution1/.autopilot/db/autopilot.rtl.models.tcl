set SynModuleInfo {
  {SRCNAME covariance_Pipeline_VITIS_LOOP_10_1 MODELNAME covariance_Pipeline_VITIS_LOOP_10_1 RTLNAME covariance_covariance_Pipeline_VITIS_LOOP_10_1
    SUBMODULES {
      {MODELNAME covariance_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME covariance_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME covariance_flow_control_loop_pipe_sequential_init RTLNAME covariance_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME covariance_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME covariance_Pipeline_VITIS_LOOP_24_3 MODELNAME covariance_Pipeline_VITIS_LOOP_24_3 RTLNAME covariance_covariance_Pipeline_VITIS_LOOP_24_3
    SUBMODULES {
      {MODELNAME covariance_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME covariance_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME covariance MODELNAME covariance RTLNAME covariance IS_TOP 1
    SUBMODULES {
      {MODELNAME covariance_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME covariance_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME covariance_fdiv_32ns_32ns_32_10_no_dsp_1 RTLNAME covariance_fdiv_32ns_32ns_32_10_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 9 ALLOW_PRAGMA 1}
    }
  }
}
