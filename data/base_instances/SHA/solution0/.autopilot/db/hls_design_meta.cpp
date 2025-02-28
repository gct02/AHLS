#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("indata_address0", 14, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("indata_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("indata_q0", 8, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("in_i_address0", 1, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("in_i_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("in_i_q0", 32, hls_in, 1, "ap_memory", "in_data", 1),
	Port_Property("outdata_address0", 3, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("outdata_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("outdata_we0", 1, hls_out, 2, "ap_memory", "mem_we", 1),
	Port_Property("outdata_d0", 32, hls_out, 2, "ap_memory", "mem_din", 1),
};
const char* HLS_Design_Meta::dut_name = "sha_stream";
