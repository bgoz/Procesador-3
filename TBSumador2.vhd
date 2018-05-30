LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
ENTITY TBSumador2 IS
END TBSumador2;
ARCHITECTURE behavior OF TBSumador2 IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Sumador2
    PORT(
         in1 : IN  std_logic_vector(31 downto 0);
         in2 : IN  std_logic_vector(31 downto 0);
         outs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in2 : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal outs2 : std_logic_vector(31 downto 0);
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador2 PORT MAP (
          in1 => in1,
          in2 => in2,
          outs2 => outs2
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		in1<="00000000000000000000000000000001";
		in2<="00000000000000000000000000000001";
      wait;
   end process;
END;