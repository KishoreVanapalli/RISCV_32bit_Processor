vlib work

vlog ../RTL/*.v
vlog ../Verification/tb_processor.sv

vsim tb_processor

add wave sim:/tb_processor/DUT/pc
add wave sim:/tb_processor/DUT/pc_next
add wave sim:/tb_processor/DUT/zero
add wave sim:/tb_processor/DUT/branch

run -all