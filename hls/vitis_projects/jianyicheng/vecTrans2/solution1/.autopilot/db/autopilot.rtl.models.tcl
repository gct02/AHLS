set SynModuleInfo {
  {SRCNAME vecTrans2 MODELNAME vecTrans2 RTLNAME vecTrans2 IS_TOP 1
    SUBMODULES {
      {MODELNAME vecTrans2_mul_32s_32s_32_2_1 RTLNAME vecTrans2_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME vecTrans2_flow_control_loop_pipe RTLNAME vecTrans2_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME vecTrans2_flow_control_loop_pipe_U}
    }
  }
}
