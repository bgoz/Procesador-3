library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  cond : in  STD_LOGIC_VECTOR (3 downto 0);
			  werf : out  STD_LOGIC;
			  wedm : out  STD_LOGIC;
			  wrcc : out  STD_LOGIC;
			  selmux2 : out  STD_LOGIC;
			  selmux3 : out  STD_LOGIC_VECTOR (1 downto 0);
			  selmux4 : out  STD_LOGIC_VECTOR (1 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0):=(others=>'0'));
end ControlUnit;
architecture Behavioral of ControlUnit is
begin
	process(op,op2,op3,icc,cond)
		begin 
			case op is
				when "01" =>							--- 						call
						werf <= '1';
						wedm <= '0';
						wrcc <= '0';
						selmux2 <= '1'; --- guarda en o7 
						selmux3 <= "01";--- pasa pc
						selmux4 <= "01";--- disp30 + pc
						aluop <= op3;

				when "10" =>  						---                 aritmeticologicas
					if op3 = "111000" then	--- 		jump and link
						werf <= '0';
						wedm <= '0';
						wrcc <= '0';
						selmux2 <= '0'; ---rd 
						selmux3 <= "01";--- pasa pc 
						selmux4 <= "11";--- pasa alu
						aluop <= "000000";	
					else
						werf <= '1';
						wedm <= '0';
						wrcc <= '1';
						selmux2 <= '0'; ---  rd
						selmux3 <= "10";--- pasa el dato de la alu
						selmux4 <= "10";--- pasa el dato del sumador1
						aluop <= op3;
					end if;
					
				when "11" =>  					---                  load and storage
					if op3 = "000000" then ---load
						werf <= '1';	  
						wedm <= '0';
						wrcc <= '0';
						selmux2 <= '0';  ---rd
						selmux3 <= "11"; --- pasa el dato del data memory
						selmux4 <= "10";--- pasa el dato del sumador1
						aluop <= op3;
					elsif op3 = "000100" then ---storage
						werf <= '0';	  
						wedm <= '1';
						wrcc <= '0';
						selmux2 <= '0';  ---rd
						selmux3 <= "10"; --- pasa el dato de la alu
						selmux4 <= "10";--- pasa el dato del sumador1
						aluop <= op3;
					end if;
			
				when "00" =>  							---					 branch
					if op2 = "100" then ---nop
						werf <= '0';
						wedm <= '0';
						wrcc <= '0';
						selmux2 <= '0'; --- rd 
						selmux3 <= "01";--- pc
						selmux4 <= "10";--- sumador1
						aluop <= op3;
					end if;
				
					if op2 = "010" then
						case cond is
							when "1000" =>		---branch always							
								werf <= '0';
								wedm <= '0';
								wrcc <= '0';
								selmux2 <= '0'; --- rd 
								selmux3 <= "01";--- pc
								selmux4 <= "00";--- disp22 + pc
								aluop <= op3;
									
							when "0000" =>		---branch never
								werf <= '0';
								wedm <= '0';
								wrcc <= '0';
								selmux2 <= '0'; --- rd 
								selmux3 <= "01";--- pc
								selmux4 <= "10";--- pc+1
								aluop <= op3;
								
							when "1001" =>		---branch on not equal
								if (icc(2))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
							
							when "0001" =>		---branch on equal
								if icc(2)='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "1010" =>		---branch on greater
								if ((icc(2))or((icc(3))xor(icc(1))))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "0010" =>		---branch on less or equal
									if (icc(2)or((icc(3))xor(icc(1))))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "1011" =>		---branch on greater or equal
								if ((icc(3))xor(icc(1)))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "0011" =>		---branch on less
								if ((icc(3))xor(icc(1)))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "1100" =>		---branch on greater unsigned
								if ((icc(0))or(icc(2)))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "0100" =>		---branch on less or equal unsigned
								if ((icc(0))or(icc(2)))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
									
							when "1101" =>		---branch on carry clear
								if (icc(0))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
								
							when "0101" =>		---branch on carry set
								if (icc(0))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
								
							when "1110" =>		---branch on positive
								if (icc(3))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
								
							when "0110" =>		---branch on negative
								if (icc(3))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
								
							when "1111" =>		---branch on overflow clear
								if (icc(1))='0' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
								
							when "0111" =>			---branch on overflow set
								if (icc(1))='1' then
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "00";--- disp22 + pc
									aluop <= op3;
								else
									werf <= '0';
									wedm <= '0';
									wrcc <= '0';
									selmux2 <= '0'; --- rd 
									selmux3 <= "01";--- pc
									selmux4 <= "10";--- pc+1
									aluop <= op3;
								end if;
							when others =>
								werf <= '0';
								wedm <= '0';
								wrcc <= '0';
								selmux2 <= '0'; --- rd 
								selmux3 <= "01";--- pc
								selmux4 <= "10";--- pc+1
								aluop <= op3;
						end case;						
					end if;
				when others =>
					werf <= '0';
					wedm <= '0';
					wrcc <= '0';
					selmux2 <= '0'; --- rd 
					selmux3 <= "01";--- pc
					selmux4 <= "10";--- pc+1
					aluop <= op3;
			end case;
	end process;
end Behavioral;