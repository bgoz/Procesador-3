LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBMUX1 IS
END TBMUX1;
ARCHITECTURE behavior OF TBMUX1 IS 
    COMPONENT MUX1
    PORT(
         Muxin1 : IN  std_logic_vector(31 downto 0);
         Muxin2 : IN  std_logic_vector(31 downto 0);
         Selector : IN  std_logic;
         Muxout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Muxin1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Muxin2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Selector : std_logic := '0';
 	--Outputs
   signal Muxout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX1 PORT MAP (
          Muxin1 => Muxin1,
          Muxin2 => Muxin2,
          Selector => Selector,
          Muxout => Muxout
        );
   -- Stimulus process
   stim_proc: process
   begin	
		wait for 20 ns;
      Muxin1<="00000000000000000000000000000111";
		Muxin2<="00000000000000000000000000000000";
		Selector<='0';
		wait for 20 ns;
      Muxin1<="00000000000000000000000000000111";
		Muxin2<="00000000000000000000000000000000";
		Selector<='1';
      wait;
   end process;
END;