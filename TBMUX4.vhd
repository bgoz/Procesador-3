LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
ENTITY TBMUX4 IS
END TBMUX4;
ARCHITECTURE behavior OF TBMUX4 IS 
    COMPONENT MUX4
    PORT(
         sumador1 : IN  std_logic_vector(31 downto 0);
         sumador2 : IN  std_logic_vector(31 downto 0);
         sumador3 : IN  std_logic_vector(31 downto 0);
         alu : IN  std_logic_vector(31 downto 0);
         selectorcu : IN  std_logic_vector(1 downto 0);
         outmux4 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal sumador1 : std_logic_vector(31 downto 0) := (others => '0');
   signal sumador2 : std_logic_vector(31 downto 0) := (others => '0');
   signal sumador3 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu : std_logic_vector(31 downto 0) := (others => '0');
   signal selectorcu : std_logic_vector(1 downto 0) := (others => '0');
 	--Outputs
   signal outmux4 : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX4 PORT MAP (
          sumador1 => sumador1,
          sumador2 => sumador2,
          sumador3 => sumador3,
          alu => alu,
          selectorcu => selectorcu,
          outmux4 => outmux4
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		sumador1 <= "00000000000000000000000000001111";
		sumador2 <= "00000000000000000000000111100000";
		sumador3 <= "00000000000000000011110000000000";
		alu <= "00000000000011110000000000000000";
		selectorcu <= "00";
		wait for 20 ns;	
		sumador1 <= "00000000000000000000000000001111";
		sumador2 <= "00000000000000000000000111100000";
		sumador3 <= "00000000000000000011110000000000";
		alu <= "00000000000011110000000000000000";
		selectorcu <= "01";
		wait for 20 ns;	
		sumador1 <= "00000000000000000000000000001111";
		sumador2 <= "00000000000000000000000111100000";
		sumador3 <= "00000000000000000011110000000000";
		alu <= "00000000000011110000000000000000";
		selectorcu <= "10";
		wait for 20 ns;	
		sumador1 <= "00000000000000000000000000001111";
		sumador2 <= "00000000000000000000000111100000";
		sumador3 <= "00000000000000000011110000000000";
		alu <= "00000000000011110000000000000000";
		selectorcu <= "11";
      wait;
   end process;
END;