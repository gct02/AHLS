add_llvm_loadable_module(libAHLS
	UpdateMD.cpp
	HLSIRPrepForGNN.cpp
	HLSIRPrepForX86.cpp
	RemoveSpecFunctions.cpp
	SetHLSDirectivesMD.cpp
	ModuleDFGBuilder.cpp
	RenameValues.cpp
	Profiling.cpp
	RemoveIOFCall.cpp
	V2C.cpp
  )
pkg_search_module(JSONCPP jsoncpp)
target_link_libraries(libAHLS PRIVATE ${JSONCPP_LIBRARIES})