set SynModuleInfo {
  {SRCNAME KeySchedule MODELNAME KeySchedule RTLNAME aes_main_KeySchedule
    SUBMODULES {
      {MODELNAME aes_main_mux_4_2_32_1_1 RTLNAME aes_main_mux_4_2_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME aes_main_KeySchedule_Sbox_ROM_AUTO_1R RTLNAME aes_main_KeySchedule_Sbox_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME aes_main_KeySchedule_Rcon0_ROM_AUTO_1R RTLNAME aes_main_KeySchedule_Rcon0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME AddRoundKey MODELNAME AddRoundKey RTLNAME aes_main_AddRoundKey}
  {SRCNAME ByteSub_ShiftRow MODELNAME ByteSub_ShiftRow RTLNAME aes_main_ByteSub_ShiftRow}
  {SRCNAME MixColumn_AddRoundKey MODELNAME MixColumn_AddRoundKey RTLNAME aes_main_MixColumn_AddRoundKey
    SUBMODULES {
      {MODELNAME aes_main_MixColumn_AddRoundKey_ret_RAM_AUTO_1R1W RTLNAME aes_main_MixColumn_AddRoundKey_ret_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME encrypt MODELNAME encrypt RTLNAME aes_main_encrypt}
  {SRCNAME InversShiftRow_ByteSub MODELNAME InversShiftRow_ByteSub RTLNAME aes_main_InversShiftRow_ByteSub
    SUBMODULES {
      {MODELNAME aes_main_InversShiftRow_ByteSub_invSbox_ROM_AUTO_1R RTLNAME aes_main_InversShiftRow_ByteSub_invSbox_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME AddRoundKey_InversMixColumn MODELNAME AddRoundKey_InversMixColumn RTLNAME aes_main_AddRoundKey_InversMixColumn
    SUBMODULES {
      {MODELNAME aes_main_AddRoundKey_InversMixColumn_ret_RAM_AUTO_1R1W RTLNAME aes_main_AddRoundKey_InversMixColumn_ret_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME decrypt MODELNAME decrypt RTLNAME aes_main_decrypt}
  {SRCNAME aes_main MODELNAME aes_main RTLNAME aes_main IS_TOP 1
    SUBMODULES {
      {MODELNAME aes_main_word_RAM_AUTO_1R1W RTLNAME aes_main_word_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
