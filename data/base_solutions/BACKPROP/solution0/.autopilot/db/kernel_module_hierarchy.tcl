set ModuleHierarchy {[{
"Name" : "backprop","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "backprop_loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_323","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_add_bias_to_activations_clone_1_fu_136","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "4","Type" : "no"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1","ID" : "5","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1","ID" : "6","Type" : "no"},]},]},
	{"Name" : "grp_RELU_fu_335","ID" : "7","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RELU_loop1","ID" : "8","Type" : "no"},]},
	{"Name" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_341","ID" : "9","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_add_bias_to_activations_clone_1_fu_115","ID" : "10","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "11","Type" : "no"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1","ID" : "12","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1","ID" : "13","Type" : "no"},]},]},
	{"Name" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_351","ID" : "14","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_add_bias_to_activations_1_fu_145","ID" : "15","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "16","Type" : "no"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1","ID" : "17","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1","ID" : "18","Type" : "no"},]},]},
	{"Name" : "grp_RELU_clone_fu_366","ID" : "19","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RELU_loop1","ID" : "20","Type" : "no"},]},
	{"Name" : "grp_soft_max_fu_376","ID" : "21","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "soft_max_loop1","ID" : "22","Type" : "no"},
			{"Name" : "soft_max_loop2","ID" : "23","Type" : "no"},]},
	{"Name" : "grp_take_difference_1_fu_386","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "take_difference_loop1","ID" : "25","Type" : "no"},]},
	{"Name" : "grp_get_delta_matrix_weights3_fu_402","ID" : "26","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights3_loop1","ID" : "27","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights3_loop1_1","ID" : "28","Type" : "no"},]},]},
	{"Name" : "grp_get_oracle_activations2_1_fu_411","ID" : "29","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_oracle_activations2_loop1","ID" : "30","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_oracle_activations2_loop1_1","ID" : "31","Type" : "no"},]},]},
	{"Name" : "grp_get_delta_matrix_weights2_fu_422","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights2_loop1","ID" : "33","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights2_loop1_1","ID" : "34","Type" : "no"},]},]},
	{"Name" : "grp_get_oracle_activations1_1_fu_429","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_oracle_activations1_loop1","ID" : "36","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_oracle_activations1_loop1_1","ID" : "37","Type" : "no"},]},]},
	{"Name" : "grp_get_delta_matrix_weights1_1_fu_438","ID" : "38","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights1_loop1","ID" : "39","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights1_loop1_1","ID" : "40","Type" : "no"},]},]},
	{"Name" : "grp_update_weights_1_fu_447","ID" : "41","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "update_weights_loop1","ID" : "42","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop1_1","ID" : "43","Type" : "no"},]},
			{"Name" : "update_weights_loop2","ID" : "44","Type" : "no"},
			{"Name" : "update_weights_loop3","ID" : "45","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop3_1","ID" : "46","Type" : "no"},]},
			{"Name" : "update_weights_loop4","ID" : "47","Type" : "no"},
			{"Name" : "update_weights_loop5","ID" : "48","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop5_1","ID" : "49","Type" : "no"},]},
			{"Name" : "update_weights_loop6","ID" : "50","Type" : "no"},
			{"Name" : "update_weights_loop7","ID" : "51","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop7_1","ID" : "52","Type" : "no"},]},
			{"Name" : "update_weights_loop8","ID" : "53","Type" : "no"},
			{"Name" : "update_weights_loop9","ID" : "54","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop9_1","ID" : "55","Type" : "no"},]},
			{"Name" : "update_weights_loop10","ID" : "56","Type" : "no"},
			{"Name" : "update_weights_loop11","ID" : "57","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop11_1","ID" : "58","Type" : "no"},]},
			{"Name" : "update_weights_loop12","ID" : "59","Type" : "no"},]},],
	"SubLoops" : [
	{"Name" : "backprop_loop1_1","ID" : "60","Type" : "no"},]},]
}]}