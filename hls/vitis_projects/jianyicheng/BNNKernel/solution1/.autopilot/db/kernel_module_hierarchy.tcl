set ModuleHierarchy {[{
"Name" : "main","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_16_1_fu_96","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_16_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_32_2_fu_138","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_32_2","ID" : "4","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_16_1","ID" : "5","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_14_1_fu_114","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_14_1","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_14_11_fu_123","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_14_1","ID" : "9","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_15_1","ID" : "10","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_16_2_fu_130","ID" : "11","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_16_2","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "grp_main_Pipeline_VITIS_LOOP_23_3_fu_145","ID" : "13","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_23_3","ID" : "14","Type" : "pipeline"},]},]},]
}]}