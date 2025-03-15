transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/ALU.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/BANCO_REGISTRADORES.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/BRANCH_HELPER.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/CONTADOR_SINCRONO.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/DIV_INSTRUCAO.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/EXTENSOR_2X8.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/EXTENSOR_4X8.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/MUX_2X1.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/PC.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/RAM.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/ROM.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/SOMADOR_8BITS.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/SUBTRATOR_8BITS.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/UNIDADE_DE_CONTROLE.vhd}
vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/CPU_LM.vhd}

vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/CPU_LM_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  CPU_LM_TB

add wave *
view structure
view signals
run -all
