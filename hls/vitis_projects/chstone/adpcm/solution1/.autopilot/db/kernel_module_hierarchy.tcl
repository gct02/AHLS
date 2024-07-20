set ModuleHierarchy {[{
"Name" : "adpcm_main","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_adpcm_main_Pipeline_reset_label4_fu_148","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "reset_label4","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_adpcm_main_Pipeline_reset_label5_fu_160","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "reset_label5","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_adpcm_main_Pipeline_reset_label6_fu_172","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "reset_label6","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_adpcm_main_Pipeline_reset_label7_fu_178","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "reset_label7","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "adpcm_main_label12","ID" : "10","Type" : "pipeline",
		"SubInsts" : [
		{"Name" : "grp_encode_fu_138","ID" : "11","Type" : "pipeline"},]},]},
	{"Name" : "grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "adpcm_main_label13","ID" : "13","Type" : "pipeline",
		"SubInsts" : [
		{"Name" : "grp_decode_fu_142","ID" : "14","Type" : "pipeline"},]},]},]
}]}