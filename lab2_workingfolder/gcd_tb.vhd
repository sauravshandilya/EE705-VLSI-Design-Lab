-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: GCD Test Bench        
-------------------------

-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- entity desription
entity gcd_TB is
end gcd_TB;

-- Architecture Description

architecture arch of gcd_TB is

-- component declaration
component GCDmain is
    port ( 
            reset,clk,start:	in bit;
            X, Y:	in	bit_vector (7 downto 0);
            Z:	out	bit_vector (7 downto 0)
        );
end component;

-- signals 
signal sysclk,reset,start : bit;
signal data_in1,data_in2,data_out : bit_vector(7 downto 0):=(OTHERS=>'0');
signal clocktime :time := 100 ns;

-- begin 

begin 

    gcdTB : GCDmain 
                    port map 
                    (reset,
                    sysclk,
                    start,
                    data_in1,
                    data_in2,
                    data_out);
                    
---- Process-1 for clock                    
    clock: process        
    begin
        sysclk <= '0'; 
        wait for clocktime/2;
        sysclk <= '1'; 
        wait for clocktime/2;    
    end process;
    
--- Process-2 for testing various input cases    
    inputtestcase : process 
    begin
        
        start <= '0';
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "00001010";  --- 10
        data_in2 <= "00001111";  --- 15       
        wait for 50000 ns;
        start <= '0';
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "11110110";  --- -10
        data_in2 <= "00001111";  --- 15       
        wait for 50000 ns;
        start <= '0';        
 
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "00001010";  --- 10
        data_in2 <= "11110001";  --- -15       
        wait for 50000 ns;
        start <= '0';
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "11110110";  --- -10
        data_in2 <= "11110001";  --- -15       
        wait for 50000 ns;
        start <= '0';
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "00000001";  --- 1
        data_in2 <= "01111111";  --- 127       
        wait for 50000 ns;
        start <= '0';
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "00000001";  --- 1
        data_in2 <= "10000000";  --- -128       
        wait for 50000 ns;
        start <= '0';
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        start <= '1';
        wait for 100 ns;
        data_in1 <= "01111111";  --- 127
        data_in2 <= "10000000";  --- -128       
        wait for 50000 ns;
        start <= '0';
        
    end process;

end arch;    
