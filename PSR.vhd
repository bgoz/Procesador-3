library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PSR is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           nCWP : in  STD_LOGIC;
           CWP : out  STD_LOGIC;
           carry : out  STD_LOGIC;
			  icc : out  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others =>'0'));
end PSR;
architecture Behavioral of PSR is
begin
	process(clk)
		begin
			if (rst = '1') then 
				CWP <= '0';
				carry <= '0';
				icc<=NZVC;
			elsif (rising_edge(clk)) then
				CWP <= nCWP;
				carry <= NZVC(0);
				icc<=NZVC;
		end if;
	end process;
end Behavioral;