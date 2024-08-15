set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_17_1 MODELNAME main_Pipeline_VITIS_LOOP_17_1 RTLNAME main_main_Pipeline_VITIS_LOOP_17_1
    SUBMODULES {
      {MODELNAME main_am_addmul_7ns_7ns_9ns_17_4_1 RTLNAME main_am_addmul_7ns_7ns_9ns_17_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_15_1_VITIS_LOOP_14_1 MODELNAME main_Pipeline_VITIS_LOOP_15_1_VITIS_LOOP_14_1 RTLNAME main_main_Pipeline_VITIS_LOOP_15_1_VITIS_LOOP_14_1
    SUBMODULES {
      {MODELNAME main_mul_7ns_9ns_15_3_1 RTLNAME main_mul_7ns_9ns_15_3_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_urem_7ns_3ns_2_11_1 RTLNAME main_urem_7ns_3ns_2_11_1 BINDTYPE op TYPE urem IMPL auto LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME main_sparsemux_7_2_32_1_1 RTLNAME main_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME main_mul_4ns_32s_32_5_1 RTLNAME main_mul_4ns_32s_32_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME main_mac_muladd_7ns_7ns_7ns_14_4_1 RTLNAME main_mac_muladd_7ns_7ns_7ns_14_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_32_4 MODELNAME main_Pipeline_VITIS_LOOP_32_4 RTLNAME main_main_Pipeline_VITIS_LOOP_32_4
    SUBMODULES {
      {MODELNAME main_main_Pipeline_VITIS_LOOP_32_4_data1_RAM_AUTO_1R1W RTLNAME main_main_Pipeline_VITIS_LOOP_32_4_data1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_w_ROM_AUTO_1R RTLNAME main_w_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_data_RAM_AUTO_1R1W RTLNAME main_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_az_RAM_AUTO_1R1W RTLNAME main_az_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
