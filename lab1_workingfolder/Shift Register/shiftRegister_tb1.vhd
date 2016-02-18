-------------------------
-- Author: Saurav Shandilya
-- Description: shift register
-------------------------

-- ****** shift register *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity shiftregister_tb is
end shiftregister_tb;

architecture arch of shiftregister_tb is

   component shiftregister is -- import 2x1 MUX
      PORT (data_in:IN BIT_VECTOR(16 DOWNTO 0); clk_shiftreg,reset_shiftreg:IN BIT; data_out:OUT BIT_VECTOR(16 DOWNTO 0));
   end component;
   	
signal data_in:BIT_VECTOR(16 downto 0);
signal clk_shiftreg,reset_shiftreg:BIT;
signal data_out:BIT_VECTOR(16 downto 0);
    		
begin
    mapping: shiftregister port map (data_in,clk_shiftreg,reset_shiftreg,data_out);

process
begin	
			data_in (16) <= '1';
			data_in (15) <= '0';
			data_in (14) <= '0';
			data_in (13) <= '0';
			data_in (12) <= '0';
			data_in (11) <= '0';
			data_in (10) <= '0';
			data_in (9) <= '0';	
			data_in (8) <= '0';
			data_in (7) <= '0';			
			data_in (6) <= '0';
			data_in (5) <= '0';
			data_in (4) <= '0';
			data_in (3) <= '0';
			data_in (2) <= '0';
			data_in (1) <= '0';	
			data_in (0) <= '0';
			
			clk_shiftreg <= '0';
			reset_shiftreg<= '0';
			
			wait for 10 ns;	

			clk_shiftreg <= '1';
			reset_shiftreg<= '0';
			wait for 10 ns;

			clk_shiftreg <= '0';
			reset_shiftreg<= '1';
			wait for 10 ns;
			
			data_in <= "01001001001001001";
			clk_shiftreg <= '1';
			reset_shiftreg<= '0';
			wait for 10 ns;

			data_in <= "01010101101010101";
			clk_shiftreg <= '0';
			reset_shiftreg<= '0';
			wait for 10 ns;
	
			clk_shiftreg <= '1';
			reset_shiftreg<= '0';
			wait for 10 ns;

			clk_shiftreg <= '0';
			reset_shiftreg<= '0';
			wait for 10 ns;

	wait;

END PROCESS;
END arch;

configuration cfg_tb of shiftregister_tb is
   for arch
   end for;
end cfg_tb;

