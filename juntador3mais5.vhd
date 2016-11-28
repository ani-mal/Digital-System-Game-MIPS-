LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY juntador3mais5 IS
	PORT(	in0				: IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
			in1				: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			out0			: OUT	STD_LOGIC_VECTOR(8 DOWNTO 0));
END juntador3mais5;

ARCHITECTURE b OF juntador3mais5 IS
BEGIN

PROCESS (in0, in1)
BEGIN

--IF (in1 > "110") THEN
--	out0 <= "000000000";
--ELSE
	out0(8 DOWNTO 3) <= in1(5 DOWNTO 0);
	out0(2 DOWNTO 0) <= in0(2 DOWNTO 0);
--END IF;

END PROCESS;
END b;
