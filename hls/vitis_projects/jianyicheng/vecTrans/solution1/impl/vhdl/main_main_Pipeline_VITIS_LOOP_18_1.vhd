-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_main_Pipeline_VITIS_LOOP_18_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    A_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_we0 : OUT STD_LOGIC;
    A_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    b_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    b_ce0 : OUT STD_LOGIC;
    b_we0 : OUT STD_LOGIC;
    b_d0 : OUT STD_LOGIC_VECTOR (9 downto 0) );
end;


architecture behav of main_main_Pipeline_VITIS_LOOP_18_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv16_ACE1 : STD_LOGIC_VECTOR (15 downto 0) := "1010110011100001";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv11_400 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv10_32 : STD_LOGIC_VECTOR (9 downto 0) := "0000110010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv6_27 : STD_LOGIC_VECTOR (5 downto 0) := "100111";

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
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter9 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter10 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter11 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter12 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter13 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter14 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter15 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln18_fu_101_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal j_1_reg_242 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal zext_ln18_fu_131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter2_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter3_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter4_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter5_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter6_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter7_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter8_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter9_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter10_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter11_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter12_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter13_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln18_reg_256_pp0_iter14_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_117_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal rem_urem_reg_261 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln19_fu_218_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln19_reg_266 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal j_fu_54 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal add_ln18_fu_107_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_j_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal conv11_i5_fu_58 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal or_ln_fu_191_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_117_p0 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_fu_117_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_1_fu_147_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_155_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_1_fu_173_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_139_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_fu_179_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln11_fu_135_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_2_fu_185_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal lshr_ln11_3_fu_163_p4 : STD_LOGIC_VECTOR (14 downto 0);
    signal trunc_ln19_fu_215_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter7_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter8_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter9_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter10_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter11_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter12_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter13_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter14_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component main_urem_10ns_7ns_6_14_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (9 downto 0);
        din1 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (5 downto 0) );
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
    urem_10ns_7ns_6_14_1_U1 : component main_urem_10ns_7ns_6_14_1
    generic map (
        ID => 1,
        NUM_STAGE => 14,
        din0_WIDTH => 10,
        din1_WIDTH => 7,
        dout_WIDTH => 6)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_117_p0,
        din1 => grp_fu_117_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_117_p2);

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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter14_reg = ap_const_logic_1))) then 
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


    ap_enable_reg_pp0_iter10_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter10 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter11_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter11 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter12_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter12 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter13_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter13 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter14_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter14 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter15_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter15 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
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


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter9_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter9 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
                end if; 
            end if;
        end if;
    end process;


    conv11_i5_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    conv11_i5_fu_58 <= ap_const_lv16_ACE1;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    conv11_i5_fu_58 <= or_ln_fu_191_p3;
                end if;
            end if; 
        end if;
    end process;

    j_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln18_fu_101_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    j_fu_54 <= add_ln18_fu_107_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_54 <= ap_const_lv11_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                add_ln19_reg_266 <= add_ln19_fu_218_p2;
                ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
                ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
                ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
                ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
                ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
                ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
                ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
                rem_urem_reg_261 <= grp_fu_117_p2;
                    zext_ln18_reg_256_pp0_iter10_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter9_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter11_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter10_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter12_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter11_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter13_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter12_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter14_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter13_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter2_reg(10 downto 0) <= zext_ln18_reg_256(10 downto 0);
                    zext_ln18_reg_256_pp0_iter3_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter2_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter4_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter3_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter5_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter4_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter6_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter5_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter7_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter6_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter8_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter7_reg(10 downto 0);
                    zext_ln18_reg_256_pp0_iter9_reg(10 downto 0) <= zext_ln18_reg_256_pp0_iter8_reg(10 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                j_1_reg_242 <= ap_sig_allocacmp_j_1;
                    zext_ln18_reg_256(10 downto 0) <= zext_ln18_fu_131_p1(10 downto 0);
            end if;
        end if;
    end process;
    zext_ln18_reg_256(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter2_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter3_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter4_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter5_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter6_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter7_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter8_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter9_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter10_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter11_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter12_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter13_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    zext_ln18_reg_256_pp0_iter14_reg(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    A_address0 <= zext_ln18_reg_256_pp0_iter14_reg(10 - 1 downto 0);

    A_ce0_assign_proc : process(ap_enable_reg_pp0_iter15, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter15 = ap_const_logic_1))) then 
            A_ce0 <= ap_const_logic_1;
        else 
            A_ce0 <= ap_const_logic_0;
        end if; 
    end process;

        A_d0 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln19_reg_266),32));


    A_we0_assign_proc : process(ap_enable_reg_pp0_iter15, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter15 = ap_const_logic_1))) then 
            A_we0 <= ap_const_logic_1;
        else 
            A_we0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln18_fu_107_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_j_1) + unsigned(ap_const_lv11_1));
    add_ln19_fu_218_p2 <= std_logic_vector(unsigned(trunc_ln19_fu_215_p1) + unsigned(ap_const_lv6_27));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln18_fu_101_p2)
    begin
        if (((icmp_ln18_fu_101_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter14_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter14_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter9, ap_enable_reg_pp0_iter10, ap_enable_reg_pp0_iter11, ap_enable_reg_pp0_iter12, ap_enable_reg_pp0_iter13, ap_enable_reg_pp0_iter14, ap_enable_reg_pp0_iter15)
    begin
        if (((ap_enable_reg_pp0_iter15 = ap_const_logic_0) and (ap_enable_reg_pp0_iter14 = ap_const_logic_0) and (ap_enable_reg_pp0_iter13 = ap_const_logic_0) and (ap_enable_reg_pp0_iter12 = ap_const_logic_0) and (ap_enable_reg_pp0_iter11 = ap_const_logic_0) and (ap_enable_reg_pp0_iter10 = ap_const_logic_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_j_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, j_fu_54, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_j_1 <= ap_const_lv11_0;
        else 
            ap_sig_allocacmp_j_1 <= j_fu_54;
        end if; 
    end process;

    b_address0 <= zext_ln18_fu_131_p1(10 - 1 downto 0);

    b_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_ce0 <= ap_const_logic_1;
        else 
            b_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    b_d0 <= conv11_i5_fu_58(10 downto 1);

    b_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_we0 <= ap_const_logic_1;
        else 
            b_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_117_p0 <= ap_sig_allocacmp_j_1(10 - 1 downto 0);
    grp_fu_117_p1 <= ap_const_lv10_32(7 - 1 downto 0);
    icmp_ln18_fu_101_p2 <= "1" when (ap_sig_allocacmp_j_1 = ap_const_lv11_400) else "0";
    lshr_ln11_3_fu_163_p4 <= conv11_i5_fu_58(15 downto 1);
    or_ln_fu_191_p3 <= (xor_ln11_2_fu_185_p2 & lshr_ln11_3_fu_163_p4);
    tmp_1_fu_147_p3 <= conv11_i5_fu_58(2 downto 2);
    tmp_2_fu_155_p3 <= conv11_i5_fu_58(5 downto 5);
    tmp_fu_139_p3 <= conv11_i5_fu_58(3 downto 3);
    trunc_ln11_fu_135_p1 <= conv11_i5_fu_58(1 - 1 downto 0);
    trunc_ln19_fu_215_p1 <= rem_urem_reg_261(6 - 1 downto 0);
    xor_ln11_1_fu_173_p2 <= (tmp_2_fu_155_p3 xor tmp_1_fu_147_p3);
    xor_ln11_2_fu_185_p2 <= (xor_ln11_fu_179_p2 xor trunc_ln11_fu_135_p1);
    xor_ln11_fu_179_p2 <= (xor_ln11_1_fu_173_p2 xor tmp_fu_139_p3);
    zext_ln18_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_1_reg_242),64));
end behav;