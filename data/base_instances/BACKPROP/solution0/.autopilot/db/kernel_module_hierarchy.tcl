set ModuleHierarchy {[{
"Name" : "backprop","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "backprop_loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_update_weights_1_fu_1234","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "update_weights_loop1","ID" : "3","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop1_1","ID" : "4","Type" : "no"},]},
			{"Name" : "update_weights_loop2","ID" : "5","Type" : "no"},
			{"Name" : "update_weights_loop3","ID" : "6","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop3_1","ID" : "7","Type" : "no"},]},
			{"Name" : "update_weights_loop4","ID" : "8","Type" : "no"},
			{"Name" : "update_weights_loop5","ID" : "9","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop5_1","ID" : "10","Type" : "no"},]},
			{"Name" : "update_weights_loop6","ID" : "11","Type" : "no"},
			{"Name" : "update_weights_loop7","ID" : "12","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop7_1","ID" : "13","Type" : "no"},]},
			{"Name" : "update_weights_loop8","ID" : "14","Type" : "no"},
			{"Name" : "update_weights_loop9","ID" : "15","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop9_1","ID" : "16","Type" : "no"},]},
			{"Name" : "update_weights_loop10","ID" : "17","Type" : "no"},
			{"Name" : "update_weights_loop11","ID" : "18","Type" : "no",
			"SubLoops" : [
			{"Name" : "update_weights_loop11_1","ID" : "19","Type" : "no"},]},
			{"Name" : "update_weights_loop12","ID" : "20","Type" : "no"},]},],
	"SubLoops" : [
	{"Name" : "backprop_loop1_1","ID" : "21","Type" : "no"},
	{"Name" : "matrix_vector_product_with_bias_input_layer_loop1","ID" : "22","Type" : "no",
		"SubLoops" : [
		{"Name" : "matrix_vector_product_with_bias_input_layer_loop1_1","ID" : "23","Type" : "no"},]},
	{"Name" : "add_bias_to_activations_loop1","ID" : "24","Type" : "no"},
	{"Name" : "RELU_loop1","ID" : "25","Type" : "no"},
	{"Name" : "matrix_vector_product_with_bias_second_layer_loop1","ID" : "26","Type" : "no",
		"SubLoops" : [
		{"Name" : "matrix_vector_product_with_bias_second_layer_loop1_1","ID" : "27","Type" : "no"},]},
	{"Name" : "add_bias_to_activations_loop1","ID" : "28","Type" : "no"},
	{"Name" : "RELU_loop1","ID" : "29","Type" : "no"},
	{"Name" : "matrix_vector_product_with_bias_output_layer_loop1","ID" : "30","Type" : "no",
		"SubLoops" : [
		{"Name" : "matrix_vector_product_with_bias_output_layer_loop1_1","ID" : "31","Type" : "no"},]},
	{"Name" : "add_bias_to_activations_loop1","ID" : "32","Type" : "no"},
	{"Name" : "RELU_loop1","ID" : "33","Type" : "no"},
	{"Name" : "soft_max_loop1","ID" : "34","Type" : "no"},
	{"Name" : "soft_max_loop2","ID" : "35","Type" : "no"},
	{"Name" : "take_difference_loop1","ID" : "36","Type" : "no"},
	{"Name" : "get_delta_matrix_weights3_loop1","ID" : "37","Type" : "no",
		"SubLoops" : [
		{"Name" : "get_delta_matrix_weights3_loop1_1","ID" : "38","Type" : "no"},]},
	{"Name" : "get_oracle_activations2_loop1","ID" : "39","Type" : "no",
		"SubLoops" : [
		{"Name" : "get_oracle_activations2_loop1_1","ID" : "40","Type" : "no"},]},
	{"Name" : "get_delta_matrix_weights2_loop1","ID" : "41","Type" : "no",
		"SubLoops" : [
		{"Name" : "get_delta_matrix_weights2_loop1_1","ID" : "42","Type" : "no"},]},
	{"Name" : "get_oracle_activations1_loop1","ID" : "43","Type" : "no",
		"SubLoops" : [
		{"Name" : "get_oracle_activations1_loop1_1","ID" : "44","Type" : "no"},]},
	{"Name" : "get_delta_matrix_weights1_loop1","ID" : "45","Type" : "no",
		"SubLoops" : [
		{"Name" : "get_delta_matrix_weights1_loop1_1","ID" : "46","Type" : "no"},]},]},]
}]}