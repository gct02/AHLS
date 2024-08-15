set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_16_1 MODELNAME main_Pipeline_VITIS_LOOP_16_1 RTLNAME main_main_Pipeline_VITIS_LOOP_16_1
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_14_1 MODELNAME main_Pipeline_VITIS_LOOP_14_1 RTLNAME main_main_Pipeline_VITIS_LOOP_14_1
    SUBMODULES {
      {MODELNAME main_dadd_64ns_64ns_64_16_full_dsp_1 RTLNAME main_dadd_64ns_64ns_64_16_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 15 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_26_2 MODELNAME main_Pipeline_VITIS_LOOP_26_2 RTLNAME main_main_Pipeline_VITIS_LOOP_26_2}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 RTLNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_f_RAM_AUTO_1R1W RTLNAME main_f_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_w_RAM_AUTO_1R1W RTLNAME main_w_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
