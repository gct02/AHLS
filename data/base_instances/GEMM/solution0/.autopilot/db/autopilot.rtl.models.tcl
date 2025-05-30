set SynModuleInfo {
  {SRCNAME bbgemm MODELNAME bbgemm RTLNAME bbgemm IS_TOP 1
    SUBMODULES {
      {MODELNAME bbgemm_dadd_64ns_64ns_64_4_full_dsp_1 RTLNAME bbgemm_dadd_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME bbgemm_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME bbgemm_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
