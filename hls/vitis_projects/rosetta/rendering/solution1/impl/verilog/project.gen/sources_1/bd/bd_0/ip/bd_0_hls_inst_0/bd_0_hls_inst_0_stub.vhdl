-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Fri Aug  2 01:53:21 2024
-- Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/vitis_projects/rosetta/rendering/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    output_r_ce0 : out STD_LOGIC;
    output_r_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    triangle_3ds : in STD_LOGIC_VECTOR ( 71 downto 0 );
    output_r_address0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    output_r_d0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    num_3d_tri : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "output_r_ce0,output_r_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,triangle_3ds[71:0],output_r_address0[15:0],output_r_d0[7:0],num_3d_tri[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rendering,Vivado 2023.2";
begin
end;
