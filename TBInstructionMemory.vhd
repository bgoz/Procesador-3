LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBInstructionMemory IS
END TBInstructionMemory;
ARCHITECTURE behavior OF TBInstructionMemory IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT InstructionMemory
    PORT(
         rst : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         imout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal imout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          rst => rst,
          address => address,
          imout => imout
        );
   -- Stimulus process
   stim_proc: process
   begin		
      rst<='0';
      address<="00000000000000000000000000000000";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000000";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000001";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000010";
		wait for 100 ns;
		rst<='1';
      address<="00000000000000000000000000000010";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000011";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000100";
		wait for 100 ns;
		rst<='0';
      address<="00000000000000000000000000000000";
		wait;
   end process;
END;