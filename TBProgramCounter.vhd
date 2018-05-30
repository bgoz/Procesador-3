LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBProgramCounter IS
END TBProgramCounter;
ARCHITECTURE behavior OF TBProgramCounter IS 
    COMPONENT ProgramCounter
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         Datain : IN  std_logic_vector(31 downto 0);
         Dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal Datain : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal Dataout : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          rst => rst,
          clk => clk,
          Datain => Datain,
          Dataout => Dataout
        );
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
      rst<='0';
		Datain<="00000000000000000000000000000000";
		wait for 100 ns;	
		rst<='0';
		Datain<="00000000000000000000000000000001";
		wait for 100 ns;	
		rst<='1';
		Datain<="00000000000000000000000001111111";
		wait for 100 ns;	
		rst<='0';
		Datain<="00000000000000000000000001111111";
      wait;
   end process;
END;