library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity MUX3 is
    Port ( dmemo : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           alu : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           pc : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           selectorcu : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           outmux3 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end MUX3;
architecture Behavioral of MUX3 is
begin
	process(dmemo,alu,pc,selectorcu)
	begin
		if selectorcu = "01" then  ---call - jump and link
			outmux3 <= pc;
		end if;
		if selectorcu = "10" then  ---aritmeticologicas
			outmux3 <= alu;
		end if;
		if selectorcu = "11" then  ---load and storage
			outmux3 <= dmemo;
		end if;
		if selectorcu = "00" then 
			outmux3 <= "00000000000000000000000000000000";
		end if;
	end process;
end Behavioral;

--- me dice que dato guardar en el register file