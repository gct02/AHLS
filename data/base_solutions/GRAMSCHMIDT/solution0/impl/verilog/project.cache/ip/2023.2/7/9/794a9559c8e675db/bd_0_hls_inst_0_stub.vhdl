-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Fri May 30 13:03:43 2025
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
    A_ce0 : out STD_LOGIC;
    A_we0 : out STD_LOGIC;
    R_ce0 : out STD_LOGIC;
    R_we0 : out STD_LOGIC;
    Q_ce0 : out STD_LOGIC;
    Q_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ni : in STD_LOGIC_VECTOR ( 31 downto 0 );
    nj : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_address0 : out STD_LOGIC_VECTOR ( 17 downto 0 );
    A_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    A_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    R_address0 : out STD_LOGIC_VECTOR ( 17 downto 0 );
    R_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q_address0 : out STD_LOGIC_VECTOR ( 17 downto 0 );
    Q_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A_ce0,A_we0,R_ce0,R_we0,Q_ce0,Q_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,ni[31:0],nj[31:0],A_address0[17:0],A_d0[63:0],A_q0[63:0],R_address0[17:0],R_d0[63:0],Q_address0[17:0],Q_d0[63:0],Q_q0[63:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "kernel_gramschmidt,Vivado 2023.2";
begin
end;
