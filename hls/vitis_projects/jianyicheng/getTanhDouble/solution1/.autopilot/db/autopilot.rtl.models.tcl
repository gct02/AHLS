set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_31_1 MODELNAME main_Pipeline_VITIS_LOOP_31_1 RTLNAME main_main_Pipeline_VITIS_LOOP_31_1
    SUBMODULES {
      {MODELNAME main_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME main_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME main_uitodp_32ns_64_7_no_dsp_1 RTLNAME main_uitodp_32ns_64_7_no_dsp_1 BINDTYPE op TYPE uitodp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_17_1 MODELNAME main_Pipeline_VITIS_LOOP_17_1 RTLNAME main_main_Pipeline_VITIS_LOOP_17_1}
  {SRCNAME main_Pipeline_VITIS_LOOP_16_1 MODELNAME main_Pipeline_VITIS_LOOP_16_1 RTLNAME main_main_Pipeline_VITIS_LOOP_16_1}
  {SRCNAME main_Pipeline_VITIS_LOOP_43_2 MODELNAME main_Pipeline_VITIS_LOOP_43_2 RTLNAME main_main_Pipeline_VITIS_LOOP_43_2}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_dadd_64ns_64ns_64_16_full_dsp_1 RTLNAME main_dadd_64ns_64ns_64_16_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME main_dmul_64ns_64ns_64_14_full_dsp_1 RTLNAME main_dmul_64ns_64ns_64_14_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 RTLNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_A_RAM_AUTO_1R1W RTLNAME main_A_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_addr_out_RAM_AUTO_1R1W RTLNAME main_addr_out_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
