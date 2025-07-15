module top
(
    input wire clk, reset, start,
    input wire [5:0] a, b,
    input wire [1:0] op,
    output wire [5:0] result,
    output wire flag
);

wire [5:0] alu_in1, alu_in2;
wire [1:0] alu_op;
wire [5:0] alu_out;
wire alu_flag;

controller controller1
(
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .op(op),
    .alu_in1(alu_in1),
    .alu_in2(alu_in2),
    .alu_op(alu_op),
    .alu_out(alu_out),
    .alu_flag(alu_flag),
    .result(result),
    .flag(flag)
);

ALU datapath1
(
    .A(alu_in1),
    .B(alu_in2),
    .OP(alu_op),
    .R(alu_out),
    .alu_flag(alu_flag)
);

endmodule