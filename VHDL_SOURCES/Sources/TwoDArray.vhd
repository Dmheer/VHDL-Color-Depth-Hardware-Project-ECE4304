----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2019 10:44:25 AM
-- Design Name: 
-- Module Name: TwoDArray - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TwoDArray is
    generic (row : positive :=7;               -- 7 x 24 dimension
             col : positive :=4;
             dataSize : positive:= 24);
             
     port (     clk : in std_logic;
                en  : in std_logic;
                output : out std_logic_vector(dataSize -1 downto 0));
end TwoDArray;

architecture Behavioral of TwoDArray is
type two_dim is array (row-1 downto 0 , col-1 downto 0) of std_logic_vector(dataSize - 1 downto 0);
constant a : two_dim :=(("000000000000000000000001","000000000000000000000010","000000000000000000000100","000000000000000000001000"),
                        ("000000000000000000010000","000000000000000000100000","000000000000000001000000","000000000000000010000000"),
                        ("000000000000000000000001","000000000000000000000010","000000000000000000000100","000000000000000000001000"),
                        ("000000000000000000010000","000000000000000000100000","000000000000000001000000","000000000000000010000000"),
                        ("000000000000000000000001","000000000000000000000010","000000000000000000000100","000000000000000000001000"),
                        ("000000000000000000010000","000000000000000000100000","000000000000000001000000","000000000000000010000000"),
                        ("000000000000000000000001","000000000000000000000010","000000000000000000000100","000000000000000000001000"));
signal b : std_logic_vector(dataSize -1 downto 0) := (others => '0');
signal checki,checkj : integer := 0;
signal rowPointer, colPointer : integer:= 0;
begin
  process (clk)
  begin
  if rising_edge(clk) then 
        if en = '1' then
            b <= a(rowPointer,colPointer);
                  if colPointer = col-1 then
                    rowPointer <= rowPointer + 1;
                        if rowPointer = row-1 then
                            rowPointer <= 0;
                            end if;
                    colPointer <= 0;
                   else
                    colPointer <= colPointer + 1;
                    end if;
          else
            b <= (others => '0');
                end if;
        end if;
       output <= b;
end process;
end Behavioral;
