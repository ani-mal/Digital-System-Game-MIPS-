LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY conversorcor IS
	PORT(	r,g,b				: IN	STD_LOGIC;
			br,bg,bb				: OUT	STD_LOGIC_VECTOR(9 DOWNTO 0));
END conversorcor;

ARCHITECTURE b OF conversorcor IS
BEGIN

PROCESS (r, g, b)
BEGIN
if (r = '1') then br <= "1111111111";
else br <= "0000000000";
end if;

if (g = '1') then bg <= "1111111111";
else bg <= "0000000000";
end if;

if (b = '1') then bb <= "1111111111";
else bb <= "0000000000";
end if;

END PROCESS;
END b;
