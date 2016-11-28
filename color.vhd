library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY color IS
	PORT(x, y, p	: IN	STD_LOGIC;
	     r , g , b  : OUT   STD_LOGIC);

END color;

ARCHITECTURE a OF color IS

BEGIN
PROCESS (x , y)
BEGIN
if ((x='0') and (y='0')) then
	if (p='1') then
		r <= '0';
		g <= '0';
		b <= '0';				
	else
		r <= '0';
		g <= '0';
		b <= '0';				
	end if;
end if;

if ((x='0') and (y='1')) then
	if (p='1') then
		r <= '1';
		g <= '0';
		b <= '0';				
	else
		r <= '0';
		g <= '0';
		b <= '0';				
	end if;
end if;

if ((x='1') and (y='0')) then
	if (p='1') then
		r <= '0';
		g <= '1';
		b <= '0';				
	else
		r <= '0';
		g <= '0';
		b <= '0';				
	end if;
end if;

if ((x='1') and (y='1')) then
	if (p='1') then
		r <= '0';
		g <= '0';
		b <= '1';				
	else
		r <= '0';
		g <= '0';
		b <= '0';				
	end if;
end if;

END PROCESS;

END a;
