-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    votes_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    votes_ce0 : OUT STD_LOGIC;
    votes_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    max_label_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    max_label_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of DigitRec_DigitRec_Pipeline_VITIS_LOOP_72_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln72_fu_84_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_1_reg_169 : STD_LOGIC_VECTOR (3 downto 0);
    signal i_1_reg_169_pp0_iter1_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal i_1_reg_169_pp0_iter2_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln72_reg_174 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln72_reg_174_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal votes_load_reg_183 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln74_fu_109_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln74_reg_189 : STD_LOGIC_VECTOR (0 downto 0);
    signal max_vote_fu_114_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal max_vote_reg_194 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln72_fu_96_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal max_label_fu_34 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal max_label_1_fu_127_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal max_vote_1_fu_38 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_sig_allocacmp_max_vote_1_load : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_42 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal i_2_fu_90_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln77_fu_124_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component DigitRec_flow_control_loop_pipe_sequential_init IS
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
    flow_control_loop_pipe_sequential_init_U : component DigitRec_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    i_fu_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln72_fu_84_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_42 <= i_2_fu_90_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_42 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;

    max_label_fu_34_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    max_label_fu_34 <= ap_const_lv8_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    max_label_fu_34 <= max_label_1_fu_127_p3;
                end if;
            end if; 
        end if;
    end process;

    max_vote_1_fu_38_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    max_vote_1_fu_38 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    max_vote_1_fu_38 <= max_vote_reg_194;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                i_1_reg_169 <= ap_sig_allocacmp_i_1;
                i_1_reg_169_pp0_iter1_reg <= i_1_reg_169;
                icmp_ln72_reg_174 <= icmp_ln72_fu_84_p2;
                icmp_ln72_reg_174_pp0_iter1_reg <= icmp_ln72_reg_174;
                votes_load_reg_183 <= votes_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                i_1_reg_169_pp0_iter2_reg <= i_1_reg_169_pp0_iter1_reg;
                icmp_ln74_reg_189 <= icmp_ln74_fu_109_p2;
                max_vote_reg_194 <= max_vote_fu_114_p3;
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
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln72_fu_84_p2)
    begin
        if (((icmp_ln72_fu_84_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_42)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_1 <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_42;
        end if; 
    end process;


    ap_sig_allocacmp_max_vote_1_load_assign_proc : process(ap_enable_reg_pp0_iter3, max_vote_reg_194, ap_block_pp0_stage0, max_vote_1_fu_38)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ap_sig_allocacmp_max_vote_1_load <= max_vote_reg_194;
        else 
            ap_sig_allocacmp_max_vote_1_load <= max_vote_1_fu_38;
        end if; 
    end process;

    i_2_fu_90_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv4_1));
    icmp_ln72_fu_84_p2 <= "1" when (ap_sig_allocacmp_i_1 = ap_const_lv4_A) else "0";
    icmp_ln74_fu_109_p2 <= "1" when (signed(votes_load_reg_183) > signed(ap_sig_allocacmp_max_vote_1_load)) else "0";
    max_label_1_fu_127_p3 <= 
        zext_ln77_fu_124_p1 when (icmp_ln74_reg_189(0) = '1') else 
        max_label_fu_34;
    max_label_out <= max_label_fu_34;

    max_label_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln72_reg_174_pp0_iter1_reg)
    begin
        if (((icmp_ln72_reg_174_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            max_label_out_ap_vld <= ap_const_logic_1;
        else 
            max_label_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    max_vote_fu_114_p3 <= 
        votes_load_reg_183 when (icmp_ln74_fu_109_p2(0) = '1') else 
        ap_sig_allocacmp_max_vote_1_load;
    votes_address0 <= zext_ln72_fu_96_p1(4 - 1 downto 0);

    votes_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            votes_ce0 <= ap_const_logic_1;
        else 
            votes_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln72_fu_96_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_1),64));
    zext_ln77_fu_124_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_1_reg_169_pp0_iter2_reg),8));
end behav;