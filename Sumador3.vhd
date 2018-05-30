library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity Sumador3 is
    Port ( in1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           in2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           outs3 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end Sumador3;
architecture Behavioral of Sumador3 is
begin
	process(in1,in2)
	begin
		outs3<=in1+in2;
	end process;
end Behavioral;

---Este modulo suma el disp30 con el program counter y es utilizado para los call