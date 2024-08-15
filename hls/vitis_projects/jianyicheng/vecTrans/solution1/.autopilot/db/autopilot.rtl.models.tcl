set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_18_1 MODELNAME main_Pipeline_VITIS_LOOP_18_1 RTLNAME main_main_Pipeline_VITIS_LOOP_18_1
    SUBMODULES {
      {MODELNAME main_urem_10ns_7ns_6_14_1 RTLNAME main_urem_10ns_7ns_6_14_1 BINDTYPE op TYPE urem IMPL auto LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_4_1 MODELNAME main_Pipeline_VITIS_LOOP_4_1 RTLNAME main_main_Pipeline_VITIS_LOOP_4_1
    SUBMODULES {
      {MODELNAME main_mul_32s_32s_32_5_1 RTLNAME main_mul_32s_32s_32_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_A_RAM_AUTO_1R1W RTLNAME main_A_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_b_RAM_AUTO_1R1W RTLNAME main_b_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
