set SynModuleInfo {
  {SRCNAME gramSchmidt_Pipeline_VITIS_LOOP_36_2 MODELNAME gramSchmidt_Pipeline_VITIS_LOOP_36_2 RTLNAME gramSchmidt_gramSchmidt_Pipeline_VITIS_LOOP_36_2
    SUBMODULES {
      {MODELNAME gramSchmidt_flow_control_loop_pipe_sequential_init RTLNAME gramSchmidt_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME gramSchmidt_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME gramSchmidt_Pipeline_VITIS_LOOP_40_3 MODELNAME gramSchmidt_Pipeline_VITIS_LOOP_40_3 RTLNAME gramSchmidt_gramSchmidt_Pipeline_VITIS_LOOP_40_3
    SUBMODULES {
      {MODELNAME gramSchmidt_fdiv_32ns_32ns_32_10_no_dsp_1 RTLNAME gramSchmidt_fdiv_32ns_32ns_32_10_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 9 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gramSchmidt_Pipeline_VITIS_LOOP_42_4 MODELNAME gramSchmidt_Pipeline_VITIS_LOOP_42_4 RTLNAME gramSchmidt_gramSchmidt_Pipeline_VITIS_LOOP_42_4
    SUBMODULES {
      {MODELNAME gramSchmidt_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME gramSchmidt_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME gramSchmidt MODELNAME gramSchmidt RTLNAME gramSchmidt IS_TOP 1
    SUBMODULES {
      {MODELNAME gramSchmidt_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME gramSchmidt_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gramSchmidt_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME gramSchmidt_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
