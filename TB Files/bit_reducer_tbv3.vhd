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
        OUTPUT_SIZE: positive:=12
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


file file_R_VECTORS: text;
file file_G_VECTORS: text;
file file_B_VECTORS: text;
file file_RESULTS: text;
file file_RED: text;
file file_GREEN: text;
file file_BLUE: text;

signal input_tb: STD_LOGIC_VECTOR(INPUT_SIZE-1 downto 0);
signal output_tb: STD_LOGIC_VECTOR(OUTPUT_SIZE-1 downto 0);
signal s_i_r_tb: STD_LOGIC_VECTOR((INPUT_SIZE/3)-1 downto 0);
signal s_i_g_tb: STD_LOGIC_VECTOR((INPUT_SIZE/3)-1 downto 0);
signal s_i_b_tb: STD_LOGIC_VECTOR((INPUT_SIZE/3)-1 downto 0);
signal s_o_r_tb: STD_LOGIC_VECTOR((OUTPUT_SIZE/3)-1 downto 0);
signal s_o_g_tb: STD_LOGIC_VECTOR((OUTPUT_SIZE/3)-1 downto 0);
signal s_o_b_tb: STD_LOGIC_VECTOR((OUTPUT_SIZE/3)-1 downto 0);
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
    variable v_i_rline : line;
    variable v_i_gline : line;
    variable v_i_bline : line;
    variable v_dinput:   std_logic_vector  (INPUT_SIZE-1 downto 0);
    variable v_i_rinput: std_logic_vector ((INPUT_SIZE/3)-1 downto 0);
    variable v_i_ginput: std_logic_vector ((INPUT_SIZE/3)-1 downto 0);
    variable v_i_binput: std_logic_vector ((INPUT_SIZE/3)-1 downto 0);
    variable v_oline: line;
    variable v_rline: line;
    variable v_gline: line;
    variable v_bline: line;
    variable v_dcci : std_logic;
    variable v_SPACE: character;
    variable v_COMMA: character:=',';    
begin
    
    file_open(file_B_VECTORS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\blue_channel_b.txt", read_mode);
    file_open(file_R_VECTORS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\red_channel_b.txt", read_mode);
    file_open(file_G_VECTORS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\green_channel_b.txt", read_mode);
    file_open(file_RESULTS, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_results.txt", write_mode);
    file_open(file_RED, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_red.txt", write_mode);
    file_open(file_GREEN, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_green.txt", write_mode);
    file_open(file_BLUE, "D:\Vivado Projects\quantize_test\quantize_test.srcs\sim_1\new\output_blue.txt", write_mode);
    
    while not endfile(file_R_Vectors) loop
        wait for clk_period;
        readline(file_R_vectors, v_i_rline);
        readline(file_G_vectors, v_i_gline);
        readline(file_B_vectors, v_i_bline);
        read(v_iline, v_dinput);
        read(v_i_rline, v_i_rinput);
        read(v_i_gline, v_i_ginput);
        read(v_i_bline, v_i_binput);
        input_tb <= v_i_rinput&v_i_ginput&v_i_binput;
        s_i_r_tb <= v_i_rinput;
        s_i_g_tb <= v_i_ginput;
        s_i_b_tb <= v_i_binput;
        s_o_r_tb <= output_tb(OUTPUT_SIZE-1 downto OUTPUT_SIZE-4);
        s_o_g_tb <= output_tb(OUTPUT_SIZE-5 downto OUTPUT_SIZE-8);
        s_o_b_tb <= output_tb(OUTPUT_SIZE-9 downto OUTPUT_SIZE-12); 
        wait for clk_period;
        
            write(v_OLINE, output_tb);
            writeline(file_RESULTS, v_OLINE);
            write(v_RLINE, s_o_r_tb);
            writeline(file_RED, v_RLINE);
            write(v_GLINE, s_o_g_tb);
            writeline(file_GREEN, v_GLINE);
            write(v_BLINE, s_o_b_tb);
            writeline(file_BLUE, v_BLINE);
        
    end loop;
        writeline(file_RESULTS, v_OLINE);
        writeline(file_RED, v_RLINE);
        writeline(file_GREEN, v_GLINE);
        writeline(file_BLUE, v_BLINE);        
        file_close(file_B_VECTORS);
        file_close(file_G_VECTORS);
        file_close(file_R_VECTORS);
       
    wait;
end process;

end Behavioral;
