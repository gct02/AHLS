set SynModuleInfo {
  {SRCNAME adpcm_main_Pipeline_reset_label4 MODELNAME adpcm_main_Pipeline_reset_label4 RTLNAME adpcm_main_adpcm_main_Pipeline_reset_label4
    SUBMODULES {
      {MODELNAME adpcm_main_flow_control_loop_pipe_sequential_init RTLNAME adpcm_main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME adpcm_main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME adpcm_main_Pipeline_reset_label5 MODELNAME adpcm_main_Pipeline_reset_label5 RTLNAME adpcm_main_adpcm_main_Pipeline_reset_label5}
  {SRCNAME adpcm_main_Pipeline_reset_label6 MODELNAME adpcm_main_Pipeline_reset_label6 RTLNAME adpcm_main_adpcm_main_Pipeline_reset_label6}
  {SRCNAME adpcm_main_Pipeline_reset_label7 MODELNAME adpcm_main_Pipeline_reset_label7 RTLNAME adpcm_main_adpcm_main_Pipeline_reset_label7}
  {SRCNAME encode MODELNAME encode RTLNAME adpcm_main_encode
    SUBMODULES {
      {MODELNAME adpcm_main_mul_14s_32s_46_5_1 RTLNAME adpcm_main_mul_14s_32s_46_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15s_32s_47_5_1 RTLNAME adpcm_main_mul_15s_32s_47_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_32s_46_5_1 RTLNAME adpcm_main_mul_16s_32s_46_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_32s_47_5_1 RTLNAME adpcm_main_mul_16s_32s_47_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_32s_64_5_1 RTLNAME adpcm_main_mul_32s_32s_64_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_9ns_41_5_1 RTLNAME adpcm_main_mul_32s_9ns_41_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_12ns_44_5_1 RTLNAME adpcm_main_mul_32s_12ns_44_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_13ns_45_5_1 RTLNAME adpcm_main_mul_32s_13ns_45_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_15ns_47_5_1 RTLNAME adpcm_main_mul_32s_15ns_47_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_11s_42_5_1 RTLNAME adpcm_main_mul_32s_11s_42_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_11s_43_5_1 RTLNAME adpcm_main_mul_32s_11s_43_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_13s_44_5_1 RTLNAME adpcm_main_mul_32s_13s_44_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_32s_13s_45_5_1 RTLNAME adpcm_main_mul_32s_13s_45_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_33s_7s_40_5_1 RTLNAME adpcm_main_mul_33s_7s_40_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_11ns_25_2_1 RTLNAME adpcm_main_mul_15ns_11ns_25_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_10ns_24_2_1 RTLNAME adpcm_main_mul_15ns_10ns_24_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mux_4_2_14_1_1 RTLNAME adpcm_main_mux_4_2_14_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mux_4_2_11_1_1 RTLNAME adpcm_main_mux_4_2_11_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_14s_15ns_29_2_1 RTLNAME adpcm_main_mul_14s_15ns_29_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_12ns_26_2_1 RTLNAME adpcm_main_mul_15ns_12ns_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_14s_14s_28_2_1 RTLNAME adpcm_main_mul_14s_14s_28_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_13ns_27_2_1 RTLNAME adpcm_main_mul_15ns_13ns_27_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_14ns_28_2_1 RTLNAME adpcm_main_mul_15ns_14ns_28_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_15ns_29_2_1 RTLNAME adpcm_main_mul_15ns_15ns_29_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_15ns_16ns_30_2_1 RTLNAME adpcm_main_mul_15ns_16ns_30_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_15ns_31_2_1 RTLNAME adpcm_main_mul_16s_15ns_31_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_16s_16s_32_2_1 RTLNAME adpcm_main_mul_16s_16s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_encode_quant26bt_pos_ROM_AUTO_1R RTLNAME adpcm_main_encode_quant26bt_pos_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_encode_quant26bt_neg_ROM_AUTO_1R RTLNAME adpcm_main_encode_quant26bt_neg_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_encode_qq4_code4_table_ROM_AUTO_1R RTLNAME adpcm_main_encode_qq4_code4_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_encode_wl_code_table_ROM_AUTO_1R RTLNAME adpcm_main_encode_wl_code_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_encode_ilb_table_ROM_AUTO_1R RTLNAME adpcm_main_encode_ilb_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME adpcm_main_Pipeline_adpcm_main_label12 MODELNAME adpcm_main_Pipeline_adpcm_main_label12 RTLNAME adpcm_main_adpcm_main_Pipeline_adpcm_main_label12}
  {SRCNAME decode MODELNAME decode RTLNAME adpcm_main_decode
    SUBMODULES {
      {MODELNAME adpcm_main_mul_32s_15ns_46_5_1 RTLNAME adpcm_main_mul_32s_15ns_46_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_mul_33s_7s_39_5_1 RTLNAME adpcm_main_mul_33s_7s_39_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_decode_qq6_code6_table_ROM_AUTO_1R RTLNAME adpcm_main_decode_qq6_code6_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME adpcm_main_Pipeline_adpcm_main_label13 MODELNAME adpcm_main_Pipeline_adpcm_main_label13 RTLNAME adpcm_main_adpcm_main_Pipeline_adpcm_main_label13}
  {SRCNAME adpcm_main MODELNAME adpcm_main RTLNAME adpcm_main IS_TOP 1
    SUBMODULES {
      {MODELNAME adpcm_main_delay_dltx_RAM_AUTO_1R1W RTLNAME adpcm_main_delay_dltx_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_delay_dhx_RAM_AUTO_1R1W RTLNAME adpcm_main_delay_dhx_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_delay_bpl_RAM_AUTO_1R1W RTLNAME adpcm_main_delay_bpl_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_tqmf_RAM_AUTO_1R1W RTLNAME adpcm_main_tqmf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME adpcm_main_accumc_RAM_AUTO_1R1W RTLNAME adpcm_main_accumc_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
