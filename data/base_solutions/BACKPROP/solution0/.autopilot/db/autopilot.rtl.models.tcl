set SynModuleInfo {
  {SRCNAME add_bias_to_activations.clone.1 MODELNAME add_bias_to_activations_clone_1 RTLNAME backprop_add_bias_to_activations_clone_1
    SUBMODULES {
      {MODELNAME backprop_dadd_64ns_64ns_64_4_full_dsp_1 RTLNAME backprop_dadd_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME matrix_vector_product_with_bias_input_layer.1 MODELNAME matrix_vector_product_with_bias_input_layer_1 RTLNAME backprop_matrix_vector_product_with_bias_input_layer_1}
  {SRCNAME RELU MODELNAME RELU RTLNAME backprop_RELU
    SUBMODULES {
      {MODELNAME backprop_ddiv_64ns_64ns_64_14_no_dsp_1 RTLNAME backprop_ddiv_64ns_64ns_64_14_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME backprop_dexp_64ns_64ns_64_10_full_dsp_1 RTLNAME backprop_dexp_64ns_64ns_64_10_full_dsp_1 BINDTYPE op TYPE dexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME matrix_vector_product_with_bias_second_layer.1 MODELNAME matrix_vector_product_with_bias_second_layer_1 RTLNAME backprop_matrix_vector_product_with_bias_second_layer_1}
  {SRCNAME add_bias_to_activations.1 MODELNAME add_bias_to_activations_1 RTLNAME backprop_add_bias_to_activations_1
    SUBMODULES {
      {MODELNAME backprop_mux_3_2_64_1_1 RTLNAME backprop_mux_3_2_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME matrix_vector_product_with_bias_output_layer.1 MODELNAME matrix_vector_product_with_bias_output_layer_1 RTLNAME backprop_matrix_vector_product_with_bias_output_layer_1}
  {SRCNAME RELU.clone MODELNAME RELU_clone RTLNAME backprop_RELU_clone}
  {SRCNAME soft_max MODELNAME soft_max RTLNAME backprop_soft_max}
  {SRCNAME take_difference.1 MODELNAME take_difference_1 RTLNAME backprop_take_difference_1}
  {SRCNAME get_delta_matrix_weights3 MODELNAME get_delta_matrix_weights3 RTLNAME backprop_get_delta_matrix_weights3}
  {SRCNAME get_oracle_activations2.1 MODELNAME get_oracle_activations2_1 RTLNAME backprop_get_oracle_activations2_1}
  {SRCNAME get_delta_matrix_weights2 MODELNAME get_delta_matrix_weights2 RTLNAME backprop_get_delta_matrix_weights2}
  {SRCNAME get_oracle_activations1.1 MODELNAME get_oracle_activations1_1 RTLNAME backprop_get_oracle_activations1_1}
  {SRCNAME get_delta_matrix_weights1.1 MODELNAME get_delta_matrix_weights1_1 RTLNAME backprop_get_delta_matrix_weights1_1}
  {SRCNAME update_weights.1 MODELNAME update_weights_1 RTLNAME backprop_update_weights_1
    SUBMODULES {
      {MODELNAME backprop_dsqrt_64ns_64ns_64_12_no_dsp_1 RTLNAME backprop_dsqrt_64ns_64ns_64_12_no_dsp_1 BINDTYPE op TYPE dsqrt IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME backprop MODELNAME backprop RTLNAME backprop IS_TOP 1
    SUBMODULES {
      {MODELNAME backprop_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME backprop_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME backprop_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME backprop_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME backprop_activations1_RAM_AUTO_1R1W RTLNAME backprop_activations1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME backprop_delta_weights1_RAM_AUTO_1R1W RTLNAME backprop_delta_weights1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME backprop_delta_weights2_RAM_AUTO_1R1W RTLNAME backprop_delta_weights2_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME backprop_delta_weights3_RAM_AUTO_1R1W RTLNAME backprop_delta_weights3_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
