transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {CPU_LM.vo}

vcom -93 -work work {C:/Users/marcus/Documents/UFRR/disciplinas/AOC 2024-2025/Projeto final/Processador_LM/CPU_LM_TB.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L cyclonev_ver -L lpm_ver -L sgate_ver -L cyclonev_hssi_ver -L altera_mf_ver -L cyclonev_pcie_hip_ver -L gate_work -L work -voptargs="+acc"  CPU_LM_TB

add wave *
view structure
view signals
run -all
