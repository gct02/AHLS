set SynModuleInfo {
  {SRCNAME sin_or_cos<double> MODELNAME sin_or_cos_double_s RTLNAME fft1D_512_sin_or_cos_double_s
    SUBMODULES {
      {MODELNAME fft1D_512_mul_35ns_25ns_60_1_1 RTLNAME fft1D_512_mul_35ns_25ns_60_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_42ns_33ns_75_1_1 RTLNAME fft1D_512_mul_42ns_33ns_75_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_49ns_44s_93_1_1 RTLNAME fft1D_512_mul_49ns_44s_93_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_49ns_49ns_98_1_1 RTLNAME fft1D_512_mul_49ns_49ns_98_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_56ns_52s_108_1_1 RTLNAME fft1D_512_mul_56ns_52s_108_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_64s_63ns_126_1_1 RTLNAME fft1D_512_mul_64s_63ns_126_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_mul_170s_53ns_170_2_1 RTLNAME fft1D_512_mul_170s_53ns_170_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sparsemux_17_3_1_1_1 RTLNAME fft1D_512_sparsemux_17_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME fft1D_512_sparsemux_33_4_1_1_1 RTLNAME fft1D_512_sparsemux_33_4_1_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME fft1D_512_sin_or_cos_double_s_ref_4oPi_table_256_ROM_AUTO_1R RTLNAME fft1D_512_sin_or_cos_double_s_ref_4oPi_table_256_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_ROM_1P_LUTRAM_1R RTLNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_ROM_1P_LUTRAM_1R RTLNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_ROM_1P_LUTRAM_1R RTLNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_ROM_1P_LUTRAM_1R RTLNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_ROM_1P_LUTRAM_1R RTLNAME fft1D_512_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fft1D_512_Pipeline_twiddles MODELNAME fft1D_512_Pipeline_twiddles RTLNAME fft1D_512_fft1D_512_Pipeline_twiddles
    SUBMODULES {
      {MODELNAME fft1D_512_flow_control_loop_pipe_sequential_init RTLNAME fft1D_512_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft1D_512_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft1D_512_Pipeline_twiddles1 MODELNAME fft1D_512_Pipeline_twiddles1 RTLNAME fft1D_512_fft1D_512_Pipeline_twiddles1}
  {SRCNAME fft1D_512 MODELNAME fft1D_512 RTLNAME fft1D_512 IS_TOP 1
    SUBMODULES {
      {MODELNAME fft1D_512_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME fft1D_512_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_dsub_64ns_64ns_64_4_full_dsp_1 RTLNAME fft1D_512_dsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME fft1D_512_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_sitodp_32ns_64_2_no_dsp_1 RTLNAME fft1D_512_sitodp_32ns_64_2_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_twiddles8_reversed8_ROM_AUTO_1R RTLNAME fft1D_512_twiddles8_reversed8_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_DATA_x_RAM_AUTO_1R1W RTLNAME fft1D_512_DATA_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_data_x_RAM_AUTO_1R1W_x RTLNAME fft1D_512_data_x_RAM_AUTO_1R1W_x BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft1D_512_smem_RAM_AUTO_1R1W RTLNAME fft1D_512_smem_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
