set ModuleHierarchy {[{
"Name" : "fft1D_512","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "loop1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_twiddles8_fu_1971","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "twiddles","ID" : "3","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "grp_sin_or_cos_double_s_fu_119","ID" : "4","Type" : "pipeline"},
			{"Name" : "grp_sin_or_cos_double_s_fu_138","ID" : "5","Type" : "pipeline"},]},]},]},
	{"Name" : "loop2","ID" : "6","Type" : "no"},
	{"Name" : "loop3","ID" : "7","Type" : "no"},
	{"Name" : "loop4","ID" : "8","Type" : "no"},
	{"Name" : "loop5","ID" : "9","Type" : "no"},
	{"Name" : "loop6","ID" : "10","Type" : "no"},
	{"Name" : "loop7","ID" : "11","Type" : "no"},
	{"Name" : "loop8","ID" : "12","Type" : "no"},
	{"Name" : "loop9","ID" : "13","Type" : "no"},
	{"Name" : "loop10","ID" : "14","Type" : "no"},
	{"Name" : "loop11","ID" : "15","Type" : "no"},]
}]}