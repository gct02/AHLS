set SynModuleInfo {
  {SRCNAME histogram MODELNAME histogram RTLNAME histogram IS_TOP 1
    SUBMODULES {
      {MODELNAME histogram_dadd_64ns_64ns_64_5_full_dsp_1 RTLNAME histogram_dadd_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME histogram_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME histogram_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME histogram_flow_control_loop_pipe RTLNAME histogram_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME histogram_flow_control_loop_pipe_U}
    }
  }
}
