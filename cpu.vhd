library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY cpu IS
	PORT(clk, reset	: IN	STD_LOGIC;
		IR1 		: in 	std_logic_VECTOR(15 downto 0);		
		ramout 		: out 	std_logic_VECTOR(15 downto 0);				
		ramaddress 	: out 	std_logic_VECTOR(15 downto 0);	
		ramwrite	: OUT	STD_LOGIC;			
		video		: out	std_logic_VECTOR(15 downto 0);
		key			: in 	std_logic_VECTOR(7 downto 0);	
		video_set	: in 	std_logic;
		Ponto		: out 	std_logic_VECTOR(1 downto 0);	
		DISPLAY1	: out 	std_logic_VECTOR(3 downto 0);
		DISPLAY2	: out 	std_logic_VECTOR(3 downto 0);
		video_ready	: out 	STD_LOGIC);
END cpu;

ARCHITECTURE a OF cpu IS
	TYPE	STATES IS (decode, exec, halted);
	TYPE	REGISTERS IS ARRAY (0 to 15) OF STD_LOGIC_VECTOR(15 downto 0);
	TYPE	OPERATION IS (op_sum, op_sub, op_mul, op_div);

-- Memory Instructions:	
	CONSTANT LOAD 		: STD_LOGIC_VECTOR (5 downto 0) := "110000"; -- Rx <- M[Ry]
	CONSTANT STORE 		: STD_LOGIC_VECTOR (5 downto 0) := "110001"; -- M[m] <- Rx
	CONSTANT OUTCHAR	: STD_LOGIC_VECTOR (5 downto 0) := "110010"; -- Video[Ry] <- Char(Rx)
	CONSTANT MOV	 	: STD_LOGIC_VECTOR (5 downto 0) := "110011"; -- Rx <- Ry
--	CONSTANT LOADCHAR 	: STD_LOGIC_VECTOR (5 downto 0) := "110100"; -- Rx <- Char (6 bits)
	CONSTANT INCHAR		: STD_LOGIC_VECTOR (5 downto 0) := "110101"; -- Rx <- KeyPressed	
	CONSTANT LOADLO 	: STD_LOGIC_VECTOR (3 downto 0) := "1110"; -- Rx[7..0] <- Const
	CONSTANT LOADHI 	: STD_LOGIC_VECTOR (3 downto 0) := "1111"; -- Rx[15..8] <- Const	

	CONSTANT ARITH      : STD_LOGIC_VECTOR (1 downto 0) := "10";
-- Aritmethic Instructions:	
	CONSTANT ADD 		: STD_LOGIC_VECTOR (3 downto 0) := "0000"; -- Rx <- Rx + Ry
	CONSTANT SUB 		: STD_LOGIC_VECTOR (3 downto 0) := "0001"; -- Rx <- Rx - Ry
	CONSTANT MULT	 	: STD_LOGIC_VECTOR (3 downto 0) := "0010"; -- Rx <- Rx * Ry
	CONSTANT DIV	 	: STD_LOGIC_VECTOR (3 downto 0) := "0011";
--	CONSTANT MODINT	 	: STD_LOGIC_VECTOR (3 downto 0) := "0100";

	CONSTANT LOGIC      : STD_LOGIC_VECTOR (1 downto 0) := "01";
-- Logic Instructions:	
	CONSTANT SHIFT 		: STD_LOGIC_VECTOR (3 downto 0) := "0000"; -- Shift/Rotate Rx-- b0=dir; b1=fill; b2=shif/rotate
	CONSTANT COMP 		: STD_LOGIC_VECTOR (3 downto 0) := "0001"; -- Compare Rx and Ry
	CONSTANT LAND 		: STD_LOGIC_VECTOR (3 downto 0) := "0010"; -- Rx <- Rx AND Ry
	CONSTANT LOR 		: STD_LOGIC_VECTOR (3 downto 0) := "0011"; -- Rx <- Rx OR Ry
	CONSTANT LXOR	 	: STD_LOGIC_VECTOR (3 downto 0) := "0100"; -- Rx <- Rx XOR Ry

-- FLOW CONTROL Instructions:	
	CONSTANT BRA 		: STD_LOGIC_VECTOR (5 downto 0) := "000001"; -- PC <- PC +- 7bit Const : b0,b1= 00-unconditional; 01-equal; 10-greater; 11-lesser
	CONSTANT JMP 		: STD_LOGIC_VECTOR (5 downto 0) := "000010"; --	PC <- 16bit Const : b0,b1= 00-unconditional; 01-equal; 10-greater; 11-lesser
	CONSTANT CALL	 	: STD_LOGIC_VECTOR (5 downto 0) := "000011"; -- M[SP] <- PC | SP ++ | PC <- 16bit Const
	CONSTANT RET	 	: STD_LOGIC_VECTOR (5 downto 0) := "000100"; -- SP -- | PC <- M[SP]

-- Other Instructions:	
	CONSTANT NOP	 	: STD_LOGIC_VECTOR (5 downto 0) := "000000"; -- Do Nothing
	CONSTANT HALT		: STD_LOGIC_VECTOR (5 downto 0) := "001111"; -- Stop Here

--Register Declaration:
	SIGNAL	PC		:STD_LOGIC_VECTOR(15 downto 0);	-- Program Counter
	SIGNAL	IR2		:STD_LOGIC_VECTOR(15 downto 0);	-- Instruction Register
	SIGNAL	SP		:STD_LOGIC_VECTOR(15 downto 0);	-- Stack Pointer
--	SIGNAL	MP		:STD_LOGIC_VECTOR(15 downto 0);	-- Memory Pointer
	SIGNAL	FL		:STD_LOGIC_VECTOR(15 downto 0);	-- Flag Register: <...|stackunderflow|stackoverflow|DivByZero|ArithmeticOverflow|carry|zero|equal|lesser|greater>
	signal  videoflag	:STD_LOGIC;

	SIGNAL	STATE		:STATES;
	SIGNAL	REG 		:REGISTERS;
	--SIGNAL	AUX			:STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL  OP			    :STD_LOGIC_VECTOR(5 downto 0);
	SIGNAL	X, Y, RESULT	:STD_LOGIC_VECTOR(15 downto 0);	 
	
BEGIN
PROCESS  (clk, reset)
		VARIABLE RX : INTEGER;
		VARIABLE RY : INTEGER;
		
--		VARIABLE RES : INTEGER;
--		VARIABLE RES2 :STD_LOGIC_VECTOR(16 downto 0);
		VARIABLE AUX  :STD_LOGIC_VECTOR(15 downto 0);		
BEGIN

if (reset = '1') then 

	REG(0)  <= x"0000";
	REG(1)  <= x"0000";	
	REG(2)  <= x"0000";
	REG(3)  <= x"0000";
	REG(4)  <= x"0000";
	REG(5)  <= x"0000";
	REG(6)  <= x"0000";
	REG(7)  <= x"0000";
	REG(8)  <= x"0000";
	REG(9)  <= x"0000";
	REG(10) <= x"0000";
	REG(11) <= x"0000";
	REG(12) <= x"0000";
	REG(13) <= x"0000";
	REG(14) <= x"0000";
	REG(15) <= x"0000";

	PC <= x"0000";
	SP <= x"01FF"; -- address 511 -> stack starts from RAM end
	IR2 <= x"0000";

--	MP <= x"0000";	
	state <= exec;
	ramaddress(15 downto 0) <=	x"0000";
	ramwrite <= '0';
	videoflag <= '0';
	display1 <= x"0";
	display2 <= x"0";
--	RES2 := "00000000000000000";

elsif (clk'event) and (clk = '1') then

	CASE state IS
--************************************************************************
-- DECODE STATE
--************************************************************************
        WHEN decode =>
			RX := conv_integer(IR1(9 DOWNTO 6));
			RY := conv_integer(IR1(5 DOWNTO 2));
			
--========================================================================
-- JMP
--========================================================================
			IF ((IR1(15 DOWNTO 10) = JMP) OR 
			    (IR1(15 DOWNTO 10) = BRA)) THEN --ok
				IF (IR1(10) = BRA(0)) THEN 
					IF (IR1(9) = '0') THEN
						AUX := PC + IR1(8 DOWNTO 2) - x"0001";
					ELSE
						AUX := PC - IR1(8 DOWNTO 2) - x"0001";					
					END IF;
				ELSE
					AUX := REG(RX);
				END IF;
				
				CASE IR1(1 DOWNTO 0) IS
					WHEN "01" => --equal (JMPE)
						IF (FL(2 DOWNTO 0) = "100") THEN
							PC <= AUX;
						END IF;
					WHEN "10" => --greater (JMPG)
						IF (FL(2 DOWNTO 0) = "001") THEN
							PC <= AUX;
						END IF;
					WHEN "11" => --lesser (JMPL)
						IF (FL(2 DOWNTO 0) = "010") THEN
							PC <= AUX;
						END IF;
--					WHEN "100" => --not equal (JMPNE)
--						IF (FL(2) = '0') THEN
--							PC <= REG(RX);
--						END IF;
--					WHEN "101" => --equal to Zero (JMPZ)
--						IF (FL(3) = '1') THEN
--							PC <= REG(RX);
--						END IF;
--					WHEN "110" => --not equal to Zero (JMPNZ)
--						IF (FL(3) = '0') THEN
--							PC <= REG(RX);
--						END IF;
					WHEN OTHERS => --unconditional
						PC <= AUX;
				END CASE;
			END IF;

--========================================================================
-- LOADLO/LOADHI
--========================================================================
			if (IR1(15 DOWNTO 12) = LOADLO) then --ok
				RX := conv_integer(IR1(11 DOWNTO 8));			 
				REG(RX)(7 DOWNTO 0) <= IR1(7 DOWNTO 0);
			end if;	
			if (IR1(15 DOWNTO 12) = LOADHI) then --ok
				RX := conv_integer(IR1(11 DOWNTO 8));			 
				REG(RX)(15 DOWNTO 8) <= IR1(7 DOWNTO 0);
			end if;	
			
--========================================================================
-- ARITHMETIC OPERATIONS
--========================================================================
			IF (IR1(15 DOWNTO 14) = ARITH) THEN --ok
			    IF (IR1(1 DOWNTO 0) = "01") THEN  -- INC/DEC Rx
					y <= x"0001";
				else
					y <= REG(RY);
				END IF;
				x <= REG(RX);				
				
				OP <= IR1(15 DOWNTO 10);
			END IF;

--========================================================================
-- LOGIC  OPERATIONS
--========================================================================
			IF (IR1(15 DOWNTO 14) = LOGIC) THEN --ok
				x <= REG(RX);
				y <= REG(RY);
				OP <= IR1(15 DOWNTO 10);
			END IF;

--========================================================================
-- SHIFT (ROTATE)
--========================================================================
--			IF (IR1(15 DOWNTO 10) = SHIFT) THEN --ok
--				IF (IR1(2) = '1') THEN 	-- Rotate
--					IF (IR1(1) = '1') THEN	-- Left
--						REG(RX)(15 DOWNTO 1) <= REG(RX)(14 DOWNTO 0);
--						REG(RX)(0) <= REG(RX)(15);
--					ELSE					-- Right
--						REG(RX)(14 DOWNTO 0) <= REG(RX)(15 DOWNTO 1);
--						REG(RX)(15) <= REG(RX)(0);
--					END IF;
--				ELSE					 -- Shift
--					IF (IR1(1) = '1') THEN	-- Left
--						REG(RX)(15 DOWNTO 1) <= REG(RX)(14 DOWNTO 0);
--						REG(RX)(0) <= IR1(0);
--					ELSE					-- Right
--						REG(RX)(14 DOWNTO 0) <= REG(RX)(15 DOWNTO 1);
--						REG(RX)(15) <= IR1(0);
--					END IF;
--				END IF;
--			END IF;
			
--========================================================================
-- OUTCHAR
--========================================================================
			IF(IR1(15 DOWNTO 10) = OUTCHAR) THEN --ok
				video(15 DOWNTO 8) <= REG(RX)(7 DOWNTO 0);
				video(7 DOWNTO 0)  <= REG(RY)(7 DOWNTO 0);
				videoflag <= '1'; -- Flag to set write signal to Video Memory
			else
				videoflag <= '0';
			END IF;

--========================================================================
-- CALL
--========================================================================
			if (IR1(15 DOWNTO 10) = CALL) then --ok
				ramaddress <= SP;
				SP <= SP - '1';				
				ramout <= PC;				
				PC <= REG(RX);
			end if;

--========================================================================
-- STORE
--========================================================================
			IF (IR1(15 DOWNTO 10) = STORE) THEN --ok
				ramaddress <= REG(RY); 
				ramout <= REG(RX);
			END IF;

--========================================================================
-- CALL/STORE - ram write control
--========================================================================
			if (IR1(15 DOWNTO 10) = CALL) OR (IR1(15 DOWNTO 10) = STORE) then
				ramwrite <= '1';
			else
				ramwrite <= '0';
			end if;

--========================================================================
-- RET
--========================================================================
			if (IR1(15 DOWNTO 10) = RET) then --ok
				ramaddress <= SP + '1';
				SP <= SP + '1';
			end if;

--========================================================================
-- LOAD
--========================================================================
			IF (IR1(15 DOWNTO 10) = LOAD) THEN --ok
				ramaddress <= REG(RY); 
			END IF;

--========================================================================
-- INCHAR - reads 6 bits from keyboard and fill the others with 0
--========================================================================
			IF(IR1(15 DOWNTO 10) = INCHAR) THEN --ok
				REG(RX)(5 DOWNTO 0) <= key(5 DOWNTO 0); -- Rx get last Key Pressed
				REG(RX)(15 DOWNTO 6) <= "0000000000"; 
			END IF;			
			
--========================================================================
-- MOV
--========================================================================
			if (IR1(15 DOWNTO 10) = MOV) then --ok
				REG(RX) <= REG(RY);
			end if;	

--========================================================================
-- HALT
--========================================================================
			IF( IR1(15 DOWNTO 10) = HALT) THEN --ok
				state <= halted;
			ELSE
				state <= exec;			
			END IF;

--========================================================================
-- EXEC TRANSITION
--========================================================================
			IR2 <= IR1;

			PONTO <= "01";	
			DISPLAY1 <= PC(3 DOWNTO 0); 
			DISPLAY2 <= PC(7 DOWNTO 4);			

--************************************************************************
-- EXEC STATE
--************************************************************************
        WHEN exec =>
			RX := conv_integer(IR2(9 DOWNTO 6));

--========================================================================
-- ARITH/LOGIC - part 2
--========================================================================
			IF ((IR2(15 DOWNTO 14) = ARITH) OR
			    (IR2(15 DOWNTO 14) = LOGIC)) THEN --ok
				REG(RX) <= RESULT;
			END IF;

--========================================================================
-- LOAD - part 2
--========================================================================
			IF (IR2(15 DOWNTO 10) = LOAD) THEN --ok
				-- IR1 is now the operand
				REG(RX)(15 DOWNTO 0) <= IR1(15 DOWNTO 0); 
			END IF;

--========================================================================
-- RET - part 2
--========================================================================
			if (IR2(15 DOWNTO 10) = RET) then --ok
				PC <= IR1;
			else
				PC <= PC + 1;
			end if;			
			
--========================================================================
-- DECODE TRANSITION
--========================================================================
			ramwrite <= '0';			
			videoflag <= '0';
			
			state <= decode;
			
			PONTO <= "10";
			DISPLAY1 <= PC(3 DOWNTO 0); 
			DISPLAY2 <= PC(7 DOWNTO 4);			
			
--========================================================================
-- DELAYED FETCH (by solo)
--========================================================================
			ramaddress(15 downto 0) <= PC(15 downto 0);
--			PC <= PC + '1';

	   WHEN halted =>
			PONTO <= "11";	
			state <= halted;
	   WHEN OTHERS =>
			state <= exec;
			videoflag <= '0';
	END CASE;
end if;

END PROCESS;

--************************************************************************
-- ULA --->  3456  (3042)
--************************************************************************
PROCESS (OP, X, Y, reset)
	VARIABLE AUX :STD_LOGIC_VECTOR(15 downto 0);
	VARIABLE RESULT32 :STD_LOGIC_VECTOR(31 downto 0);	
BEGIN

	IF (reset = '1') THEN
		FL <= x"0000";		
		RESULT <= x"0000";
	else

--========================================================================
-- ARITH 
--========================================================================
		IF (OP (5 downto 4) = ARITH) THEN
			CASE OP (3 downto 0) IS
				WHEN ADD =>
					AUX := X + Y;
--					if(RES1 > "01111111111111111") THEN -- Carry
--						FL(4) <= '1';
--					ELSE
--						FL(4) <= '0';
--					end if;
					
				WHEN SUB =>
					AUX := X - Y;
					
				WHEN MULT =>
					RESULT32 := X * Y;
					AUX := RESULT32(15 downto 0);
					if(RESULT32 > x"0000FFFF") THEN -- Arithmetic Overflow
						FL(5) <= '1';
					ELSE
						FL(5) <= '0';
					end if;

				WHEN DIV =>
					IF(Y = x"0000") THEN
						AUX := x"0000";
						FL(6) <= '1'; -- Div by Zero
					ELSE
						AUX := CONV_STD_LOGIC_VECTOR(CONV_INTEGER(X)/CONV_INTEGER(Y), 16);		
						FL(6) <= '0';
					END IF;
											
				WHEN others =>   -- invalid operation, defaults to nothing
					AUX := X;
			END CASE;
			if(AUX = x"0000") THEN
				FL(2 downto 0) <= "100";  -- FL = <...|zero|equal|lesser|greater>
			ELSE
				FL(2 downto 0) <= "000";  -- FL = <...|zero|equal|lesser|greater>
			end if;	
			RESULT <= AUX;
			
		ELSIF (OP (5 downto 4) = LOGIC) THEN
			IF (OP (3 downto 0) = COMP) THEN
				result <= x;
				IF (x > y) THEN
					FL(2 downto 0) <= "001"; -- FL = <...|zero|equal|lesser|greater>
				ELSIF (x < y) THEN
					FL(2 downto 0) <= "010"; -- FL = <...|zero|equal|lesser|greater>
				ELSIF (x = y) THEN
					FL(2 downto 0) <= "100"; -- FL = <...|zero|equal|lesser|greater>
				END IF;
			ELSE
				CASE OP (3 downto 0) IS
					WHEN LAND => result <= x and y;

					WHEN LXOR => result <= x xor y;

					WHEN LOR =>	result <= x or y;

					WHEN others =>   -- invalid operation, defaults to nothing
						RESULT <= X;
				END CASE;
				if(result = x"0000") THEN
					FL(2 downto 0) <= "100";  -- FL = <...|zero|equal|lesser|greater>
				ELSE
					FL(2 downto 0) <= "000";  -- FL = <...|zero|equal|lesser|greater>
				end if;	
			END IF;
		END IF;
	END IF; -- Reset
END PROCESS;


PROCESS (videoflag, video_set)
BEGIN
  IF video_set = '1' THEN video_ready <= '0';
  ELSIF videoflag'EVENT and videoflag = '1' THEN
	video_ready <= '1';
  END IF;
END PROCESS;

END a;
