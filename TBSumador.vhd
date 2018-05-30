LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
ENTITY TBSumador IS
END TBSumador;
ARCHITECTURE behavior OF TBSumador IS 
    COMPONENT Sumador
    PORT(
         Datain : IN  std_logic_vector(31 downto 0);
         Dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Datain : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Dataout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          Datain => Datain,
          Dataout => Dataout
        );
   stim_proc: process
   begin			
		Datain<="00000000000000000000000000000001";
		wait for 100 ns;	
		Datain<="00000000000000000000000000000000";
		wait for 100 ns;	
		Datain<="00000000000000000000000000000010";
      wait;
   end process;
END;