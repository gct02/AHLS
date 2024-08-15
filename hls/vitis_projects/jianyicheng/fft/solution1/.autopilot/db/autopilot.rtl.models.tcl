set SynModuleInfo {
  {SRCNAME _rand MODELNAME p_rand RTLNAME main_p_rand}
  {SRCNAME fft_Pipeline_VITIS_LOOP_41_2 MODELNAME fft_Pipeline_VITIS_LOOP_41_2 RTLNAME main_fft_Pipeline_VITIS_LOOP_41_2
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_Pipeline_VITIS_LOOP_60_4 MODELNAME fft_Pipeline_VITIS_LOOP_60_4 RTLNAME main_fft_Pipeline_VITIS_LOOP_60_4}
  {SRCNAME fft_Pipeline_VITIS_LOOP_79_6 MODELNAME fft_Pipeline_VITIS_LOOP_79_6 RTLNAME main_fft_Pipeline_VITIS_LOOP_79_6}
  {SRCNAME fft_Pipeline_VITIS_LOOP_98_8 MODELNAME fft_Pipeline_VITIS_LOOP_98_8 RTLNAME main_fft_Pipeline_VITIS_LOOP_98_8}
  {SRCNAME fft_Pipeline_VITIS_LOOP_117_10 MODELNAME fft_Pipeline_VITIS_LOOP_117_10 RTLNAME main_fft_Pipeline_VITIS_LOOP_117_10}
  {SRCNAME fft_Pipeline_VITIS_LOOP_136_12 MODELNAME fft_Pipeline_VITIS_LOOP_136_12 RTLNAME main_fft_Pipeline_VITIS_LOOP_136_12}
  {SRCNAME fft_Pipeline_VITIS_LOOP_155_14 MODELNAME fft_Pipeline_VITIS_LOOP_155_14 RTLNAME main_fft_Pipeline_VITIS_LOOP_155_14}
  {SRCNAME fft_Pipeline_VITIS_LOOP_174_16 MODELNAME fft_Pipeline_VITIS_LOOP_174_16 RTLNAME main_fft_Pipeline_VITIS_LOOP_174_16}
  {SRCNAME fft MODELNAME fft RTLNAME main_fft
    SUBMODULES {
      {MODELNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME main_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_fft_cos_coefficients_table_ROM_AUTO_1R RTLNAME main_fft_cos_coefficients_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_fft_sin_coefficients_table_ROM_AUTO_1R RTLNAME main_fft_sin_coefficients_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_uitofp_32ns_32_7_no_dsp_1 RTLNAME main_uitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME main_X_R_0_RAM_AUTO_1R1W RTLNAME main_X_R_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
