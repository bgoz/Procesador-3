LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBSEU1 IS
END TBSEU1;
ARCHITECTURE behavior OF TBSEU1 IS 
    COMPONENT SEU1
    PORT(
         Imm : IN  std_logic_vector(12 downto 0);
         Seuout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Imm : std_logic_vector(12 downto 0) := (others => '0');
 	--Outputs
   signal Seuout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU1 PORT MAP (
          Imm => Imm,
          Seuout => Seuout
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		Imm <= "0000000000001";
		wait for 20 ns;
		Imm <= "1000000000001";
		wait for 20 ns;
		Imm <= "0111111111111";
      wait;
   end process;
END;