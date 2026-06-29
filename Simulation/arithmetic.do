vlib work

vlog ../RTL/*.v
vlog ../Verification/tb_processor.sv

vsim tb_processor

add wave sim:/tb_processor/DUT/pc
add wave sim:/tb_processor/DUT/instruction
add wave sim:/tb_processor/DUT/rs1_data
add wave sim:/tb_processor/DUT/rs2_data
add wave sim:/tb_processor/DUT/alu_result

run -all