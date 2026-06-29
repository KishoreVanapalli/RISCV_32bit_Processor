vlib work

vlog ../RTL/*.v
vlog ../Verification/tb_processor.sv

vsim tb_processor

add wave *

run 500ns