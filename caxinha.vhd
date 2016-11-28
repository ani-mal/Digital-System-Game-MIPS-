library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY caxinha IS
	PORT(clk, reset : IN STD_LOGIC;
		key : in std_logic_VECTOR(7 downto 0);
		ESQ, DIR, UP, DOWN : out STD_LOGIC);
END caxinha;

ARCHITECTURE a OF caxinha IS
	SIGNAL BESQ, SESQ: STD_LOGIC;
	SIGNAL BDIR, SDIR: STD_LOGIC;
	SIGNAL BUP, SUP: STD_LOGIC;
	SIGNAL BDOWN, SDOWN: STD_LOGIC;
BEGIN

PROCESS (clk, reset, key)
BEGIN
	IF (reset = '1') THEN
		ESQ <= '0';
		DIR <= '0';
		UP <= '0';
		DOWN <= '0';
	ELSIF (clk'event) and (clk = '1') THEN
		-- Esquerda
		IF KEY = x"41" THEN
			BESQ <= '1';
		ELSIF KEY = x"FF" AND BESQ = '1' THEN
			SESQ <= '1';
			BESQ <= '0';
		END IF;
		IF SESQ = '1' THEN
			ESQ <= '1';
			SESQ <= '0';
		ELSIF SESQ = '0' THEN
			ESQ <= '0';
		END IF;
		
		-- Direita
		IF KEY = x"44" THEN
			BDIR <= '1';
		ELSIF KEY = x"FF" AND BDIR = '1' THEN
			SDIR <= '1';
			BDIR <= '0';
		END IF;
		IF SDIR = '1' THEN
			DIR <= '1';
			SDIR <= '0';
		ELSIF SDIR = '0' THEN
			DIR <= '0';
		END IF;
		
		-- Cima
		IF KEY = x"57" THEN
			BUP <= '1';
		ELSIF KEY = x"FF" AND BUP = '1' THEN
			SUP <= '1';
			BUP <= '0';
		END IF;
		IF SUP = '1' THEN
			UP <= '1';
			SUP <= '0';
		ELSIF SUP = '0' THEN
			UP <= '0';
		END IF;
		
		-- Desce
		IF KEY = x"53" THEN
			BDOWN <= '1';
		ELSIF KEY = x"FF" AND BDOWN = '1' THEN
			SDOWN <= '1';
			BDOWN <= '0';
		END IF;
		IF SDOWN = '1' THEN
			DOWN <= '1';
			SDOWN <= '0';
		ELSIF SDOWN = '0' THEN
			DOWN <= '0';
		END IF;
	END IF;
END PROCESS;

END a;
