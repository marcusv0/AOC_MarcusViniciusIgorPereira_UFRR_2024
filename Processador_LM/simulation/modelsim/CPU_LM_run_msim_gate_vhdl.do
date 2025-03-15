transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {CPU_LM.vho}

vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/CPU_LM_TB.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=CPU_LM_vhd.sdo -L altera -L altera_lnsim -L cyclonev -L gate_work -L work -voptargs="+acc"  CPU_LM_TB

add wave *
view structure
view signals
run -all
