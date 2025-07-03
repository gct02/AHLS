set SynModuleInfo {
  {SRCNAME gsm_norm MODELNAME gsm_norm RTLNAME Gsm_LPC_Analysis_gsm_norm
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R RTLNAME Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Autocorrelation_Pipeline_VITIS_LOOP_65_1 MODELNAME Autocorrelation_Pipeline_VITIS_LOOP_65_1 RTLNAME Gsm_LPC_Analysis_Autocorrelation_Pipeline_VITIS_LOOP_65_1
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_15ns_15ns_31_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_15ns_15ns_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_flow_control_loop_pipe_sequential_init RTLNAME Gsm_LPC_Analysis_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME Gsm_LPC_Analysis_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Autocorrelation_Pipeline_Autocorrelation_label2 MODELNAME Autocorrelation_Pipeline_Autocorrelation_label2 RTLNAME Gsm_LPC_Analysis_Autocorrelation_Pipeline_Autocorrelation_label2}
  {SRCNAME Autocorrelation_Pipeline_Autocorrelation_label3 MODELNAME Autocorrelation_Pipeline_Autocorrelation_label3 RTLNAME Gsm_LPC_Analysis_Autocorrelation_Pipeline_Autocorrelation_label3
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mul_16s_16s_32_1_1 RTLNAME Gsm_LPC_Analysis_mul_16s_16s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Autocorrelation_Pipeline_Autocorrelation_label4 MODELNAME Autocorrelation_Pipeline_Autocorrelation_label4 RTLNAME Gsm_LPC_Analysis_Autocorrelation_Pipeline_Autocorrelation_label4}
  {SRCNAME Autocorrelation_Pipeline_Autocorrelation_label5 MODELNAME Autocorrelation_Pipeline_Autocorrelation_label5 RTLNAME Gsm_LPC_Analysis_Autocorrelation_Pipeline_Autocorrelation_label5}
  {SRCNAME Autocorrelation MODELNAME Autocorrelation RTLNAME Gsm_LPC_Analysis_Autocorrelation
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1 RTLNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_32s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_am_addmul_16s_16s_16s_33_4_1 RTLNAME Gsm_LPC_Analysis_am_addmul_16s_16s_16s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_32s_33_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_32s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_33s_33_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_33s_33_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_33s_34_4_1 RTLNAME Gsm_LPC_Analysis_ama_addmuladd_16s_16s_16s_33s_34_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gsm_div MODELNAME gsm_div RTLNAME Gsm_LPC_Analysis_gsm_div}
  {SRCNAME Reflection_coefficients MODELNAME Reflection_coefficients RTLNAME Gsm_LPC_Analysis_Reflection_coefficients
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_15ns_31_4_1 RTLNAME Gsm_LPC_Analysis_mac_muladd_16s_16s_15ns_31_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME Gsm_LPC_Analysis_Reflection_coefficients_ACF_RAM_AUTO_1R1W RTLNAME Gsm_LPC_Analysis_Reflection_coefficients_ACF_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Quantization_and_coding MODELNAME Quantization_and_coding RTLNAME Gsm_LPC_Analysis_Quantization_and_coding
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_mul_16s_15ns_31_1_1 RTLNAME Gsm_LPC_Analysis_mul_16s_15ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Gsm_LPC_Analysis MODELNAME Gsm_LPC_Analysis RTLNAME Gsm_LPC_Analysis IS_TOP 1
    SUBMODULES {
      {MODELNAME Gsm_LPC_Analysis_L_ACF_RAM_AUTO_1R1W RTLNAME Gsm_LPC_Analysis_L_ACF_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
