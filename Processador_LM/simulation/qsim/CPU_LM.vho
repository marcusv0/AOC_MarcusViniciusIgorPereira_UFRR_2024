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

-- DATE "03/06/2025 20:44:31"

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
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PC_OUT[0]~output_o\ : std_logic;
SIGNAL \PC_OUT[1]~output_o\ : std_logic;
SIGNAL \PC_OUT[2]~output_o\ : std_logic;
SIGNAL \PC_OUT[3]~output_o\ : std_logic;
SIGNAL \PC_OUT[4]~output_o\ : std_logic;
SIGNAL \PC_OUT[5]~output_o\ : std_logic;
SIGNAL \PC_OUT[6]~output_o\ : std_logic;
SIGNAL \PC_OUT[7]~output_o\ : std_logic;
SIGNAL \ROM_OUT[0]~output_o\ : std_logic;
SIGNAL \ROM_OUT[1]~output_o\ : std_logic;
SIGNAL \ROM_OUT[2]~output_o\ : std_logic;
SIGNAL \ROM_OUT[3]~output_o\ : std_logic;
SIGNAL \ROM_OUT[4]~output_o\ : std_logic;
SIGNAL \ROM_OUT[5]~output_o\ : std_logic;
SIGNAL \ROM_OUT[6]~output_o\ : std_logic;
SIGNAL \ROM_OUT[7]~output_o\ : std_logic;
SIGNAL \OPCODE_OUT[0]~output_o\ : std_logic;
SIGNAL \OPCODE_OUT[1]~output_o\ : std_logic;
SIGNAL \OPCODE_OUT[2]~output_o\ : std_logic;
SIGNAL \OPCODE_OUT[3]~output_o\ : std_logic;
SIGNAL \RS_OUT[0]~output_o\ : std_logic;
SIGNAL \RS_OUT[1]~output_o\ : std_logic;
SIGNAL \RT_OUT[0]~output_o\ : std_logic;
SIGNAL \RT_OUT[1]~output_o\ : std_logic;
SIGNAL \ADDRESS_OUT[0]~output_o\ : std_logic;
SIGNAL \ADDRESS_OUT[1]~output_o\ : std_logic;
SIGNAL \ADDRESS_OUT[2]~output_o\ : std_logic;
SIGNAL \ADDRESS_OUT[3]~output_o\ : std_logic;
SIGNAL \R_A_OUT[0]~output_o\ : std_logic;
SIGNAL \R_A_OUT[1]~output_o\ : std_logic;
SIGNAL \R_A_OUT[2]~output_o\ : std_logic;
SIGNAL \R_A_OUT[3]~output_o\ : std_logic;
SIGNAL \R_A_OUT[4]~output_o\ : std_logic;
SIGNAL \R_A_OUT[5]~output_o\ : std_logic;
SIGNAL \R_A_OUT[6]~output_o\ : std_logic;
SIGNAL \R_A_OUT[7]~output_o\ : std_logic;
SIGNAL \R_B_OUT[0]~output_o\ : std_logic;
SIGNAL \R_B_OUT[1]~output_o\ : std_logic;
SIGNAL \R_B_OUT[2]~output_o\ : std_logic;
SIGNAL \R_B_OUT[3]~output_o\ : std_logic;
SIGNAL \R_B_OUT[4]~output_o\ : std_logic;
SIGNAL \R_B_OUT[5]~output_o\ : std_logic;
SIGNAL \R_B_OUT[6]~output_o\ : std_logic;
SIGNAL \R_B_OUT[7]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[0]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[1]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[2]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[3]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[4]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[5]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[6]~output_o\ : std_logic;
SIGNAL \ALU_RESULT_OUT[7]~output_o\ : std_logic;
SIGNAL \ALU_OVERFLOW_OUT~output_o\ : std_logic;
SIGNAL \RAM_OUT[0]~output_o\ : std_logic;
SIGNAL \RAM_OUT[1]~output_o\ : std_logic;
SIGNAL \RAM_OUT[2]~output_o\ : std_logic;
SIGNAL \RAM_OUT[3]~output_o\ : std_logic;
SIGNAL \RAM_OUT[4]~output_o\ : std_logic;
SIGNAL \RAM_OUT[5]~output_o\ : std_logic;
SIGNAL \RAM_OUT[6]~output_o\ : std_logic;
SIGNAL \RAM_OUT[7]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[0]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[1]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[2]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[3]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[4]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[5]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[6]~output_o\ : std_logic;
SIGNAL \MUX_2_OUT[7]~output_o\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
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
SIGNAL \COMP_CONTADOR_PC|Add0~26\ : std_logic;
SIGNAL \COMP_CONTADOR_PC|Add0~29_sumout\ : std_logic;
SIGNAL \COMP_ROM|Mux6~0_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux2~0_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux6~1_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux5~0_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux5~1_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux2~1_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux3~0_combout\ : std_logic;
SIGNAL \COMP_ROM|Mux2~2_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ : std_logic;
SIGNAL \COMP_MUX_1|RESULT[0]~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux10~0_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ : std_logic;
SIGNAL \COMP_MUX_1|RESULT[1]~1_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux9~0_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\ : std_logic;
SIGNAL \COMP_MUX_1|RESULT[2]~2_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux8~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux8~1_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~0_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|C~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux7~0_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\ : std_logic;
SIGNAL \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux6~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux6~1_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~1_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|C~1_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~2_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux5~0_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~3_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux4~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux4~1_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~4_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|C~5_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux4~2_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|C~2_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux3~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux3~1_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~51_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~52_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~53_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux11~0_combout\ : std_logic;
SIGNAL \COMP_ALU|Mux11~1_combout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \COMP_PC|ADDRESS_OUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~23_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~15_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~22_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~14_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~45_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~21_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~13_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~20_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~12_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~19_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~11_q\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux2~2_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \COMP_ROM|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \COMP_PC|ALT_INV_ADDRESS_OUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \COMP_ALU|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \COMP_ALU|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|ALT_INV_C~2_combout\ : std_logic;
SIGNAL \COMP_ALU|ALT_INV_Mux4~2_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~5_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~4_combout\ : std_logic;
SIGNAL \COMP_ALU|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~3_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~2_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|ALT_INV_C~1_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~1_combout\ : std_logic;
SIGNAL \COMP_ALU|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \COMP_ALU|OP2|RESULTADO|ALT_INV_C~0_combout\ : std_logic;
SIGNAL \COMP_ALU|OP1|ALT_INV_C~0_combout\ : std_logic;
SIGNAL \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \COMP_ALU|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \COMP_MUX_1|ALT_INV_RESULT[2]~2_combout\ : std_logic;
SIGNAL \COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\ : std_logic;
SIGNAL \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~58_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~57_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~55_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~50_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~26_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~18_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~49_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~25_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~17_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~24_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~16_q\ : std_logic;
SIGNAL \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~47_combout\ : std_logic;

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

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux10~0_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux9~0_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux8~1_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux7~0_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux6~1_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux5~0_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux4~1_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \COMP_ALU|Mux3~1_combout\;

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\COMP_ROM|Mux6~1_combout\ & vcc);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~23_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~15_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~22_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~14_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~45_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~21_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~13_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~20_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~12_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~19_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~11_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11_q\;
\COMP_ROM|ALT_INV_Mux2~2_combout\ <= NOT \COMP_ROM|Mux2~2_combout\;
\COMP_ROM|ALT_INV_Mux3~0_combout\ <= NOT \COMP_ROM|Mux3~0_combout\;
\COMP_ROM|ALT_INV_Mux2~1_combout\ <= NOT \COMP_ROM|Mux2~1_combout\;
\COMP_ROM|ALT_INV_Mux5~0_combout\ <= NOT \COMP_ROM|Mux5~0_combout\;
\COMP_ROM|ALT_INV_Mux6~1_combout\ <= NOT \COMP_ROM|Mux6~1_combout\;
\COMP_ROM|ALT_INV_Mux2~0_combout\ <= NOT \COMP_ROM|Mux2~0_combout\;
\COMP_ROM|ALT_INV_Mux6~0_combout\ <= NOT \COMP_ROM|Mux6~0_combout\;
\COMP_PC|ALT_INV_ADDRESS_OUT\(7) <= NOT \COMP_PC|ADDRESS_OUT\(7);
\COMP_PC|ALT_INV_ADDRESS_OUT\(6) <= NOT \COMP_PC|ADDRESS_OUT\(6);
\COMP_PC|ALT_INV_ADDRESS_OUT\(5) <= NOT \COMP_PC|ADDRESS_OUT\(5);
\COMP_PC|ALT_INV_ADDRESS_OUT\(4) <= NOT \COMP_PC|ADDRESS_OUT\(4);
\COMP_PC|ALT_INV_ADDRESS_OUT\(3) <= NOT \COMP_PC|ADDRESS_OUT\(3);
\COMP_PC|ALT_INV_ADDRESS_OUT\(2) <= NOT \COMP_PC|ADDRESS_OUT\(2);
\COMP_PC|ALT_INV_ADDRESS_OUT\(1) <= NOT \COMP_PC|ADDRESS_OUT\(1);
\COMP_PC|ALT_INV_ADDRESS_OUT\(0) <= NOT \COMP_PC|ADDRESS_OUT\(0);
\COMP_ALU|ALT_INV_Mux11~0_combout\ <= NOT \COMP_ALU|Mux11~0_combout\;
\COMP_ALU|ALT_INV_Mux3~0_combout\ <= NOT \COMP_ALU|Mux3~0_combout\;
\COMP_ALU|OP1|ALT_INV_C~2_combout\ <= NOT \COMP_ALU|OP1|C~2_combout\;
\COMP_ALU|ALT_INV_Mux4~2_combout\ <= NOT \COMP_ALU|Mux4~2_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~5_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~5_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~4_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~4_combout\;
\COMP_ALU|ALT_INV_Mux4~0_combout\ <= NOT \COMP_ALU|Mux4~0_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~3_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~3_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~2_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~2_combout\;
\COMP_ALU|OP1|ALT_INV_C~1_combout\ <= NOT \COMP_ALU|OP1|C~1_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~1_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~1_combout\;
\COMP_ALU|ALT_INV_Mux6~0_combout\ <= NOT \COMP_ALU|Mux6~0_combout\;
\COMP_ALU|OP2|RESULTADO|ALT_INV_C~0_combout\ <= NOT \COMP_ALU|OP2|RESULTADO|C~0_combout\;
\COMP_ALU|OP1|ALT_INV_C~0_combout\ <= NOT \COMP_ALU|OP1|C~0_combout\;
\COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\ <= NOT \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\;
\COMP_ALU|ALT_INV_Mux8~0_combout\ <= NOT \COMP_ALU|Mux8~0_combout\;
\COMP_MUX_1|ALT_INV_RESULT[2]~2_combout\ <= NOT \COMP_MUX_1|RESULT[2]~2_combout\;
\COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\ <= NOT \COMP_MUX_1|RESULT[1]~1_combout\;
\COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\ <= NOT \COMP_MUX_1|RESULT[0]~0_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~58_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~57_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~55_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~50_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~26_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~18_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~49_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~25_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~17_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~24_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~16_q\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16_q\;
\COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~47_combout\ <= NOT \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\;

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
	o => \PC_OUT[0]~output_o\);

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
	o => \PC_OUT[1]~output_o\);

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
	o => \PC_OUT[2]~output_o\);

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
	o => \PC_OUT[3]~output_o\);

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
	o => \PC_OUT[4]~output_o\);

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
	o => \PC_OUT[5]~output_o\);

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
	o => \PC_OUT[6]~output_o\);

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
	o => \PC_OUT[7]~output_o\);

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
	o => \ROM_OUT[0]~output_o\);

\ROM_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[1]~output_o\);

\ROM_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[2]~output_o\);

\ROM_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[3]~output_o\);

\ROM_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[4]~output_o\);

\ROM_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[5]~output_o\);

\ROM_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[6]~output_o\);

\ROM_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \ROM_OUT[7]~output_o\);

\OPCODE_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \OPCODE_OUT[0]~output_o\);

\OPCODE_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	devoe => ww_devoe,
	o => \OPCODE_OUT[1]~output_o\);

\OPCODE_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \OPCODE_OUT[2]~output_o\);

\OPCODE_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \OPCODE_OUT[3]~output_o\);

\RS_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \RS_OUT[0]~output_o\);

\RS_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \RS_OUT[1]~output_o\);

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
	o => \RT_OUT[0]~output_o\);

\RT_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \RT_OUT[1]~output_o\);

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
	o => \ADDRESS_OUT[0]~output_o\);

\ADDRESS_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \ADDRESS_OUT[1]~output_o\);

\ADDRESS_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \ADDRESS_OUT[2]~output_o\);

\ADDRESS_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	devoe => ww_devoe,
	o => \ADDRESS_OUT[3]~output_o\);

\R_A_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[0]~output_o\);

\R_A_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[1]~output_o\);

\R_A_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[2]~output_o\);

\R_A_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[3]~output_o\);

\R_A_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[4]~output_o\);

\R_A_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[5]~output_o\);

\R_A_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[6]~output_o\);

\R_A_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\,
	devoe => ww_devoe,
	o => \R_A_OUT[7]~output_o\);

\R_B_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~51_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[0]~output_o\);

\R_B_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~52_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[1]~output_o\);

\R_B_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~53_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[2]~output_o\);

\R_B_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[3]~output_o\);

\R_B_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[4]~output_o\);

\R_B_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[5]~output_o\);

\R_B_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[6]~output_o\);

\R_B_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\,
	devoe => ww_devoe,
	o => \R_B_OUT[7]~output_o\);

\ALU_RESULT_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux10~0_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[0]~output_o\);

\ALU_RESULT_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux9~0_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[1]~output_o\);

\ALU_RESULT_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux8~1_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[2]~output_o\);

\ALU_RESULT_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[3]~output_o\);

\ALU_RESULT_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[4]~output_o\);

\ALU_RESULT_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[5]~output_o\);

\ALU_RESULT_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[6]~output_o\);

\ALU_RESULT_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux3~1_combout\,
	devoe => ww_devoe,
	o => \ALU_RESULT_OUT[7]~output_o\);

\ALU_OVERFLOW_OUT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux11~1_combout\,
	devoe => ww_devoe,
	o => \ALU_OVERFLOW_OUT~output_o\);

\RAM_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[0]~output_o\);

\RAM_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[1]~output_o\);

\RAM_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[2]~output_o\);

\RAM_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[3]~output_o\);

\RAM_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[4]~output_o\);

\RAM_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[5]~output_o\);

\RAM_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[6]~output_o\);

\RAM_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	devoe => ww_devoe,
	o => \RAM_OUT[7]~output_o\);

\MUX_2_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux10~0_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[0]~output_o\);

\MUX_2_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux9~0_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[1]~output_o\);

\MUX_2_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux8~1_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[2]~output_o\);

\MUX_2_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[3]~output_o\);

\MUX_2_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[4]~output_o\);

\MUX_2_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[5]~output_o\);

\MUX_2_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[6]~output_o\);

\MUX_2_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_ALU|Mux3~1_combout\,
	devoe => ww_devoe,
	o => \MUX_2_OUT[7]~output_o\);

\CLOCK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

\COMP_CONTADOR_PC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~1_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(0) ) + ( VCC ) + ( !VCC ))
-- \COMP_CONTADOR_PC|Add0~2\ = CARRY(( \COMP_PC|ADDRESS_OUT\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	cin => GND,
	sumout => \COMP_CONTADOR_PC|Add0~1_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~2\);

\COMP_PC|ADDRESS_OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(0));

\COMP_CONTADOR_PC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~5_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(1) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~2\ ))
-- \COMP_CONTADOR_PC|Add0~6\ = CARRY(( \COMP_PC|ADDRESS_OUT\(1) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	cin => \COMP_CONTADOR_PC|Add0~2\,
	sumout => \COMP_CONTADOR_PC|Add0~5_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~6\);

\COMP_PC|ADDRESS_OUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(1));

\COMP_CONTADOR_PC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~9_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(2) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~6\ ))
-- \COMP_CONTADOR_PC|Add0~10\ = CARRY(( \COMP_PC|ADDRESS_OUT\(2) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(2),
	cin => \COMP_CONTADOR_PC|Add0~6\,
	sumout => \COMP_CONTADOR_PC|Add0~9_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~10\);

\COMP_PC|ADDRESS_OUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(2));

\COMP_CONTADOR_PC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~13_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(3) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~10\ ))
-- \COMP_CONTADOR_PC|Add0~14\ = CARRY(( \COMP_PC|ADDRESS_OUT\(3) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(3),
	cin => \COMP_CONTADOR_PC|Add0~10\,
	sumout => \COMP_CONTADOR_PC|Add0~13_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~14\);

\COMP_PC|ADDRESS_OUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(3));

\COMP_CONTADOR_PC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~17_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(4) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~14\ ))
-- \COMP_CONTADOR_PC|Add0~18\ = CARRY(( \COMP_PC|ADDRESS_OUT\(4) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(4),
	cin => \COMP_CONTADOR_PC|Add0~14\,
	sumout => \COMP_CONTADOR_PC|Add0~17_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~18\);

\COMP_PC|ADDRESS_OUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(4));

\COMP_CONTADOR_PC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~21_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(5) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~18\ ))
-- \COMP_CONTADOR_PC|Add0~22\ = CARRY(( \COMP_PC|ADDRESS_OUT\(5) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(5),
	cin => \COMP_CONTADOR_PC|Add0~18\,
	sumout => \COMP_CONTADOR_PC|Add0~21_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~22\);

\COMP_PC|ADDRESS_OUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(5));

\COMP_CONTADOR_PC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~25_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(6) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~22\ ))
-- \COMP_CONTADOR_PC|Add0~26\ = CARRY(( \COMP_PC|ADDRESS_OUT\(6) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(6),
	cin => \COMP_CONTADOR_PC|Add0~22\,
	sumout => \COMP_CONTADOR_PC|Add0~25_sumout\,
	cout => \COMP_CONTADOR_PC|Add0~26\);

\COMP_PC|ADDRESS_OUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(6));

\COMP_CONTADOR_PC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_CONTADOR_PC|Add0~29_sumout\ = SUM(( \COMP_PC|ADDRESS_OUT\(7) ) + ( GND ) + ( \COMP_CONTADOR_PC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(7),
	cin => \COMP_CONTADOR_PC|Add0~26\,
	sumout => \COMP_CONTADOR_PC|Add0~29_sumout\);

\COMP_PC|ADDRESS_OUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_CONTADOR_PC|Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_PC|ADDRESS_OUT\(7));

\COMP_ROM|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux6~0_combout\ = (!\COMP_PC|ADDRESS_OUT\(2) & (!\COMP_PC|ADDRESS_OUT\(3) & ((\COMP_PC|ADDRESS_OUT\(1)) # (\COMP_PC|ADDRESS_OUT\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000011100000000000001110000000000000111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(2),
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(3),
	combout => \COMP_ROM|Mux6~0_combout\);

\COMP_ROM|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux2~0_combout\ = (!\COMP_PC|ADDRESS_OUT\(4) & (!\COMP_PC|ADDRESS_OUT\(5) & (!\COMP_PC|ADDRESS_OUT\(6) & !\COMP_PC|ADDRESS_OUT\(7))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(4),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(5),
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(6),
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(7),
	combout => \COMP_ROM|Mux2~0_combout\);

\COMP_ROM|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux6~1_combout\ = (!\COMP_ROM|Mux6~0_combout\) # (!\COMP_ROM|Mux2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	combout => \COMP_ROM|Mux6~1_combout\);

\COMP_ROM|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux5~0_combout\ = (!\COMP_PC|ADDRESS_OUT\(2) & (!\COMP_PC|ADDRESS_OUT\(3) & ((!\COMP_PC|ADDRESS_OUT\(0)) # (\COMP_PC|ADDRESS_OUT\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000000000000101100000000000010110000000000001011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(2),
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(3),
	combout => \COMP_ROM|Mux5~0_combout\);

\COMP_ROM|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux5~1_combout\ = (!\COMP_ROM|Mux2~0_combout\) # (!\COMP_ROM|Mux5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	combout => \COMP_ROM|Mux5~1_combout\);

\COMP_ROM|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux2~1_combout\ = ( !\COMP_PC|ADDRESS_OUT\(6) & ( !\COMP_PC|ADDRESS_OUT\(7) & ( (!\COMP_PC|ADDRESS_OUT\(2) & (!\COMP_PC|ADDRESS_OUT\(3) & (!\COMP_PC|ADDRESS_OUT\(4) & !\COMP_PC|ADDRESS_OUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(2),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(3),
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(4),
	datad => \COMP_PC|ALT_INV_ADDRESS_OUT\(5),
	datae => \COMP_PC|ALT_INV_ADDRESS_OUT\(6),
	dataf => \COMP_PC|ALT_INV_ADDRESS_OUT\(7),
	combout => \COMP_ROM|Mux2~1_combout\);

\COMP_ROM|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux3~0_combout\ = (\COMP_PC|ADDRESS_OUT\(0) & (\COMP_PC|ADDRESS_OUT\(1) & \COMP_ROM|Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	combout => \COMP_ROM|Mux3~0_combout\);

\COMP_ROM|Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ROM|Mux2~2_combout\ = (!\COMP_PC|ADDRESS_OUT\(1) & \COMP_ROM|Mux2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datab => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	combout => \COMP_ROM|Mux2~2_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\ = (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # (!\COMP_ROM|Mux5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001110000011100000111000001110000011100000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux10~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\);

\COMP_MUX_1|RESULT[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_MUX_1|RESULT[0]~0_combout\ = ( \COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ & ( (!\COMP_PC|ADDRESS_OUT\(0)) # ((!\COMP_PC|ADDRESS_OUT\(1)) # ((\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\))) ) ) ) # ( 
-- !\COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ & ( (\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\) ) ) ) # ( \COMP_ROM|Mux2~1_combout\ & ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ & ( (!\COMP_PC|ADDRESS_OUT\(0)) 
-- # (!\COMP_PC|ADDRESS_OUT\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011101110111000000000000011111110111011101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datad => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datae => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	dataf => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~19_q\,
	combout => \COMP_MUX_1|RESULT[0]~0_combout\);

\COMP_ALU|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux10~0_combout\ = (\COMP_ROM|Mux2~1_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ $ (!\COMP_MUX_1|RESULT[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010100000101000001010000010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\,
	datac => \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\,
	combout => \COMP_ALU|Mux10~0_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\ = (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & \COMP_ROM|Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux10~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~11_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~11_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~19_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux9~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\);

\COMP_MUX_1|RESULT[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_MUX_1|RESULT[1]~1_combout\ = ( \COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ & ( (!\COMP_PC|ADDRESS_OUT\(0) & (((!\COMP_ROM|Mux6~0_combout\) # (!\COMP_ROM|Mux2~0_combout\)))) # (\COMP_PC|ADDRESS_OUT\(0) & 
-- (!\COMP_PC|ADDRESS_OUT\(1) $ (((\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\))))) ) ) ) # ( !\COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ & ( (\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\) ) ) ) # ( 
-- \COMP_ROM|Mux2~1_combout\ & ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ & ( (!\COMP_PC|ADDRESS_OUT\(0) & (((!\COMP_ROM|Mux6~0_combout\) # (!\COMP_ROM|Mux2~0_combout\)))) # (\COMP_PC|ADDRESS_OUT\(0) & (!\COMP_PC|ADDRESS_OUT\(1) & 
-- ((!\COMP_ROM|Mux6~0_combout\) # (!\COMP_ROM|Mux2~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011101110000000000000000011111110111011100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datad => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datae => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	dataf => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~20_q\,
	combout => \COMP_MUX_1|RESULT[1]~1_combout\);

\COMP_ALU|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux9~0_combout\ = ( \COMP_MUX_1|RESULT[0]~0_combout\ & ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_PC|ADDRESS_OUT\(1) $ (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ $ 
-- (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\)))) ) ) ) # ( !\COMP_MUX_1|RESULT[0]~0_combout\ & ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) ) ) ) # ( 
-- \COMP_MUX_1|RESULT[0]~0_combout\ & ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_PC|ADDRESS_OUT\(1) $ (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ $ (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\)))) ) ) ) # ( 
-- !\COMP_MUX_1|RESULT[0]~0_combout\ & ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000100100010000100110011000000000010000100010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datab => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\,
	datae => \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\,
	dataf => \COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\,
	combout => \COMP_ALU|Mux9~0_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux9~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~12_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~12_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~20_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux8~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\);

\COMP_MUX_1|RESULT[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_MUX_1|RESULT[2]~2_combout\ = ( \COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\ & ( (\COMP_PC|ADDRESS_OUT\(0) & (\COMP_PC|ADDRESS_OUT\(1) & (\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\))) ) ) ) # ( 
-- !\COMP_ROM|Mux2~1_combout\ & ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\ & ( (\COMP_ROM|Mux6~0_combout\ & \COMP_ROM|Mux2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datad => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datae => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	dataf => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~21_q\,
	combout => \COMP_MUX_1|RESULT[2]~2_combout\);

\COMP_ALU|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux8~0_combout\ = ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( (!\COMP_ROM|Mux2~2_combout\ & ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) # ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\)))) # 
-- (\COMP_ROM|Mux2~2_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\))) ) ) # ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( 
-- (\COMP_MUX_1|RESULT[0]~0_combout\ & ((!\COMP_ROM|Mux2~2_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\)) # (\COMP_ROM|Mux2~2_combout\ & 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000001101001011011110100000000100000011010010110111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\,
	datad => \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\,
	datae => \COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\,
	combout => \COMP_ALU|Mux8~0_combout\);

\COMP_ALU|Mux8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux8~1_combout\ = (\COMP_ROM|Mux2~1_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ $ (!\COMP_MUX_1|RESULT[2]~2_combout\ $ (\COMP_ALU|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010001000001000101000100000100010100010000010001010001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~45_combout\,
	datac => \COMP_MUX_1|ALT_INV_RESULT[2]~2_combout\,
	datad => \COMP_ALU|ALT_INV_Mux8~0_combout\,
	combout => \COMP_ALU|Mux8~1_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux8~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~13_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~13_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~21_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux7~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~22_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\);

\COMP_ALU|OP2|RESULTADO|C~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~0_combout\ = ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( \COMP_MUX_1|RESULT[2]~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) # ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\) # 
-- ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\))) ) ) ) # ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( \COMP_MUX_1|RESULT[2]~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\) # 
-- ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\))) ) ) ) # ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( !\COMP_MUX_1|RESULT[2]~2_combout\ & ( 
-- (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ & ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) # ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\)))) ) ) ) # ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( 
-- !\COMP_MUX_1|RESULT[2]~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000110000001110000011110000111110001111110011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~45_combout\,
	datad => \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\,
	datae => \COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\,
	dataf => \COMP_MUX_1|ALT_INV_RESULT[2]~2_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~0_combout\);

\COMP_ALU|OP1|C~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP1|C~0_combout\ = ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( \COMP_MUX_1|RESULT[2]~2_combout\ & ( (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\)) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\) ) ) ) # ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( \COMP_MUX_1|RESULT[2]~2_combout\ & ( ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ & 
-- \COMP_MUX_1|RESULT[0]~0_combout\))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\) ) ) ) # ( \COMP_MUX_1|RESULT[1]~1_combout\ & ( !\COMP_MUX_1|RESULT[2]~2_combout\ & ( (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ & 
-- (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\))) ) ) ) # ( !\COMP_MUX_1|RESULT[1]~1_combout\ & ( !\COMP_MUX_1|RESULT[2]~2_combout\ & ( 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~43_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~44_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~45_combout\ & \COMP_MUX_1|RESULT[0]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000110000011100001111000111110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~43_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~44_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~45_combout\,
	datad => \COMP_MUX_1|ALT_INV_RESULT[0]~0_combout\,
	datae => \COMP_MUX_1|ALT_INV_RESULT[1]~1_combout\,
	dataf => \COMP_MUX_1|ALT_INV_RESULT[2]~2_combout\,
	combout => \COMP_ALU|OP1|C~0_combout\);

\COMP_ALU|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux7~0_combout\ = ( !\COMP_PC|ADDRESS_OUT\(1) & ( (((\COMP_ROM|Mux2~1_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ $ (!\COMP_ALU|OP1|C~0_combout\))))) ) ) # ( \COMP_PC|ADDRESS_OUT\(1) & ( (\COMP_ROM|Mux2~1_combout\ & 
-- (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ $ (!\COMP_ALU|OP2|RESULTADO|C~0_combout\ $ (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & \COMP_PC|ADDRESS_OUT\(0))))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000000000000000000000000111100001111000011011011001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\,
	datac => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datad => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~0_combout\,
	datae => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	dataf => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datag => \COMP_ALU|OP1|ALT_INV_C~0_combout\,
	combout => \COMP_ALU|Mux7~0_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux7~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~22_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~14_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~14_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~22_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux6~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~23_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\);

\COMP_UNIDADE_DE_CONTROLE|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ = (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_PC|ADDRESS_OUT\(0)) # (!\COMP_PC|ADDRESS_OUT\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001110000011100000111000001110000011100000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(0),
	datab => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	combout => \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\);

\COMP_ALU|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux6~0_combout\ = ( \COMP_ALU|OP1|C~0_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & (!\COMP_ROM|Mux2~2_combout\ $ ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\)))) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & ((!\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\) # (!\COMP_ROM|Mux2~2_combout\ $ (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\)))) ) ) ) # ( !\COMP_ALU|OP1|C~0_combout\ & ( 
-- \COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & (!\COMP_ROM|Mux2~2_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))) ) ) ) # ( \COMP_ALU|OP1|C~0_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & (\COMP_ROM|Mux2~2_combout\)) ) ) ) # ( !\COMP_ALU|OP1|C~0_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & (!\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & (!\COMP_ROM|Mux2~2_combout\ $ (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100100000000000111010001000110001011100010001001111110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\,
	datad => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	datae => \COMP_ALU|OP1|ALT_INV_C~0_combout\,
	dataf => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~0_combout\,
	combout => \COMP_ALU|Mux6~0_combout\);

\COMP_ALU|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux6~1_combout\ = ( \COMP_ALU|Mux6~0_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ $ (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\ & !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\))))) ) ) # 
-- ( !\COMP_ALU|Mux6~0_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ $ (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\) # (\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010001010000010100010000010100000100010100000101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~47_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~55_combout\,
	datad => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	datae => \COMP_ALU|ALT_INV_Mux6~0_combout\,
	combout => \COMP_ALU|Mux6~1_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux6~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~23_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~15_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~15_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~23_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux5~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~24_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\);

\COMP_ALU|OP2|RESULTADO|C~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~1_combout\ = !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ $ (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\) # (\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\,
	datac => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~1_combout\);

\COMP_ALU|OP1|C~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP1|C~1_combout\ = ( \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP1|C~0_combout\ & ( (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\) ) ) ) # ( 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP1|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\ & ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\)))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\)) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\))) ) ) ) # ( !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( !\COMP_ALU|OP1|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & 
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100110111000000000000000000010011011111110001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~47_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~55_combout\,
	datae => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	dataf => \COMP_ALU|OP1|ALT_INV_C~0_combout\,
	combout => \COMP_ALU|OP1|C~1_combout\);

\COMP_ALU|OP2|RESULTADO|C~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~2_combout\ = ( \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\) ) ) ) # ( 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\) # 
-- ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\)))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\ & 
-- ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\)))) ) ) ) # ( !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~0_combout\ & ( 
-- (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\))) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~47_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~46_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~54_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~55_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100011001110000000000000000010001100111011111000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~46_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~47_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~54_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~55_combout\,
	datae => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	dataf => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~0_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~2_combout\);

\COMP_ALU|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux5~0_combout\ = ( \COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_ALU|OP2|RESULTADO|C~1_combout\ $ (((!\COMP_PC|ADDRESS_OUT\(1) & !\COMP_ALU|OP1|C~1_combout\))))) ) ) # ( !\COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( 
-- (\COMP_ROM|Mux2~1_combout\ & (!\COMP_ALU|OP2|RESULTADO|C~1_combout\ $ (((!\COMP_ALU|OP1|C~1_combout\) # (\COMP_PC|ADDRESS_OUT\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100100001000100100011000000000011001000010001001000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datab => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datac => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~1_combout\,
	datad => \COMP_ALU|OP1|ALT_INV_C~1_combout\,
	datae => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~2_combout\,
	combout => \COMP_ALU|Mux5~0_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux5~0_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~24_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~16_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~16_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~24_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux4~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~25_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\);

\COMP_ALU|OP2|RESULTADO|C~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~3_combout\ = !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ $ (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\) # (\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~49_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~57_combout\,
	datac => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~3_combout\);

\COMP_ALU|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux4~0_combout\ = ( \COMP_ALU|OP1|C~1_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & (!\COMP_ROM|Mux2~2_combout\ $ ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\)))) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & ((!\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\) # (!\COMP_ROM|Mux2~2_combout\ $ (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\)))) ) ) ) # ( !\COMP_ALU|OP1|C~1_combout\ & ( 
-- \COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (!\COMP_ROM|Mux2~2_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))) ) ) ) # ( \COMP_ALU|OP1|C~1_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (\COMP_ROM|Mux2~2_combout\)) ) ) ) # ( !\COMP_ALU|OP1|C~1_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & (!\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & (!\COMP_ROM|Mux2~2_combout\ $ (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100100000000000111010001000110001011100010001001111110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\,
	datad => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	datae => \COMP_ALU|OP1|ALT_INV_C~1_combout\,
	dataf => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~2_combout\,
	combout => \COMP_ALU|Mux4~0_combout\);

\COMP_ALU|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux4~1_combout\ = (\COMP_ROM|Mux2~1_combout\ & (!\COMP_ALU|OP2|RESULTADO|C~3_combout\ $ (!\COMP_ALU|Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010100000101000001010000010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datab => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~3_combout\,
	datac => \COMP_ALU|ALT_INV_Mux4~0_combout\,
	combout => \COMP_ALU|Mux4~1_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux4~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~25_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~17_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~17_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~25_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux3~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~26_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\);

\COMP_ALU|OP2|RESULTADO|C~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~4_combout\ = !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\ $ (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\) # (\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~50_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~58_combout\,
	datac => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~4_combout\);

\COMP_ALU|OP2|RESULTADO|C~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP2|RESULTADO|C~5_combout\ = ( \COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\) ) ) ) # ( 
-- !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( \COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ & ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\) # 
-- ((\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\)))) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\ & 
-- ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\)))) ) ) ) # ( !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\ & ( !\COMP_ALU|OP2|RESULTADO|C~2_combout\ & ( 
-- (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ & (((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\)) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\))) # 
-- (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ & (!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100011001110000000000000000010001100111011111000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~49_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~57_combout\,
	datae => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	dataf => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~2_combout\,
	combout => \COMP_ALU|OP2|RESULTADO|C~5_combout\);

\COMP_ALU|Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux4~2_combout\ = (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~48_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~56_combout\ & !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~48_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~56_combout\,
	datac => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|Mux4~2_combout\);

\COMP_ALU|OP1|C~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|OP1|C~2_combout\ = (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~49_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~57_combout\ & !\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~49_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~57_combout\,
	datac => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|OP1|C~2_combout\);

\COMP_ALU|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux3~0_combout\ = ( \COMP_ALU|Mux4~2_combout\ & ( \COMP_ALU|OP1|C~2_combout\ & ( \COMP_ROM|Mux2~2_combout\ ) ) ) # ( !\COMP_ALU|Mux4~2_combout\ & ( \COMP_ALU|OP1|C~2_combout\ & ( \COMP_ROM|Mux2~2_combout\ ) ) ) # ( \COMP_ALU|Mux4~2_combout\ & ( 
-- !\COMP_ALU|OP1|C~2_combout\ & ( (\COMP_ROM|Mux2~2_combout\ & \COMP_ALU|OP2|RESULTADO|C~3_combout\) ) ) ) # ( !\COMP_ALU|Mux4~2_combout\ & ( !\COMP_ALU|OP1|C~2_combout\ & ( (\COMP_ROM|Mux2~2_combout\ & (\COMP_ALU|OP2|RESULTADO|C~1_combout\ & 
-- (\COMP_ALU|OP1|C~1_combout\ & \COMP_ALU|OP2|RESULTADO|C~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	datab => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~1_combout\,
	datac => \COMP_ALU|OP1|ALT_INV_C~1_combout\,
	datad => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~3_combout\,
	datae => \COMP_ALU|ALT_INV_Mux4~2_combout\,
	dataf => \COMP_ALU|OP1|ALT_INV_C~2_combout\,
	combout => \COMP_ALU|Mux3~0_combout\);

\COMP_ALU|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux3~1_combout\ = ( \COMP_ALU|Mux3~0_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & !\COMP_ALU|OP2|RESULTADO|C~4_combout\) ) ) # ( !\COMP_ALU|Mux3~0_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (!\COMP_ALU|OP2|RESULTADO|C~4_combout\ $ 
-- (((!\COMP_PC|ADDRESS_OUT\(1)) # (!\COMP_ALU|OP2|RESULTADO|C~5_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100010010001100000011000000000011000100100011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datab => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datac => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~4_combout\,
	datad => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~5_combout\,
	datae => \COMP_ALU|ALT_INV_Mux3~0_combout\,
	combout => \COMP_ALU|Mux3~1_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \COMP_ALU|Mux3~1_combout\,
	ena => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18_q\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\ = ( \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\ & ( (\COMP_ROM|Mux2~1_combout\ & ((!\COMP_ROM|Mux2~0_combout\) # ((!\COMP_ROM|Mux5~0_combout\) # (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18_q\)))) ) ) # 
-- ( !\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~26_q\ & ( (\COMP_ROM|Mux2~0_combout\ & (\COMP_ROM|Mux5~0_combout\ & (\COMP_ROM|Mux2~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~18_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000011100000111100000000000000010000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux5~0_combout\,
	datac => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datad => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~18_q\,
	datae => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~26_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~51\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~51_combout\ = (!\COMP_ROM|Mux6~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~19_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~1_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~19_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~51_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~52\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~52_combout\ = (\COMP_ROM|Mux6~0_combout\ & (\COMP_ROM|Mux2~0_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~20_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~0_combout\,
	datab => \COMP_ROM|ALT_INV_Mux2~0_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~20_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~52_combout\);

\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~53_combout\ = (!\COMP_ROM|Mux6~1_combout\ & \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~21_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux6~1_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~21_q\,
	combout => \COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~53_combout\);

\COMP_ALU|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux11~0_combout\ = (!\COMP_ROM|Mux2~2_combout\ & (\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~50_combout\ & ((!\COMP_BANCO_REGISTRADORES|MEM_BANCO_REG~58_combout\) # (\COMP_UNIDADE_DE_CONTROLE|Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100010001000000010001000100000001000100010000000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_ROM|ALT_INV_Mux2~2_combout\,
	datab => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~50_combout\,
	datac => \COMP_BANCO_REGISTRADORES|ALT_INV_MEM_BANCO_REG~58_combout\,
	datad => \COMP_UNIDADE_DE_CONTROLE|ALT_INV_Mux9~0_combout\,
	combout => \COMP_ALU|Mux11~0_combout\);

\COMP_ALU|Mux11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \COMP_ALU|Mux11~1_combout\ = ( \COMP_ALU|Mux3~0_combout\ & ( \COMP_ALU|Mux11~0_combout\ & ( \COMP_ROM|Mux2~1_combout\ ) ) ) # ( !\COMP_ALU|Mux3~0_combout\ & ( \COMP_ALU|Mux11~0_combout\ & ( \COMP_ROM|Mux2~1_combout\ ) ) ) # ( \COMP_ALU|Mux3~0_combout\ & ( 
-- !\COMP_ALU|Mux11~0_combout\ & ( (\COMP_ROM|Mux2~1_combout\ & (((\COMP_PC|ADDRESS_OUT\(1) & !\COMP_ALU|OP2|RESULTADO|C~5_combout\)) # (\COMP_ALU|OP2|RESULTADO|C~4_combout\))) ) ) ) # ( !\COMP_ALU|Mux3~0_combout\ & ( !\COMP_ALU|Mux11~0_combout\ & ( 
-- (\COMP_PC|ADDRESS_OUT\(1) & (\COMP_ROM|Mux2~1_combout\ & (!\COMP_ALU|OP2|RESULTADO|C~4_combout\ & !\COMP_ALU|OP2|RESULTADO|C~5_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000100110000001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_PC|ALT_INV_ADDRESS_OUT\(1),
	datab => \COMP_ROM|ALT_INV_Mux2~1_combout\,
	datac => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~4_combout\,
	datad => \COMP_ALU|OP2|RESULTADO|ALT_INV_C~5_combout\,
	datae => \COMP_ALU|ALT_INV_Mux3~0_combout\,
	dataf => \COMP_ALU|ALT_INV_Mux11~0_combout\,
	combout => \COMP_ALU|Mux11~1_combout\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/CPU_LM.ram0_RAM_15119.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "RAM:COMP_RAM|altsyncram:MEM_rtl_0|altsyncram_sus1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => GND,
	clk0 => \CLOCK~input_o\,
	portadatain => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \COMP_RAM|MEM_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

ww_PC_OUT(0) <= \PC_OUT[0]~output_o\;

ww_PC_OUT(1) <= \PC_OUT[1]~output_o\;

ww_PC_OUT(2) <= \PC_OUT[2]~output_o\;

ww_PC_OUT(3) <= \PC_OUT[3]~output_o\;

ww_PC_OUT(4) <= \PC_OUT[4]~output_o\;

ww_PC_OUT(5) <= \PC_OUT[5]~output_o\;

ww_PC_OUT(6) <= \PC_OUT[6]~output_o\;

ww_PC_OUT(7) <= \PC_OUT[7]~output_o\;

ww_ROM_OUT(0) <= \ROM_OUT[0]~output_o\;

ww_ROM_OUT(1) <= \ROM_OUT[1]~output_o\;

ww_ROM_OUT(2) <= \ROM_OUT[2]~output_o\;

ww_ROM_OUT(3) <= \ROM_OUT[3]~output_o\;

ww_ROM_OUT(4) <= \ROM_OUT[4]~output_o\;

ww_ROM_OUT(5) <= \ROM_OUT[5]~output_o\;

ww_ROM_OUT(6) <= \ROM_OUT[6]~output_o\;

ww_ROM_OUT(7) <= \ROM_OUT[7]~output_o\;

ww_OPCODE_OUT(0) <= \OPCODE_OUT[0]~output_o\;

ww_OPCODE_OUT(1) <= \OPCODE_OUT[1]~output_o\;

ww_OPCODE_OUT(2) <= \OPCODE_OUT[2]~output_o\;

ww_OPCODE_OUT(3) <= \OPCODE_OUT[3]~output_o\;

ww_RS_OUT(0) <= \RS_OUT[0]~output_o\;

ww_RS_OUT(1) <= \RS_OUT[1]~output_o\;

ww_RT_OUT(0) <= \RT_OUT[0]~output_o\;

ww_RT_OUT(1) <= \RT_OUT[1]~output_o\;

ww_ADDRESS_OUT(0) <= \ADDRESS_OUT[0]~output_o\;

ww_ADDRESS_OUT(1) <= \ADDRESS_OUT[1]~output_o\;

ww_ADDRESS_OUT(2) <= \ADDRESS_OUT[2]~output_o\;

ww_ADDRESS_OUT(3) <= \ADDRESS_OUT[3]~output_o\;

ww_R_A_OUT(0) <= \R_A_OUT[0]~output_o\;

ww_R_A_OUT(1) <= \R_A_OUT[1]~output_o\;

ww_R_A_OUT(2) <= \R_A_OUT[2]~output_o\;

ww_R_A_OUT(3) <= \R_A_OUT[3]~output_o\;

ww_R_A_OUT(4) <= \R_A_OUT[4]~output_o\;

ww_R_A_OUT(5) <= \R_A_OUT[5]~output_o\;

ww_R_A_OUT(6) <= \R_A_OUT[6]~output_o\;

ww_R_A_OUT(7) <= \R_A_OUT[7]~output_o\;

ww_R_B_OUT(0) <= \R_B_OUT[0]~output_o\;

ww_R_B_OUT(1) <= \R_B_OUT[1]~output_o\;

ww_R_B_OUT(2) <= \R_B_OUT[2]~output_o\;

ww_R_B_OUT(3) <= \R_B_OUT[3]~output_o\;

ww_R_B_OUT(4) <= \R_B_OUT[4]~output_o\;

ww_R_B_OUT(5) <= \R_B_OUT[5]~output_o\;

ww_R_B_OUT(6) <= \R_B_OUT[6]~output_o\;

ww_R_B_OUT(7) <= \R_B_OUT[7]~output_o\;

ww_ALU_RESULT_OUT(0) <= \ALU_RESULT_OUT[0]~output_o\;

ww_ALU_RESULT_OUT(1) <= \ALU_RESULT_OUT[1]~output_o\;

ww_ALU_RESULT_OUT(2) <= \ALU_RESULT_OUT[2]~output_o\;

ww_ALU_RESULT_OUT(3) <= \ALU_RESULT_OUT[3]~output_o\;

ww_ALU_RESULT_OUT(4) <= \ALU_RESULT_OUT[4]~output_o\;

ww_ALU_RESULT_OUT(5) <= \ALU_RESULT_OUT[5]~output_o\;

ww_ALU_RESULT_OUT(6) <= \ALU_RESULT_OUT[6]~output_o\;

ww_ALU_RESULT_OUT(7) <= \ALU_RESULT_OUT[7]~output_o\;

ww_ALU_OVERFLOW_OUT <= \ALU_OVERFLOW_OUT~output_o\;

ww_RAM_OUT(0) <= \RAM_OUT[0]~output_o\;

ww_RAM_OUT(1) <= \RAM_OUT[1]~output_o\;

ww_RAM_OUT(2) <= \RAM_OUT[2]~output_o\;

ww_RAM_OUT(3) <= \RAM_OUT[3]~output_o\;

ww_RAM_OUT(4) <= \RAM_OUT[4]~output_o\;

ww_RAM_OUT(5) <= \RAM_OUT[5]~output_o\;

ww_RAM_OUT(6) <= \RAM_OUT[6]~output_o\;

ww_RAM_OUT(7) <= \RAM_OUT[7]~output_o\;

ww_MUX_2_OUT(0) <= \MUX_2_OUT[0]~output_o\;

ww_MUX_2_OUT(1) <= \MUX_2_OUT[1]~output_o\;

ww_MUX_2_OUT(2) <= \MUX_2_OUT[2]~output_o\;

ww_MUX_2_OUT(3) <= \MUX_2_OUT[3]~output_o\;

ww_MUX_2_OUT(4) <= \MUX_2_OUT[4]~output_o\;

ww_MUX_2_OUT(5) <= \MUX_2_OUT[5]~output_o\;

ww_MUX_2_OUT(6) <= \MUX_2_OUT[6]~output_o\;

ww_MUX_2_OUT(7) <= \MUX_2_OUT[7]~output_o\;
END structure;


