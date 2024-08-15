set SynModuleInfo {
  {SRCNAME main_Pipeline_VITIS_LOOP_177_1 MODELNAME main_Pipeline_VITIS_LOOP_177_1 RTLNAME main_main_Pipeline_VITIS_LOOP_177_1
    SUBMODULES {
      {MODELNAME main_urem_16ns_8ns_7_20_1 RTLNAME main_urem_16ns_8ns_7_20_1 BINDTYPE op TYPE urem IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME main_Pipeline_VITIS_LOOP_188_2 MODELNAME main_Pipeline_VITIS_LOOP_188_2 RTLNAME main_main_Pipeline_VITIS_LOOP_188_2}
  {SRCNAME histogram_Pipeline_loop_0 MODELNAME histogram_Pipeline_loop_0 RTLNAME main_histogram_Pipeline_loop_0}
  {SRCNAME histogram_Pipeline_loop_1 MODELNAME histogram_Pipeline_loop_1 RTLNAME main_histogram_Pipeline_loop_1}
  {SRCNAME histogram_Pipeline_loop_2 MODELNAME histogram_Pipeline_loop_2 RTLNAME main_histogram_Pipeline_loop_2}
  {SRCNAME histogram_Pipeline_loop_3 MODELNAME histogram_Pipeline_loop_3 RTLNAME main_histogram_Pipeline_loop_3}
  {SRCNAME histogram_Pipeline_loop_4 MODELNAME histogram_Pipeline_loop_4 RTLNAME main_histogram_Pipeline_loop_4}
  {SRCNAME histogram_Pipeline_loop_5 MODELNAME histogram_Pipeline_loop_5 RTLNAME main_histogram_Pipeline_loop_5}
  {SRCNAME histogram_Pipeline_loop_6 MODELNAME histogram_Pipeline_loop_6 RTLNAME main_histogram_Pipeline_loop_6}
  {SRCNAME histogram_Pipeline_loop_7 MODELNAME histogram_Pipeline_loop_7 RTLNAME main_histogram_Pipeline_loop_7}
  {SRCNAME histogram_Pipeline_loop_8 MODELNAME histogram_Pipeline_loop_8 RTLNAME main_histogram_Pipeline_loop_8}
  {SRCNAME histogram MODELNAME histogram RTLNAME main_histogram}
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_array_0_RAM_AUTO_1R1W RTLNAME main_array_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_results_0_RAM_AUTO_1R1W RTLNAME main_results_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_results_RAM_AUTO_0R0W RTLNAME main_results_RAM_AUTO_0R0W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
