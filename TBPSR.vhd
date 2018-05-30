LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TBPSR IS
END TBPSR;
ARCHITECTURE behavior OF TBPSR IS 
    COMPONENT PSR
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         NZVC : IN  std_logic_vector(3 downto 0);
         nCWP : IN  std_logic;
         CWP : OUT  std_logic;
         carry : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal nCWP : std_logic := '0';
 	--Outputs
   signal CWP : std_logic;
   signal carry : std_logic;
   signal icc : std_logic_vector(3 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          rst => rst,
          clk => clk,
          NZVC => NZVC,
          nCWP => nCWP,
          CWP => CWP,
          carry => carry,
          icc => icc
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
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		rst <= '0';
		NZVC <= "0000";
		nCWP <= '0';
		wait for 20 ns;	
		rst <= '0';
		NZVC <= "0000";
		nCWP <= '1';
		wait for 20 ns;	
		rst <= '0';
		NZVC <= "0011";
		nCWP <= '0';
		wait for 20 ns;	
		rst <= '0';
		NZVC <= "0011";
		nCWP <= '1';
		wait for 20 ns;	
		rst <= '1';
		NZVC <= "0011";
		nCWP <= '1';
		wait for 20 ns;	
		rst <= '0';
		NZVC <= "0000";
		nCWP <= '1';
      wait;
   end process;
END;