set SynModuleInfo {
  {SRCNAME fft_Pipeline_VITIS_LOOP_30_2 MODELNAME fft_Pipeline_VITIS_LOOP_30_2 RTLNAME fft_fft_Pipeline_VITIS_LOOP_30_2
    SUBMODULES {
      {MODELNAME fft_flow_control_loop_pipe_sequential_init RTLNAME fft_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fft_Pipeline_VITIS_LOOP_49_4 MODELNAME fft_Pipeline_VITIS_LOOP_49_4 RTLNAME fft_fft_Pipeline_VITIS_LOOP_49_4}
  {SRCNAME fft_Pipeline_VITIS_LOOP_68_6 MODELNAME fft_Pipeline_VITIS_LOOP_68_6 RTLNAME fft_fft_Pipeline_VITIS_LOOP_68_6}
  {SRCNAME fft_Pipeline_VITIS_LOOP_87_8 MODELNAME fft_Pipeline_VITIS_LOOP_87_8 RTLNAME fft_fft_Pipeline_VITIS_LOOP_87_8}
  {SRCNAME fft_Pipeline_VITIS_LOOP_106_10 MODELNAME fft_Pipeline_VITIS_LOOP_106_10 RTLNAME fft_fft_Pipeline_VITIS_LOOP_106_10}
  {SRCNAME fft_Pipeline_VITIS_LOOP_125_12 MODELNAME fft_Pipeline_VITIS_LOOP_125_12 RTLNAME fft_fft_Pipeline_VITIS_LOOP_125_12}
  {SRCNAME fft_Pipeline_VITIS_LOOP_144_14 MODELNAME fft_Pipeline_VITIS_LOOP_144_14 RTLNAME fft_fft_Pipeline_VITIS_LOOP_144_14}
  {SRCNAME fft_Pipeline_VITIS_LOOP_163_16 MODELNAME fft_Pipeline_VITIS_LOOP_163_16 RTLNAME fft_fft_Pipeline_VITIS_LOOP_163_16}
  {SRCNAME fft MODELNAME fft RTLNAME fft IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME fft_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
