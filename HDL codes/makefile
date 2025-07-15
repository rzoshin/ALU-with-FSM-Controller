main:
	iverilog -o out top.v controller.v alu.v add.v or_xor_and.v top_tb.sv
	vvp out
	gtkwave top_test.vcd &


main1:
	iverilog -o out1 alu.v add.v or_xor_and.v alu_tb.v
	vvp out1
	gtkwave alu_tb.vcd &

main2:
	iverilog -o out2 controller.v controller_tb.v
	vvp out2
	gtkwave controller_tb.vcd &