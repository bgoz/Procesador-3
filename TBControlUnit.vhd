LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY TBControlUnit IS
END TBControlUnit;
ARCHITECTURE behavior OF TBControlUnit IS 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op2 : IN  std_logic_vector(2 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         werf : OUT  std_logic;
         wedm : OUT  std_logic;
         selmux2 : OUT  std_logic;
         selmux3 : OUT  std_logic_vector(1 downto 0);
         selmux4 : OUT  std_logic_vector(1 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');
 	--Outputs
   signal werf : std_logic;
   signal wedm : std_logic;
   signal selmux2 : std_logic;
   signal selmux3 : std_logic_vector(1 downto 0);
   signal selmux4 : std_logic_vector(1 downto 0);
   signal aluop : std_logic_vector(5 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op2 => op2,
          op3 => op3,
          icc => icc,
          cond => cond,
          werf => werf,
          wedm => wedm,
          selmux2 => selmux2,
          selmux3 => selmux3,
          selmux4 => selmux4,
          aluop => aluop
        );
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;	
		op <= "00";
		op2 <= "000";
		op3 <= "000000";
		icc <= "1000";
		cond <= "0000";
		wait for 20 ns;	
		op <= "00";
		op2 <= "010";
		op3 <= "000000";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "01";
		op2 <= "010";
		op3 <= "111111";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "10";
		op2 <= "010";
		op3 <= "111111";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "10";
		op2 <= "010";
		op3 <= "111000";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "10";
		op2 <= "010";
		op3 <= "000000";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "11";
		op2 <= "010";
		op3 <= "000001";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "10";
		op2 <= "010";
		op3 <= "000000";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "10";
		op2 <= "010";
		op3 <= "000100";
		icc <= "0000";
		cond <= "1000";
		wait for 20 ns;	
		op <= "00";
		op2 <= "000";
		op3 <= "000000";
		icc <= "1000";
		cond <= "0000";
      wait;
   end process;
END;