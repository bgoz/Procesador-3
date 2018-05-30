LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
ENTITY TBDataMemory IS
END TBDataMemory;
ARCHITECTURE behavior OF TBDataMemory IS 
    COMPONENT DataMemory
    PORT(
         rd : IN  std_logic_vector(31 downto 0);
         alu : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         we : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rd : std_logic_vector(31 downto 0) := (others => '0');
   signal alu : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal we : std_logic := '0';
 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          rd => rd,
          alu => alu,
          rst => rst,
          we => we,
          dataout => dataout
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		rd <= "00000";
		alu <= "00000000000000000000000000000001";
		rst <= '0';
		we <= '0';
		wait for 20 ns;	
		rd <= "00000";
		alu <= "00000000000000000000000000000001";
		rst <= '0';
		we <= '1';
		wait for 20 ns;	
		rd <= "00000";
		alu <= "00000000000000000000000000000001";
		rst <= '1';
		we <= '0';
		wait for 20 ns;	
		rd <= "00000";
		alu <= "00000000000000000000000000000001";
		rst <= '0';
		we <= '0';
      wait;
   end process;
END;