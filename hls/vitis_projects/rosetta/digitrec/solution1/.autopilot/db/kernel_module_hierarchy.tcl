set ModuleHierarchy {[{
"Name" : "DigitRec","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "TEST_LOOP","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_DigitRec_Pipeline_SET_KNN_SET_fu_156","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "SET_KNN_SET","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "grp_DigitRec_Pipeline_3_fu_172","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "grp_DigitRec_Pipeline_TRAINING_LOOP_fu_177","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "TRAINING_LOOP","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "grp_DigitRec_Pipeline_VITIS_LOOP_69_1_fu_201","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_69_1","ID" : "9","Type" : "pipeline"},]},
	{"Name" : "grp_DigitRec_Pipeline_VITIS_LOOP_72_2_fu_209","ID" : "10","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_72_2","ID" : "11","Type" : "pipeline"},]},]},]
}]}