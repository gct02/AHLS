set ModuleHierarchy {[{
"Name" : "backprop","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "backprop_loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_backprop_Pipeline_backprop_loop1_1_fu_246","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "backprop_loop1_1","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "grp_matrix_vector_product_with_bias_input_layer_1_fu_258","ID" : "4","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_matrix_vector_product_with_bias_input_layer_1_Pipeline_add_bias_to_activations_l_fu_134","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "6","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1","ID" : "7","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1","ID" : "8","Type" : "no"},]},]},
	{"Name" : "grp_backprop_Pipeline_RELU_loop1_fu_270","ID" : "9","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RELU_loop1","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_matrix_vector_product_with_bias_second_layer_1_fu_276","ID" : "11","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_matrix_vector_product_with_bias_second_layer_1_Pipeline_add_bias_to_activations_s_fu_113","ID" : "12","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "13","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1","ID" : "14","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1","ID" : "15","Type" : "no"},]},]},
	{"Name" : "grp_backprop_Pipeline_RELU_loop11_fu_286","ID" : "16","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RELU_loop1","ID" : "17","Type" : "pipeline"},]},
	{"Name" : "grp_matrix_vector_product_with_bias_output_layer_1_fu_292","ID" : "18","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_matrix_vector_product_with_bias_output_layer_1_Pipeline_add_bias_to_activations_s_fu_159","ID" : "19","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "add_bias_to_activations_loop1","ID" : "20","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1","ID" : "21","Type" : "no",
			"SubLoops" : [
			{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1","ID" : "22","Type" : "no"},]},]},
	{"Name" : "grp_backprop_Pipeline_RELU_loop12_fu_304","ID" : "23","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "RELU_loop1","ID" : "24","Type" : "pipeline"},]},
	{"Name" : "grp_backprop_Pipeline_soft_max_loop1_fu_320","ID" : "25","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "soft_max_loop1","ID" : "26","Type" : "pipeline"},]},
	{"Name" : "grp_backprop_Pipeline_soft_max_loop2_fu_328","ID" : "27","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "soft_max_loop2","ID" : "28","Type" : "pipeline"},]},
	{"Name" : "grp_backprop_Pipeline_take_difference_loop1_fu_342","ID" : "29","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "take_difference_loop1","ID" : "30","Type" : "pipeline"},]},
	{"Name" : "grp_get_delta_matrix_weights3_fu_361","ID" : "31","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights3_loop1","ID" : "32","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights3_loop1_1","ID" : "33","Type" : "no"},]},]},
	{"Name" : "grp_get_oracle_activations2_1_fu_370","ID" : "34","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_oracle_activations2_loop1","ID" : "35","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_oracle_activations2_loop1_1","ID" : "36","Type" : "no"},]},]},
	{"Name" : "grp_get_delta_matrix_weights2_fu_381","ID" : "37","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights2_loop1","ID" : "38","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights2_loop1_1","ID" : "39","Type" : "no"},]},]},
	{"Name" : "grp_get_oracle_activations1_1_fu_388","ID" : "40","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_oracle_activations1_loop1","ID" : "41","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_oracle_activations1_loop1_1","ID" : "42","Type" : "no"},]},]},
	{"Name" : "grp_get_delta_matrix_weights1_1_fu_397","ID" : "43","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights1_loop1","ID" : "44","Type" : "no",
			"SubLoops" : [
			{"Name" : "get_delta_matrix_weights1_loop1_1","ID" : "45","Type" : "no"},]},]},
	{"Name" : "grp_update_weights_1_fu_406","ID" : "46","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "update_weights_loop1","ID" : "47","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop1_1","ID" : "48","Type" : "no"},]},
			{"Name" : "update_weights_loop2","ID" : "49","Type" : "no"},
			{"Name" : "update_weights_loop3","ID" : "50","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop3_1","ID" : "51","Type" : "no"},]},
			{"Name" : "update_weights_loop4","ID" : "52","Type" : "no"},
			{"Name" : "update_weights_loop5","ID" : "53","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop5_1","ID" : "54","Type" : "no"},]},
			{"Name" : "update_weights_loop6","ID" : "55","Type" : "no"},
			{"Name" : "update_weights_loop7","ID" : "56","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop7_1","ID" : "57","Type" : "no"},]},
			{"Name" : "update_weights_loop8","ID" : "58","Type" : "no"},
			{"Name" : "update_weights_loop9","ID" : "59","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop9_1","ID" : "60","Type" : "no"},]},
			{"Name" : "update_weights_loop10","ID" : "61","Type" : "no"},
			{"Name" : "update_weights_loop11","ID" : "62","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop11_1","ID" : "63","Type" : "no"},]},
			{"Name" : "update_weights_loop12","ID" : "64","Type" : "no"},]},]},]
}]}