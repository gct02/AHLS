-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SgdLR_SgdLR_Pipeline_GRAD is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    shl_ln : IN STD_LOGIC_VECTOR (16 downto 0);
    data_address0 : OUT STD_LOGIC_VECTOR (16 downto 0);
    data_ce0 : OUT STD_LOGIC;
    data_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    scale_assign : IN STD_LOGIC_VECTOR (31 downto 0);
    gradient_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    gradient_ce0 : OUT STD_LOGIC;
    gradient_we0 : OUT STD_LOGIC;
    gradient_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_305_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_305_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_305_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_305_p_ce : OUT STD_LOGIC );
end;


architecture behav of SgdLR_SgdLR_Pipeline_GRAD is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv11_400 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";

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
    signal icmp_ln35_fu_96_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_reg_148 : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_148_pp0_iter1_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_148_pp0_iter2_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_148_pp0_iter3_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_148_pp0_iter4_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_reg_148_pp0_iter5_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal data_load_reg_162 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln36_fu_128_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_i8_reg_172 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln36_fu_118_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln35_fu_132_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_1_fu_42 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal add_ln35_fu_102_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln35_1_fu_108_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln36_fu_112_p2 : STD_LOGIC_VECTOR (16 downto 0);
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

    component SgdLR_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component SgdLR_flow_control_loop_pipe_sequential_init IS
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
    flow_control_loop_pipe_sequential_init_U : component SgdLR_flow_control_loop_pipe_sequential_init
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


    i_1_fu_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln35_fu_96_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_1_fu_42 <= add_ln35_fu_102_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_1_fu_42 <= ap_const_lv11_0;
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
                data_load_reg_162 <= data_q0;
                i_reg_148 <= ap_sig_allocacmp_i;
                i_reg_148_pp0_iter1_reg <= i_reg_148;
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
                i_reg_148_pp0_iter2_reg <= i_reg_148_pp0_iter1_reg;
                i_reg_148_pp0_iter3_reg <= i_reg_148_pp0_iter2_reg;
                i_reg_148_pp0_iter4_reg <= i_reg_148_pp0_iter3_reg;
                i_reg_148_pp0_iter5_reg <= i_reg_148_pp0_iter4_reg;
                mul_i8_reg_172 <= grp_fu_305_p_dout0;
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
    add_ln35_fu_102_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i) + unsigned(ap_const_lv11_1));
    add_ln36_fu_112_p2 <= std_logic_vector(unsigned(zext_ln35_1_fu_108_p1) + unsigned(shl_ln));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln35_fu_96_p2)
    begin
        if (((icmp_ln35_fu_96_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_i_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, i_1_fu_42, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i <= ap_const_lv11_0;
        else 
            ap_sig_allocacmp_i <= i_1_fu_42;
        end if; 
    end process;

    bitcast_ln36_fu_128_p1 <= data_load_reg_162;
    data_address0 <= zext_ln36_fu_118_p1(17 - 1 downto 0);

    data_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            data_ce0 <= ap_const_logic_1;
        else 
            data_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    gradient_address0 <= zext_ln35_fu_132_p1(10 - 1 downto 0);

    gradient_ce0_assign_proc : process(ap_enable_reg_pp0_iter6, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter6 = ap_const_logic_1))) then 
            gradient_ce0 <= ap_const_logic_1;
        else 
            gradient_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    gradient_d0 <= mul_i8_reg_172;

    gradient_we0_assign_proc : process(ap_enable_reg_pp0_iter6, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter6 = ap_const_logic_1))) then 
            gradient_we0 <= ap_const_logic_1;
        else 
            gradient_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_305_p_ce <= ap_const_logic_1;
    grp_fu_305_p_din0 <= scale_assign;
    grp_fu_305_p_din1 <= bitcast_ln36_fu_128_p1;
    icmp_ln35_fu_96_p2 <= "1" when (ap_sig_allocacmp_i = ap_const_lv11_400) else "0";
    zext_ln35_1_fu_108_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i),17));
    zext_ln35_fu_132_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_148_pp0_iter5_reg),64));
    zext_ln36_fu_118_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln36_fu_112_p2),64));
end behav;