set SynModuleInfo {
  {SRCNAME gesummv MODELNAME gesummv RTLNAME gesummv IS_TOP 1
    SUBMODULES {
      {MODELNAME gesummv_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME gesummv_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gesummv_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME gesummv_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME gesummv_flow_control_loop_pipe RTLNAME gesummv_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME gesummv_flow_control_loop_pipe_U}
    }
  }
}
