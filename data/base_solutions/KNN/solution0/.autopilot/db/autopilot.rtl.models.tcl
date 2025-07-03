set SynModuleInfo {
  {SRCNAME md_kernel MODELNAME md_kernel RTLNAME md_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME md_kernel_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME md_kernel_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME md_kernel_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_ddiv_64ns_64ns_64_14_no_dsp_1 RTLNAME md_kernel_ddiv_64ns_64ns_64_14_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 13 ALLOW_PRAGMA 1}
    }
  }
}
