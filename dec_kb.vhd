library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY dec_kb IS
	PORT(hex_bus		: IN	STD_LOGIC_VECTOR(7 downto 0);
		 scan_rd 		: IN 	STD_LOGIC;
		 clk	 		: IN 	STD_LOGIC;		
	     bin_digit      : OUT STD_LOGIC_VECTOR(7 downto 0));

END dec_kb;

ARCHITECTURE a OF dec_kb IS
signal f, f2, f3, state	: STD_LOGIC;
signal cc				: STD_LOGIC_VECTOR(1 downto 0);

BEGIN
PROCESS (f3, hex_bus)
	variable saida : STD_LOGIC_VECTOR (7 downto 0);
	
BEGIN
if (f3'EVENT AND f3='1') then
	
	if cc = "00" then 
		cc <= "01";
	end if;
	
	if cc = "01" and hex_bus = x"F0" then 
		cc <= "10";
	end if;

	if cc = "10" then 
		cc <= "00";
	end if;



		case hex_bus is --bloco das teclas normais
			when x"1c" => saida := x"41";
			when x"32" => saida := x"42";
			when x"21" => saida := x"43";
			when x"23" => saida := x"44";
			when x"24" => saida := x"45";
			when x"2b" => saida := x"46";
			when x"34" => saida := x"47";
			when x"33" => saida := x"48";
			when x"43" => saida := x"49";
			when x"3b" => saida := x"4a";
			when x"42" => saida := x"4b";
			when x"4b" => saida := x"4c";
			when x"3a" => saida := x"4d";
			when x"31" => saida := x"4e";
			when x"44" => saida := x"4f";
			when x"4d" => saida := x"50";
			when x"15" => saida := x"51";
			when x"2d" => saida := x"52";
			when x"1b" => saida := x"53";
			when x"2c" => saida := x"54";
			when x"3c" => saida := x"55";
			when x"2a" => saida := x"56";
			when x"1d" => saida := x"57";
			when x"22" => saida := x"58";
			when x"35" => saida := x"59";
			when x"1a" => saida := x"5a";


			when x"29" => saida := x"00"; --space
			when x"66" => saida := x"fe"; --backspace
			
			when x"69" => saida := x"f1"; --num1
			when x"72" => saida := x"f2"; --num2
			when x"7a" => saida := x"f3"; --num3
			when x"6b" => saida := x"f4"; --num4
			
			
			when x"16" => saida := x"31"; --1
			when x"1e" => saida := x"32"; --2
			when x"26" => saida := x"33"; --3
			when x"25" => saida := x"34"; --4
			when x"2e" => saida := x"35"; --5
			when x"36" => saida := x"36"; --6
			when x"3d" => saida := x"37"; --7
			when x"3e" => saida := x"38"; --8
			when x"46" => saida := x"39"; --9
			when x"45" => saida := x"30"; --0
			
			when others => saida := x"ff";
		end case;
		
		if (cc = "00") OR (cc = "01") then
			bin_digit <= saida;
		else
			bin_digit <= x"ff";
		end if;	
end if;
END PROCESS;


PROCESS (f2, scan_rd)
	
BEGIN
if (f2='0') then
	if (scan_rd'EVENT AND scan_rd='1') then
		  f<='1';
	end if;
else 
	f<='0';
end if;
END PROCESS;

PROCESS 
BEGIN

WAIT UNTIL (clk'EVENT AND clk='1');
if (f='1') then
	case state is
	    when '0' =>
				f3 <= '1';
	            state <= '1';
	    when '1' =>
				f3 <= '0';
				f2 <= '1';
	            state <= '0';
	end case;
else
		f2 <='0';
end if;

END PROCESS;

END a;
