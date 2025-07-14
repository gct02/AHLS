-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jul  9 04:10:48 2025
-- Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu50-fsvh2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    indata_ce0 : out STD_LOGIC;
    in_i_ce0 : out STD_LOGIC;
    outdata_ce0 : out STD_LOGIC;
    outdata_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    indata_address0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    indata_q0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_i_address0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    in_i_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    outdata_address0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    outdata_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "indata_ce0,in_i_ce0,outdata_ce0,outdata_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,indata_address0[13:0],indata_q0[7:0],in_i_address0[0:0],in_i_q0[31:0],outdata_address0[2:0],outdata_d0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "sha_stream,Vivado 2023.2";
begin
end;
