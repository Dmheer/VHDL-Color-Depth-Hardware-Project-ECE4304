----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2019 03:22:30 AM
-- Design Name: 
-- Module Name: color_reducer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity e_color_reducer is
generic( g_colordepth: positive:= 8; -- color depth we have 
         g_reduction:  positive:= 4 -- color depth we want
         );
Port ( 
         i_red  :   in unsigned((g_colordepth)-1 downto 0); --input red
         i_green:   in unsigned((g_colordepth)-1 downto 0); --input green
         i_blue :   in unsigned((g_colordepth)-1 downto 0); --input blue
         o_red  :   out unsigned((g_reduction)-1 downto 0); --output red
         o_green:   out unsigned((g_reduction)-1 downto 0); --output green
         o_blue :   out unsigned((g_reduction)-1 downto 0) --output blue
         );
end e_color_reducer;

architecture Behavioral of e_color_reducer is
signal s_red,s_green,s_blue: integer; -- casting our inputs to integers
signal s_red_d, s_green_d, s_blue_d: integer;  -- signals to hold the divided integer
signal divisor: integer:= (2**g_colordepth)/(2**g_reduction); -- find desired divisor
begin
s_red     <= to_integer(unsigned(i_red));
s_blue    <= to_integer(unsigned(i_blue));
s_green   <= to_integer(unsigned(i_green));
s_red_d <= s_red/divisor;
s_blue_d <= s_blue/divisor;
s_green_d <= s_green/divisor;
o_red   <= to_unsigned(s_red_d,g_reduction);
o_blue  <= to_unsigned(s_blue_d,g_reduction);
o_green <= to_unsigned(s_green_d,g_reduction);
end Behavioral;
