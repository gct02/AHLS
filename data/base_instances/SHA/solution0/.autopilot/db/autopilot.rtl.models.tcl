set SynModuleInfo {
  {SRCNAME sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1 MODELNAME sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1 RTLNAME sha_stream_sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1
    SUBMODULES {
      {MODELNAME sha_stream_flow_control_loop_pipe_sequential_init RTLNAME sha_stream_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME sha_stream_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME sha_transform MODELNAME sha_transform RTLNAME sha_stream_sha_transform
    SUBMODULES {
      {MODELNAME sha_stream_sha_transform_W_RAM_AUTO_1R1W RTLNAME sha_stream_sha_transform_W_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sha_stream_Pipeline_local_memset_label12 MODELNAME sha_stream_Pipeline_local_memset_label12 RTLNAME sha_stream_sha_stream_Pipeline_local_memset_label12}
  {SRCNAME sha_stream_Pipeline_local_memset_label1 MODELNAME sha_stream_Pipeline_local_memset_label1 RTLNAME sha_stream_sha_stream_Pipeline_local_memset_label1}
  {SRCNAME sha_stream_Pipeline_local_memset_label11 MODELNAME sha_stream_Pipeline_local_memset_label11 RTLNAME sha_stream_sha_stream_Pipeline_local_memset_label11}
  {SRCNAME sha_stream_Pipeline_sha_stream_label2 MODELNAME sha_stream_Pipeline_sha_stream_label2 RTLNAME sha_stream_sha_stream_Pipeline_sha_stream_label2}
  {SRCNAME sha_stream MODELNAME sha_stream RTLNAME sha_stream IS_TOP 1
    SUBMODULES {
      {MODELNAME sha_stream_local_indata_RAM_AUTO_1R1W RTLNAME sha_stream_local_indata_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sha_stream_sha_info_data_RAM_AUTO_1R1W RTLNAME sha_stream_sha_info_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sha_stream_sha_info_digest_RAM_AUTO_1R1W RTLNAME sha_stream_sha_info_digest_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
