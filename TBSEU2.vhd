LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBSEU2 IS
END TBSEU2;
ARCHITECTURE behavior OF TBSEU2 IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT SEU2
    PORT(
         Imm : IN  std_logic_vector(21 downto 0);
         out32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Imm : std_logic_vector(21 downto 0) := (others => '0');
 	--Outputs
   signal out32 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU2 PORT MAP (
          Imm => Imm,
          out32 => out32
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		Imm <= "0000000000000000000001";
		wait for 20 ns;
		Imm <= "1000000000000000000001";
		wait for 20 ns;
		Imm <= "0100000000011111111111";
      wait;
   end process;
END;