-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 17-bit 2x1 Multiplexer.
-------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux2x1_17bit is
	PORT ( Mux_in_1:IN bit_vector(16 DOWNTO 0);
			Mux_in_2:IN bit_vector(16 DOWNTO 0);
			sel:IN bit; 
			mux_out:OUT bit_vector(16 DOWNTO 0)
			);
			
END Mux2x1_17bit;


ARCHITECTURE arch of Mux2x1_17bit is

COMPONENT mux2x1 is
			port (A,B,sel: in bit;
	    muxout: out bit	
	);
	END COMPONENT;

BEGIN

      D16: 	mux2x1 PORT MAP(A=>Mux_in_1(16),B=> Mux_in_2(16),sel=> sel,muxout=> mux_out(16));		
			D15: 	mux2x1 PORT MAP(A=>Mux_in_1(15),B=> Mux_in_2(15),sel=> sel,muxout=> mux_out(15));		
			D14: 	mux2x1 PORT MAP(A=>Mux_in_1(14),B=> Mux_in_2(14),sel=> sel,muxout=> mux_out(14));
			D13: 	mux2x1 PORT MAP(A=>Mux_in_1(13),B=> Mux_in_2(13),sel=> sel,muxout=> mux_out(13));
			D12: 	mux2x1 PORT MAP(A=>Mux_in_1(12),B=> Mux_in_2(12),sel=> sel,muxout=> mux_out(12));	
			D11: 	mux2x1 PORT MAP(A=>Mux_in_1(11),B=> Mux_in_2(11),sel=> sel,muxout=> mux_out(11));
			D10: 	mux2x1 PORT MAP(A=>Mux_in_1(10),B=> Mux_in_2(10),sel=> sel,muxout=> mux_out(10));
			D9: 	mux2x1 PORT MAP(A=>Mux_in_1(9),B=> Mux_in_2(9),sel=> sel,muxout=> mux_out(9));	
			D8: 	mux2x1 PORT MAP(A=>Mux_in_1(8),B=> Mux_in_2(8),sel=> sel,muxout=> mux_out(8));

			D7: 	mux2x1 PORT MAP(A=>Mux_in_1(7),B=> Mux_in_2(7),sel=> sel,muxout=> mux_out(7));		
			D6: 	mux2x1 PORT MAP(A=>Mux_in_1(6),B=> Mux_in_2(6),sel=> sel,muxout=> mux_out(6));
			D5: 	mux2x1 PORT MAP(A=>Mux_in_1(5),B=> Mux_in_2(5),sel=> sel,muxout=> mux_out(5));
			D4: 	mux2x1 PORT MAP(A=>Mux_in_1(4),B=> Mux_in_2(4),sel=> sel,muxout=> mux_out(4));	
			D3: 	mux2x1 PORT MAP(A=>Mux_in_1(3),B=> Mux_in_2(3),sel=> sel,muxout=> mux_out(3));
			D2: 	mux2x1 PORT MAP(A=>Mux_in_1(2),B=> Mux_in_2(2),sel=> sel,muxout=> mux_out(2));
			D1: 	mux2x1 PORT MAP(A=>Mux_in_1(1),B=> Mux_in_2(1),sel=> sel,muxout=> mux_out(1));	
			D0: 	mux2x1 PORT MAP(A=>Mux_in_1(0),B=> Mux_in_2(0),sel=> sel,muxout=> mux_out(0));

END arch;
