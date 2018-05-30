library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SEU2 is
    Port ( Imm : in  STD_LOGIC_VECTOR(21 DOWNTO 0);
           out32 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end SEU2;
architecture Behavioral of SEU2 is
begin
	process(Imm)
	begin
		if Imm(21) = '0' then 
			out32 <= "0000000000" & imm;
		else
			out32 <= "1111111111" & imm;
		end if;
	end process;
end Behavioral;

---Extiende el disp22 a 32 bits y se conecta al sumador2 y sirve para el jump and link