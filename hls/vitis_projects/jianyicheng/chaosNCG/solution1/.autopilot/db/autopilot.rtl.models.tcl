set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_18_1 MODELNAME main_Pipeline_VITIS_LOOP_18_1 RTLNAME main_main_Pipeline_VITIS_LOOP_18_1
    SUBMODULES {
      {MODELNAME main_urem_16ns_12ns_11_20_1 RTLNAME main_urem_16ns_12ns_11_20_1 BINDTYPE op TYPE urem IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME main_urem_16ns_12ns_16_20_1 RTLNAME main_urem_16ns_12ns_16_20_1 BINDTYPE op TYPE urem IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_7_1 MODELNAME main_Pipeline_VITIS_LOOP_7_1 RTLNAME main_main_Pipeline_VITIS_LOOP_7_1
    SUBMODULES {
      {MODELNAME main_srem_32ns_6ns_32_36_1 RTLNAME main_srem_32ns_6ns_32_36_1 BINDTYPE op TYPE srem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_M_RAM_AUTO_1R1W RTLNAME main_M_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_buffer_RAM_AUTO_1R1W RTLNAME main_buffer_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
