-- Copyright (C) 1991-2005 Altera Corporation
-- Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
-- support information,  device programming or simulation file,  and any other
-- associated  documentation or information  provided by  Altera  or a partner
-- under  Altera's   Megafunction   Partnership   Program  may  be  used  only
-- to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
-- other  use  of such  megafunction  design,  netlist,  support  information,
-- device programming or simulation file,  or any other  related documentation
-- or information  is prohibited  for  any  other purpose,  including, but not
-- limited to  modification,  reverse engineering,  de-compiling, or use  with
-- any other  silicon devices,  unless such use is  explicitly  licensed under
-- a separate agreement with  Altera  or a megafunction partner.  Title to the
-- intellectual property,  including patents,  copyrights,  trademarks,  trade
-- secrets,  or maskworks,  embodied in any such megafunction design, netlist,
-- support  information,  device programming or simulation file,  or any other
-- related documentation or information provided by  Altera  or a megafunction
-- partner, remains with Altera, the megafunction partner, or their respective
-- licensors. No other licenses, including any licenses needed under any third
-- party's intellectual property, are provided herein.

-- PROGRAM "Quartus II"
-- VERSION "Version 4.2 Build 178 01/19/2005 Service Pack 1 SJ Full Version"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
LIBRARY work;

ENTITY busmux_1 IS 
PORT 
( 
	sel	:	IN	 STD_LOGIC;
	dataa	:	IN	 STD_LOGIC_VECTOR(7 downto 0);
	datab	:	IN	 STD_LOGIC_VECTOR(7 downto 0);
	result	:	OUT	 STD_LOGIC_VECTOR(7 downto 0)
); 
END busmux_1;

ARCHITECTURE bdf_type OF busmux_1 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst21 : busmux
GENERIC MAP(WIDTH => 8)
PORT MAP(sel => sel,
		 dataa => dataa,
		 datab => datab,
		 result => result);

END; 