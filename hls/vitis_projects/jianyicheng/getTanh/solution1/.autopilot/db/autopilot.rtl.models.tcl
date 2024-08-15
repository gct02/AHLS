set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_32_1 MODELNAME main_Pipeline_VITIS_LOOP_32_1 RTLNAME main_main_Pipeline_VITIS_LOOP_32_1
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME getTanh MODELNAME getTanh RTLNAME main_getTanh
    SUBMODULES {
      {MODELNAME main_sdiv_32ns_20s_32_36_1 RTLNAME main_sdiv_32ns_20s_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME inlined MODELNAME inlined RTLNAME main_inlined}
  {SRCNAME main_Pipeline_VITIS_LOOP_44_2 MODELNAME main_Pipeline_VITIS_LOOP_44_2 RTLNAME main_main_Pipeline_VITIS_LOOP_44_2}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_mul_17ns_27s_32_4_1 RTLNAME main_mul_17ns_27s_32_4_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_mul_17ns_28s_32_4_1 RTLNAME main_mul_17ns_28s_32_4_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_sinh_ROM_AUTO_1R RTLNAME main_sinh_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_cosh_ROM_AUTO_1R RTLNAME main_cosh_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_A_RAM_AUTO_1R1W RTLNAME main_A_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_addr_out_RAM_AUTO_1R1W RTLNAME main_addr_out_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
