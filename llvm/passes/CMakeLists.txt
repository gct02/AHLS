add_llvm_loadable_module( libLLVMAHLS
	UpdateMD.cpp
	RemoveIOFCall.cpp
	Profiling.cpp
	PreprocessVitisIR.cpp
	BinOpTrace.cpp
	VariableToConstant.cpp
	DFG.cpp
	AddDirectivesMetadata.cpp
  )

target_link_libraries(libLLVMAHLS)
