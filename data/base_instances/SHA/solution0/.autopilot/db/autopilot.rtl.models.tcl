set SynModuleInfo {
  {SRCNAME sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1 MODELNAME sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1 RTLNAME sha_stream_sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1
    SUBMODULES {
      {MODELNAME sha_stream_flow_control_loop_pipe_sequential_init RTLNAME sha_stream_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME sha_stream_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME local_memcpy MODELNAME local_memcpy RTLNAME sha_stream_local_memcpy}
  {SRCNAME sha_transform MODELNAME sha_transform RTLNAME sha_stream_sha_transform
    SUBMODULES {
      {MODELNAME sha_stream_sha_transform_W_RAM_AUTO_1R1W RTLNAME sha_stream_sha_transform_W_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sha_update MODELNAME sha_update RTLNAME sha_stream_sha_update}
  {SRCNAME local_memset_Pipeline_local_memset_label1 MODELNAME local_memset_Pipeline_local_memset_label1 RTLNAME sha_stream_local_memset_Pipeline_local_memset_label1}
  {SRCNAME local_memset MODELNAME local_memset RTLNAME sha_stream_local_memset}
  {SRCNAME sha_stream_Pipeline_sha_stream_label2 MODELNAME sha_stream_Pipeline_sha_stream_label2 RTLNAME sha_stream_sha_stream_Pipeline_sha_stream_label2}
  {SRCNAME sha_stream MODELNAME sha_stream RTLNAME sha_stream IS_TOP 1
    SUBMODULES {
      {MODELNAME sha_stream_local_indata_RAM_AUTO_1R1W RTLNAME sha_stream_local_indata_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sha_stream_sha_info_data_RAM_AUTO_1R1W RTLNAME sha_stream_sha_info_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sha_stream_sha_info_digest_RAM_AUTO_1R1W RTLNAME sha_stream_sha_info_digest_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
