set ModuleHierarchy {[{
"Name" : "Gsm_LPC_Analysis","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_Autocorrelation_fu_101","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "gsm_norm","ID" : "2","Type" : "sequential"},],
		"SubLoops" : [
		{"Name" : "Autocorrelation_label0","ID" : "3","Type" : "no",
		"SubInsts" : [
		{"Name" : "gsm_abs","ID" : "4","Type" : "pipeline"},]},
		{"Name" : "Autocorrelation_label1","ID" : "5","Type" : "no",
		"SubInsts" : [
		{"Name" : "gsm_mult_r","ID" : "6","Type" : "sequential"},]},
		{"Name" : "Autocorrelation_label2","ID" : "7","Type" : "no"},
		{"Name" : "Autocorrelation_label3","ID" : "8","Type" : "no"},
		{"Name" : "Autocorrelation_label4","ID" : "9","Type" : "no"},
		{"Name" : "Autocorrelation_label5","ID" : "10","Type" : "no"},]},
	{"Name" : "grp_Reflection_coefficients_fu_111","ID" : "11","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "gsm_norm","ID" : "12","Type" : "sequential"},],
		"SubLoops" : [
		{"Name" : "Reflection_coefficients_label0","ID" : "13","Type" : "no"},
		{"Name" : "Reflection_coefficients_label1","ID" : "14","Type" : "no"},
		{"Name" : "Reflection_coefficients_label2","ID" : "15","Type" : "no"},
		{"Name" : "Reflection_coefficients_label3","ID" : "16","Type" : "no"},
		{"Name" : "Reflection_coefficients_label4","ID" : "17","Type" : "no",
		"SubInsts" : [
		{"Name" : "gsm_abs","ID" : "18","Type" : "pipeline"},
		{"Name" : "grp_gsm_div_fu_290","ID" : "19","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "gsm_div_label0","ID" : "20","Type" : "no"},]},
		{"Name" : "gsm_mult_r","ID" : "21","Type" : "sequential"},
		{"Name" : "gsm_add","ID" : "22","Type" : "sequential"},],
		"SubLoops" : [
		{"Name" : "Reflection_coefficients_label5","ID" : "23","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_gsm_mult_r_fu_305","ID" : "24","Type" : "sequential"},
			{"Name" : "gsm_add","ID" : "25","Type" : "sequential"},]},]},
		{"Name" : "Reflection_coefficients_label6","ID" : "26","Type" : "no"},]},
	{"Name" : "grp_Quantization_and_coding_fu_126","ID" : "27","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_gsm_mult_fu_195","ID" : "28","Type" : "sequential"},
		{"Name" : "grp_gsm_mult_fu_203","ID" : "29","Type" : "sequential"},
		{"Name" : "gsm_add","ID" : "30","Type" : "sequential"},
		{"Name" : "gsm_add","ID" : "31","Type" : "sequential"},
		{"Name" : "grp_gsm_add_fu_230","ID" : "32","Type" : "sequential"},
		{"Name" : "grp_gsm_add_fu_237","ID" : "33","Type" : "sequential"},]},],
"SubLoops" : [
	{"Name" : "Transformation_to_Log_Area_Ratios_label0","ID" : "34","Type" : "pipeline",
	"SubInsts" : [
	{"Name" : "temp_37_gsm_abs_fu_120","ID" : "35","Type" : "pipeline"},]},]
}]}