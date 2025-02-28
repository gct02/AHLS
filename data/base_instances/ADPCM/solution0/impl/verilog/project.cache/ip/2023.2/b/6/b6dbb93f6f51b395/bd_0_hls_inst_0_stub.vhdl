-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Feb 27 23:45:16 2025
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
    in_data_ce0 : out STD_LOGIC;
    in_data_ce1 : out STD_LOGIC;
    encoded_ce0 : out STD_LOGIC;
    encoded_we0 : out STD_LOGIC;
    decoded_ce0 : out STD_LOGIC;
    decoded_we0 : out STD_LOGIC;
    decoded_ce1 : out STD_LOGIC;
    decoded_we1 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    in_data_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    in_data_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_data_address1 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    in_data_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    encoded_address0 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    encoded_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    encoded_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    decoded_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    decoded_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    decoded_address1 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    decoded_d1 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "in_data_ce0,in_data_ce1,encoded_ce0,encoded_we0,decoded_ce0,decoded_we0,decoded_ce1,decoded_we1,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,in_data_address0[6:0],in_data_q0[31:0],in_data_address1[6:0],in_data_q1[31:0],encoded_address0[5:0],encoded_d0[31:0],encoded_q0[31:0],decoded_address0[6:0],decoded_d0[31:0],decoded_address1[6:0],decoded_d1[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "adpcm_main,Vivado 2023.2";
begin
end;
