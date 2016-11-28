library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY maqest IS
	PORT(sig		: IN	STD_LOGIC;
		 clk 		: IN 	STD_LOGIC;
	     m          : OUT   STD_LOGIC;
	     w          : OUT   STD_LOGIC);

END maqest;

ARCHITECTURE a OF maqest IS
signal state : STD_LOGIC_VECTOR(2 downto 0);
signal f, f2 : STD_LOGIC;
signal cc    : STD_LOGIC_VECTOR(1 downto 0);

BEGIN
PROCESS (f2 , sig)
BEGIN
if (f2='0') then

	if (sig'EVENT AND sig='1') then
--		if (cc = "00") then
		  f<='1';
--		end if;
--		cc <= cc + '1';
--		if (cc = "10") then
--		  cc <= "00";
--		end if;		
	end if;

else 
	f<='0';
	  
end if;
	



end process;

PROCESS 
BEGIN

WAIT UNTIL (clk'EVENT AND clk='1');
if (f='1') then
case state is
    when "001" =>
        m <= '0';
        w <= '0';
 --       if (clk = '0') then
            state <= "010";
 --       end if;
    when "010" =>
        m <= '0';
        w <= '0';
 --       if (clk = '1') then
            state <= "011";
  --      end if;
    when "011" =>
        m <= '1';
        w <= '0';
 --       if (clk = '0') then
            state <= "100";
  --      end if;
    when "100" =>
        m <= '1';
        w <= '1';
		f2 <= '1';
  --      if (clk = '1') then
            state <= "001";
  --      end if;
	when others => state <= "001";
end case;

else
		m <= '0';
        w <= '0';
		f2 <='0';
end if;
END PROCESS;

END a;
