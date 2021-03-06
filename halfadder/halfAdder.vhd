-------------------------
-- Author: Saurav Shandilya
-- Description: halfAdder implementation
-------------------------

-- ****** AND Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity andGate is	
   port( A, B : in std_logic;
            C : out std_logic);
end andGate;

-- architecture
architecture arch of andGate is 
begin
   C <= A and B;
end arch;

-- ****** XOR Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity xorGate is	
   port( A, B : in std_logic;
            C : out std_logic);
end xorGate;

-- architecture
architecture arch of xorGate is 
begin
   C <= A xor B;
end arch;


--- ***** Half adder 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
   port( A, B : in std_logic;
    	sum, Cout : out std_logic);
end halfAdder;

architecture arch of halfAdder is

   component andGate is -- import AND Gate
      port( A, B : in std_logic;
               C : out std_logic);
   end component;

   component xorGate is -- import XOR Gate
      port( A, B : in std_logic;
               C : out std_logic);
   end component;

begin
   G1 : xorGate port map(A, B, sum);
   G2 : andGate port map(A, B, Cout);
end arch;
