
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinoutgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/encoded_q0 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/encoded_d0 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/encoded_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/encoded_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/encoded_address0 -into $return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $coutputgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_d1 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_we1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_address1 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_d0 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/decoded_address0 -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinputgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_q1 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_address1 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_q0 -into $return_group -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/in_data_address0 -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_start -into $blocksiggroup
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_done -into $blocksiggroup
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_idle -into $blocksiggroup
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_adpcm_main_top/AESL_inst_adpcm_main/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_adpcm_main_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_adpcm_main_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_adpcm_main_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_adpcm_main_top/LENGTH_decoded -into $tb_portdepth_group -radix hex
add_wave /apatb_adpcm_main_top/LENGTH_encoded -into $tb_portdepth_group -radix hex
add_wave /apatb_adpcm_main_top/LENGTH_in_data -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinoutgroup]
add_wave /apatb_adpcm_main_top/encoded_q0 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/encoded_d0 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/encoded_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/encoded_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/encoded_address0 -into $tb_return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcoutputgroup]
add_wave /apatb_adpcm_main_top/decoded_d1 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/decoded_we1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/decoded_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/decoded_address1 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/decoded_d0 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/decoded_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/decoded_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/decoded_address0 -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinputgroup]
add_wave /apatb_adpcm_main_top/in_data_q1 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/in_data_ce1 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/in_data_address1 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/in_data_q0 -into $tb_return_group -radix hex
add_wave /apatb_adpcm_main_top/in_data_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_adpcm_main_top/in_data_address0 -into $tb_return_group -radix hex
save_wave_config adpcm_main.wcfg
run all
quit

