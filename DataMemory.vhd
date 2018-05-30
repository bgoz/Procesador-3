library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
entity DataMemory is
    Port ( rd : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           alu : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0'));
end DataMemory;
architecture Behavioral of DataMemory is
type reg is array (31 downto 0) of std_logic_vector (31 downto 0);
signal registro: reg; 
begin
	process(rd,alu,rst,we)
	begin
		if(rst = '1') then 
			registro <= (others => "00000000000000000000000000000000");
		else
			if(we = '1') then 
				registro(conv_integer(rd)) <= alu;
			end if;
		end if;
		dataout <= registro(conv_integer(rd));		
	end process;
end Behavioral;