-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_main_Pipeline_VITIS_LOOP_26_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    dysq_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    dysq_ce0 : OUT STD_LOGIC;
    dysq_we0 : OUT STD_LOGIC;
    dysq_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    y_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    y_ce0 : OUT STD_LOGIC;
    y_we0 : OUT STD_LOGIC;
    y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    conv11_i1730_out : OUT STD_LOGIC_VECTOR (15 downto 0);
    conv11_i1730_out_ap_vld : OUT STD_LOGIC;
    grp_fu_86_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_86_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_86_p_ce : OUT STD_LOGIC );
end;


architecture behav of main_main_Pipeline_VITIS_LOOP_26_1 is 
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
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln26_fu_118_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_2_reg_300 : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter1_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter2_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter3_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter4_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter5_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter6_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal i_2_reg_300_pp0_iter7_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal icmp_ln26_reg_305 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_305_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal lshr_ln11_3_reg_309 : STD_LOGIC_VECTOR (14 downto 0);
    signal xor_ln11_2_fu_183_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_2_reg_314 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln11_1_fu_241_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_ln11_1_reg_319 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln28_fu_272_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_99_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv_reg_334 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2_reg_339 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln26_fu_276_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal i_fu_58 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal add_ln26_fu_124_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i_2 : STD_LOGIC_VECTOR (10 downto 0);
    signal conv11_i1730_fu_62 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal ap_sig_allocacmp_conv11_i1730_load : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal grp_fu_99_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_145_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_153_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_1_fu_171_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_137_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_fu_177_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln11_fu_133_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_197_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_fu_189_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_205_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_4_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_3_fu_223_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln11_5_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_213_p4 : STD_LOGIC_VECTOR (13 downto 0);
    signal or_ln_fu_261_p3 : STD_LOGIC_VECTOR (15 downto 0);
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
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component main_uitofp_32ns_32_7_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
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
    uitofp_32ns_32_7_no_dsp_1_U1 : component main_uitofp_32ns_32_7_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 7,
        din0_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_99_p0,
        ce => ap_const_logic_1,
        dout => grp_fu_99_p1);

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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1))) then 
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


    conv11_i1730_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln26_fu_118_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    conv11_i1730_fu_62 <= or_ln11_1_fu_241_p4;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    conv11_i1730_fu_62 <= ap_const_lv16_ACE1;
                end if;
            end if; 
        end if;
    end process;

    i_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln26_fu_118_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_58 <= add_ln26_fu_124_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_58 <= ap_const_lv11_0;
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
                i_2_reg_300 <= ap_sig_allocacmp_i_2;
                i_2_reg_300_pp0_iter1_reg <= i_2_reg_300;
                icmp_ln26_reg_305 <= icmp_ln26_fu_118_p2;
                icmp_ln26_reg_305_pp0_iter1_reg <= icmp_ln26_reg_305;
                lshr_ln11_3_reg_309 <= ap_sig_allocacmp_conv11_i1730_load(15 downto 1);
                or_ln11_1_reg_319 <= or_ln11_1_fu_241_p4;
                xor_ln11_2_reg_314 <= xor_ln11_2_fu_183_p2;
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
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
                conv2_reg_339 <= grp_fu_86_p_dout0;
                conv_reg_334 <= grp_fu_99_p1;
                i_2_reg_300_pp0_iter2_reg <= i_2_reg_300_pp0_iter1_reg;
                i_2_reg_300_pp0_iter3_reg <= i_2_reg_300_pp0_iter2_reg;
                i_2_reg_300_pp0_iter4_reg <= i_2_reg_300_pp0_iter3_reg;
                i_2_reg_300_pp0_iter5_reg <= i_2_reg_300_pp0_iter4_reg;
                i_2_reg_300_pp0_iter6_reg <= i_2_reg_300_pp0_iter5_reg;
                i_2_reg_300_pp0_iter7_reg <= i_2_reg_300_pp0_iter6_reg;
                icmp_ln26_reg_305_pp0_iter2_reg <= icmp_ln26_reg_305_pp0_iter1_reg;
                icmp_ln26_reg_305_pp0_iter3_reg <= icmp_ln26_reg_305_pp0_iter2_reg;
                icmp_ln26_reg_305_pp0_iter4_reg <= icmp_ln26_reg_305_pp0_iter3_reg;
                icmp_ln26_reg_305_pp0_iter5_reg <= icmp_ln26_reg_305_pp0_iter4_reg;
                icmp_ln26_reg_305_pp0_iter6_reg <= icmp_ln26_reg_305_pp0_iter5_reg;
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
    add_ln26_fu_124_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_2) + unsigned(ap_const_lv11_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln26_fu_118_p2)
    begin
        if (((icmp_ln26_fu_118_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter7_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_conv11_i1730_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, conv11_i1730_fu_62)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_conv11_i1730_load <= ap_const_lv16_ACE1;
        else 
            ap_sig_allocacmp_conv11_i1730_load <= conv11_i1730_fu_62;
        end if; 
    end process;


    ap_sig_allocacmp_i_2_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, i_fu_58, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_2 <= ap_const_lv11_0;
        else 
            ap_sig_allocacmp_i_2 <= i_fu_58;
        end if; 
    end process;

    conv11_i1730_out <= conv11_i1730_fu_62;

    conv11_i1730_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_305_pp0_iter6_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_305_pp0_iter6_reg = ap_const_lv1_1))) then 
            conv11_i1730_out_ap_vld <= ap_const_logic_1;
        else 
            conv11_i1730_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    dysq_address0 <= zext_ln26_fu_276_p1(10 - 1 downto 0);

    dysq_ce0_assign_proc : process(ap_enable_reg_pp0_iter8, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1))) then 
            dysq_ce0 <= ap_const_logic_1;
        else 
            dysq_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dysq_d0 <= conv_reg_334;

    dysq_we0_assign_proc : process(ap_enable_reg_pp0_iter8, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1))) then 
            dysq_we0 <= ap_const_logic_1;
        else 
            dysq_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_86_p_ce <= ap_const_logic_1;
    grp_fu_86_p_din0 <= zext_ln28_fu_272_p1;
    grp_fu_99_p0 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln_fu_261_p3),32));
    icmp_ln26_fu_118_p2 <= "1" when (ap_sig_allocacmp_i_2 = ap_const_lv11_400) else "0";
    or_ln11_1_fu_241_p4 <= ((xor_ln11_5_fu_235_p2 & xor_ln11_2_fu_183_p2) & tmp_fu_213_p4);
    or_ln_fu_261_p3 <= (xor_ln11_2_reg_314 & lshr_ln11_3_reg_309);
    tmp_3_fu_137_p3 <= ap_sig_allocacmp_conv11_i1730_load(3 downto 3);
    tmp_4_fu_145_p3 <= ap_sig_allocacmp_conv11_i1730_load(2 downto 2);
    tmp_5_fu_153_p3 <= ap_sig_allocacmp_conv11_i1730_load(5 downto 5);
    tmp_6_fu_189_p3 <= ap_sig_allocacmp_conv11_i1730_load(1 downto 1);
    tmp_7_fu_197_p3 <= ap_sig_allocacmp_conv11_i1730_load(6 downto 6);
    tmp_8_fu_205_p3 <= ap_sig_allocacmp_conv11_i1730_load(4 downto 4);
    tmp_fu_213_p4 <= ap_sig_allocacmp_conv11_i1730_load(15 downto 2);
    trunc_ln11_fu_133_p1 <= ap_sig_allocacmp_conv11_i1730_load(1 - 1 downto 0);
    xor_ln11_1_fu_171_p2 <= (tmp_5_fu_153_p3 xor tmp_4_fu_145_p3);
    xor_ln11_2_fu_183_p2 <= (xor_ln11_fu_177_p2 xor trunc_ln11_fu_133_p1);
    xor_ln11_3_fu_223_p2 <= (tmp_7_fu_197_p3 xor tmp_6_fu_189_p3);
    xor_ln11_4_fu_229_p2 <= (tmp_8_fu_205_p3 xor tmp_3_fu_137_p3);
    xor_ln11_5_fu_235_p2 <= (xor_ln11_4_fu_229_p2 xor xor_ln11_3_fu_223_p2);
    xor_ln11_fu_177_p2 <= (xor_ln11_1_fu_171_p2 xor tmp_3_fu_137_p3);
    y_address0 <= zext_ln26_fu_276_p1(10 - 1 downto 0);

    y_ce0_assign_proc : process(ap_enable_reg_pp0_iter8, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1))) then 
            y_ce0 <= ap_const_logic_1;
        else 
            y_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    y_d0 <= conv2_reg_339;

    y_we0_assign_proc : process(ap_enable_reg_pp0_iter8, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1))) then 
            y_we0 <= ap_const_logic_1;
        else 
            y_we0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln26_fu_276_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_2_reg_300_pp0_iter7_reg),64));
    zext_ln28_fu_272_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln11_1_reg_319),32));
end behav;