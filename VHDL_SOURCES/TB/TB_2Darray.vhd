----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2019 10:54:11 AM
-- Design Name: 
-- Module Name: TB - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB is
    constant row : positive := 7;
    constant col : positive := 4;
    constant dataSize : positive := 24;
    constant period : time := 10 ns;
end TB;

architecture Behavioral of TB is

component TwoDArray is
    generic (row : positive :=7;
             col : positive :=4;
             dataSize : positive:= 24);   
     port (     clk : in std_logic;
                en  : in std_logic;
                output : out std_logic_vector(dataSize -1 downto 0));
end component;
signal clk : std_logic := '0';
signal output : std_logic_vector(dataSize -1 downto 0);
signal en : std_logic := '0';
begin

Clock : process begin clk <= not clk; wait for period /2 ;end process;

uut : TwoDarray generic map (row => row, col => col , dataSize => dataSize) port map (clk => clk, en => en,output=> output);

simulation : process begin
                en <= '0';
                wait for period;
                en <= '1';
                wait for period *14 ;
                en<= '0';
                wait ;
             end process;




end architecture;