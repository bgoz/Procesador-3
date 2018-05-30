LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY TBProcesador3 IS
END TBProcesador3;
ARCHITECTURE behavior OF TBProcesador3 IS 
    COMPONENT Procesador3
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         salidamux3 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
 	--Outputs
   signal salidamux3 : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador3 PORT MAP (
          rst => rst,
          clk => clk,
          salidamux3 => salidamux3
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
      wait for 10 ns;	
		rst <= '0';
		wait for 20 ns;	
		rst <= '1';
		wait for 20 ns;	
		rst <= '0';
		wait for 10 ns;	
		rst <= '0';
		wait for 20 ns;	
		rst <= '1';
		wait for 20 ns;	
		rst <= '0';
      wait;
   end process;
END;