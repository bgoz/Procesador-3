LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY TBALU IS
END TBALU;
ARCHITECTURE behavior OF TBALU IS 
    COMPONENT ALU
    PORT(
         Aluin1 : IN  std_logic_vector(31 downto 0);
         Aluin2 : IN  std_logic_vector(31 downto 0);
         Carry : IN  std_logic;
         Aluop : IN  std_logic_vector(5 downto 0);
         Aluout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Aluin1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Aluin2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Carry : std_logic := '0';
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
 	--Outputs
   signal Aluout : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Aluin1 => Aluin1,
          Aluin2 => Aluin2,
          Carry => Carry,
          Aluop => Aluop,
          Aluout => Aluout
        );
   -- Stimulus process
   stim_proc: process
   begin		
       Aluin1<="00000000000000000000000000000001";
		 Aluin2<="00000000000000000000000000000001";
		 Carry<='0';
		 Aluop<="000000";
		 wait for 100 ns;
		 Aluin1<="00000000000000000000000000000001";
		 Aluin2<="00000000000000000000000000000001";
		 Carry<='0';
		 Aluop<="000001";
		 wait for 100 ns;
		 Aluin1<="00000000000000000000000000000001";
		 Aluin2<="00000000000000000000000000000001";
		 Carry<='1';
		 Aluop<="010000";
		 wait for 100 ns;
		 Aluin1<="00000000000000000000000000000001";
		 Aluin2<="00000000000000000000000000000001";
		 Carry<='1';
		 Aluop<="010001";
		 wait for 100 ns;
      wait;
   end process;
END;