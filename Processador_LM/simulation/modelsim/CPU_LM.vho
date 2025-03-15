-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "03/10/2025 18:45:38"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU_LM IS
    PORT (
	CLOCK : IN std_logic;
	PC_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	ROM_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	OPCODE_OUT : BUFFER std_logic_vector(3 DOWNTO 0);
	RS_OUT : BUFFER std_logic_vector(1 DOWNTO 0);
	RT_OUT : BUFFER std_logic_vector(1 DOWNTO 0);
	ADDRESS_OUT : BUFFER std_logic_vector(3 DOWNTO 0);
	R_A_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	R_B_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	ALU_RESULT_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	ALU_OVERFLOW_OUT : BUFFER std_logic;
	RAM_OUT : BUFFER std_logic_vector(7 DOWNTO 0);
	MUX_2_OUT : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END CPU_LM;

-- Design Ports Information
-- PC_OUT[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[1]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[2]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[3]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[4]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[5]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[6]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_OUT[7]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[0]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[1]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[3]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[4]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[6]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROM_OUT[7]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPCODE_OUT[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPCODE_OUT[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPCODE_OUT[2]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPCODE_OUT[3]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RS_OUT[0]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RS_OUT[1]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RT_OUT[0]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RT_OUT[1]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDRESS_OUT[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDRESS_OUT[1]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDRESS_OUT[2]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDRESS_OUT[3]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[0]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[1]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[3]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[4]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[5]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[6]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_A_OUT[7]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[0]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[1]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[2]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[3]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[4]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[5]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[6]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R_B_OUT[7]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[0]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[1]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[2]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[3]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[4]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[5]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[6]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_RESULT_OUT[7]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_OVERFLOW_OUT	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[1]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[2]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[3]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[4]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[5]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[6]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RAM_OUT[7]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[0]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[1]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[3]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[4]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[5]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[6]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MUX_2_OUT[7]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CPU_LM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_PC_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ROM_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_OPCODE_OUT : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RS_OUT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_RT_OUT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ADDRESS_OUT : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_R_A_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_R_B_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ALU_RESULT_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ALU_OVERFLOW_OUT : std_logic;
SIGNAL ww_RAM_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_MUX_2_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \CLOCK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \COMP_PC|ADDRESS_OUT[0]~0_combout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~1_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~2\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~5_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~6\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~9_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~10\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~13_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~14\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~17_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~18\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~21_sumout\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~22\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~25_sumout\ : std_logic;
SIGNAL \COMP_PC|ADDRESS_OUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \COMP_PC|ALT_INV_ADDRESS_OUT\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_CLOCK <= CLOCK;
PC_OUT <= ww_PC_OUT;
ROM_OUT <= ww_ROM_OUT;
OPCODE_OUT <= ww_OPCODE_OUT;
RS_OUT <= ww_RS_OUT;
RT_OUT <= ww_RT_OUT;
ADDRESS_OUT <= ww_ADDRESS_OUT;
R_A_OUT <= ww_R_A_OUT;
R_B_OUT <= ww_R_B_OUT;
ALU_RESULT_OUT <= ww_ALU_RESULT_OUT;
ALU_OVERFLOW_OUT <= ww_ALU_OVERFLOW_OUT;
RAM_OUT <= ww_RAM_OUT;
MUX_2_OUT <= ww_MUX_2_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\COMP_PC|ALT_INV_ADDRESS_OUT\(7) <= NOT \COMP_PC|ADDRESS_OUT\(7);
\COMP_PC|ALT_INV_ADDRESS_OUT\(6) <= NOT \COMP_PC|ADDRESS_OUT\(6);
\COMP_PC|ALT_INV_ADDRESS_OUT\(5) <= NOT \COMP_PC|ADDRESS_OUT\(5);
\COMP_PC|ALT_INV_ADDRESS_OUT\(4) <= NOT \COMP_PC|ADDRESS_OUT\(4);
\COMP_PC|ALT_INV_ADDRESS_OUT\(3) <= NOT \COMP_PC|ADDRESS_OUT\(3);
\COMP_PC|ALT_INV_ADDRESS_OUT\(2) <= NOT \COMP_PC|ADDRESS_OUT\(2);
\COMP_PC|ALT_INV_ADDRESS_OUT\(1) <= NOT \COMP_PC|ADDRESS_OUT\(1);
\COMP_PC|ALT_INV_ADDRESS_OUT\(0) <= NOT \COMP_PC|ADDRESS_OUT\(0);

-- Location: IOOBUF_X62_Y0_N53
\PC_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(0),
	devoe => ww_devoe,
	o => ww_PC_OUT(0));

-- Location: IOOBUF_X60_Y0_N53
\PC_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(1),
	devoe => ww_devoe,
	o => ww_PC_OUT(1));

-- Location: IOOBUF_X60_Y0_N2
\PC_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(2),
	devoe => ww_devoe,
	o => ww_PC_OUT(2));

-- Location: IOOBUF_X58_Y0_N76
\PC_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(3),
	devoe => ww_devoe,
	o => ww_PC_OUT(3));

-- Location: IOOBUF_X60_Y0_N19
\PC_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(4),
	devoe => ww_devoe,
	o => ww_PC_OUT(4));

-- Location: IOOBUF_X60_Y0_N36
\PC_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(5),
	devoe => ww_devoe,
	o => ww_PC_OUT(5));

-- Location: IOOBUF_X58_Y0_N93
\PC_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(6),
	devoe => ww_devoe,
	o => ww_PC_OUT(6));

-- Location: IOOBUF_X58_Y0_N59
\PC_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_PC|ADDRESS_OUT\(7),
	devoe => ww_devoe,
	o => ww_PC_OUT(7));

-- Location: IOOBUF_X58_Y0_N42
\ROM_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(0));

-- Location: IOOBUF_X40_Y81_N19
\ROM_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(1));

-- Location: IOOBUF_X54_Y81_N53
\ROM_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(2));

-- Location: IOOBUF_X52_Y0_N53
\ROM_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(3));

-- Location: IOOBUF_X72_Y0_N53
\ROM_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(4));

-- Location: IOOBUF_X54_Y0_N36
\ROM_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(5));

-- Location: IOOBUF_X8_Y0_N36
\ROM_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(6));

-- Location: IOOBUF_X88_Y81_N3
\ROM_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ROM_OUT(7));

-- Location: IOOBUF_X89_Y37_N39
\OPCODE_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_OPCODE_OUT(0));

-- Location: IOOBUF_X52_Y0_N2
\OPCODE_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_OPCODE_OUT(1));

-- Location: IOOBUF_X36_Y0_N19
\OPCODE_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_OPCODE_OUT(2));

-- Location: IOOBUF_X70_Y0_N36
\OPCODE_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_OPCODE_OUT(3));

-- Location: IOOBUF_X70_Y0_N19
\RS_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_RS_OUT(0));

-- Location: IOOBUF_X89_Y38_N5
\RS_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_RS_OUT(1));

-- Location: IOOBUF_X56_Y0_N2
\RT_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_RT_OUT(0));

-- Location: IOOBUF_X2_Y0_N76
\RT_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_RT_OUT(1));

-- Location: IOOBUF_X64_Y0_N19
\ADDRESS_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ADDRESS_OUT(0));

-- Location: IOOBUF_X38_Y81_N36
\ADDRESS_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ADDRESS_OUT(1));

-- Location: IOOBUF_X62_Y0_N19
\ADDRESS_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ADDRESS_OUT(2));

-- Location: IOOBUF_X86_Y81_N2
\ADDRESS_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ADDRESS_OUT(3));

-- Location: IOOBUF_X68_Y0_N36
\R_A_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(0));

-- Location: IOOBUF_X34_Y0_N59
\R_A_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(1));

-- Location: IOOBUF_X89_Y38_N22
\R_A_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(2));

-- Location: IOOBUF_X86_Y81_N36
\R_A_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(3));

-- Location: IOOBUF_X54_Y0_N2
\R_A_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(4));

-- Location: IOOBUF_X78_Y81_N53
\R_A_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(5));

-- Location: IOOBUF_X56_Y0_N36
\R_A_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(6));

-- Location: IOOBUF_X34_Y0_N42
\R_A_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_A_OUT(7));

-- Location: IOOBUF_X68_Y81_N36
\R_B_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(0));

-- Location: IOOBUF_X38_Y0_N2
\R_B_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(1));

-- Location: IOOBUF_X56_Y0_N53
\R_B_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(2));

-- Location: IOOBUF_X89_Y9_N56
\R_B_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(3));

-- Location: IOOBUF_X66_Y0_N59
\R_B_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(4));

-- Location: IOOBUF_X52_Y81_N36
\R_B_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(5));

-- Location: IOOBUF_X26_Y0_N93
\R_B_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(6));

-- Location: IOOBUF_X84_Y81_N36
\R_B_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_R_B_OUT(7));

-- Location: IOOBUF_X32_Y0_N36
\ALU_RESULT_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(0));

-- Location: IOOBUF_X36_Y0_N2
\ALU_RESULT_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(1));

-- Location: IOOBUF_X36_Y81_N2
\ALU_RESULT_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(2));

-- Location: IOOBUF_X40_Y81_N53
\ALU_RESULT_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(3));

-- Location: IOOBUF_X72_Y0_N36
\ALU_RESULT_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(4));

-- Location: IOOBUF_X40_Y0_N2
\ALU_RESULT_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(5));

-- Location: IOOBUF_X72_Y81_N53
\ALU_RESULT_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(6));

-- Location: IOOBUF_X76_Y81_N36
\ALU_RESULT_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_RESULT_OUT(7));

-- Location: IOOBUF_X2_Y0_N93
\ALU_OVERFLOW_OUT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_OVERFLOW_OUT);

-- Location: IOOBUF_X34_Y81_N42
\RAM_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(0));

-- Location: IOOBUF_X70_Y81_N53
\RAM_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(1));

-- Location: IOOBUF_X58_Y81_N59
\RAM_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(2));

-- Location: IOOBUF_X40_Y0_N36
\RAM_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(3));

-- Location: IOOBUF_X28_Y81_N53
\RAM_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(4));

-- Location: IOOBUF_X32_Y0_N53
\RAM_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(5));

-- Location: IOOBUF_X54_Y81_N36
\RAM_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(6));

-- Location: IOOBUF_X28_Y81_N19
\RAM_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAM_OUT(7));

-- Location: IOOBUF_X62_Y81_N53
\MUX_2_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(0));

-- Location: IOOBUF_X60_Y81_N36
\MUX_2_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(1));

-- Location: IOOBUF_X32_Y81_N19
\MUX_2_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(2));

-- Location: IOOBUF_X34_Y81_N59
\MUX_2_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(3));

-- Location: IOOBUF_X30_Y81_N36
\MUX_2_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(4));

-- Location: IOOBUF_X72_Y0_N19
\MUX_2_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(5));

-- Location: IOOBUF_X74_Y81_N76
\MUX_2_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(6));

-- Location: IOOBUF_X26_Y0_N59
\MUX_2_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_MUX_2_OUT(7));

-- Location: IOIBUF_X89_Y35_N61
\CLOCK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: CLKCTRL_G10
\CLOCK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~input_o\,
	outclk => \CLOCK~inputCLKENA0_outclk\);

-- Location: LABCELL_X60_Y1_N24
\COMP_PC|ADDRESS_OUT[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_PC|ADDRESS_OUT[0]~0_combout\ = ( !\COMP_PC|ADDRESS_OUT\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	combout => \COMP_PC|ADDRESS_OUT[0]~0_combout\);

-- Location: FF_X60_Y1_N26
\COMP_PC|ADDRESS_OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_PC|ADDRESS_OUT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(0));

-- Location: LABCELL_X60_Y1_N0
\COMP_CONTADOR_PC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~1_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(1) ) + ( \COMP_PC|ADDRESS_OUT\(0) ) + ( !VCC ))
-- \COMP_CONTADOR_PC|Add0~2\ = CARRY(( \COMP_PC|ADDRESS_OUT\(1) ) + ( \COMP_PC|ADDRESS_OUT\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	cin => GND,
	sumout => \COMP_CONTADOR_PC|Add0~1_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~2\);

-- Location: FF_X60_Y1_N1
\COMP_PC|ADDRESS_OUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(1));

-- Location: LABCELL_X60_Y1_N3
\COMP_CONTADOR_PC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~5_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(2) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~2\ ))
-- \COMP_CONTADOR_PC|Add0~6\ = CARRY(( \COMP_PC|ADDRESS_OUT\(2) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(2),
	cin => \COMP_CONTADOR_PC|Add0~2\,
	sumout => \COMP_CONTADOR_PC|Add0~5_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~6\);

-- Location: FF_X60_Y1_N5
\COMP_PC|ADDRESS_OUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(2));

-- Location: LABCELL_X60_Y1_N6
\COMP_CONTADOR_PC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~9_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(3) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~6\ ))
-- \COMP_CONTADOR_PC|Add0~10\ = CARRY(( \COMP_PC|ADDRESS_OUT\(3) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(3),
	cin => \COMP_CONTADOR_PC|Add0~6\,
	sumout => \COMP_CONTADOR_PC|Add0~9_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~10\);

-- Location: FF_X60_Y1_N8
\COMP_PC|ADDRESS_OUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(3));

-- Location: LABCELL_X60_Y1_N9
\COMP_CONTADOR_PC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~13_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(4) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~10\ ))
-- \COMP_CONTADOR_PC|Add0~14\ = CARRY(( \COMP_PC|ADDRESS_OUT\(4) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(4),
	cin => \COMP_CONTADOR_PC|Add0~10\,
	sumout => \COMP_CONTADOR_PC|Add0~13_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~14\);

-- Location: FF_X60_Y1_N10
\COMP_PC|ADDRESS_OUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(4));

-- Location: LABCELL_X60_Y1_N12
\COMP_CONTADOR_PC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~17_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(5) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~14\ ))
-- \COMP_CONTADOR_PC|Add0~18\ = CARRY(( \COMP_PC|ADDRESS_OUT\(5) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(5),
	cin => \COMP_CONTADOR_PC|Add0~14\,
	sumout => \COMP_CONTADOR_PC|Add0~17_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~18\);

-- Location: FF_X60_Y1_N13
\COMP_PC|ADDRESS_OUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(5));

-- Location: LABCELL_X60_Y1_N15
\COMP_CONTADOR_PC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~21_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(6) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~18\ ))
-- \COMP_CONTADOR_PC|Add0~22\ = CARRY(( \COMP_PC|ADDRESS_OUT\(6) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(6),
	cin => \COMP_CONTADOR_PC|Add0~18\,
	sumout => \COMP_CONTADOR_PC|Add0~21_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~22\);

-- Location: FF_X60_Y1_N17
\COMP_PC|ADDRESS_OUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(6));

-- Location: LABCELL_X60_Y1_N18
\COMP_CONTADOR_PC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~25_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(7) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(7),
	cin => \COMP_CONTADOR_PC|Add0~22\,
	sumout => \COMP_CONTADOR_PC|Add0~25_sumout\);

-- Location: FF_X60_Y1_N19
\COMP_PC|ADDRESS_OUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \COMP_CONTADOR_PC|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(7));

-- Location: LABCELL_X60_Y19_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


