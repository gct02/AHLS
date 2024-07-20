set SynModuleInfo {
  {SRCNAME SgdLR_Pipeline_DOT MODELNAME SgdLR_Pipeline_DOT RTLNAME SgdLR_SgdLR_Pipeline_DOT
    SUBMODULES {
      {MODELNAME SgdLR_flow_control_loop_pipe_sequential_init RTLNAME SgdLR_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME SgdLR_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME SgdLR_Pipeline_GRAD MODELNAME SgdLR_Pipeline_GRAD RTLNAME SgdLR_SgdLR_Pipeline_GRAD}
  {SRCNAME SgdLR_Pipeline_UPDATE MODELNAME SgdLR_Pipeline_UPDATE RTLNAME SgdLR_SgdLR_Pipeline_UPDATE}
  {SRCNAME SgdLR MODELNAME SgdLR RTLNAME SgdLR IS_TOP 1
    SUBMODULES {
      {MODELNAME SgdLR_faddfsub_32ns_32ns_32_10_full_dsp_1 RTLNAME SgdLR_faddfsub_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME SgdLR_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME SgdLR_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME SgdLR_sitofp_32ns_32_7_no_dsp_1 RTLNAME SgdLR_sitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME SgdLR_fexp_32ns_32ns_32_31_full_dsp_1 RTLNAME SgdLR_fexp_32ns_32ns_32_31_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 30 ALLOW_PRAGMA 1}
      {MODELNAME SgdLR_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME SgdLR_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME SgdLR_gradient_RAM_AUTO_1R1W RTLNAME SgdLR_gradient_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
