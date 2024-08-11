set SynModuleInfo {
  {SRCNAME doitgenTriple_Pipeline_loop_0_loop_1 MODELNAME doitgenTriple_Pipeline_loop_0_loop_1 RTLNAME doitgenTriple_doitgenTriple_Pipeline_loop_0_loop_1
    SUBMODULES {
      {MODELNAME doitgenTriple_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME doitgenTriple_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME doitgenTriple_flow_control_loop_pipe_sequential_init RTLNAME doitgenTriple_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME doitgenTriple_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME doitgenTriple_Pipeline_loop_2 MODELNAME doitgenTriple_Pipeline_loop_2 RTLNAME doitgenTriple_doitgenTriple_Pipeline_loop_2}
  {SRCNAME doitgenTriple MODELNAME doitgenTriple RTLNAME doitgenTriple IS_TOP 1
    SUBMODULES {
      {MODELNAME doitgenTriple_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME doitgenTriple_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME doitgenTriple_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME doitgenTriple_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
