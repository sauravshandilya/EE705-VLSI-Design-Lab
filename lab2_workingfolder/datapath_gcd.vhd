-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: GCD datapath implementation

-------------------------


-- ****** Datapath *******
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity gcd_datapath is
port 
( 
	sysclk: In bit;		-- input to data block
  reset: In bit;
  --done: out bit;
  
  -- data signals to/from environment
  data_in1        : in  bit_vector(7 downto 0);  -- in data-1
  data_in2        : in  bit_vector(7 downto 0);  -- in data-2
  data_out       : out bit_vector(7 downto 0);  -- gcd of data-1 and data-2
    
	---- Signal going from datapath to controller	
	eql : out bit;   -- comparator equal output
	lss : out bit;   -- comparator less then output 
			
	---- Signal from controller coming into datapath
  enable_data1_reg: in bit;     -- enable data-1 register
	reset_data1_reg: in bit;      -- reset data-1 register 

	enable_data2_reg: in bit;
	reset_data2_reg: in bit;

	enable_out_reg: in bit;
	reset_out_reg: in bit;
	
	enable_topositive: in bit;   -- enable register used in converting -ve number to positive.
	reset_topositive: in bit;
	
	data1muxsel: in bit;          -- Mux to select between input data-1 or its updated input
	data2muxsel: in bit	          -- Mux to select between input data-2 or its updated input
);
end gcd_datapath;

-- Architecture 
architecture arch of gcd_datapath is

-- components

component reg                       -- register 
  generic ( nbits : integer);                    -- no. of bits

  port (
    data_in : in bit_vector(nbits-1 downto 0);
    data_out : out bit_vector(nbits-1 downto 0);
    clk : in bit;
    enable : in  bit;
    reset : in  bit
    );
  end component;


component toPositive        -- convert negative input numbers to psotive
port 
(
    input : in bit_vector(7 downto 0);
    isnegative : out bit;
    output : out bit_vector(7 downto 0);
    clk : in bit;
    reset : in bit;   
    enable : in bit  
);
end component;
    
component comparator_8bit is              -- 8 bit comparator to find if input1 = input2 or input1 < input2
port
(
  comp_in1 : in bit_vector(7 downto 0) ;
  comp_in2 : in bit_vector(7 downto 0) ;  
  eql,grt,lss : out bit 
);
end component;

component fulladdsub is		                 -- 8-bit subtractor
	PORT (A,B:IN bit_vector(7 DOWNTO 0); addsub:IN bit; sum:OUT bit_vector(7 DOWNTO 0);Cout:OUT bit);
end component;

component Mux2x1_8bit is                        -- 2x1 mux for 8 bit input
	PORT ( Mux_in_1:IN bit_vector(7 DOWNTO 0);
			Mux_in_2:IN bit_vector(7 DOWNTO 0);
			sel:IN bit; 
			mux_out:OUT bit_vector(7 DOWNTO 0)
			);
end component;

-- signals
signal sig_positive_data1, sig_positive_data2 : bit_vector (7 downto 0);
signal sig_mux1out,sig_mux2out : bit_vector (7 downto 0);
signal sig_sub1out,sig_sub2out : bit_vector (7 downto 0);
signal sig_reg1out,sig_reg2out : bit_vector (7 downto 0);
signal sig_data_out : bit_vector (7 downto 0);
signal sig_isnegative1,sig_isnegative2 : bit;

begin
-- step-1 check if number is negative or positive .. if negative convert it to positive.
posdata1 : toPositive                       
    port map(
        input => data_in1,
        isnegative => sig_isnegative1,
        output => sig_positive_data1,
        clk => sysclk,
        reset => reset_topositive,
        enable => enable_topositive);
        
posdata2 : toPositive 
    port map(
        input => data_in2,
        isnegative => sig_isnegative2,
        output => sig_positive_data2,
        clk => sysclk,
        reset => reset_topositive,
        enable => enable_topositive);

-- step-2 Select between input data or its updated value
muxdata1 : Mux2x1_8bit 
    port map ( 
        Mux_in_1 => sig_positive_data1,
        Mux_in_2 => sig_sub1out,
        sel => data1muxsel,
		mux_out => sig_mux1out);

muxdata2 : Mux2x1_8bit 
    port map ( 
        Mux_in_1 => sig_positive_data2,
        Mux_in_2 => sig_sub2out,
        sel => data2muxsel,
		mux_out => sig_mux2out);

-- step-3 Store Mux output in register
reg1data1 : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_mux1out,    
      data_out => sig_reg1out,
      clk    => sysclk,
      reset  => reset_data1_reg,
      enable => enable_data1_reg);

reg2data2 : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_mux2out,
      data_out => sig_reg2out,
      clk    => sysclk,
      reset  => reset_data2_reg,
      enable => enable_data2_reg);  
       
-- step-4 compare value 
comp : comparator_8bit
    port map(
        comp_in1 => sig_reg1out,
        comp_in2 => sig_reg2out, 
        eql => eql,
        grt => open,
        lss => lss );        

-- step-5 perform subtraction
sub1 : fulladdsub
	port map(
        A => sig_reg1out,  
        B => sig_reg2out,
        addsub => '1', 
        sum => sig_sub1out, 
        Cout => open );
        
sub2 : fulladdsub
	port map(
        A => sig_reg2out,  
        B => sig_reg1out,
        addsub => '1', 
        sum => sig_sub2out, 
        Cout => open );   

-- step-6 Output data        
reg3out : reg
    generic map ( nbits => 8 )
    port map (
      data_in  => sig_reg1out,    -- output data
      data_out => data_out,
      clk    => sysclk,
      reset  => reset_out_reg,
      enable => enable_out_reg); 
  
end arch;  