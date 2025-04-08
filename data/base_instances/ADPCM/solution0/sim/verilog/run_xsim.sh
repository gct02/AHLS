
/tools/Xilinx/Vivado/2023.2/bin/xelab xil_defaultlib.apatb_adpcm_main_top glbl -Oenable_linking_all_libraries  -prj adpcm_main.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_1_16 -L floating_point_v7_0_21 --lib "ieee_proposed=./ieee_proposed" -s adpcm_main -debug all
/tools/Xilinx/Vivado/2023.2/bin/xsim --noieeewarnings adpcm_main -tclbatch adpcm_main.tcl -view adpcm_main_dataflow_ana.wcfg -protoinst adpcm_main.protoinst

