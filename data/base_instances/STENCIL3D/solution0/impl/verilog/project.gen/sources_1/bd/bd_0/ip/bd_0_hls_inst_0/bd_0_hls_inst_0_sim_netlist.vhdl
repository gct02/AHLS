-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Sat Mar 29 16:07:13 2025
-- Host        : gabriel-Inspiron-15-3511 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/STENCIL3D/solution0/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu50-fsvh2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \tmp_product__1_i_32_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \tmp_product__1_i_16_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DSP_A_B_DATA_INST : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DSP_A_B_DATA_INST_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    DSP_A_B_DATA_INST_1 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1 : entity is "stencil3d_mul_32s_32s_32_1_1";
end bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1;

architecture STRUCTURE of bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1 is
  signal add_ln48_4_fu_826_p2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal grp_fu_382_p0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal grp_fu_382_p1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \mul_ln48_reg_1080[23]_i_2_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_3_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_4_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_5_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_6_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_7_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[23]_i_8_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_2_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_3_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_4_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_5_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_6_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_7_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_8_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080[31]_i_9_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_10\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_11\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_12\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_13\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_8\ : STD_LOGIC;
  signal \mul_ln48_reg_1080_reg[31]_i_1_n_9\ : STD_LOGIC;
  signal \tmp_product__0_n_112\ : STD_LOGIC;
  signal \tmp_product__0_n_113\ : STD_LOGIC;
  signal \tmp_product__0_n_114\ : STD_LOGIC;
  signal \tmp_product__0_n_115\ : STD_LOGIC;
  signal \tmp_product__0_n_116\ : STD_LOGIC;
  signal \tmp_product__0_n_117\ : STD_LOGIC;
  signal \tmp_product__0_n_118\ : STD_LOGIC;
  signal \tmp_product__0_n_119\ : STD_LOGIC;
  signal \tmp_product__0_n_120\ : STD_LOGIC;
  signal \tmp_product__0_n_121\ : STD_LOGIC;
  signal \tmp_product__0_n_122\ : STD_LOGIC;
  signal \tmp_product__0_n_123\ : STD_LOGIC;
  signal \tmp_product__0_n_124\ : STD_LOGIC;
  signal \tmp_product__0_n_125\ : STD_LOGIC;
  signal \tmp_product__0_n_126\ : STD_LOGIC;
  signal \tmp_product__0_n_127\ : STD_LOGIC;
  signal \tmp_product__0_n_128\ : STD_LOGIC;
  signal \tmp_product__0_n_129\ : STD_LOGIC;
  signal \tmp_product__0_n_130\ : STD_LOGIC;
  signal \tmp_product__0_n_131\ : STD_LOGIC;
  signal \tmp_product__0_n_132\ : STD_LOGIC;
  signal \tmp_product__0_n_133\ : STD_LOGIC;
  signal \tmp_product__0_n_134\ : STD_LOGIC;
  signal \tmp_product__0_n_135\ : STD_LOGIC;
  signal \tmp_product__0_n_136\ : STD_LOGIC;
  signal \tmp_product__0_n_137\ : STD_LOGIC;
  signal \tmp_product__0_n_138\ : STD_LOGIC;
  signal \tmp_product__0_n_139\ : STD_LOGIC;
  signal \tmp_product__0_n_140\ : STD_LOGIC;
  signal \tmp_product__0_n_141\ : STD_LOGIC;
  signal \tmp_product__0_n_142\ : STD_LOGIC;
  signal \tmp_product__0_n_143\ : STD_LOGIC;
  signal \tmp_product__0_n_144\ : STD_LOGIC;
  signal \tmp_product__0_n_145\ : STD_LOGIC;
  signal \tmp_product__0_n_146\ : STD_LOGIC;
  signal \tmp_product__0_n_147\ : STD_LOGIC;
  signal \tmp_product__0_n_148\ : STD_LOGIC;
  signal \tmp_product__0_n_149\ : STD_LOGIC;
  signal \tmp_product__0_n_150\ : STD_LOGIC;
  signal \tmp_product__0_n_151\ : STD_LOGIC;
  signal \tmp_product__0_n_152\ : STD_LOGIC;
  signal \tmp_product__0_n_153\ : STD_LOGIC;
  signal \tmp_product__0_n_154\ : STD_LOGIC;
  signal \tmp_product__0_n_155\ : STD_LOGIC;
  signal \tmp_product__0_n_156\ : STD_LOGIC;
  signal \tmp_product__0_n_157\ : STD_LOGIC;
  signal \tmp_product__0_n_158\ : STD_LOGIC;
  signal \tmp_product__0_n_159\ : STD_LOGIC;
  signal \tmp_product__0_n_30\ : STD_LOGIC;
  signal \tmp_product__0_n_31\ : STD_LOGIC;
  signal \tmp_product__0_n_32\ : STD_LOGIC;
  signal \tmp_product__0_n_33\ : STD_LOGIC;
  signal \tmp_product__0_n_34\ : STD_LOGIC;
  signal \tmp_product__0_n_35\ : STD_LOGIC;
  signal \tmp_product__0_n_36\ : STD_LOGIC;
  signal \tmp_product__0_n_37\ : STD_LOGIC;
  signal \tmp_product__0_n_38\ : STD_LOGIC;
  signal \tmp_product__0_n_39\ : STD_LOGIC;
  signal \tmp_product__0_n_40\ : STD_LOGIC;
  signal \tmp_product__0_n_41\ : STD_LOGIC;
  signal \tmp_product__0_n_42\ : STD_LOGIC;
  signal \tmp_product__0_n_43\ : STD_LOGIC;
  signal \tmp_product__0_n_44\ : STD_LOGIC;
  signal \tmp_product__0_n_45\ : STD_LOGIC;
  signal \tmp_product__0_n_46\ : STD_LOGIC;
  signal \tmp_product__0_n_47\ : STD_LOGIC;
  signal \tmp_product__0_n_48\ : STD_LOGIC;
  signal \tmp_product__0_n_49\ : STD_LOGIC;
  signal \tmp_product__0_n_50\ : STD_LOGIC;
  signal \tmp_product__0_n_51\ : STD_LOGIC;
  signal \tmp_product__0_n_52\ : STD_LOGIC;
  signal \tmp_product__0_n_53\ : STD_LOGIC;
  signal \tmp_product__0_n_54\ : STD_LOGIC;
  signal \tmp_product__0_n_55\ : STD_LOGIC;
  signal \tmp_product__0_n_56\ : STD_LOGIC;
  signal \tmp_product__0_n_57\ : STD_LOGIC;
  signal \tmp_product__0_n_58\ : STD_LOGIC;
  signal \tmp_product__0_n_59\ : STD_LOGIC;
  signal \tmp_product__0_n_64\ : STD_LOGIC;
  signal \tmp_product__0_n_65\ : STD_LOGIC;
  signal \tmp_product__0_n_66\ : STD_LOGIC;
  signal \tmp_product__0_n_67\ : STD_LOGIC;
  signal \tmp_product__0_n_68\ : STD_LOGIC;
  signal \tmp_product__0_n_69\ : STD_LOGIC;
  signal \tmp_product__0_n_70\ : STD_LOGIC;
  signal \tmp_product__0_n_71\ : STD_LOGIC;
  signal \tmp_product__0_n_72\ : STD_LOGIC;
  signal \tmp_product__0_n_73\ : STD_LOGIC;
  signal \tmp_product__0_n_74\ : STD_LOGIC;
  signal \tmp_product__0_n_75\ : STD_LOGIC;
  signal \tmp_product__0_n_76\ : STD_LOGIC;
  signal \tmp_product__0_n_77\ : STD_LOGIC;
  signal \tmp_product__0_n_78\ : STD_LOGIC;
  signal \tmp_product__0_n_79\ : STD_LOGIC;
  signal \tmp_product__0_n_80\ : STD_LOGIC;
  signal \tmp_product__0_n_81\ : STD_LOGIC;
  signal \tmp_product__0_n_82\ : STD_LOGIC;
  signal \tmp_product__0_n_83\ : STD_LOGIC;
  signal \tmp_product__0_n_84\ : STD_LOGIC;
  signal \tmp_product__0_n_85\ : STD_LOGIC;
  signal \tmp_product__0_n_86\ : STD_LOGIC;
  signal \tmp_product__0_n_87\ : STD_LOGIC;
  signal \tmp_product__0_n_88\ : STD_LOGIC;
  signal \tmp_product__0_n_89\ : STD_LOGIC;
  signal \tmp_product__0_n_90\ : STD_LOGIC;
  signal \tmp_product__0_n_91\ : STD_LOGIC;
  signal \tmp_product__0_n_92\ : STD_LOGIC;
  signal \tmp_product__0_n_93\ : STD_LOGIC;
  signal \tmp_product__0_n_94\ : STD_LOGIC;
  signal \tmp_product__0_n_95\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_10\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_11\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_12\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_13\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_7\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_8\ : STD_LOGIC;
  signal \tmp_product__1_i_16_n_9\ : STD_LOGIC;
  signal \tmp_product__1_i_17_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_18_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_19_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_20_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_21_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_22_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_23_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_24_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_25_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_26_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_27_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_28_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_29_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_30_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_31_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_10\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_11\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_12\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_13\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_14\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_15\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_16\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_17\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_18\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_19\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_20\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_21\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_7\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_8\ : STD_LOGIC;
  signal \tmp_product__1_i_32_n_9\ : STD_LOGIC;
  signal \tmp_product__1_i_33_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_34_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_35_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_36_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_37_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_38_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_39_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_40_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_41_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_42_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_43_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_44_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_45_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_46_n_6\ : STD_LOGIC;
  signal \tmp_product__1_i_47_n_6\ : STD_LOGIC;
  signal \tmp_product__1_n_100\ : STD_LOGIC;
  signal \tmp_product__1_n_101\ : STD_LOGIC;
  signal \tmp_product__1_n_102\ : STD_LOGIC;
  signal \tmp_product__1_n_103\ : STD_LOGIC;
  signal \tmp_product__1_n_104\ : STD_LOGIC;
  signal \tmp_product__1_n_105\ : STD_LOGIC;
  signal \tmp_product__1_n_106\ : STD_LOGIC;
  signal \tmp_product__1_n_107\ : STD_LOGIC;
  signal \tmp_product__1_n_108\ : STD_LOGIC;
  signal \tmp_product__1_n_109\ : STD_LOGIC;
  signal \tmp_product__1_n_110\ : STD_LOGIC;
  signal \tmp_product__1_n_111\ : STD_LOGIC;
  signal \tmp_product__1_n_64\ : STD_LOGIC;
  signal \tmp_product__1_n_65\ : STD_LOGIC;
  signal \tmp_product__1_n_66\ : STD_LOGIC;
  signal \tmp_product__1_n_67\ : STD_LOGIC;
  signal \tmp_product__1_n_68\ : STD_LOGIC;
  signal \tmp_product__1_n_69\ : STD_LOGIC;
  signal \tmp_product__1_n_70\ : STD_LOGIC;
  signal \tmp_product__1_n_71\ : STD_LOGIC;
  signal \tmp_product__1_n_72\ : STD_LOGIC;
  signal \tmp_product__1_n_73\ : STD_LOGIC;
  signal \tmp_product__1_n_74\ : STD_LOGIC;
  signal \tmp_product__1_n_75\ : STD_LOGIC;
  signal \tmp_product__1_n_76\ : STD_LOGIC;
  signal \tmp_product__1_n_77\ : STD_LOGIC;
  signal \tmp_product__1_n_78\ : STD_LOGIC;
  signal \tmp_product__1_n_79\ : STD_LOGIC;
  signal \tmp_product__1_n_80\ : STD_LOGIC;
  signal \tmp_product__1_n_81\ : STD_LOGIC;
  signal \tmp_product__1_n_82\ : STD_LOGIC;
  signal \tmp_product__1_n_83\ : STD_LOGIC;
  signal \tmp_product__1_n_84\ : STD_LOGIC;
  signal \tmp_product__1_n_85\ : STD_LOGIC;
  signal \tmp_product__1_n_86\ : STD_LOGIC;
  signal \tmp_product__1_n_87\ : STD_LOGIC;
  signal \tmp_product__1_n_88\ : STD_LOGIC;
  signal \tmp_product__1_n_89\ : STD_LOGIC;
  signal \tmp_product__1_n_90\ : STD_LOGIC;
  signal \tmp_product__1_n_91\ : STD_LOGIC;
  signal \tmp_product__1_n_92\ : STD_LOGIC;
  signal \tmp_product__1_n_93\ : STD_LOGIC;
  signal \tmp_product__1_n_94\ : STD_LOGIC;
  signal \tmp_product__1_n_95\ : STD_LOGIC;
  signal \tmp_product__1_n_96\ : STD_LOGIC;
  signal \tmp_product__1_n_97\ : STD_LOGIC;
  signal \tmp_product__1_n_98\ : STD_LOGIC;
  signal \tmp_product__1_n_99\ : STD_LOGIC;
  signal tmp_product_i_100_n_6 : STD_LOGIC;
  signal tmp_product_i_101_n_6 : STD_LOGIC;
  signal tmp_product_i_102_n_6 : STD_LOGIC;
  signal tmp_product_i_103_n_6 : STD_LOGIC;
  signal tmp_product_i_104_n_6 : STD_LOGIC;
  signal tmp_product_i_105_n_6 : STD_LOGIC;
  signal tmp_product_i_106_n_6 : STD_LOGIC;
  signal tmp_product_i_107_n_6 : STD_LOGIC;
  signal tmp_product_i_108_n_6 : STD_LOGIC;
  signal tmp_product_i_109_n_6 : STD_LOGIC;
  signal tmp_product_i_110_n_6 : STD_LOGIC;
  signal tmp_product_i_111_n_6 : STD_LOGIC;
  signal tmp_product_i_112_n_6 : STD_LOGIC;
  signal tmp_product_i_113_n_6 : STD_LOGIC;
  signal tmp_product_i_114_n_6 : STD_LOGIC;
  signal tmp_product_i_115_n_6 : STD_LOGIC;
  signal tmp_product_i_116_n_6 : STD_LOGIC;
  signal tmp_product_i_117_n_6 : STD_LOGIC;
  signal tmp_product_i_118_n_6 : STD_LOGIC;
  signal tmp_product_i_119_n_6 : STD_LOGIC;
  signal tmp_product_i_120_n_6 : STD_LOGIC;
  signal tmp_product_i_121_n_6 : STD_LOGIC;
  signal tmp_product_i_122_n_6 : STD_LOGIC;
  signal tmp_product_i_123_n_6 : STD_LOGIC;
  signal tmp_product_i_124_n_6 : STD_LOGIC;
  signal tmp_product_i_125_n_6 : STD_LOGIC;
  signal tmp_product_i_126_n_6 : STD_LOGIC;
  signal tmp_product_i_127_n_6 : STD_LOGIC;
  signal tmp_product_i_128_n_6 : STD_LOGIC;
  signal tmp_product_i_129_n_6 : STD_LOGIC;
  signal tmp_product_i_130_n_6 : STD_LOGIC;
  signal tmp_product_i_131_n_6 : STD_LOGIC;
  signal tmp_product_i_132_n_6 : STD_LOGIC;
  signal tmp_product_i_33_n_10 : STD_LOGIC;
  signal tmp_product_i_33_n_11 : STD_LOGIC;
  signal tmp_product_i_33_n_12 : STD_LOGIC;
  signal tmp_product_i_33_n_13 : STD_LOGIC;
  signal tmp_product_i_33_n_6 : STD_LOGIC;
  signal tmp_product_i_33_n_7 : STD_LOGIC;
  signal tmp_product_i_33_n_8 : STD_LOGIC;
  signal tmp_product_i_33_n_9 : STD_LOGIC;
  signal tmp_product_i_34_n_10 : STD_LOGIC;
  signal tmp_product_i_34_n_11 : STD_LOGIC;
  signal tmp_product_i_34_n_12 : STD_LOGIC;
  signal tmp_product_i_34_n_13 : STD_LOGIC;
  signal tmp_product_i_34_n_6 : STD_LOGIC;
  signal tmp_product_i_34_n_7 : STD_LOGIC;
  signal tmp_product_i_34_n_8 : STD_LOGIC;
  signal tmp_product_i_34_n_9 : STD_LOGIC;
  signal tmp_product_i_35_n_10 : STD_LOGIC;
  signal tmp_product_i_35_n_11 : STD_LOGIC;
  signal tmp_product_i_35_n_12 : STD_LOGIC;
  signal tmp_product_i_35_n_13 : STD_LOGIC;
  signal tmp_product_i_35_n_6 : STD_LOGIC;
  signal tmp_product_i_35_n_7 : STD_LOGIC;
  signal tmp_product_i_35_n_8 : STD_LOGIC;
  signal tmp_product_i_35_n_9 : STD_LOGIC;
  signal tmp_product_i_36_n_6 : STD_LOGIC;
  signal tmp_product_i_37_n_6 : STD_LOGIC;
  signal tmp_product_i_38_n_6 : STD_LOGIC;
  signal tmp_product_i_39_n_6 : STD_LOGIC;
  signal tmp_product_i_40_n_6 : STD_LOGIC;
  signal tmp_product_i_41_n_6 : STD_LOGIC;
  signal tmp_product_i_42_n_6 : STD_LOGIC;
  signal tmp_product_i_43_n_6 : STD_LOGIC;
  signal tmp_product_i_44_n_6 : STD_LOGIC;
  signal tmp_product_i_45_n_6 : STD_LOGIC;
  signal tmp_product_i_46_n_6 : STD_LOGIC;
  signal tmp_product_i_47_n_6 : STD_LOGIC;
  signal tmp_product_i_48_n_6 : STD_LOGIC;
  signal tmp_product_i_49_n_6 : STD_LOGIC;
  signal tmp_product_i_50_n_6 : STD_LOGIC;
  signal tmp_product_i_51_n_6 : STD_LOGIC;
  signal tmp_product_i_52_n_6 : STD_LOGIC;
  signal tmp_product_i_53_n_6 : STD_LOGIC;
  signal tmp_product_i_54_n_6 : STD_LOGIC;
  signal tmp_product_i_55_n_6 : STD_LOGIC;
  signal tmp_product_i_56_n_6 : STD_LOGIC;
  signal tmp_product_i_57_n_6 : STD_LOGIC;
  signal tmp_product_i_58_n_6 : STD_LOGIC;
  signal tmp_product_i_59_n_6 : STD_LOGIC;
  signal tmp_product_i_60_n_6 : STD_LOGIC;
  signal tmp_product_i_61_n_6 : STD_LOGIC;
  signal tmp_product_i_62_n_6 : STD_LOGIC;
  signal tmp_product_i_63_n_6 : STD_LOGIC;
  signal tmp_product_i_64_n_6 : STD_LOGIC;
  signal tmp_product_i_65_n_6 : STD_LOGIC;
  signal tmp_product_i_66_n_6 : STD_LOGIC;
  signal tmp_product_i_67_n_6 : STD_LOGIC;
  signal tmp_product_i_68_n_6 : STD_LOGIC;
  signal tmp_product_i_69_n_6 : STD_LOGIC;
  signal tmp_product_i_70_n_6 : STD_LOGIC;
  signal tmp_product_i_71_n_6 : STD_LOGIC;
  signal tmp_product_i_72_n_6 : STD_LOGIC;
  signal tmp_product_i_73_n_6 : STD_LOGIC;
  signal tmp_product_i_74_n_6 : STD_LOGIC;
  signal tmp_product_i_75_n_6 : STD_LOGIC;
  signal tmp_product_i_76_n_6 : STD_LOGIC;
  signal tmp_product_i_77_n_6 : STD_LOGIC;
  signal tmp_product_i_78_n_6 : STD_LOGIC;
  signal tmp_product_i_79_n_6 : STD_LOGIC;
  signal tmp_product_i_80_n_6 : STD_LOGIC;
  signal tmp_product_i_81_n_6 : STD_LOGIC;
  signal tmp_product_i_82_n_6 : STD_LOGIC;
  signal tmp_product_i_83_n_10 : STD_LOGIC;
  signal tmp_product_i_83_n_11 : STD_LOGIC;
  signal tmp_product_i_83_n_12 : STD_LOGIC;
  signal tmp_product_i_83_n_13 : STD_LOGIC;
  signal tmp_product_i_83_n_14 : STD_LOGIC;
  signal tmp_product_i_83_n_15 : STD_LOGIC;
  signal tmp_product_i_83_n_16 : STD_LOGIC;
  signal tmp_product_i_83_n_17 : STD_LOGIC;
  signal tmp_product_i_83_n_18 : STD_LOGIC;
  signal tmp_product_i_83_n_19 : STD_LOGIC;
  signal tmp_product_i_83_n_20 : STD_LOGIC;
  signal tmp_product_i_83_n_21 : STD_LOGIC;
  signal tmp_product_i_83_n_6 : STD_LOGIC;
  signal tmp_product_i_83_n_7 : STD_LOGIC;
  signal tmp_product_i_83_n_8 : STD_LOGIC;
  signal tmp_product_i_83_n_9 : STD_LOGIC;
  signal tmp_product_i_84_n_10 : STD_LOGIC;
  signal tmp_product_i_84_n_11 : STD_LOGIC;
  signal tmp_product_i_84_n_12 : STD_LOGIC;
  signal tmp_product_i_84_n_13 : STD_LOGIC;
  signal tmp_product_i_84_n_14 : STD_LOGIC;
  signal tmp_product_i_84_n_15 : STD_LOGIC;
  signal tmp_product_i_84_n_16 : STD_LOGIC;
  signal tmp_product_i_84_n_17 : STD_LOGIC;
  signal tmp_product_i_84_n_18 : STD_LOGIC;
  signal tmp_product_i_84_n_19 : STD_LOGIC;
  signal tmp_product_i_84_n_20 : STD_LOGIC;
  signal tmp_product_i_84_n_21 : STD_LOGIC;
  signal tmp_product_i_84_n_6 : STD_LOGIC;
  signal tmp_product_i_84_n_7 : STD_LOGIC;
  signal tmp_product_i_84_n_8 : STD_LOGIC;
  signal tmp_product_i_84_n_9 : STD_LOGIC;
  signal tmp_product_i_85_n_10 : STD_LOGIC;
  signal tmp_product_i_85_n_11 : STD_LOGIC;
  signal tmp_product_i_85_n_12 : STD_LOGIC;
  signal tmp_product_i_85_n_13 : STD_LOGIC;
  signal tmp_product_i_85_n_14 : STD_LOGIC;
  signal tmp_product_i_85_n_15 : STD_LOGIC;
  signal tmp_product_i_85_n_16 : STD_LOGIC;
  signal tmp_product_i_85_n_17 : STD_LOGIC;
  signal tmp_product_i_85_n_18 : STD_LOGIC;
  signal tmp_product_i_85_n_19 : STD_LOGIC;
  signal tmp_product_i_85_n_20 : STD_LOGIC;
  signal tmp_product_i_85_n_21 : STD_LOGIC;
  signal tmp_product_i_85_n_6 : STD_LOGIC;
  signal tmp_product_i_85_n_7 : STD_LOGIC;
  signal tmp_product_i_85_n_8 : STD_LOGIC;
  signal tmp_product_i_85_n_9 : STD_LOGIC;
  signal tmp_product_i_86_n_6 : STD_LOGIC;
  signal tmp_product_i_87_n_6 : STD_LOGIC;
  signal tmp_product_i_88_n_6 : STD_LOGIC;
  signal tmp_product_i_89_n_6 : STD_LOGIC;
  signal tmp_product_i_90_n_6 : STD_LOGIC;
  signal tmp_product_i_91_n_6 : STD_LOGIC;
  signal tmp_product_i_92_n_6 : STD_LOGIC;
  signal tmp_product_i_93_n_6 : STD_LOGIC;
  signal tmp_product_i_94_n_6 : STD_LOGIC;
  signal tmp_product_i_95_n_6 : STD_LOGIC;
  signal tmp_product_i_96_n_6 : STD_LOGIC;
  signal tmp_product_i_97_n_6 : STD_LOGIC;
  signal tmp_product_i_98_n_6 : STD_LOGIC;
  signal tmp_product_i_99_n_6 : STD_LOGIC;
  signal tmp_product_n_100 : STD_LOGIC;
  signal tmp_product_n_101 : STD_LOGIC;
  signal tmp_product_n_102 : STD_LOGIC;
  signal tmp_product_n_103 : STD_LOGIC;
  signal tmp_product_n_104 : STD_LOGIC;
  signal tmp_product_n_105 : STD_LOGIC;
  signal tmp_product_n_106 : STD_LOGIC;
  signal tmp_product_n_107 : STD_LOGIC;
  signal tmp_product_n_108 : STD_LOGIC;
  signal tmp_product_n_109 : STD_LOGIC;
  signal tmp_product_n_110 : STD_LOGIC;
  signal tmp_product_n_111 : STD_LOGIC;
  signal tmp_product_n_112 : STD_LOGIC;
  signal tmp_product_n_113 : STD_LOGIC;
  signal tmp_product_n_114 : STD_LOGIC;
  signal tmp_product_n_115 : STD_LOGIC;
  signal tmp_product_n_116 : STD_LOGIC;
  signal tmp_product_n_117 : STD_LOGIC;
  signal tmp_product_n_118 : STD_LOGIC;
  signal tmp_product_n_119 : STD_LOGIC;
  signal tmp_product_n_120 : STD_LOGIC;
  signal tmp_product_n_121 : STD_LOGIC;
  signal tmp_product_n_122 : STD_LOGIC;
  signal tmp_product_n_123 : STD_LOGIC;
  signal tmp_product_n_124 : STD_LOGIC;
  signal tmp_product_n_125 : STD_LOGIC;
  signal tmp_product_n_126 : STD_LOGIC;
  signal tmp_product_n_127 : STD_LOGIC;
  signal tmp_product_n_128 : STD_LOGIC;
  signal tmp_product_n_129 : STD_LOGIC;
  signal tmp_product_n_130 : STD_LOGIC;
  signal tmp_product_n_131 : STD_LOGIC;
  signal tmp_product_n_132 : STD_LOGIC;
  signal tmp_product_n_133 : STD_LOGIC;
  signal tmp_product_n_134 : STD_LOGIC;
  signal tmp_product_n_135 : STD_LOGIC;
  signal tmp_product_n_136 : STD_LOGIC;
  signal tmp_product_n_137 : STD_LOGIC;
  signal tmp_product_n_138 : STD_LOGIC;
  signal tmp_product_n_139 : STD_LOGIC;
  signal tmp_product_n_140 : STD_LOGIC;
  signal tmp_product_n_141 : STD_LOGIC;
  signal tmp_product_n_142 : STD_LOGIC;
  signal tmp_product_n_143 : STD_LOGIC;
  signal tmp_product_n_144 : STD_LOGIC;
  signal tmp_product_n_145 : STD_LOGIC;
  signal tmp_product_n_146 : STD_LOGIC;
  signal tmp_product_n_147 : STD_LOGIC;
  signal tmp_product_n_148 : STD_LOGIC;
  signal tmp_product_n_149 : STD_LOGIC;
  signal tmp_product_n_150 : STD_LOGIC;
  signal tmp_product_n_151 : STD_LOGIC;
  signal tmp_product_n_152 : STD_LOGIC;
  signal tmp_product_n_153 : STD_LOGIC;
  signal tmp_product_n_154 : STD_LOGIC;
  signal tmp_product_n_155 : STD_LOGIC;
  signal tmp_product_n_156 : STD_LOGIC;
  signal tmp_product_n_157 : STD_LOGIC;
  signal tmp_product_n_158 : STD_LOGIC;
  signal tmp_product_n_159 : STD_LOGIC;
  signal tmp_product_n_64 : STD_LOGIC;
  signal tmp_product_n_65 : STD_LOGIC;
  signal tmp_product_n_66 : STD_LOGIC;
  signal tmp_product_n_67 : STD_LOGIC;
  signal tmp_product_n_68 : STD_LOGIC;
  signal tmp_product_n_69 : STD_LOGIC;
  signal tmp_product_n_70 : STD_LOGIC;
  signal tmp_product_n_71 : STD_LOGIC;
  signal tmp_product_n_72 : STD_LOGIC;
  signal tmp_product_n_73 : STD_LOGIC;
  signal tmp_product_n_74 : STD_LOGIC;
  signal tmp_product_n_75 : STD_LOGIC;
  signal tmp_product_n_76 : STD_LOGIC;
  signal tmp_product_n_77 : STD_LOGIC;
  signal tmp_product_n_78 : STD_LOGIC;
  signal tmp_product_n_79 : STD_LOGIC;
  signal tmp_product_n_80 : STD_LOGIC;
  signal tmp_product_n_81 : STD_LOGIC;
  signal tmp_product_n_82 : STD_LOGIC;
  signal tmp_product_n_83 : STD_LOGIC;
  signal tmp_product_n_84 : STD_LOGIC;
  signal tmp_product_n_85 : STD_LOGIC;
  signal tmp_product_n_86 : STD_LOGIC;
  signal tmp_product_n_87 : STD_LOGIC;
  signal tmp_product_n_88 : STD_LOGIC;
  signal tmp_product_n_89 : STD_LOGIC;
  signal tmp_product_n_90 : STD_LOGIC;
  signal tmp_product_n_91 : STD_LOGIC;
  signal tmp_product_n_92 : STD_LOGIC;
  signal tmp_product_n_93 : STD_LOGIC;
  signal tmp_product_n_94 : STD_LOGIC;
  signal tmp_product_n_95 : STD_LOGIC;
  signal tmp_product_n_96 : STD_LOGIC;
  signal tmp_product_n_97 : STD_LOGIC;
  signal tmp_product_n_98 : STD_LOGIC;
  signal tmp_product_n_99 : STD_LOGIC;
  signal \NLW_mul_ln48_reg_1080_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_tmp_product_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_tmp_product_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_tmp_product_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_tmp_product_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_tmp_product_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_tmp_product__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_tmp_product__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_tmp_product__1_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_tmp_product__1_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_tmp_product__1_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_tmp_product__1_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_tmp_product__1_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_tmp_product__1_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_tmp_product__1_i_16_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_tmp_product__1_i_32_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \mul_ln48_reg_1080_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \mul_ln48_reg_1080_reg[31]_i_1\ : label is 35;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of tmp_product : label is "yes";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of tmp_product : label is "{SYNTH-10 {cell *THIS*} {string 15x18 4}}";
  attribute KEEP_HIERARCHY of \tmp_product__0\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \tmp_product__0\ : label is "{SYNTH-10 {cell *THIS*} {string 18x18 4}}";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \tmp_product__0_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tmp_product__0_i_10\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tmp_product__0_i_11\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tmp_product__0_i_12\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tmp_product__0_i_13\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tmp_product__0_i_14\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tmp_product__0_i_15\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tmp_product__0_i_16\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tmp_product__0_i_17\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \tmp_product__0_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tmp_product__0_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \tmp_product__0_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \tmp_product__0_i_5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \tmp_product__0_i_6\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \tmp_product__0_i_7\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \tmp_product__0_i_8\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \tmp_product__0_i_9\ : label is "soft_lutpair20";
  attribute KEEP_HIERARCHY of \tmp_product__1\ : label is "yes";
  attribute METHODOLOGY_DRC_VIOS of \tmp_product__1\ : label is "{SYNTH-10 {cell *THIS*} {string 18x15 4}}";
  attribute SOFT_HLUTNM of \tmp_product__1_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \tmp_product__1_i_10\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \tmp_product__1_i_11\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \tmp_product__1_i_12\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tmp_product__1_i_13\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \tmp_product__1_i_14\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tmp_product__1_i_15\ : label is "soft_lutpair9";
  attribute ADDER_THRESHOLD of \tmp_product__1_i_16\ : label is 35;
  attribute SOFT_HLUTNM of \tmp_product__1_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \tmp_product__1_i_3\ : label is "soft_lutpair14";
  attribute ADDER_THRESHOLD of \tmp_product__1_i_32\ : label is 35;
  attribute HLUTNM : string;
  attribute HLUTNM of \tmp_product__1_i_33\ : label is "lutpair2";
  attribute HLUTNM of \tmp_product__1_i_34\ : label is "lutpair1";
  attribute HLUTNM of \tmp_product__1_i_35\ : label is "lutpair0";
  attribute SOFT_HLUTNM of \tmp_product__1_i_4\ : label is "soft_lutpair13";
  attribute HLUTNM of \tmp_product__1_i_42\ : label is "lutpair2";
  attribute HLUTNM of \tmp_product__1_i_43\ : label is "lutpair1";
  attribute HLUTNM of \tmp_product__1_i_44\ : label is "lutpair0";
  attribute SOFT_HLUTNM of \tmp_product__1_i_5\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \tmp_product__1_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \tmp_product__1_i_7\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \tmp_product__1_i_8\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \tmp_product__1_i_9\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of tmp_product_i_1 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of tmp_product_i_10 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of tmp_product_i_11 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of tmp_product_i_12 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of tmp_product_i_13 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of tmp_product_i_14 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of tmp_product_i_15 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of tmp_product_i_16 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tmp_product_i_17 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tmp_product_i_18 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of tmp_product_i_19 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of tmp_product_i_2 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of tmp_product_i_20 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of tmp_product_i_21 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of tmp_product_i_22 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of tmp_product_i_23 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of tmp_product_i_24 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of tmp_product_i_25 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of tmp_product_i_26 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of tmp_product_i_27 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of tmp_product_i_28 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of tmp_product_i_29 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of tmp_product_i_3 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of tmp_product_i_30 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of tmp_product_i_31 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of tmp_product_i_32 : label is "soft_lutpair8";
  attribute ADDER_THRESHOLD of tmp_product_i_33 : label is 35;
  attribute ADDER_THRESHOLD of tmp_product_i_34 : label is 35;
  attribute ADDER_THRESHOLD of tmp_product_i_35 : label is 35;
  attribute SOFT_HLUTNM of tmp_product_i_4 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of tmp_product_i_5 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of tmp_product_i_6 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of tmp_product_i_7 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of tmp_product_i_8 : label is "soft_lutpair27";
  attribute ADDER_THRESHOLD of tmp_product_i_83 : label is 35;
  attribute ADDER_THRESHOLD of tmp_product_i_84 : label is 35;
  attribute ADDER_THRESHOLD of tmp_product_i_85 : label is 35;
  attribute SOFT_HLUTNM of tmp_product_i_9 : label is "soft_lutpair28";
begin
\mul_ln48_reg_1080[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_105\,
      I1 => tmp_product_n_105,
      O => \mul_ln48_reg_1080[23]_i_2_n_6\
    );
\mul_ln48_reg_1080[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_106\,
      I1 => tmp_product_n_106,
      O => \mul_ln48_reg_1080[23]_i_3_n_6\
    );
\mul_ln48_reg_1080[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_107\,
      I1 => tmp_product_n_107,
      O => \mul_ln48_reg_1080[23]_i_4_n_6\
    );
\mul_ln48_reg_1080[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_108\,
      I1 => tmp_product_n_108,
      O => \mul_ln48_reg_1080[23]_i_5_n_6\
    );
\mul_ln48_reg_1080[23]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_109\,
      I1 => tmp_product_n_109,
      O => \mul_ln48_reg_1080[23]_i_6_n_6\
    );
\mul_ln48_reg_1080[23]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_110\,
      I1 => tmp_product_n_110,
      O => \mul_ln48_reg_1080[23]_i_7_n_6\
    );
\mul_ln48_reg_1080[23]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_111\,
      I1 => tmp_product_n_111,
      O => \mul_ln48_reg_1080[23]_i_8_n_6\
    );
\mul_ln48_reg_1080[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_97\,
      I1 => tmp_product_n_97,
      O => \mul_ln48_reg_1080[31]_i_2_n_6\
    );
\mul_ln48_reg_1080[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_98\,
      I1 => tmp_product_n_98,
      O => \mul_ln48_reg_1080[31]_i_3_n_6\
    );
\mul_ln48_reg_1080[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_99\,
      I1 => tmp_product_n_99,
      O => \mul_ln48_reg_1080[31]_i_4_n_6\
    );
\mul_ln48_reg_1080[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_100\,
      I1 => tmp_product_n_100,
      O => \mul_ln48_reg_1080[31]_i_5_n_6\
    );
\mul_ln48_reg_1080[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_101\,
      I1 => tmp_product_n_101,
      O => \mul_ln48_reg_1080[31]_i_6_n_6\
    );
\mul_ln48_reg_1080[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_102\,
      I1 => tmp_product_n_102,
      O => \mul_ln48_reg_1080[31]_i_7_n_6\
    );
\mul_ln48_reg_1080[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_103\,
      I1 => tmp_product_n_103,
      O => \mul_ln48_reg_1080[31]_i_8_n_6\
    );
\mul_ln48_reg_1080[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tmp_product__1_n_104\,
      I1 => tmp_product_n_104,
      O => \mul_ln48_reg_1080[31]_i_9_n_6\
    );
\mul_ln48_reg_1080_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \mul_ln48_reg_1080_reg[23]_i_1_n_6\,
      CO(6) => \mul_ln48_reg_1080_reg[23]_i_1_n_7\,
      CO(5) => \mul_ln48_reg_1080_reg[23]_i_1_n_8\,
      CO(4) => \mul_ln48_reg_1080_reg[23]_i_1_n_9\,
      CO(3) => \mul_ln48_reg_1080_reg[23]_i_1_n_10\,
      CO(2) => \mul_ln48_reg_1080_reg[23]_i_1_n_11\,
      CO(1) => \mul_ln48_reg_1080_reg[23]_i_1_n_12\,
      CO(0) => \mul_ln48_reg_1080_reg[23]_i_1_n_13\,
      DI(7) => \tmp_product__1_n_105\,
      DI(6) => \tmp_product__1_n_106\,
      DI(5) => \tmp_product__1_n_107\,
      DI(4) => \tmp_product__1_n_108\,
      DI(3) => \tmp_product__1_n_109\,
      DI(2) => \tmp_product__1_n_110\,
      DI(1) => \tmp_product__1_n_111\,
      DI(0) => '0',
      O(7 downto 0) => D(23 downto 16),
      S(7) => \mul_ln48_reg_1080[23]_i_2_n_6\,
      S(6) => \mul_ln48_reg_1080[23]_i_3_n_6\,
      S(5) => \mul_ln48_reg_1080[23]_i_4_n_6\,
      S(4) => \mul_ln48_reg_1080[23]_i_5_n_6\,
      S(3) => \mul_ln48_reg_1080[23]_i_6_n_6\,
      S(2) => \mul_ln48_reg_1080[23]_i_7_n_6\,
      S(1) => \mul_ln48_reg_1080[23]_i_8_n_6\,
      S(0) => \tmp_product__0_n_95\
    );
\mul_ln48_reg_1080_reg[31]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \mul_ln48_reg_1080_reg[23]_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \NLW_mul_ln48_reg_1080_reg[31]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \mul_ln48_reg_1080_reg[31]_i_1_n_7\,
      CO(5) => \mul_ln48_reg_1080_reg[31]_i_1_n_8\,
      CO(4) => \mul_ln48_reg_1080_reg[31]_i_1_n_9\,
      CO(3) => \mul_ln48_reg_1080_reg[31]_i_1_n_10\,
      CO(2) => \mul_ln48_reg_1080_reg[31]_i_1_n_11\,
      CO(1) => \mul_ln48_reg_1080_reg[31]_i_1_n_12\,
      CO(0) => \mul_ln48_reg_1080_reg[31]_i_1_n_13\,
      DI(7) => '0',
      DI(6) => \tmp_product__1_n_98\,
      DI(5) => \tmp_product__1_n_99\,
      DI(4) => \tmp_product__1_n_100\,
      DI(3) => \tmp_product__1_n_101\,
      DI(2) => \tmp_product__1_n_102\,
      DI(1) => \tmp_product__1_n_103\,
      DI(0) => \tmp_product__1_n_104\,
      O(7 downto 0) => D(31 downto 24),
      S(7) => \mul_ln48_reg_1080[31]_i_2_n_6\,
      S(6) => \mul_ln48_reg_1080[31]_i_3_n_6\,
      S(5) => \mul_ln48_reg_1080[31]_i_4_n_6\,
      S(4) => \mul_ln48_reg_1080[31]_i_5_n_6\,
      S(3) => \mul_ln48_reg_1080[31]_i_6_n_6\,
      S(2) => \mul_ln48_reg_1080[31]_i_7_n_6\,
      S(1) => \mul_ln48_reg_1080[31]_i_8_n_6\,
      S(0) => \mul_ln48_reg_1080[31]_i_9_n_6\
    );
tmp_product: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => grp_fu_382_p1(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_tmp_product_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => grp_fu_382_p0(31),
      B(16) => grp_fu_382_p0(31),
      B(15) => grp_fu_382_p0(31),
      B(14 downto 0) => grp_fu_382_p0(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_tmp_product_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_tmp_product_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_tmp_product_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_tmp_product_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_tmp_product_OVERFLOW_UNCONNECTED,
      P(47) => tmp_product_n_64,
      P(46) => tmp_product_n_65,
      P(45) => tmp_product_n_66,
      P(44) => tmp_product_n_67,
      P(43) => tmp_product_n_68,
      P(42) => tmp_product_n_69,
      P(41) => tmp_product_n_70,
      P(40) => tmp_product_n_71,
      P(39) => tmp_product_n_72,
      P(38) => tmp_product_n_73,
      P(37) => tmp_product_n_74,
      P(36) => tmp_product_n_75,
      P(35) => tmp_product_n_76,
      P(34) => tmp_product_n_77,
      P(33) => tmp_product_n_78,
      P(32) => tmp_product_n_79,
      P(31) => tmp_product_n_80,
      P(30) => tmp_product_n_81,
      P(29) => tmp_product_n_82,
      P(28) => tmp_product_n_83,
      P(27) => tmp_product_n_84,
      P(26) => tmp_product_n_85,
      P(25) => tmp_product_n_86,
      P(24) => tmp_product_n_87,
      P(23) => tmp_product_n_88,
      P(22) => tmp_product_n_89,
      P(21) => tmp_product_n_90,
      P(20) => tmp_product_n_91,
      P(19) => tmp_product_n_92,
      P(18) => tmp_product_n_93,
      P(17) => tmp_product_n_94,
      P(16) => tmp_product_n_95,
      P(15) => tmp_product_n_96,
      P(14) => tmp_product_n_97,
      P(13) => tmp_product_n_98,
      P(12) => tmp_product_n_99,
      P(11) => tmp_product_n_100,
      P(10) => tmp_product_n_101,
      P(9) => tmp_product_n_102,
      P(8) => tmp_product_n_103,
      P(7) => tmp_product_n_104,
      P(6) => tmp_product_n_105,
      P(5) => tmp_product_n_106,
      P(4) => tmp_product_n_107,
      P(3) => tmp_product_n_108,
      P(2) => tmp_product_n_109,
      P(1) => tmp_product_n_110,
      P(0) => tmp_product_n_111,
      PATTERNBDETECT => NLW_tmp_product_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_tmp_product_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => tmp_product_n_112,
      PCOUT(46) => tmp_product_n_113,
      PCOUT(45) => tmp_product_n_114,
      PCOUT(44) => tmp_product_n_115,
      PCOUT(43) => tmp_product_n_116,
      PCOUT(42) => tmp_product_n_117,
      PCOUT(41) => tmp_product_n_118,
      PCOUT(40) => tmp_product_n_119,
      PCOUT(39) => tmp_product_n_120,
      PCOUT(38) => tmp_product_n_121,
      PCOUT(37) => tmp_product_n_122,
      PCOUT(36) => tmp_product_n_123,
      PCOUT(35) => tmp_product_n_124,
      PCOUT(34) => tmp_product_n_125,
      PCOUT(33) => tmp_product_n_126,
      PCOUT(32) => tmp_product_n_127,
      PCOUT(31) => tmp_product_n_128,
      PCOUT(30) => tmp_product_n_129,
      PCOUT(29) => tmp_product_n_130,
      PCOUT(28) => tmp_product_n_131,
      PCOUT(27) => tmp_product_n_132,
      PCOUT(26) => tmp_product_n_133,
      PCOUT(25) => tmp_product_n_134,
      PCOUT(24) => tmp_product_n_135,
      PCOUT(23) => tmp_product_n_136,
      PCOUT(22) => tmp_product_n_137,
      PCOUT(21) => tmp_product_n_138,
      PCOUT(20) => tmp_product_n_139,
      PCOUT(19) => tmp_product_n_140,
      PCOUT(18) => tmp_product_n_141,
      PCOUT(17) => tmp_product_n_142,
      PCOUT(16) => tmp_product_n_143,
      PCOUT(15) => tmp_product_n_144,
      PCOUT(14) => tmp_product_n_145,
      PCOUT(13) => tmp_product_n_146,
      PCOUT(12) => tmp_product_n_147,
      PCOUT(11) => tmp_product_n_148,
      PCOUT(10) => tmp_product_n_149,
      PCOUT(9) => tmp_product_n_150,
      PCOUT(8) => tmp_product_n_151,
      PCOUT(7) => tmp_product_n_152,
      PCOUT(6) => tmp_product_n_153,
      PCOUT(5) => tmp_product_n_154,
      PCOUT(4) => tmp_product_n_155,
      PCOUT(3) => tmp_product_n_156,
      PCOUT(2) => tmp_product_n_157,
      PCOUT(1) => tmp_product_n_158,
      PCOUT(0) => tmp_product_n_159,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_tmp_product_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_tmp_product_XOROUT_UNCONNECTED(7 downto 0)
    );
\tmp_product__0\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => grp_fu_382_p0(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29) => \tmp_product__0_n_30\,
      ACOUT(28) => \tmp_product__0_n_31\,
      ACOUT(27) => \tmp_product__0_n_32\,
      ACOUT(26) => \tmp_product__0_n_33\,
      ACOUT(25) => \tmp_product__0_n_34\,
      ACOUT(24) => \tmp_product__0_n_35\,
      ACOUT(23) => \tmp_product__0_n_36\,
      ACOUT(22) => \tmp_product__0_n_37\,
      ACOUT(21) => \tmp_product__0_n_38\,
      ACOUT(20) => \tmp_product__0_n_39\,
      ACOUT(19) => \tmp_product__0_n_40\,
      ACOUT(18) => \tmp_product__0_n_41\,
      ACOUT(17) => \tmp_product__0_n_42\,
      ACOUT(16) => \tmp_product__0_n_43\,
      ACOUT(15) => \tmp_product__0_n_44\,
      ACOUT(14) => \tmp_product__0_n_45\,
      ACOUT(13) => \tmp_product__0_n_46\,
      ACOUT(12) => \tmp_product__0_n_47\,
      ACOUT(11) => \tmp_product__0_n_48\,
      ACOUT(10) => \tmp_product__0_n_49\,
      ACOUT(9) => \tmp_product__0_n_50\,
      ACOUT(8) => \tmp_product__0_n_51\,
      ACOUT(7) => \tmp_product__0_n_52\,
      ACOUT(6) => \tmp_product__0_n_53\,
      ACOUT(5) => \tmp_product__0_n_54\,
      ACOUT(4) => \tmp_product__0_n_55\,
      ACOUT(3) => \tmp_product__0_n_56\,
      ACOUT(2) => \tmp_product__0_n_57\,
      ACOUT(1) => \tmp_product__0_n_58\,
      ACOUT(0) => \tmp_product__0_n_59\,
      ALUMODE(3 downto 0) => B"0000",
      B(17) => '0',
      B(16 downto 0) => grp_fu_382_p1(16 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_tmp_product__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_tmp_product__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_tmp_product__0_OVERFLOW_UNCONNECTED\,
      P(47) => \tmp_product__0_n_64\,
      P(46) => \tmp_product__0_n_65\,
      P(45) => \tmp_product__0_n_66\,
      P(44) => \tmp_product__0_n_67\,
      P(43) => \tmp_product__0_n_68\,
      P(42) => \tmp_product__0_n_69\,
      P(41) => \tmp_product__0_n_70\,
      P(40) => \tmp_product__0_n_71\,
      P(39) => \tmp_product__0_n_72\,
      P(38) => \tmp_product__0_n_73\,
      P(37) => \tmp_product__0_n_74\,
      P(36) => \tmp_product__0_n_75\,
      P(35) => \tmp_product__0_n_76\,
      P(34) => \tmp_product__0_n_77\,
      P(33) => \tmp_product__0_n_78\,
      P(32) => \tmp_product__0_n_79\,
      P(31) => \tmp_product__0_n_80\,
      P(30) => \tmp_product__0_n_81\,
      P(29) => \tmp_product__0_n_82\,
      P(28) => \tmp_product__0_n_83\,
      P(27) => \tmp_product__0_n_84\,
      P(26) => \tmp_product__0_n_85\,
      P(25) => \tmp_product__0_n_86\,
      P(24) => \tmp_product__0_n_87\,
      P(23) => \tmp_product__0_n_88\,
      P(22) => \tmp_product__0_n_89\,
      P(21) => \tmp_product__0_n_90\,
      P(20) => \tmp_product__0_n_91\,
      P(19) => \tmp_product__0_n_92\,
      P(18) => \tmp_product__0_n_93\,
      P(17) => \tmp_product__0_n_94\,
      P(16) => \tmp_product__0_n_95\,
      P(15 downto 0) => D(15 downto 0),
      PATTERNBDETECT => \NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => \tmp_product__0_n_112\,
      PCOUT(46) => \tmp_product__0_n_113\,
      PCOUT(45) => \tmp_product__0_n_114\,
      PCOUT(44) => \tmp_product__0_n_115\,
      PCOUT(43) => \tmp_product__0_n_116\,
      PCOUT(42) => \tmp_product__0_n_117\,
      PCOUT(41) => \tmp_product__0_n_118\,
      PCOUT(40) => \tmp_product__0_n_119\,
      PCOUT(39) => \tmp_product__0_n_120\,
      PCOUT(38) => \tmp_product__0_n_121\,
      PCOUT(37) => \tmp_product__0_n_122\,
      PCOUT(36) => \tmp_product__0_n_123\,
      PCOUT(35) => \tmp_product__0_n_124\,
      PCOUT(34) => \tmp_product__0_n_125\,
      PCOUT(33) => \tmp_product__0_n_126\,
      PCOUT(32) => \tmp_product__0_n_127\,
      PCOUT(31) => \tmp_product__0_n_128\,
      PCOUT(30) => \tmp_product__0_n_129\,
      PCOUT(29) => \tmp_product__0_n_130\,
      PCOUT(28) => \tmp_product__0_n_131\,
      PCOUT(27) => \tmp_product__0_n_132\,
      PCOUT(26) => \tmp_product__0_n_133\,
      PCOUT(25) => \tmp_product__0_n_134\,
      PCOUT(24) => \tmp_product__0_n_135\,
      PCOUT(23) => \tmp_product__0_n_136\,
      PCOUT(22) => \tmp_product__0_n_137\,
      PCOUT(21) => \tmp_product__0_n_138\,
      PCOUT(20) => \tmp_product__0_n_139\,
      PCOUT(19) => \tmp_product__0_n_140\,
      PCOUT(18) => \tmp_product__0_n_141\,
      PCOUT(17) => \tmp_product__0_n_142\,
      PCOUT(16) => \tmp_product__0_n_143\,
      PCOUT(15) => \tmp_product__0_n_144\,
      PCOUT(14) => \tmp_product__0_n_145\,
      PCOUT(13) => \tmp_product__0_n_146\,
      PCOUT(12) => \tmp_product__0_n_147\,
      PCOUT(11) => \tmp_product__0_n_148\,
      PCOUT(10) => \tmp_product__0_n_149\,
      PCOUT(9) => \tmp_product__0_n_150\,
      PCOUT(8) => \tmp_product__0_n_151\,
      PCOUT(7) => \tmp_product__0_n_152\,
      PCOUT(6) => \tmp_product__0_n_153\,
      PCOUT(5) => \tmp_product__0_n_154\,
      PCOUT(4) => \tmp_product__0_n_155\,
      PCOUT(3) => \tmp_product__0_n_156\,
      PCOUT(2) => \tmp_product__0_n_157\,
      PCOUT(1) => \tmp_product__0_n_158\,
      PCOUT(0) => \tmp_product__0_n_159\,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_tmp_product__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_tmp_product__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
\tmp_product__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(16),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(16),
      O => grp_fu_382_p0(16)
    );
\tmp_product__0_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(7),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(7),
      O => grp_fu_382_p0(7)
    );
\tmp_product__0_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(6),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(6),
      O => grp_fu_382_p0(6)
    );
\tmp_product__0_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(5),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(5),
      O => grp_fu_382_p0(5)
    );
\tmp_product__0_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(4),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(4),
      O => grp_fu_382_p0(4)
    );
\tmp_product__0_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(3),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(3),
      O => grp_fu_382_p0(3)
    );
\tmp_product__0_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(2),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(2),
      O => grp_fu_382_p0(2)
    );
\tmp_product__0_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(1),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(1),
      O => grp_fu_382_p0(1)
    );
\tmp_product__0_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(0),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(0),
      O => grp_fu_382_p0(0)
    );
\tmp_product__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(15),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(15),
      O => grp_fu_382_p0(15)
    );
\tmp_product__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(14),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(14),
      O => grp_fu_382_p0(14)
    );
\tmp_product__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(13),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(13),
      O => grp_fu_382_p0(13)
    );
\tmp_product__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(12),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(12),
      O => grp_fu_382_p0(12)
    );
\tmp_product__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(11),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(11),
      O => grp_fu_382_p0(11)
    );
\tmp_product__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(10),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(10),
      O => grp_fu_382_p0(10)
    );
\tmp_product__0_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(9),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(9),
      O => grp_fu_382_p0(9)
    );
\tmp_product__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(8),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(8),
      O => grp_fu_382_p0(8)
    );
\tmp_product__1\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "CASCADE",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 0) => B"000000000000000000000000000000",
      ACIN(29) => \tmp_product__0_n_30\,
      ACIN(28) => \tmp_product__0_n_31\,
      ACIN(27) => \tmp_product__0_n_32\,
      ACIN(26) => \tmp_product__0_n_33\,
      ACIN(25) => \tmp_product__0_n_34\,
      ACIN(24) => \tmp_product__0_n_35\,
      ACIN(23) => \tmp_product__0_n_36\,
      ACIN(22) => \tmp_product__0_n_37\,
      ACIN(21) => \tmp_product__0_n_38\,
      ACIN(20) => \tmp_product__0_n_39\,
      ACIN(19) => \tmp_product__0_n_40\,
      ACIN(18) => \tmp_product__0_n_41\,
      ACIN(17) => \tmp_product__0_n_42\,
      ACIN(16) => \tmp_product__0_n_43\,
      ACIN(15) => \tmp_product__0_n_44\,
      ACIN(14) => \tmp_product__0_n_45\,
      ACIN(13) => \tmp_product__0_n_46\,
      ACIN(12) => \tmp_product__0_n_47\,
      ACIN(11) => \tmp_product__0_n_48\,
      ACIN(10) => \tmp_product__0_n_49\,
      ACIN(9) => \tmp_product__0_n_50\,
      ACIN(8) => \tmp_product__0_n_51\,
      ACIN(7) => \tmp_product__0_n_52\,
      ACIN(6) => \tmp_product__0_n_53\,
      ACIN(5) => \tmp_product__0_n_54\,
      ACIN(4) => \tmp_product__0_n_55\,
      ACIN(3) => \tmp_product__0_n_56\,
      ACIN(2) => \tmp_product__0_n_57\,
      ACIN(1) => \tmp_product__0_n_58\,
      ACIN(0) => \tmp_product__0_n_59\,
      ACOUT(29 downto 0) => \NLW_tmp_product__1_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => grp_fu_382_p1(31),
      B(16) => grp_fu_382_p1(31),
      B(15) => grp_fu_382_p1(31),
      B(14 downto 0) => grp_fu_382_p1(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_tmp_product__1_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_tmp_product__1_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_tmp_product__1_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_tmp_product__1_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => \NLW_tmp_product__1_OVERFLOW_UNCONNECTED\,
      P(47) => \tmp_product__1_n_64\,
      P(46) => \tmp_product__1_n_65\,
      P(45) => \tmp_product__1_n_66\,
      P(44) => \tmp_product__1_n_67\,
      P(43) => \tmp_product__1_n_68\,
      P(42) => \tmp_product__1_n_69\,
      P(41) => \tmp_product__1_n_70\,
      P(40) => \tmp_product__1_n_71\,
      P(39) => \tmp_product__1_n_72\,
      P(38) => \tmp_product__1_n_73\,
      P(37) => \tmp_product__1_n_74\,
      P(36) => \tmp_product__1_n_75\,
      P(35) => \tmp_product__1_n_76\,
      P(34) => \tmp_product__1_n_77\,
      P(33) => \tmp_product__1_n_78\,
      P(32) => \tmp_product__1_n_79\,
      P(31) => \tmp_product__1_n_80\,
      P(30) => \tmp_product__1_n_81\,
      P(29) => \tmp_product__1_n_82\,
      P(28) => \tmp_product__1_n_83\,
      P(27) => \tmp_product__1_n_84\,
      P(26) => \tmp_product__1_n_85\,
      P(25) => \tmp_product__1_n_86\,
      P(24) => \tmp_product__1_n_87\,
      P(23) => \tmp_product__1_n_88\,
      P(22) => \tmp_product__1_n_89\,
      P(21) => \tmp_product__1_n_90\,
      P(20) => \tmp_product__1_n_91\,
      P(19) => \tmp_product__1_n_92\,
      P(18) => \tmp_product__1_n_93\,
      P(17) => \tmp_product__1_n_94\,
      P(16) => \tmp_product__1_n_95\,
      P(15) => \tmp_product__1_n_96\,
      P(14) => \tmp_product__1_n_97\,
      P(13) => \tmp_product__1_n_98\,
      P(12) => \tmp_product__1_n_99\,
      P(11) => \tmp_product__1_n_100\,
      P(10) => \tmp_product__1_n_101\,
      P(9) => \tmp_product__1_n_102\,
      P(8) => \tmp_product__1_n_103\,
      P(7) => \tmp_product__1_n_104\,
      P(6) => \tmp_product__1_n_105\,
      P(5) => \tmp_product__1_n_106\,
      P(4) => \tmp_product__1_n_107\,
      P(3) => \tmp_product__1_n_108\,
      P(2) => \tmp_product__1_n_109\,
      P(1) => \tmp_product__1_n_110\,
      P(0) => \tmp_product__1_n_111\,
      PATTERNBDETECT => \NLW_tmp_product__1_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_tmp_product__1_PATTERNDETECT_UNCONNECTED\,
      PCIN(47) => \tmp_product__0_n_112\,
      PCIN(46) => \tmp_product__0_n_113\,
      PCIN(45) => \tmp_product__0_n_114\,
      PCIN(44) => \tmp_product__0_n_115\,
      PCIN(43) => \tmp_product__0_n_116\,
      PCIN(42) => \tmp_product__0_n_117\,
      PCIN(41) => \tmp_product__0_n_118\,
      PCIN(40) => \tmp_product__0_n_119\,
      PCIN(39) => \tmp_product__0_n_120\,
      PCIN(38) => \tmp_product__0_n_121\,
      PCIN(37) => \tmp_product__0_n_122\,
      PCIN(36) => \tmp_product__0_n_123\,
      PCIN(35) => \tmp_product__0_n_124\,
      PCIN(34) => \tmp_product__0_n_125\,
      PCIN(33) => \tmp_product__0_n_126\,
      PCIN(32) => \tmp_product__0_n_127\,
      PCIN(31) => \tmp_product__0_n_128\,
      PCIN(30) => \tmp_product__0_n_129\,
      PCIN(29) => \tmp_product__0_n_130\,
      PCIN(28) => \tmp_product__0_n_131\,
      PCIN(27) => \tmp_product__0_n_132\,
      PCIN(26) => \tmp_product__0_n_133\,
      PCIN(25) => \tmp_product__0_n_134\,
      PCIN(24) => \tmp_product__0_n_135\,
      PCIN(23) => \tmp_product__0_n_136\,
      PCIN(22) => \tmp_product__0_n_137\,
      PCIN(21) => \tmp_product__0_n_138\,
      PCIN(20) => \tmp_product__0_n_139\,
      PCIN(19) => \tmp_product__0_n_140\,
      PCIN(18) => \tmp_product__0_n_141\,
      PCIN(17) => \tmp_product__0_n_142\,
      PCIN(16) => \tmp_product__0_n_143\,
      PCIN(15) => \tmp_product__0_n_144\,
      PCIN(14) => \tmp_product__0_n_145\,
      PCIN(13) => \tmp_product__0_n_146\,
      PCIN(12) => \tmp_product__0_n_147\,
      PCIN(11) => \tmp_product__0_n_148\,
      PCIN(10) => \tmp_product__0_n_149\,
      PCIN(9) => \tmp_product__0_n_150\,
      PCIN(8) => \tmp_product__0_n_151\,
      PCIN(7) => \tmp_product__0_n_152\,
      PCIN(6) => \tmp_product__0_n_153\,
      PCIN(5) => \tmp_product__0_n_154\,
      PCIN(4) => \tmp_product__0_n_155\,
      PCIN(3) => \tmp_product__0_n_156\,
      PCIN(2) => \tmp_product__0_n_157\,
      PCIN(1) => \tmp_product__0_n_158\,
      PCIN(0) => \tmp_product__0_n_159\,
      PCOUT(47 downto 0) => \NLW_tmp_product__1_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_tmp_product__1_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_tmp_product__1_XOROUT_UNCONNECTED\(7 downto 0)
    );
\tmp_product__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(31),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(31),
      O => grp_fu_382_p1(31)
    );
\tmp_product__1_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(22),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(22),
      O => grp_fu_382_p1(22)
    );
\tmp_product__1_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(21),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(21),
      O => grp_fu_382_p1(21)
    );
\tmp_product__1_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(20),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(20),
      O => grp_fu_382_p1(20)
    );
\tmp_product__1_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(19),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(19),
      O => grp_fu_382_p1(19)
    );
\tmp_product__1_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(18),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(18),
      O => grp_fu_382_p1(18)
    );
\tmp_product__1_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(17),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(17),
      O => grp_fu_382_p1(17)
    );
\tmp_product__1_i_16\: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_33_n_6,
      CI_TOP => '0',
      CO(7) => \NLW_tmp_product__1_i_16_CO_UNCONNECTED\(7),
      CO(6) => \tmp_product__1_i_16_n_7\,
      CO(5) => \tmp_product__1_i_16_n_8\,
      CO(4) => \tmp_product__1_i_16_n_9\,
      CO(3) => \tmp_product__1_i_16_n_10\,
      CO(2) => \tmp_product__1_i_16_n_11\,
      CO(1) => \tmp_product__1_i_16_n_12\,
      CO(0) => \tmp_product__1_i_16_n_13\,
      DI(7) => '0',
      DI(6) => \tmp_product__1_i_17_n_6\,
      DI(5) => \tmp_product__1_i_18_n_6\,
      DI(4) => \tmp_product__1_i_19_n_6\,
      DI(3) => \tmp_product__1_i_20_n_6\,
      DI(2) => \tmp_product__1_i_21_n_6\,
      DI(1) => \tmp_product__1_i_22_n_6\,
      DI(0) => \tmp_product__1_i_23_n_6\,
      O(7 downto 0) => add_ln48_4_fu_826_p2(31 downto 24),
      S(7) => \tmp_product__1_i_24_n_6\,
      S(6) => \tmp_product__1_i_25_n_6\,
      S(5) => \tmp_product__1_i_26_n_6\,
      S(4) => \tmp_product__1_i_27_n_6\,
      S(3) => \tmp_product__1_i_28_n_6\,
      S(2) => \tmp_product__1_i_29_n_6\,
      S(1) => \tmp_product__1_i_30_n_6\,
      S(0) => \tmp_product__1_i_31_n_6\
    );
\tmp_product__1_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_16\,
      I1 => orig_q1(29),
      I2 => \tmp_product__1_i_16_0\(29),
      O => \tmp_product__1_i_17_n_6\
    );
\tmp_product__1_i_18\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_17\,
      I1 => orig_q1(28),
      I2 => \tmp_product__1_i_16_0\(28),
      O => \tmp_product__1_i_18_n_6\
    );
\tmp_product__1_i_19\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_18\,
      I1 => orig_q1(27),
      I2 => \tmp_product__1_i_16_0\(27),
      O => \tmp_product__1_i_19_n_6\
    );
\tmp_product__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(30),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(30),
      O => grp_fu_382_p1(30)
    );
\tmp_product__1_i_20\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_19\,
      I1 => orig_q1(26),
      I2 => \tmp_product__1_i_16_0\(26),
      O => \tmp_product__1_i_20_n_6\
    );
\tmp_product__1_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_20\,
      I1 => orig_q1(25),
      I2 => \tmp_product__1_i_16_0\(25),
      O => \tmp_product__1_i_21_n_6\
    );
\tmp_product__1_i_22\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_n_21\,
      I1 => orig_q1(24),
      I2 => \tmp_product__1_i_16_0\(24),
      O => \tmp_product__1_i_22_n_6\
    );
\tmp_product__1_i_23\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_14,
      I1 => orig_q1(23),
      I2 => \tmp_product__1_i_16_0\(23),
      O => \tmp_product__1_i_23_n_6\
    );
\tmp_product__1_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(30),
      I1 => orig_q1(30),
      I2 => \tmp_product__1_i_32_n_15\,
      I3 => \tmp_product__1_i_16_0\(31),
      I4 => orig_q1(31),
      I5 => \tmp_product__1_i_32_n_14\,
      O => \tmp_product__1_i_24_n_6\
    );
\tmp_product__1_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(29),
      I1 => orig_q1(29),
      I2 => \tmp_product__1_i_32_n_16\,
      I3 => \tmp_product__1_i_32_n_15\,
      I4 => orig_q1(30),
      I5 => \tmp_product__1_i_16_0\(30),
      O => \tmp_product__1_i_25_n_6\
    );
\tmp_product__1_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(28),
      I1 => orig_q1(28),
      I2 => \tmp_product__1_i_32_n_17\,
      I3 => \tmp_product__1_i_32_n_16\,
      I4 => orig_q1(29),
      I5 => \tmp_product__1_i_16_0\(29),
      O => \tmp_product__1_i_26_n_6\
    );
\tmp_product__1_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(27),
      I1 => orig_q1(27),
      I2 => \tmp_product__1_i_32_n_18\,
      I3 => \tmp_product__1_i_32_n_17\,
      I4 => orig_q1(28),
      I5 => \tmp_product__1_i_16_0\(28),
      O => \tmp_product__1_i_27_n_6\
    );
\tmp_product__1_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(26),
      I1 => orig_q1(26),
      I2 => \tmp_product__1_i_32_n_19\,
      I3 => \tmp_product__1_i_32_n_18\,
      I4 => orig_q1(27),
      I5 => \tmp_product__1_i_16_0\(27),
      O => \tmp_product__1_i_28_n_6\
    );
\tmp_product__1_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(25),
      I1 => orig_q1(25),
      I2 => \tmp_product__1_i_32_n_20\,
      I3 => \tmp_product__1_i_32_n_19\,
      I4 => orig_q1(26),
      I5 => \tmp_product__1_i_16_0\(26),
      O => \tmp_product__1_i_29_n_6\
    );
\tmp_product__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(29),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(29),
      O => grp_fu_382_p1(29)
    );
\tmp_product__1_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(24),
      I1 => orig_q1(24),
      I2 => \tmp_product__1_i_32_n_21\,
      I3 => \tmp_product__1_i_32_n_20\,
      I4 => orig_q1(25),
      I5 => \tmp_product__1_i_16_0\(25),
      O => \tmp_product__1_i_30_n_6\
    );
\tmp_product__1_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(23),
      I1 => orig_q1(23),
      I2 => tmp_product_i_83_n_14,
      I3 => \tmp_product__1_i_32_n_21\,
      I4 => orig_q1(24),
      I5 => \tmp_product__1_i_16_0\(24),
      O => \tmp_product__1_i_31_n_6\
    );
\tmp_product__1_i_32\: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_83_n_6,
      CI_TOP => '0',
      CO(7) => \NLW_tmp_product__1_i_32_CO_UNCONNECTED\(7),
      CO(6) => \tmp_product__1_i_32_n_7\,
      CO(5) => \tmp_product__1_i_32_n_8\,
      CO(4) => \tmp_product__1_i_32_n_9\,
      CO(3) => \tmp_product__1_i_32_n_10\,
      CO(2) => \tmp_product__1_i_32_n_11\,
      CO(1) => \tmp_product__1_i_32_n_12\,
      CO(0) => \tmp_product__1_i_32_n_13\,
      DI(7) => '0',
      DI(6) => \tmp_product__1_i_33_n_6\,
      DI(5) => \tmp_product__1_i_34_n_6\,
      DI(4) => \tmp_product__1_i_35_n_6\,
      DI(3) => \tmp_product__1_i_36_n_6\,
      DI(2) => \tmp_product__1_i_37_n_6\,
      DI(1) => \tmp_product__1_i_38_n_6\,
      DI(0) => \tmp_product__1_i_39_n_6\,
      O(7) => \tmp_product__1_i_32_n_14\,
      O(6) => \tmp_product__1_i_32_n_15\,
      O(5) => \tmp_product__1_i_32_n_16\,
      O(4) => \tmp_product__1_i_32_n_17\,
      O(3) => \tmp_product__1_i_32_n_18\,
      O(2) => \tmp_product__1_i_32_n_19\,
      O(1) => \tmp_product__1_i_32_n_20\,
      O(0) => \tmp_product__1_i_32_n_21\,
      S(7) => \tmp_product__1_i_40_n_6\,
      S(6) => \tmp_product__1_i_41_n_6\,
      S(5) => \tmp_product__1_i_42_n_6\,
      S(4) => \tmp_product__1_i_43_n_6\,
      S(3) => \tmp_product__1_i_44_n_6\,
      S(2) => \tmp_product__1_i_45_n_6\,
      S(1) => \tmp_product__1_i_46_n_6\,
      S(0) => \tmp_product__1_i_47_n_6\
    );
\tmp_product__1_i_33\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(29),
      I1 => orig_q0(29),
      I2 => \tmp_product__1_i_32_0\(29),
      O => \tmp_product__1_i_33_n_6\
    );
\tmp_product__1_i_34\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(28),
      I1 => orig_q0(28),
      I2 => \tmp_product__1_i_32_0\(28),
      O => \tmp_product__1_i_34_n_6\
    );
\tmp_product__1_i_35\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(27),
      I1 => orig_q0(27),
      I2 => \tmp_product__1_i_32_0\(27),
      O => \tmp_product__1_i_35_n_6\
    );
\tmp_product__1_i_36\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(26),
      I1 => orig_q0(26),
      I2 => \tmp_product__1_i_32_0\(26),
      O => \tmp_product__1_i_36_n_6\
    );
\tmp_product__1_i_37\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(25),
      I1 => orig_q0(25),
      I2 => \tmp_product__1_i_32_0\(25),
      O => \tmp_product__1_i_37_n_6\
    );
\tmp_product__1_i_38\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(24),
      I1 => orig_q0(24),
      I2 => \tmp_product__1_i_32_0\(24),
      O => \tmp_product__1_i_38_n_6\
    );
\tmp_product__1_i_39\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(23),
      I1 => orig_q0(23),
      I2 => \tmp_product__1_i_32_0\(23),
      O => \tmp_product__1_i_39_n_6\
    );
\tmp_product__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(28),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(28),
      O => grp_fu_382_p1(28)
    );
\tmp_product__1_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969699669969696"
    )
        port map (
      I0 => orig_q0(31),
      I1 => Q(31),
      I2 => \tmp_product__1_i_32_0\(31),
      I3 => Q(30),
      I4 => orig_q0(30),
      I5 => \tmp_product__1_i_32_0\(30),
      O => \tmp_product__1_i_40_n_6\
    );
\tmp_product__1_i_41\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \tmp_product__1_i_33_n_6\,
      I1 => Q(30),
      I2 => orig_q0(30),
      I3 => \tmp_product__1_i_32_0\(30),
      O => \tmp_product__1_i_41_n_6\
    );
\tmp_product__1_i_42\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(29),
      I1 => orig_q0(29),
      I2 => \tmp_product__1_i_32_0\(29),
      I3 => \tmp_product__1_i_34_n_6\,
      O => \tmp_product__1_i_42_n_6\
    );
\tmp_product__1_i_43\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(28),
      I1 => orig_q0(28),
      I2 => \tmp_product__1_i_32_0\(28),
      I3 => \tmp_product__1_i_35_n_6\,
      O => \tmp_product__1_i_43_n_6\
    );
\tmp_product__1_i_44\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(27),
      I1 => orig_q0(27),
      I2 => \tmp_product__1_i_32_0\(27),
      I3 => \tmp_product__1_i_36_n_6\,
      O => \tmp_product__1_i_44_n_6\
    );
\tmp_product__1_i_45\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(26),
      I1 => orig_q0(26),
      I2 => \tmp_product__1_i_32_0\(26),
      I3 => \tmp_product__1_i_37_n_6\,
      O => \tmp_product__1_i_45_n_6\
    );
\tmp_product__1_i_46\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(25),
      I1 => orig_q0(25),
      I2 => \tmp_product__1_i_32_0\(25),
      I3 => \tmp_product__1_i_38_n_6\,
      O => \tmp_product__1_i_46_n_6\
    );
\tmp_product__1_i_47\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q(24),
      I1 => orig_q0(24),
      I2 => \tmp_product__1_i_32_0\(24),
      I3 => \tmp_product__1_i_39_n_6\,
      O => \tmp_product__1_i_47_n_6\
    );
\tmp_product__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(27),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(27),
      O => grp_fu_382_p1(27)
    );
\tmp_product__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(26),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(26),
      O => grp_fu_382_p1(26)
    );
\tmp_product__1_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(25),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(25),
      O => grp_fu_382_p1(25)
    );
\tmp_product__1_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(24),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(24),
      O => grp_fu_382_p1(24)
    );
\tmp_product__1_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(23),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(23),
      O => grp_fu_382_p1(23)
    );
tmp_product_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(31),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(31),
      O => grp_fu_382_p0(31)
    );
tmp_product_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(22),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(22),
      O => grp_fu_382_p0(22)
    );
tmp_product_i_100: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(16),
      I1 => orig_q0(16),
      I2 => Q(16),
      I3 => Q(17),
      I4 => orig_q0(17),
      I5 => \tmp_product__1_i_32_0\(17),
      O => tmp_product_i_100_n_6
    );
tmp_product_i_101: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(15),
      I1 => orig_q0(15),
      I2 => Q(15),
      I3 => Q(16),
      I4 => orig_q0(16),
      I5 => \tmp_product__1_i_32_0\(16),
      O => tmp_product_i_101_n_6
    );
tmp_product_i_102: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(14),
      I1 => orig_q0(14),
      I2 => \tmp_product__1_i_32_0\(14),
      O => tmp_product_i_102_n_6
    );
tmp_product_i_103: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(13),
      I1 => orig_q0(13),
      I2 => \tmp_product__1_i_32_0\(13),
      O => tmp_product_i_103_n_6
    );
tmp_product_i_104: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(12),
      I1 => orig_q0(12),
      I2 => \tmp_product__1_i_32_0\(12),
      O => tmp_product_i_104_n_6
    );
tmp_product_i_105: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(11),
      I1 => orig_q0(11),
      I2 => \tmp_product__1_i_32_0\(11),
      O => tmp_product_i_105_n_6
    );
tmp_product_i_106: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(10),
      I1 => orig_q0(10),
      I2 => \tmp_product__1_i_32_0\(10),
      O => tmp_product_i_106_n_6
    );
tmp_product_i_107: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(9),
      I1 => orig_q0(9),
      I2 => \tmp_product__1_i_32_0\(9),
      O => tmp_product_i_107_n_6
    );
tmp_product_i_108: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(8),
      I1 => orig_q0(8),
      I2 => \tmp_product__1_i_32_0\(8),
      O => tmp_product_i_108_n_6
    );
tmp_product_i_109: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(7),
      I1 => orig_q0(7),
      I2 => \tmp_product__1_i_32_0\(7),
      O => tmp_product_i_109_n_6
    );
tmp_product_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(21),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(21),
      O => grp_fu_382_p0(21)
    );
tmp_product_i_110: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(14),
      I1 => orig_q0(14),
      I2 => Q(14),
      I3 => Q(15),
      I4 => orig_q0(15),
      I5 => \tmp_product__1_i_32_0\(15),
      O => tmp_product_i_110_n_6
    );
tmp_product_i_111: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(13),
      I1 => orig_q0(13),
      I2 => Q(13),
      I3 => Q(14),
      I4 => orig_q0(14),
      I5 => \tmp_product__1_i_32_0\(14),
      O => tmp_product_i_111_n_6
    );
tmp_product_i_112: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(12),
      I1 => orig_q0(12),
      I2 => Q(12),
      I3 => Q(13),
      I4 => orig_q0(13),
      I5 => \tmp_product__1_i_32_0\(13),
      O => tmp_product_i_112_n_6
    );
tmp_product_i_113: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(11),
      I1 => orig_q0(11),
      I2 => Q(11),
      I3 => Q(12),
      I4 => orig_q0(12),
      I5 => \tmp_product__1_i_32_0\(12),
      O => tmp_product_i_113_n_6
    );
tmp_product_i_114: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(10),
      I1 => orig_q0(10),
      I2 => Q(10),
      I3 => Q(11),
      I4 => orig_q0(11),
      I5 => \tmp_product__1_i_32_0\(11),
      O => tmp_product_i_114_n_6
    );
tmp_product_i_115: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(9),
      I1 => orig_q0(9),
      I2 => Q(9),
      I3 => Q(10),
      I4 => orig_q0(10),
      I5 => \tmp_product__1_i_32_0\(10),
      O => tmp_product_i_115_n_6
    );
tmp_product_i_116: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(8),
      I1 => orig_q0(8),
      I2 => Q(8),
      I3 => Q(9),
      I4 => orig_q0(9),
      I5 => \tmp_product__1_i_32_0\(9),
      O => tmp_product_i_116_n_6
    );
tmp_product_i_117: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(7),
      I1 => orig_q0(7),
      I2 => Q(7),
      I3 => Q(8),
      I4 => orig_q0(8),
      I5 => \tmp_product__1_i_32_0\(8),
      O => tmp_product_i_117_n_6
    );
tmp_product_i_118: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(6),
      I1 => orig_q0(6),
      I2 => \tmp_product__1_i_32_0\(6),
      O => tmp_product_i_118_n_6
    );
tmp_product_i_119: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(5),
      I1 => orig_q0(5),
      I2 => \tmp_product__1_i_32_0\(5),
      O => tmp_product_i_119_n_6
    );
tmp_product_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(20),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(20),
      O => grp_fu_382_p0(20)
    );
tmp_product_i_120: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(4),
      I1 => orig_q0(4),
      I2 => \tmp_product__1_i_32_0\(4),
      O => tmp_product_i_120_n_6
    );
tmp_product_i_121: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(3),
      I1 => orig_q0(3),
      I2 => \tmp_product__1_i_32_0\(3),
      O => tmp_product_i_121_n_6
    );
tmp_product_i_122: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(2),
      I1 => orig_q0(2),
      I2 => \tmp_product__1_i_32_0\(2),
      O => tmp_product_i_122_n_6
    );
tmp_product_i_123: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(1),
      I1 => orig_q0(1),
      I2 => \tmp_product__1_i_32_0\(1),
      O => tmp_product_i_123_n_6
    );
tmp_product_i_124: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => orig_q0(0),
      I1 => Q(0),
      I2 => \tmp_product__1_i_32_0\(0),
      O => tmp_product_i_124_n_6
    );
tmp_product_i_125: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(6),
      I1 => orig_q0(6),
      I2 => Q(6),
      I3 => Q(7),
      I4 => orig_q0(7),
      I5 => \tmp_product__1_i_32_0\(7),
      O => tmp_product_i_125_n_6
    );
tmp_product_i_126: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(5),
      I1 => orig_q0(5),
      I2 => Q(5),
      I3 => Q(6),
      I4 => orig_q0(6),
      I5 => \tmp_product__1_i_32_0\(6),
      O => tmp_product_i_126_n_6
    );
tmp_product_i_127: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(4),
      I1 => orig_q0(4),
      I2 => Q(4),
      I3 => Q(5),
      I4 => orig_q0(5),
      I5 => \tmp_product__1_i_32_0\(5),
      O => tmp_product_i_127_n_6
    );
tmp_product_i_128: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(3),
      I1 => orig_q0(3),
      I2 => Q(3),
      I3 => Q(4),
      I4 => orig_q0(4),
      I5 => \tmp_product__1_i_32_0\(4),
      O => tmp_product_i_128_n_6
    );
tmp_product_i_129: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(2),
      I1 => orig_q0(2),
      I2 => Q(2),
      I3 => Q(3),
      I4 => orig_q0(3),
      I5 => \tmp_product__1_i_32_0\(3),
      O => tmp_product_i_129_n_6
    );
tmp_product_i_13: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(19),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(19),
      O => grp_fu_382_p0(19)
    );
tmp_product_i_130: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(1),
      I1 => orig_q0(1),
      I2 => Q(1),
      I3 => Q(2),
      I4 => orig_q0(2),
      I5 => \tmp_product__1_i_32_0\(2),
      O => tmp_product_i_130_n_6
    );
tmp_product_i_131: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(0),
      I1 => Q(0),
      I2 => orig_q0(0),
      I3 => Q(1),
      I4 => orig_q0(1),
      I5 => \tmp_product__1_i_32_0\(1),
      O => tmp_product_i_131_n_6
    );
tmp_product_i_132: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => orig_q0(0),
      I1 => \tmp_product__1_i_32_0\(0),
      I2 => Q(0),
      O => tmp_product_i_132_n_6
    );
tmp_product_i_14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(18),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(18),
      O => grp_fu_382_p0(18)
    );
tmp_product_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(17),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(17),
      O => grp_fu_382_p0(17)
    );
tmp_product_i_16: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(16),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(16),
      O => grp_fu_382_p1(16)
    );
tmp_product_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(15),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(15),
      O => grp_fu_382_p1(15)
    );
tmp_product_i_18: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(14),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(14),
      O => grp_fu_382_p1(14)
    );
tmp_product_i_19: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(13),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(13),
      O => grp_fu_382_p1(13)
    );
tmp_product_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(30),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(30),
      O => grp_fu_382_p0(30)
    );
tmp_product_i_20: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(12),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(12),
      O => grp_fu_382_p1(12)
    );
tmp_product_i_21: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(11),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(11),
      O => grp_fu_382_p1(11)
    );
tmp_product_i_22: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(10),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(10),
      O => grp_fu_382_p1(10)
    );
tmp_product_i_23: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(9),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(9),
      O => grp_fu_382_p1(9)
    );
tmp_product_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(8),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(8),
      O => grp_fu_382_p1(8)
    );
tmp_product_i_25: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(7),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(7),
      O => grp_fu_382_p1(7)
    );
tmp_product_i_26: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(6),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(6),
      O => grp_fu_382_p1(6)
    );
tmp_product_i_27: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(5),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(5),
      O => grp_fu_382_p1(5)
    );
tmp_product_i_28: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(4),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(4),
      O => grp_fu_382_p1(4)
    );
tmp_product_i_29: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(3),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(3),
      O => grp_fu_382_p1(3)
    );
tmp_product_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(29),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(29),
      O => grp_fu_382_p0(29)
    );
tmp_product_i_30: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(2),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(2),
      O => grp_fu_382_p1(2)
    );
tmp_product_i_31: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(1),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(1),
      O => grp_fu_382_p1(1)
    );
tmp_product_i_32: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_4_fu_826_p2(0),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => DSP_A_B_DATA_INST_1(0),
      O => grp_fu_382_p1(0)
    );
tmp_product_i_33: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_34_n_6,
      CI_TOP => '0',
      CO(7) => tmp_product_i_33_n_6,
      CO(6) => tmp_product_i_33_n_7,
      CO(5) => tmp_product_i_33_n_8,
      CO(4) => tmp_product_i_33_n_9,
      CO(3) => tmp_product_i_33_n_10,
      CO(2) => tmp_product_i_33_n_11,
      CO(1) => tmp_product_i_33_n_12,
      CO(0) => tmp_product_i_33_n_13,
      DI(7) => tmp_product_i_36_n_6,
      DI(6) => tmp_product_i_37_n_6,
      DI(5) => tmp_product_i_38_n_6,
      DI(4) => tmp_product_i_39_n_6,
      DI(3) => tmp_product_i_40_n_6,
      DI(2) => tmp_product_i_41_n_6,
      DI(1) => tmp_product_i_42_n_6,
      DI(0) => tmp_product_i_43_n_6,
      O(7 downto 0) => add_ln48_4_fu_826_p2(23 downto 16),
      S(7) => tmp_product_i_44_n_6,
      S(6) => tmp_product_i_45_n_6,
      S(5) => tmp_product_i_46_n_6,
      S(4) => tmp_product_i_47_n_6,
      S(3) => tmp_product_i_48_n_6,
      S(2) => tmp_product_i_49_n_6,
      S(1) => tmp_product_i_50_n_6,
      S(0) => tmp_product_i_51_n_6
    );
tmp_product_i_34: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_35_n_6,
      CI_TOP => '0',
      CO(7) => tmp_product_i_34_n_6,
      CO(6) => tmp_product_i_34_n_7,
      CO(5) => tmp_product_i_34_n_8,
      CO(4) => tmp_product_i_34_n_9,
      CO(3) => tmp_product_i_34_n_10,
      CO(2) => tmp_product_i_34_n_11,
      CO(1) => tmp_product_i_34_n_12,
      CO(0) => tmp_product_i_34_n_13,
      DI(7) => tmp_product_i_52_n_6,
      DI(6) => tmp_product_i_53_n_6,
      DI(5) => tmp_product_i_54_n_6,
      DI(4) => tmp_product_i_55_n_6,
      DI(3) => tmp_product_i_56_n_6,
      DI(2) => tmp_product_i_57_n_6,
      DI(1) => tmp_product_i_58_n_6,
      DI(0) => tmp_product_i_59_n_6,
      O(7 downto 0) => add_ln48_4_fu_826_p2(15 downto 8),
      S(7) => tmp_product_i_60_n_6,
      S(6) => tmp_product_i_61_n_6,
      S(5) => tmp_product_i_62_n_6,
      S(4) => tmp_product_i_63_n_6,
      S(3) => tmp_product_i_64_n_6,
      S(2) => tmp_product_i_65_n_6,
      S(1) => tmp_product_i_66_n_6,
      S(0) => tmp_product_i_67_n_6
    );
tmp_product_i_35: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => tmp_product_i_35_n_6,
      CO(6) => tmp_product_i_35_n_7,
      CO(5) => tmp_product_i_35_n_8,
      CO(4) => tmp_product_i_35_n_9,
      CO(3) => tmp_product_i_35_n_10,
      CO(2) => tmp_product_i_35_n_11,
      CO(1) => tmp_product_i_35_n_12,
      CO(0) => tmp_product_i_35_n_13,
      DI(7) => tmp_product_i_68_n_6,
      DI(6) => tmp_product_i_69_n_6,
      DI(5) => tmp_product_i_70_n_6,
      DI(4) => tmp_product_i_71_n_6,
      DI(3) => tmp_product_i_72_n_6,
      DI(2) => tmp_product_i_73_n_6,
      DI(1) => tmp_product_i_74_n_6,
      DI(0) => '0',
      O(7 downto 0) => add_ln48_4_fu_826_p2(7 downto 0),
      S(7) => tmp_product_i_75_n_6,
      S(6) => tmp_product_i_76_n_6,
      S(5) => tmp_product_i_77_n_6,
      S(4) => tmp_product_i_78_n_6,
      S(3) => tmp_product_i_79_n_6,
      S(2) => tmp_product_i_80_n_6,
      S(1) => tmp_product_i_81_n_6,
      S(0) => tmp_product_i_82_n_6
    );
tmp_product_i_36: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_15,
      I1 => orig_q1(22),
      I2 => \tmp_product__1_i_16_0\(22),
      O => tmp_product_i_36_n_6
    );
tmp_product_i_37: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_16,
      I1 => orig_q1(21),
      I2 => \tmp_product__1_i_16_0\(21),
      O => tmp_product_i_37_n_6
    );
tmp_product_i_38: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_17,
      I1 => orig_q1(20),
      I2 => \tmp_product__1_i_16_0\(20),
      O => tmp_product_i_38_n_6
    );
tmp_product_i_39: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_18,
      I1 => orig_q1(19),
      I2 => \tmp_product__1_i_16_0\(19),
      O => tmp_product_i_39_n_6
    );
tmp_product_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(28),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(28),
      O => grp_fu_382_p0(28)
    );
tmp_product_i_40: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_19,
      I1 => orig_q1(18),
      I2 => \tmp_product__1_i_16_0\(18),
      O => tmp_product_i_40_n_6
    );
tmp_product_i_41: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_20,
      I1 => orig_q1(17),
      I2 => \tmp_product__1_i_16_0\(17),
      O => tmp_product_i_41_n_6
    );
tmp_product_i_42: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_83_n_21,
      I1 => orig_q1(16),
      I2 => \tmp_product__1_i_16_0\(16),
      O => tmp_product_i_42_n_6
    );
tmp_product_i_43: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_14,
      I1 => orig_q1(15),
      I2 => \tmp_product__1_i_16_0\(15),
      O => tmp_product_i_43_n_6
    );
tmp_product_i_44: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(22),
      I1 => orig_q1(22),
      I2 => tmp_product_i_83_n_15,
      I3 => tmp_product_i_83_n_14,
      I4 => orig_q1(23),
      I5 => \tmp_product__1_i_16_0\(23),
      O => tmp_product_i_44_n_6
    );
tmp_product_i_45: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(21),
      I1 => orig_q1(21),
      I2 => tmp_product_i_83_n_16,
      I3 => tmp_product_i_83_n_15,
      I4 => orig_q1(22),
      I5 => \tmp_product__1_i_16_0\(22),
      O => tmp_product_i_45_n_6
    );
tmp_product_i_46: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(20),
      I1 => orig_q1(20),
      I2 => tmp_product_i_83_n_17,
      I3 => tmp_product_i_83_n_16,
      I4 => orig_q1(21),
      I5 => \tmp_product__1_i_16_0\(21),
      O => tmp_product_i_46_n_6
    );
tmp_product_i_47: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(19),
      I1 => orig_q1(19),
      I2 => tmp_product_i_83_n_18,
      I3 => tmp_product_i_83_n_17,
      I4 => orig_q1(20),
      I5 => \tmp_product__1_i_16_0\(20),
      O => tmp_product_i_47_n_6
    );
tmp_product_i_48: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(18),
      I1 => orig_q1(18),
      I2 => tmp_product_i_83_n_19,
      I3 => tmp_product_i_83_n_18,
      I4 => orig_q1(19),
      I5 => \tmp_product__1_i_16_0\(19),
      O => tmp_product_i_48_n_6
    );
tmp_product_i_49: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(17),
      I1 => orig_q1(17),
      I2 => tmp_product_i_83_n_20,
      I3 => tmp_product_i_83_n_19,
      I4 => orig_q1(18),
      I5 => \tmp_product__1_i_16_0\(18),
      O => tmp_product_i_49_n_6
    );
tmp_product_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(27),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(27),
      O => grp_fu_382_p0(27)
    );
tmp_product_i_50: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(16),
      I1 => orig_q1(16),
      I2 => tmp_product_i_83_n_21,
      I3 => tmp_product_i_83_n_20,
      I4 => orig_q1(17),
      I5 => \tmp_product__1_i_16_0\(17),
      O => tmp_product_i_50_n_6
    );
tmp_product_i_51: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(15),
      I1 => orig_q1(15),
      I2 => tmp_product_i_84_n_14,
      I3 => tmp_product_i_83_n_21,
      I4 => orig_q1(16),
      I5 => \tmp_product__1_i_16_0\(16),
      O => tmp_product_i_51_n_6
    );
tmp_product_i_52: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_15,
      I1 => orig_q1(14),
      I2 => \tmp_product__1_i_16_0\(14),
      O => tmp_product_i_52_n_6
    );
tmp_product_i_53: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_16,
      I1 => orig_q1(13),
      I2 => \tmp_product__1_i_16_0\(13),
      O => tmp_product_i_53_n_6
    );
tmp_product_i_54: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_17,
      I1 => orig_q1(12),
      I2 => \tmp_product__1_i_16_0\(12),
      O => tmp_product_i_54_n_6
    );
tmp_product_i_55: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_18,
      I1 => orig_q1(11),
      I2 => \tmp_product__1_i_16_0\(11),
      O => tmp_product_i_55_n_6
    );
tmp_product_i_56: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_19,
      I1 => orig_q1(10),
      I2 => \tmp_product__1_i_16_0\(10),
      O => tmp_product_i_56_n_6
    );
tmp_product_i_57: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_20,
      I1 => orig_q1(9),
      I2 => \tmp_product__1_i_16_0\(9),
      O => tmp_product_i_57_n_6
    );
tmp_product_i_58: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_84_n_21,
      I1 => orig_q1(8),
      I2 => \tmp_product__1_i_16_0\(8),
      O => tmp_product_i_58_n_6
    );
tmp_product_i_59: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_14,
      I1 => orig_q1(7),
      I2 => \tmp_product__1_i_16_0\(7),
      O => tmp_product_i_59_n_6
    );
tmp_product_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(26),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(26),
      O => grp_fu_382_p0(26)
    );
tmp_product_i_60: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(14),
      I1 => orig_q1(14),
      I2 => tmp_product_i_84_n_15,
      I3 => tmp_product_i_84_n_14,
      I4 => orig_q1(15),
      I5 => \tmp_product__1_i_16_0\(15),
      O => tmp_product_i_60_n_6
    );
tmp_product_i_61: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(13),
      I1 => orig_q1(13),
      I2 => tmp_product_i_84_n_16,
      I3 => tmp_product_i_84_n_15,
      I4 => orig_q1(14),
      I5 => \tmp_product__1_i_16_0\(14),
      O => tmp_product_i_61_n_6
    );
tmp_product_i_62: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(12),
      I1 => orig_q1(12),
      I2 => tmp_product_i_84_n_17,
      I3 => tmp_product_i_84_n_16,
      I4 => orig_q1(13),
      I5 => \tmp_product__1_i_16_0\(13),
      O => tmp_product_i_62_n_6
    );
tmp_product_i_63: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(11),
      I1 => orig_q1(11),
      I2 => tmp_product_i_84_n_18,
      I3 => tmp_product_i_84_n_17,
      I4 => orig_q1(12),
      I5 => \tmp_product__1_i_16_0\(12),
      O => tmp_product_i_63_n_6
    );
tmp_product_i_64: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(10),
      I1 => orig_q1(10),
      I2 => tmp_product_i_84_n_19,
      I3 => tmp_product_i_84_n_18,
      I4 => orig_q1(11),
      I5 => \tmp_product__1_i_16_0\(11),
      O => tmp_product_i_64_n_6
    );
tmp_product_i_65: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(9),
      I1 => orig_q1(9),
      I2 => tmp_product_i_84_n_20,
      I3 => tmp_product_i_84_n_19,
      I4 => orig_q1(10),
      I5 => \tmp_product__1_i_16_0\(10),
      O => tmp_product_i_65_n_6
    );
tmp_product_i_66: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(8),
      I1 => orig_q1(8),
      I2 => tmp_product_i_84_n_21,
      I3 => tmp_product_i_84_n_20,
      I4 => orig_q1(9),
      I5 => \tmp_product__1_i_16_0\(9),
      O => tmp_product_i_66_n_6
    );
tmp_product_i_67: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(7),
      I1 => orig_q1(7),
      I2 => tmp_product_i_85_n_14,
      I3 => tmp_product_i_84_n_21,
      I4 => orig_q1(8),
      I5 => \tmp_product__1_i_16_0\(8),
      O => tmp_product_i_67_n_6
    );
tmp_product_i_68: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_15,
      I1 => orig_q1(6),
      I2 => \tmp_product__1_i_16_0\(6),
      O => tmp_product_i_68_n_6
    );
tmp_product_i_69: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_16,
      I1 => orig_q1(5),
      I2 => \tmp_product__1_i_16_0\(5),
      O => tmp_product_i_69_n_6
    );
tmp_product_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(25),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(25),
      O => grp_fu_382_p0(25)
    );
tmp_product_i_70: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_17,
      I1 => orig_q1(4),
      I2 => \tmp_product__1_i_16_0\(4),
      O => tmp_product_i_70_n_6
    );
tmp_product_i_71: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_18,
      I1 => orig_q1(3),
      I2 => \tmp_product__1_i_16_0\(3),
      O => tmp_product_i_71_n_6
    );
tmp_product_i_72: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_19,
      I1 => orig_q1(2),
      I2 => \tmp_product__1_i_16_0\(2),
      O => tmp_product_i_72_n_6
    );
tmp_product_i_73: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => tmp_product_i_85_n_20,
      I1 => orig_q1(1),
      I2 => \tmp_product__1_i_16_0\(1),
      O => tmp_product_i_73_n_6
    );
tmp_product_i_74: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => orig_q1(0),
      I1 => tmp_product_i_85_n_21,
      I2 => \tmp_product__1_i_16_0\(0),
      O => tmp_product_i_74_n_6
    );
tmp_product_i_75: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(6),
      I1 => orig_q1(6),
      I2 => tmp_product_i_85_n_15,
      I3 => tmp_product_i_85_n_14,
      I4 => orig_q1(7),
      I5 => \tmp_product__1_i_16_0\(7),
      O => tmp_product_i_75_n_6
    );
tmp_product_i_76: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(5),
      I1 => orig_q1(5),
      I2 => tmp_product_i_85_n_16,
      I3 => tmp_product_i_85_n_15,
      I4 => orig_q1(6),
      I5 => \tmp_product__1_i_16_0\(6),
      O => tmp_product_i_76_n_6
    );
tmp_product_i_77: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(4),
      I1 => orig_q1(4),
      I2 => tmp_product_i_85_n_17,
      I3 => tmp_product_i_85_n_16,
      I4 => orig_q1(5),
      I5 => \tmp_product__1_i_16_0\(5),
      O => tmp_product_i_77_n_6
    );
tmp_product_i_78: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(3),
      I1 => orig_q1(3),
      I2 => tmp_product_i_85_n_18,
      I3 => tmp_product_i_85_n_17,
      I4 => orig_q1(4),
      I5 => \tmp_product__1_i_16_0\(4),
      O => tmp_product_i_78_n_6
    );
tmp_product_i_79: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(2),
      I1 => orig_q1(2),
      I2 => tmp_product_i_85_n_19,
      I3 => tmp_product_i_85_n_18,
      I4 => orig_q1(3),
      I5 => \tmp_product__1_i_16_0\(3),
      O => tmp_product_i_79_n_6
    );
tmp_product_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(24),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(24),
      O => grp_fu_382_p0(24)
    );
tmp_product_i_80: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_16_0\(1),
      I1 => orig_q1(1),
      I2 => tmp_product_i_85_n_20,
      I3 => tmp_product_i_85_n_19,
      I4 => orig_q1(2),
      I5 => \tmp_product__1_i_16_0\(2),
      O => tmp_product_i_80_n_6
    );
tmp_product_i_81: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => tmp_product_i_74_n_6,
      I1 => tmp_product_i_85_n_20,
      I2 => orig_q1(1),
      I3 => \tmp_product__1_i_16_0\(1),
      O => tmp_product_i_81_n_6
    );
tmp_product_i_82: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => orig_q1(0),
      I1 => tmp_product_i_85_n_21,
      I2 => \tmp_product__1_i_16_0\(0),
      O => tmp_product_i_82_n_6
    );
tmp_product_i_83: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_84_n_6,
      CI_TOP => '0',
      CO(7) => tmp_product_i_83_n_6,
      CO(6) => tmp_product_i_83_n_7,
      CO(5) => tmp_product_i_83_n_8,
      CO(4) => tmp_product_i_83_n_9,
      CO(3) => tmp_product_i_83_n_10,
      CO(2) => tmp_product_i_83_n_11,
      CO(1) => tmp_product_i_83_n_12,
      CO(0) => tmp_product_i_83_n_13,
      DI(7) => tmp_product_i_86_n_6,
      DI(6) => tmp_product_i_87_n_6,
      DI(5) => tmp_product_i_88_n_6,
      DI(4) => tmp_product_i_89_n_6,
      DI(3) => tmp_product_i_90_n_6,
      DI(2) => tmp_product_i_91_n_6,
      DI(1) => tmp_product_i_92_n_6,
      DI(0) => tmp_product_i_93_n_6,
      O(7) => tmp_product_i_83_n_14,
      O(6) => tmp_product_i_83_n_15,
      O(5) => tmp_product_i_83_n_16,
      O(4) => tmp_product_i_83_n_17,
      O(3) => tmp_product_i_83_n_18,
      O(2) => tmp_product_i_83_n_19,
      O(1) => tmp_product_i_83_n_20,
      O(0) => tmp_product_i_83_n_21,
      S(7) => tmp_product_i_94_n_6,
      S(6) => tmp_product_i_95_n_6,
      S(5) => tmp_product_i_96_n_6,
      S(4) => tmp_product_i_97_n_6,
      S(3) => tmp_product_i_98_n_6,
      S(2) => tmp_product_i_99_n_6,
      S(1) => tmp_product_i_100_n_6,
      S(0) => tmp_product_i_101_n_6
    );
tmp_product_i_84: unisim.vcomponents.CARRY8
     port map (
      CI => tmp_product_i_85_n_6,
      CI_TOP => '0',
      CO(7) => tmp_product_i_84_n_6,
      CO(6) => tmp_product_i_84_n_7,
      CO(5) => tmp_product_i_84_n_8,
      CO(4) => tmp_product_i_84_n_9,
      CO(3) => tmp_product_i_84_n_10,
      CO(2) => tmp_product_i_84_n_11,
      CO(1) => tmp_product_i_84_n_12,
      CO(0) => tmp_product_i_84_n_13,
      DI(7) => tmp_product_i_102_n_6,
      DI(6) => tmp_product_i_103_n_6,
      DI(5) => tmp_product_i_104_n_6,
      DI(4) => tmp_product_i_105_n_6,
      DI(3) => tmp_product_i_106_n_6,
      DI(2) => tmp_product_i_107_n_6,
      DI(1) => tmp_product_i_108_n_6,
      DI(0) => tmp_product_i_109_n_6,
      O(7) => tmp_product_i_84_n_14,
      O(6) => tmp_product_i_84_n_15,
      O(5) => tmp_product_i_84_n_16,
      O(4) => tmp_product_i_84_n_17,
      O(3) => tmp_product_i_84_n_18,
      O(2) => tmp_product_i_84_n_19,
      O(1) => tmp_product_i_84_n_20,
      O(0) => tmp_product_i_84_n_21,
      S(7) => tmp_product_i_110_n_6,
      S(6) => tmp_product_i_111_n_6,
      S(5) => tmp_product_i_112_n_6,
      S(4) => tmp_product_i_113_n_6,
      S(3) => tmp_product_i_114_n_6,
      S(2) => tmp_product_i_115_n_6,
      S(1) => tmp_product_i_116_n_6,
      S(0) => tmp_product_i_117_n_6
    );
tmp_product_i_85: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => tmp_product_i_85_n_6,
      CO(6) => tmp_product_i_85_n_7,
      CO(5) => tmp_product_i_85_n_8,
      CO(4) => tmp_product_i_85_n_9,
      CO(3) => tmp_product_i_85_n_10,
      CO(2) => tmp_product_i_85_n_11,
      CO(1) => tmp_product_i_85_n_12,
      CO(0) => tmp_product_i_85_n_13,
      DI(7) => tmp_product_i_118_n_6,
      DI(6) => tmp_product_i_119_n_6,
      DI(5) => tmp_product_i_120_n_6,
      DI(4) => tmp_product_i_121_n_6,
      DI(3) => tmp_product_i_122_n_6,
      DI(2) => tmp_product_i_123_n_6,
      DI(1) => tmp_product_i_124_n_6,
      DI(0) => '0',
      O(7) => tmp_product_i_85_n_14,
      O(6) => tmp_product_i_85_n_15,
      O(5) => tmp_product_i_85_n_16,
      O(4) => tmp_product_i_85_n_17,
      O(3) => tmp_product_i_85_n_18,
      O(2) => tmp_product_i_85_n_19,
      O(1) => tmp_product_i_85_n_20,
      O(0) => tmp_product_i_85_n_21,
      S(7) => tmp_product_i_125_n_6,
      S(6) => tmp_product_i_126_n_6,
      S(5) => tmp_product_i_127_n_6,
      S(4) => tmp_product_i_128_n_6,
      S(3) => tmp_product_i_129_n_6,
      S(2) => tmp_product_i_130_n_6,
      S(1) => tmp_product_i_131_n_6,
      S(0) => tmp_product_i_132_n_6
    );
tmp_product_i_86: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(22),
      I1 => orig_q0(22),
      I2 => \tmp_product__1_i_32_0\(22),
      O => tmp_product_i_86_n_6
    );
tmp_product_i_87: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(21),
      I1 => orig_q0(21),
      I2 => \tmp_product__1_i_32_0\(21),
      O => tmp_product_i_87_n_6
    );
tmp_product_i_88: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(20),
      I1 => orig_q0(20),
      I2 => \tmp_product__1_i_32_0\(20),
      O => tmp_product_i_88_n_6
    );
tmp_product_i_89: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(19),
      I1 => orig_q0(19),
      I2 => \tmp_product__1_i_32_0\(19),
      O => tmp_product_i_89_n_6
    );
tmp_product_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => DSP_A_B_DATA_INST(23),
      I1 => DSP_A_B_DATA_INST_0(0),
      I2 => orig_q1(23),
      O => grp_fu_382_p0(23)
    );
tmp_product_i_90: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(18),
      I1 => orig_q0(18),
      I2 => \tmp_product__1_i_32_0\(18),
      O => tmp_product_i_90_n_6
    );
tmp_product_i_91: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(17),
      I1 => orig_q0(17),
      I2 => \tmp_product__1_i_32_0\(17),
      O => tmp_product_i_91_n_6
    );
tmp_product_i_92: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(16),
      I1 => orig_q0(16),
      I2 => \tmp_product__1_i_32_0\(16),
      O => tmp_product_i_92_n_6
    );
tmp_product_i_93: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => Q(15),
      I1 => orig_q0(15),
      I2 => \tmp_product__1_i_32_0\(15),
      O => tmp_product_i_93_n_6
    );
tmp_product_i_94: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(22),
      I1 => orig_q0(22),
      I2 => Q(22),
      I3 => Q(23),
      I4 => orig_q0(23),
      I5 => \tmp_product__1_i_32_0\(23),
      O => tmp_product_i_94_n_6
    );
tmp_product_i_95: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(21),
      I1 => orig_q0(21),
      I2 => Q(21),
      I3 => Q(22),
      I4 => orig_q0(22),
      I5 => \tmp_product__1_i_32_0\(22),
      O => tmp_product_i_95_n_6
    );
tmp_product_i_96: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(20),
      I1 => orig_q0(20),
      I2 => Q(20),
      I3 => Q(21),
      I4 => orig_q0(21),
      I5 => \tmp_product__1_i_32_0\(21),
      O => tmp_product_i_96_n_6
    );
tmp_product_i_97: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(19),
      I1 => orig_q0(19),
      I2 => Q(19),
      I3 => Q(20),
      I4 => orig_q0(20),
      I5 => \tmp_product__1_i_32_0\(20),
      O => tmp_product_i_97_n_6
    );
tmp_product_i_98: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(18),
      I1 => orig_q0(18),
      I2 => Q(18),
      I3 => Q(19),
      I4 => orig_q0(19),
      I5 => \tmp_product__1_i_32_0\(19),
      O => tmp_product_i_98_n_6
    );
tmp_product_i_99: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17E8E817E81717E8"
    )
        port map (
      I0 => \tmp_product__1_i_32_0\(17),
      I1 => orig_q0(17),
      I2 => Q(17),
      I3 => Q(18),
      I4 => orig_q0(18),
      I5 => \tmp_product__1_i_32_0\(18),
      O => tmp_product_i_99_n_6
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_stencil3d is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    C_address0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    C_ce0 : out STD_LOGIC;
    C_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_address1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    C_ce1 : out STD_LOGIC;
    C_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_ce0 : out STD_LOGIC;
    orig_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    orig_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_ce1 : out STD_LOGIC;
    orig_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sol_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    sol_ce0 : out STD_LOGIC;
    sol_we0 : out STD_LOGIC;
    sol_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sol_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    sol_ce1 : out STD_LOGIC;
    sol_we1 : out STD_LOGIC;
    sol_d1 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_stencil3d : entity is "stencil3d";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000000001";
  attribute ap_ST_fsm_state10 : string;
  attribute ap_ST_fsm_state10 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000001000000000";
  attribute ap_ST_fsm_state11 : string;
  attribute ap_ST_fsm_state11 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000010000000000";
  attribute ap_ST_fsm_state12 : string;
  attribute ap_ST_fsm_state12 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000100000000000";
  attribute ap_ST_fsm_state13 : string;
  attribute ap_ST_fsm_state13 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000001000000000000";
  attribute ap_ST_fsm_state14 : string;
  attribute ap_ST_fsm_state14 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000010000000000000";
  attribute ap_ST_fsm_state15 : string;
  attribute ap_ST_fsm_state15 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000100000000000000";
  attribute ap_ST_fsm_state16 : string;
  attribute ap_ST_fsm_state16 of bd_0_hls_inst_0_stencil3d : entity is "20'b00001000000000000000";
  attribute ap_ST_fsm_state17 : string;
  attribute ap_ST_fsm_state17 of bd_0_hls_inst_0_stencil3d : entity is "20'b00010000000000000000";
  attribute ap_ST_fsm_state18 : string;
  attribute ap_ST_fsm_state18 of bd_0_hls_inst_0_stencil3d : entity is "20'b00100000000000000000";
  attribute ap_ST_fsm_state19 : string;
  attribute ap_ST_fsm_state19 of bd_0_hls_inst_0_stencil3d : entity is "20'b01000000000000000000";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000000010";
  attribute ap_ST_fsm_state20 : string;
  attribute ap_ST_fsm_state20 of bd_0_hls_inst_0_stencil3d : entity is "20'b10000000000000000000";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000000100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000001000";
  attribute ap_ST_fsm_state5 : string;
  attribute ap_ST_fsm_state5 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000010000";
  attribute ap_ST_fsm_state6 : string;
  attribute ap_ST_fsm_state6 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000000100000";
  attribute ap_ST_fsm_state7 : string;
  attribute ap_ST_fsm_state7 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000001000000";
  attribute ap_ST_fsm_state8 : string;
  attribute ap_ST_fsm_state8 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000010000000";
  attribute ap_ST_fsm_state9 : string;
  attribute ap_ST_fsm_state9 of bd_0_hls_inst_0_stencil3d : entity is "20'b00000000000100000000";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0_stencil3d : entity is "yes";
end bd_0_hls_inst_0_stencil3d;

architecture STRUCTURE of bd_0_hls_inst_0_stencil3d is
  signal \<const0>\ : STD_LOGIC;
  signal \^c_ce0\ : STD_LOGIC;
  signal C_load_1_reg_1005 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal C_load_reg_1000 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal add_ln15_fu_406_p2 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal add_ln15_reg_848 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal add_ln16_fu_439_p2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln16_reg_873 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln18_fu_467_p2 : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal add_ln18_reg_888 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \add_ln18_reg_888[7]_i_2_n_6\ : STD_LOGIC;
  signal \add_ln18_reg_888_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \add_ln18_reg_888_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \add_ln18_reg_888_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \add_ln18_reg_888_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal add_ln21_fu_552_p2 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal add_ln22_fu_518_p2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln22_reg_924 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln27_fu_613_p2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln28_fu_607_p2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln28_reg_995 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal add_ln44_fu_764_p2 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal add_ln44_reg_1100 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal add_ln48_5_fu_833_p2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal add_ln48_fu_804_p2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal add_ln48_reg_1115 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \add_ln48_reg_1115[15]_i_2_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_3_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_4_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_5_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_6_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_7_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_8_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[15]_i_9_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_2_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_3_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_4_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_5_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_6_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_7_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_8_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[23]_i_9_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_2_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_3_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_4_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_5_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_6_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_7_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_8_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[31]_i_9_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_2_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_3_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_4_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_5_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_6_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_7_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_8_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115[7]_i_9_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_10\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_11\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_12\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_13\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_8\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[31]_i_1_n_9\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \add_ln48_reg_1115_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal add_ln_fu_528_p4 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \ap_CS_fsm_reg_n_6_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state10 : STD_LOGIC;
  signal ap_CS_fsm_state11 : STD_LOGIC;
  signal ap_CS_fsm_state12 : STD_LOGIC;
  signal ap_CS_fsm_state13 : STD_LOGIC;
  signal ap_CS_fsm_state14 : STD_LOGIC;
  signal ap_CS_fsm_state15 : STD_LOGIC;
  signal ap_CS_fsm_state16 : STD_LOGIC;
  signal ap_CS_fsm_state17 : STD_LOGIC;
  signal ap_CS_fsm_state18 : STD_LOGIC;
  signal ap_CS_fsm_state19 : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state20 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_CS_fsm_state4 : STD_LOGIC;
  signal ap_CS_fsm_state5 : STD_LOGIC;
  signal ap_CS_fsm_state6 : STD_LOGIC;
  signal ap_CS_fsm_state7 : STD_LOGIC;
  signal ap_CS_fsm_state8 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ap_NS_fsm1 : STD_LOGIC;
  signal ap_NS_fsm10_out : STD_LOGIC;
  signal ap_NS_fsm11_out : STD_LOGIC;
  signal ap_NS_fsm12_out : STD_LOGIC;
  signal ap_NS_fsm13_out : STD_LOGIC;
  signal ap_NS_fsm14_out : STD_LOGIC;
  signal ap_NS_fsm15_out : STD_LOGIC;
  signal ap_NS_fsm16_out : STD_LOGIC;
  signal ap_NS_fsm17_out : STD_LOGIC;
  signal \^ap_ready\ : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal data3 : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal data4 : STD_LOGIC_VECTOR ( 10 downto 6 );
  signal data6 : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal empty_14_reg_909 : STD_LOGIC_VECTOR ( 10 downto 7 );
  signal empty_15_fu_664_p2 : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal empty_15_reg_1036 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \empty_15_reg_1036_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \empty_15_reg_1036_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal empty_16_fu_673_p2 : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal empty_16_reg_1041 : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \empty_16_reg_1041[7]_i_2_n_6\ : STD_LOGIC;
  signal \empty_16_reg_1041[7]_i_3_n_6\ : STD_LOGIC;
  signal \empty_16_reg_1041[7]_i_4_n_6\ : STD_LOGIC;
  signal \empty_16_reg_1041_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \empty_16_reg_1041_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal i_2_fu_114 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i_2_fu_1140 : STD_LOGIC;
  signal \i_fu_106[0]_i_1_n_6\ : STD_LOGIC;
  signal indvars_iv_next19_fu_678_p2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \indvars_iv_next19_reg_1046[2]_i_1_n_6\ : STD_LOGIC;
  signal \indvars_iv_next19_reg_1046[3]_i_1_n_6\ : STD_LOGIC;
  signal indvars_iv_next33_fu_632_p2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal indvars_iv_next33_reg_1022 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal j_2_reg_3580 : STD_LOGIC;
  signal \j_fu_102_reg_n_6_[0]\ : STD_LOGIC;
  signal \j_fu_102_reg_n_6_[1]\ : STD_LOGIC;
  signal \j_fu_102_reg_n_6_[2]\ : STD_LOGIC;
  signal \j_fu_102_reg_n_6_[3]\ : STD_LOGIC;
  signal \j_fu_102_reg_n_6_[4]\ : STD_LOGIC;
  signal k_1_reg_3360 : STD_LOGIC;
  signal k_2_reg_3700 : STD_LOGIC;
  signal k_reg_3250 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_22 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_23 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_24 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_25 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_26 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_27 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_28 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_29 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_30 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_31 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_32 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_33 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_34 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_35 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_36 : STD_LOGIC;
  signal mul_32s_32s_32_1_1_U1_n_37 : STD_LOGIC;
  signal mul_ln48_1_reg_1120 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mul_ln48_reg_1080 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal or_ln_fu_459_p3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \orig_address0[0]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[10]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[10]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[10]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[1]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[2]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[2]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[3]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[3]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[3]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[4]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[4]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[4]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[5]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[5]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[5]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[6]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[6]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[6]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[7]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[7]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[7]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \orig_address0[8]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[8]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address0[9]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address0[9]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \orig_address1[10]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[1]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[2]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[3]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[4]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[5]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[6]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[7]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[8]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \orig_address1[9]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal orig_load_8_reg_1085 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^orig_q0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg_387 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \reg_387[31]_i_1_n_6\ : STD_LOGIC;
  signal shl_ln_fu_582_p4 : STD_LOGIC_VECTOR ( 10 downto 7 );
  signal \sol_address0[3]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_address0[4]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_address0[5]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_address0[6]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_address0[6]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \sol_address0[6]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \^sol_ce0\ : STD_LOGIC;
  signal \^sol_ce1\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_10\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_11\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_12\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_13\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_7\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_8\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_1_n_9\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_5_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_6_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_7_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_8_n_6\ : STD_LOGIC;
  signal \sol_d1[15]_INST_0_i_9_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_10\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_11\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_12\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_13\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_7\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_8\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_1_n_9\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_5_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_6_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_7_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_8_n_6\ : STD_LOGIC;
  signal \sol_d1[23]_INST_0_i_9_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_10\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_11\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_12\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_13\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_7\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_8\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_1_n_9\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_5_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_6_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_7_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_8_n_6\ : STD_LOGIC;
  signal \sol_d1[31]_INST_0_i_9_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_10\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_11\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_12\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_13\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_7\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_8\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_1_n_9\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_2_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_3_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_5_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_6_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_7_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_8_n_6\ : STD_LOGIC;
  signal \sol_d1[7]_INST_0_i_9_n_6\ : STD_LOGIC;
  signal tmp2_cast_fu_669_p1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal tmp3_fu_684_p2 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal tmp3_reg_1052 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal tmp_1_reg_853 : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal \tmp_product__3\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal zext_ln17_reg_878_reg : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal zext_ln18_reg_893_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zext_ln23_reg_929 : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal zext_ln24_reg_939_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal zext_ln30_reg_985_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zext_ln39_reg_1060_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \NLW_add_ln18_reg_888_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_add_ln18_reg_888_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_add_ln48_reg_1115_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_empty_15_reg_1036_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_empty_15_reg_1036_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_empty_16_reg_1041_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_empty_16_reg_1041_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_sol_d1[31]_INST_0_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \add_ln15_reg_848[1]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \add_ln15_reg_848[2]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \add_ln15_reg_848[3]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \add_ln15_reg_848[4]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \add_ln16_reg_873[0]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \add_ln16_reg_873[1]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \add_ln16_reg_873[2]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \add_ln16_reg_873[3]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \add_ln22_reg_924[0]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \add_ln22_reg_924[2]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \add_ln22_reg_924[3]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \add_ln28_reg_995[0]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \add_ln28_reg_995[1]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \add_ln28_reg_995[2]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \add_ln28_reg_995[3]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \add_ln44_reg_1100[1]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \add_ln44_reg_1100[2]_i_1\ : label is "soft_lutpair53";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \add_ln48_reg_1115_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \add_ln48_reg_1115_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \add_ln48_reg_1115_reg[31]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \add_ln48_reg_1115_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \ap_CS_fsm[13]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ap_CS_fsm[15]_i_1\ : label is "soft_lutpair32";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[10]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[11]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[12]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[13]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[14]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[15]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[16]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[17]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[18]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[19]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[4]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[5]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[6]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[7]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[8]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[9]\ : label is "none";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of ap_ready_INST_0 : label is "soft_lutpair33";
  attribute ADDER_THRESHOLD of \empty_15_reg_1036_reg[7]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \empty_16_reg_1041_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \i_1_fu_110[0]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \i_1_fu_110[2]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \i_1_fu_110[3]_i_3\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \i_fu_106[2]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \i_fu_106[3]_i_3\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \indvars_iv_next19_reg_1046[0]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \indvars_iv_next19_reg_1046[1]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \indvars_iv_next19_reg_1046[2]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \indvars_iv_next19_reg_1046[3]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \indvars_iv_next33_reg_1022[1]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \indvars_iv_next33_reg_1022[2]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \indvars_iv_next33_reg_1022[3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \orig_address0[0]_INST_0_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \orig_address0[2]_INST_0_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \orig_address0[3]_INST_0_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \orig_address0[4]_INST_0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \orig_address0[4]_INST_0_i_3\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \orig_address0[5]_INST_0_i_3\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \orig_address0[6]_INST_0_i_3\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \orig_address0[7]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \orig_address0[7]_INST_0_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \orig_address0[7]_INST_0_i_3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \orig_address0[8]_INST_0_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \orig_address0[9]_INST_0_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \orig_address1[1]_INST_0_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \orig_address1[2]_INST_0_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \orig_address1[3]_INST_0_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \reg_387[0]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \reg_387[10]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \reg_387[11]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \reg_387[12]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \reg_387[13]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \reg_387[14]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \reg_387[15]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \reg_387[16]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \reg_387[17]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \reg_387[18]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \reg_387[19]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \reg_387[1]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \reg_387[20]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \reg_387[21]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \reg_387[22]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \reg_387[23]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \reg_387[24]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \reg_387[25]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \reg_387[26]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \reg_387[27]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \reg_387[28]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \reg_387[29]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \reg_387[2]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \reg_387[30]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \reg_387[31]_i_2\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \reg_387[3]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \reg_387[4]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \reg_387[5]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \reg_387[6]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \reg_387[7]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \reg_387[8]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \reg_387[9]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \sol_address0[3]_INST_0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \sol_address0[3]_INST_0_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \sol_address0[4]_INST_0_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \sol_address0[5]_INST_0_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \sol_address0[6]_INST_0_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \sol_address0[6]_INST_0_i_2\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \sol_address0[6]_INST_0_i_3\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \sol_address1[4]_INST_0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \sol_address1[5]_INST_0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \sol_address1[6]_INST_0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \sol_d1[0]_INST_0\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \sol_d1[10]_INST_0\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \sol_d1[11]_INST_0\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \sol_d1[12]_INST_0\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \sol_d1[13]_INST_0\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \sol_d1[14]_INST_0\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \sol_d1[15]_INST_0\ : label is "soft_lutpair76";
  attribute ADDER_THRESHOLD of \sol_d1[15]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \sol_d1[16]_INST_0\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \sol_d1[17]_INST_0\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \sol_d1[18]_INST_0\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \sol_d1[19]_INST_0\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \sol_d1[1]_INST_0\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \sol_d1[20]_INST_0\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \sol_d1[21]_INST_0\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \sol_d1[22]_INST_0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \sol_d1[23]_INST_0\ : label is "soft_lutpair68";
  attribute ADDER_THRESHOLD of \sol_d1[23]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \sol_d1[24]_INST_0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \sol_d1[25]_INST_0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \sol_d1[26]_INST_0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \sol_d1[27]_INST_0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \sol_d1[28]_INST_0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \sol_d1[29]_INST_0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \sol_d1[2]_INST_0\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \sol_d1[30]_INST_0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \sol_d1[31]_INST_0\ : label is "soft_lutpair60";
  attribute ADDER_THRESHOLD of \sol_d1[31]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \sol_d1[3]_INST_0\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \sol_d1[4]_INST_0\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \sol_d1[5]_INST_0\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \sol_d1[6]_INST_0\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \sol_d1[7]_INST_0\ : label is "soft_lutpair84";
  attribute ADDER_THRESHOLD of \sol_d1[7]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \sol_d1[8]_INST_0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \sol_d1[9]_INST_0\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of sol_we0_INST_0 : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of sol_we1_INST_0 : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \tmp3_reg_1052[1]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \tmp3_reg_1052[2]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \tmp3_reg_1052[3]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \zext_ln17_reg_878[3]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \zext_ln17_reg_878[4]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \zext_ln17_reg_878[5]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \zext_ln17_reg_878[6]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \zext_ln24_reg_939[10]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \zext_ln24_reg_939[7]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \zext_ln24_reg_939[8]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \zext_ln24_reg_939[9]_i_1\ : label is "soft_lutpair35";
begin
  C_address0(0) <= \<const0>\;
  C_address1(0) <= \<const0>\;
  C_ce0 <= \^c_ce0\;
  C_ce1 <= \^c_ce0\;
  \^orig_q0\(31 downto 0) <= orig_q0(31 downto 0);
  ap_done <= \^ap_ready\;
  ap_ready <= \^ap_ready\;
  sol_ce0 <= \^sol_ce0\;
  sol_ce1 <= \^sol_ce1\;
  sol_d0(31 downto 0) <= \^orig_q0\(31 downto 0);
  sol_we0 <= \^sol_ce0\;
  sol_we1 <= \^sol_ce1\;
\C_load_1_reg_1005_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(0),
      Q => C_load_1_reg_1005(0),
      R => '0'
    );
\C_load_1_reg_1005_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(10),
      Q => C_load_1_reg_1005(10),
      R => '0'
    );
\C_load_1_reg_1005_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(11),
      Q => C_load_1_reg_1005(11),
      R => '0'
    );
\C_load_1_reg_1005_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(12),
      Q => C_load_1_reg_1005(12),
      R => '0'
    );
\C_load_1_reg_1005_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(13),
      Q => C_load_1_reg_1005(13),
      R => '0'
    );
\C_load_1_reg_1005_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(14),
      Q => C_load_1_reg_1005(14),
      R => '0'
    );
\C_load_1_reg_1005_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(15),
      Q => C_load_1_reg_1005(15),
      R => '0'
    );
\C_load_1_reg_1005_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(16),
      Q => C_load_1_reg_1005(16),
      R => '0'
    );
\C_load_1_reg_1005_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(17),
      Q => C_load_1_reg_1005(17),
      R => '0'
    );
\C_load_1_reg_1005_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(18),
      Q => C_load_1_reg_1005(18),
      R => '0'
    );
\C_load_1_reg_1005_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(19),
      Q => C_load_1_reg_1005(19),
      R => '0'
    );
\C_load_1_reg_1005_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(1),
      Q => C_load_1_reg_1005(1),
      R => '0'
    );
\C_load_1_reg_1005_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(20),
      Q => C_load_1_reg_1005(20),
      R => '0'
    );
\C_load_1_reg_1005_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(21),
      Q => C_load_1_reg_1005(21),
      R => '0'
    );
\C_load_1_reg_1005_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(22),
      Q => C_load_1_reg_1005(22),
      R => '0'
    );
\C_load_1_reg_1005_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(23),
      Q => C_load_1_reg_1005(23),
      R => '0'
    );
\C_load_1_reg_1005_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(24),
      Q => C_load_1_reg_1005(24),
      R => '0'
    );
\C_load_1_reg_1005_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(25),
      Q => C_load_1_reg_1005(25),
      R => '0'
    );
\C_load_1_reg_1005_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(26),
      Q => C_load_1_reg_1005(26),
      R => '0'
    );
\C_load_1_reg_1005_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(27),
      Q => C_load_1_reg_1005(27),
      R => '0'
    );
\C_load_1_reg_1005_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(28),
      Q => C_load_1_reg_1005(28),
      R => '0'
    );
\C_load_1_reg_1005_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(29),
      Q => C_load_1_reg_1005(29),
      R => '0'
    );
\C_load_1_reg_1005_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(2),
      Q => C_load_1_reg_1005(2),
      R => '0'
    );
\C_load_1_reg_1005_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(30),
      Q => C_load_1_reg_1005(30),
      R => '0'
    );
\C_load_1_reg_1005_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(31),
      Q => C_load_1_reg_1005(31),
      R => '0'
    );
\C_load_1_reg_1005_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(3),
      Q => C_load_1_reg_1005(3),
      R => '0'
    );
\C_load_1_reg_1005_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(4),
      Q => C_load_1_reg_1005(4),
      R => '0'
    );
\C_load_1_reg_1005_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(5),
      Q => C_load_1_reg_1005(5),
      R => '0'
    );
\C_load_1_reg_1005_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(6),
      Q => C_load_1_reg_1005(6),
      R => '0'
    );
\C_load_1_reg_1005_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(7),
      Q => C_load_1_reg_1005(7),
      R => '0'
    );
\C_load_1_reg_1005_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(8),
      Q => C_load_1_reg_1005(8),
      R => '0'
    );
\C_load_1_reg_1005_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q0(9),
      Q => C_load_1_reg_1005(9),
      R => '0'
    );
\C_load_reg_1000_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(0),
      Q => C_load_reg_1000(0),
      R => '0'
    );
\C_load_reg_1000_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(10),
      Q => C_load_reg_1000(10),
      R => '0'
    );
\C_load_reg_1000_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(11),
      Q => C_load_reg_1000(11),
      R => '0'
    );
\C_load_reg_1000_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(12),
      Q => C_load_reg_1000(12),
      R => '0'
    );
\C_load_reg_1000_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(13),
      Q => C_load_reg_1000(13),
      R => '0'
    );
\C_load_reg_1000_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(14),
      Q => C_load_reg_1000(14),
      R => '0'
    );
\C_load_reg_1000_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(15),
      Q => C_load_reg_1000(15),
      R => '0'
    );
\C_load_reg_1000_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(16),
      Q => C_load_reg_1000(16),
      R => '0'
    );
\C_load_reg_1000_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(17),
      Q => C_load_reg_1000(17),
      R => '0'
    );
\C_load_reg_1000_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(18),
      Q => C_load_reg_1000(18),
      R => '0'
    );
\C_load_reg_1000_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(19),
      Q => C_load_reg_1000(19),
      R => '0'
    );
\C_load_reg_1000_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(1),
      Q => C_load_reg_1000(1),
      R => '0'
    );
\C_load_reg_1000_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(20),
      Q => C_load_reg_1000(20),
      R => '0'
    );
\C_load_reg_1000_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(21),
      Q => C_load_reg_1000(21),
      R => '0'
    );
\C_load_reg_1000_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(22),
      Q => C_load_reg_1000(22),
      R => '0'
    );
\C_load_reg_1000_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(23),
      Q => C_load_reg_1000(23),
      R => '0'
    );
\C_load_reg_1000_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(24),
      Q => C_load_reg_1000(24),
      R => '0'
    );
\C_load_reg_1000_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(25),
      Q => C_load_reg_1000(25),
      R => '0'
    );
\C_load_reg_1000_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(26),
      Q => C_load_reg_1000(26),
      R => '0'
    );
\C_load_reg_1000_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(27),
      Q => C_load_reg_1000(27),
      R => '0'
    );
\C_load_reg_1000_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(28),
      Q => C_load_reg_1000(28),
      R => '0'
    );
\C_load_reg_1000_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(29),
      Q => C_load_reg_1000(29),
      R => '0'
    );
\C_load_reg_1000_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(2),
      Q => C_load_reg_1000(2),
      R => '0'
    );
\C_load_reg_1000_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(30),
      Q => C_load_reg_1000(30),
      R => '0'
    );
\C_load_reg_1000_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(31),
      Q => C_load_reg_1000(31),
      R => '0'
    );
\C_load_reg_1000_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(3),
      Q => C_load_reg_1000(3),
      R => '0'
    );
\C_load_reg_1000_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(4),
      Q => C_load_reg_1000(4),
      R => '0'
    );
\C_load_reg_1000_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(5),
      Q => C_load_reg_1000(5),
      R => '0'
    );
\C_load_reg_1000_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(6),
      Q => C_load_reg_1000(6),
      R => '0'
    );
\C_load_reg_1000_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(7),
      Q => C_load_reg_1000(7),
      R => '0'
    );
\C_load_reg_1000_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(8),
      Q => C_load_reg_1000(8),
      R => '0'
    );
\C_load_reg_1000_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state12,
      D => C_q1(9),
      Q => C_load_reg_1000(9),
      R => '0'
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\add_ln15_reg_848[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \j_fu_102_reg_n_6_[0]\,
      O => add_ln15_fu_406_p2(0)
    );
\add_ln15_reg_848[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \j_fu_102_reg_n_6_[0]\,
      I1 => \j_fu_102_reg_n_6_[1]\,
      O => add_ln15_fu_406_p2(1)
    );
\add_ln15_reg_848[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \j_fu_102_reg_n_6_[2]\,
      I1 => \j_fu_102_reg_n_6_[0]\,
      I2 => \j_fu_102_reg_n_6_[1]\,
      O => add_ln15_fu_406_p2(2)
    );
\add_ln15_reg_848[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \j_fu_102_reg_n_6_[1]\,
      I1 => \j_fu_102_reg_n_6_[0]\,
      I2 => \j_fu_102_reg_n_6_[2]\,
      I3 => \j_fu_102_reg_n_6_[3]\,
      O => add_ln15_fu_406_p2(3)
    );
\add_ln15_reg_848[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \j_fu_102_reg_n_6_[4]\,
      I1 => \j_fu_102_reg_n_6_[1]\,
      I2 => \j_fu_102_reg_n_6_[0]\,
      I3 => \j_fu_102_reg_n_6_[2]\,
      I4 => \j_fu_102_reg_n_6_[3]\,
      O => add_ln15_fu_406_p2(4)
    );
\add_ln15_reg_848_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => add_ln15_fu_406_p2(0),
      Q => add_ln15_reg_848(0),
      R => '0'
    );
\add_ln15_reg_848_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => add_ln15_fu_406_p2(1),
      Q => add_ln15_reg_848(1),
      R => '0'
    );
\add_ln15_reg_848_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => add_ln15_fu_406_p2(2),
      Q => add_ln15_reg_848(2),
      R => '0'
    );
\add_ln15_reg_848_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => add_ln15_fu_406_p2(3),
      Q => add_ln15_reg_848(3),
      R => '0'
    );
\add_ln15_reg_848_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => add_ln15_fu_406_p2(4),
      Q => add_ln15_reg_848(4),
      R => '0'
    );
\add_ln16_reg_873[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => or_ln_fu_459_p3(0),
      O => add_ln16_fu_439_p2(0)
    );
\add_ln16_reg_873[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => or_ln_fu_459_p3(0),
      I1 => or_ln_fu_459_p3(1),
      O => add_ln16_fu_439_p2(1)
    );
\add_ln16_reg_873[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => or_ln_fu_459_p3(2),
      I1 => or_ln_fu_459_p3(1),
      I2 => or_ln_fu_459_p3(0),
      O => add_ln16_fu_439_p2(2)
    );
\add_ln16_reg_873[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => or_ln_fu_459_p3(3),
      I1 => or_ln_fu_459_p3(2),
      I2 => or_ln_fu_459_p3(0),
      I3 => or_ln_fu_459_p3(1),
      O => add_ln16_fu_439_p2(3)
    );
\add_ln16_reg_873_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln16_fu_439_p2(0),
      Q => add_ln16_reg_873(0),
      R => '0'
    );
\add_ln16_reg_873_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln16_fu_439_p2(1),
      Q => add_ln16_reg_873(1),
      R => '0'
    );
\add_ln16_reg_873_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln16_fu_439_p2(2),
      Q => add_ln16_reg_873(2),
      R => '0'
    );
\add_ln16_reg_873_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln16_fu_439_p2(3),
      Q => add_ln16_reg_873(3),
      R => '0'
    );
\add_ln18_reg_888[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => or_ln_fu_459_p3(3),
      I1 => tmp_1_reg_853(3),
      O => \add_ln18_reg_888[7]_i_2_n_6\
    );
\add_ln18_reg_888_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => or_ln_fu_459_p3(0),
      Q => add_ln18_reg_888(0),
      R => '0'
    );
\add_ln18_reg_888_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => or_ln_fu_459_p3(1),
      Q => add_ln18_reg_888(1),
      R => '0'
    );
\add_ln18_reg_888_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => or_ln_fu_459_p3(2),
      Q => add_ln18_reg_888(2),
      R => '0'
    );
\add_ln18_reg_888_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln18_fu_467_p2(3),
      Q => add_ln18_reg_888(3),
      R => '0'
    );
\add_ln18_reg_888_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln18_fu_467_p2(4),
      Q => add_ln18_reg_888(4),
      R => '0'
    );
\add_ln18_reg_888_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln18_fu_467_p2(5),
      Q => add_ln18_reg_888(5),
      R => '0'
    );
\add_ln18_reg_888_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln18_fu_467_p2(6),
      Q => add_ln18_reg_888(6),
      R => '0'
    );
\add_ln18_reg_888_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => add_ln18_fu_467_p2(7),
      Q => add_ln18_reg_888(7),
      R => '0'
    );
\add_ln18_reg_888_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_add_ln18_reg_888_reg[7]_i_1_CO_UNCONNECTED\(7 downto 4),
      CO(3) => \add_ln18_reg_888_reg[7]_i_1_n_10\,
      CO(2) => \add_ln18_reg_888_reg[7]_i_1_n_11\,
      CO(1) => \add_ln18_reg_888_reg[7]_i_1_n_12\,
      CO(0) => \add_ln18_reg_888_reg[7]_i_1_n_13\,
      DI(7 downto 1) => B"0000000",
      DI(0) => or_ln_fu_459_p3(3),
      O(7 downto 5) => \NLW_add_ln18_reg_888_reg[7]_i_1_O_UNCONNECTED\(7 downto 5),
      O(4 downto 0) => add_ln18_fu_467_p2(7 downto 3),
      S(7 downto 4) => B"0001",
      S(3 downto 1) => tmp_1_reg_853(6 downto 4),
      S(0) => \add_ln18_reg_888[7]_i_2_n_6\
    );
\add_ln22_reg_924[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => add_ln_fu_528_p4(0),
      O => add_ln22_fu_518_p2(0)
    );
\add_ln22_reg_924[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => add_ln_fu_528_p4(0),
      I1 => add_ln_fu_528_p4(1),
      O => add_ln22_fu_518_p2(1)
    );
\add_ln22_reg_924[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => add_ln_fu_528_p4(2),
      I1 => add_ln_fu_528_p4(1),
      I2 => add_ln_fu_528_p4(0),
      O => add_ln22_fu_518_p2(2)
    );
\add_ln22_reg_924[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => add_ln_fu_528_p4(3),
      I1 => add_ln_fu_528_p4(0),
      I2 => add_ln_fu_528_p4(1),
      I3 => add_ln_fu_528_p4(2),
      O => add_ln22_fu_518_p2(3)
    );
\add_ln22_reg_924_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln22_fu_518_p2(0),
      Q => add_ln22_reg_924(0),
      R => '0'
    );
\add_ln22_reg_924_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln22_fu_518_p2(1),
      Q => add_ln22_reg_924(1),
      R => '0'
    );
\add_ln22_reg_924_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln22_fu_518_p2(2),
      Q => add_ln22_reg_924(2),
      R => '0'
    );
\add_ln22_reg_924_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln22_fu_518_p2(3),
      Q => add_ln22_reg_924(3),
      R => '0'
    );
\add_ln28_reg_995[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data3(3),
      O => add_ln28_fu_607_p2(0)
    );
\add_ln28_reg_995[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => data3(4),
      I1 => data3(3),
      O => add_ln28_fu_607_p2(1)
    );
\add_ln28_reg_995[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => data3(4),
      I1 => data3(3),
      I2 => data3(5),
      O => add_ln28_fu_607_p2(2)
    );
\add_ln28_reg_995[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => data3(6),
      I1 => data3(4),
      I2 => data3(3),
      I3 => data3(5),
      O => add_ln28_fu_607_p2(3)
    );
\add_ln28_reg_995_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => add_ln28_fu_607_p2(0),
      Q => add_ln28_reg_995(0),
      R => '0'
    );
\add_ln28_reg_995_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => add_ln28_fu_607_p2(1),
      Q => add_ln28_reg_995(1),
      R => '0'
    );
\add_ln28_reg_995_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => add_ln28_fu_607_p2(2),
      Q => add_ln28_reg_995(2),
      R => '0'
    );
\add_ln28_reg_995_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => add_ln28_fu_607_p2(3),
      Q => add_ln28_reg_995(3),
      R => '0'
    );
\add_ln44_reg_1100[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data1(0),
      O => add_ln44_fu_764_p2(0)
    );
\add_ln44_reg_1100[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => data1(1),
      I1 => data1(0),
      O => add_ln44_fu_764_p2(1)
    );
\add_ln44_reg_1100[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => data1(2),
      I1 => data1(0),
      I2 => data1(1),
      O => add_ln44_fu_764_p2(2)
    );
\add_ln44_reg_1100_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln44_fu_764_p2(0),
      Q => add_ln44_reg_1100(0),
      R => '0'
    );
\add_ln44_reg_1100_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln44_fu_764_p2(1),
      Q => add_ln44_reg_1100(1),
      R => '0'
    );
\add_ln44_reg_1100_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln44_fu_764_p2(2),
      Q => add_ln44_reg_1100(2),
      R => '0'
    );
\add_ln48_reg_1115[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(15),
      I1 => \^orig_q0\(15),
      O => \add_ln48_reg_1115[15]_i_2_n_6\
    );
\add_ln48_reg_1115[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(14),
      I1 => \^orig_q0\(14),
      O => \add_ln48_reg_1115[15]_i_3_n_6\
    );
\add_ln48_reg_1115[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(13),
      I1 => \^orig_q0\(13),
      O => \add_ln48_reg_1115[15]_i_4_n_6\
    );
\add_ln48_reg_1115[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(12),
      I1 => \^orig_q0\(12),
      O => \add_ln48_reg_1115[15]_i_5_n_6\
    );
\add_ln48_reg_1115[15]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(11),
      I1 => \^orig_q0\(11),
      O => \add_ln48_reg_1115[15]_i_6_n_6\
    );
\add_ln48_reg_1115[15]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(10),
      I1 => \^orig_q0\(10),
      O => \add_ln48_reg_1115[15]_i_7_n_6\
    );
\add_ln48_reg_1115[15]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(9),
      I1 => \^orig_q0\(9),
      O => \add_ln48_reg_1115[15]_i_8_n_6\
    );
\add_ln48_reg_1115[15]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(8),
      I1 => \^orig_q0\(8),
      O => \add_ln48_reg_1115[15]_i_9_n_6\
    );
\add_ln48_reg_1115[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(23),
      I1 => \^orig_q0\(23),
      O => \add_ln48_reg_1115[23]_i_2_n_6\
    );
\add_ln48_reg_1115[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(22),
      I1 => \^orig_q0\(22),
      O => \add_ln48_reg_1115[23]_i_3_n_6\
    );
\add_ln48_reg_1115[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(21),
      I1 => \^orig_q0\(21),
      O => \add_ln48_reg_1115[23]_i_4_n_6\
    );
\add_ln48_reg_1115[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(20),
      I1 => \^orig_q0\(20),
      O => \add_ln48_reg_1115[23]_i_5_n_6\
    );
\add_ln48_reg_1115[23]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(19),
      I1 => \^orig_q0\(19),
      O => \add_ln48_reg_1115[23]_i_6_n_6\
    );
\add_ln48_reg_1115[23]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(18),
      I1 => \^orig_q0\(18),
      O => \add_ln48_reg_1115[23]_i_7_n_6\
    );
\add_ln48_reg_1115[23]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(17),
      I1 => \^orig_q0\(17),
      O => \add_ln48_reg_1115[23]_i_8_n_6\
    );
\add_ln48_reg_1115[23]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(16),
      I1 => \^orig_q0\(16),
      O => \add_ln48_reg_1115[23]_i_9_n_6\
    );
\add_ln48_reg_1115[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^orig_q0\(31),
      I1 => reg_387(31),
      O => \add_ln48_reg_1115[31]_i_2_n_6\
    );
\add_ln48_reg_1115[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(30),
      I1 => \^orig_q0\(30),
      O => \add_ln48_reg_1115[31]_i_3_n_6\
    );
\add_ln48_reg_1115[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(29),
      I1 => \^orig_q0\(29),
      O => \add_ln48_reg_1115[31]_i_4_n_6\
    );
\add_ln48_reg_1115[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(28),
      I1 => \^orig_q0\(28),
      O => \add_ln48_reg_1115[31]_i_5_n_6\
    );
\add_ln48_reg_1115[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(27),
      I1 => \^orig_q0\(27),
      O => \add_ln48_reg_1115[31]_i_6_n_6\
    );
\add_ln48_reg_1115[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(26),
      I1 => \^orig_q0\(26),
      O => \add_ln48_reg_1115[31]_i_7_n_6\
    );
\add_ln48_reg_1115[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(25),
      I1 => \^orig_q0\(25),
      O => \add_ln48_reg_1115[31]_i_8_n_6\
    );
\add_ln48_reg_1115[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(24),
      I1 => \^orig_q0\(24),
      O => \add_ln48_reg_1115[31]_i_9_n_6\
    );
\add_ln48_reg_1115[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(7),
      I1 => \^orig_q0\(7),
      O => \add_ln48_reg_1115[7]_i_2_n_6\
    );
\add_ln48_reg_1115[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(6),
      I1 => \^orig_q0\(6),
      O => \add_ln48_reg_1115[7]_i_3_n_6\
    );
\add_ln48_reg_1115[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(5),
      I1 => \^orig_q0\(5),
      O => \add_ln48_reg_1115[7]_i_4_n_6\
    );
\add_ln48_reg_1115[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(4),
      I1 => \^orig_q0\(4),
      O => \add_ln48_reg_1115[7]_i_5_n_6\
    );
\add_ln48_reg_1115[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(3),
      I1 => \^orig_q0\(3),
      O => \add_ln48_reg_1115[7]_i_6_n_6\
    );
\add_ln48_reg_1115[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(2),
      I1 => \^orig_q0\(2),
      O => \add_ln48_reg_1115[7]_i_7_n_6\
    );
\add_ln48_reg_1115[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(1),
      I1 => \^orig_q0\(1),
      O => \add_ln48_reg_1115[7]_i_8_n_6\
    );
\add_ln48_reg_1115[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_387(0),
      I1 => \^orig_q0\(0),
      O => \add_ln48_reg_1115[7]_i_9_n_6\
    );
\add_ln48_reg_1115_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(0),
      Q => add_ln48_reg_1115(0),
      R => '0'
    );
\add_ln48_reg_1115_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(10),
      Q => add_ln48_reg_1115(10),
      R => '0'
    );
\add_ln48_reg_1115_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(11),
      Q => add_ln48_reg_1115(11),
      R => '0'
    );
\add_ln48_reg_1115_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(12),
      Q => add_ln48_reg_1115(12),
      R => '0'
    );
\add_ln48_reg_1115_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(13),
      Q => add_ln48_reg_1115(13),
      R => '0'
    );
\add_ln48_reg_1115_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(14),
      Q => add_ln48_reg_1115(14),
      R => '0'
    );
\add_ln48_reg_1115_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(15),
      Q => add_ln48_reg_1115(15),
      R => '0'
    );
\add_ln48_reg_1115_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \add_ln48_reg_1115_reg[7]_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \add_ln48_reg_1115_reg[15]_i_1_n_6\,
      CO(6) => \add_ln48_reg_1115_reg[15]_i_1_n_7\,
      CO(5) => \add_ln48_reg_1115_reg[15]_i_1_n_8\,
      CO(4) => \add_ln48_reg_1115_reg[15]_i_1_n_9\,
      CO(3) => \add_ln48_reg_1115_reg[15]_i_1_n_10\,
      CO(2) => \add_ln48_reg_1115_reg[15]_i_1_n_11\,
      CO(1) => \add_ln48_reg_1115_reg[15]_i_1_n_12\,
      CO(0) => \add_ln48_reg_1115_reg[15]_i_1_n_13\,
      DI(7 downto 0) => reg_387(15 downto 8),
      O(7 downto 0) => add_ln48_fu_804_p2(15 downto 8),
      S(7) => \add_ln48_reg_1115[15]_i_2_n_6\,
      S(6) => \add_ln48_reg_1115[15]_i_3_n_6\,
      S(5) => \add_ln48_reg_1115[15]_i_4_n_6\,
      S(4) => \add_ln48_reg_1115[15]_i_5_n_6\,
      S(3) => \add_ln48_reg_1115[15]_i_6_n_6\,
      S(2) => \add_ln48_reg_1115[15]_i_7_n_6\,
      S(1) => \add_ln48_reg_1115[15]_i_8_n_6\,
      S(0) => \add_ln48_reg_1115[15]_i_9_n_6\
    );
\add_ln48_reg_1115_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(16),
      Q => add_ln48_reg_1115(16),
      R => '0'
    );
\add_ln48_reg_1115_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(17),
      Q => add_ln48_reg_1115(17),
      R => '0'
    );
\add_ln48_reg_1115_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(18),
      Q => add_ln48_reg_1115(18),
      R => '0'
    );
\add_ln48_reg_1115_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(19),
      Q => add_ln48_reg_1115(19),
      R => '0'
    );
\add_ln48_reg_1115_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(1),
      Q => add_ln48_reg_1115(1),
      R => '0'
    );
\add_ln48_reg_1115_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(20),
      Q => add_ln48_reg_1115(20),
      R => '0'
    );
\add_ln48_reg_1115_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(21),
      Q => add_ln48_reg_1115(21),
      R => '0'
    );
\add_ln48_reg_1115_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(22),
      Q => add_ln48_reg_1115(22),
      R => '0'
    );
\add_ln48_reg_1115_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(23),
      Q => add_ln48_reg_1115(23),
      R => '0'
    );
\add_ln48_reg_1115_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \add_ln48_reg_1115_reg[15]_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \add_ln48_reg_1115_reg[23]_i_1_n_6\,
      CO(6) => \add_ln48_reg_1115_reg[23]_i_1_n_7\,
      CO(5) => \add_ln48_reg_1115_reg[23]_i_1_n_8\,
      CO(4) => \add_ln48_reg_1115_reg[23]_i_1_n_9\,
      CO(3) => \add_ln48_reg_1115_reg[23]_i_1_n_10\,
      CO(2) => \add_ln48_reg_1115_reg[23]_i_1_n_11\,
      CO(1) => \add_ln48_reg_1115_reg[23]_i_1_n_12\,
      CO(0) => \add_ln48_reg_1115_reg[23]_i_1_n_13\,
      DI(7 downto 0) => reg_387(23 downto 16),
      O(7 downto 0) => add_ln48_fu_804_p2(23 downto 16),
      S(7) => \add_ln48_reg_1115[23]_i_2_n_6\,
      S(6) => \add_ln48_reg_1115[23]_i_3_n_6\,
      S(5) => \add_ln48_reg_1115[23]_i_4_n_6\,
      S(4) => \add_ln48_reg_1115[23]_i_5_n_6\,
      S(3) => \add_ln48_reg_1115[23]_i_6_n_6\,
      S(2) => \add_ln48_reg_1115[23]_i_7_n_6\,
      S(1) => \add_ln48_reg_1115[23]_i_8_n_6\,
      S(0) => \add_ln48_reg_1115[23]_i_9_n_6\
    );
\add_ln48_reg_1115_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(24),
      Q => add_ln48_reg_1115(24),
      R => '0'
    );
\add_ln48_reg_1115_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(25),
      Q => add_ln48_reg_1115(25),
      R => '0'
    );
\add_ln48_reg_1115_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(26),
      Q => add_ln48_reg_1115(26),
      R => '0'
    );
\add_ln48_reg_1115_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(27),
      Q => add_ln48_reg_1115(27),
      R => '0'
    );
\add_ln48_reg_1115_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(28),
      Q => add_ln48_reg_1115(28),
      R => '0'
    );
\add_ln48_reg_1115_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(29),
      Q => add_ln48_reg_1115(29),
      R => '0'
    );
\add_ln48_reg_1115_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(2),
      Q => add_ln48_reg_1115(2),
      R => '0'
    );
\add_ln48_reg_1115_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(30),
      Q => add_ln48_reg_1115(30),
      R => '0'
    );
\add_ln48_reg_1115_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(31),
      Q => add_ln48_reg_1115(31),
      R => '0'
    );
\add_ln48_reg_1115_reg[31]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \add_ln48_reg_1115_reg[23]_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \NLW_add_ln48_reg_1115_reg[31]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \add_ln48_reg_1115_reg[31]_i_1_n_7\,
      CO(5) => \add_ln48_reg_1115_reg[31]_i_1_n_8\,
      CO(4) => \add_ln48_reg_1115_reg[31]_i_1_n_9\,
      CO(3) => \add_ln48_reg_1115_reg[31]_i_1_n_10\,
      CO(2) => \add_ln48_reg_1115_reg[31]_i_1_n_11\,
      CO(1) => \add_ln48_reg_1115_reg[31]_i_1_n_12\,
      CO(0) => \add_ln48_reg_1115_reg[31]_i_1_n_13\,
      DI(7) => '0',
      DI(6 downto 0) => reg_387(30 downto 24),
      O(7 downto 0) => add_ln48_fu_804_p2(31 downto 24),
      S(7) => \add_ln48_reg_1115[31]_i_2_n_6\,
      S(6) => \add_ln48_reg_1115[31]_i_3_n_6\,
      S(5) => \add_ln48_reg_1115[31]_i_4_n_6\,
      S(4) => \add_ln48_reg_1115[31]_i_5_n_6\,
      S(3) => \add_ln48_reg_1115[31]_i_6_n_6\,
      S(2) => \add_ln48_reg_1115[31]_i_7_n_6\,
      S(1) => \add_ln48_reg_1115[31]_i_8_n_6\,
      S(0) => \add_ln48_reg_1115[31]_i_9_n_6\
    );
\add_ln48_reg_1115_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(3),
      Q => add_ln48_reg_1115(3),
      R => '0'
    );
\add_ln48_reg_1115_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(4),
      Q => add_ln48_reg_1115(4),
      R => '0'
    );
\add_ln48_reg_1115_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(5),
      Q => add_ln48_reg_1115(5),
      R => '0'
    );
\add_ln48_reg_1115_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(6),
      Q => add_ln48_reg_1115(6),
      R => '0'
    );
\add_ln48_reg_1115_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(7),
      Q => add_ln48_reg_1115(7),
      R => '0'
    );
\add_ln48_reg_1115_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \add_ln48_reg_1115_reg[7]_i_1_n_6\,
      CO(6) => \add_ln48_reg_1115_reg[7]_i_1_n_7\,
      CO(5) => \add_ln48_reg_1115_reg[7]_i_1_n_8\,
      CO(4) => \add_ln48_reg_1115_reg[7]_i_1_n_9\,
      CO(3) => \add_ln48_reg_1115_reg[7]_i_1_n_10\,
      CO(2) => \add_ln48_reg_1115_reg[7]_i_1_n_11\,
      CO(1) => \add_ln48_reg_1115_reg[7]_i_1_n_12\,
      CO(0) => \add_ln48_reg_1115_reg[7]_i_1_n_13\,
      DI(7 downto 0) => reg_387(7 downto 0),
      O(7 downto 0) => add_ln48_fu_804_p2(7 downto 0),
      S(7) => \add_ln48_reg_1115[7]_i_2_n_6\,
      S(6) => \add_ln48_reg_1115[7]_i_3_n_6\,
      S(5) => \add_ln48_reg_1115[7]_i_4_n_6\,
      S(4) => \add_ln48_reg_1115[7]_i_5_n_6\,
      S(3) => \add_ln48_reg_1115[7]_i_6_n_6\,
      S(2) => \add_ln48_reg_1115[7]_i_7_n_6\,
      S(1) => \add_ln48_reg_1115[7]_i_8_n_6\,
      S(0) => \add_ln48_reg_1115[7]_i_9_n_6\
    );
\add_ln48_reg_1115_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(8),
      Q => add_ln48_reg_1115(8),
      R => '0'
    );
\add_ln48_reg_1115_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state18,
      D => add_ln48_fu_804_p2(9),
      Q => add_ln48_reg_1115(9),
      R => '0'
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^ap_ready\,
      I1 => ap_start,
      I2 => \ap_CS_fsm_reg_n_6_[0]\,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state10,
      I1 => data3(6),
      I2 => data3(5),
      I3 => data3(3),
      I4 => data3(4),
      O => ap_NS_fsm(10)
    );
\ap_CS_fsm[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^c_ce0\,
      I1 => shl_ln_fu_582_p4(10),
      I2 => shl_ln_fu_582_p4(8),
      I3 => shl_ln_fu_582_p4(7),
      I4 => shl_ln_fu_582_p4(9),
      O => i_2_fu_1140
    );
\ap_CS_fsm[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state12,
      I1 => tmp2_cast_fu_669_p1(3),
      I2 => tmp2_cast_fu_669_p1(2),
      I3 => tmp2_cast_fu_669_p1(1),
      I4 => tmp2_cast_fu_669_p1(0),
      I5 => ap_CS_fsm_state14,
      O => ap_NS_fsm(12)
    );
\ap_CS_fsm[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAAA"
    )
        port map (
      I0 => j_2_reg_3580,
      I1 => data1(2),
      I2 => data1(0),
      I3 => data1(1),
      I4 => ap_CS_fsm_state15,
      O => ap_NS_fsm(13)
    );
\ap_CS_fsm[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state20,
      I1 => tmp2_cast_fu_669_p1(3),
      I2 => tmp2_cast_fu_669_p1(2),
      I3 => tmp2_cast_fu_669_p1(1),
      I4 => tmp2_cast_fu_669_p1(0),
      I5 => ap_CS_fsm_state14,
      O => ap_NS_fsm(14)
    );
\ap_CS_fsm[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => ap_CS_fsm_state15,
      I1 => data1(1),
      I2 => data1(0),
      I3 => data1(2),
      O => ap_NS_fsm(15)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_start,
      I1 => \ap_CS_fsm_reg_n_6_[0]\,
      I2 => ap_NS_fsm15_out,
      O => ap_NS_fsm(1)
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => k_reg_3250,
      O => ap_NS_fsm(2)
    );
\ap_CS_fsm[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAA8A"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => or_ln_fu_459_p3(2),
      I2 => or_ln_fu_459_p3(3),
      I3 => or_ln_fu_459_p3(0),
      I4 => or_ln_fu_459_p3(1),
      O => ap_NS_fsm(3)
    );
\ap_CS_fsm[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAABAAAAAA"
    )
        port map (
      I0 => ap_NS_fsm16_out,
      I1 => add_ln_fu_528_p4(2),
      I2 => add_ln_fu_528_p4(1),
      I3 => add_ln_fu_528_p4(3),
      I4 => ap_CS_fsm_state7,
      I5 => add_ln_fu_528_p4(0),
      O => ap_NS_fsm(5)
    );
\ap_CS_fsm[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state8,
      I1 => add_ln_fu_528_p4(10),
      I2 => add_ln_fu_528_p4(9),
      I3 => add_ln_fu_528_p4(8),
      I4 => add_ln_fu_528_p4(7),
      I5 => ap_CS_fsm_state6,
      O => ap_NS_fsm(6)
    );
\ap_CS_fsm[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00EF00"
    )
        port map (
      I0 => add_ln_fu_528_p4(2),
      I1 => add_ln_fu_528_p4(1),
      I2 => add_ln_fu_528_p4(3),
      I3 => ap_CS_fsm_state7,
      I4 => add_ln_fu_528_p4(0),
      O => ap_NS_fsm(7)
    );
\ap_CS_fsm[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80000000"
    )
        port map (
      I0 => add_ln_fu_528_p4(10),
      I1 => add_ln_fu_528_p4(9),
      I2 => add_ln_fu_528_p4(8),
      I3 => add_ln_fu_528_p4(7),
      I4 => ap_CS_fsm_state6,
      I5 => ap_NS_fsm11_out,
      O => ap_NS_fsm(8)
    );
\ap_CS_fsm[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => shl_ln_fu_582_p4(9),
      I2 => shl_ln_fu_582_p4(7),
      I3 => shl_ln_fu_582_p4(8),
      I4 => shl_ln_fu_582_p4(10),
      I5 => \^c_ce0\,
      O => ap_NS_fsm(9)
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_6_[0]\,
      S => ap_rst
    );
\ap_CS_fsm_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(10),
      Q => ap_CS_fsm_state11,
      R => ap_rst
    );
\ap_CS_fsm_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => i_2_fu_1140,
      Q => ap_CS_fsm_state12,
      R => ap_rst
    );
\ap_CS_fsm_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(12),
      Q => ap_CS_fsm_state13,
      R => ap_rst
    );
\ap_CS_fsm_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(13),
      Q => ap_CS_fsm_state14,
      R => ap_rst
    );
\ap_CS_fsm_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(14),
      Q => ap_CS_fsm_state15,
      R => ap_rst
    );
\ap_CS_fsm_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(15),
      Q => ap_CS_fsm_state16,
      R => ap_rst
    );
\ap_CS_fsm_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state16,
      Q => ap_CS_fsm_state17,
      R => ap_rst
    );
\ap_CS_fsm_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state17,
      Q => ap_CS_fsm_state18,
      R => ap_rst
    );
\ap_CS_fsm_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state18,
      Q => ap_CS_fsm_state19,
      R => ap_rst
    );
\ap_CS_fsm_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state19,
      Q => ap_CS_fsm_state20,
      R => ap_rst
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => ap_CS_fsm_state3,
      R => ap_rst
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(3),
      Q => ap_CS_fsm_state4,
      R => ap_rst
    );
\ap_CS_fsm_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state4,
      Q => ap_CS_fsm_state5,
      R => ap_rst
    );
\ap_CS_fsm_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(5),
      Q => ap_CS_fsm_state6,
      R => ap_rst
    );
\ap_CS_fsm_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(6),
      Q => ap_CS_fsm_state7,
      R => ap_rst
    );
\ap_CS_fsm_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(7),
      Q => ap_CS_fsm_state8,
      R => ap_rst
    );
\ap_CS_fsm_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(8),
      Q => \^c_ce0\,
      R => ap_rst
    );
\ap_CS_fsm_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(9),
      Q => ap_CS_fsm_state10,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_6_[0]\,
      I1 => ap_start,
      O => ap_idle
    );
ap_ready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => ap_CS_fsm_state13,
      I1 => i_2_fu_114(1),
      I2 => i_2_fu_114(0),
      I3 => i_2_fu_114(2),
      I4 => i_2_fu_114(3),
      O => \^ap_ready\
    );
\empty_14_reg_909_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state6,
      D => add_ln_fu_528_p4(10),
      Q => empty_14_reg_909(10),
      R => '0'
    );
\empty_14_reg_909_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state6,
      D => add_ln_fu_528_p4(7),
      Q => empty_14_reg_909(7),
      R => '0'
    );
\empty_14_reg_909_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state6,
      D => add_ln_fu_528_p4(8),
      Q => empty_14_reg_909(8),
      R => '0'
    );
\empty_14_reg_909_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state6,
      D => add_ln_fu_528_p4(9),
      Q => empty_14_reg_909(9),
      R => '0'
    );
\empty_15_reg_1036[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data1(7),
      O => empty_15_fu_664_p2(4)
    );
\empty_15_reg_1036_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp2_cast_fu_669_p1(0),
      Q => empty_15_reg_1036(0),
      R => '0'
    );
\empty_15_reg_1036_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp2_cast_fu_669_p1(1),
      Q => empty_15_reg_1036(1),
      R => '0'
    );
\empty_15_reg_1036_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp2_cast_fu_669_p1(2),
      Q => empty_15_reg_1036(2),
      R => '0'
    );
\empty_15_reg_1036_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp2_cast_fu_669_p1(3),
      Q => empty_15_reg_1036(3),
      R => '0'
    );
\empty_15_reg_1036_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_15_fu_664_p2(4),
      Q => empty_15_reg_1036(4),
      R => '0'
    );
\empty_15_reg_1036_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_15_fu_664_p2(5),
      Q => empty_15_reg_1036(5),
      R => '0'
    );
\empty_15_reg_1036_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_15_fu_664_p2(6),
      Q => empty_15_reg_1036(6),
      R => '0'
    );
\empty_15_reg_1036_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_15_fu_664_p2(7),
      Q => empty_15_reg_1036(7),
      R => '0'
    );
\empty_15_reg_1036_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => data1(7),
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_empty_15_reg_1036_reg[7]_i_1_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \empty_15_reg_1036_reg[7]_i_1_n_12\,
      CO(0) => \empty_15_reg_1036_reg[7]_i_1_n_13\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_empty_15_reg_1036_reg[7]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => empty_15_fu_664_p2(7 downto 5),
      S(7 downto 3) => B"00000",
      S(2 downto 0) => data1(10 downto 8)
    );
\empty_16_reg_1041[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data1(10),
      O => \empty_16_reg_1041[7]_i_2_n_6\
    );
\empty_16_reg_1041[7]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data1(9),
      O => \empty_16_reg_1041[7]_i_3_n_6\
    );
\empty_16_reg_1041[7]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data1(8),
      O => \empty_16_reg_1041[7]_i_4_n_6\
    );
\empty_16_reg_1041_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_16_fu_673_p2(5),
      Q => empty_16_reg_1041(5),
      R => '0'
    );
\empty_16_reg_1041_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_16_fu_673_p2(6),
      Q => empty_16_reg_1041(6),
      R => '0'
    );
\empty_16_reg_1041_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => empty_16_fu_673_p2(7),
      Q => empty_16_reg_1041(7),
      R => '0'
    );
\empty_16_reg_1041_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => data1(7),
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_empty_16_reg_1041_reg[7]_i_1_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \empty_16_reg_1041_reg[7]_i_1_n_12\,
      CO(0) => \empty_16_reg_1041_reg[7]_i_1_n_13\,
      DI(7 downto 2) => B"000000",
      DI(1 downto 0) => data1(9 downto 8),
      O(7 downto 3) => \NLW_empty_16_reg_1041_reg[7]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => empty_16_fu_673_p2(7 downto 5),
      S(7 downto 3) => B"00000",
      S(2) => \empty_16_reg_1041[7]_i_2_n_6\,
      S(1) => \empty_16_reg_1041[7]_i_3_n_6\,
      S(0) => \empty_16_reg_1041[7]_i_4_n_6\
    );
\i_1_fu_110[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => shl_ln_fu_582_p4(7),
      O => add_ln27_fu_613_p2(0)
    );
\i_1_fu_110[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => shl_ln_fu_582_p4(7),
      I1 => shl_ln_fu_582_p4(8),
      O => add_ln27_fu_613_p2(1)
    );
\i_1_fu_110[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => shl_ln_fu_582_p4(9),
      I1 => shl_ln_fu_582_p4(7),
      I2 => shl_ln_fu_582_p4(8),
      O => add_ln27_fu_613_p2(2)
    );
\i_1_fu_110[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => ap_CS_fsm_state6,
      I1 => add_ln_fu_528_p4(7),
      I2 => add_ln_fu_528_p4(8),
      I3 => add_ln_fu_528_p4(9),
      I4 => add_ln_fu_528_p4(10),
      O => ap_NS_fsm14_out
    );
\i_1_fu_110[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => data3(4),
      I1 => data3(3),
      I2 => data3(5),
      I3 => data3(6),
      I4 => ap_CS_fsm_state10,
      O => ap_NS_fsm11_out
    );
\i_1_fu_110[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => shl_ln_fu_582_p4(10),
      I1 => shl_ln_fu_582_p4(8),
      I2 => shl_ln_fu_582_p4(7),
      I3 => shl_ln_fu_582_p4(9),
      O => add_ln27_fu_613_p2(3)
    );
\i_1_fu_110_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm11_out,
      D => add_ln27_fu_613_p2(0),
      Q => shl_ln_fu_582_p4(7),
      S => ap_NS_fsm14_out
    );
\i_1_fu_110_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm11_out,
      D => add_ln27_fu_613_p2(1),
      Q => shl_ln_fu_582_p4(8),
      R => ap_NS_fsm14_out
    );
\i_1_fu_110_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm11_out,
      D => add_ln27_fu_613_p2(2),
      Q => shl_ln_fu_582_p4(9),
      R => ap_NS_fsm14_out
    );
\i_1_fu_110_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm11_out,
      D => add_ln27_fu_613_p2(3),
      Q => shl_ln_fu_582_p4(10),
      R => ap_NS_fsm14_out
    );
\i_2_fu_114[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => ap_CS_fsm_state14,
      I1 => tmp2_cast_fu_669_p1(0),
      I2 => tmp2_cast_fu_669_p1(1),
      I3 => tmp2_cast_fu_669_p1(2),
      I4 => tmp2_cast_fu_669_p1(3),
      O => ap_NS_fsm10_out
    );
\i_2_fu_114_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm10_out,
      D => indvars_iv_next33_reg_1022(0),
      Q => i_2_fu_114(0),
      S => i_2_fu_1140
    );
\i_2_fu_114_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm10_out,
      D => indvars_iv_next33_reg_1022(1),
      Q => i_2_fu_114(1),
      R => i_2_fu_1140
    );
\i_2_fu_114_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm10_out,
      D => indvars_iv_next33_reg_1022(2),
      Q => i_2_fu_114(2),
      R => i_2_fu_1140
    );
\i_2_fu_114_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm10_out,
      D => indvars_iv_next33_reg_1022(3),
      Q => i_2_fu_114(3),
      R => i_2_fu_1140
    );
\i_5_reg_1010_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => i_2_fu_114(0),
      Q => data1(7),
      R => '0'
    );
\i_5_reg_1010_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => i_2_fu_114(1),
      Q => data1(8),
      R => '0'
    );
\i_5_reg_1010_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => i_2_fu_114(2),
      Q => data1(9),
      R => '0'
    );
\i_5_reg_1010_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => i_2_fu_114(3),
      Q => data1(10),
      R => '0'
    );
\i_fu_106[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => add_ln_fu_528_p4(7),
      O => \i_fu_106[0]_i_1_n_6\
    );
\i_fu_106[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => add_ln_fu_528_p4(8),
      I1 => add_ln_fu_528_p4(7),
      O => add_ln21_fu_552_p2(1)
    );
\i_fu_106[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => add_ln_fu_528_p4(9),
      I1 => add_ln_fu_528_p4(8),
      I2 => add_ln_fu_528_p4(7),
      O => add_ln21_fu_552_p2(2)
    );
\i_fu_106[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => \j_fu_102_reg_n_6_[2]\,
      I2 => \j_fu_102_reg_n_6_[4]\,
      I3 => \j_fu_102_reg_n_6_[3]\,
      I4 => \j_fu_102_reg_n_6_[0]\,
      I5 => \j_fu_102_reg_n_6_[1]\,
      O => ap_NS_fsm16_out
    );
\i_fu_106[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => add_ln_fu_528_p4(0),
      I1 => ap_CS_fsm_state7,
      I2 => add_ln_fu_528_p4(3),
      I3 => add_ln_fu_528_p4(1),
      I4 => add_ln_fu_528_p4(2),
      O => ap_NS_fsm13_out
    );
\i_fu_106[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => add_ln_fu_528_p4(7),
      I1 => add_ln_fu_528_p4(8),
      I2 => add_ln_fu_528_p4(9),
      I3 => add_ln_fu_528_p4(10),
      O => add_ln21_fu_552_p2(3)
    );
\i_fu_106_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm13_out,
      D => \i_fu_106[0]_i_1_n_6\,
      Q => add_ln_fu_528_p4(7),
      S => ap_NS_fsm16_out
    );
\i_fu_106_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm13_out,
      D => add_ln21_fu_552_p2(1),
      Q => add_ln_fu_528_p4(8),
      R => ap_NS_fsm16_out
    );
\i_fu_106_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm13_out,
      D => add_ln21_fu_552_p2(2),
      Q => add_ln_fu_528_p4(9),
      R => ap_NS_fsm16_out
    );
\i_fu_106_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm13_out,
      D => add_ln21_fu_552_p2(3),
      Q => add_ln_fu_528_p4(10),
      R => ap_NS_fsm16_out
    );
\indvars_iv_next19_reg_1046[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(0),
      O => indvars_iv_next19_fu_678_p2(0)
    );
\indvars_iv_next19_reg_1046[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(1),
      I1 => tmp2_cast_fu_669_p1(0),
      O => indvars_iv_next19_fu_678_p2(1)
    );
\indvars_iv_next19_reg_1046[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(2),
      I1 => tmp2_cast_fu_669_p1(0),
      I2 => tmp2_cast_fu_669_p1(1),
      O => \indvars_iv_next19_reg_1046[2]_i_1_n_6\
    );
\indvars_iv_next19_reg_1046[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(3),
      I1 => tmp2_cast_fu_669_p1(2),
      I2 => tmp2_cast_fu_669_p1(1),
      I3 => tmp2_cast_fu_669_p1(0),
      O => \indvars_iv_next19_reg_1046[3]_i_1_n_6\
    );
\indvars_iv_next19_reg_1046_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => indvars_iv_next19_fu_678_p2(0),
      Q => data1(3),
      R => '0'
    );
\indvars_iv_next19_reg_1046_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => indvars_iv_next19_fu_678_p2(1),
      Q => data1(4),
      R => '0'
    );
\indvars_iv_next19_reg_1046_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => \indvars_iv_next19_reg_1046[2]_i_1_n_6\,
      Q => data1(5),
      R => '0'
    );
\indvars_iv_next19_reg_1046_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => \indvars_iv_next19_reg_1046[3]_i_1_n_6\,
      Q => data1(6),
      R => '0'
    );
\indvars_iv_next33_reg_1022[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_2_fu_114(0),
      O => indvars_iv_next33_fu_632_p2(0)
    );
\indvars_iv_next33_reg_1022[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => i_2_fu_114(0),
      I1 => i_2_fu_114(1),
      O => indvars_iv_next33_fu_632_p2(1)
    );
\indvars_iv_next33_reg_1022[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => i_2_fu_114(2),
      I1 => i_2_fu_114(0),
      I2 => i_2_fu_114(1),
      O => indvars_iv_next33_fu_632_p2(2)
    );
\indvars_iv_next33_reg_1022[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => i_2_fu_114(1),
      I1 => i_2_fu_114(0),
      I2 => i_2_fu_114(2),
      I3 => i_2_fu_114(3),
      O => indvars_iv_next33_fu_632_p2(3)
    );
\indvars_iv_next33_reg_1022_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => indvars_iv_next33_fu_632_p2(0),
      Q => indvars_iv_next33_reg_1022(0),
      R => '0'
    );
\indvars_iv_next33_reg_1022_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => indvars_iv_next33_fu_632_p2(1),
      Q => indvars_iv_next33_reg_1022(1),
      R => '0'
    );
\indvars_iv_next33_reg_1022_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => indvars_iv_next33_fu_632_p2(2),
      Q => indvars_iv_next33_reg_1022(2),
      R => '0'
    );
\indvars_iv_next33_reg_1022_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state13,
      D => indvars_iv_next33_fu_632_p2(3),
      Q => indvars_iv_next33_reg_1022(3),
      R => '0'
    );
\j_1_reg_347[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => \^c_ce0\,
      I1 => shl_ln_fu_582_p4(10),
      I2 => shl_ln_fu_582_p4(8),
      I3 => shl_ln_fu_582_p4(7),
      I4 => shl_ln_fu_582_p4(9),
      O => ap_NS_fsm12_out
    );
\j_1_reg_347_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state11,
      D => add_ln28_reg_995(0),
      Q => data3(3),
      S => ap_NS_fsm12_out
    );
\j_1_reg_347_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state11,
      D => add_ln28_reg_995(1),
      Q => data3(4),
      R => ap_NS_fsm12_out
    );
\j_1_reg_347_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state11,
      D => add_ln28_reg_995(2),
      Q => data3(5),
      R => ap_NS_fsm12_out
    );
\j_1_reg_347_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state11,
      D => add_ln28_reg_995(3),
      Q => data3(6),
      R => ap_NS_fsm12_out
    );
\j_2_reg_358[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state13,
      I1 => i_2_fu_114(1),
      I2 => i_2_fu_114(0),
      I3 => i_2_fu_114(2),
      I4 => i_2_fu_114(3),
      O => j_2_reg_3580
    );
\j_2_reg_358[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => ap_CS_fsm_state15,
      I1 => data1(1),
      I2 => data1(0),
      I3 => data1(2),
      O => ap_NS_fsm1
    );
\j_2_reg_358_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => data1(3),
      Q => tmp2_cast_fu_669_p1(0),
      S => j_2_reg_3580
    );
\j_2_reg_358_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => data1(4),
      Q => tmp2_cast_fu_669_p1(1),
      R => j_2_reg_3580
    );
\j_2_reg_358_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => data1(5),
      Q => tmp2_cast_fu_669_p1(2),
      R => j_2_reg_3580
    );
\j_2_reg_358_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => data1(6),
      Q => tmp2_cast_fu_669_p1(3),
      R => j_2_reg_3580
    );
\j_fu_102[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_6_[0]\,
      I1 => ap_start,
      O => ap_NS_fsm17_out
    );
\j_fu_102[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => or_ln_fu_459_p3(2),
      I2 => or_ln_fu_459_p3(3),
      I3 => or_ln_fu_459_p3(0),
      I4 => or_ln_fu_459_p3(1),
      O => ap_NS_fsm15_out
    );
\j_fu_102_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm15_out,
      D => add_ln15_reg_848(0),
      Q => \j_fu_102_reg_n_6_[0]\,
      R => ap_NS_fsm17_out
    );
\j_fu_102_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm15_out,
      D => add_ln15_reg_848(1),
      Q => \j_fu_102_reg_n_6_[1]\,
      R => ap_NS_fsm17_out
    );
\j_fu_102_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm15_out,
      D => add_ln15_reg_848(2),
      Q => \j_fu_102_reg_n_6_[2]\,
      R => ap_NS_fsm17_out
    );
\j_fu_102_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm15_out,
      D => add_ln15_reg_848(3),
      Q => \j_fu_102_reg_n_6_[3]\,
      R => ap_NS_fsm17_out
    );
\j_fu_102_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_NS_fsm15_out,
      D => add_ln15_reg_848(4),
      Q => \j_fu_102_reg_n_6_[4]\,
      R => ap_NS_fsm17_out
    );
\k_1_reg_336[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state6,
      I1 => add_ln_fu_528_p4(7),
      I2 => add_ln_fu_528_p4(8),
      I3 => add_ln_fu_528_p4(9),
      I4 => add_ln_fu_528_p4(10),
      O => k_1_reg_3360
    );
\k_1_reg_336_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state8,
      D => add_ln22_reg_924(0),
      Q => add_ln_fu_528_p4(0),
      R => k_1_reg_3360
    );
\k_1_reg_336_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state8,
      D => add_ln22_reg_924(1),
      Q => add_ln_fu_528_p4(1),
      R => k_1_reg_3360
    );
\k_1_reg_336_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state8,
      D => add_ln22_reg_924(2),
      Q => add_ln_fu_528_p4(2),
      R => k_1_reg_3360
    );
\k_1_reg_336_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state8,
      D => add_ln22_reg_924(3),
      Q => add_ln_fu_528_p4(3),
      R => k_1_reg_3360
    );
\k_2_reg_370[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => ap_CS_fsm_state14,
      I1 => tmp2_cast_fu_669_p1(0),
      I2 => tmp2_cast_fu_669_p1(1),
      I3 => tmp2_cast_fu_669_p1(2),
      I4 => tmp2_cast_fu_669_p1(3),
      O => k_2_reg_3700
    );
\k_2_reg_370_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state20,
      D => add_ln44_reg_1100(0),
      Q => data1(0),
      S => k_2_reg_3700
    );
\k_2_reg_370_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state20,
      D => add_ln44_reg_1100(1),
      Q => data1(1),
      R => k_2_reg_3700
    );
\k_2_reg_370_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state20,
      D => add_ln44_reg_1100(2),
      Q => data1(2),
      R => k_2_reg_3700
    );
\k_reg_325[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAA8A"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => \j_fu_102_reg_n_6_[2]\,
      I2 => \j_fu_102_reg_n_6_[4]\,
      I3 => \j_fu_102_reg_n_6_[3]\,
      I4 => \j_fu_102_reg_n_6_[0]\,
      I5 => \j_fu_102_reg_n_6_[1]\,
      O => k_reg_3250
    );
\k_reg_325_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state5,
      D => add_ln16_reg_873(0),
      Q => or_ln_fu_459_p3(0),
      R => k_reg_3250
    );
\k_reg_325_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state5,
      D => add_ln16_reg_873(1),
      Q => or_ln_fu_459_p3(1),
      R => k_reg_3250
    );
\k_reg_325_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state5,
      D => add_ln16_reg_873(2),
      Q => or_ln_fu_459_p3(2),
      R => k_reg_3250
    );
\k_reg_325_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state5,
      D => add_ln16_reg_873(3),
      Q => or_ln_fu_459_p3(3),
      R => k_reg_3250
    );
mul_32s_32s_32_1_1_U1: entity work.bd_0_hls_inst_0_stencil3d_mul_32s_32s_32_1_1
     port map (
      D(31 downto 16) => \tmp_product__3\(31 downto 16),
      D(15) => mul_32s_32s_32_1_1_U1_n_22,
      D(14) => mul_32s_32s_32_1_1_U1_n_23,
      D(13) => mul_32s_32s_32_1_1_U1_n_24,
      D(12) => mul_32s_32s_32_1_1_U1_n_25,
      D(11) => mul_32s_32s_32_1_1_U1_n_26,
      D(10) => mul_32s_32s_32_1_1_U1_n_27,
      D(9) => mul_32s_32s_32_1_1_U1_n_28,
      D(8) => mul_32s_32s_32_1_1_U1_n_29,
      D(7) => mul_32s_32s_32_1_1_U1_n_30,
      D(6) => mul_32s_32s_32_1_1_U1_n_31,
      D(5) => mul_32s_32s_32_1_1_U1_n_32,
      D(4) => mul_32s_32s_32_1_1_U1_n_33,
      D(3) => mul_32s_32s_32_1_1_U1_n_34,
      D(2) => mul_32s_32s_32_1_1_U1_n_35,
      D(1) => mul_32s_32s_32_1_1_U1_n_36,
      D(0) => mul_32s_32s_32_1_1_U1_n_37,
      DSP_A_B_DATA_INST(31 downto 0) => C_load_1_reg_1005(31 downto 0),
      DSP_A_B_DATA_INST_0(0) => ap_CS_fsm_state19,
      DSP_A_B_DATA_INST_1(31 downto 0) => C_load_reg_1000(31 downto 0),
      Q(31 downto 0) => reg_387(31 downto 0),
      orig_q0(31 downto 0) => \^orig_q0\(31 downto 0),
      orig_q1(31 downto 0) => orig_q1(31 downto 0),
      \tmp_product__1_i_16_0\(31 downto 0) => orig_load_8_reg_1085(31 downto 0),
      \tmp_product__1_i_32_0\(31 downto 0) => add_ln48_reg_1115(31 downto 0)
    );
\mul_ln48_1_reg_1120_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_37,
      Q => mul_ln48_1_reg_1120(0),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_27,
      Q => mul_ln48_1_reg_1120(10),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_26,
      Q => mul_ln48_1_reg_1120(11),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_25,
      Q => mul_ln48_1_reg_1120(12),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_24,
      Q => mul_ln48_1_reg_1120(13),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_23,
      Q => mul_ln48_1_reg_1120(14),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_22,
      Q => mul_ln48_1_reg_1120(15),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(16),
      Q => mul_ln48_1_reg_1120(16),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(17),
      Q => mul_ln48_1_reg_1120(17),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(18),
      Q => mul_ln48_1_reg_1120(18),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(19),
      Q => mul_ln48_1_reg_1120(19),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_36,
      Q => mul_ln48_1_reg_1120(1),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(20),
      Q => mul_ln48_1_reg_1120(20),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(21),
      Q => mul_ln48_1_reg_1120(21),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(22),
      Q => mul_ln48_1_reg_1120(22),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(23),
      Q => mul_ln48_1_reg_1120(23),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(24),
      Q => mul_ln48_1_reg_1120(24),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(25),
      Q => mul_ln48_1_reg_1120(25),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(26),
      Q => mul_ln48_1_reg_1120(26),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(27),
      Q => mul_ln48_1_reg_1120(27),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(28),
      Q => mul_ln48_1_reg_1120(28),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(29),
      Q => mul_ln48_1_reg_1120(29),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_35,
      Q => mul_ln48_1_reg_1120(2),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(30),
      Q => mul_ln48_1_reg_1120(30),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => \tmp_product__3\(31),
      Q => mul_ln48_1_reg_1120(31),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_34,
      Q => mul_ln48_1_reg_1120(3),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_33,
      Q => mul_ln48_1_reg_1120(4),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_32,
      Q => mul_ln48_1_reg_1120(5),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_31,
      Q => mul_ln48_1_reg_1120(6),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_30,
      Q => mul_ln48_1_reg_1120(7),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_29,
      Q => mul_ln48_1_reg_1120(8),
      R => '0'
    );
\mul_ln48_1_reg_1120_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state19,
      D => mul_32s_32s_32_1_1_U1_n_28,
      Q => mul_ln48_1_reg_1120(9),
      R => '0'
    );
\mul_ln48_reg_1080_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_37,
      Q => mul_ln48_reg_1080(0),
      R => '0'
    );
\mul_ln48_reg_1080_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_27,
      Q => mul_ln48_reg_1080(10),
      R => '0'
    );
\mul_ln48_reg_1080_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_26,
      Q => mul_ln48_reg_1080(11),
      R => '0'
    );
\mul_ln48_reg_1080_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_25,
      Q => mul_ln48_reg_1080(12),
      R => '0'
    );
\mul_ln48_reg_1080_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_24,
      Q => mul_ln48_reg_1080(13),
      R => '0'
    );
\mul_ln48_reg_1080_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_23,
      Q => mul_ln48_reg_1080(14),
      R => '0'
    );
\mul_ln48_reg_1080_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_22,
      Q => mul_ln48_reg_1080(15),
      R => '0'
    );
\mul_ln48_reg_1080_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(16),
      Q => mul_ln48_reg_1080(16),
      R => '0'
    );
\mul_ln48_reg_1080_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(17),
      Q => mul_ln48_reg_1080(17),
      R => '0'
    );
\mul_ln48_reg_1080_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(18),
      Q => mul_ln48_reg_1080(18),
      R => '0'
    );
\mul_ln48_reg_1080_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(19),
      Q => mul_ln48_reg_1080(19),
      R => '0'
    );
\mul_ln48_reg_1080_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_36,
      Q => mul_ln48_reg_1080(1),
      R => '0'
    );
\mul_ln48_reg_1080_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(20),
      Q => mul_ln48_reg_1080(20),
      R => '0'
    );
\mul_ln48_reg_1080_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(21),
      Q => mul_ln48_reg_1080(21),
      R => '0'
    );
\mul_ln48_reg_1080_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(22),
      Q => mul_ln48_reg_1080(22),
      R => '0'
    );
\mul_ln48_reg_1080_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(23),
      Q => mul_ln48_reg_1080(23),
      R => '0'
    );
\mul_ln48_reg_1080_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(24),
      Q => mul_ln48_reg_1080(24),
      R => '0'
    );
\mul_ln48_reg_1080_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(25),
      Q => mul_ln48_reg_1080(25),
      R => '0'
    );
\mul_ln48_reg_1080_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(26),
      Q => mul_ln48_reg_1080(26),
      R => '0'
    );
\mul_ln48_reg_1080_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(27),
      Q => mul_ln48_reg_1080(27),
      R => '0'
    );
\mul_ln48_reg_1080_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(28),
      Q => mul_ln48_reg_1080(28),
      R => '0'
    );
\mul_ln48_reg_1080_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(29),
      Q => mul_ln48_reg_1080(29),
      R => '0'
    );
\mul_ln48_reg_1080_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_35,
      Q => mul_ln48_reg_1080(2),
      R => '0'
    );
\mul_ln48_reg_1080_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(30),
      Q => mul_ln48_reg_1080(30),
      R => '0'
    );
\mul_ln48_reg_1080_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => \tmp_product__3\(31),
      Q => mul_ln48_reg_1080(31),
      R => '0'
    );
\mul_ln48_reg_1080_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_34,
      Q => mul_ln48_reg_1080(3),
      R => '0'
    );
\mul_ln48_reg_1080_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_33,
      Q => mul_ln48_reg_1080(4),
      R => '0'
    );
\mul_ln48_reg_1080_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_32,
      Q => mul_ln48_reg_1080(5),
      R => '0'
    );
\mul_ln48_reg_1080_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_31,
      Q => mul_ln48_reg_1080(6),
      R => '0'
    );
\mul_ln48_reg_1080_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_30,
      Q => mul_ln48_reg_1080(7),
      R => '0'
    );
\mul_ln48_reg_1080_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_29,
      Q => mul_ln48_reg_1080(8),
      R => '0'
    );
\mul_ln48_reg_1080_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state16,
      D => mul_32s_32s_32_1_1_U1_n_28,
      Q => mul_ln48_reg_1080(9),
      R => '0'
    );
\orig_address0[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF00FF00FF004F4"
    )
        port map (
      I0 => ap_CS_fsm_state10,
      I1 => \orig_address0[0]_INST_0_i_1_n_6\,
      I2 => ap_CS_fsm_state18,
      I3 => data1(0),
      I4 => ap_CS_fsm_state16,
      I5 => ap_CS_fsm_state17,
      O => orig_address0(0)
    );
\orig_address0[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FB0BF808"
    )
        port map (
      I0 => add_ln18_reg_888(0),
      I1 => ap_CS_fsm_state4,
      I2 => ap_CS_fsm_state7,
      I3 => add_ln_fu_528_p4(0),
      I4 => or_ln_fu_459_p3(0),
      O => \orig_address0[0]_INST_0_i_1_n_6\
    );
\orig_address0[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC8FFC8FFC88888"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => data1(10),
      I2 => ap_CS_fsm_state17,
      I3 => \orig_address0[10]_INST_0_i_1_n_6\,
      I4 => \orig_address0[10]_INST_0_i_2_n_6\,
      I5 => \orig_address0[10]_INST_0_i_3_n_6\,
      O => orig_address0(10)
    );
\orig_address0[10]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0505050100050001"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => ap_CS_fsm_state10,
      I2 => ap_CS_fsm_state17,
      I3 => ap_CS_fsm_state16,
      I4 => shl_ln_fu_582_p4(10),
      I5 => empty_15_reg_1036(7),
      O => \orig_address0[10]_INST_0_i_1_n_6\
    );
\orig_address0[10]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF800000000000"
    )
        port map (
      I0 => add_ln_fu_528_p4(3),
      I1 => empty_14_reg_909(7),
      I2 => empty_14_reg_909(8),
      I3 => empty_14_reg_909(9),
      I4 => empty_14_reg_909(10),
      I5 => ap_CS_fsm_state7,
      O => \orig_address0[10]_INST_0_i_2_n_6\
    );
\orig_address0[10]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFFFEFEFEFEFE"
    )
        port map (
      I0 => ap_CS_fsm_state17,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state10,
      I3 => ap_CS_fsm_state4,
      I4 => ap_CS_fsm_state7,
      I5 => add_ln18_reg_888(7),
      O => \orig_address0[10]_INST_0_i_3_n_6\
    );
\orig_address0[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF00AB01AB01"
    )
        port map (
      I0 => \orig_address0[2]_INST_0_i_2_n_6\,
      I1 => ap_CS_fsm_state10,
      I2 => \orig_address0[1]_INST_0_i_1_n_6\,
      I3 => data1(1),
      I4 => data1(0),
      I5 => ap_CS_fsm_state18,
      O => orig_address0(1)
    );
\orig_address0[1]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0047FF47"
    )
        port map (
      I0 => add_ln18_reg_888(1),
      I1 => ap_CS_fsm_state4,
      I2 => or_ln_fu_459_p3(1),
      I3 => ap_CS_fsm_state7,
      I4 => add_ln_fu_528_p4(1),
      O => \orig_address0[1]_INST_0_i_1_n_6\
    );
\orig_address0[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F708F808F80"
    )
        port map (
      I0 => data1(0),
      I1 => data1(1),
      I2 => ap_CS_fsm_state18,
      I3 => \orig_address0[2]_INST_0_i_1_n_6\,
      I4 => \orig_address0[2]_INST_0_i_2_n_6\,
      I5 => data1(2),
      O => orig_address0(2)
    );
\orig_address0[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545404545404040"
    )
        port map (
      I0 => \orig_address0[6]_INST_0_i_3_n_6\,
      I1 => add_ln_fu_528_p4(2),
      I2 => ap_CS_fsm_state7,
      I3 => ap_CS_fsm_state4,
      I4 => add_ln18_reg_888(2),
      I5 => or_ln_fu_459_p3(2),
      O => \orig_address0[2]_INST_0_i_1_n_6\
    );
\orig_address0[2]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ap_CS_fsm_state17,
      I1 => ap_CS_fsm_state16,
      O => \orig_address0[2]_INST_0_i_2_n_6\
    );
\orig_address0[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEE0EEEEE0E0E0E0"
    )
        port map (
      I0 => \orig_address0[3]_INST_0_i_1_n_6\,
      I1 => \orig_address0[3]_INST_0_i_2_n_6\,
      I2 => \orig_address0[3]_INST_0_i_3_n_6\,
      I3 => data3(3),
      I4 => ap_CS_fsm_state10,
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => orig_address0(3)
    );
\orig_address0[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00AC00AC00AC"
    )
        port map (
      I0 => add_ln18_reg_888(3),
      I1 => data6(3),
      I2 => ap_CS_fsm_state4,
      I3 => ap_CS_fsm_state7,
      I4 => ap_CS_fsm_state18,
      I5 => tmp2_cast_fu_669_p1(0),
      O => \orig_address0[3]_INST_0_i_1_n_6\
    );
\orig_address0[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFEFE"
    )
        port map (
      I0 => ap_CS_fsm_state17,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state10,
      I3 => add_ln_fu_528_p4(3),
      I4 => ap_CS_fsm_state7,
      O => \orig_address0[3]_INST_0_i_2_n_6\
    );
\orig_address0[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBB8888B888B888"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(0),
      I1 => ap_CS_fsm_state18,
      I2 => ap_CS_fsm_state16,
      I3 => empty_15_reg_1036(0),
      I4 => data1(3),
      I5 => ap_CS_fsm_state17,
      O => \orig_address0[3]_INST_0_i_3_n_6\
    );
\orig_address0[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(1),
      I1 => ap_CS_fsm_state18,
      I2 => \orig_address0[4]_INST_0_i_1_n_6\,
      I3 => \orig_address0[4]_INST_0_i_2_n_6\,
      O => orig_address0(4)
    );
\orig_address0[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3350335F33503350"
    )
        port map (
      I0 => empty_15_reg_1036(1),
      I1 => data1(4),
      I2 => ap_CS_fsm_state16,
      I3 => ap_CS_fsm_state17,
      I4 => data3(4),
      I5 => ap_CS_fsm_state10,
      O => \orig_address0[4]_INST_0_i_1_n_6\
    );
\orig_address0[4]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C05FFFFFCF5"
    )
        port map (
      I0 => \orig_address0[4]_INST_0_i_3_n_6\,
      I1 => add_ln18_reg_888(4),
      I2 => ap_CS_fsm_state7,
      I3 => ap_CS_fsm_state4,
      I4 => \orig_address0[6]_INST_0_i_3_n_6\,
      I5 => add_ln_fu_528_p4(3),
      O => \orig_address0[4]_INST_0_i_2_n_6\
    );
\orig_address0[4]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => tmp_1_reg_853(4),
      I1 => tmp_1_reg_853(3),
      I2 => or_ln_fu_459_p3(3),
      O => \orig_address0[4]_INST_0_i_3_n_6\
    );
\orig_address0[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(2),
      I1 => ap_CS_fsm_state18,
      I2 => \orig_address0[5]_INST_0_i_1_n_6\,
      I3 => \orig_address0[5]_INST_0_i_2_n_6\,
      O => orig_address0(5)
    );
\orig_address0[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"330533F5330033F0"
    )
        port map (
      I0 => data3(5),
      I1 => data1(5),
      I2 => ap_CS_fsm_state16,
      I3 => ap_CS_fsm_state17,
      I4 => empty_15_reg_1036(2),
      I5 => ap_CS_fsm_state10,
      O => \orig_address0[5]_INST_0_i_1_n_6\
    );
\orig_address0[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0C05FFFFFCF5"
    )
        port map (
      I0 => \orig_address0[5]_INST_0_i_3_n_6\,
      I1 => add_ln18_reg_888(5),
      I2 => ap_CS_fsm_state7,
      I3 => ap_CS_fsm_state4,
      I4 => \orig_address0[6]_INST_0_i_3_n_6\,
      I5 => add_ln_fu_528_p4(3),
      O => \orig_address0[5]_INST_0_i_2_n_6\
    );
\orig_address0[5]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9555"
    )
        port map (
      I0 => tmp_1_reg_853(5),
      I1 => or_ln_fu_459_p3(3),
      I2 => tmp_1_reg_853(3),
      I3 => tmp_1_reg_853(4),
      O => \orig_address0[5]_INST_0_i_3_n_6\
    );
\orig_address0[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(3),
      I1 => ap_CS_fsm_state18,
      I2 => \orig_address0[6]_INST_0_i_1_n_6\,
      I3 => \orig_address0[6]_INST_0_i_2_n_6\,
      O => orig_address0(6)
    );
\orig_address0[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333355550F00"
    )
        port map (
      I0 => empty_15_reg_1036(3),
      I1 => data1(6),
      I2 => data3(6),
      I3 => ap_CS_fsm_state10,
      I4 => ap_CS_fsm_state16,
      I5 => ap_CS_fsm_state17,
      O => \orig_address0[6]_INST_0_i_1_n_6\
    );
\orig_address0[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFFFCFCCCFEECFEE"
    )
        port map (
      I0 => data6(6),
      I1 => \orig_address0[6]_INST_0_i_3_n_6\,
      I2 => add_ln_fu_528_p4(3),
      I3 => ap_CS_fsm_state7,
      I4 => add_ln18_reg_888(6),
      I5 => ap_CS_fsm_state4,
      O => \orig_address0[6]_INST_0_i_2_n_6\
    );
\orig_address0[6]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => ap_CS_fsm_state10,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state17,
      O => \orig_address0[6]_INST_0_i_3_n_6\
    );
\orig_address0[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA8808"
    )
        port map (
      I0 => \orig_address0[7]_INST_0_i_1_n_6\,
      I1 => \orig_address0[7]_INST_0_i_2_n_6\,
      I2 => ap_CS_fsm_state10,
      I3 => shl_ln_fu_582_p4(7),
      I4 => \orig_address0[7]_INST_0_i_3_n_6\,
      O => orig_address0(7)
    );
\orig_address0[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF282828"
    )
        port map (
      I0 => ap_CS_fsm_state7,
      I1 => add_ln_fu_528_p4(3),
      I2 => empty_14_reg_909(7),
      I3 => ap_CS_fsm_state18,
      I4 => data1(7),
      I5 => \orig_address0[10]_INST_0_i_3_n_6\,
      O => \orig_address0[7]_INST_0_i_1_n_6\
    );
\orig_address0[7]_INST_0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state17,
      O => \orig_address0[7]_INST_0_i_2_n_6\
    );
\orig_address0[7]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABA8A8A8"
    )
        port map (
      I0 => data1(7),
      I1 => ap_CS_fsm_state17,
      I2 => ap_CS_fsm_state18,
      I3 => ap_CS_fsm_state16,
      I4 => empty_15_reg_1036(4),
      O => \orig_address0[7]_INST_0_i_3_n_6\
    );
\orig_address0[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBBB88B8"
    )
        port map (
      I0 => data1(8),
      I1 => ap_CS_fsm_state18,
      I2 => ap_CS_fsm_state7,
      I3 => \orig_address0[8]_INST_0_i_1_n_6\,
      I4 => \orig_address0[10]_INST_0_i_3_n_6\,
      I5 => \orig_address0[8]_INST_0_i_2_n_6\,
      O => orig_address0(8)
    );
\orig_address0[8]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => empty_14_reg_909(8),
      I1 => empty_14_reg_909(7),
      I2 => add_ln_fu_528_p4(3),
      O => \orig_address0[8]_INST_0_i_1_n_6\
    );
\orig_address0[8]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505350505C5F5C5C"
    )
        port map (
      I0 => data1(8),
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state17,
      I3 => shl_ln_fu_582_p4(8),
      I4 => ap_CS_fsm_state10,
      I5 => empty_15_reg_1036(5),
      O => \orig_address0[8]_INST_0_i_2_n_6\
    );
\orig_address0[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC8FFC8FFC88888"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => data1(9),
      I2 => ap_CS_fsm_state17,
      I3 => \orig_address0[9]_INST_0_i_1_n_6\,
      I4 => \orig_address0[10]_INST_0_i_3_n_6\,
      I5 => \orig_address0[9]_INST_0_i_2_n_6\,
      O => orig_address0(9)
    );
\orig_address0[9]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0504050501000101"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state17,
      I3 => shl_ln_fu_582_p4(9),
      I4 => ap_CS_fsm_state10,
      I5 => empty_15_reg_1036(6),
      O => \orig_address0[9]_INST_0_i_1_n_6\
    );
\orig_address0[9]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => ap_CS_fsm_state7,
      I1 => empty_14_reg_909(8),
      I2 => empty_14_reg_909(7),
      I3 => add_ln_fu_528_p4(3),
      I4 => empty_14_reg_909(9),
      O => \orig_address0[9]_INST_0_i_2_n_6\
    );
\orig_address1[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCFCFC066666666"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => data1(0),
      I2 => ap_CS_fsm_state15,
      I3 => ap_CS_fsm_state10,
      I4 => add_ln_fu_528_p4(0),
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => orig_address1(0)
    );
\orig_address1[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEAAAAAAAEA"
    )
        port map (
      I0 => \orig_address1[10]_INST_0_i_1_n_6\,
      I1 => empty_16_reg_1041(7),
      I2 => ap_CS_fsm_state16,
      I3 => ap_CS_fsm_state18,
      I4 => ap_CS_fsm_state17,
      I5 => data1(10),
      O => orig_address1(10)
    );
\orig_address1[10]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B8B800000000"
    )
        port map (
      I0 => shl_ln_fu_582_p4(10),
      I1 => ap_CS_fsm_state10,
      I2 => add_ln_fu_528_p4(10),
      I3 => data1(10),
      I4 => ap_CS_fsm_state15,
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => \orig_address1[10]_INST_0_i_1_n_6\
    );
\orig_address1[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99CC99CC99CC990F"
    )
        port map (
      I0 => data1(0),
      I1 => data1(1),
      I2 => \orig_address1[1]_INST_0_i_1_n_6\,
      I3 => ap_CS_fsm_state18,
      I4 => ap_CS_fsm_state16,
      I5 => ap_CS_fsm_state17,
      O => orig_address1(1)
    );
\orig_address1[1]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4447"
    )
        port map (
      I0 => data1(1),
      I1 => ap_CS_fsm_state15,
      I2 => ap_CS_fsm_state10,
      I3 => add_ln_fu_528_p4(1),
      O => \orig_address1[1]_INST_0_i_1_n_6\
    );
\orig_address1[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8FFFFBBB80000"
    )
        port map (
      I0 => data1(2),
      I1 => ap_CS_fsm_state15,
      I2 => ap_CS_fsm_state10,
      I3 => add_ln_fu_528_p4(2),
      I4 => \orig_address0[7]_INST_0_i_2_n_6\,
      I5 => \orig_address1[2]_INST_0_i_1_n_6\,
      O => orig_address1(2)
    );
\orig_address1[2]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA9A"
    )
        port map (
      I0 => data1(2),
      I1 => data1(0),
      I2 => ap_CS_fsm_state18,
      I3 => data1(1),
      O => \orig_address1[2]_INST_0_i_1_n_6\
    );
\orig_address1[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEBAAAAAAAAA"
    )
        port map (
      I0 => \orig_address0[3]_INST_0_i_3_n_6\,
      I1 => ap_CS_fsm_state10,
      I2 => add_ln_fu_528_p4(3),
      I3 => data3(3),
      I4 => ap_CS_fsm_state15,
      I5 => \orig_address1[3]_INST_0_i_1_n_6\,
      O => orig_address1(3)
    );
\orig_address1[3]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000101"
    )
        port map (
      I0 => ap_CS_fsm_state17,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state18,
      I3 => tmp2_cast_fu_669_p1(0),
      I4 => ap_CS_fsm_state15,
      O => \orig_address1[3]_INST_0_i_1_n_6\
    );
\orig_address1[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000F088"
    )
        port map (
      I0 => empty_15_reg_1036(1),
      I1 => ap_CS_fsm_state16,
      I2 => tmp3_reg_1052(1),
      I3 => ap_CS_fsm_state17,
      I4 => ap_CS_fsm_state18,
      I5 => \orig_address1[4]_INST_0_i_1_n_6\,
      O => orig_address1(4)
    );
\orig_address1[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0E0E0E0ECA0A0A0"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => \orig_address0[7]_INST_0_i_2_n_6\,
      I2 => tmp2_cast_fu_669_p1(1),
      I3 => ap_CS_fsm_state10,
      I4 => data3(4),
      I5 => ap_CS_fsm_state15,
      O => \orig_address1[4]_INST_0_i_1_n_6\
    );
\orig_address1[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000F088"
    )
        port map (
      I0 => empty_15_reg_1036(2),
      I1 => ap_CS_fsm_state16,
      I2 => tmp3_reg_1052(2),
      I3 => ap_CS_fsm_state17,
      I4 => ap_CS_fsm_state18,
      I5 => \orig_address1[5]_INST_0_i_1_n_6\,
      O => orig_address1(5)
    );
\orig_address1[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFC8C8C888888888"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => tmp2_cast_fu_669_p1(2),
      I2 => ap_CS_fsm_state15,
      I3 => ap_CS_fsm_state10,
      I4 => data3(5),
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => \orig_address1[5]_INST_0_i_1_n_6\
    );
\orig_address1[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000F088"
    )
        port map (
      I0 => empty_15_reg_1036(3),
      I1 => ap_CS_fsm_state16,
      I2 => tmp3_reg_1052(3),
      I3 => ap_CS_fsm_state17,
      I4 => ap_CS_fsm_state18,
      I5 => \orig_address1[6]_INST_0_i_1_n_6\,
      O => orig_address1(6)
    );
\orig_address1[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFC8C8C888888888"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => tmp2_cast_fu_669_p1(3),
      I2 => ap_CS_fsm_state15,
      I3 => ap_CS_fsm_state10,
      I4 => data3(6),
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => \orig_address1[6]_INST_0_i_1_n_6\
    );
\orig_address1[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF80008"
    )
        port map (
      I0 => empty_15_reg_1036(4),
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state18,
      I3 => ap_CS_fsm_state17,
      I4 => data1(7),
      I5 => \orig_address1[7]_INST_0_i_1_n_6\,
      O => orig_address1(7)
    );
\orig_address1[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8C8C8C8080808C80"
    )
        port map (
      I0 => data1(7),
      I1 => \orig_address0[7]_INST_0_i_2_n_6\,
      I2 => ap_CS_fsm_state15,
      I3 => add_ln_fu_528_p4(7),
      I4 => ap_CS_fsm_state10,
      I5 => shl_ln_fu_582_p4(7),
      O => \orig_address1[7]_INST_0_i_1_n_6\
    );
\orig_address1[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEAAAAAAAEA"
    )
        port map (
      I0 => \orig_address1[8]_INST_0_i_1_n_6\,
      I1 => empty_16_reg_1041(5),
      I2 => ap_CS_fsm_state16,
      I3 => ap_CS_fsm_state18,
      I4 => ap_CS_fsm_state17,
      I5 => data1(8),
      O => orig_address1(8)
    );
\orig_address1[8]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B8B800000000"
    )
        port map (
      I0 => shl_ln_fu_582_p4(8),
      I1 => ap_CS_fsm_state10,
      I2 => add_ln_fu_528_p4(8),
      I3 => data1(8),
      I4 => ap_CS_fsm_state15,
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => \orig_address1[8]_INST_0_i_1_n_6\
    );
\orig_address1[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEAAAAAAAEA"
    )
        port map (
      I0 => \orig_address1[9]_INST_0_i_1_n_6\,
      I1 => empty_16_reg_1041(6),
      I2 => ap_CS_fsm_state16,
      I3 => ap_CS_fsm_state18,
      I4 => ap_CS_fsm_state17,
      I5 => data1(9),
      O => orig_address1(9)
    );
\orig_address1[9]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B8B800000000"
    )
        port map (
      I0 => shl_ln_fu_582_p4(9),
      I1 => ap_CS_fsm_state10,
      I2 => add_ln_fu_528_p4(9),
      I3 => data1(9),
      I4 => ap_CS_fsm_state15,
      I5 => \orig_address0[7]_INST_0_i_2_n_6\,
      O => \orig_address1[9]_INST_0_i_1_n_6\
    );
orig_ce0_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ap_CS_fsm_state10,
      I1 => \orig_address0[2]_INST_0_i_2_n_6\,
      I2 => ap_CS_fsm_state18,
      I3 => ap_CS_fsm_state7,
      I4 => ap_CS_fsm_state4,
      I5 => ap_CS_fsm_state3,
      O => orig_ce0
    );
orig_ce1_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ap_CS_fsm_state10,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state17,
      I3 => ap_CS_fsm_state18,
      I4 => ap_CS_fsm_state15,
      I5 => ap_CS_fsm_state7,
      O => orig_ce1
    );
\orig_load_8_reg_1085_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(0),
      Q => orig_load_8_reg_1085(0),
      R => '0'
    );
\orig_load_8_reg_1085_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(10),
      Q => orig_load_8_reg_1085(10),
      R => '0'
    );
\orig_load_8_reg_1085_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(11),
      Q => orig_load_8_reg_1085(11),
      R => '0'
    );
\orig_load_8_reg_1085_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(12),
      Q => orig_load_8_reg_1085(12),
      R => '0'
    );
\orig_load_8_reg_1085_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(13),
      Q => orig_load_8_reg_1085(13),
      R => '0'
    );
\orig_load_8_reg_1085_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(14),
      Q => orig_load_8_reg_1085(14),
      R => '0'
    );
\orig_load_8_reg_1085_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(15),
      Q => orig_load_8_reg_1085(15),
      R => '0'
    );
\orig_load_8_reg_1085_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(16),
      Q => orig_load_8_reg_1085(16),
      R => '0'
    );
\orig_load_8_reg_1085_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(17),
      Q => orig_load_8_reg_1085(17),
      R => '0'
    );
\orig_load_8_reg_1085_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(18),
      Q => orig_load_8_reg_1085(18),
      R => '0'
    );
\orig_load_8_reg_1085_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(19),
      Q => orig_load_8_reg_1085(19),
      R => '0'
    );
\orig_load_8_reg_1085_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(1),
      Q => orig_load_8_reg_1085(1),
      R => '0'
    );
\orig_load_8_reg_1085_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(20),
      Q => orig_load_8_reg_1085(20),
      R => '0'
    );
\orig_load_8_reg_1085_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(21),
      Q => orig_load_8_reg_1085(21),
      R => '0'
    );
\orig_load_8_reg_1085_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(22),
      Q => orig_load_8_reg_1085(22),
      R => '0'
    );
\orig_load_8_reg_1085_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(23),
      Q => orig_load_8_reg_1085(23),
      R => '0'
    );
\orig_load_8_reg_1085_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(24),
      Q => orig_load_8_reg_1085(24),
      R => '0'
    );
\orig_load_8_reg_1085_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(25),
      Q => orig_load_8_reg_1085(25),
      R => '0'
    );
\orig_load_8_reg_1085_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(26),
      Q => orig_load_8_reg_1085(26),
      R => '0'
    );
\orig_load_8_reg_1085_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(27),
      Q => orig_load_8_reg_1085(27),
      R => '0'
    );
\orig_load_8_reg_1085_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(28),
      Q => orig_load_8_reg_1085(28),
      R => '0'
    );
\orig_load_8_reg_1085_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(29),
      Q => orig_load_8_reg_1085(29),
      R => '0'
    );
\orig_load_8_reg_1085_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(2),
      Q => orig_load_8_reg_1085(2),
      R => '0'
    );
\orig_load_8_reg_1085_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(30),
      Q => orig_load_8_reg_1085(30),
      R => '0'
    );
\orig_load_8_reg_1085_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(31),
      Q => orig_load_8_reg_1085(31),
      R => '0'
    );
\orig_load_8_reg_1085_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(3),
      Q => orig_load_8_reg_1085(3),
      R => '0'
    );
\orig_load_8_reg_1085_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(4),
      Q => orig_load_8_reg_1085(4),
      R => '0'
    );
\orig_load_8_reg_1085_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(5),
      Q => orig_load_8_reg_1085(5),
      R => '0'
    );
\orig_load_8_reg_1085_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(6),
      Q => orig_load_8_reg_1085(6),
      R => '0'
    );
\orig_load_8_reg_1085_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(7),
      Q => orig_load_8_reg_1085(7),
      R => '0'
    );
\orig_load_8_reg_1085_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(8),
      Q => orig_load_8_reg_1085(8),
      R => '0'
    );
\orig_load_8_reg_1085_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state17,
      D => orig_q1(9),
      Q => orig_load_8_reg_1085(9),
      R => '0'
    );
\reg_387[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(0),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(0),
      O => p_1_in(0)
    );
\reg_387[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(10),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(10),
      O => p_1_in(10)
    );
\reg_387[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(11),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(11),
      O => p_1_in(11)
    );
\reg_387[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(12),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(12),
      O => p_1_in(12)
    );
\reg_387[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(13),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(13),
      O => p_1_in(13)
    );
\reg_387[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(14),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(14),
      O => p_1_in(14)
    );
\reg_387[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(15),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(15),
      O => p_1_in(15)
    );
\reg_387[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(16),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(16),
      O => p_1_in(16)
    );
\reg_387[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(17),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(17),
      O => p_1_in(17)
    );
\reg_387[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(18),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(18),
      O => p_1_in(18)
    );
\reg_387[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(19),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(19),
      O => p_1_in(19)
    );
\reg_387[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(1),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(1),
      O => p_1_in(1)
    );
\reg_387[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(20),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(20),
      O => p_1_in(20)
    );
\reg_387[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(21),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(21),
      O => p_1_in(21)
    );
\reg_387[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(22),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(22),
      O => p_1_in(22)
    );
\reg_387[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(23),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(23),
      O => p_1_in(23)
    );
\reg_387[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(24),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(24),
      O => p_1_in(24)
    );
\reg_387[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(25),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(25),
      O => p_1_in(25)
    );
\reg_387[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(26),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(26),
      O => p_1_in(26)
    );
\reg_387[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(27),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(27),
      O => p_1_in(27)
    );
\reg_387[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(28),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(28),
      O => p_1_in(28)
    );
\reg_387[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(29),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(29),
      O => p_1_in(29)
    );
\reg_387[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(2),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(2),
      O => p_1_in(2)
    );
\reg_387[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(30),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(30),
      O => p_1_in(30)
    );
\reg_387[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ap_CS_fsm_state17,
      I1 => ap_CS_fsm_state18,
      O => \reg_387[31]_i_1_n_6\
    );
\reg_387[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(31),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(31),
      O => p_1_in(31)
    );
\reg_387[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(3),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(3),
      O => p_1_in(3)
    );
\reg_387[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(4),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(4),
      O => p_1_in(4)
    );
\reg_387[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(5),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(5),
      O => p_1_in(5)
    );
\reg_387[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(6),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(6),
      O => p_1_in(6)
    );
\reg_387[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(7),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(7),
      O => p_1_in(7)
    );
\reg_387[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(8),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(8),
      O => p_1_in(8)
    );
\reg_387[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => orig_q1(9),
      I1 => ap_CS_fsm_state18,
      I2 => \^orig_q0\(9),
      O => p_1_in(9)
    );
\reg_387_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(0),
      Q => reg_387(0),
      R => '0'
    );
\reg_387_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(10),
      Q => reg_387(10),
      R => '0'
    );
\reg_387_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(11),
      Q => reg_387(11),
      R => '0'
    );
\reg_387_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(12),
      Q => reg_387(12),
      R => '0'
    );
\reg_387_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(13),
      Q => reg_387(13),
      R => '0'
    );
\reg_387_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(14),
      Q => reg_387(14),
      R => '0'
    );
\reg_387_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(15),
      Q => reg_387(15),
      R => '0'
    );
\reg_387_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(16),
      Q => reg_387(16),
      R => '0'
    );
\reg_387_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(17),
      Q => reg_387(17),
      R => '0'
    );
\reg_387_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(18),
      Q => reg_387(18),
      R => '0'
    );
\reg_387_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(19),
      Q => reg_387(19),
      R => '0'
    );
\reg_387_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(1),
      Q => reg_387(1),
      R => '0'
    );
\reg_387_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(20),
      Q => reg_387(20),
      R => '0'
    );
\reg_387_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(21),
      Q => reg_387(21),
      R => '0'
    );
\reg_387_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(22),
      Q => reg_387(22),
      R => '0'
    );
\reg_387_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(23),
      Q => reg_387(23),
      R => '0'
    );
\reg_387_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(24),
      Q => reg_387(24),
      R => '0'
    );
\reg_387_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(25),
      Q => reg_387(25),
      R => '0'
    );
\reg_387_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(26),
      Q => reg_387(26),
      R => '0'
    );
\reg_387_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(27),
      Q => reg_387(27),
      R => '0'
    );
\reg_387_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(28),
      Q => reg_387(28),
      R => '0'
    );
\reg_387_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(29),
      Q => reg_387(29),
      R => '0'
    );
\reg_387_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(2),
      Q => reg_387(2),
      R => '0'
    );
\reg_387_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(30),
      Q => reg_387(30),
      R => '0'
    );
\reg_387_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(31),
      Q => reg_387(31),
      R => '0'
    );
\reg_387_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(3),
      Q => reg_387(3),
      R => '0'
    );
\reg_387_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(4),
      Q => reg_387(4),
      R => '0'
    );
\reg_387_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(5),
      Q => reg_387(5),
      R => '0'
    );
\reg_387_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(6),
      Q => reg_387(6),
      R => '0'
    );
\reg_387_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(7),
      Q => reg_387(7),
      R => '0'
    );
\reg_387_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(8),
      Q => reg_387(8),
      R => '0'
    );
\reg_387_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \reg_387[31]_i_1_n_6\,
      D => p_1_in(9),
      Q => reg_387(9),
      R => '0'
    );
\sol_address0[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAACFC0"
    )
        port map (
      I0 => zext_ln24_reg_939_reg(0),
      I1 => zext_ln18_reg_893_reg(0),
      I2 => ap_CS_fsm_state5,
      I3 => add_ln18_reg_888(0),
      I4 => ap_CS_fsm_state8,
      I5 => ap_CS_fsm_state11,
      O => sol_address0(0)
    );
\sol_address0[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0880000F088"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => zext_ln18_reg_893_reg(7),
      I2 => zext_ln24_reg_939_reg(10),
      I3 => ap_CS_fsm_state8,
      I4 => ap_CS_fsm_state11,
      I5 => zext_ln30_reg_985_reg(7),
      O => sol_address0(10)
    );
\sol_address0[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAACFC0"
    )
        port map (
      I0 => zext_ln24_reg_939_reg(1),
      I1 => zext_ln18_reg_893_reg(1),
      I2 => ap_CS_fsm_state5,
      I3 => add_ln18_reg_888(1),
      I4 => ap_CS_fsm_state8,
      I5 => ap_CS_fsm_state11,
      O => sol_address0(1)
    );
\sol_address0[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAACFC0"
    )
        port map (
      I0 => zext_ln24_reg_939_reg(2),
      I1 => zext_ln18_reg_893_reg(2),
      I2 => ap_CS_fsm_state5,
      I3 => add_ln18_reg_888(2),
      I4 => ap_CS_fsm_state8,
      I5 => ap_CS_fsm_state11,
      O => sol_address0(2)
    );
\sol_address0[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBEAEAEA"
    )
        port map (
      I0 => \sol_address0[3]_INST_0_i_1_n_6\,
      I1 => ap_CS_fsm_state11,
      I2 => zext_ln30_reg_985_reg(0),
      I3 => zext_ln24_reg_939_reg(6),
      I4 => ap_CS_fsm_state8,
      O => sol_address0(3)
    );
\sol_address0[3]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11100010"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => ap_CS_fsm_state8,
      I2 => zext_ln17_reg_878_reg(3),
      I3 => ap_CS_fsm_state5,
      I4 => zext_ln18_reg_893_reg(3),
      O => \sol_address0[3]_INST_0_i_1_n_6\
    );
\sol_address0[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFB800"
    )
        port map (
      I0 => zext_ln18_reg_893_reg(4),
      I1 => ap_CS_fsm_state5,
      I2 => zext_ln17_reg_878_reg(4),
      I3 => \sol_address0[6]_INST_0_i_1_n_6\,
      I4 => \sol_address0[4]_INST_0_i_1_n_6\,
      I5 => \sol_address0[6]_INST_0_i_2_n_6\,
      O => sol_address0(4)
    );
\sol_address0[4]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => zext_ln30_reg_985_reg(1),
      O => \sol_address0[4]_INST_0_i_1_n_6\
    );
\sol_address0[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFB800"
    )
        port map (
      I0 => zext_ln18_reg_893_reg(5),
      I1 => ap_CS_fsm_state5,
      I2 => zext_ln17_reg_878_reg(5),
      I3 => \sol_address0[6]_INST_0_i_1_n_6\,
      I4 => \sol_address0[5]_INST_0_i_1_n_6\,
      I5 => \sol_address0[6]_INST_0_i_2_n_6\,
      O => sol_address0(5)
    );
\sol_address0[5]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => zext_ln30_reg_985_reg(2),
      O => \sol_address0[5]_INST_0_i_1_n_6\
    );
\sol_address0[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFB800"
    )
        port map (
      I0 => zext_ln18_reg_893_reg(6),
      I1 => ap_CS_fsm_state5,
      I2 => zext_ln17_reg_878_reg(6),
      I3 => \sol_address0[6]_INST_0_i_1_n_6\,
      I4 => \sol_address0[6]_INST_0_i_2_n_6\,
      I5 => \sol_address0[6]_INST_0_i_3_n_6\,
      O => sol_address0(6)
    );
\sol_address0[6]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_CS_fsm_state8,
      I1 => ap_CS_fsm_state11,
      O => \sol_address0[6]_INST_0_i_1_n_6\
    );
\sol_address0[6]_INST_0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => zext_ln24_reg_939_reg(6),
      I1 => ap_CS_fsm_state8,
      I2 => ap_CS_fsm_state11,
      O => \sol_address0[6]_INST_0_i_2_n_6\
    );
\sol_address0[6]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => zext_ln30_reg_985_reg(3),
      O => \sol_address0[6]_INST_0_i_3_n_6\
    );
\sol_address0[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0880000F088"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => zext_ln18_reg_893_reg(7),
      I2 => zext_ln24_reg_939_reg(7),
      I3 => ap_CS_fsm_state8,
      I4 => ap_CS_fsm_state11,
      I5 => zext_ln30_reg_985_reg(4),
      O => sol_address0(7)
    );
\sol_address0[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0880000F088"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => zext_ln18_reg_893_reg(7),
      I2 => zext_ln24_reg_939_reg(8),
      I3 => ap_CS_fsm_state8,
      I4 => ap_CS_fsm_state11,
      I5 => zext_ln30_reg_985_reg(5),
      O => sol_address0(8)
    );
\sol_address0[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0880000F088"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => zext_ln18_reg_893_reg(7),
      I2 => zext_ln24_reg_939_reg(9),
      I3 => ap_CS_fsm_state8,
      I4 => ap_CS_fsm_state11,
      I5 => zext_ln30_reg_985_reg(6),
      O => sol_address0(9)
    );
\sol_address1[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBB8"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(0),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln24_reg_939_reg(0),
      O => sol_address1(0)
    );
\sol_address1[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(10),
      I1 => ap_CS_fsm_state20,
      I2 => zext_ln30_reg_985_reg(7),
      I3 => ap_CS_fsm_state11,
      I4 => zext_ln23_reg_929(10),
      O => sol_address1(10)
    );
\sol_address1[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBB8"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(1),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln24_reg_939_reg(1),
      O => sol_address1(1)
    );
\sol_address1[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBB8"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(2),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln24_reg_939_reg(2),
      O => sol_address1(2)
    );
\sol_address1[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(3),
      I1 => ap_CS_fsm_state20,
      I2 => zext_ln30_reg_985_reg(0),
      I3 => ap_CS_fsm_state11,
      I4 => zext_ln23_reg_929(3),
      O => sol_address1(3)
    );
\sol_address1[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(4),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln30_reg_985_reg(1),
      O => sol_address1(4)
    );
\sol_address1[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(5),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln30_reg_985_reg(2),
      O => sol_address1(5)
    );
\sol_address1[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(6),
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state11,
      I3 => zext_ln30_reg_985_reg(3),
      O => sol_address1(6)
    );
\sol_address1[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(7),
      I1 => ap_CS_fsm_state20,
      I2 => zext_ln30_reg_985_reg(4),
      I3 => ap_CS_fsm_state11,
      I4 => zext_ln23_reg_929(7),
      O => sol_address1(7)
    );
\sol_address1[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(8),
      I1 => ap_CS_fsm_state20,
      I2 => zext_ln30_reg_985_reg(5),
      I3 => ap_CS_fsm_state11,
      I4 => zext_ln23_reg_929(8),
      O => sol_address1(8)
    );
\sol_address1[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => zext_ln39_reg_1060_reg(9),
      I1 => ap_CS_fsm_state20,
      I2 => zext_ln30_reg_985_reg(6),
      I3 => ap_CS_fsm_state11,
      I4 => zext_ln23_reg_929(9),
      O => sol_address1(9)
    );
\sol_d1[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(0),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(0),
      O => sol_d1(0)
    );
\sol_d1[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(10),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(10),
      O => sol_d1(10)
    );
\sol_d1[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(11),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(11),
      O => sol_d1(11)
    );
\sol_d1[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(12),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(12),
      O => sol_d1(12)
    );
\sol_d1[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(13),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(13),
      O => sol_d1(13)
    );
\sol_d1[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(14),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(14),
      O => sol_d1(14)
    );
\sol_d1[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(15),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(15),
      O => sol_d1(15)
    );
\sol_d1[15]_INST_0_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sol_d1[7]_INST_0_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \sol_d1[15]_INST_0_i_1_n_6\,
      CO(6) => \sol_d1[15]_INST_0_i_1_n_7\,
      CO(5) => \sol_d1[15]_INST_0_i_1_n_8\,
      CO(4) => \sol_d1[15]_INST_0_i_1_n_9\,
      CO(3) => \sol_d1[15]_INST_0_i_1_n_10\,
      CO(2) => \sol_d1[15]_INST_0_i_1_n_11\,
      CO(1) => \sol_d1[15]_INST_0_i_1_n_12\,
      CO(0) => \sol_d1[15]_INST_0_i_1_n_13\,
      DI(7 downto 0) => mul_ln48_1_reg_1120(15 downto 8),
      O(7 downto 0) => add_ln48_5_fu_833_p2(15 downto 8),
      S(7) => \sol_d1[15]_INST_0_i_2_n_6\,
      S(6) => \sol_d1[15]_INST_0_i_3_n_6\,
      S(5) => \sol_d1[15]_INST_0_i_4_n_6\,
      S(4) => \sol_d1[15]_INST_0_i_5_n_6\,
      S(3) => \sol_d1[15]_INST_0_i_6_n_6\,
      S(2) => \sol_d1[15]_INST_0_i_7_n_6\,
      S(1) => \sol_d1[15]_INST_0_i_8_n_6\,
      S(0) => \sol_d1[15]_INST_0_i_9_n_6\
    );
\sol_d1[15]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(15),
      I1 => mul_ln48_reg_1080(15),
      O => \sol_d1[15]_INST_0_i_2_n_6\
    );
\sol_d1[15]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(14),
      I1 => mul_ln48_reg_1080(14),
      O => \sol_d1[15]_INST_0_i_3_n_6\
    );
\sol_d1[15]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(13),
      I1 => mul_ln48_reg_1080(13),
      O => \sol_d1[15]_INST_0_i_4_n_6\
    );
\sol_d1[15]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(12),
      I1 => mul_ln48_reg_1080(12),
      O => \sol_d1[15]_INST_0_i_5_n_6\
    );
\sol_d1[15]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(11),
      I1 => mul_ln48_reg_1080(11),
      O => \sol_d1[15]_INST_0_i_6_n_6\
    );
\sol_d1[15]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(10),
      I1 => mul_ln48_reg_1080(10),
      O => \sol_d1[15]_INST_0_i_7_n_6\
    );
\sol_d1[15]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(9),
      I1 => mul_ln48_reg_1080(9),
      O => \sol_d1[15]_INST_0_i_8_n_6\
    );
\sol_d1[15]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(8),
      I1 => mul_ln48_reg_1080(8),
      O => \sol_d1[15]_INST_0_i_9_n_6\
    );
\sol_d1[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(16),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(16),
      O => sol_d1(16)
    );
\sol_d1[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(17),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(17),
      O => sol_d1(17)
    );
\sol_d1[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(18),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(18),
      O => sol_d1(18)
    );
\sol_d1[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(19),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(19),
      O => sol_d1(19)
    );
\sol_d1[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(1),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(1),
      O => sol_d1(1)
    );
\sol_d1[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(20),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(20),
      O => sol_d1(20)
    );
\sol_d1[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(21),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(21),
      O => sol_d1(21)
    );
\sol_d1[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(22),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(22),
      O => sol_d1(22)
    );
\sol_d1[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(23),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(23),
      O => sol_d1(23)
    );
\sol_d1[23]_INST_0_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sol_d1[15]_INST_0_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \sol_d1[23]_INST_0_i_1_n_6\,
      CO(6) => \sol_d1[23]_INST_0_i_1_n_7\,
      CO(5) => \sol_d1[23]_INST_0_i_1_n_8\,
      CO(4) => \sol_d1[23]_INST_0_i_1_n_9\,
      CO(3) => \sol_d1[23]_INST_0_i_1_n_10\,
      CO(2) => \sol_d1[23]_INST_0_i_1_n_11\,
      CO(1) => \sol_d1[23]_INST_0_i_1_n_12\,
      CO(0) => \sol_d1[23]_INST_0_i_1_n_13\,
      DI(7 downto 0) => mul_ln48_1_reg_1120(23 downto 16),
      O(7 downto 0) => add_ln48_5_fu_833_p2(23 downto 16),
      S(7) => \sol_d1[23]_INST_0_i_2_n_6\,
      S(6) => \sol_d1[23]_INST_0_i_3_n_6\,
      S(5) => \sol_d1[23]_INST_0_i_4_n_6\,
      S(4) => \sol_d1[23]_INST_0_i_5_n_6\,
      S(3) => \sol_d1[23]_INST_0_i_6_n_6\,
      S(2) => \sol_d1[23]_INST_0_i_7_n_6\,
      S(1) => \sol_d1[23]_INST_0_i_8_n_6\,
      S(0) => \sol_d1[23]_INST_0_i_9_n_6\
    );
\sol_d1[23]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(23),
      I1 => mul_ln48_reg_1080(23),
      O => \sol_d1[23]_INST_0_i_2_n_6\
    );
\sol_d1[23]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(22),
      I1 => mul_ln48_reg_1080(22),
      O => \sol_d1[23]_INST_0_i_3_n_6\
    );
\sol_d1[23]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(21),
      I1 => mul_ln48_reg_1080(21),
      O => \sol_d1[23]_INST_0_i_4_n_6\
    );
\sol_d1[23]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(20),
      I1 => mul_ln48_reg_1080(20),
      O => \sol_d1[23]_INST_0_i_5_n_6\
    );
\sol_d1[23]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(19),
      I1 => mul_ln48_reg_1080(19),
      O => \sol_d1[23]_INST_0_i_6_n_6\
    );
\sol_d1[23]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(18),
      I1 => mul_ln48_reg_1080(18),
      O => \sol_d1[23]_INST_0_i_7_n_6\
    );
\sol_d1[23]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(17),
      I1 => mul_ln48_reg_1080(17),
      O => \sol_d1[23]_INST_0_i_8_n_6\
    );
\sol_d1[23]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(16),
      I1 => mul_ln48_reg_1080(16),
      O => \sol_d1[23]_INST_0_i_9_n_6\
    );
\sol_d1[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(24),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(24),
      O => sol_d1(24)
    );
\sol_d1[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(25),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(25),
      O => sol_d1(25)
    );
\sol_d1[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(26),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(26),
      O => sol_d1(26)
    );
\sol_d1[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(27),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(27),
      O => sol_d1(27)
    );
\sol_d1[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(28),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(28),
      O => sol_d1(28)
    );
\sol_d1[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(29),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(29),
      O => sol_d1(29)
    );
\sol_d1[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(2),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(2),
      O => sol_d1(2)
    );
\sol_d1[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(30),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(30),
      O => sol_d1(30)
    );
\sol_d1[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(31),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(31),
      O => sol_d1(31)
    );
\sol_d1[31]_INST_0_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sol_d1[23]_INST_0_i_1_n_6\,
      CI_TOP => '0',
      CO(7) => \NLW_sol_d1[31]_INST_0_i_1_CO_UNCONNECTED\(7),
      CO(6) => \sol_d1[31]_INST_0_i_1_n_7\,
      CO(5) => \sol_d1[31]_INST_0_i_1_n_8\,
      CO(4) => \sol_d1[31]_INST_0_i_1_n_9\,
      CO(3) => \sol_d1[31]_INST_0_i_1_n_10\,
      CO(2) => \sol_d1[31]_INST_0_i_1_n_11\,
      CO(1) => \sol_d1[31]_INST_0_i_1_n_12\,
      CO(0) => \sol_d1[31]_INST_0_i_1_n_13\,
      DI(7) => '0',
      DI(6 downto 0) => mul_ln48_1_reg_1120(30 downto 24),
      O(7 downto 0) => add_ln48_5_fu_833_p2(31 downto 24),
      S(7) => \sol_d1[31]_INST_0_i_2_n_6\,
      S(6) => \sol_d1[31]_INST_0_i_3_n_6\,
      S(5) => \sol_d1[31]_INST_0_i_4_n_6\,
      S(4) => \sol_d1[31]_INST_0_i_5_n_6\,
      S(3) => \sol_d1[31]_INST_0_i_6_n_6\,
      S(2) => \sol_d1[31]_INST_0_i_7_n_6\,
      S(1) => \sol_d1[31]_INST_0_i_8_n_6\,
      S(0) => \sol_d1[31]_INST_0_i_9_n_6\
    );
\sol_d1[31]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_reg_1080(31),
      I1 => mul_ln48_1_reg_1120(31),
      O => \sol_d1[31]_INST_0_i_2_n_6\
    );
\sol_d1[31]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(30),
      I1 => mul_ln48_reg_1080(30),
      O => \sol_d1[31]_INST_0_i_3_n_6\
    );
\sol_d1[31]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(29),
      I1 => mul_ln48_reg_1080(29),
      O => \sol_d1[31]_INST_0_i_4_n_6\
    );
\sol_d1[31]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(28),
      I1 => mul_ln48_reg_1080(28),
      O => \sol_d1[31]_INST_0_i_5_n_6\
    );
\sol_d1[31]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(27),
      I1 => mul_ln48_reg_1080(27),
      O => \sol_d1[31]_INST_0_i_6_n_6\
    );
\sol_d1[31]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(26),
      I1 => mul_ln48_reg_1080(26),
      O => \sol_d1[31]_INST_0_i_7_n_6\
    );
\sol_d1[31]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(25),
      I1 => mul_ln48_reg_1080(25),
      O => \sol_d1[31]_INST_0_i_8_n_6\
    );
\sol_d1[31]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(24),
      I1 => mul_ln48_reg_1080(24),
      O => \sol_d1[31]_INST_0_i_9_n_6\
    );
\sol_d1[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(3),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(3),
      O => sol_d1(3)
    );
\sol_d1[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(4),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(4),
      O => sol_d1(4)
    );
\sol_d1[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(5),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(5),
      O => sol_d1(5)
    );
\sol_d1[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(6),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(6),
      O => sol_d1(6)
    );
\sol_d1[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(7),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(7),
      O => sol_d1(7)
    );
\sol_d1[7]_INST_0_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sol_d1[7]_INST_0_i_1_n_6\,
      CO(6) => \sol_d1[7]_INST_0_i_1_n_7\,
      CO(5) => \sol_d1[7]_INST_0_i_1_n_8\,
      CO(4) => \sol_d1[7]_INST_0_i_1_n_9\,
      CO(3) => \sol_d1[7]_INST_0_i_1_n_10\,
      CO(2) => \sol_d1[7]_INST_0_i_1_n_11\,
      CO(1) => \sol_d1[7]_INST_0_i_1_n_12\,
      CO(0) => \sol_d1[7]_INST_0_i_1_n_13\,
      DI(7 downto 0) => mul_ln48_1_reg_1120(7 downto 0),
      O(7 downto 0) => add_ln48_5_fu_833_p2(7 downto 0),
      S(7) => \sol_d1[7]_INST_0_i_2_n_6\,
      S(6) => \sol_d1[7]_INST_0_i_3_n_6\,
      S(5) => \sol_d1[7]_INST_0_i_4_n_6\,
      S(4) => \sol_d1[7]_INST_0_i_5_n_6\,
      S(3) => \sol_d1[7]_INST_0_i_6_n_6\,
      S(2) => \sol_d1[7]_INST_0_i_7_n_6\,
      S(1) => \sol_d1[7]_INST_0_i_8_n_6\,
      S(0) => \sol_d1[7]_INST_0_i_9_n_6\
    );
\sol_d1[7]_INST_0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(7),
      I1 => mul_ln48_reg_1080(7),
      O => \sol_d1[7]_INST_0_i_2_n_6\
    );
\sol_d1[7]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(6),
      I1 => mul_ln48_reg_1080(6),
      O => \sol_d1[7]_INST_0_i_3_n_6\
    );
\sol_d1[7]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(5),
      I1 => mul_ln48_reg_1080(5),
      O => \sol_d1[7]_INST_0_i_4_n_6\
    );
\sol_d1[7]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(4),
      I1 => mul_ln48_reg_1080(4),
      O => \sol_d1[7]_INST_0_i_5_n_6\
    );
\sol_d1[7]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(3),
      I1 => mul_ln48_reg_1080(3),
      O => \sol_d1[7]_INST_0_i_6_n_6\
    );
\sol_d1[7]_INST_0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(2),
      I1 => mul_ln48_reg_1080(2),
      O => \sol_d1[7]_INST_0_i_7_n_6\
    );
\sol_d1[7]_INST_0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(1),
      I1 => mul_ln48_reg_1080(1),
      O => \sol_d1[7]_INST_0_i_8_n_6\
    );
\sol_d1[7]_INST_0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mul_ln48_1_reg_1120(0),
      I1 => mul_ln48_reg_1080(0),
      O => \sol_d1[7]_INST_0_i_9_n_6\
    );
\sol_d1[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(8),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(8),
      O => sol_d1(8)
    );
\sol_d1[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => add_ln48_5_fu_833_p2(9),
      I1 => ap_CS_fsm_state20,
      I2 => orig_q1(9),
      O => sol_d1(9)
    );
sol_we0_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ap_CS_fsm_state11,
      I1 => ap_CS_fsm_state8,
      I2 => ap_CS_fsm_state5,
      I3 => ap_CS_fsm_state4,
      O => \^sol_ce0\
    );
sol_we1_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => ap_CS_fsm_state20,
      I1 => ap_CS_fsm_state11,
      I2 => ap_CS_fsm_state8,
      O => \^sol_ce1\
    );
\tmp3_reg_1052[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(0),
      I1 => tmp2_cast_fu_669_p1(1),
      O => tmp3_fu_684_p2(1)
    );
\tmp3_reg_1052[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(2),
      I1 => tmp2_cast_fu_669_p1(0),
      I2 => tmp2_cast_fu_669_p1(1),
      O => tmp3_fu_684_p2(2)
    );
\tmp3_reg_1052[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => tmp2_cast_fu_669_p1(3),
      I1 => tmp2_cast_fu_669_p1(2),
      I2 => tmp2_cast_fu_669_p1(1),
      I3 => tmp2_cast_fu_669_p1(0),
      O => tmp3_fu_684_p2(3)
    );
\tmp3_reg_1052_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp3_fu_684_p2(1),
      Q => tmp3_reg_1052(1),
      R => '0'
    );
\tmp3_reg_1052_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp3_fu_684_p2(2),
      Q => tmp3_reg_1052(2),
      R => '0'
    );
\tmp3_reg_1052_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state14,
      D => tmp3_fu_684_p2(3),
      Q => tmp3_reg_1052(3),
      R => '0'
    );
\tmp_1_reg_853_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \j_fu_102_reg_n_6_[0]\,
      Q => tmp_1_reg_853(3),
      R => '0'
    );
\tmp_1_reg_853_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \j_fu_102_reg_n_6_[1]\,
      Q => tmp_1_reg_853(4),
      R => '0'
    );
\tmp_1_reg_853_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \j_fu_102_reg_n_6_[2]\,
      Q => tmp_1_reg_853(5),
      R => '0'
    );
\tmp_1_reg_853_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \j_fu_102_reg_n_6_[3]\,
      Q => tmp_1_reg_853(6),
      R => '0'
    );
\zext_ln17_reg_878[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => or_ln_fu_459_p3(3),
      I1 => tmp_1_reg_853(3),
      O => data6(3)
    );
\zext_ln17_reg_878[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => or_ln_fu_459_p3(3),
      I1 => tmp_1_reg_853(3),
      I2 => tmp_1_reg_853(4),
      O => data6(4)
    );
\zext_ln17_reg_878[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => tmp_1_reg_853(4),
      I1 => tmp_1_reg_853(3),
      I2 => or_ln_fu_459_p3(3),
      I3 => tmp_1_reg_853(5),
      O => data6(5)
    );
\zext_ln17_reg_878[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => tmp_1_reg_853(6),
      I1 => tmp_1_reg_853(5),
      I2 => tmp_1_reg_853(4),
      I3 => tmp_1_reg_853(3),
      I4 => or_ln_fu_459_p3(3),
      O => data6(6)
    );
\zext_ln17_reg_878_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => data6(3),
      Q => zext_ln17_reg_878_reg(3),
      R => '0'
    );
\zext_ln17_reg_878_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => data6(4),
      Q => zext_ln17_reg_878_reg(4),
      R => '0'
    );
\zext_ln17_reg_878_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => data6(5),
      Q => zext_ln17_reg_878_reg(5),
      R => '0'
    );
\zext_ln17_reg_878_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => data6(6),
      Q => zext_ln17_reg_878_reg(6),
      R => '0'
    );
\zext_ln18_reg_893_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(0),
      Q => zext_ln18_reg_893_reg(0),
      R => '0'
    );
\zext_ln18_reg_893_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(1),
      Q => zext_ln18_reg_893_reg(1),
      R => '0'
    );
\zext_ln18_reg_893_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(2),
      Q => zext_ln18_reg_893_reg(2),
      R => '0'
    );
\zext_ln18_reg_893_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(3),
      Q => zext_ln18_reg_893_reg(3),
      R => '0'
    );
\zext_ln18_reg_893_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(4),
      Q => zext_ln18_reg_893_reg(4),
      R => '0'
    );
\zext_ln18_reg_893_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(5),
      Q => zext_ln18_reg_893_reg(5),
      R => '0'
    );
\zext_ln18_reg_893_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(6),
      Q => zext_ln18_reg_893_reg(6),
      R => '0'
    );
\zext_ln18_reg_893_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state4,
      D => add_ln18_reg_888(7),
      Q => zext_ln18_reg_893_reg(7),
      R => '0'
    );
\zext_ln23_reg_929_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(10),
      Q => zext_ln23_reg_929(10),
      R => '0'
    );
\zext_ln23_reg_929_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(3),
      Q => zext_ln23_reg_929(3),
      R => '0'
    );
\zext_ln23_reg_929_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(7),
      Q => zext_ln23_reg_929(7),
      R => '0'
    );
\zext_ln23_reg_929_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(8),
      Q => zext_ln23_reg_929(8),
      R => '0'
    );
\zext_ln23_reg_929_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(9),
      Q => zext_ln23_reg_929(9),
      R => '0'
    );
\zext_ln24_reg_939[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => empty_14_reg_909(10),
      I1 => empty_14_reg_909(9),
      I2 => empty_14_reg_909(8),
      I3 => empty_14_reg_909(7),
      I4 => add_ln_fu_528_p4(3),
      O => data4(10)
    );
\zext_ln24_reg_939[6]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => add_ln_fu_528_p4(3),
      O => data4(6)
    );
\zext_ln24_reg_939[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => add_ln_fu_528_p4(3),
      I1 => empty_14_reg_909(7),
      O => data4(7)
    );
\zext_ln24_reg_939[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => add_ln_fu_528_p4(3),
      I1 => empty_14_reg_909(7),
      I2 => empty_14_reg_909(8),
      O => data4(8)
    );
\zext_ln24_reg_939[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => empty_14_reg_909(8),
      I1 => empty_14_reg_909(7),
      I2 => add_ln_fu_528_p4(3),
      I3 => empty_14_reg_909(9),
      O => data4(9)
    );
\zext_ln24_reg_939_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(0),
      Q => zext_ln24_reg_939_reg(0),
      R => '0'
    );
\zext_ln24_reg_939_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => data4(10),
      Q => zext_ln24_reg_939_reg(10),
      R => '0'
    );
\zext_ln24_reg_939_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(1),
      Q => zext_ln24_reg_939_reg(1),
      R => '0'
    );
\zext_ln24_reg_939_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => add_ln_fu_528_p4(2),
      Q => zext_ln24_reg_939_reg(2),
      R => '0'
    );
\zext_ln24_reg_939_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => data4(6),
      Q => zext_ln24_reg_939_reg(6),
      R => '0'
    );
\zext_ln24_reg_939_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => data4(7),
      Q => zext_ln24_reg_939_reg(7),
      R => '0'
    );
\zext_ln24_reg_939_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => data4(8),
      Q => zext_ln24_reg_939_reg(8),
      R => '0'
    );
\zext_ln24_reg_939_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => data4(9),
      Q => zext_ln24_reg_939_reg(9),
      R => '0'
    );
\zext_ln29_reg_975_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => shl_ln_fu_582_p4(10),
      Q => zext_ln30_reg_985_reg(7),
      R => '0'
    );
\zext_ln29_reg_975_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => data3(3),
      Q => zext_ln30_reg_985_reg(0),
      R => '0'
    );
\zext_ln29_reg_975_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => data3(4),
      Q => zext_ln30_reg_985_reg(1),
      R => '0'
    );
\zext_ln29_reg_975_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => data3(5),
      Q => zext_ln30_reg_985_reg(2),
      R => '0'
    );
\zext_ln29_reg_975_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => data3(6),
      Q => zext_ln30_reg_985_reg(3),
      R => '0'
    );
\zext_ln29_reg_975_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => shl_ln_fu_582_p4(7),
      Q => zext_ln30_reg_985_reg(4),
      R => '0'
    );
\zext_ln29_reg_975_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => shl_ln_fu_582_p4(8),
      Q => zext_ln30_reg_985_reg(5),
      R => '0'
    );
\zext_ln29_reg_975_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state10,
      D => shl_ln_fu_582_p4(9),
      Q => zext_ln30_reg_985_reg(6),
      R => '0'
    );
\zext_ln39_reg_1060_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(0),
      Q => zext_ln39_reg_1060_reg(0),
      R => '0'
    );
\zext_ln39_reg_1060_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(10),
      Q => zext_ln39_reg_1060_reg(10),
      R => '0'
    );
\zext_ln39_reg_1060_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(1),
      Q => zext_ln39_reg_1060_reg(1),
      R => '0'
    );
\zext_ln39_reg_1060_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(2),
      Q => zext_ln39_reg_1060_reg(2),
      R => '0'
    );
\zext_ln39_reg_1060_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => tmp2_cast_fu_669_p1(0),
      Q => zext_ln39_reg_1060_reg(3),
      R => '0'
    );
\zext_ln39_reg_1060_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => tmp2_cast_fu_669_p1(1),
      Q => zext_ln39_reg_1060_reg(4),
      R => '0'
    );
\zext_ln39_reg_1060_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => tmp2_cast_fu_669_p1(2),
      Q => zext_ln39_reg_1060_reg(5),
      R => '0'
    );
\zext_ln39_reg_1060_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => tmp2_cast_fu_669_p1(3),
      Q => zext_ln39_reg_1060_reg(6),
      R => '0'
    );
\zext_ln39_reg_1060_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(7),
      Q => zext_ln39_reg_1060_reg(7),
      R => '0'
    );
\zext_ln39_reg_1060_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(8),
      Q => zext_ln39_reg_1060_reg(8),
      R => '0'
    );
\zext_ln39_reg_1060_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state15,
      D => data1(9),
      Q => zext_ln39_reg_1060_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bd_0_hls_inst_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bd_0_hls_inst_0 : entity is "bd_0_hls_inst_0,stencil3d,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_0_hls_inst_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of bd_0_hls_inst_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bd_0_hls_inst_0 : entity is "stencil3d,Vivado 2023.2";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0 : entity is "yes";
end bd_0_hls_inst_0;

architecture STRUCTURE of bd_0_hls_inst_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal NLW_inst_C_address0_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_C_address1_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "20'b00000000000000000001";
  attribute ap_ST_fsm_state10 : string;
  attribute ap_ST_fsm_state10 of inst : label is "20'b00000000001000000000";
  attribute ap_ST_fsm_state11 : string;
  attribute ap_ST_fsm_state11 of inst : label is "20'b00000000010000000000";
  attribute ap_ST_fsm_state12 : string;
  attribute ap_ST_fsm_state12 of inst : label is "20'b00000000100000000000";
  attribute ap_ST_fsm_state13 : string;
  attribute ap_ST_fsm_state13 of inst : label is "20'b00000001000000000000";
  attribute ap_ST_fsm_state14 : string;
  attribute ap_ST_fsm_state14 of inst : label is "20'b00000010000000000000";
  attribute ap_ST_fsm_state15 : string;
  attribute ap_ST_fsm_state15 of inst : label is "20'b00000100000000000000";
  attribute ap_ST_fsm_state16 : string;
  attribute ap_ST_fsm_state16 of inst : label is "20'b00001000000000000000";
  attribute ap_ST_fsm_state17 : string;
  attribute ap_ST_fsm_state17 of inst : label is "20'b00010000000000000000";
  attribute ap_ST_fsm_state18 : string;
  attribute ap_ST_fsm_state18 of inst : label is "20'b00100000000000000000";
  attribute ap_ST_fsm_state19 : string;
  attribute ap_ST_fsm_state19 of inst : label is "20'b01000000000000000000";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "20'b00000000000000000010";
  attribute ap_ST_fsm_state20 : string;
  attribute ap_ST_fsm_state20 of inst : label is "20'b10000000000000000000";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "20'b00000000000000000100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of inst : label is "20'b00000000000000001000";
  attribute ap_ST_fsm_state5 : string;
  attribute ap_ST_fsm_state5 of inst : label is "20'b00000000000000010000";
  attribute ap_ST_fsm_state6 : string;
  attribute ap_ST_fsm_state6 of inst : label is "20'b00000000000000100000";
  attribute ap_ST_fsm_state7 : string;
  attribute ap_ST_fsm_state7 of inst : label is "20'b00000000000001000000";
  attribute ap_ST_fsm_state8 : string;
  attribute ap_ST_fsm_state8 of inst : label is "20'b00000000000010000000";
  attribute ap_ST_fsm_state9 : string;
  attribute ap_ST_fsm_state9 of inst : label is "20'b00000000000100000000";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 125000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_INFO of ap_rst : signal is "xilinx.com:signal:reset:1.0 ap_rst RST";
  attribute X_INTERFACE_PARAMETER of ap_rst : signal is "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of C_address0 : signal is "xilinx.com:signal:data:1.0 C_address0 DATA";
  attribute X_INTERFACE_PARAMETER of C_address0 : signal is "XIL_INTERFACENAME C_address0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of C_address1 : signal is "xilinx.com:signal:data:1.0 C_address1 DATA";
  attribute X_INTERFACE_PARAMETER of C_address1 : signal is "XIL_INTERFACENAME C_address1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of C_q0 : signal is "xilinx.com:signal:data:1.0 C_q0 DATA";
  attribute X_INTERFACE_PARAMETER of C_q0 : signal is "XIL_INTERFACENAME C_q0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of C_q1 : signal is "xilinx.com:signal:data:1.0 C_q1 DATA";
  attribute X_INTERFACE_PARAMETER of C_q1 : signal is "XIL_INTERFACENAME C_q1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of orig_address0 : signal is "xilinx.com:signal:data:1.0 orig_address0 DATA";
  attribute X_INTERFACE_PARAMETER of orig_address0 : signal is "XIL_INTERFACENAME orig_address0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of orig_address1 : signal is "xilinx.com:signal:data:1.0 orig_address1 DATA";
  attribute X_INTERFACE_PARAMETER of orig_address1 : signal is "XIL_INTERFACENAME orig_address1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of orig_q0 : signal is "xilinx.com:signal:data:1.0 orig_q0 DATA";
  attribute X_INTERFACE_PARAMETER of orig_q0 : signal is "XIL_INTERFACENAME orig_q0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of orig_q1 : signal is "xilinx.com:signal:data:1.0 orig_q1 DATA";
  attribute X_INTERFACE_PARAMETER of orig_q1 : signal is "XIL_INTERFACENAME orig_q1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sol_address0 : signal is "xilinx.com:signal:data:1.0 sol_address0 DATA";
  attribute X_INTERFACE_PARAMETER of sol_address0 : signal is "XIL_INTERFACENAME sol_address0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sol_address1 : signal is "xilinx.com:signal:data:1.0 sol_address1 DATA";
  attribute X_INTERFACE_PARAMETER of sol_address1 : signal is "XIL_INTERFACENAME sol_address1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sol_d0 : signal is "xilinx.com:signal:data:1.0 sol_d0 DATA";
  attribute X_INTERFACE_PARAMETER of sol_d0 : signal is "XIL_INTERFACENAME sol_d0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sol_d1 : signal is "xilinx.com:signal:data:1.0 sol_d1 DATA";
  attribute X_INTERFACE_PARAMETER of sol_d1 : signal is "XIL_INTERFACENAME sol_d1, LAYERED_METADATA undef";
begin
  C_address0(0) <= \<const1>\;
  C_address1(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.bd_0_hls_inst_0_stencil3d
     port map (
      C_address0(0) => NLW_inst_C_address0_UNCONNECTED(0),
      C_address1(0) => NLW_inst_C_address1_UNCONNECTED(0),
      C_ce0 => C_ce0,
      C_ce1 => C_ce1,
      C_q0(31 downto 0) => C_q0(31 downto 0),
      C_q1(31 downto 0) => C_q1(31 downto 0),
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      orig_address0(10 downto 0) => orig_address0(10 downto 0),
      orig_address1(10 downto 0) => orig_address1(10 downto 0),
      orig_ce0 => orig_ce0,
      orig_ce1 => orig_ce1,
      orig_q0(31 downto 0) => orig_q0(31 downto 0),
      orig_q1(31 downto 0) => orig_q1(31 downto 0),
      sol_address0(10 downto 0) => sol_address0(10 downto 0),
      sol_address1(10 downto 0) => sol_address1(10 downto 0),
      sol_ce0 => sol_ce0,
      sol_ce1 => sol_ce1,
      sol_d0(31 downto 0) => sol_d0(31 downto 0),
      sol_d1(31 downto 0) => sol_d1(31 downto 0),
      sol_we0 => sol_we0,
      sol_we1 => sol_we1
    );
end STRUCTURE;
