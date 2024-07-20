set SynModuleInfo {
  {SRCNAME face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1 MODELNAME face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1 RTLNAME face_detect_face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1
    SUBMODULES {
      {MODELNAME face_detect_mul_9ns_28s_32_4_1 RTLNAME face_detect_mul_9ns_28s_32_4_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_mul_8ns_24s_24_5_1 RTLNAME face_detect_mul_8ns_24s_24_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_flow_control_loop_pipe_sequential_init RTLNAME face_detect_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME face_detect_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2 MODELNAME processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2 RTLNAME face_detect_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2
    SUBMODULES {
      {MODELNAME face_detect_mac_muladd_8ns_8ns_32ns_32_4_1 RTLNAME face_detect_mac_muladd_8ns_8ns_32ns_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cascadeClassifier_Pipeline_VITIS_LOOP_379_1 MODELNAME cascadeClassifier_Pipeline_VITIS_LOOP_379_1 RTLNAME face_detect_cascadeClassifier_Pipeline_VITIS_LOOP_379_1}
  {SRCNAME cascadeClassifier_Pipeline_Filters MODELNAME cascadeClassifier_Pipeline_Filters RTLNAME face_detect_cascadeClassifier_Pipeline_Filters
    SUBMODULES {
      {MODELNAME face_detect_mul_13s_32s_32_5_1 RTLNAME face_detect_mul_13s_32s_32_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_mul_14ns_32s_32_5_1 RTLNAME face_detect_mul_14ns_32s_32_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_tree_thresh_array_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_tree_thresh_array_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array0_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array1_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array2_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_weights_array2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_alpha1_array_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_alpha1_array_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_alpha2_array_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_alpha2_array_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array0_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array2_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array1_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array3_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array3_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array4_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array4_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array6_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array6_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array5_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array5_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array7_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array7_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array8_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array8_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array10_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array10_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array9_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array9_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array11_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_Pipeline_Filters_rectangles_array11_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cascadeClassifier MODELNAME cascadeClassifier RTLNAME face_detect_cascadeClassifier
    SUBMODULES {
      {MODELNAME face_detect_dmul_64ns_64ns_64_14_full_dsp_1 RTLNAME face_detect_dmul_64ns_64ns_64_14_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_dcmp_64ns_64ns_1_4_no_dsp_1 RTLNAME face_detect_dcmp_64ns_64ns_1_4_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_sitodp_64s_64_7_no_dsp_1 RTLNAME face_detect_sitodp_64s_64_7_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_stages_array_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_stages_array_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_cascadeClassifier_stages_thresh_array_ROM_AUTO_1R RTLNAME face_detect_cascadeClassifier_stages_thresh_array_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME processImage MODELNAME processImage RTLNAME face_detect_processImage
    SUBMODULES {
      {MODELNAME face_detect_sitofp_32ns_32_7_no_dsp_1 RTLNAME face_detect_sitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_mul_32s_32s_64_5_1 RTLNAME face_detect_mul_32s_32s_64_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_lshr_137ns_32ns_137_7_1 RTLNAME face_detect_lshr_137ns_32ns_137_7_1 BINDTYPE op TYPE lshr IMPL auto_pipe LATENCY 6}
      {MODELNAME face_detect_shl_137ns_32ns_137_7_1 RTLNAME face_detect_shl_137ns_32ns_137_7_1 BINDTYPE op TYPE shl IMPL auto_pipe LATENCY 6}
      {MODELNAME face_detect_processImage_SUM1_data_RAM_1WNR_AUTO_1R1W RTLNAME face_detect_processImage_SUM1_data_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_processImage_SQSUM1_data_RAM_AUTO_1R1W RTLNAME face_detect_processImage_SQSUM1_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME face_detect MODELNAME face_detect RTLNAME face_detect IS_TOP 1
    SUBMODULES {
      {MODELNAME face_detect_fmul_32ns_32ns_32_8_max_dsp_1 RTLNAME face_detect_fmul_32ns_32ns_32_8_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME face_detect_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_fpext_32ns_64_4_no_dsp_1 RTLNAME face_detect_fpext_32ns_64_4_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_fcmp_32ns_32ns_1_4_no_dsp_1 RTLNAME face_detect_fcmp_32ns_32ns_1_4_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_dadd_64ns_64ns_64_16_full_dsp_1 RTLNAME face_detect_dadd_64ns_64ns_64_16_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_lshr_79ns_32ns_79_2_1 RTLNAME face_detect_lshr_79ns_32ns_79_2_1 BINDTYPE op TYPE lshr IMPL auto_pipe LATENCY 1}
      {MODELNAME face_detect_shl_79ns_32ns_79_2_1 RTLNAME face_detect_shl_79ns_32ns_79_2_1 BINDTYPE op TYPE shl IMPL auto_pipe LATENCY 1}
      {MODELNAME face_detect_sdiv_27ns_32ns_27_31_1 RTLNAME face_detect_sdiv_27ns_32ns_27_31_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 30 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_sdiv_26ns_32ns_24_30_1 RTLNAME face_detect_sdiv_26ns_32ns_24_30_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME face_detect_IMG1_data_RAM_AUTO_1R1W RTLNAME face_detect_IMG1_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
