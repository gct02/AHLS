set ModuleHierarchy {[{
"Name" : "adpcm_main","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_reset_fu_243","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "reset_label4","ID" : "2","Type" : "no"},
		{"Name" : "reset_label5","ID" : "3","Type" : "no"},
		{"Name" : "reset_label6","ID" : "4","Type" : "no"},
		{"Name" : "reset_label7","ID" : "5","Type" : "no"},]},],
"SubLoops" : [
	{"Name" : "adpcm_main_label12","ID" : "6","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_encode_fu_333","ID" : "7","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_filtez_fu_430","ID" : "8","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "filtez_label8","ID" : "9","Type" : "no"},]},
			{"Name" : "grp_quantl_fu_440","ID" : "10","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "quantl_label9","ID" : "11","Type" : "no"},]},
			{"Name" : "grp_upzero_fu_452","ID" : "12","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "13","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "14","Type" : "no"},]},
			{"Name" : "grp_upzero_fu_461","ID" : "15","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "16","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "17","Type" : "no"},]},],
			"SubLoops" : [
			{"Name" : "encode_label0","ID" : "18","Type" : "no"},
			{"Name" : "encode_label1","ID" : "19","Type" : "no"},]},]},
	{"Name" : "adpcm_main_label13","ID" : "20","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_decode_fu_399","ID" : "21","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_filtez_fu_433","ID" : "22","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "filtez_label8","ID" : "23","Type" : "no"},]},
			{"Name" : "grp_upzero_fu_443","ID" : "24","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "25","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "26","Type" : "no"},]},],
			"SubLoops" : [
			{"Name" : "decode_label2","ID" : "27","Type" : "no"},
			{"Name" : "decode_label3","ID" : "28","Type" : "no"},]},]},]
}]}