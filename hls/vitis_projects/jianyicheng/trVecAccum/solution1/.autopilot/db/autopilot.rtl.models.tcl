set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_24_1 MODELNAME main_Pipeline_VITIS_LOOP_24_1 RTLNAME main_main_Pipeline_VITIS_LOOP_24_1
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_loop_1 MODELNAME main_Pipeline_loop_1 RTLNAME main_main_Pipeline_loop_1}
  {SRCNAME main_Pipeline_loop_11 MODELNAME main_Pipeline_loop_11 RTLNAME main_main_Pipeline_loop_11}
  {SRCNAME main_Pipeline_VITIS_LOOP_46_2 MODELNAME main_Pipeline_VITIS_LOOP_46_2 RTLNAME main_main_Pipeline_VITIS_LOOP_46_2
    SUBMODULES {
      {MODELNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 RTLNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_mac_muladd_9ns_9ns_3ns_16_4_1 RTLNAME main_mac_muladd_9ns_9ns_3ns_16_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_fadd_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fadd_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_array_RAM_AUTO_1R1W RTLNAME main_array_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
