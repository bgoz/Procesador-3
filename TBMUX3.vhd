LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
ENTITY TBMUX3 IS
END TBMUX3;
ARCHITECTURE behavior OF TBMUX3 IS 
    COMPONENT MUX3
    PORT(
         dmemo : IN  std_logic_vector(31 downto 0);
         alu : IN  std_logic_vector(31 downto 0);
         pc : IN  std_logic_vector(31 downto 0);
         selectorcu : IN  std_logic_vector(1 downto 0);
         outmux3 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal dmemo : std_logic_vector(31 downto 0) := (others => '0');
   signal alu : std_logic_vector(31 downto 0) := (others => '0');
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal selectorcu : std_logic_vector(1 downto 0) := (others => '0');
 	--Outputs
   signal outmux3 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX3 PORT MAP (
          dmemo => dmemo,
          alu => alu,
          pc => pc,
          selectorcu => selectorcu,
          outmux3 => outmux3
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		dmemo <= "00000000000000000000000000011111";
		alu <= "00000000000000000000000111111000";
		pc <= "00000000000000000011111100000000";
		selectorcu <= "00";
		wait for 20 ns;	
		dmemo <= "00000000000000000000000000011111";
		alu <= "00000000000000000000000111111000";
		pc <= "00000000000000000011111100000000";
		selectorcu <= "01";
		wait for 20 ns;	
		dmemo <= "00000000000000000000000000011111";
		alu <= "00000000000000000000000111111000";
		pc <= "00000000000000000011111100000000";
		selectorcu <= "10";
		wait for 20 ns;	
		dmemo <= "00000000000000000000000000011111";
		alu <= "00000000000000000000000111111000";
		pc <= "00000000000000000011111100000000";
		selectorcu <= "11";
      wait;
   end process;
END;