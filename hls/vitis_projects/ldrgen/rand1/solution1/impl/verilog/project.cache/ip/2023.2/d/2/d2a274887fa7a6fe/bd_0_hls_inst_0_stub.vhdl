-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Sun Jun 23 22:40:12 2024
-- Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_return : out STD_LOGIC_VECTOR ( 31 downto 0 );
    p : in STD_LOGIC_VECTOR ( 63 downto 0 );
    p_4 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    p_7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    p_9 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    p_13 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    p_15 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    p_21 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    p_23 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,ap_return[31:0],p[63:0],p_4[63:0],p_7[31:0],p_9[15:0],p_13[31:0],p_15[63:0],p_21[63:0],p_23[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "fn1,Vivado 2023.2";
begin
end;
