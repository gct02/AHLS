set ModuleHierarchy {[{
"Name" : "fft1D_512","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_fft1D_512_Pipeline_twiddles_fu_2005","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "twiddles","ID" : "3","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "sin_or_cos_double_s","ID" : "4","Type" : "pipeline"},
			{"Name" : "sin_or_cos_double_s","ID" : "5","Type" : "pipeline"},]},]},]},
	{"Name" : "loop2","ID" : "6","Type" : "no"},
	{"Name" : "loop3","ID" : "7","Type" : "no"},
	{"Name" : "loop4","ID" : "8","Type" : "no"},
	{"Name" : "loop5","ID" : "9","Type" : "no"},
	{"Name" : "loop6","ID" : "10","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_fft1D_512_Pipeline_twiddles1_fu_2026","ID" : "11","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "twiddles","ID" : "12","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "sin_or_cos_double_s","ID" : "13","Type" : "pipeline"},
			{"Name" : "sin_or_cos_double_s","ID" : "14","Type" : "pipeline"},]},]},]},
	{"Name" : "loop7","ID" : "15","Type" : "no"},
	{"Name" : "loop8","ID" : "16","Type" : "no"},
	{"Name" : "loop9","ID" : "17","Type" : "no"},
	{"Name" : "loop10","ID" : "18","Type" : "no"},
	{"Name" : "loop11","ID" : "19","Type" : "no"},]
}]}