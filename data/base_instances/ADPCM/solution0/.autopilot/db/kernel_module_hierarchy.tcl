set ModuleHierarchy {[{
"Name" : "adpcm_main","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "reset_label4","ID" : "1","Type" : "no"},
	{"Name" : "reset_label5","ID" : "2","Type" : "no"},
	{"Name" : "reset_label6","ID" : "3","Type" : "no"},
	{"Name" : "reset_label7","ID" : "4","Type" : "no"},
	{"Name" : "adpcm_main_label12","ID" : "5","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_encode_fu_453","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "encode_label0","ID" : "7","Type" : "no"},
			{"Name" : "encode_label1","ID" : "8","Type" : "no"},
			{"Name" : "filtez_label8","ID" : "9","Type" : "no"},
			{"Name" : "quantl_label9","ID" : "10","Type" : "no"},
			{"Name" : "upzero_label10","ID" : "11","Type" : "no"},
			{"Name" : "upzero_label11","ID" : "12","Type" : "no"},
			{"Name" : "filtez_label8","ID" : "13","Type" : "no"},
			{"Name" : "upzero_label10","ID" : "14","Type" : "no"},
			{"Name" : "upzero_label11","ID" : "15","Type" : "no"},]},]},
	{"Name" : "adpcm_main_label13","ID" : "16","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_decode_fu_519","ID" : "17","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "filtez_label8","ID" : "18","Type" : "no"},
			{"Name" : "upzero_label10","ID" : "19","Type" : "no"},
			{"Name" : "upzero_label11","ID" : "20","Type" : "no"},
			{"Name" : "filtez_label8","ID" : "21","Type" : "no"},
			{"Name" : "upzero_label10","ID" : "22","Type" : "no"},
			{"Name" : "upzero_label11","ID" : "23","Type" : "no"},
			{"Name" : "decode_label2","ID" : "24","Type" : "no"},
			{"Name" : "decode_label3","ID" : "25","Type" : "no"},]},]},]
}]}