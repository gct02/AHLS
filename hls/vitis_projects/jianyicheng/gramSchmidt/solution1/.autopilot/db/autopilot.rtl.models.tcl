set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_69_1_VITIS_LOOP_70_2 MODELNAME main_Pipeline_VITIS_LOOP_69_1_VITIS_LOOP_70_2 RTLNAME main_main_Pipeline_VITIS_LOOP_69_1_VITIS_LOOP_70_2
    SUBMODULES {
      {MODELNAME main_uitofp_32ns_32_7_no_dsp_1 RTLNAME main_uitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_84_4 MODELNAME main_Pipeline_VITIS_LOOP_84_4 RTLNAME main_main_Pipeline_VITIS_LOOP_84_4}
  {SRCNAME main_Pipeline_VITIS_LOOP_88_5 MODELNAME main_Pipeline_VITIS_LOOP_88_5 RTLNAME main_main_Pipeline_VITIS_LOOP_88_5}
  {SRCNAME main_Pipeline_VITIS_LOOP_90_6 MODELNAME main_Pipeline_VITIS_LOOP_90_6 RTLNAME main_main_Pipeline_VITIS_LOOP_90_6}
  {SRCNAME main_Pipeline_VITIS_LOOP_46_2 MODELNAME main_Pipeline_VITIS_LOOP_46_2 RTLNAME main_main_Pipeline_VITIS_LOOP_46_2}
  {SRCNAME main_Pipeline_VITIS_LOOP_50_3 MODELNAME main_Pipeline_VITIS_LOOP_50_3 RTLNAME main_main_Pipeline_VITIS_LOOP_50_3}
  {SRCNAME main_Pipeline_VITIS_LOOP_52_4 MODELNAME main_Pipeline_VITIS_LOOP_52_4 RTLNAME main_main_Pipeline_VITIS_LOOP_52_4}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME main_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME main_fsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_a_RAM_AUTO_1R1W RTLNAME main_a_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_q_RAM_1WNR_AUTO_1R1W RTLNAME main_q_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
