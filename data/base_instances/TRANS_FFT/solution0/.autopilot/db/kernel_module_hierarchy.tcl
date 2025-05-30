set ModuleHierarchy {[{
"Name" : "fft1D_512","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_fft1D_512_Pipeline_loop1_twiddles_fu_1550","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop1_twiddles","ID" : "2","Type" : "pipeline",
		"SubInsts" : [
		{"Name" : "sin_or_cos_double_s","ID" : "3","Type" : "pipeline"},]},]},
	{"Name" : "grp_fft1D_512_Pipeline_loop6_twiddles_fu_1580","ID" : "4","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop6_twiddles","ID" : "5","Type" : "pipeline",
		"SubInsts" : [
		{"Name" : "sin_or_cos_double_s","ID" : "6","Type" : "pipeline"},]},]},],
"SubLoops" : [
	{"Name" : "loop2","ID" : "7","Type" : "no"},
	{"Name" : "loop3","ID" : "8","Type" : "no"},
	{"Name" : "loop4","ID" : "9","Type" : "no"},
	{"Name" : "loop5","ID" : "10","Type" : "no"},
	{"Name" : "loop7","ID" : "11","Type" : "no"},
	{"Name" : "loop8","ID" : "12","Type" : "no"},
	{"Name" : "loop9","ID" : "13","Type" : "no"},
	{"Name" : "loop10","ID" : "14","Type" : "no"},
	{"Name" : "loop11","ID" : "15","Type" : "no"},]
}]}