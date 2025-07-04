-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aes_main is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    statemt_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    statemt_ce0 : OUT STD_LOGIC;
    statemt_we0 : OUT STD_LOGIC;
    statemt_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    statemt_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    statemt_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
    statemt_ce1 : OUT STD_LOGIC;
    statemt_we1 : OUT STD_LOGIC;
    statemt_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    statemt_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    key_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    key_ce0 : OUT STD_LOGIC;
    key_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of aes_main is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "aes_main_aes_main,hls_ip_2023_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.977500,HLS_SYN_LAT=2634,HLS_SYN_TPT=none,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=1666,HLS_SYN_LUT=8442,HLS_VERSION=2023_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal word_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal word_ce0 : STD_LOGIC;
    signal word_we0 : STD_LOGIC;
    signal word_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal word_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal word_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal word_ce1 : STD_LOGIC;
    signal word_q1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_encrypt_fu_34_ap_start : STD_LOGIC;
    signal grp_encrypt_fu_34_ap_done : STD_LOGIC;
    signal grp_encrypt_fu_34_ap_idle : STD_LOGIC;
    signal grp_encrypt_fu_34_ap_ready : STD_LOGIC;
    signal grp_encrypt_fu_34_statemt_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_encrypt_fu_34_statemt_ce0 : STD_LOGIC;
    signal grp_encrypt_fu_34_statemt_we0 : STD_LOGIC;
    signal grp_encrypt_fu_34_statemt_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_encrypt_fu_34_statemt_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_encrypt_fu_34_statemt_ce1 : STD_LOGIC;
    signal grp_encrypt_fu_34_statemt_we1 : STD_LOGIC;
    signal grp_encrypt_fu_34_statemt_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_encrypt_fu_34_key_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_encrypt_fu_34_key_ce0 : STD_LOGIC;
    signal grp_encrypt_fu_34_word_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_encrypt_fu_34_word_ce0 : STD_LOGIC;
    signal grp_encrypt_fu_34_word_we0 : STD_LOGIC;
    signal grp_encrypt_fu_34_word_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_encrypt_fu_34_word_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_encrypt_fu_34_word_ce1 : STD_LOGIC;
    signal grp_decrypt_fu_50_ap_start : STD_LOGIC;
    signal grp_decrypt_fu_50_ap_done : STD_LOGIC;
    signal grp_decrypt_fu_50_ap_idle : STD_LOGIC;
    signal grp_decrypt_fu_50_ap_ready : STD_LOGIC;
    signal grp_decrypt_fu_50_statemt_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_decrypt_fu_50_statemt_ce0 : STD_LOGIC;
    signal grp_decrypt_fu_50_statemt_we0 : STD_LOGIC;
    signal grp_decrypt_fu_50_statemt_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_decrypt_fu_50_statemt_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_decrypt_fu_50_statemt_ce1 : STD_LOGIC;
    signal grp_decrypt_fu_50_statemt_we1 : STD_LOGIC;
    signal grp_decrypt_fu_50_statemt_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_decrypt_fu_50_key_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_decrypt_fu_50_key_ce0 : STD_LOGIC;
    signal grp_decrypt_fu_50_word_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_decrypt_fu_50_word_ce0 : STD_LOGIC;
    signal grp_decrypt_fu_50_word_we0 : STD_LOGIC;
    signal grp_decrypt_fu_50_word_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_decrypt_fu_50_word_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_decrypt_fu_50_word_ce1 : STD_LOGIC;
    signal grp_encrypt_fu_34_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_decrypt_fu_50_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component aes_main_encrypt IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        statemt_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        statemt_ce0 : OUT STD_LOGIC;
        statemt_we0 : OUT STD_LOGIC;
        statemt_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        statemt_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        statemt_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
        statemt_ce1 : OUT STD_LOGIC;
        statemt_we1 : OUT STD_LOGIC;
        statemt_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        statemt_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        key_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        key_ce0 : OUT STD_LOGIC;
        key_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        word_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        word_ce0 : OUT STD_LOGIC;
        word_we0 : OUT STD_LOGIC;
        word_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        word_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        word_address1 : OUT STD_LOGIC_VECTOR (8 downto 0);
        word_ce1 : OUT STD_LOGIC;
        word_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component aes_main_decrypt IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        statemt_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        statemt_ce0 : OUT STD_LOGIC;
        statemt_we0 : OUT STD_LOGIC;
        statemt_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        statemt_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        statemt_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
        statemt_ce1 : OUT STD_LOGIC;
        statemt_we1 : OUT STD_LOGIC;
        statemt_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        statemt_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
        key_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        key_ce0 : OUT STD_LOGIC;
        key_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        word_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        word_ce0 : OUT STD_LOGIC;
        word_we0 : OUT STD_LOGIC;
        word_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        word_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        word_address1 : OUT STD_LOGIC_VECTOR (8 downto 0);
        word_ce1 : OUT STD_LOGIC;
        word_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component aes_main_word_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        address1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    word_U : component aes_main_word_RAM_AUTO_1R1W
    generic map (
        DataWidth => 32,
        AddressRange => 480,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => word_address0,
        ce0 => word_ce0,
        we0 => word_we0,
        d0 => word_d0,
        q0 => word_q0,
        address1 => word_address1,
        ce1 => word_ce1,
        q1 => word_q1);

    grp_encrypt_fu_34 : component aes_main_encrypt
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_encrypt_fu_34_ap_start,
        ap_done => grp_encrypt_fu_34_ap_done,
        ap_idle => grp_encrypt_fu_34_ap_idle,
        ap_ready => grp_encrypt_fu_34_ap_ready,
        statemt_address0 => grp_encrypt_fu_34_statemt_address0,
        statemt_ce0 => grp_encrypt_fu_34_statemt_ce0,
        statemt_we0 => grp_encrypt_fu_34_statemt_we0,
        statemt_d0 => grp_encrypt_fu_34_statemt_d0,
        statemt_q0 => statemt_q0,
        statemt_address1 => grp_encrypt_fu_34_statemt_address1,
        statemt_ce1 => grp_encrypt_fu_34_statemt_ce1,
        statemt_we1 => grp_encrypt_fu_34_statemt_we1,
        statemt_d1 => grp_encrypt_fu_34_statemt_d1,
        statemt_q1 => statemt_q1,
        key_address0 => grp_encrypt_fu_34_key_address0,
        key_ce0 => grp_encrypt_fu_34_key_ce0,
        key_q0 => key_q0,
        word_address0 => grp_encrypt_fu_34_word_address0,
        word_ce0 => grp_encrypt_fu_34_word_ce0,
        word_we0 => grp_encrypt_fu_34_word_we0,
        word_d0 => grp_encrypt_fu_34_word_d0,
        word_q0 => word_q0,
        word_address1 => grp_encrypt_fu_34_word_address1,
        word_ce1 => grp_encrypt_fu_34_word_ce1,
        word_q1 => word_q1);

    grp_decrypt_fu_50 : component aes_main_decrypt
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_decrypt_fu_50_ap_start,
        ap_done => grp_decrypt_fu_50_ap_done,
        ap_idle => grp_decrypt_fu_50_ap_idle,
        ap_ready => grp_decrypt_fu_50_ap_ready,
        statemt_address0 => grp_decrypt_fu_50_statemt_address0,
        statemt_ce0 => grp_decrypt_fu_50_statemt_ce0,
        statemt_we0 => grp_decrypt_fu_50_statemt_we0,
        statemt_d0 => grp_decrypt_fu_50_statemt_d0,
        statemt_q0 => statemt_q0,
        statemt_address1 => grp_decrypt_fu_50_statemt_address1,
        statemt_ce1 => grp_decrypt_fu_50_statemt_ce1,
        statemt_we1 => grp_decrypt_fu_50_statemt_we1,
        statemt_d1 => grp_decrypt_fu_50_statemt_d1,
        statemt_q1 => statemt_q1,
        key_address0 => grp_decrypt_fu_50_key_address0,
        key_ce0 => grp_decrypt_fu_50_key_ce0,
        key_q0 => key_q0,
        word_address0 => grp_decrypt_fu_50_word_address0,
        word_ce0 => grp_decrypt_fu_50_word_ce0,
        word_we0 => grp_decrypt_fu_50_word_we0,
        word_d0 => grp_decrypt_fu_50_word_d0,
        word_q0 => word_q0,
        word_address1 => grp_decrypt_fu_50_word_address1,
        word_ce1 => grp_decrypt_fu_50_word_ce1,
        word_q1 => word_q1);





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


    grp_decrypt_fu_50_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_decrypt_fu_50_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_decrypt_fu_50_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_decrypt_fu_50_ap_ready = ap_const_logic_1)) then 
                    grp_decrypt_fu_50_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_encrypt_fu_34_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_encrypt_fu_34_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_encrypt_fu_34_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_encrypt_fu_34_ap_ready = ap_const_logic_1)) then 
                    grp_encrypt_fu_34_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_encrypt_fu_34_ap_done, grp_decrypt_fu_50_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_encrypt_fu_34_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_decrypt_fu_50_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_encrypt_fu_34_ap_done)
    begin
        if ((grp_encrypt_fu_34_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_decrypt_fu_50_ap_done)
    begin
        if ((grp_decrypt_fu_50_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(grp_decrypt_fu_50_ap_done, ap_CS_fsm_state4)
    begin
        if (((grp_decrypt_fu_50_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_decrypt_fu_50_ap_done, ap_CS_fsm_state4)
    begin
        if (((grp_decrypt_fu_50_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= ap_const_lv32_0;
    grp_decrypt_fu_50_ap_start <= grp_decrypt_fu_50_ap_start_reg;
    grp_encrypt_fu_34_ap_start <= grp_encrypt_fu_34_ap_start_reg;

    key_address0_assign_proc : process(grp_encrypt_fu_34_key_address0, grp_decrypt_fu_50_key_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            key_address0 <= grp_decrypt_fu_50_key_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            key_address0 <= grp_encrypt_fu_34_key_address0;
        else 
            key_address0 <= "XXXXX";
        end if; 
    end process;


    key_ce0_assign_proc : process(grp_encrypt_fu_34_key_ce0, grp_decrypt_fu_50_key_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            key_ce0 <= grp_decrypt_fu_50_key_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            key_ce0 <= grp_encrypt_fu_34_key_ce0;
        else 
            key_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    statemt_address0_assign_proc : process(grp_encrypt_fu_34_statemt_address0, grp_decrypt_fu_50_statemt_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_address0 <= grp_decrypt_fu_50_statemt_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_address0 <= grp_encrypt_fu_34_statemt_address0;
        else 
            statemt_address0 <= "XXXXX";
        end if; 
    end process;


    statemt_address1_assign_proc : process(grp_encrypt_fu_34_statemt_address1, grp_decrypt_fu_50_statemt_address1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_address1 <= grp_decrypt_fu_50_statemt_address1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_address1 <= grp_encrypt_fu_34_statemt_address1;
        else 
            statemt_address1 <= "XXXXX";
        end if; 
    end process;


    statemt_ce0_assign_proc : process(grp_encrypt_fu_34_statemt_ce0, grp_decrypt_fu_50_statemt_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_ce0 <= grp_decrypt_fu_50_statemt_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_ce0 <= grp_encrypt_fu_34_statemt_ce0;
        else 
            statemt_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    statemt_ce1_assign_proc : process(grp_encrypt_fu_34_statemt_ce1, grp_decrypt_fu_50_statemt_ce1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_ce1 <= grp_decrypt_fu_50_statemt_ce1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_ce1 <= grp_encrypt_fu_34_statemt_ce1;
        else 
            statemt_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    statemt_d0_assign_proc : process(grp_encrypt_fu_34_statemt_d0, grp_decrypt_fu_50_statemt_d0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_d0 <= grp_decrypt_fu_50_statemt_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_d0 <= grp_encrypt_fu_34_statemt_d0;
        else 
            statemt_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    statemt_d1_assign_proc : process(grp_encrypt_fu_34_statemt_d1, grp_decrypt_fu_50_statemt_d1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_d1 <= grp_decrypt_fu_50_statemt_d1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_d1 <= grp_encrypt_fu_34_statemt_d1;
        else 
            statemt_d1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    statemt_we0_assign_proc : process(grp_encrypt_fu_34_statemt_we0, grp_decrypt_fu_50_statemt_we0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_we0 <= grp_decrypt_fu_50_statemt_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_we0 <= grp_encrypt_fu_34_statemt_we0;
        else 
            statemt_we0 <= ap_const_logic_0;
        end if; 
    end process;


    statemt_we1_assign_proc : process(grp_encrypt_fu_34_statemt_we1, grp_decrypt_fu_50_statemt_we1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            statemt_we1 <= grp_decrypt_fu_50_statemt_we1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            statemt_we1 <= grp_encrypt_fu_34_statemt_we1;
        else 
            statemt_we1 <= ap_const_logic_0;
        end if; 
    end process;


    word_address0_assign_proc : process(grp_encrypt_fu_34_word_address0, grp_decrypt_fu_50_word_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_address0 <= grp_decrypt_fu_50_word_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_address0 <= grp_encrypt_fu_34_word_address0;
        else 
            word_address0 <= "XXXXXXXXX";
        end if; 
    end process;


    word_address1_assign_proc : process(grp_encrypt_fu_34_word_address1, grp_decrypt_fu_50_word_address1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_address1 <= grp_decrypt_fu_50_word_address1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_address1 <= grp_encrypt_fu_34_word_address1;
        else 
            word_address1 <= "XXXXXXXXX";
        end if; 
    end process;


    word_ce0_assign_proc : process(grp_encrypt_fu_34_word_ce0, grp_decrypt_fu_50_word_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_ce0 <= grp_decrypt_fu_50_word_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_ce0 <= grp_encrypt_fu_34_word_ce0;
        else 
            word_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    word_ce1_assign_proc : process(grp_encrypt_fu_34_word_ce1, grp_decrypt_fu_50_word_ce1, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_ce1 <= grp_decrypt_fu_50_word_ce1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_ce1 <= grp_encrypt_fu_34_word_ce1;
        else 
            word_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    word_d0_assign_proc : process(grp_encrypt_fu_34_word_d0, grp_decrypt_fu_50_word_d0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_d0 <= grp_decrypt_fu_50_word_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_d0 <= grp_encrypt_fu_34_word_d0;
        else 
            word_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    word_we0_assign_proc : process(grp_encrypt_fu_34_word_we0, grp_decrypt_fu_50_word_we0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            word_we0 <= grp_decrypt_fu_50_word_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_we0 <= grp_encrypt_fu_34_word_we0;
        else 
            word_we0 <= ap_const_logic_0;
        end if; 
    end process;

end behav;
