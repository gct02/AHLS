-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity face_detect_cascadeClassifier_Pipeline_VITIS_LOOP_379_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    empty : IN STD_LOGIC_VECTOR (31 downto 0);
    a_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    a_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of face_detect_cascadeClassifier_Pipeline_VITIS_LOOP_379_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv30_0 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv5_10 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv30_1 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln379_fu_104_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal c_fu_52 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000000";
    signal c_3_fu_221_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal a_fu_56 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal a_3_fu_229_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_60 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal i_2_fu_110_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal value_assign_2_fu_64 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal shl_ln385_fu_155_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal lshr_ln_fu_125_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln383_fu_135_p1 : STD_LOGIC_VECTOR (27 downto 0);
    signal trunc_ln387_fu_173_p1 : STD_LOGIC_VECTOR (27 downto 0);
    signal shl_ln387_fu_167_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln_fu_177_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal c_1_fu_139_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal b_fu_185_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln388_fu_197_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln_fu_147_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal or_ln377_fu_191_p2 : STD_LOGIC_VECTOR (29 downto 0);
    signal a_1_fu_161_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln388_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_2_fu_209_p2 : STD_LOGIC_VECTOR (29 downto 0);
    signal a_2_fu_215_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component face_detect_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component face_detect_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    a_fu_56_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    a_fu_56 <= ap_const_lv32_0;
                elsif (((icmp_ln379_fu_104_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    a_fu_56 <= a_3_fu_229_p3;
                end if;
            end if; 
        end if;
    end process;

    c_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    c_fu_52 <= ap_const_lv30_0;
                elsif (((icmp_ln379_fu_104_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    c_fu_52 <= c_3_fu_221_p3;
                end if;
            end if; 
        end if;
    end process;

    i_fu_60_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_60 <= ap_const_lv5_0;
                elsif (((icmp_ln379_fu_104_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_60 <= i_2_fu_110_p2;
                end if;
            end if; 
        end if;
    end process;

    value_assign_2_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    value_assign_2_fu_64 <= empty;
                elsif (((icmp_ln379_fu_104_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    value_assign_2_fu_64 <= shl_ln385_fu_155_p2;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    a_1_fu_161_p2 <= std_logic_vector(shift_left(unsigned(a_fu_56),to_integer(unsigned('0' & ap_const_lv32_1(31-1 downto 0)))));
    a_2_fu_215_p2 <= (ap_const_lv32_1 or a_1_fu_161_p2);
    a_3_fu_229_p3 <= 
        a_2_fu_215_p2 when (xor_ln388_fu_203_p2(0) = '1') else 
        a_1_fu_161_p2;
    a_out <= a_fu_56;

    a_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln379_fu_104_p2, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln379_fu_104_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            a_out_ap_vld <= ap_const_logic_1;
        else 
            a_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln379_fu_104_p2)
    begin
        if (((icmp_ln379_fu_104_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    b_fu_185_p2 <= (shl_ln387_fu_167_p2 or ap_const_lv32_1);
    c_1_fu_139_p3 <= (c_fu_52 & lshr_ln_fu_125_p4);
    c_2_fu_209_p2 <= std_logic_vector(unsigned(or_ln_fu_147_p3) - unsigned(or_ln377_fu_191_p2));
    c_3_fu_221_p3 <= 
        c_2_fu_209_p2 when (xor_ln388_fu_203_p2(0) = '1') else 
        or_ln_fu_147_p3;
    i_2_fu_110_p2 <= std_logic_vector(unsigned(i_fu_60) + unsigned(ap_const_lv5_1));
    icmp_ln379_fu_104_p2 <= "1" when (i_fu_60 = ap_const_lv5_10) else "0";
    icmp_ln388_fu_197_p2 <= "1" when (unsigned(c_1_fu_139_p3) < unsigned(b_fu_185_p2)) else "0";
    lshr_ln_fu_125_p4 <= value_assign_2_fu_64(31 downto 30);
    or_ln377_fu_191_p2 <= (trunc_ln_fu_177_p3 or ap_const_lv30_1);
    or_ln_fu_147_p3 <= (trunc_ln383_fu_135_p1 & lshr_ln_fu_125_p4);
    shl_ln385_fu_155_p2 <= std_logic_vector(shift_left(unsigned(value_assign_2_fu_64),to_integer(unsigned('0' & ap_const_lv32_2(31-1 downto 0)))));
    shl_ln387_fu_167_p2 <= std_logic_vector(shift_left(unsigned(a_fu_56),to_integer(unsigned('0' & ap_const_lv32_2(31-1 downto 0)))));
    trunc_ln383_fu_135_p1 <= c_fu_52(28 - 1 downto 0);
    trunc_ln387_fu_173_p1 <= a_fu_56(28 - 1 downto 0);
    trunc_ln_fu_177_p3 <= (trunc_ln387_fu_173_p1 & ap_const_lv2_0);
    xor_ln388_fu_203_p2 <= (icmp_ln388_fu_197_p2 xor ap_const_lv1_1);
end behav;