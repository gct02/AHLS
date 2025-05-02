cmake_minimum_required(VERSION 3.4)
project(ArrayArgPlugin)

set(HLS_LLVM_ROOT "$ENV{HOME}/Documents/hls-llvm-project")
set(LLVM_CONFIG "${HLS_LLVM_ROOT}/hls-build/bin/llvm-config")

# Get LLVM include and library directories using llvm-config
execute_process(
    COMMAND ${LLVM_CONFIG} --includedir
    OUTPUT_VARIABLE LLVM_INCLUDE_DIR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
execute_process(
    COMMAND ${LLVM_CONFIG} --libdir
    OUTPUT_VARIABLE LLVM_LIBRARY_DIR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

find_package(Clang REQUIRED CONFIG PATHS ${HLS_LLVM_ROOT}/hls-build/tools/clang/cmake/modules/CMakeFiles NO_DEFAULT_PATH)
find_package(LLVM REQUIRED CONFIG PATHS ${HLS_LLVM_ROOT}/hls-build/cmake/modules/CMakeFiles NO_DEFAULT_PATH)

# Include the LLVM and Clang directories
include_directories(${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Include LLVM headers
include_directories(${LLVM_INCLUDE_DIR})
include_directories("${HLS_LLVM_ROOT}/clang/include")
include_directories("${HLS_LLVM_ROOT}/llvm/include")
include_directories("${HLS_LLVM_ROOT}/hls-build/include")
include_directories("${HLS_LLVM_ROOT}/hls-build/tools/clang/include")

# Link against LLVM libraries
link_directories(${LLVM_LIBRARY_DIR})

# Get required LLVM components using llvm-config
execute_process(
    COMMAND ${LLVM_CONFIG} --libs
    OUTPUT_VARIABLE LLVM_LIBS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
execute_process(
    COMMAND ${LLVM_CONFIG} --system-libs
    OUTPUT_VARIABLE LLVM_SYSTEM_LIBS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Define the plugin source file
add_library(ArrayArgPlugin SHARED src/ArrayArgPlugin.cpp)

set_target_properties(ArrayArgPlugin PROPERTIES LINKER_LANGUAGE CXX)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Link the plugin against the LLVM libraries
target_link_libraries(ArrayArgPlugin
    ${LLVM_LIBS}
    ${LLVM_SYSTEM_LIBS}
    clangAST
    clangFrontend
    clangRewrite
    clangBasic
    clangTooling
    clangASTMatchers
    LLVMCore
    LLVMSupport
)
