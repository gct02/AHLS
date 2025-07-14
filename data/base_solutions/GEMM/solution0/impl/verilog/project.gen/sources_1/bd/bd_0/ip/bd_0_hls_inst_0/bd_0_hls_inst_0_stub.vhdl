-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jul  9 03:46:38 2025
-- Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/GEMM/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu50-fsvh2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    m1_ce0 : out STD_LOGIC;
    m2_ce0 : out STD_LOGIC;
    prod_ce0 : out STD_LOGIC;
    prod_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    m1_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m1_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m2_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m2_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    prod_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    prod_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    prod_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "m1_ce0,m2_ce0,prod_ce0,prod_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,m1_address0[11:0],m1_q0[63:0],m2_address0[11:0],m2_q0[63:0],prod_address0[11:0],prod_d0[63:0],prod_q0[63:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bbgemm,Vivado 2023.2";
begin
end;
