----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2019 05:20:05 PM
-- Design Name: 
-- Module Name: bit_reducer_tb - Behavioral
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
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit_reducer_tb is
    generic(
        INPUT_SIZE: positive:= 24;
        OUTPUT_SIZE: positive:=9
    );
--  Port ( );
end bit_reducer_tb;

architecture Behavioral of bit_reducer_tb is

component bit_reducer
    generic (
        INPUT_SIZE: positive:= 24;
        OUTPUT_SIZE: positive:=12
    );
    Port ( input : in STD_LOGIC_VECTOR (INPUT_SIZE-1 downto 0);
           output : out STD_LOGIC_VECTOR (OUTPUT_SIZE-1 downto 0)
         );
end component;

file file_VECTORS: text;
file file_RESULTS: text;

signal input_tb: STD_LOGIC_VECTOR(INPUT_SIZE-1 downto 0);
signal output_tb: STD_LOGIC_VECTOR(OUTPUT_SIZE-1 downto 0);

constant clk_period: time:= 10ns;

begin

REDUCER_GEN: bit_reducer 
    generic map(
        INPUT_SIZE => INPUT_SIZE,
        OUTPUT_SIZE => OUTPUT_SIZE
    )
    port map(
        input => input_tb,
        output => output_tb
    );

SIM_GEN: process
    variable v_iline : line;
    variable v_dinput: std_logic_vector (INPUT_SIZE-1 downto 0);
    variable v_oline: line;
begin

    file_open(file_VECTORS, "C:\FinalProject\input.txt", read_mode);
    
    while not endfile(file_VECTORS) loop
        wait for clk_period;
        readline(file_VECTORS, v_iline);
        read(v_iline, v_dinput);
        input_tb <= v_dinput;
        
    end loop;
        file_close(file_VECTORS);
    wait;
end process;

end Behavioral;
