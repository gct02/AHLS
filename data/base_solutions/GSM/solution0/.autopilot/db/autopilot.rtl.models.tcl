set SynModuleInfo {
  {SRCNAME gsm_abs MODELNAME gsm_abs RTLNAME Gsm_LPC_Analysis_gsm_abs}
  {SRCNAME gsm_norm MODELNAME gsm_norm RTLNAME Gsm_LPC_Analysis_gsm_norm
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R RTLNAME Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gsm_mult_r MODELNAME gsm_mult_r RTLNAME Gsm_LPC_Analysis_gsm_mult_r
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_15ns_31_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_15ns_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Autocorrelation MODELNAME Autocorrelation RTLNAME Gsm_LPC_Analysis_Autocorrelation
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mul_16s_16s_32_1_1 RTLNAME Gsm_LPC_Analysis_mul_16s_16s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1 RTLNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_am_addmul_16s_16s_16s_33_4_1 RTLNAME Gsm_LPC_Analysis_am_addmul_16s_16s_16s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_32s_33_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_32s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_33s_33_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_33s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_33s_34_4_1 RTLNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_33s_34_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gsm_div MODELNAME gsm_div RTLNAME Gsm_LPC_Analysis_gsm_div}
  {SRCNAME gsm_add MODELNAME gsm_add RTLNAME Gsm_LPC_Analysis_gsm_add}
  {SRCNAME Reflection_coefficients MODELNAME Reflection_coefficients RTLNAME Gsm_LPC_Analysis_Reflection_coefficients
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_Reflection_coefficients_ACF_RAM_AUTO_1R1W RTLNAME Gsm_LPC_Analysis_Reflection_coefficients_ACF_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_Reflection_coefficients_P_RAM_AUTO_1R1W RTLNAME Gsm_LPC_Analysis_Reflection_coefficients_P_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gsm_mult MODELNAME gsm_mult RTLNAME Gsm_LPC_Analysis_gsm_mult
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mul_16s_15ns_31_1_1 RTLNAME Gsm_LPC_Analysis_mul_16s_15ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Quantization_and_coding MODELNAME Quantization_and_coding RTLNAME Gsm_LPC_Analysis_Quantization_and_coding}
  {SRCNAME Gsm_LPC_Analysis MODELNAME Gsm_LPC_Analysis RTLNAME Gsm_LPC_Analysis IS_TOP 1
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_L_ACF_RAM_AUTO_1R1W RTLNAME Gsm_LPC_Analysis_L_ACF_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
