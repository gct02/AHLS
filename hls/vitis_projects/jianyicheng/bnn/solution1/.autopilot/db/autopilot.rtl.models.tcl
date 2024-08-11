set SynModuleInfo {
  {SRCNAME bnn_Pipeline_VITIS_LOOP_15_1 MODELNAME bnn_Pipeline_VITIS_LOOP_15_1 RTLNAME bnn_bnn_Pipeline_VITIS_LOOP_15_1
    SUBMODULES {
      {MODELNAME bnn_mul_32s_32s_32_2_1 RTLNAME bnn_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME bnn_flow_control_loop_pipe_sequential_init RTLNAME bnn_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME bnn_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME bnn_Pipeline_VITIS_LOOP_15_11 MODELNAME bnn_Pipeline_VITIS_LOOP_15_11 RTLNAME bnn_bnn_Pipeline_VITIS_LOOP_15_11}
  {SRCNAME bnn MODELNAME bnn RTLNAME bnn IS_TOP 1}
}
