-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_main_Pipeline_VITIS_LOOP_43_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    gold_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    gold_ce0 : OUT STD_LOGIC;
    gold_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    A_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    results_out : OUT STD_LOGIC_VECTOR (9 downto 0);
    results_out_ap_vld : OUT STD_LOGIC;
    grp_fu_110_p_din0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_110_p_din1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_110_p_opcode : OUT STD_LOGIC_VECTOR (4 downto 0);
    grp_fu_110_p_dout0 : IN STD_LOGIC_VECTOR (0 downto 0);
    grp_fu_110_p_ce : OUT STD_LOGIC );
end;


architecture behav of main_main_Pipeline_VITIS_LOOP_43_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv10_3E8 : STD_LOGIC_VECTOR (9 downto 0) := "1111101000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";

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
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln43_fu_102_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln43_reg_239 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln43_reg_239_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln43_reg_239_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln43_reg_239_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln43_reg_239_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal gold_load_reg_253 : STD_LOGIC_VECTOR (63 downto 0);
    signal A_load_reg_259 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln44_fu_159_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_reg_265 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_reg_265_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_reg_265_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_reg_265_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_1_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_1_reg_270 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_1_reg_270_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_1_reg_270_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_1_reg_270_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_2_fu_171_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_2_reg_275 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_2_reg_275_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_2_reg_275_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_2_reg_275_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_3_fu_177_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_3_reg_280 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_3_reg_280_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_3_reg_280_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_3_reg_280_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_285 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln43_fu_114_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal results_fu_44 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    signal results_1_fu_209_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_48 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    signal add_ln43_fu_108_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal bitcast_ln44_fu_125_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bitcast_ln44_1_fu_142_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_4_fu_128_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln44_fu_138_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_5_fu_145_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln44_1_fu_155_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal or_ln44_fu_186_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln44_1_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln44_fu_194_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln44_1_fu_200_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln44_fu_205_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage0_00001 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component main_dcmp_64ns_64ns_1_4_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component main_flow_control_loop_pipe_sequential_init IS
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
    flow_control_loop_pipe_sequential_init_U : component main_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter5_reg = ap_const_logic_1))) then 
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


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    i_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln43_fu_102_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_48 <= add_ln43_fu_108_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_48 <= ap_const_lv10_0;
                end if;
            end if; 
        end if;
    end process;

    results_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    results_fu_44 <= ap_const_lv10_0;
                elsif ((ap_enable_reg_pp0_iter6 = ap_const_logic_1)) then 
                    results_fu_44 <= results_1_fu_209_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                A_load_reg_259 <= A_q0;
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                gold_load_reg_253 <= gold_q0;
                icmp_ln43_reg_239 <= icmp_ln43_fu_102_p2;
                icmp_ln43_reg_239_pp0_iter1_reg <= icmp_ln43_reg_239;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                icmp_ln43_reg_239_pp0_iter2_reg <= icmp_ln43_reg_239_pp0_iter1_reg;
                icmp_ln43_reg_239_pp0_iter3_reg <= icmp_ln43_reg_239_pp0_iter2_reg;
                icmp_ln43_reg_239_pp0_iter4_reg <= icmp_ln43_reg_239_pp0_iter3_reg;
                icmp_ln44_1_reg_270 <= icmp_ln44_1_fu_165_p2;
                icmp_ln44_1_reg_270_pp0_iter3_reg <= icmp_ln44_1_reg_270;
                icmp_ln44_1_reg_270_pp0_iter4_reg <= icmp_ln44_1_reg_270_pp0_iter3_reg;
                icmp_ln44_1_reg_270_pp0_iter5_reg <= icmp_ln44_1_reg_270_pp0_iter4_reg;
                icmp_ln44_2_reg_275 <= icmp_ln44_2_fu_171_p2;
                icmp_ln44_2_reg_275_pp0_iter3_reg <= icmp_ln44_2_reg_275;
                icmp_ln44_2_reg_275_pp0_iter4_reg <= icmp_ln44_2_reg_275_pp0_iter3_reg;
                icmp_ln44_2_reg_275_pp0_iter5_reg <= icmp_ln44_2_reg_275_pp0_iter4_reg;
                icmp_ln44_3_reg_280 <= icmp_ln44_3_fu_177_p2;
                icmp_ln44_3_reg_280_pp0_iter3_reg <= icmp_ln44_3_reg_280;
                icmp_ln44_3_reg_280_pp0_iter4_reg <= icmp_ln44_3_reg_280_pp0_iter3_reg;
                icmp_ln44_3_reg_280_pp0_iter5_reg <= icmp_ln44_3_reg_280_pp0_iter4_reg;
                icmp_ln44_reg_265 <= icmp_ln44_fu_159_p2;
                icmp_ln44_reg_265_pp0_iter3_reg <= icmp_ln44_reg_265;
                icmp_ln44_reg_265_pp0_iter4_reg <= icmp_ln44_reg_265_pp0_iter3_reg;
                icmp_ln44_reg_265_pp0_iter5_reg <= icmp_ln44_reg_265_pp0_iter4_reg;
                tmp_6_reg_285 <= grp_fu_110_p_dout0;
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
    A_address0 <= zext_ln43_fu_114_p1(10 - 1 downto 0);

    A_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            A_ce0 <= ap_const_logic_1;
        else 
            A_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln43_fu_108_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv10_1));
    and_ln44_1_fu_200_p2 <= (tmp_6_reg_285 and and_ln44_fu_194_p2);
    and_ln44_fu_194_p2 <= (or_ln44_fu_186_p2 and or_ln44_1_fu_190_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_00001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln43_fu_102_p2)
    begin
        if (((icmp_ln43_fu_102_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter5_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter5_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6)
    begin
        if (((ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_48)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_1 <= ap_const_lv10_0;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_48;
        end if; 
    end process;

    bitcast_ln44_1_fu_142_p1 <= A_load_reg_259;
    bitcast_ln44_fu_125_p1 <= gold_load_reg_253;
    gold_address0 <= zext_ln43_fu_114_p1(10 - 1 downto 0);

    gold_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            gold_ce0 <= ap_const_logic_1;
        else 
            gold_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_110_p_ce <= ap_const_logic_1;
    grp_fu_110_p_din0 <= gold_load_reg_253;
    grp_fu_110_p_din1 <= A_load_reg_259;
    grp_fu_110_p_opcode <= ap_const_lv5_1;
    icmp_ln43_fu_102_p2 <= "1" when (ap_sig_allocacmp_i_1 = ap_const_lv10_3E8) else "0";
    icmp_ln44_1_fu_165_p2 <= "1" when (trunc_ln44_fu_138_p1 = ap_const_lv52_0) else "0";
    icmp_ln44_2_fu_171_p2 <= "0" when (tmp_5_fu_145_p4 = ap_const_lv11_7FF) else "1";
    icmp_ln44_3_fu_177_p2 <= "1" when (trunc_ln44_1_fu_155_p1 = ap_const_lv52_0) else "0";
    icmp_ln44_fu_159_p2 <= "0" when (tmp_4_fu_128_p4 = ap_const_lv11_7FF) else "1";
    or_ln44_1_fu_190_p2 <= (icmp_ln44_3_reg_280_pp0_iter5_reg or icmp_ln44_2_reg_275_pp0_iter5_reg);
    or_ln44_fu_186_p2 <= (icmp_ln44_reg_265_pp0_iter5_reg or icmp_ln44_1_reg_270_pp0_iter5_reg);
    results_1_fu_209_p2 <= std_logic_vector(unsigned(zext_ln44_fu_205_p1) + unsigned(results_fu_44));
    results_out <= results_fu_44;

    results_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln43_reg_239_pp0_iter4_reg)
    begin
        if (((icmp_ln43_reg_239_pp0_iter4_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            results_out_ap_vld <= ap_const_logic_1;
        else 
            results_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_4_fu_128_p4 <= bitcast_ln44_fu_125_p1(62 downto 52);
    tmp_5_fu_145_p4 <= bitcast_ln44_1_fu_142_p1(62 downto 52);
    trunc_ln44_1_fu_155_p1 <= bitcast_ln44_1_fu_142_p1(52 - 1 downto 0);
    trunc_ln44_fu_138_p1 <= bitcast_ln44_fu_125_p1(52 - 1 downto 0);
    zext_ln43_fu_114_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_1),64));
    zext_ln44_fu_205_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(and_ln44_1_fu_200_p2),10));
end behav;