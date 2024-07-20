set ModuleHierarchy {[{
"Name" : "face_detect","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "L1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_face_detect_Pipeline_nearestNeighborL1_nearestNeighborL1_1_fu_202","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "nearestNeighborL1_nearestNeighborL1_1","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "grp_processImage_fu_213","ID" : "4","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_processImage_Pipeline_VITIS_LOOP_306_1_VITIS_LOOP_311_2_fu_259","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_306_1_VITIS_LOOP_311_2","ID" : "6","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "Pixely","ID" : "7","Type" : "no",
			"SubLoops" : [
			{"Name" : "Pixelx","ID" : "8","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_cascadeClassifier_fu_269","ID" : "9","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_cascadeClassifier_Pipeline_VITIS_LOOP_379_1_fu_281","ID" : "10","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_379_1","ID" : "11","Type" : "pipeline"},]},],
						"SubLoops" : [
						{"Name" : "Stages","ID" : "12","Type" : "no",
						"SubInsts" : [
						{"Name" : "grp_cascadeClassifier_Pipeline_Filters_fu_287","ID" : "13","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "Filters","ID" : "14","Type" : "pipeline"},]},]},]},]},]},]},]},]
}]}