-- Author: Saurav Shandilya
-- Description: myor (OR Gate implementation)


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: name, inputs, outputs
entity myor is					
   port( in1, in2 : in std_logic;
            out1 : out std_logic);
end myor;

--Architecture of AND gate
architecture arch of myor is 
begin
  out1 <= in1 or in2;		
end arch;
