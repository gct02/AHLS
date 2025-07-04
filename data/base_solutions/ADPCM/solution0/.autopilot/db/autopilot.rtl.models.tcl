set SynModuleInfo {
  {SRCNAME reset MODELNAME reset RTLNAME adpcm_main_reset}
  {SRCNAME filtez MODELNAME filtez RTLNAME adpcm_main_filtez
    SUBMODULES {
      {MODELNAME adpcm_main_mul_16s_32s_48_1_1 RTLNAME adpcm_main_mul_16s_32s_48_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME quantl MODELNAME quantl RTLNAME adpcm_main_quantl
    SUBMODULES {
      {MODELNAME adpcm_main_mul_15ns_15ns_30_1_1 RTLNAME adpcm_main_mul_15ns_15ns_30_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_quantl_decis_levl_ROM_AUTO_1R RTLNAME adpcm_main_quantl_decis_levl_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_quantl_quant26bt_pos_ROM_AUTO_1R RTLNAME adpcm_main_quantl_quant26bt_pos_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_quantl_quant26bt_neg_ROM_AUTO_1R RTLNAME adpcm_main_quantl_quant26bt_neg_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME upzero MODELNAME upzero RTLNAME adpcm_main_upzero
    SUBMODULES {
      {MODELNAME adpcm_main_mul_16s_16s_32_1_1 RTLNAME adpcm_main_mul_16s_16s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME encode MODELNAME encode RTLNAME adpcm_main_encode
    SUBMODULES {
      {MODELNAME adpcm_main_mul_15s_32s_47_1_1 RTLNAME adpcm_main_mul_15s_32s_47_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_32s_47_1_1 RTLNAME adpcm_main_mul_16s_32s_47_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_32s_64_1_1 RTLNAME adpcm_main_mul_32s_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_7s_39_1_1 RTLNAME adpcm_main_mul_32s_7s_39_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_11ns_25_1_1 RTLNAME adpcm_main_mul_15ns_11ns_25_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_15ns_31_1_1 RTLNAME adpcm_main_mul_16s_15ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mux_4_2_14_1_1 RTLNAME adpcm_main_mux_4_2_14_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_14s_15ns_29_1_1 RTLNAME adpcm_main_mul_14s_15ns_29_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mux_4_2_11_1_1 RTLNAME adpcm_main_mux_4_2_11_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME decode MODELNAME decode RTLNAME adpcm_main_decode
    SUBMODULES {
      {MODELNAME adpcm_main_decode_qq6_code6_table_ROM_AUTO_1R RTLNAME adpcm_main_decode_qq6_code6_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME adpcm_main MODELNAME adpcm_main RTLNAME adpcm_main IS_TOP 1
    SUBMODULES {
      {MODELNAME adpcm_main_delay_dltx_RAM_AUTO_1R1W RTLNAME adpcm_main_delay_dltx_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_delay_bpl_RAM_AUTO_1R1W RTLNAME adpcm_main_delay_bpl_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_tqmf_RAM_AUTO_1R1W RTLNAME adpcm_main_tqmf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_accumc_RAM_AUTO_1R1W RTLNAME adpcm_main_accumc_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_h_ROM_AUTO_1R RTLNAME adpcm_main_h_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_qq4_code4_table_ROM_AUTO_1R RTLNAME adpcm_main_qq4_code4_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_wl_code_table_ROM_AUTO_1R RTLNAME adpcm_main_wl_code_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_ilb_table_ROM_AUTO_1R RTLNAME adpcm_main_ilb_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
