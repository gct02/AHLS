set ModuleHierarchy {[{
"Name" : "Gsm_LPC_Analysis","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_Autocorrelation_fu_40","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_Autocorrelation_Pipeline_VITIS_LOOP_65_1_fu_532","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_65_1","ID" : "3","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "Autocorrelation_label0","ID" : "4","Type" : "no"},
		{"Name" : "Autocorrelation_label2","ID" : "5","Type" : "no"},
		{"Name" : "Autocorrelation_label3","ID" : "6","Type" : "no"},
		{"Name" : "Autocorrelation_label4","ID" : "7","Type" : "no"},
		{"Name" : "Autocorrelation_label5","ID" : "8","Type" : "no"},]},
	{"Name" : "grp_Reflection_coefficients_fu_50","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Reflection_coefficients_label0","ID" : "10","Type" : "no"},
		{"Name" : "Reflection_coefficients_label1","ID" : "11","Type" : "no"},
		{"Name" : "Reflection_coefficients_label2","ID" : "12","Type" : "no"},
		{"Name" : "Reflection_coefficients_label3","ID" : "13","Type" : "no"},
		{"Name" : "Reflection_coefficients_label4","ID" : "14","Type" : "no",
		"SubLoops" : [
		{"Name" : "gsm_div_label0","ID" : "15","Type" : "no"},
		{"Name" : "Reflection_coefficients_label5","ID" : "16","Type" : "no"},]},
		{"Name" : "Reflection_coefficients_label6","ID" : "17","Type" : "no"},]},
	{"Name" : "grp_Transformation_to_Log_Area_Ratios_fu_59","ID" : "18","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Transformation_to_Log_Area_Ratios_label0","ID" : "19","Type" : "no"},]},
	{"Name" : "grp_Quantization_and_coding_fu_65","ID" : "20","Type" : "sequential"},]
}]}