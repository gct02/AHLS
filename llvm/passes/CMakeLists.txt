add_llvm_loadable_module(libAHLS
	UpdateMD.cpp
	AddDirectivesMD.cpp
	BuildGATModelDFG.cpp
	PreprocessVitisIR.cpp
	Profiling.cpp
	RemoveIOFCall.cpp
	V2C.cpp
  )

target_link_libraries(libAHLS)
