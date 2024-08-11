set SynModuleInfo {
  {SRCNAME trVecAccum_Pipeline_loop_1 MODELNAME trVecAccum_Pipeline_loop_1 RTLNAME trVecAccum_trVecAccum_Pipeline_loop_1
    SUBMODULES {
      {MODELNAME trVecAccum_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME trVecAccum_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME trVecAccum_flow_control_loop_pipe_sequential_init RTLNAME trVecAccum_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME trVecAccum_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME trVecAccum MODELNAME trVecAccum RTLNAME trVecAccum IS_TOP 1
    SUBMODULES {
      {MODELNAME trVecAccum_mac_muladd_9ns_9ns_3ns_16_4_1 RTLNAME trVecAccum_mac_muladd_9ns_9ns_3ns_16_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
