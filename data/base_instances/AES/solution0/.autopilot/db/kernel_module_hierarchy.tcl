set ModuleHierarchy {[{
"Name" : "aes_main","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_encrypt_fu_34","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "KeySchedule_label4","ID" : "2","Type" : "no",
		"SubLoops" : [
		{"Name" : "KeySchedule_label5","ID" : "3","Type" : "no"},]},
		{"Name" : "KeySchedule_label6","ID" : "4","Type" : "no",
		"SubLoops" : [
		{"Name" : "KeySchedule_label9","ID" : "5","Type" : "no"},]},
		{"Name" : "AddRoundKey_label0","ID" : "6","Type" : "no"},
		{"Name" : "encrypt_label1","ID" : "7","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_ByteSub_ShiftRow_fu_461","ID" : "8","Type" : "sequential"},
		{"Name" : "grp_MixColumn_AddRoundKey_fu_469","ID" : "9","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "MixColumn_AddRoundKey_label0","ID" : "10","Type" : "no"},
				{"Name" : "MixColumn_AddRoundKey_label1","ID" : "11","Type" : "no"},]},]},
		{"Name" : "AddRoundKey_label0","ID" : "12","Type" : "no"},]},
	{"Name" : "grp_decrypt_fu_50","ID" : "13","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_InversShiftRow_ByteSub_fu_461","ID" : "14","Type" : "sequential"},],
		"SubLoops" : [
		{"Name" : "KeySchedule_label4","ID" : "15","Type" : "no",
		"SubLoops" : [
		{"Name" : "KeySchedule_label5","ID" : "16","Type" : "no"},]},
		{"Name" : "KeySchedule_label6","ID" : "17","Type" : "no",
		"SubLoops" : [
		{"Name" : "KeySchedule_label9","ID" : "18","Type" : "no"},]},
		{"Name" : "AddRoundKey_label0","ID" : "19","Type" : "no"},
		{"Name" : "decrypt_label4","ID" : "20","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_AddRoundKey_InversMixColumn_fu_469","ID" : "21","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "AddRoundKey_InversMixColumn_label2","ID" : "22","Type" : "no"},
				{"Name" : "AddRoundKey_InversMixColumn_label0","ID" : "23","Type" : "no",
				"SubLoops" : [
				{"Name" : "AddRoundKey_InversMixColumn_label1","ID" : "24","Type" : "no"},]},
				{"Name" : "AddRoundKey_InversMixColumn_label3","ID" : "25","Type" : "no"},]},]},
		{"Name" : "AddRoundKey_label0","ID" : "26","Type" : "no"},]},]
}]}