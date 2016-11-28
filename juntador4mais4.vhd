LIBRARY IEEE;
--library mgc_portable;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
--use mgc_portable.qsim_logic.ALL;


ENTITY juntador4mais4 IS
	PORT(	in0, in1		: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
			out0			: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
--			col1			: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0);
	--		row1			: OUT	STD_LOGIC_VECTOR(8 DOWNTO 0));
END juntador4mais4;

ARCHITECTURE b OF juntador4mais4 IS
BEGIN

PROCESS (in0, in1)
	VARIABLE X	: 	STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN

X := (in1 * "10100") + in0;
IF (in1 >= "1100") THEN
	out0 <= "11111111";
ELSE
	out0(7 DOWNTO 0) <= X(7 DOWNTO 0);
END IF;


END PROCESS;
END b;


