-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Sun Jun 23 07:20:11 2024
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
    data_ce0 : out STD_LOGIC;
    label_r_ce0 : out STD_LOGIC;
    theta_ce0 : out STD_LOGIC;
    theta_we0 : out STD_LOGIC;
    theta_ce1 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    data_address0 : out STD_LOGIC_VECTOR ( 16 downto 0 );
    data_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    label_r_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    label_r_q0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    theta_address0 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    theta_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    theta_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    theta_address1 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    theta_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_ce0,label_r_ce0,theta_ce0,theta_we0,theta_ce1,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,data_address0[16:0],data_q0[31:0],label_r_address0[6:0],label_r_q0[7:0],theta_address0[9:0],theta_d0[31:0],theta_q0[31:0],theta_address1[9:0],theta_q1[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "SgdLR,Vivado 2023.2";
begin
end;
