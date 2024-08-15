set ModuleHierarchy {[{
"Name" : "main","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_24_1_fu_122","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_24_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_46_2_fu_141","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_46_2","ID" : "4","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "loop_0","ID" : "5","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_main_Pipeline_loop_1_fu_132","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_1","ID" : "7","Type" : "pipeline"},]},]},
	{"Name" : "loop_0","ID" : "8","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_main_Pipeline_loop_11_fu_148","ID" : "9","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_1","ID" : "10","Type" : "pipeline"},]},]},]
}]}