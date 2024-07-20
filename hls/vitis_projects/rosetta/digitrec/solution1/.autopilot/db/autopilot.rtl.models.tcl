set SynModuleInfo {
  {SRCNAME DigitRec_Pipeline_SET_KNN_SET MODELNAME DigitRec_Pipeline_SET_KNN_SET RTLNAME DigitRec_DigitRec_Pipeline_SET_KNN_SET
    SUBMODULES {
      {MODELNAME DigitRec_flow_control_loop_pipe_sequential_init RTLNAME DigitRec_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME DigitRec_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME DigitRec_Pipeline_TRAINING_LOOP MODELNAME DigitRec_Pipeline_TRAINING_LOOP RTLNAME DigitRec_DigitRec_Pipeline_TRAINING_LOOP}
  {SRCNAME DigitRec_Pipeline_3 MODELNAME DigitRec_Pipeline_3 RTLNAME DigitRec_DigitRec_Pipeline_3}
  {SRCNAME DigitRec_Pipeline_VITIS_LOOP_69_1 MODELNAME DigitRec_Pipeline_VITIS_LOOP_69_1 RTLNAME DigitRec_DigitRec_Pipeline_VITIS_LOOP_69_1
    SUBMODULES {
      {MODELNAME DigitRec_mux_3_2_4_1_1 RTLNAME DigitRec_mux_3_2_4_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME DigitRec_Pipeline_VITIS_LOOP_72_2 MODELNAME DigitRec_Pipeline_VITIS_LOOP_72_2 RTLNAME DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2}
  {SRCNAME DigitRec MODELNAME DigitRec RTLNAME DigitRec IS_TOP 1
    SUBMODULES {
      {MODELNAME DigitRec_votes_RAM_AUTO_1R1W RTLNAME DigitRec_votes_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
