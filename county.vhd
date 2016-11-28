library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY county IS
	PORT(tecla		: IN	STD_LOGIC_VECTOR(7 downto 0);
		 clk 		: IN 	STD_LOGIC;
	     data       : OUT   STD_LOGIC_VECTOR(7 downto 0);
	     cc         : OUT   STD_LOGIC_VECTOR(7 downto 0));
END county;

ARCHITECTURE a OF county IS
signal c : STD_LOGIC_VECTOR(7 downto 0);
signal x,y : STD_LOGIC;
BEGIN
PROCESS 
BEGIN

WAIT UNTIL (clk'EVENT AND clk='1');
if (tecla= x"fe") then

	data(7) <= x;
	data(6) <= y;	
	
	data(5 downto 0) <= "000000";

	if (c > x"00") then
		c <= c - '1';
		cc <= c - '1';
	else
		c <= x"ef";
		cc <= x"ef";

	end if;

elsif (tecla= x"f1") then
	x <= '0';
	y <= '0';
	cc <= "11111110";

elsif (tecla= x"f2") then
	x <= '0';
	y <= '1';
	cc <= "11111110";	

elsif (tecla= x"f3") then
	x <= '1';
	y <= '0';
	cc <= "11111110";

elsif (tecla= x"f4") then
	x <= '1';
	y <= '1';
	cc <= "11111110";

else

	if (c < x"ef") then
		c <= c + '1';
	else
		c <= x"00";
	end if;
		
	cc <= c;

	data(7) <= x;
	data(6) <= y;	
	
	data(5 downto 0) <= tecla(5 downto 0);

end if;

END PROCESS;

END a;
