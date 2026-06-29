vlib work

vlog ../RTL/*.v
vlog ../Verification/tb_processor.sv

vsim tb_processor

add wave sim:/tb_processor/DUT/alu_result
add wave sim:/tb_processor/DUT/mem_data
add wave sim:/tb_processor/DUT/DM/memory

run -all