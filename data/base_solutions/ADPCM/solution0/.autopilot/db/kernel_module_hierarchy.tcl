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
			{"Name" : "grp_filtez_fu_318","ID" : "8","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "filtez_label8","ID" : "9","Type" : "no"},]},
			{"Name" : "filtep","ID" : "10","Type" : "sequential"},
			{"Name" : "grp_quantl_fu_336","ID" : "11","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "wd_abs_r_fu_116","ID" : "12","Type" : "sequential"},],
				"SubLoops" : [
				{"Name" : "quantl_label9","ID" : "13","Type" : "no"},]},
			{"Name" : "tmp_9_abs_r_fu_348","ID" : "14","Type" : "sequential"},
			{"Name" : "logscl","ID" : "15","Type" : "sequential"},
			{"Name" : "grp_upzero_fu_361","ID" : "16","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "17","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "18","Type" : "no"},]},
			{"Name" : "grp_upzero_fu_370","ID" : "19","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "20","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "21","Type" : "no"},]},
			{"Name" : "uppol2","ID" : "22","Type" : "sequential"},
			{"Name" : "grp_uppol2_fu_388","ID" : "23","Type" : "sequential"},
			{"Name" : "logsch","ID" : "24","Type" : "sequential"},
			{"Name" : "scalel","ID" : "25","Type" : "sequential"},
			{"Name" : "uppol1","ID" : "26","Type" : "sequential"},
			{"Name" : "grp_uppol1_fu_422","ID" : "27","Type" : "sequential"},],
			"SubLoops" : [
			{"Name" : "encode_label0","ID" : "28","Type" : "no"},
			{"Name" : "encode_label1","ID" : "29","Type" : "no"},]},]},
	{"Name" : "adpcm_main_label13","ID" : "30","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_decode_fu_399","ID" : "31","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_filtez_fu_317","ID" : "32","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "filtez_label8","ID" : "33","Type" : "no"},]},
			{"Name" : "logscl","ID" : "34","Type" : "sequential"},
			{"Name" : "logsch","ID" : "35","Type" : "sequential"},
			{"Name" : "scalel","ID" : "36","Type" : "sequential"},
			{"Name" : "grp_upzero_fu_352","ID" : "37","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "upzero_label10","ID" : "38","Type" : "no"},
				{"Name" : "upzero_label11","ID" : "39","Type" : "no"},]},
			{"Name" : "uppol2","ID" : "40","Type" : "sequential"},
			{"Name" : "filtep","ID" : "41","Type" : "sequential"},
			{"Name" : "uppol1","ID" : "42","Type" : "sequential"},],
			"SubLoops" : [
			{"Name" : "decode_label2","ID" : "43","Type" : "no"},
			{"Name" : "decode_label3","ID" : "44","Type" : "no"},]},]},]
}]}