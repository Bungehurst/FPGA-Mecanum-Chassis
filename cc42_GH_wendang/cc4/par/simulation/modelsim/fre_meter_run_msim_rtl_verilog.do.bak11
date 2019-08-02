transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/fre_meter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/meter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/clk_div.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/uart_send.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/dir.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl {C:/Users/Administrator/Desktop/cc42_GH/cc4/rtl/data.v}

vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/cc42_GH/cc4/par/simulation/modelsim {C:/Users/Administrator/Desktop/cc42_GH/cc4/par/simulation/modelsim/fre_meter.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  fre_meter_vlg_tst

add wave *
view structure
view signals
run -all
