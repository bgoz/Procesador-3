library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX4 is
    Port ( sumador1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           sumador2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           sumador3 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           alu : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           selectorcu : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           outmux4 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end MUX4;
architecture Behavioral of MUX4 is
begin
	process(sumador1,sumador2,sumador3,alu,selectorcu)
	begin
		if selectorcu = "00" then
			outmux4 <= sumador2;---branch  -disp22+pc
			
		elsif selectorcu = "01" then
			outmux4 <= sumador3;---call    -disp30+pc
			
		elsif selectorcu = "10" then
			outmux4 <= sumador1;---aritmeticologicas    pc+1
			
		elsif selectorcu = "11" then
			outmux4 <= alu;---load-storage-jumpandlink   ---address
			
		end if;
	end process;
end Behavioral;

---Este modulo me dice el numero de la instruccion a leer