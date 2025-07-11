-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Jul  9 04:04:43 2025
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
    force_x_ce0 : out STD_LOGIC;
    force_x_we0 : out STD_LOGIC;
    force_y_ce0 : out STD_LOGIC;
    force_y_we0 : out STD_LOGIC;
    force_z_ce0 : out STD_LOGIC;
    force_z_we0 : out STD_LOGIC;
    position_x_ce0 : out STD_LOGIC;
    position_y_ce0 : out STD_LOGIC;
    position_z_ce0 : out STD_LOGIC;
    NL_ce0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    force_x_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    force_x_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    force_y_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    force_y_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    force_z_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    force_z_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    position_x_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    position_x_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    position_y_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    position_y_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    position_z_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    position_z_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    NL_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    NL_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "force_x_ce0,force_x_we0,force_y_ce0,force_y_we0,force_z_ce0,force_z_we0,position_x_ce0,position_y_ce0,position_z_ce0,NL_ce0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,force_x_address0[7:0],force_x_d0[63:0],force_y_address0[7:0],force_y_d0[63:0],force_z_address0[7:0],force_z_d0[63:0],position_x_address0[7:0],position_x_q0[63:0],position_y_address0[7:0],position_y_q0[63:0],position_z_address0[7:0],position_z_q0[63:0],NL_address0[11:0],NL_q0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "md_kernel,Vivado 2023.2";
begin
end;
