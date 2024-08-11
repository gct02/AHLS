set SynModuleInfo {
  {SRCNAME vecTrans3 MODELNAME vecTrans3 RTLNAME vecTrans3 IS_TOP 1
    SUBMODULES {
      {MODELNAME vecTrans3_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME vecTrans3_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME vecTrans3_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME vecTrans3_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME vecTrans3_flow_control_loop_pipe RTLNAME vecTrans3_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME vecTrans3_flow_control_loop_pipe_U}
    }
  }
}
