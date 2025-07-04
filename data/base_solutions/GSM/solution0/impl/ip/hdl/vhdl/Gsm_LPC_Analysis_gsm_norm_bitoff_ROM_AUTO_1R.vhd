-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 4; 
             AddressWidth     : integer := 8; 
             AddressRange    : integer := 256
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);
 
          address1        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce1             : in std_logic; 
          q1              : out std_logic_vector(DataWidth-1 downto 0);
 
          address2        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce2             : in std_logic; 
          q2              : out std_logic_vector(DataWidth-1 downto 0);
 
          address3        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce3             : in std_logic; 
          q3              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of Gsm_LPC_Analysis_gsm_norm_bitoff_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address1_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address2_tmp : std_logic_vector(AddressWidth-1 downto 0);  
signal address3_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1000", 1 => "0111", 2 => "0110", 3 => "0110", 
    4 => "0101", 5 => "0101", 6 => "0101", 7 => "0101", 
    8 => "0100", 9 => "0100", 10 => "0100", 11 => "0100", 
    12 => "0100", 13 => "0100", 14 => "0100", 15 => "0100", 
    16 => "0011", 17 => "0011", 18 => "0011", 19 => "0011", 
    20 => "0011", 21 => "0011", 22 => "0011", 23 => "0011", 
    24 => "0011", 25 => "0011", 26 => "0011", 27 => "0011", 
    28 => "0011", 29 => "0011", 30 => "0011", 31 => "0011", 
    32 => "0010", 33 => "0010", 34 => "0010", 35 => "0010", 
    36 => "0010", 37 => "0010", 38 => "0010", 39 => "0010", 
    40 => "0010", 41 => "0010", 42 => "0010", 43 => "0010", 
    44 => "0010", 45 => "0010", 46 => "0010", 47 => "0010", 
    48 => "0010", 49 => "0010", 50 => "0010", 51 => "0010", 
    52 => "0010", 53 => "0010", 54 => "0010", 55 => "0010", 
    56 => "0010", 57 => "0010", 58 => "0010", 59 => "0010", 
    60 => "0010", 61 => "0010", 62 => "0010", 63 => "0010", 
    64 => "0001", 65 => "0001", 66 => "0001", 67 => "0001", 
    68 => "0001", 69 => "0001", 70 => "0001", 71 => "0001", 
    72 => "0001", 73 => "0001", 74 => "0001", 75 => "0001", 
    76 => "0001", 77 => "0001", 78 => "0001", 79 => "0001", 
    80 => "0001", 81 => "0001", 82 => "0001", 83 => "0001", 
    84 => "0001", 85 => "0001", 86 => "0001", 87 => "0001", 
    88 => "0001", 89 => "0001", 90 => "0001", 91 => "0001", 
    92 => "0001", 93 => "0001", 94 => "0001", 95 => "0001", 
    96 => "0001", 97 => "0001", 98 => "0001", 99 => "0001", 
    100 => "0001", 101 => "0001", 102 => "0001", 103 => "0001", 
    104 => "0001", 105 => "0001", 106 => "0001", 107 => "0001", 
    108 => "0001", 109 => "0001", 110 => "0001", 111 => "0001", 
    112 => "0001", 113 => "0001", 114 => "0001", 115 => "0001", 
    116 => "0001", 117 => "0001", 118 => "0001", 119 => "0001", 
    120 => "0001", 121 => "0001", 122 => "0001", 123 => "0001", 
    124 => "0001", 125 => "0001", 126 => "0001", 127 => "0001", 
    128 => "0000", 129 => "0000", 130 => "0000", 131 => "0000", 
    132 => "0000", 133 => "0000", 134 => "0000", 135 => "0000", 
    136 => "0000", 137 => "0000", 138 => "0000", 139 => "0000", 
    140 => "0000", 141 => "0000", 142 => "0000", 143 => "0000", 
    144 => "0000", 145 => "0000", 146 => "0000", 147 => "0000", 
    148 => "0000", 149 => "0000", 150 => "0000", 151 => "0000", 
    152 => "0000", 153 => "0000", 154 => "0000", 155 => "0000", 
    156 => "0000", 157 => "0000", 158 => "0000", 159 => "0000", 
    160 => "0000", 161 => "0000", 162 => "0000", 163 => "0000", 
    164 => "0000", 165 => "0000", 166 => "0000", 167 => "0000", 
    168 => "0000", 169 => "0000", 170 => "0000", 171 => "0000", 
    172 => "0000", 173 => "0000", 174 => "0000", 175 => "0000", 
    176 => "0000", 177 => "0000", 178 => "0000", 179 => "0000", 
    180 => "0000", 181 => "0000", 182 => "0000", 183 => "0000", 
    184 => "0000", 185 => "0000", 186 => "0000", 187 => "0000", 
    188 => "0000", 189 => "0000", 190 => "0000", 191 => "0000", 
    192 => "0000", 193 => "0000", 194 => "0000", 195 => "0000", 
    196 => "0000", 197 => "0000", 198 => "0000", 199 => "0000", 
    200 => "0000", 201 => "0000", 202 => "0000", 203 => "0000", 
    204 => "0000", 205 => "0000", 206 => "0000", 207 => "0000", 
    208 => "0000", 209 => "0000", 210 => "0000", 211 => "0000", 
    212 => "0000", 213 => "0000", 214 => "0000", 215 => "0000", 
    216 => "0000", 217 => "0000", 218 => "0000", 219 => "0000", 
    220 => "0000", 221 => "0000", 222 => "0000", 223 => "0000", 
    224 => "0000", 225 => "0000", 226 => "0000", 227 => "0000", 
    228 => "0000", 229 => "0000", 230 => "0000", 231 => "0000", 
    232 => "0000", 233 => "0000", 234 => "0000", 235 => "0000", 
    236 => "0000", 237 => "0000", 238 => "0000", 239 => "0000", 
    240 => "0000", 241 => "0000", 242 => "0000", 243 => "0000", 
    244 => "0000", 245 => "0000", 246 => "0000", 247 => "0000", 
    248 => "0000", 249 => "0000", 250 => "0000", 251 => "0000", 
    252 => "0000", 253 => "0000", 254 => "0000", 255 => "0000");

signal mem1 : mem_array := (
    0 => "1000", 1 => "0111", 2 => "0110", 3 => "0110", 
    4 => "0101", 5 => "0101", 6 => "0101", 7 => "0101", 
    8 => "0100", 9 => "0100", 10 => "0100", 11 => "0100", 
    12 => "0100", 13 => "0100", 14 => "0100", 15 => "0100", 
    16 => "0011", 17 => "0011", 18 => "0011", 19 => "0011", 
    20 => "0011", 21 => "0011", 22 => "0011", 23 => "0011", 
    24 => "0011", 25 => "0011", 26 => "0011", 27 => "0011", 
    28 => "0011", 29 => "0011", 30 => "0011", 31 => "0011", 
    32 => "0010", 33 => "0010", 34 => "0010", 35 => "0010", 
    36 => "0010", 37 => "0010", 38 => "0010", 39 => "0010", 
    40 => "0010", 41 => "0010", 42 => "0010", 43 => "0010", 
    44 => "0010", 45 => "0010", 46 => "0010", 47 => "0010", 
    48 => "0010", 49 => "0010", 50 => "0010", 51 => "0010", 
    52 => "0010", 53 => "0010", 54 => "0010", 55 => "0010", 
    56 => "0010", 57 => "0010", 58 => "0010", 59 => "0010", 
    60 => "0010", 61 => "0010", 62 => "0010", 63 => "0010", 
    64 => "0001", 65 => "0001", 66 => "0001", 67 => "0001", 
    68 => "0001", 69 => "0001", 70 => "0001", 71 => "0001", 
    72 => "0001", 73 => "0001", 74 => "0001", 75 => "0001", 
    76 => "0001", 77 => "0001", 78 => "0001", 79 => "0001", 
    80 => "0001", 81 => "0001", 82 => "0001", 83 => "0001", 
    84 => "0001", 85 => "0001", 86 => "0001", 87 => "0001", 
    88 => "0001", 89 => "0001", 90 => "0001", 91 => "0001", 
    92 => "0001", 93 => "0001", 94 => "0001", 95 => "0001", 
    96 => "0001", 97 => "0001", 98 => "0001", 99 => "0001", 
    100 => "0001", 101 => "0001", 102 => "0001", 103 => "0001", 
    104 => "0001", 105 => "0001", 106 => "0001", 107 => "0001", 
    108 => "0001", 109 => "0001", 110 => "0001", 111 => "0001", 
    112 => "0001", 113 => "0001", 114 => "0001", 115 => "0001", 
    116 => "0001", 117 => "0001", 118 => "0001", 119 => "0001", 
    120 => "0001", 121 => "0001", 122 => "0001", 123 => "0001", 
    124 => "0001", 125 => "0001", 126 => "0001", 127 => "0001", 
    128 => "0000", 129 => "0000", 130 => "0000", 131 => "0000", 
    132 => "0000", 133 => "0000", 134 => "0000", 135 => "0000", 
    136 => "0000", 137 => "0000", 138 => "0000", 139 => "0000", 
    140 => "0000", 141 => "0000", 142 => "0000", 143 => "0000", 
    144 => "0000", 145 => "0000", 146 => "0000", 147 => "0000", 
    148 => "0000", 149 => "0000", 150 => "0000", 151 => "0000", 
    152 => "0000", 153 => "0000", 154 => "0000", 155 => "0000", 
    156 => "0000", 157 => "0000", 158 => "0000", 159 => "0000", 
    160 => "0000", 161 => "0000", 162 => "0000", 163 => "0000", 
    164 => "0000", 165 => "0000", 166 => "0000", 167 => "0000", 
    168 => "0000", 169 => "0000", 170 => "0000", 171 => "0000", 
    172 => "0000", 173 => "0000", 174 => "0000", 175 => "0000", 
    176 => "0000", 177 => "0000", 178 => "0000", 179 => "0000", 
    180 => "0000", 181 => "0000", 182 => "0000", 183 => "0000", 
    184 => "0000", 185 => "0000", 186 => "0000", 187 => "0000", 
    188 => "0000", 189 => "0000", 190 => "0000", 191 => "0000", 
    192 => "0000", 193 => "0000", 194 => "0000", 195 => "0000", 
    196 => "0000", 197 => "0000", 198 => "0000", 199 => "0000", 
    200 => "0000", 201 => "0000", 202 => "0000", 203 => "0000", 
    204 => "0000", 205 => "0000", 206 => "0000", 207 => "0000", 
    208 => "0000", 209 => "0000", 210 => "0000", 211 => "0000", 
    212 => "0000", 213 => "0000", 214 => "0000", 215 => "0000", 
    216 => "0000", 217 => "0000", 218 => "0000", 219 => "0000", 
    220 => "0000", 221 => "0000", 222 => "0000", 223 => "0000", 
    224 => "0000", 225 => "0000", 226 => "0000", 227 => "0000", 
    228 => "0000", 229 => "0000", 230 => "0000", 231 => "0000", 
    232 => "0000", 233 => "0000", 234 => "0000", 235 => "0000", 
    236 => "0000", 237 => "0000", 238 => "0000", 239 => "0000", 
    240 => "0000", 241 => "0000", 242 => "0000", 243 => "0000", 
    244 => "0000", 245 => "0000", 246 => "0000", 247 => "0000", 
    248 => "0000", 249 => "0000", 250 => "0000", 251 => "0000", 
    252 => "0000", 253 => "0000", 254 => "0000", 255 => "0000");



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
 
memory_access_guard_1: process (address1) 
begin
      address1_tmp <= address1;
--synthesis translate_off
      if (CONV_INTEGER(address1) > AddressRange-1) then
           address1_tmp <= (others => '0');
      else 
           address1_tmp <= address1;
      end if;
--synthesis translate_on
end process;
 
memory_access_guard_2: process (address2) 
begin
      address2_tmp <= address2;
--synthesis translate_off
      if (CONV_INTEGER(address2) > AddressRange-1) then
           address2_tmp <= (others => '0');
      else 
           address2_tmp <= address2;
      end if;
--synthesis translate_on
end process;
 
memory_access_guard_3: process (address3) 
begin
      address3_tmp <= address3;
--synthesis translate_off
      if (CONV_INTEGER(address3) > AddressRange-1) then
           address3_tmp <= (others => '0');
      else 
           address3_tmp <= address3;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;
 
        if (ce1 = '1') then  
            q1 <= mem0(CONV_INTEGER(address1_tmp)); 
        end if;
 
        if (ce2 = '1') then  
            q2 <= mem1(CONV_INTEGER(address2_tmp)); 
        end if;
 
        if (ce3 = '1') then  
            q3 <= mem1(CONV_INTEGER(address3_tmp)); 
        end if;

end if;
end process;

end rtl;

