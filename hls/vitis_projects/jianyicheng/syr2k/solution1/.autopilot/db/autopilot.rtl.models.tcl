set SynModuleInfo {
  {SRCNAME syr2k_Pipeline_VITIS_LOOP_13_2 MODELNAME syr2k_Pipeline_VITIS_LOOP_13_2 RTLNAME syr2k_syr2k_Pipeline_VITIS_LOOP_13_2
    SUBMODULES {
      {MODELNAME syr2k_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME syr2k_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME syr2k_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME syr2k_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME syr2k_flow_control_loop_pipe_sequential_init RTLNAME syr2k_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME syr2k_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME syr2k MODELNAME syr2k RTLNAME syr2k IS_TOP 1}
}
