set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_26_1 MODELNAME main_Pipeline_VITIS_LOOP_26_1 RTLNAME main_main_Pipeline_VITIS_LOOP_26_1
    SUBMODULES {
      {MODELNAME main_uitofp_32ns_32_7_no_dsp_1 RTLNAME main_uitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_31_2 MODELNAME main_Pipeline_VITIS_LOOP_31_2 RTLNAME main_main_Pipeline_VITIS_LOOP_31_2}
  {SRCNAME main_Pipeline_VITIS_LOOP_36_3 MODELNAME main_Pipeline_VITIS_LOOP_36_3 RTLNAME main_main_Pipeline_VITIS_LOOP_36_3}
  {SRCNAME levmarq_Pipeline_VITIS_LOOP_19_3 MODELNAME levmarq_Pipeline_VITIS_LOOP_19_3 RTLNAME main_levmarq_Pipeline_VITIS_LOOP_19_3}
  {SRCNAME levmarq MODELNAME levmarq RTLNAME main_levmarq
    SUBMODULES {
      {MODELNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fadd_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fadd_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_sitofp_32ns_32_7_no_dsp_1 RTLNAME main_sitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_dysq_RAM_AUTO_1R1W RTLNAME main_dysq_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_g_RAM_AUTO_1R1W RTLNAME main_g_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_h_RAM_AUTO_1R1W RTLNAME main_h_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
