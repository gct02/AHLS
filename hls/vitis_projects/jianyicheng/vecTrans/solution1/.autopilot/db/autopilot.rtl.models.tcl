set SynModuleInfo {
  {SRCNAME vecTrans MODELNAME vecTrans RTLNAME vecTrans IS_TOP 1
    SUBMODULES {
      {MODELNAME vecTrans_mul_32s_32s_32_2_1 RTLNAME vecTrans_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME vecTrans_flow_control_loop_pipe RTLNAME vecTrans_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME vecTrans_flow_control_loop_pipe_U}
    }
  }
}
