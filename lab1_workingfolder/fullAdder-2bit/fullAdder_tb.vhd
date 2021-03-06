-------------------------------------------------------------
-- Author : http://www.teahlab.com/
--
-- Program: Full Adder Testbench
--
-- Note   : A testbench is a program that defines a series
--        of tests to verify the operation of a circuit:
--        in this case, the Full Adder.
--
--        Two important notes about this test bench:
--        1] The testbench takes no inputs and returns
--        no outputs. As such the ENTITY declaration
--        is empty.
--
--        2] The circuit under verification, here the
--        Full Adder, is imported into the testbench
--        ARCHITECTURE as a component.
-------------------------------------------------------------

--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

entity fullAdder_tb is
end fullAdder_tb;

architecture arch of fullAdder_tb is

   component fullAdder is
      port( A, B, Cin : in std_logic;
            sum, Cout : out std_logic);
   end component;

   signal A, B, Cin, sum, Cout : std_logic;

begin
   mapping: fullAdder port map(A, B, Cin, sum, Cout);

   --concurrent processes
   --process
   --begin
    --  Cin <= '0'; wait for 5 ns;
     -- Cin <= '1'; wait for 5 ns;
   --end process;

   process
   variable errCnt : integer := 0;
   begin

   --TEST 1
      A <= '0';
      B <= '0';
      cin <= '0';
      wait for 10 ns;
      assert(sum = '0') report "Error-1 in Sum" severity error;
      assert(Cout = '0') report "Error-1 in Cout" severity error;
      if(sum /= '0' or Cout /= '0') then
         errCnt := errCnt + 1;
      end if;

   --TEST 2
      A <= '0';
      B <= '0';
      cin <= '1';
      wait for 10 ns;
      assert(sum = '1') report "Error-2 in sum" severity error;
      assert(Cout = '0') report "Error-2 in Cout" severity error;
      if(sum /= '1' or Cout /= '0') then
         errCnt := errCnt + 1;
      end if;

   --TEST 3
      A <= '0';
      B <= '1';
      cin <= '0';
      wait for 10 ns;
      assert(sum = '1') report "Error-3 in sum" severity error;
      assert(Cout = '0') report "Error-3 in Cout" severity error;
      if(sum /= '1' or Cout /= '0') then
         errCnt := errCnt + 1;
      end if;

   --TEST 4
      A <= '0';
      B <= '1';
      cin <= '1';
      wait for 10 ns;
      assert(sum = '0') report "Error-4 in sum" severity error;
      assert(Cout = '1') report "Error-4 in Cout" severity error;
      if(sum /= '0' or Cout /= '1') then
         errCnt := errCnt + 1;
      end if;

   --TEST 5
      A <= '1';
      B <= '0';
      cin <= '0';
      wait for 10 ns;
      assert(sum = '1') report "Error-5 in sum" severity error;
      assert(Cout = '0') report "Error-5 in Cout" severity error;
      if(sum /= '1' or Cout /= '0') then
         errCnt := errCnt + 1;
      end if;

   --TEST 6
      A <= '1';
      B <= '0';
      cin <= '1';
      wait for 10 ns;
      assert(sum = '0') report "Error-6 in sum" severity error;
      assert(Cout = '1') report "Error-6 in Cout" severity error;
      if(sum /= '0' or Cout /= '1') then
         errCnt := errCnt + 1;
      end if;

   --TEST 7
      A <= '1';
      B <= '1';
      cin <= '0';
      wait for 10 ns;
      assert(sum = '0') report "Error-7 in sum" severity error;
      assert(Cout = '1') report "Error-7 in Cout" severity error;
      if(sum /= '0' or Cout /= '1') then
         errCnt := errCnt + 1;
      end if;

   --TEST 8
      A <= '1';
      B <= '1';
      cin <= '1';
      wait for 10 ns;
      assert(sum = '1') report "Error-8 in sum" severity error;
      assert(Cout = '1') report "Error-8 in Cout" severity error;
      if(sum /= '1' or Cout /= '1') then
         errCnt := errCnt + 1;
      end if;


     ---- SUMMARY ----
     if(errCnt = 0) then
        assert false report "Success!" severity note;
     else
        assert false report "Faillure!" severity note;
     end if;
     wait;	
   end process;
end arch;
-------------------------------------------------------------
configuration cfg_tb of fullAdder_tb is
   for arch
   end for;
end cfg_tb;
