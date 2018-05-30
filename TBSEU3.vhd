LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBSEU3 IS
END TBSEU3;
ARCHITECTURE behavior OF TBSEU3 IS  
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT SEU3
    PORT(
         Imm : IN  std_logic_vector(29 downto 0);
         outseu3 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Imm : std_logic_vector(29 downto 0) := (others => '0');
 	--Outputs
   signal outseu3 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU3 PORT MAP (
          Imm => Imm,
          outseu3 => outseu3
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		Imm <= "000000000000000000000000000001";
		wait for 20 ns;
		Imm <= "111111111000000000000000000001";
		wait for 20 ns;
		Imm <= "010000000000000000011111111111";
      wait;
   end process;
END;