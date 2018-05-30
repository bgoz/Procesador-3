library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SEU3 is
    Port ( Imm : in  STD_LOGIC_VECTOR(29 DOWNTO 0);
           outseu3 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end SEU3;
architecture Behavioral of SEU3 is
begin
	process(Imm)
	begin
		if Imm(29) = '0' then 
			outseu3 <= "00" & imm;
		else
			outseu3 <= "11" & imm;
		end if;
	end process;
end Behavioral;


---Extiende el disp30 a 32 bits y se conecta al sumador3  y se ultiliza en el call