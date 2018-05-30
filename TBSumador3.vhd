LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
ENTITY TBSumador3 IS
END TBSumador3;
ARCHITECTURE behavior OF TBSumador3 IS 
    COMPONENT Sumador3
    PORT(
         in1 : IN  std_logic_vector(31 downto 0);
         in2 : IN  std_logic_vector(31 downto 0);
         outs3 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in2 : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal outs3 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador3 PORT MAP (
          in1 => in1,
          in2 => in2,
          outs3 => outs3
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;	
		in1<="00000000000000000000000000000001";
		in2<="00000000000000000000000000000001";
      wait;
   end process;
END;