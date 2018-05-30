library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Procesador3 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salidamux3 : out  STD_LOGIC_vector(31 downto 0));
end Procesador3;
architecture Behavioral of Procesador3 is
COMPONENT ALU
	PORT(
		Aluin1 : IN std_logic_vector(31 downto 0);
		Aluin2 : IN std_logic_vector(31 downto 0);
		Carry : IN std_logic;
		Aluop : IN std_logic_vector(5 downto 0);          
		Aluout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT ControlUnit
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op2 : IN std_logic_vector(2 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		werf : OUT std_logic;
		wedm : OUT std_logic;
		wrcc : OUT std_logic;
		selmux2 : OUT std_logic;
		selmux3 : OUT std_logic_vector(1 downto 0);
		selmux4 : OUT std_logic_vector(1 downto 0);
		aluop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT DataMemory
	PORT(
		rd : IN std_logic_vector(31 downto 0);
		alu : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		we : IN std_logic;          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		address : IN std_logic_vector(31 downto 0);          
		imout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT MUX1
	PORT(
		Muxin1 : IN std_logic_vector(31 downto 0);
		Muxin2 : IN std_logic_vector(31 downto 0);
		Selector : IN std_logic;          
		Muxout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT MUX2
	PORT(
		rd : IN std_logic_vector(5 downto 0);
		rfdes : IN std_logic;          
		nrd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT MUX3
	PORT(
		dmemo : IN std_logic_vector(31 downto 0);
		alu : IN std_logic_vector(31 downto 0);
		pc : IN std_logic_vector(31 downto 0);
		selectorcu : IN std_logic_vector(1 downto 0);          
		outmux3 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT MUX4
	PORT(
		sumador1 : IN std_logic_vector(31 downto 0);
		sumador2 : IN std_logic_vector(31 downto 0);
		sumador3 : IN std_logic_vector(31 downto 0);
		alu : IN std_logic_vector(31 downto 0);
		selectorcu : IN std_logic_vector(1 downto 0);          
		outmux4 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT PSRM
	PORT(
		wrcc: in STD_LOGIC;
		rst : IN std_logic;
		crs1 : IN std_logic;
		crs2 : IN std_logic;
		Aluop : IN std_logic_vector(5 downto 0);
		Aluout : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
COMPONENT PSR
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);
		nCWP : IN std_logic;          
		CWP : OUT std_logic;
		carry : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
COMPONENT ProgramCounter
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		Datain : IN std_logic_vector(31 downto 0);          
		Dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT RegisterFile
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;
		we : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		crd3 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT SEU1
	PORT(
		Imm : IN std_logic_vector(12 downto 0);          
		Seuout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT SEU2
	PORT(
		Imm : IN std_logic_vector(21 downto 0);          
		out32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT SEU3
	PORT(
		Imm : IN std_logic_vector(29 downto 0);          
		outseu3 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Sumador2
	PORT(
		in1 : IN std_logic_vector(31 downto 0);
		in2 : IN std_logic_vector(31 downto 0);          
		outs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Sumador3
	PORT(
		in1 : IN std_logic_vector(31 downto 0);
		in2 : IN std_logic_vector(31 downto 0);          
		outs3 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Sumador
	PORT(
		Datain : IN std_logic_vector(31 downto 0);          
		Dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT WindowsManager
	PORT(
		cwp : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		cwpout : OUT std_logic;
		rs1out : OUT std_logic_vector(5 downto 0);
		rs2out : OUT std_logic_vector(5 downto 0);
		rdout : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
COMPONENT nProgramCounter
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		Datain1 : IN std_logic_vector(31 downto 0);          
		Dataout1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
signal rftoalu1,dmtomux3,rftodm,mux3torf,mux4tonpc,sum2tomux4,sum1tomux4,sum3tomux4,npctopc,muxtoalu,alutodt,rftomux1,seu1tomux1,im,seu2tosum2,seu3tosum3,pctoim : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal cutoalu,mux2torf,wmtorf1,wmtorf2,wmtomux2 : std_logic_vector(5 downto 0) := "000000";
signal psrmtopsr,psrtocu : std_logic_vector(3 downto 0) := "0000";
signal sm3,sm4 : std_logic_vector(1 downto 0) := "00";	
signal psrtoalu,wmtopsr,cutomux2,psrcwp,wrf,wdm,swrcc : std_logic := '0';	

begin
	Inst_ALU: ALU PORT MAP(
		Aluin1 => rftoalu1,
		Aluin2 => muxtoalu,
		Carry => psrtoalu,
		Aluop => cutoalu,
		Aluout => alutodt
	);
	Inst_ControlUnit: ControlUnit PORT MAP(
		op => im(31 downto 30),
		op2 => im(24 downto 22),
		op3 => im(24 downto 19),
		icc => psrtocu,
		cond => im(28 downto 25),
		werf => wrf,
		wedm => wdm,
		wrcc => swrcc,
		selmux2 => cutomux2,
		selmux3 => sm3,
		selmux4 => sm4,
		aluop => cutoalu
	);
	Inst_DataMemory: DataMemory PORT MAP(
		rd => rftodm,
		alu => alutodt,
		rst => rst,
		we => wdm,
		dataout => dmtomux3
	);
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => rst,
		address => pctoim,
		imout => im 
	);
	Inst_MUX1: MUX1 PORT MAP(
		Muxin1 => rftomux1,
		Muxin2 => seu1tomux1,
		Selector => im(13),
		Muxout => muxtoalu
	);
	Inst_MUX2: MUX2 PORT MAP(
		rd => wmtomux2,
		rfdes => cutomux2,
		nrd => mux2torf
	);
	Inst_MUX3: MUX3 PORT MAP(
		dmemo => dmtomux3,
		alu => alutodt,
		pc => pctoim,
		selectorcu => sm3,
		outmux3 => mux3torf
	);
	Inst_MUX4: MUX4 PORT MAP(
		sumador1 => sum1tomux4,
		sumador2 => sum2tomux4,
		sumador3 => sum3tomux4,
		alu => alutodt,
		selectorcu => sm4,
		outmux4 => mux4tonpc
	);
	Inst_PSRM: PSRM PORT MAP(
		wrcc => swrcc,
		rst => rst,
		crs1 => rftoalu1(31),
		crs2 => muxtoalu(31),
		Aluop => cutoalu,
		Aluout => alutodt,
		nzvc => psrmtopsr
	);
	Inst_PSR: PSR PORT MAP(
		rst => rst,
		clk => clk,
		NZVC => psrmtopsr,
		nCWP => wmtopsr,
		CWP => psrcwp,
		carry => psrtoalu,
		icc => psrtocu
	);
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		rst => rst,
		clk => clk,
		Datain => npctopc,
		Dataout => pctoim
	);
	Inst_RegisterFile: RegisterFile PORT MAP(
		rs1 => wmtorf1,
		rs2 => wmtorf2,
		rd => mux2torf,
		rst => rst,
		we => wrf,
		dwr => mux3torf,
		crs1 => rftoalu1,
		crs2 => rftomux1,
		crd3 => rftodm
	);
	Inst_SEU1: SEU1 PORT MAP(
		Imm => im(12 downto 0),
		Seuout => seu1tomux1
	);
	Inst_SEU2: SEU2 PORT MAP(
		Imm => im(21 downto 0),
		out32 => seu2tosum2
	);
	Inst_SEU3: SEU3 PORT MAP(
		Imm => im(29 downto 0),
		outseu3 => seu3tosum3
	);
	Inst_Sumador2: Sumador2 PORT MAP(
		in1 => pctoim,
		in2 => seu2tosum2,
		outs2 => sum2tomux4
	);
	Inst_Sumador3: Sumador3 PORT MAP(
		in1 => seu3tosum3,
		in2 => pctoim,
		outs3 => sum3tomux4
	);
	Inst_Sumador: Sumador PORT MAP(
		Datain => pctoim,
		Dataout => sum1tomux4
	);
	Inst_WindowsManager: WindowsManager PORT MAP(
		cwp => psrcwp,
		rs1 => im(18 downto 14),
		rs2 => im(4 downto 0),
		rd => im(29 downto 25),
		op => im(31 downto 30),
		op3 => im(24 downto 19),
		cwpout => wmtopsr,
		rs1out => wmtorf1,
		rs2out => wmtorf2,
		rdout => wmtomux2
	);
	Inst_nProgramCounter: nProgramCounter PORT MAP(
		rst => rst,
		clk => clk,
		Datain1 => mux4tonpc,
		Dataout1 => npctopc
	);
	salidamux3<=mux3torf;
	process(clk)
	begin
	end process;
end Behavioral;