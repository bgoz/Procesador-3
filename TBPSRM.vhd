LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY TBPSRM IS
END TBPSRM;
ARCHITECTURE behavior OF TBPSRM IS 
    COMPONENT PSRM
    PORT(
         rst : IN  std_logic;
         crs1 : IN  std_logic;
         crs2 : IN  std_logic;
         Aluop : IN  std_logic_vector(5 downto 0);
         Aluout : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rst : std_logic := '0';
   signal crs1 : std_logic := '0';
   signal crs2 : std_logic := '0';
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal Aluout : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRM PORT MAP (
          rst => rst,
          crs1 => crs1,
          crs2 => crs2,
          Aluop => Aluop,
          Aluout => Aluout,
          nzvc => nzvc
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		rst<='0';
		crs1<='0';
		crs2<='0';
		Aluop<="000000";
		Aluout<="00000000000000000000000000000001";
		wait for 20 ns;	
		rst<='0';
		crs1<='0';
		crs2<='0';
		Aluop<="010000";
		Aluout<="10000000000000000000000000000001";
		wait for 20 ns;	
		rst<='0';
		crs1<='0';
		crs2<='0';
		Aluop<="010000";
		Aluout<="11111111000000000000000000000001";
		wait for 20 ns;	
		rst<='0';
		crs1<='0';
		crs2<='0';
		Aluop<="010100";
		Aluout<="00000000000000000000000000000001";
		wait for 20 ns;	
		rst<='0';
		crs1<='0';
		crs2<='0';
		Aluop<="000000";
		Aluout<="00000000000000000000000000000001";
      wait;
   end process;
END;