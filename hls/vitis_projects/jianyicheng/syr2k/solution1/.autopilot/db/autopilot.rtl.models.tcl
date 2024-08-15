set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2 MODELNAME main_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2 RTLNAME main_main_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_47_4 MODELNAME main_Pipeline_VITIS_LOOP_47_4 RTLNAME main_main_Pipeline_VITIS_LOOP_47_4}
  {SRCNAME main_Pipeline_VITIS_LOOP_13_2 MODELNAME main_Pipeline_VITIS_LOOP_13_2 RTLNAME main_main_Pipeline_VITIS_LOOP_13_2}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_fadd_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fadd_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_C_RAM_AUTO_1R1W RTLNAME main_C_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_A_RAM_1WNR_AUTO_1R1W RTLNAME main_A_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
