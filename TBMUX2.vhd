LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_1164.ALL;
ENTITY TBMUX2 IS
END TBMUX2;
ARCHITECTURE behavior OF TBMUX2 IS 
    COMPONENT MUX2
    PORT(
         rd : IN  std_logic_vector(5 downto 0);
         rfdes : IN  std_logic;
         nrd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal rfdes : std_logic := '0';
 	--Outputs
   signal nrd : std_logic_vector(5 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX2 PORT MAP (
          rd => rd,
          rfdes => rfdes,
          nrd => nrd
        );
   -- Stimulus process
   stim_proc: process
	begin
      wait for 20 ns;	
		rd <= "000000";
		rfdes <= '0';
		wait for 20 ns;
		rd <= "000000";
		rfdes <= '1';
      wait;
   end process;
END;