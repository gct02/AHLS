set SynModuleInfo {
  {SRCNAME rendering_Pipeline_RAST2 MODELNAME rendering_Pipeline_RAST2 RTLNAME rendering_rendering_Pipeline_RAST2
    SUBMODULES {
      {MODELNAME rendering_urem_31ns_8ns_8_35_1 RTLNAME rendering_urem_31ns_8ns_8_35_1 BINDTYPE op TYPE urem IMPL auto LATENCY 34 ALLOW_PRAGMA 1}
      {MODELNAME rendering_udiv_31ns_8ns_8_35_1 RTLNAME rendering_udiv_31ns_8ns_8_35_1 BINDTYPE op TYPE udiv IMPL auto LATENCY 34 ALLOW_PRAGMA 1}
      {MODELNAME rendering_mul_9s_9s_18_3_1 RTLNAME rendering_mul_9s_9s_18_3_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rendering_mac_mulsub_9s_9s_18s_18_4_1 RTLNAME rendering_mac_mulsub_9s_9s_18s_18_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rendering_flow_control_loop_pipe_sequential_init RTLNAME rendering_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME rendering_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME rendering_Pipeline_ZCULLING_INIT_ROW_ZCULLING_INIT_COL MODELNAME rendering_Pipeline_ZCULLING_INIT_ROW_ZCULLING_INIT_COL RTLNAME rendering_rendering_Pipeline_ZCULLING_INIT_ROW_ZCULLING_INIT_COL}
  {SRCNAME rendering_Pipeline_ZCULLING MODELNAME rendering_Pipeline_ZCULLING RTLNAME rendering_rendering_Pipeline_ZCULLING
    SUBMODULES {
      {MODELNAME rendering_sparsemux_1001_9_8_1_1 RTLNAME rendering_sparsemux_1001_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
      {MODELNAME rendering_sparsemux_1001_9_6_1_1 RTLNAME rendering_sparsemux_1001_9_6_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
    }
  }
  {SRCNAME rendering_Pipeline_COLORING_FB_INIT_ROW_COLORING_FB_INIT_COL MODELNAME rendering_Pipeline_COLORING_FB_INIT_ROW_COLORING_FB_INIT_COL RTLNAME rendering_rendering_Pipeline_COLORING_FB_INIT_ROW_COLORING_FB_INIT_COL}
  {SRCNAME rendering_Pipeline_COLORING_FB MODELNAME rendering_Pipeline_COLORING_FB RTLNAME rendering_rendering_Pipeline_COLORING_FB}
  {SRCNAME rendering MODELNAME rendering RTLNAME rendering IS_TOP 1
    SUBMODULES {
      {MODELNAME rendering_mul_8ns_10ns_17_3_1 RTLNAME rendering_mul_8ns_10ns_17_3_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rendering_z_buffer_RAM_AUTO_1R1W RTLNAME rendering_z_buffer_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rendering_pixels_x_RAM_AUTO_1R1W RTLNAME rendering_pixels_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME rendering_pixels_color_RAM_AUTO_1R1W RTLNAME rendering_pixels_color_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
