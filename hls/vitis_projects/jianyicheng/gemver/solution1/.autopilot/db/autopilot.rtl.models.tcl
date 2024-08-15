set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2 MODELNAME main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2 RTLNAME main_main_Pipeline_VITIS_LOOP_56_1_VITIS_LOOP_67_2
    SUBMODULES {
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_76_3_VITIS_LOOP_77_4 MODELNAME main_Pipeline_VITIS_LOOP_76_3_VITIS_LOOP_77_4 RTLNAME main_main_Pipeline_VITIS_LOOP_76_3_VITIS_LOOP_77_4}
  {SRCNAME main_Pipeline_VITIS_LOOP_82_5_VITIS_LOOP_85_6 MODELNAME main_Pipeline_VITIS_LOOP_82_5_VITIS_LOOP_85_6 RTLNAME main_main_Pipeline_VITIS_LOOP_82_5_VITIS_LOOP_85_6}
  {SRCNAME main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8 MODELNAME main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8 RTLNAME main_main_Pipeline_VITIS_LOOP_93_7_VITIS_LOOP_95_8}
  {SRCNAME main_Pipeline_VITIS_LOOP_14_1_loop_2 MODELNAME main_Pipeline_VITIS_LOOP_14_1_loop_2 RTLNAME main_main_Pipeline_VITIS_LOOP_14_1_loop_2}
  {SRCNAME main_Pipeline_VITIS_LOOP_23_2_loop_3 MODELNAME main_Pipeline_VITIS_LOOP_23_2_loop_3 RTLNAME main_main_Pipeline_VITIS_LOOP_23_2_loop_3}
  {SRCNAME main_Pipeline_VITIS_LOOP_35_3_loop_4 MODELNAME main_Pipeline_VITIS_LOOP_35_3_loop_4 RTLNAME main_main_Pipeline_VITIS_LOOP_35_3_loop_4}
  {SRCNAME main_Pipeline_VITIS_LOOP_105_9 MODELNAME main_Pipeline_VITIS_LOOP_105_9 RTLNAME main_main_Pipeline_VITIS_LOOP_105_9
    SUBMODULES {
      {MODELNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 RTLNAME main_fcmp_32ns_32ns_1_4_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_fadd_32ns_32ns_32_10_full_dsp_1 RTLNAME main_fadd_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME main_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME main_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME main_A_RAM_AUTO_1R1W RTLNAME main_A_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_u1_RAM_AUTO_1R1W RTLNAME main_u1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
