-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity jpeg2bmp_DecodeHuffman_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    Dhuff_ml : IN STD_LOGIC_VECTOR (6 downto 0);
    read_position_i : IN STD_LOGIC_VECTOR (31 downto 0);
    read_position_o : OUT STD_LOGIC_VECTOR (31 downto 0);
    read_position_o_ap_vld : OUT STD_LOGIC;
    CurHuffReadBuf_i : IN STD_LOGIC_VECTOR (7 downto 0);
    CurHuffReadBuf_o : OUT STD_LOGIC_VECTOR (7 downto 0);
    CurHuffReadBuf_o_ap_vld : OUT STD_LOGIC;
    current_read_byte_i : IN STD_LOGIC_VECTOR (31 downto 0);
    current_read_byte_o : OUT STD_LOGIC_VECTOR (31 downto 0);
    current_read_byte_o_ap_vld : OUT STD_LOGIC;
    p_jinfo_ac_dhuff_tbl_maxcode_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    p_jinfo_ac_dhuff_tbl_maxcode_ce0 : OUT STD_LOGIC;
    p_jinfo_ac_dhuff_tbl_maxcode_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    p_jinfo_ac_dhuff_tbl_valptr_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    p_jinfo_ac_dhuff_tbl_valptr_ce0 : OUT STD_LOGIC;
    p_jinfo_ac_dhuff_tbl_valptr_q0 : IN STD_LOGIC_VECTOR (10 downto 0);
    p_jinfo_ac_dhuff_tbl_mincode_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    p_jinfo_ac_dhuff_tbl_mincode_ce0 : OUT STD_LOGIC;
    p_jinfo_ac_dhuff_tbl_mincode_q0 : IN STD_LOGIC_VECTOR (10 downto 0);
    p_jinfo_ac_xhuff_tbl_huffval_address0 : OUT STD_LOGIC_VECTOR (10 downto 0);
    p_jinfo_ac_xhuff_tbl_huffval_ce0 : OUT STD_LOGIC;
    p_jinfo_ac_xhuff_tbl_huffval_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of jpeg2bmp_DecodeHuffman_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv13_A00 : STD_LOGIC_VECTOR (12 downto 0) := "0101000000000";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal bit_set_mask_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal bit_set_mask_ce0 : STD_LOGIC;
    signal bit_set_mask_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal code_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal code_reg_344 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal icmp_ln692_fu_266_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln692_reg_364 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal p_fu_278_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal p_reg_369 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_idle : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_ready : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_l_out : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_l_out_ap_vld : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out_ap_vld : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_ce0 : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld : STD_LOGIC;
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld : STD_LOGIC;
    signal ap_phi_mux_empty_phi_fu_136_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_165_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal zext_ln577_fu_225_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal l_reload_cast_fu_249_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln692_fu_255_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln694_fu_307_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln577_fu_213_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln555_fu_193_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln555_fu_183_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln555_fu_187_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln555_fu_177_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln577_fu_234_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln685_fu_262_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal add_ln693_fu_272_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal shl_ln_fu_284_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln694_fu_291_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal lshr_ln_fu_297_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal select_ln692_fu_312_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component jpeg2bmp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        zext_ln577_1 : IN STD_LOGIC_VECTOR (0 downto 0);
        l_out : OUT STD_LOGIC_VECTOR (6 downto 0);
        l_out_ap_vld : OUT STD_LOGIC;
        code_6_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        code_6_out_ap_vld : OUT STD_LOGIC;
        p_jinfo_ac_dhuff_tbl_maxcode_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 : OUT STD_LOGIC;
        p_jinfo_ac_dhuff_tbl_maxcode_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        current_read_byte_i : IN STD_LOGIC_VECTOR (31 downto 0);
        current_read_byte_o : OUT STD_LOGIC_VECTOR (31 downto 0);
        current_read_byte_o_ap_vld : OUT STD_LOGIC;
        read_position_i : IN STD_LOGIC_VECTOR (31 downto 0);
        read_position_o : OUT STD_LOGIC_VECTOR (31 downto 0);
        read_position_o_ap_vld : OUT STD_LOGIC;
        CurHuffReadBuf_i : IN STD_LOGIC_VECTOR (7 downto 0);
        CurHuffReadBuf_o : OUT STD_LOGIC_VECTOR (7 downto 0);
        CurHuffReadBuf_o_ap_vld : OUT STD_LOGIC );
    end component;


    component jpeg2bmp_DecodeHuffman_1_Pipeline_VITIS_LOOP_688_1_bit_set_mask_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    bit_set_mask_U : component jpeg2bmp_DecodeHuffman_1_Pipeline_VITIS_LOOP_688_1_bit_set_mask_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 32,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => bit_set_mask_address0,
        ce0 => bit_set_mask_ce0,
        q0 => bit_set_mask_q0);

    grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143 : component jpeg2bmp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start,
        ap_done => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done,
        ap_idle => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_idle,
        ap_ready => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_ready,
        zext_ln577_1 => code_reg_344,
        l_out => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_l_out,
        l_out_ap_vld => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_l_out_ap_vld,
        code_6_out => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out,
        code_6_out_ap_vld => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out_ap_vld,
        p_jinfo_ac_dhuff_tbl_maxcode_address0 => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_address0,
        p_jinfo_ac_dhuff_tbl_maxcode_ce0 => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_ce0,
        p_jinfo_ac_dhuff_tbl_maxcode_q0 => p_jinfo_ac_dhuff_tbl_maxcode_q0,
        current_read_byte_i => current_read_byte_i,
        current_read_byte_o => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o,
        current_read_byte_o_ap_vld => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld,
        read_position_i => read_position_i,
        read_position_o => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o,
        read_position_o_ap_vld => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld,
        CurHuffReadBuf_i => CurHuffReadBuf_i,
        CurHuffReadBuf_o => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o,
        CurHuffReadBuf_o_ap_vld => grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv8_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    ap_return_preg <= select_ln692_fu_312_p3;
                end if; 
            end if;
        end if;
    end process;


    grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_ready = ap_const_logic_1)) then 
                    grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                code_reg_344 <= code_fu_240_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                icmp_ln692_reg_364 <= icmp_ln692_fu_266_p2;
                p_reg_369 <= p_fu_278_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;

    CurHuffReadBuf_o_assign_proc : process(ap_CS_fsm_state1, CurHuffReadBuf_i, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld, tmp_fu_165_p3, ap_CS_fsm_state4, select_ln555_fu_193_p3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (tmp_fu_165_p3 = ap_const_lv1_1))) then 
            CurHuffReadBuf_o <= select_ln555_fu_193_p3;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld = ap_const_logic_1))) then 
            CurHuffReadBuf_o <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o;
        else 
            CurHuffReadBuf_o <= CurHuffReadBuf_i;
        end if; 
    end process;


    CurHuffReadBuf_o_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld, tmp_fu_165_p3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (tmp_fu_165_p3 = ap_const_lv1_1))) then 
            CurHuffReadBuf_o_ap_vld <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            CurHuffReadBuf_o_ap_vld <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_CurHuffReadBuf_o_ap_vld;
        else 
            CurHuffReadBuf_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    add_ln555_fu_177_p2 <= std_logic_vector(unsigned(CurHuffReadBuf_i) + unsigned(ap_const_lv8_1));
    add_ln577_fu_213_p2 <= std_logic_vector(unsigned(ap_phi_mux_empty_phi_fu_136_p4) + unsigned(ap_const_lv32_FFFFFFFF));
    add_ln693_fu_272_p2 <= std_logic_vector(unsigned(p_jinfo_ac_dhuff_tbl_valptr_q0) + unsigned(trunc_ln685_fu_262_p1));
    add_ln694_fu_291_p2 <= std_logic_vector(unsigned(shl_ln_fu_284_p3) + unsigned(ap_const_lv13_A00));
    and_ln577_fu_234_p2 <= (current_read_byte_i and bit_set_mask_q0);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done)
    begin
        if ((grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_empty_phi_fu_136_p4_assign_proc : process(ap_CS_fsm_state1, read_position_i, tmp_fu_165_p3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((tmp_fu_165_p3 = ap_const_lv1_0)) then 
                ap_phi_mux_empty_phi_fu_136_p4 <= read_position_i;
            elsif ((tmp_fu_165_p3 = ap_const_lv1_1)) then 
                ap_phi_mux_empty_phi_fu_136_p4 <= ap_const_lv32_7;
            else 
                ap_phi_mux_empty_phi_fu_136_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_empty_phi_fu_136_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_CS_fsm_state8, select_ln692_fu_312_p3, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_return <= select_ln692_fu_312_p3;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;


    bit_set_mask_address0_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state4, zext_ln577_fu_225_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            bit_set_mask_address0 <= zext_ln577_fu_225_p1(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            bit_set_mask_address0 <= ap_const_lv5_0;
        else 
            bit_set_mask_address0 <= "XXXXX";
        end if; 
    end process;


    bit_set_mask_ce0_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            bit_set_mask_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            bit_set_mask_ce0 <= ap_const_logic_0;
        else 
            bit_set_mask_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    code_fu_240_p2 <= "0" when (and_ln577_fu_234_p2 = ap_const_lv32_0) else "1";

    current_read_byte_o_assign_proc : process(ap_CS_fsm_state1, current_read_byte_i, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld, tmp_fu_165_p3, ap_CS_fsm_state4, zext_ln555_fu_183_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (tmp_fu_165_p3 = ap_const_lv1_1))) then 
            current_read_byte_o <= zext_ln555_fu_183_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld = ap_const_logic_1))) then 
            current_read_byte_o <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o;
        else 
            current_read_byte_o <= current_read_byte_i;
        end if; 
    end process;


    current_read_byte_o_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld, tmp_fu_165_p3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1) and (tmp_fu_165_p3 = ap_const_lv1_1))) then 
            current_read_byte_o_ap_vld <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            current_read_byte_o_ap_vld <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_current_read_byte_o_ap_vld;
        else 
            current_read_byte_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_ap_start_reg;
    icmp_ln555_fu_187_p2 <= "1" when (CurHuffReadBuf_i = ap_const_lv8_FF) else "0";
    icmp_ln692_fu_266_p2 <= "1" when (signed(grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out) < signed(p_jinfo_ac_dhuff_tbl_maxcode_q0)) else "0";
    l_reload_cast_fu_249_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_l_out),64));
    lshr_ln_fu_297_p4 <= add_ln694_fu_291_p2(12 downto 2);
    p_fu_278_p2 <= std_logic_vector(unsigned(add_ln693_fu_272_p2) - unsigned(p_jinfo_ac_dhuff_tbl_mincode_q0));

    p_jinfo_ac_dhuff_tbl_maxcode_address0_assign_proc : process(ap_CS_fsm_state5, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_address0, ap_CS_fsm_state4, zext_ln692_fu_255_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            p_jinfo_ac_dhuff_tbl_maxcode_address0 <= zext_ln692_fu_255_p1(7 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            p_jinfo_ac_dhuff_tbl_maxcode_address0 <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_address0;
        else 
            p_jinfo_ac_dhuff_tbl_maxcode_address0 <= "XXXXXXX";
        end if; 
    end process;


    p_jinfo_ac_dhuff_tbl_maxcode_ce0_assign_proc : process(ap_CS_fsm_state5, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_ce0, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            p_jinfo_ac_dhuff_tbl_maxcode_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            p_jinfo_ac_dhuff_tbl_maxcode_ce0 <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_p_jinfo_ac_dhuff_tbl_maxcode_ce0;
        else 
            p_jinfo_ac_dhuff_tbl_maxcode_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    p_jinfo_ac_dhuff_tbl_mincode_address0 <= l_reload_cast_fu_249_p1(7 - 1 downto 0);

    p_jinfo_ac_dhuff_tbl_mincode_ce0_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            p_jinfo_ac_dhuff_tbl_mincode_ce0 <= ap_const_logic_1;
        else 
            p_jinfo_ac_dhuff_tbl_mincode_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    p_jinfo_ac_dhuff_tbl_valptr_address0 <= l_reload_cast_fu_249_p1(7 - 1 downto 0);

    p_jinfo_ac_dhuff_tbl_valptr_ce0_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            p_jinfo_ac_dhuff_tbl_valptr_ce0 <= ap_const_logic_1;
        else 
            p_jinfo_ac_dhuff_tbl_valptr_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    p_jinfo_ac_xhuff_tbl_huffval_address0 <= zext_ln694_fu_307_p1(11 - 1 downto 0);

    p_jinfo_ac_xhuff_tbl_huffval_ce0_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            p_jinfo_ac_xhuff_tbl_huffval_ce0 <= ap_const_logic_1;
        else 
            p_jinfo_ac_xhuff_tbl_huffval_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    read_position_o_assign_proc : process(ap_CS_fsm_state1, read_position_i, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld, ap_CS_fsm_state4, add_ln577_fu_213_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            read_position_o <= add_ln577_fu_213_p2;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld = ap_const_logic_1))) then 
            read_position_o <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o;
        else 
            read_position_o <= read_position_i;
        end if; 
    end process;


    read_position_o_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            read_position_o_ap_vld <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            read_position_o_ap_vld <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_read_position_o_ap_vld;
        else 
            read_position_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    select_ln555_fu_193_p3 <= 
        ap_const_lv8_1 when (icmp_ln555_fu_187_p2(0) = '1') else 
        add_ln555_fu_177_p2;
    select_ln692_fu_312_p3 <= 
        p_jinfo_ac_xhuff_tbl_huffval_q0 when (icmp_ln692_reg_364(0) = '1') else 
        ap_const_lv8_0;
    shl_ln_fu_284_p3 <= (p_reg_369 & ap_const_lv2_0);
    tmp_fu_165_p3 <= read_position_i(31 downto 31);
    trunc_ln685_fu_262_p1 <= grp_DecodeHuffman_2_Pipeline_VITIS_LOOP_688_1_fu_143_code_6_out(11 - 1 downto 0);
    zext_ln555_fu_183_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(CurHuffReadBuf_i),32));
    zext_ln577_fu_225_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_empty_phi_fu_136_p4),64));
    zext_ln692_fu_255_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Dhuff_ml),64));
    zext_ln694_fu_307_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln_fu_297_p4),64));
end behav;