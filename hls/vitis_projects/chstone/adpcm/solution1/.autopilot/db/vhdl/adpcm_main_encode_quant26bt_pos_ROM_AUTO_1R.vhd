-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity adpcm_main_encode_quant26bt_pos_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 6; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 31
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of adpcm_main_encode_quant26bt_pos_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "111101", 1 => "111100", 2 => "111011", 3 => "111010", 
    4 => "111001", 5 => "111000", 6 => "110111", 7 => "110110", 
    8 => "110101", 9 => "110100", 10 => "110011", 11 => "110010", 
    12 => "110001", 13 => "110000", 14 => "101111", 15 => "101110", 
    16 => "101101", 17 => "101100", 18 => "101011", 19 => "101010", 
    20 => "101001", 21 => "101000", 22 => "100111", 23 => "100110", 
    24 => "100101", 25 => "100100", 26 => "100011", 27 => "100010", 
    28 => "100001", 29 => "100000", 30 => "100000");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;
