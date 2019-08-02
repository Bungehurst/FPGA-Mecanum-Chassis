transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {fre_meter_8_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/dell/Desktop/cc4/par/simulation/modelsim {C:/Users/dell/Desktop/cc4/par/simulation/modelsim/fre_meter.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  fre_meter_vlg_tst

add wave *
view structure
view signals
run -all
