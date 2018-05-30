LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
ENTITY TBRegisterFile IS
END TBRegisterFile;
ARCHITECTURE behavior OF TBRegisterFile IS 
    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         rst : IN  std_logic;
         we : IN  std_logic;
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         crd3 : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal we : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   signal crd3 : std_logic_vector(4 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
          we => we,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2,
          crd3 => crd3
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		rs1 <="000001";
		rs2 <="000010";
		rd <= "000011";
		rst <= '0';
		we <= '1';
		dwr <= "00000000000000000000000000001111";
		wait for 20 ns;
		rs1 <="000011";
		rs2 <="000011";
		rd <= "000011";
		rst <= '0';
		we <= '1';
		dwr <= "00000000000000000000000000000111";
		wait for 20 ns;
		rs1 <="000001";
		rs2 <="000010";
		rd <= "000011";
		rst <= '1';
		we <= '0';
		dwr <= "00000000000000000000000000000011";
		wait for 20 ns;
		rs1 <="000001";
		rs2 <="000010";
		rd <= "000011";
		rst <= '0';
		we <= '1';
		dwr <= "00000000000000000000000000001111";
		wait for 20 ns;
		rs1 <="000011";
		rs2 <="000011";
		rd <= "000011";
		rst <= '0';
		we <= '1';
		dwr <= "00000000000000000000000000000001";
		wait for 20 ns;
		rs1 <="000011";
		rs2 <="000011";
		rd <= "000011";
		rst <= '0';
		we <= '1';
		dwr <= "00000000000000000000000000000001";
      wait;
   end process;
END;