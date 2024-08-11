set SynModuleInfo {
  {SRCNAME gSumIf MODELNAME gSumIf RTLNAME gSumIf IS_TOP 1
    SUBMODULES {
      {MODELNAME gSumIf_dadd_64ns_64ns_64_5_full_dsp_1 RTLNAME gSumIf_dadd_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gSumIf_dmul_64ns_64ns_64_6_max_dsp_1 RTLNAME gSumIf_dmul_64ns_64ns_64_6_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME gSumIf_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME gSumIf_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME gSumIf_flow_control_loop_pipe RTLNAME gSumIf_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME gSumIf_flow_control_loop_pipe_U}
    }
  }
}
