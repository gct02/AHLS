add_llvm_loadable_module(libDSE
	UpdateMD.cpp
	HLSIRPrepForGNN.cpp
	HLSIRPrepForX86.cpp
	SetHLSDirectivesMD.cpp
	ModuleDFGBuilder.cpp
	RenameValues.cpp
	Profiling.cpp
	RemoveIOFCall.cpp
	V2C.cpp
  )
pkg_search_module(JSONCPP jsoncpp)
target_link_libraries(libDSE PRIVATE ${JSONCPP_LIBRARIES})