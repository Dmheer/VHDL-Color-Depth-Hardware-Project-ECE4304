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
file file_RED: text;
file file_GREEN: text;
file file_BLUE: text;

signal input_tb: STD_LOGIC_VECTOR(INPUT_SIZE-1 downto 0);
signal output_tb: STD_LOGIC_VECTOR(OUTPUT_SIZE-1 downto 0);

signal count:integer:=0;

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
    variable v_rline: line;
    variable v_gline: line;
    variable v_bline: line;
    variable v_dcci : std_logic;
    variable v_SPACE: character;
    variable v_COMMA: character:=',';    
begin

    file_open(file_VECTORS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\input_vectors.txt", read_mode);
    file_open(file_RESULTS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_results.txt", write_mode);
    file_open(file_RED, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_red.txt", write_mode);
    file_open(file_GREEN, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_green.txt", write_mode);
    file_open(file_BLUE, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_blue.txt", write_mode);
    
    while not endfile(file_VECTORS) loop
        wait for clk_period;
        readline(file_VECTORS, v_iline);
        read(v_iline, v_dinput);
        input_tb <= v_dinput;
        
        wait for clk_period;
        
        if (count = 3) then
            write(v_OLINE, output_tb);
            writeline(file_RESULTS, v_OLINE);
            write(v_RLINE, output_tb(OUTPUT_SIZE-1 downto OUTPUT_SIZE-3));
            writeline(file_RED, v_RLINE);
            write(v_GLINE, output_tb(OUTPUT_SIZE-4 downto OUTPUT_SIZE-6));
            writeline(file_GREEN, v_GLINE);
            write(v_BLINE, output_tb(OUTPUT_SIZE-7 downto 0));
            writeline(file_BLUE, v_BLINE);                        
            count <= 0;
        else
            count <= count + 1;
            write(v_OLINE, output_tb);
            write(v_OLINE, v_COMMA);
            write(v_RLINE, output_tb(OUTPUT_SIZE-1 downto OUTPUT_SIZE-3));
            write(v_RLINE, v_COMMA);
            write(v_GLINE, output_tb(OUTPUT_SIZE-4 downto OUTPUT_SIZE-6));
            write(v_GLINE, v_COMMA);
            write(v_BLINE, output_tb(OUTPUT_SIZE-7 downto 0));
            write(v_BLINE, v_COMMA);                                  
        end if;
        
    end loop;
        writeline(file_RESULTS, v_OLINE);
        writeline(file_RED, v_RLINE);
        writeline(file_GREEN, v_GLINE);
        writeline(file_BLUE, v_BLINE);        
        file_close(file_VECTORS);
    wait;
end process;

end Behavioral;
