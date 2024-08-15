set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2 MODELNAME main_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2 RTLNAME main_main_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_46_2
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_55_3 MODELNAME main_Pipeline_VITIS_LOOP_55_3 RTLNAME main_main_Pipeline_VITIS_LOOP_55_3}
  {SRCNAME main_Pipeline_VITIS_LOOP_65_7 MODELNAME main_Pipeline_VITIS_LOOP_65_7 RTLNAME main_main_Pipeline_VITIS_LOOP_65_7}
  {SRCNAME main_Pipeline_VITIS_LOOP_12_1 MODELNAME main_Pipeline_VITIS_LOOP_12_1 RTLNAME main_main_Pipeline_VITIS_LOOP_12_1}
  {SRCNAME main_Pipeline_VITIS_LOOP_26_3 MODELNAME main_Pipeline_VITIS_LOOP_26_3 RTLNAME main_main_Pipeline_VITIS_LOOP_26_3}
  {SRCNAME main_Pipeline_VITIS_LOOP_78_9_VITIS_LOOP_79_10 MODELNAME main_Pipeline_VITIS_LOOP_78_9_VITIS_LOOP_79_10 RTLNAME main_main_Pipeline_VITIS_LOOP_78_9_VITIS_LOOP_79_10
    SUBMODULES {
      {MODELNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 RTLNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME main_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_data_RAM_AUTO_1R1W RTLNAME main_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_cov_RAM_AUTO_1R1W RTLNAME main_cov_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
