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

ENTITY ap7 IS 
	port
	(
		Clock_25MHz :  IN  STD_LOGIC;
		kbd_clk :  IN  STD_LOGIC;
		kbd_data :  IN  STD_LOGIC;
		Clock_25Mhz9 :  IN  STD_LOGIC;
		PB :  IN  STD_LOGIC_VECTOR(2 downto 1);
		R :  OUT  STD_LOGIC;
		G :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC;
		H :  OUT  STD_LOGIC;
		V :  OUT  STD_LOGIC;
		LSD_SEG_A :  OUT  STD_LOGIC;
		LSD_SEG_B :  OUT  STD_LOGIC;
		LSD_SEG_C :  OUT  STD_LOGIC;
		LSD_SEG_D :  OUT  STD_LOGIC;
		LSD_SEG_E :  OUT  STD_LOGIC;
		LSD_SEG_F :  OUT  STD_LOGIC;
		LSD_SEG_G :  OUT  STD_LOGIC;
		MSD_SEG_A :  OUT  STD_LOGIC;
		MSD_SEG_B :  OUT  STD_LOGIC;
		MSD_SEG_C :  OUT  STD_LOGIC;
		MSD_SEG_D :  OUT  STD_LOGIC;
		MSD_SEG_E :  OUT  STD_LOGIC;
		MSD_SEG_F :  OUT  STD_LOGIC;
		MSD_SEG_G :  OUT  STD_LOGIC;
		LSD_SEG_DP :  OUT  STD_LOGIC;
		MSD_SEG_DP :  OUT  STD_LOGIC
	);
END ap7;

ARCHITECTURE bdf_type OF ap7 IS 

attribute black_box : boolean;
attribute noopt : boolean;

component busmux_1
	PORT(sel : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(7 downto 0);
		 datab : IN STD_LOGIC_VECTOR(7 downto 0);
		 result : OUT STD_LOGIC_VECTOR(7 downto 0));
end component;
attribute black_box of busmux_1: component is true;
attribute noopt of busmux_1: component is true;

component mux_0
	PORT(data : IN STD_LOGIC_VECTOR(7 downto 0);
		 sel : IN STD_LOGIC_VECTOR(2 downto 0);
		 result : OUT STD_LOGIC);
end component;
attribute black_box of mux_0: component is true;
attribute noopt of mux_0: component is true;

component dec_7seg
	PORT(hex_digit : IN STD_LOGIC_VECTOR(3 downto 0);
		 segment_a : OUT STD_LOGIC;
		 segment_b : OUT STD_LOGIC;
		 segment_c : OUT STD_LOGIC;
		 segment_d : OUT STD_LOGIC;
		 segment_e : OUT STD_LOGIC;
		 segment_f : OUT STD_LOGIC;
		 segment_g : OUT STD_LOGIC
	);
end component;

component vga_sync
	PORT(clock_25Mhz : IN STD_LOGIC;
		 red : IN STD_LOGIC;
		 green : IN STD_LOGIC;
		 blue : IN STD_LOGIC;
		 red_out : OUT STD_LOGIC;
		 green_out : OUT STD_LOGIC;
		 blue_out : OUT STD_LOGIC;
		 horiz_sync_out : OUT STD_LOGIC;
		 vert_sync_out : OUT STD_LOGIC;
		 pixel_column : OUT STD_LOGIC_VECTOR(9 downto 0);
		 pixel_row : OUT STD_LOGIC_VECTOR(9 downto 0)
	);
end component;

component maqest
	PORT(sig : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 m : OUT STD_LOGIC;
		 w : OUT STD_LOGIC
	);
end component;

component lpm_rom0
	PORT(address : IN STD_LOGIC_VECTOR(8 downto 0);
		 q : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component keyboard
	PORT(keyboard_clk : IN STD_LOGIC;
		 keyboard_data : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 read : IN STD_LOGIC;
		 scan_ready : OUT STD_LOGIC;
		 scan_code : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component dec_kb
	PORT(scan_rd : IN STD_LOGIC;
		 hex_bus : IN STD_LOGIC_VECTOR(7 downto 0);
		 bin_digit : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component debounce
	PORT(pb : IN STD_LOGIC;
		 clock_100Hz : IN STD_LOGIC;
		 pb_debounced : OUT STD_LOGIC
	);
end component;

component lpm_counter0
	PORT(clock : IN STD_LOGIC;
		 aclr : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component juntador4mais4
	PORT(in0 : IN STD_LOGIC_VECTOR(4 downto 0);
		 in1 : IN STD_LOGIC_VECTOR(4 downto 0);
		 out0 : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component juntador3mais5
	PORT(in0 : IN STD_LOGIC_VECTOR(2 downto 0);
		 in1 : IN STD_LOGIC_VECTOR(5 downto 0);
		 out0 : OUT STD_LOGIC_VECTOR(8 downto 0)
	);
end component;

component lpm_ram_dq2
	PORT(wren : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(7 downto 0);
		 data : IN STD_LOGIC_VECTOR(7 downto 0);
		 q : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component clk_div
	PORT(clock_25Mhz : IN STD_LOGIC;
		 clock_1MHz : OUT STD_LOGIC;
		 clock_100KHz : OUT STD_LOGIC;
		 clock_10KHz : OUT STD_LOGIC;
		 clock_1KHz : OUT STD_LOGIC;
		 clock_100Hz : OUT STD_LOGIC;
		 clock_10Hz : OUT STD_LOGIC;
		 clock_1Hz : OUT STD_LOGIC
	);
end component;

signal	blue :  STD_LOGIC;
signal	char_code :  STD_LOGIC_VECTOR(8 downto 0);
signal	clk :  STD_LOGIC;
signal	clk100 :  STD_LOGIC;
signal	clk25m :  STD_LOGIC;
signal	col :  STD_LOGIC_VECTOR(9 downto 0);
signal	D0 :  STD_LOGIC;
signal	D1 :  STD_LOGIC;
signal	D10 :  STD_LOGIC;
signal	D11 :  STD_LOGIC;
signal	D12 :  STD_LOGIC;
signal	D13 :  STD_LOGIC;
signal	D14 :  STD_LOGIC;
signal	D15 :  STD_LOGIC;
signal	D16 :  STD_LOGIC;
signal	D17 :  STD_LOGIC;
signal	D2 :  STD_LOGIC;
signal	D3 :  STD_LOGIC;
signal	D4 :  STD_LOGIC;
signal	D5 :  STD_LOGIC;
signal	D6 :  STD_LOGIC;
signal	D7 :  STD_LOGIC;
signal	data :  STD_LOGIC_VECTOR(7 downto 0);
signal	oldread :  STD_LOGIC;
signal	reset :  STD_LOGIC;
signal	row :  STD_LOGIC_VECTOR(9 downto 0);
signal	v_out :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(7 downto 0);

signal	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(3 downto 0);
signal	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(3 downto 0);
signal	GDFX_TEMP_SIGNAL_4 :  STD_LOGIC_VECTOR(7 downto 0);
signal	GDFX_TEMP_SIGNAL_5 :  STD_LOGIC_VECTOR(7 downto 0);
signal	GDFX_TEMP_SIGNAL_3 :  STD_LOGIC_VECTOR(7 downto 0);
signal	GDFX_TEMP_SIGNAL_6 :  STD_LOGIC_VECTOR(7 downto 0);
signal	GDFX_TEMP_SIGNAL_2 :  STD_LOGIC_VECTOR(7 downto 0);

BEGIN 
SYNTHESIZED_WIRE_0 <= '1';
SYNTHESIZED_WIRE_2 <= '1';
SYNTHESIZED_WIRE_11 <= '0';
SYNTHESIZED_WIRE_12 <= '1';

GDFX_TEMP_SIGNAL_0 <= (D3 & D2 & D1 & D0);
GDFX_TEMP_SIGNAL_1 <= (D7 & D6 & D5 & D4);
GDFX_TEMP_SIGNAL_4 <= (D7 & D6 & D5 & D4 & D3 & D2 & D1 & D0);
D7 <= GDFX_TEMP_SIGNAL_5(7);
D6 <= GDFX_TEMP_SIGNAL_5(6);
D5 <= GDFX_TEMP_SIGNAL_5(5);
D4 <= GDFX_TEMP_SIGNAL_5(4);
D3 <= GDFX_TEMP_SIGNAL_5(3);
D2 <= GDFX_TEMP_SIGNAL_5(2);
D1 <= GDFX_TEMP_SIGNAL_5(1);
D0 <= GDFX_TEMP_SIGNAL_5(0);

D17 <= GDFX_TEMP_SIGNAL_3(7);
D16 <= GDFX_TEMP_SIGNAL_3(6);
D15 <= GDFX_TEMP_SIGNAL_3(5);
D14 <= GDFX_TEMP_SIGNAL_3(4);
D13 <= GDFX_TEMP_SIGNAL_3(3);
D12 <= GDFX_TEMP_SIGNAL_3(2);
D11 <= GDFX_TEMP_SIGNAL_3(1);
D10 <= GDFX_TEMP_SIGNAL_3(0);

GDFX_TEMP_SIGNAL_6 <= (D17 & D16 & D15 & D14 & D13 & D12 & D11 & D10);
GDFX_TEMP_SIGNAL_2 <= (data(0) & data(1) & data(2) & data(3) & data(4) & data(5) & data(6) & data(7));


b2v_29 : dec_7seg
PORT MAP(hex_digit => GDFX_TEMP_SIGNAL_0,
		 segment_a => LSD_SEG_A,
		 segment_b => LSD_SEG_B,
		 segment_c => LSD_SEG_C,
		 segment_d => LSD_SEG_D,
		 segment_e => LSD_SEG_E,
		 segment_f => LSD_SEG_F,
		 segment_g => LSD_SEG_G);

b2v_30 : dec_7seg
PORT MAP(hex_digit => GDFX_TEMP_SIGNAL_1,
		 segment_a => MSD_SEG_A,
		 segment_b => MSD_SEG_B,
		 segment_c => MSD_SEG_C,
		 segment_d => MSD_SEG_D,
		 segment_e => MSD_SEG_E,
		 segment_f => MSD_SEG_F,
		 segment_g => MSD_SEG_G);

b2v_inst : vga_sync
PORT MAP(clock_25Mhz => clk,
		 blue => blue,
		 red_out => R,
		 green_out => G,
		 blue_out => B,
		 horiz_sync_out => H,
		 vert_sync_out => V,
		 pixel_column => col,
		 pixel_row => row);

process(SYNTHESIZED_WIRE_1)
variable LSD_SEG_DP_synthesized_var : STD_LOGIC;
begin
if (rising_edge(SYNTHESIZED_WIRE_1)) then
	LSD_SEG_DP_synthesized_var := LSD_SEG_DP_synthesized_var XOR SYNTHESIZED_WIRE_0;
end if;
	LSD_SEG_DP <= LSD_SEG_DP_synthesized_var;
end process;

process(SYNTHESIZED_WIRE_16)
variable SYNTHESIZED_WIRE_1_synthesized_var : STD_LOGIC;
begin
if (rising_edge(SYNTHESIZED_WIRE_16)) then
	SYNTHESIZED_WIRE_1_synthesized_var := SYNTHESIZED_WIRE_1_synthesized_var XOR SYNTHESIZED_WIRE_2;
end if;
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_1_synthesized_var;
end process;

b2v_inst12 : mux_0
PORT MAP(data => GDFX_TEMP_SIGNAL_2,
		 sel => col(4 downto 2),
		 result => blue);

b2v_inst15 : maqest
PORT MAP(sig => SYNTHESIZED_WIRE_16,
		 clk => clk,
		 m => SYNTHESIZED_WIRE_17,
		 w => SYNTHESIZED_WIRE_14);

b2v_inst16 : lpm_rom0
PORT MAP(address => char_code,
		 q => data);

b2v_inst18 : keyboard
PORT MAP(keyboard_clk => kbd_clk,
		 keyboard_data => kbd_data,
		 reset => reset,
		 read => SYNTHESIZED_WIRE_16,
		 scan_ready => SYNTHESIZED_WIRE_16,
		 scan_code => SYNTHESIZED_WIRE_7);

b2v_inst19 : dec_kb
PORT MAP(scan_rd => SYNTHESIZED_WIRE_16,
		 hex_bus => SYNTHESIZED_WIRE_7,
		 bin_digit => GDFX_TEMP_SIGNAL_3);

b2v_inst2 : debounce
PORT MAP(pb => PB(1),
		 clock_100Hz => clk100,
		 pb_debounced => reset);

b2v_inst21 : busmux_1
PORT MAP(sel => SYNTHESIZED_WIRE_17,
		 dataa => SYNTHESIZED_WIRE_9,
		 datab => GDFX_TEMP_SIGNAL_4,
		 result => SYNTHESIZED_WIRE_15);

b2v_inst22 : lpm_counter0
PORT MAP(clock => SYNTHESIZED_WIRE_17,
		 aclr => SYNTHESIZED_WIRE_11,
		 q => GDFX_TEMP_SIGNAL_5);

b2v_inst3 : juntador4mais4
PORT MAP(in0 => col(9 downto 5),
		 in1 => row(9 downto 5),
		 out0 => SYNTHESIZED_WIRE_9);

b2v_inst4 : juntador3mais5
PORT MAP(in0 => row(4 downto 2),
		 in1 => v_out(5 downto 0),
		 out0 => char_code);

process(SYNTHESIZED_WIRE_16)
variable MSD_SEG_DP_synthesized_var : STD_LOGIC;
begin
if (rising_edge(SYNTHESIZED_WIRE_16)) then
	MSD_SEG_DP_synthesized_var := MSD_SEG_DP_synthesized_var XOR SYNTHESIZED_WIRE_12;
end if;
	MSD_SEG_DP <= MSD_SEG_DP_synthesized_var;
end process;

b2v_inst6 : lpm_ram_dq2
PORT MAP(wren => SYNTHESIZED_WIRE_14,
		 clock => clk,
		 address => SYNTHESIZED_WIRE_15,
		 data => GDFX_TEMP_SIGNAL_6,
		 q => v_out);

b2v_inst7 : clk_div
PORT MAP(clock_25Mhz => clk25m,
		 clock_100Hz => clk100);
clk <= Clock_25MHz;
clk25m <= Clock_25Mhz9;

END; 