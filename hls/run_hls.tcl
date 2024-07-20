# Set variable to select which benchmark to execute
set bench_exec 3

if { $bench_exec == 1 } { # Face detection
	# Create a project
	open_project hls/vitis_projects/rosetta/face_detect -reset

	add_files { benchmarks/rosetta/face-detection/src/face_detect.cpp }
	add_files -tb {
		benchmarks/rosetta/face-detection/src/face_detect_host.cpp 
		benchmarks/rosetta/face-detection/src/iolib/populate_io.cpp
		benchmarks/rosetta/face-detection/src/image.cpp }

	set_top face_detect
} elseif { $bench_exec == 2 } { # Digit recognition
	# Create a project
	open_project hls/vitis_projects/rosetta/digitrec -reset

	add_files { benchmarks/rosetta/digit-recognition/src/digitrec.cpp }
	add_files -tb {
		benchmarks/rosetta/digit-recognition/src/digitrec_host.cpp
		benchmarks/rosetta/digit-recognition/src/iolib/populate_io.cpp }

	set_top DigitRec 
} elseif { $bench_exec == 3 } { # 3D rendering
	# Create a project
	open_project hls/vitis_projects/rosetta/rendering -reset

	add_files { benchmarks/rosetta/3d-rendering/src/rendering.cpp }
	add_files -tb {
		benchmarks/rosetta/3d-rendering/src/rendering_host.cpp
		benchmarks/rosetta/3d-rendering/src/iolib/populate_io.cpp }

	set_top rendering
} elseif { $bench_exec == 4 } { # Spam filter
	# Create a project
	open_project hls/vitis_projects/rosetta/spam -reset

	add_files { benchmarks/rosetta/spam-filter/src/sgd.cpp }
	add_files -tb {
		benchmarks/rosetta/spam-filter/src/spam_filter_host.cpp
		benchmarks/rosetta/spam-filter/src/iolib/populate_io.cpp }

	set_top SgdLR
} elseif { $bench_exec == 5 } { # ADPCM
	# Create a project
	open_project hls/vitis_projects/chstone/adpcm -reset

	add_files { benchmarks/chstone/adpcm/src/adpcm.c }
	add_files -tb { 
		benchmarks/chstone/adpcm/src/adpcm_host.c
		benchmarks/chstone/adpcm/src/iolib/populate_io.c }

	set_top adpcm_main
} elseif { $bench_exec == 6 } { # JPEG
	# Create a project
	open_project hls/vitis_projects/chstone/jpeg -reset

	add_files { 
		benchmarks/chstone/jpeg/src/jpeg2bmp.c
		benchmarks/chstone/jpeg/src/jpeg_decode.c 
		benchmarks/chstone/jpeg/src/constants.h }

	add_files -tb {
		benchmarks/chstone/jpeg/src/jpeg_host.c
		benchmarks/chstone/jpeg/src/iolib/populate_io.c }

	set_top jpeg2bmp
} elseif { $bench_exec == 7 } { # DFSIN
	# Create a project
	open_project hls/vitis_projects/chstone/dfsin -reset

	add_files { 
		benchmarks/chstone/dfsin/src/dfsin.c
		benchmarks/chstone/dfsin/src/softfloat.c 
		benchmarks/chstone/dfsin/src/softfloat-macros
		benchmarks/chstone/dfsin/src/softfloat-specialize
		benchmarks/chstone/dfsin/src/SPARC-GCC.h
		benchmarks/chstone/dfsin/src/milieu.h }

	add_files -tb {
		benchmarks/chstone/dfsin/src/dfsin_host.c
		benchmarks/chstone/dfsin/src/iolib/populate_io.c }

	set_top local_sin
} else {
	exit
}

# Create a solution
open_solution -reset solution1 -flow_target vivado

# Define technology and clock rate
set_part { xc7z020clg400-1 }
create_clock -period 5 -name default

# Compile and runs pre-synthesis C simulation using the provided C test bench
# csim_design -argv "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/inputs/test/inputVec1.txt output.txt"

# Run Synthesis
csynth_design

# Run RTL Simulation
# cosim_design -argv "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/inputs/test/inputVec1.txt output.txt"

# Run RTL implementation
# export_design -evaluate verilog -format ip_catalog

exit