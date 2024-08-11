set SynModuleInfo {
  {SRCNAME smm_Pipeline_VITIS_LOOP_15_1 MODELNAME smm_Pipeline_VITIS_LOOP_15_1 RTLNAME smm_smm_Pipeline_VITIS_LOOP_15_1
    SUBMODULES {
      {MODELNAME smm_mul_32s_32s_32_2_1 RTLNAME smm_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME smm_flow_control_loop_pipe_sequential_init RTLNAME smm_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME smm_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME smm MODELNAME smm RTLNAME smm IS_TOP 1}
}
