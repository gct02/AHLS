set SynModuleInfo {
  {SRCNAME kernel_gramschmidt MODELNAME kernel_gramschmidt RTLNAME kernel_gramschmidt IS_TOP 1
    SUBMODULES {
      {MODELNAME kernel_gramschmidt_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME kernel_gramschmidt_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME kernel_gramschmidt_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME kernel_gramschmidt_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME kernel_gramschmidt_ddiv_64ns_64ns_64_14_no_dsp_1 RTLNAME kernel_gramschmidt_ddiv_64ns_64ns_64_14_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME kernel_gramschmidt_dsqrt_64ns_64ns_64_12_no_dsp_1 RTLNAME kernel_gramschmidt_dsqrt_64ns_64ns_64_12_no_dsp_1 BINDTYPE op TYPE dsqrt IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
    }
  }
}
