----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2019 04:57:33 PM
-- Design Name: 
-- Module Name: bit_reducer - Behavioral
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

entity bit_reducer is
    generic (
        INPUT_SIZE: positive:= 24;
        OUTPUT_SIZE: positive:=12
    );
    Port ( input : in STD_LOGIC_VECTOR (INPUT_SIZE-1 downto 0);
           output : out STD_LOGIC_VECTOR (OUTPUT_SIZE-1 downto 0)
         );
end bit_reducer;

architecture Behavioral of bit_reducer is

signal R, G, B: STD_LOGIC_VECTOR((OUTPUT_SIZE/3)-1 downto 0);
constant BIG_SIZE: positive:= INPUT_SIZE/3;
constant SMALL_SIZE: positive:= OUTPUT_SIZE/3;

begin

--get the most significant x bits for each color
--24 bit to 18 bit is 8bits/color to 6bits/color. you take the most significant 6 bits of each color
--24 bit to 9 bit is 8bits/color to 3bits/color. take the most significant 3 bits of each color
R <= input(INPUT_SIZE-(BIG_SIZE*0)-1 downto INPUT_SIZE-(BIG_SIZE*0)-1-(SMALL_SIZE)+1);
G <= input(INPUT_SIZE-(BIG_SIZE*1)-1 downto INPUT_SIZE-(BIG_SIZE*1)-1-(SMALL_SIZE)+1);
B <= input(INPUT_SIZE-(BIG_SIZE*2)-1 downto INPUT_SIZE-(BIG_SIZE*2)-1-(SMALL_SIZE)+1);

output <= R & G & B;
end Behavioral;
