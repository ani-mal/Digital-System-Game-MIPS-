-- *************************************************
-- JOGO CUPIDO 
--„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½ES:
-- As teclas W e S movimentam o FLEXA
-- para cima e para baixo.
-- As teclas A e D movimentam o FLEXA 
-- para esquerda e direita.
-- *************************************************
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY notepad IS

	PORT(
		clk, reset : IN	STD_LOGIC;
		video		: OUT	STD_LOGIC_VECTOR(17 DOWNTO 0);  -- 2 bits para a cor 6 bits para o caracter 8 bits de endereco (direita para esquerda)
		key			: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);	-- teclado
		video_set	: IN 	STD_LOGIC;
		video_ready	: out 	STD_LOGIC
		);

END  notepad ;

ARCHITECTURE a OF notepad IS
	
	SIGNAL videoflag   : STD_LOGIC;
	-- Escreve na tela
	SIGNAL VIDEOE      : STD_LOGIC_VECTOR(7 DOWNTO 0);
	

	SIGNAL videoflagg   : STD_LOGIC;
	-- Escreve na tela
	SIGNAL VIDEOEe      : STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- Contador de tempo
	SIGNAL VIDEOaux      : STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- Contador de tempo
	
	
	
		-- Contador
	SIGNAL CONTPOS   : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CONTPOSA  : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CONTCHAR  : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL CONTCOR   : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	-- FLEXA
	SIGNAL FLEXAPOS   : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL FLEXAPOSA  : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL FLEXACHAR  : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL FLEXACOR   : STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- Coracao
	SIGNAL CORACAOPOS     : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CORACAOPOSA    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CORACAOCHAR    : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL CORACAOCOR     : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL INCCORACAO     : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL SINAL	    : STD_LOGIC;
	
	-- Coracao do Mal
	SIGNAL CORACAOMALPOS     : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CORACAOMALPOSA    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CORACAOMALCHAR    : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL CORACAOMALCOR     : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL INCCORACAOMAL     : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL SINAL2	    : STD_LOGIC;

	--Delay do FLEXA
	SIGNAL DELAY1      : STD_LOGIC_VECTOR(7 DOWNTO 0);
	--Delay da Bolinha
	SIGNAL DELAY2      : STD_LOGIC_VECTOR(7 DOWNTO 0);
	--Delay do Contador
	SIGNAL DELAY3      : STD_LOGIC_VECTOR(7 DOWNTO 0);
		--Delay do Contador
	SIGNAL DELAY4      : STD_LOGIC_VECTOR(7 DOWNTO 0);
		--Delay do Coracao do Mal
	SIGNAL DELAY5      : STD_LOGIC_VECTOR(7 DOWNTO 0);

	SIGNAL FLEXAESTADO : STD_LOGIC_VECTOR(7 DOWNTO 0);
	--Estados da Bolinha
	SIGNAL B_ESTADO    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	--Estados do Contaodr
	SIGNAL C_ESTADO    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	--Estados do Coracao do mal
	SIGNAL D_ESTADO    : STD_LOGIC_VECTOR(7 DOWNTO 0);
		--Estados do Contaodr
	SIGNAL CONTADOR    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CONTADOR1    : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL CONTADOR2    : STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN

-- Movimenta BARRAS
PROCESS (clk, reset)
	
	BEGIN
		
	IF RESET = '1' THEN
		FLEXACHAR <= "111011";
		FLEXACOR <= "1011"; -- Lime
		FLEXAPOS <= x"64";
		FLEXAPOSA <= x"00";
		
		DELAY1 <= x"00";
		FLEXAESTADO <= x"00";
		
	ELSIF (clk'event) and (clk = '1') THEN

		CASE FLEXAESTADO IS
			WHEN x"00" => -- Estado movimenta FLEXA segundo Teclado
			
				CASE key IS
					WHEN x"53" => -- (S) BAIXO
					   FLEXACHAR <= "111110";
						IF (FLEXAPOS < 220) THEN   -- nao esta' na ultima linha
							FLEXAPOSA <= FLEXAPOS;
							FLEXAPOS <= FLEXAPOS + x"14";  -- FLEXAPOS + 20
						END IF;
					WHEN x"57" => -- (W) CIMA
						FLEXACHAR <= "111101";
						IF (FLEXAPOS > 19) THEN   -- nao esta' na primeira linha
							FLEXAPOSA <= FLEXAPOS;
							FLEXAPOS <= FLEXAPOS - x"14";  -- FLEXAPOS - 20
						END IF;
					WHEN x"41" => -- (A) ESQUERDA
						FLEXACHAR <= "111100";
						IF (NOT((conv_integer(FLEXAPOS) MOD 20) = 0)) THEN   -- nao esta' na extrema esquerda
							FLEXAPOSA <= FLEXAPOS;
							FLEXAPOS <= FLEXAPOS - x"01";  -- FLEXAPOS - 1
						END IF;
					WHEN x"44" => -- (D) DIREITA
						FLEXACHAR <= "111011";
						IF (NOT((conv_integer(FLEXAPOS) MOD 20) = 19)) THEN   -- nao esta' na extrema direita
							FLEXAPOSA <= FLEXAPOS;
							FLEXAPOS <= FLEXAPOS + x"01";  -- FLEXAPOS + 1
						END IF;
					WHEN OTHERS =>
				END CASE;
				FLEXAESTADO <= x"01";

			
			WHEN x"01" => -- Delay para movimentar FLEXA
			 
				IF DELAY1 >= x"64" THEN
					DELAY1 <= x"00";
					FLEXAESTADO <= x"00";
				ELSE
					DELAY1 <= DELAY1 + x"01";
				END IF;
				
			WHEN OTHERS =>
		END CASE;
	END IF;

END PROCESS;

-- Coracao
PROCESS (clk, reset)

BEGIN
		
	IF RESET = '1' THEN
		CORACAOCHAR <= "111010";
		CORACAOCOR <= x"D"; -- rosa
		CORACAOPOS <= x"6E";
		CORACAOPOSA <= x"00";
		INCCORACAO <= x"15";
		SINAL <= '0';
		
		DELAY2 <= x"00";
		B_ESTADO <= x"00";
		
	ELSIF (clk'event) and (clk = '1') THEN

				CASE B_ESTADO iS
					WHEN x"00" =>
						-- INCREMENTA A POS DA CORACAO
						
							CORACAOPOSA <= CORACAOPOS;   -- Pos Anterior = Pos Atual
							
							IF (SINAL = '0') THEN CORACAOPOS <= CORACAOPOS + INCCORACAO;
							ELSE CORACAOPOS <= CORACAOPOS - INCCORACAO; END IF;
							
							B_ESTADO <= x"01";
						
					WHEN x"01" => -- CORACAO esta' subindo e chegou na linha de cima : SINAL = 1
						IF (CORACAOPOS < 20) THEN
							IF (INCCORACAO = 21) THEN INCCORACAO <= x"13"; SINAL <= '0'; END IF;
							IF (INCCORACAO = 20) THEN INCCORACAO <= x"14"; SINAL <= '0'; END IF;
							IF (INCCORACAO = 19) THEN INCCORACAO <= x"15"; SINAL <= '0'; END IF;
						end if;							

						B_ESTADO <= x"02";


					WHEN x"02" => -- CORACAO esta' descendo e chegou na linha de baixo : SINAL = 0
						IF (CORACAOPOS > 219) THEN
							IF (INCCORACAO = 21) THEN INCCORACAO <= x"13"; SINAL <= '1'; END IF;
							IF (INCCORACAO = 20) THEN INCCORACAO <= x"14"; SINAL <= '1'; END IF;
							IF (INCCORACAO = 19) THEN INCCORACAO <= x"15"; SINAL <= '1'; END IF;
						end if;							

						B_ESTADO <= x"03";
	
					WHEN x"03" => -- CORACAO esta' indo para direita e chegou na extrema direita: SINAL = ? 
						IF ((conv_integer(CORACAOPOS) MOD 20) = 19) THEN
							IF (INCCORACAO = 19) THEN INCCORACAO <= x"15"; SINAL <= '1'; END IF;
							IF (INCCORACAO = 1) THEN INCCORACAO <= x"01"; SINAL <= '1'; END IF;
							IF (INCCORACAO = 21) THEN INCCORACAO <= x"13"; SINAL <= '0'; END IF;
						end if;							

						B_ESTADO <= x"04";
	
					WHEN x"04" => -- CORACAO esta' indo para esquerda e chegou na extrema esquerda: SINAL = ? 
						IF ((conv_integer(CORACAOPOS) MOD 20) = 0) THEN
							IF (INCCORACAO = 19) THEN INCCORACAO <= x"15"; SINAL <= '0'; END IF;
							IF (INCCORACAO = 1) THEN INCCORACAO <= x"01"; SINAL <= '0'; END IF;
							IF (INCCORACAO = 21) THEN INCCORACAO <= x"13"; SINAL <= '1'; END IF;
						end if;							

						B_ESTADO <= x"05";

					WHEN x"05" =>  -- Delay da CORACAO
			       
					 IF conTADOR > x"02" and CONTADOR < x"05" THEN --trocando a velocidade do coracao de acordo coma pontuacao
						IF DELAY2 >= x"00" THEN  -- FASE 2
							DELAY2 <= x"A0";
							B_ESTADO <= x"00";
						ELSE
							DELAY2 <= DELAY2 + x"01";
						END IF;
					END IF;
					
					B_ESTADO <= x"06";
					
					WHEN x"06" =>  -- Delay da CORACAO
			       
					 IF conTADOR > x"04" THEN --trocando a velocidade do coracao de acordo coma pontuacao
						IF DELAY2 >= x"00" THEN -- FASE 3
							DELAY2 <= x"C0";
							B_ESTADO <= x"00";
						ELSE
							DELAY2 <= DELAY2 + x"01";
						END IF;
					END IF;
			
					B_ESTADO <= x"FB";
	
					WHEN OTHERS =>
						IF DELAY2 >= x"FA" THEN 
							DELAY2 <= x"00";
							B_ESTADO <= x"00";
						ELSE
							DELAY2 <= DELAY2 + x"01";
						END IF;
						
					
				END CASE;
				

	END IF;
	
END PROCESS;

-- Coracao do Mal
PROCESS (clk, reset)

BEGIN
		
	IF RESET = '1' THEN
		CORACAOMALCHAR <= "111010";
		CORACAOMALCOR <= x"B"; -- azul
		CORACAOMALPOS <= x"6A";
		CORACAOMALPOSA <= x"00";
		INCCORACAOMAL <= x"15";
		SINAL2 <= '0';
		
		DELAY5 <= x"00";
		D_ESTADO <= x"00";
		
	ELSIF (clk'event) and (clk = '1') THEN

				CASE B_ESTADO iS
					WHEN x"00" =>
						-- INCREMENTA A POS DA CORACAO
						
							CORACAOMALPOSA <= CORACAOMALPOS;   -- Pos Anterior = Pos Atual
							
							IF (SINAL = '0') THEN CORACAOMALPOS <= CORACAOMALPOS + INCCORACAOMAL;
							ELSE CORACAOMALPOS <= CORACAOMALPOS - INCCORACAOMAL; END IF;
							
							D_ESTADO <= x"01";
						
					WHEN x"01" => -- CORACAO esta' subindo e chegou na linha de cima : SINAL = 1
						IF (CORACAOMALPOS < 20) THEN
							IF (INCCORACAOMAL = 21) THEN INCCORACAOMAL <= x"15"; SINAL2 <= '0'; END IF;
							IF (INCCORACAO = 20) THEN INCCORACAOMAL <= x"16"; SINAL2 <= '0'; END IF;
							IF (INCCORACAO = 19) THEN INCCORACAOMAL <= x"17"; SINAL2 <= '0'; END IF;
						end if;							

						D_ESTADO <= x"02";


					WHEN x"02" => -- CORACAO esta' descendo e chegou na linha de baixo : SINAL = 0
						IF (CORACAOMALPOS > 219) THEN
							IF (INCCORACAOMAL = 21) THEN INCCORACAOMAL <= x"15"; SINAL2 <= '1'; END IF;
							IF (INCCORACAOMAL = 20) THEN INCCORACAOMAL <= x"16"; SINAL2 <= '1'; END IF;
							IF (INCCORACAOMAL = 19) THEN INCCORACAOMAL <= x"17"; SINAL2 <= '1'; END IF;
						end if;							

						D_ESTADO <= x"03";
	
					WHEN x"03" => -- CORACAO esta' indo para direita e chegou na extrema direita: SINAL = ? 
						IF ((conv_integer(CORACAOMALPOS) MOD 20) = 19) THEN
							IF (INCCORACAOMAL = 19) THEN INCCORACAOMAL <= x"17"; SINAL2 <= '1'; END IF;
							IF (INCCORACAOMAL = 1) THEN INCCORACAOMAL <= x"01"; SINAL2 <= '1'; END IF;
							IF (INCCORACAOMAL = 21) THEN INCCORACAOMAL <= x"15"; SINAL2 <= '0'; END IF;
						end if;							

						D_ESTADO <= x"04";
	
					WHEN x"04" => -- CORACAO esta' indo para esquerda e chegou na extrema esquerda: SINAL = ? 
						IF ((conv_integer(CORACAOMALPOS) MOD 20) = 0) THEN
							IF (INCCORACAOMAL = 19) THEN INCCORACAOMAL <= x"17"; SINAL2 <= '0'; END IF;
							IF (INCCORACAOMAL = 1) THEN INCCORACAOMAL <= x"01"; SINAL2 <= '0'; END IF;
							IF (INCCORACAOMAL = 21) THEN INCCORACAOMAL <= x"15"; SINAL2 <= '1'; END IF;
						end if;							

						D_ESTADO <= x"05";

				--	WHEN x"05" =>  -- Delay da CORACAO
			     --  
					-- IF conTADOR > x"02" and CONTADOR < x"05" THEN --trocando a velocidade do coracao de acordo coma pontuacao
						--IF DELAY5 >= x"00" THEN  -- FASE 2
						--	DELAY5 <= x"A0";
						--	D_ESTADO <= x"00";
					--	ELSE
					--		DELAY5 <= DELAY5 + x"01";
					--	END IF;
				--	END IF;
					
				--	D_ESTADO <= x"06";
					
					--WHEN x"06" =>  -- Delay da CORACAO
			      
					-- IF conTADOR > x"04" THEN --trocando a velocidade do coracao de acordo coma pontuacao
					--	IF DELAY5 >= x"00" THEN -- FASE 3
						--	DELAY5 <= x"C0";
						--	D_ESTADO <= x"00";
					--	ELSE
						--	DELAY5 <= DELAY5 + x"01";
						--END IF;
					--END IF;
			
					--D_ESTADO <= x"FB";
	
					WHEN OTHERS =>
						IF DELAY5 >= x"FA" THEN 
							DELAY5 <= x"00";
							D_ESTADO <= x"00";
						ELSE
							DELAY5 <= DELAY5 + x"01";
						END IF;
						
					
				END CASE;	
	
		
	END IF;
	
END PROCESS;

-- Contador
PROCESS (clk, reset)

BEGIN
	IF RESET = '1' THEN
		CONTCHAR <= "110000";
		CONTCOR <= "1110"; 
		CONTPOS <= x"DC";
		CONTPOSA <= x"00";	
		C_ESTADO <= x"00";
		CONTADOR <= x"00";
		CONTADOR1 <= x"00";
		CONTADOR2 <= x"00";
		
		
	ELSIF (clk'event) and (clk = '1') THEN			
							
				CASE C_ESTADO iS
					WHEN x"00" =>
						IF (CORACAOPOS = FLEXAPOS) THEN --Verifica a Posicao do "FLEXA" e do coracao
							case CONTADOR is 
								when x"00" => CONTCHAR <= "110001";
								when x"01" => CONTCHAR <= "110010";
								when x"02" => CONTCHAR <= "110011";
								when x"03" => CONTCHAR <= "110100";
								when x"04" => CONTCHAR <= "110101";
								when x"05" => CONTCHAR <= "110110";
								when x"06" => CONTCHAR <= "110111";
								--when x"07" => CONTCHAR <= "110000";
								when others => CONTCHAR <= "111000"; CONTADOR <= x"00"; 
													
							END CASE;
							C_ESTADO <= x"FF";
							
							CONTADOR <= CONTADOR + x"01";	
							
							END IF;
					
					WHEN x"FF" =>  -- Delay do contador 
			
						IF DELAY4 >= x"FF" THEN 
							DELAY4 <= x"00"; 
							C_ESTADO <= x"00";
						ELSE
							DELAY4 <= DELAY4 + x"01";
						END IF;
						
						
					WHEN OTHERS => -- acabar o jogo e imprimir "END GAME ! CONGRATS"
							C_ESTADO <= x"00";
							CONTCHAR <= "110000"; --vai pra 0

							
					END CASE;
							
				END IF;
				
				
				
END PROCESS;
						
						
-- Escreve na Tela
PROCESS (clk, reset)

BEGIN
	IF RESET = '1' THEN
		VIDEOE <= x"00";
		videoflag <= '0';
	
	
	ELSIF (clk'event) and (clk = '1') THEN
		   
	
			CASE VIDEOE IS
			
				WHEN x"00" =>
					videoflag <= '0';
					if CONTADOR = x"06" then
						 VIDEOE <= x"14";
					elsif CORACAOMALPOS = FLEXAPOS then 
						 VIDEOE <= x"40";
					else VIDEOE <= x"01";	
					end if;
					
				WHEN x"01" => -- Desenha FLEXA
					video(17 downto 14) <= FLEXACOR; -- Cor
					video(13 downto 8) <= FLEXACHAR; -- Caractere
					video(7 downto 0) <= FLEXAPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"02";
					
			
				WHEN x"02" =>
					videoflag <= '0';
					VIDEOE <= x"03";
					
				WHEN x"03" => -- Desenha coracao
					video(17 downto 14) <= CORACAOCOR; -- Cor
					video(13 downto 8) <= CORACAOCHAR; -- Caractere
					video(7 downto 0) <= CORACAOPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"04";
					
				WHEN x"04" =>
					videoflag <= '0';
					VIDEOE <= x"05";
					
				WHEN x"05" => -- Desenha Coracao do Mal
					video(17 downto 14) <= CORACAOMALCOR; -- Cor
					video(13 downto 8) <= CORACAOMALCHAR; -- Caractere
					video(7 downto 0) <= CORACAOMALPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"06";
					
				WHEN x"06" =>
					videoflag <= '0';
					VIDEOE <= x"07";
					
				WHEN x"07" => -- Apaga FLEXA
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= FLEXAPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"08";
					
				WHEN x"08" =>
					videoflag <= '0';
					VIDEOE <= x"09";
					
				WHEN x"09" => -- Apaga CORACAO
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"10";
					
				WHEN x"10" =>
					videoflag <= '0';
					VIDEOE <= x"11";
					
				WHEN x"11" => -- Apaga CORACAO
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"12";
					
				WHEN x"12" =>
					videoflag <= '0';
					VIDEOE <= x"13";
					
				WHEN x"13" => -- Desenha CONTADOR
					video(17 downto 14) <= CONTCOR; -- Cor
					video(13 downto 8) <= CONTCHAR; -- Caractere
					video(7 downto 0) <= CONTPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"80";					
							
							
				WHEN x"14" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "011001"; -- Caractere Y   
					video(7 downto 0) <= x"6A"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"15";
					
				WHEN x"15" =>
					videoflag <= '0';
					VIDEOE <= x"16";
							
				WHEN x"16" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001111"; -- Caractere O  
					video(7 downto 0) <= x"6B"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"17";
					
				WHEN x"17" =>
					videoflag <= '0';
					VIDEOE <= x"18"; 
					
				WHEN x"18" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "010101"; -- Caractere U  
					video(7 downto 0) <= x"6C"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"19";
					
				WHEN x"19" =>
					videoflag <= '0';
					VIDEOE <= x"20"; 
					
				WHEN x"20" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "010010"; -- Caractere R 
					video(7 downto 0) <= x"95"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"21";
					
				WHEN x"21" =>
					videoflag <= '0';
					VIDEOE <= x"22";
					
				WHEN x"22" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001111"; -- Caractere O 
					video(7 downto 0) <= x"96"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"23";
					
				WHEN x"23" =>
					videoflag <= '0';
					VIDEOE <= x"24";
					
				WHEN x"24" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "000011"; -- Caractere C 
					video(7 downto 0) <= x"97"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"25";
					
				WHEN x"25" =>
					videoflag <= '0';
					VIDEOE <= x"26";
				
					
				WHEN x"26" => -- Apaga FLEXA
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere K
					video(7 downto 0) <= FLEXAPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"27";
					
				WHEN x"27" =>
					videoflag <= '0';
					VIDEOE <= x"28";
					
				WHEN x"28" => -- Apaga Coracao
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"29";	
					
				WHEN x"29" =>
					videoflag <= '0';
					VIDEOE <= x"30";
				
				WHEN x"30" => -- Apaga Coracao do Mal
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOMALPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"31";	
					
				WHEN x"31" =>
					videoflag <= '0';
					VIDEOE <= x"32";
				
				WHEN x"32" => -- Apaga contador
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CONTPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"33";
						
				WHEN x"33" =>
					videoflag <= '0';
					VIDEOE <= x"34";
					
				WHEN x"34" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001011"; -- Caractere K 
					video(7 downto 0) <= x"98"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"35";
					
				WHEN x"35" =>
					videoflag <= '0';
					VIDEOE <= x"14";
				
			
		-- GAME OVERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
				WHEN x"40" =>

					video(17 downto 14) <= CORACAOCOR; -- Cor
					video(13 downto 8) <= "011001"; -- Caractere Y   
					video(7 downto 0) <= x"6A"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"41";
					
				WHEN x"41" =>
					videoflag <= '0';
					VIDEOE <= x"42";
							
				WHEN x"42" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001111"; -- Caractere O  
					video(7 downto 0) <= x"6B"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"43";
					
				WHEN x"43" =>
					videoflag <= '0';
					VIDEOE <= x"44"; 
					
				WHEN x"44" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "010101"; -- Caractere U  
					video(7 downto 0) <= x"6C"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"45";
					
				WHEN x"45" =>
					videoflag <= '0';
					VIDEOE <= x"46"; 
					
				WHEN x"46" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "010010"; -- Caractere R 
					video(7 downto 0) <= x"95"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"47";
					
				WHEN x"47" =>
					videoflag <= '0';
					VIDEOE <= x"48";
					
				WHEN x"48" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001111"; -- Caractere O 
					video(7 downto 0) <= x"96"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"49";
					
				WHEN x"49" =>
					videoflag <= '0';
					VIDEOE <= x"50";
					
				WHEN x"50" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "000011"; -- Caractere C 
					video(7 downto 0) <= x"97"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"51";
					
				WHEN x"51" =>
					videoflag <= '0';
					VIDEOE <= x"52";
				
					
				WHEN x"52" => -- Apaga FLEXA
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere K
					video(7 downto 0) <= FLEXAPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"53";
					
				WHEN x"53" =>
					videoflag <= '0';
					VIDEOE <= x"54";
					
				WHEN x"54" => -- Apaga Coracao
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"55";	
					
				WHEN x"55" =>
					videoflag <= '0';
					VIDEOE <= x"56";
				
				WHEN x"56" => -- Apaga Coracao do Mal
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOMALPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"57";	
					
				WHEN x"57" =>
					videoflag <= '0';
					VIDEOE <= x"58";
				
				WHEN x"58" => -- Apaga contador
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CONTPOS; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"59";
						
				WHEN x"60" =>
					videoflag <= '0';
					VIDEOE <= x"61";
					
				WHEN x"61" =>

					video(17 downto 14) <= "1010"; -- Cor
					video(13 downto 8) <= "001011"; -- Caractere K 
					video(7 downto 0) <= x"98"; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"62";
					
				WHEN x"62" =>
					videoflag <= '0';
					VIDEOE <= x"40";
				
	   -- FIM GAME OVERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
				WHEN x"80" =>
					videoflag <= '0';
					VIDEOE <= x"81";
					
				WHEN x"81" => -- Apaga FLEXA
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= FLEXAPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"82";
					
				WHEN x"82" =>
					videoflag <= '0';
					VIDEOE <= x"83";
					
				WHEN x"83" => -- Apaga Coracao
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"84";
					
				WHEN x"84" =>
					videoflag <= '0';
					VIDEOE <= x"85";
					
				WHEN x"85" => -- Apaga Coracao do Mal
					video(17 downto 14) <= "0000"; -- Cor
					video(13 downto 8) <= "000000"; -- Caractere
					video(7 downto 0) <= CORACAOMALPOSA; -- Posicao
					videoflag <= '1';
					VIDEOE <= x"86";
					
				WHEN x"86" =>
					videoflag <= '0';
					VIDEOE <= x"00";
				
				WHEN OTHERS =>
					videoflag <= '0';
					VIDEOE <= x"00";
			
		END CASE;
	END IF;

END PROCESS;



	
	
PROCESS (videoflag, video_set)
BEGIN
  IF video_set = '1' THEN video_ready <= '0';
  ELSIF videoflag'EVENT and videoflag = '1' THEN video_ready <= '1';
  END IF;
END PROCESS;



END a;
