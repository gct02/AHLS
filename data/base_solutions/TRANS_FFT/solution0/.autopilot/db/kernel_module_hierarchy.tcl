set ModuleHierarchy {[{
"Name" : "fft1D_512","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_twiddles8_fu_1829","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "twiddles","ID" : "3","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_sin_or_cos_double_s_fu_109","ID" : "4","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_scaled_fixed2ieee_63_1_s_fu_314","ID" : "5","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112","ID" : "6","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "7","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119","ID" : "8","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "9","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131","ID" : "10","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "11","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143","ID" : "12","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "13","Type" : "pipeline"},]},]},]},
			{"Name" : "grp_sin_or_cos_double_s_fu_128","ID" : "14","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_scaled_fixed2ieee_63_1_s_fu_314","ID" : "15","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_1_fu_112","ID" : "16","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "17","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_2_fu_119","ID" : "18","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "19","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_3_fu_131","ID" : "20","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "21","Type" : "pipeline"},]},
						{"Name" : "grp_scaled_fixed2ieee_63_1_Pipeline_4_fu_143","ID" : "22","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "Loop 1","ID" : "23","Type" : "pipeline"},]},]},]},]},]},]},
	{"Name" : "loop2","ID" : "24","Type" : "no"},
	{"Name" : "loop3","ID" : "25","Type" : "no"},
	{"Name" : "loop4","ID" : "26","Type" : "no"},
	{"Name" : "loop5","ID" : "27","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_loady8_fu_1853","ID" : "28","Type" : "sequential"},]},
	{"Name" : "loop6","ID" : "29","Type" : "no"},
	{"Name" : "loop7","ID" : "30","Type" : "no"},
	{"Name" : "loop8","ID" : "31","Type" : "no"},
	{"Name" : "loop9","ID" : "32","Type" : "no"},
	{"Name" : "loop10","ID" : "33","Type" : "no"},
	{"Name" : "loop11","ID" : "34","Type" : "no"},]
}]}