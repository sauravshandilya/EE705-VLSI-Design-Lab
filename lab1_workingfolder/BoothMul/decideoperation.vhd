-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Implement control circuit. It operate on two LSBs and generate addnonzero and addsub bit as output. 
--              addnonzero bit is used as mux select line to decide if data_in2 has to sent to adder. addsub bit is 
--              is used to decide if content of data_in2 has to be added or subtracted.  
-------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity operation is
	port ( 
	input_0:in bit;
	input_1:in bit;
	output_addsub:out bit;
	output_addnonzero:out bit
);
			
end operation;


architecture arch of operation is
  
  begin
    output_addnonzero <= input_1 xor input_0;             -- add zero when no only shift has to be performed
    output_addsub <= (input_1 xor input_0) and input_1;  -- if addsub = 1 perform subtraction (when input1 = 1 and input2 = 0)
  
end arch;