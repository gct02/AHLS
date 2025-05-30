set ModuleHierarchy {[{
"Name" : "Gsm_LPC_Analysis","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_Autocorrelation_fu_103","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_Autocorrelation_Pipeline_Autocorrelation_label0_fu_359","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Autocorrelation_label0","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_366","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_65_1","ID" : "5","Type" : "pipeline"},]},
		{"Name" : "grp_Autocorrelation_Pipeline_Autocorrelation_label2_fu_373","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Autocorrelation_label2","ID" : "7","Type" : "pipeline"},]},
		{"Name" : "grp_Autocorrelation_Pipeline_Autocorrelation_label3_fu_379","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Autocorrelation_label3","ID" : "9","Type" : "pipeline"},]},
		{"Name" : "grp_Autocorrelation_Pipeline_Autocorrelation_label4_fu_404","ID" : "10","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Autocorrelation_label4","ID" : "11","Type" : "pipeline"},]},
		{"Name" : "grp_Autocorrelation_Pipeline_Autocorrelation_label5_fu_410","ID" : "12","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Autocorrelation_label5","ID" : "13","Type" : "pipeline"},]},]},
	{"Name" : "grp_Reflection_coefficients_fu_113","ID" : "14","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Reflection_coefficients_label0","ID" : "15","Type" : "no"},
		{"Name" : "Reflection_coefficients_label1","ID" : "16","Type" : "no"},
		{"Name" : "Reflection_coefficients_label2","ID" : "17","Type" : "no"},
		{"Name" : "Reflection_coefficients_label3","ID" : "18","Type" : "no"},
		{"Name" : "Reflection_coefficients_label4","ID" : "19","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_Reflection_coefficients_Pipeline_gsm_div_label0_fu_402","ID" : "20","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "gsm_div_label0","ID" : "21","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "Reflection_coefficients_label5","ID" : "22","Type" : "no"},]},
		{"Name" : "Reflection_coefficients_label6","ID" : "23","Type" : "no"},]},
	{"Name" : "grp_Quantization_and_coding_fu_122","ID" : "24","Type" : "sequential"},],
"SubLoops" : [
	{"Name" : "Transformation_to_Log_Area_Ratios_label0","ID" : "25","Type" : "pipeline"},]
}]}