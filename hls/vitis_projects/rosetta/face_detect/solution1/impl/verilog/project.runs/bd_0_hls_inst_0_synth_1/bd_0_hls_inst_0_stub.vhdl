-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Sun Jun 23 07:12:10 2024
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
    Data_ce0 : out STD_LOGIC;
    result_x_ce0 : out STD_LOGIC;
    result_x_we0 : out STD_LOGIC;
    result_y_ce0 : out STD_LOGIC;
    result_y_we0 : out STD_LOGIC;
    result_w_ce0 : out STD_LOGIC;
    result_w_we0 : out STD_LOGIC;
    result_h_ce0 : out STD_LOGIC;
    result_h_we0 : out STD_LOGIC;
    result_size_ap_vld : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    Data_address0 : out STD_LOGIC_VECTOR ( 16 downto 0 );
    Data_q0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    result_x_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    result_x_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    result_y_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    result_y_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    result_w_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    result_w_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    result_h_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    result_h_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    result_size : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Data_ce0,result_x_ce0,result_x_we0,result_y_ce0,result_y_we0,result_w_ce0,result_w_we0,result_h_ce0,result_h_we0,result_size_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,Data_address0[16:0],Data_q0[7:0],result_x_address0[6:0],result_x_d0[31:0],result_y_address0[6:0],result_y_d0[31:0],result_w_address0[6:0],result_w_d0[31:0],result_h_address0[6:0],result_h_d0[31:0],result_size[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "face_detect,Vivado 2023.2";
begin
end;
