set SynModuleInfo {
  {SRCNAME matrixadd_Pipeline_loop_0 MODELNAME matrixadd_Pipeline_loop_0 RTLNAME matrixadd_matrixadd_Pipeline_loop_0
    SUBMODULES {
      {MODELNAME matrixadd_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME matrixadd_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME matrixadd_flow_control_loop_pipe_sequential_init RTLNAME matrixadd_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matrixadd_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME matrixadd_Pipeline_loop_1 MODELNAME matrixadd_Pipeline_loop_1 RTLNAME matrixadd_matrixadd_Pipeline_loop_1}
  {SRCNAME matrixadd_Pipeline_loop_2 MODELNAME matrixadd_Pipeline_loop_2 RTLNAME matrixadd_matrixadd_Pipeline_loop_2}
  {SRCNAME matrixadd_Pipeline_loop_3 MODELNAME matrixadd_Pipeline_loop_3 RTLNAME matrixadd_matrixadd_Pipeline_loop_3}
  {SRCNAME matrixadd_Pipeline_loop_5 MODELNAME matrixadd_Pipeline_loop_5 RTLNAME matrixadd_matrixadd_Pipeline_loop_5}
  {SRCNAME matrixadd_Pipeline_loop_7 MODELNAME matrixadd_Pipeline_loop_7 RTLNAME matrixadd_matrixadd_Pipeline_loop_7}
  {SRCNAME matrixadd MODELNAME matrixadd RTLNAME matrixadd IS_TOP 1
    SUBMODULES {
      {MODELNAME matrixadd_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME matrixadd_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
}
