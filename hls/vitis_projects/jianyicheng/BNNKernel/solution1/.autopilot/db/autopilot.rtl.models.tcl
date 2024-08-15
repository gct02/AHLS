set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_16_1 MODELNAME main_Pipeline_VITIS_LOOP_16_1 RTLNAME main_main_Pipeline_VITIS_LOOP_16_1
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_14_1 MODELNAME main_Pipeline_VITIS_LOOP_14_1 RTLNAME main_main_Pipeline_VITIS_LOOP_14_1}
  {SRCNAME main_Pipeline_VITIS_LOOP_14_11 MODELNAME main_Pipeline_VITIS_LOOP_14_11 RTLNAME main_main_Pipeline_VITIS_LOOP_14_11}
  {SRCNAME main_Pipeline_VITIS_LOOP_16_2 MODELNAME main_Pipeline_VITIS_LOOP_16_2 RTLNAME main_main_Pipeline_VITIS_LOOP_16_2}
  {SRCNAME main_Pipeline_VITIS_LOOP_23_3 MODELNAME main_Pipeline_VITIS_LOOP_23_3 RTLNAME main_main_Pipeline_VITIS_LOOP_23_3}
  {SRCNAME main_Pipeline_VITIS_LOOP_32_2 MODELNAME main_Pipeline_VITIS_LOOP_32_2 RTLNAME main_main_Pipeline_VITIS_LOOP_32_2}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_addr_in_RAM_AUTO_1R1W RTLNAME main_addr_in_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_w_RAM_AUTO_1R1W RTLNAME main_w_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_data_RAM_AUTO_1R1W RTLNAME main_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_gold_RAM_AUTO_1R1W RTLNAME main_gold_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
