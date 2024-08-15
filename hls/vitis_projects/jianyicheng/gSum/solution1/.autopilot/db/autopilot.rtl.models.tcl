set SynModuleInfo {
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_dadd_64ns_64ns_64_16_full_dsp_1 RTLNAME main_dadd_64ns_64ns_64_16_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME main_dmul_64ns_64ns_64_14_full_dsp_1 RTLNAME main_dmul_64ns_64ns_64_14_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 RTLNAME main_dcmp_64ns_64ns_1_4_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_A_ROM_AUTO_1R RTLNAME main_A_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_B_ROM_AUTO_1R RTLNAME main_B_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
