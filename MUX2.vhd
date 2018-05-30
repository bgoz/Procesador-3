library IEEE;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX2 is
    Port ( rd : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           rfdes : in  STD_LOGIC;
           nrd : out  STD_LOGIC_VECTOR(5 DOWNTO 0):=(others=>'0'));
end MUX2;
architecture Behavioral of MUX2 is
begin 
	process(rd,rfdes)
	begin
		if rfdes = '0' then  --- pasa el rd
			nrd <= rd;
		else
			nrd <= "001111";  ---pasa el o7
		end if;
	end process;
end Behavioral;

--- Este modulo me escoge el rd = o7 cuando se hace un call o otro rd en otro caso