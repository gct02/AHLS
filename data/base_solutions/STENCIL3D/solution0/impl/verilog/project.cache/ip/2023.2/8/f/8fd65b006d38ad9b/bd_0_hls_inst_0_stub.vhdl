-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jul  2 18:49:09 2025
-- Host        : H410M-H-V3 running 64-bit Linux Mint 20.2
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
    C_ce0 : out STD_LOGIC;
    C_ce1 : out STD_LOGIC;
    orig_ce0 : out STD_LOGIC;
    orig_ce1 : out STD_LOGIC;
    sol_ce0 : out STD_LOGIC;
    sol_we0 : out STD_LOGIC;
    sol_ce1 : out STD_LOGIC;
    sol_we1 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    C_address0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    C_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_address1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    C_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sol_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    sol_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sol_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    sol_d1 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "C_ce0,C_ce1,orig_ce0,orig_ce1,sol_ce0,sol_we0,sol_ce1,sol_we1,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,C_address0[0:0],C_q0[31:0],C_address1[0:0],C_q1[31:0],orig_address0[10:0],orig_q0[31:0],orig_address1[10:0],orig_q1[31:0],sol_address0[10:0],sol_d0[31:0],sol_address1[10:0],sol_d1[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "stencil3d,Vivado 2023.2";
begin
end;
