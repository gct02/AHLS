-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DigitRec_DigitRec_Pipeline_SET_KNN_SET is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    labels_2_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    labels_1_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    labels_0_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    dists_2_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    dists_1_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    dists_0_0 : IN STD_LOGIC_VECTOR (31 downto 0);
    labels_2_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    labels_2_1_out_ap_vld : OUT STD_LOGIC;
    labels_1_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    labels_1_1_out_ap_vld : OUT STD_LOGIC;
    labels_0_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    labels_0_1_out_ap_vld : OUT STD_LOGIC;
    dists_2_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    dists_2_1_out_ap_vld : OUT STD_LOGIC;
    dists_1_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    dists_1_1_out_ap_vld : OUT STD_LOGIC;
    dists_0_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    dists_0_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of DigitRec_DigitRec_Pipeline_SET_KNN_SET is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_100 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100000000";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln99_fu_198_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal i_fu_54 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal add_ln99_fu_204_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i_3 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_3_load_fu_195_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal dists_0_1_fu_58 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal dists_1_1_fu_62 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal dists_2_1_fu_66 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal labels_0_1_fu_70 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal labels_1_1_fu_74 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal labels_2_1_fu_78 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_86 : BOOLEAN;
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
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    dists_0_1_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if (((i_3_load_fu_195_p1 = ap_const_lv2_0) and (icmp_ln99_fu_198_p2 = ap_const_lv1_0))) then 
                    dists_0_1_fu_58 <= ap_const_lv32_100;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    dists_0_1_fu_58 <= dists_0_0;
                end if;
            end if; 
        end if;
    end process;

    dists_1_1_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if (((i_3_load_fu_195_p1 = ap_const_lv2_1) and (icmp_ln99_fu_198_p2 = ap_const_lv1_0))) then 
                    dists_1_1_fu_62 <= ap_const_lv32_100;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    dists_1_1_fu_62 <= dists_1_0;
                end if;
            end if; 
        end if;
    end process;

    dists_2_1_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((ap_const_boolean_1 = ap_condition_86)) then 
                    dists_2_1_fu_66 <= ap_const_lv32_100;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    dists_2_1_fu_66 <= dists_2_0;
                end if;
            end if; 
        end if;
    end process;

    i_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln99_fu_198_p2 = ap_const_lv1_0)) then 
                    i_fu_54 <= add_ln99_fu_204_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_54 <= ap_const_lv2_0;
                end if;
            end if; 
        end if;
    end process;

    labels_0_1_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if (((i_3_load_fu_195_p1 = ap_const_lv2_0) and (icmp_ln99_fu_198_p2 = ap_const_lv1_0))) then 
                    labels_0_1_fu_70 <= ap_const_lv32_0;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    labels_0_1_fu_70 <= labels_0_0;
                end if;
            end if; 
        end if;
    end process;

    labels_1_1_fu_74_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if (((i_3_load_fu_195_p1 = ap_const_lv2_1) and (icmp_ln99_fu_198_p2 = ap_const_lv1_0))) then 
                    labels_1_1_fu_74 <= ap_const_lv32_0;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    labels_1_1_fu_74 <= labels_1_0;
                end if;
            end if; 
        end if;
    end process;

    labels_2_1_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((ap_const_boolean_1 = ap_condition_86)) then 
                    labels_2_1_fu_78 <= ap_const_lv32_0;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    labels_2_1_fu_78 <= labels_2_0;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln99_fu_204_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_3) + unsigned(ap_const_lv2_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_block_state1_pp0_stage0_iter0)
    begin
        if ((ap_const_boolean_1 = ap_block_state1_pp0_stage0_iter0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start_int = ap_const_logic_0);
    end process;


    ap_condition_86_assign_proc : process(icmp_ln99_fu_198_p2, i_3_load_fu_195_p1)
    begin
                ap_condition_86 <= (not((i_3_load_fu_195_p1 = ap_const_lv2_1)) and not((i_3_load_fu_195_p1 = ap_const_lv2_0)) and (icmp_ln99_fu_198_p2 = ap_const_lv1_0));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0)
    begin
        if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_3_assign_proc : process(ap_CS_fsm_state1, i_fu_54, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_i_3 <= ap_const_lv2_0;
        else 
            ap_sig_allocacmp_i_3 <= i_fu_54;
        end if; 
    end process;

    dists_0_1_out <= dists_0_1_fu_58;

    dists_0_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dists_0_1_out_ap_vld <= ap_const_logic_1;
        else 
            dists_0_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    dists_1_1_out <= dists_1_1_fu_62;

    dists_1_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dists_1_1_out_ap_vld <= ap_const_logic_1;
        else 
            dists_1_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    dists_2_1_out <= dists_2_1_fu_66;

    dists_2_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dists_2_1_out_ap_vld <= ap_const_logic_1;
        else 
            dists_2_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    i_3_load_fu_195_p1 <= ap_sig_allocacmp_i_3;
    icmp_ln99_fu_198_p2 <= "1" when (ap_sig_allocacmp_i_3 = ap_const_lv2_3) else "0";
    labels_0_1_out <= labels_0_1_fu_70;

    labels_0_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            labels_0_1_out_ap_vld <= ap_const_logic_1;
        else 
            labels_0_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    labels_1_1_out <= labels_1_1_fu_74;

    labels_1_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            labels_1_1_out_ap_vld <= ap_const_logic_1;
        else 
            labels_1_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    labels_2_1_out <= labels_2_1_fu_78;

    labels_2_1_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln99_fu_198_p2)
    begin
        if (((icmp_ln99_fu_198_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            labels_2_1_out_ap_vld <= ap_const_logic_1;
        else 
            labels_2_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;