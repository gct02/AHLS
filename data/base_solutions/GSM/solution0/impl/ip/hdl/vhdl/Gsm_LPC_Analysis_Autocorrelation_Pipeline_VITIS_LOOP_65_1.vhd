-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Gsm_LPC_Analysis_Autocorrelation_Pipeline_VITIS_LOOP_65_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    indata_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    indata_ce0 : OUT STD_LOGIC;
    indata_we0 : OUT STD_LOGIC;
    indata_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    indata_address1 : OUT STD_LOGIC_VECTOR (7 downto 0);
    indata_ce1 : OUT STD_LOGIC;
    indata_q1 : IN STD_LOGIC_VECTOR (15 downto 0);
    cmp_i68 : IN STD_LOGIC_VECTOR (0 downto 0);
    empty : IN STD_LOGIC_VECTOR (14 downto 0) );
end;


architecture behav of Gsm_LPC_Analysis_Autocorrelation_Pipeline_VITIS_LOOP_65_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv8_A0 : STD_LOGIC_VECTOR (7 downto 0) := "10100000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv16_8000 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv16_7FFF : STD_LOGIC_VECTOR (15 downto 0) := "0111111111111111";
    constant ap_const_lv31_4000 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000100000000000000";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln65_fu_97_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal p_cast_fu_85_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal p_cast_reg_171 : STD_LOGIC_VECTOR (30 downto 0);
    signal indata_addr_reg_180 : STD_LOGIC_VECTOR (7 downto 0);
    signal indata_addr_reg_180_pp0_iter1_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal indata_addr_reg_180_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal indata_addr_reg_180_pp0_iter3_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln55_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_reg_186 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_reg_186_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_reg_186_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln65_fu_109_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal k_2_fu_52 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal add_ln65_fu_103_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_k : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln55_fu_119_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln9_fu_133_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal grp_fu_151_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal and_ln55_fu_129_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln9_fu_133_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_151_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_151_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component Gsm_LPC_Analysis_mac_muladd_16s_15ns_15ns_31_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (30 downto 0) );
    end component;


    component Gsm_LPC_Analysis_flow_control_loop_pipe_sequential_init IS
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
    mac_muladd_16s_15ns_15ns_31_4_1_U3 : component Gsm_LPC_Analysis_mac_muladd_16s_15ns_15ns_31_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 15,
        din2_WIDTH => 15,
        dout_WIDTH => 31)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => indata_q1,
        din1 => grp_fu_151_p1,
        din2 => grp_fu_151_p2,
        ce => ap_const_logic_1,
        dout => grp_fu_151_p3);

    flow_control_loop_pipe_sequential_init_U : component Gsm_LPC_Analysis_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
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


    k_2_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln65_fu_97_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    k_2_fu_52 <= add_ln65_fu_103_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    k_2_fu_52 <= ap_const_lv8_0;
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
                icmp_ln55_reg_186 <= icmp_ln55_fu_119_p2;
                indata_addr_reg_180 <= zext_ln65_fu_109_p1(8 - 1 downto 0);
                indata_addr_reg_180_pp0_iter1_reg <= indata_addr_reg_180;
                    p_cast_reg_171(14 downto 0) <= p_cast_fu_85_p1(14 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                icmp_ln55_reg_186_pp0_iter2_reg <= icmp_ln55_reg_186;
                icmp_ln55_reg_186_pp0_iter3_reg <= icmp_ln55_reg_186_pp0_iter2_reg;
                indata_addr_reg_180_pp0_iter2_reg <= indata_addr_reg_180_pp0_iter1_reg;
                indata_addr_reg_180_pp0_iter3_reg <= indata_addr_reg_180_pp0_iter2_reg;
            end if;
        end if;
    end process;
    p_cast_reg_171(30 downto 15) <= "0000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln65_fu_103_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_k) + unsigned(ap_const_lv8_1));
    and_ln55_fu_129_p2 <= (icmp_ln55_reg_186_pp0_iter3_reg and cmp_i68);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln65_fu_97_p2)
    begin
        if (((icmp_ln65_fu_97_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter3_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        if (((ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_k_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, k_2_fu_52, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_k <= ap_const_lv8_0;
        else 
            ap_sig_allocacmp_k <= k_2_fu_52;
        end if; 
    end process;

    grp_fu_151_p1 <= p_cast_reg_171(15 - 1 downto 0);
    grp_fu_151_p2 <= ap_const_lv31_4000(15 - 1 downto 0);
    icmp_ln55_fu_119_p0 <= indata_q1;
    icmp_ln55_fu_119_p2 <= "1" when (icmp_ln55_fu_119_p0 = ap_const_lv16_8000) else "0";
    icmp_ln65_fu_97_p2 <= "1" when (ap_sig_allocacmp_k = ap_const_lv8_A0) else "0";
    indata_address0 <= indata_addr_reg_180_pp0_iter3_reg;
    indata_address1 <= zext_ln65_fu_109_p1(8 - 1 downto 0);

    indata_ce0_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            indata_ce0 <= ap_const_logic_1;
        else 
            indata_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    indata_ce1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            indata_ce1 <= ap_const_logic_1;
        else 
            indata_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    indata_d0 <= 
        ap_const_lv16_7FFF when (and_ln55_fu_129_p2(0) = '1') else 
        trunc_ln9_fu_133_p4;

    indata_we0_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            indata_we0 <= ap_const_logic_1;
        else 
            indata_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_cast_fu_85_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(empty),31));
    trunc_ln9_fu_133_p1 <= grp_fu_151_p3;
    trunc_ln9_fu_133_p4 <= trunc_ln9_fu_133_p1(30 downto 15);
    zext_ln65_fu_109_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_k),64));
end behav;
