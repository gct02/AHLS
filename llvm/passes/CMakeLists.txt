add_llvm_loadable_module( libAHLS
	UpdateMD.cpp
	RemoveIOFCall.cpp
	Profiling.cpp
	PreprocessVitisIR.cpp
	BinOpTrace.cpp
	V2C.cpp
	DFG.cpp
	AddDirectivesMD.cpp
  )

target_link_libraries(libAHLS)
