-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 17-bit Shift Register. Arithmetic Shift Register (Shift by 1 bit)
-------------------------

-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;

-- Entity Declarations

entity shiftregister is
   port (data_in:IN BIT_VECTOR(16 DOWNTO 0); clk_shiftreg,reset_shiftreg:IN BIT; data_out:OUT BIT_VECTOR(16 DOWNTO 0));
end shiftregister;

---
architecture arch of shiftregister is

   component D_FlipFlop is -- import D flipflop
      PORT ( in_D,clk,reset:IN BIT; out_D:OUT BIT);
   end component;

signal signal1:BIT_VECTOR(16 downto 0);
	begin D_FlipFlop1: D_FlipFlop port map(data_in(16),clk_shiftreg,reset_shiftreg,signal1(16));
		data_out(16)<=signal1(16);
		shiftreg: for i in 0 to 15 generate
			D_FlipFlop_all: D_FlipFlop port map(data_in(i+1),clk_shiftreg,reset_shiftreg,signal1(i)); 
			data_out(i)<=signal1(i);
		end generate shiftreg;
		--data_in <= data_out;
end architecture;		
