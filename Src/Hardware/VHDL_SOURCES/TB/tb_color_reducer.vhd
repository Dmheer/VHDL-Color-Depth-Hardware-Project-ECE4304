----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2019 03:47:40 AM
-- Design Name: 
-- Module Name: tb_color_reducer - Behavioral
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

entity tb_color_reducer is
      generic( g_colordepth: positive:= 8; -- color depth we have 
               g_reduction:  positive:= 4 -- color depth we want
         );
--  Port ( );
end tb_color_reducer;

architecture Behavioral of tb_color_reducer is
component e_color_reducer is
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
end component e_color_reducer;
signal         i_red  :    unsigned((g_colordepth)-1 downto 0); --input red
signal         i_green:    unsigned((g_colordepth)-1 downto 0); --input green
signal         i_blue :    unsigned((g_colordepth)-1 downto 0); --input blue
signal         o_red  :    unsigned((g_reduction)-1 downto 0); --output red
signal         o_green:    unsigned((g_reduction)-1 downto 0); --output green
signal         o_blue :    unsigned((g_reduction)-1 downto 0); --output blue
constant       clk_tb : time:=10ns;
begin
QQ_make: e_color_reducer generic map (g_colordepth => g_colordepth,
                             g_reduction  => g_reduction)
                port map(  i_red => i_red,
                           i_blue=> i_blue,
                           i_green=>i_green,
                           o_red => o_red,
                           o_blue=> o_blue,
                           o_green=>o_green);
simulation:     process
                begin
                        i_red   <= b"11001000";
                        i_blue  <= b"01100100";
                        i_green <= b"00110010"; 
                        wait;
                   end process;
end Behavioral;
