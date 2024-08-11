set SynModuleInfo {
  {SRCNAME gemver_Pipeline_VITIS_LOOP_14_1_loop_2 MODELNAME gemver_Pipeline_VITIS_LOOP_14_1_loop_2 RTLNAME gemver_gemver_Pipeline_VITIS_LOOP_14_1_loop_2
    SUBMODULES {
      {MODELNAME gemver_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME gemver_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gemver_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME gemver_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME gemver_flow_control_loop_pipe_sequential_init RTLNAME gemver_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME gemver_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME gemver_Pipeline_VITIS_LOOP_23_2_loop_3 MODELNAME gemver_Pipeline_VITIS_LOOP_23_2_loop_3 RTLNAME gemver_gemver_Pipeline_VITIS_LOOP_23_2_loop_3}
  {SRCNAME gemver_Pipeline_VITIS_LOOP_35_3_loop_4 MODELNAME gemver_Pipeline_VITIS_LOOP_35_3_loop_4 RTLNAME gemver_gemver_Pipeline_VITIS_LOOP_35_3_loop_4}
  {SRCNAME gemver MODELNAME gemver RTLNAME gemver IS_TOP 1}
}
