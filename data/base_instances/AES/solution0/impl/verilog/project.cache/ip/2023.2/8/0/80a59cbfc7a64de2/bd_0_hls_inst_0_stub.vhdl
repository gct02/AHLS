-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Fri Feb 28 00:10:46 2025
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
    statemt_ce0 : out STD_LOGIC;
    statemt_we0 : out STD_LOGIC;
    statemt_ce1 : out STD_LOGIC;
    statemt_we1 : out STD_LOGIC;
    key_ce0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_return : out STD_LOGIC_VECTOR ( 31 downto 0 );
    statemt_address0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    statemt_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    statemt_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    statemt_address1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    statemt_d1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    statemt_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    key_address0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    key_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "statemt_ce0,statemt_we0,statemt_ce1,statemt_we1,key_ce0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,ap_return[31:0],statemt_address0[4:0],statemt_d0[31:0],statemt_q0[31:0],statemt_address1[4:0],statemt_d1[31:0],statemt_q1[31:0],key_address0[4:0],key_q0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "aes_main,Vivado 2023.2";
begin
end;
