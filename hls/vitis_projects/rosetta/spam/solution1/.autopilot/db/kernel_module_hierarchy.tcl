set ModuleHierarchy {[{
"Name" : "SgdLR","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "EPOCH_TRAINING_INST","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_SgdLR_Pipeline_DOT_fu_93","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "DOT","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "grp_SgdLR_Pipeline_GRAD_fu_103","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GRAD","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "grp_SgdLR_Pipeline_UPDATE_fu_112","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "UPDATE","ID" : "7","Type" : "pipeline"},]},]},]
}]}