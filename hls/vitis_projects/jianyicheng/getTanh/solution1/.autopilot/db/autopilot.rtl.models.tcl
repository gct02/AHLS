set SynModuleInfo {
  {SRCNAME getTanh_Pipeline_VITIS_LOOP_27_1 MODELNAME getTanh_Pipeline_VITIS_LOOP_27_1 RTLNAME getTanh_getTanh_Pipeline_VITIS_LOOP_27_1
    SUBMODULES {
      {MODELNAME getTanh_mul_32s_27s_32_2_1 RTLNAME getTanh_mul_32s_27s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME getTanh_mul_32s_28s_32_2_1 RTLNAME getTanh_mul_32s_28s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME getTanh_sdiv_32ns_20s_32_36_1 RTLNAME getTanh_sdiv_32ns_20s_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME getTanh_flow_control_loop_pipe_sequential_init RTLNAME getTanh_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME getTanh_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME getTanh MODELNAME getTanh RTLNAME getTanh IS_TOP 1}
}
