`timescale 1ns/1ns

module top_tb;

reg clk, reset, start;
reg [5:0] a, b;
reg [1:0] op;
wire [5:0] result;
wire flag;

top top1
(
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .flag(flag)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5 time units
end

initial begin
    $dumpfile("top_test.vcd");
    $dumpvars(0, top_tb);

    clk <= 0;
    reset <= 0;
    start <= 0;
    a <= 0;
    b <= 0;
    op <= 0;

    @(negedge clk);
    reset <= 1;

    @(negedge clk);
    reset <= 0;
    start <= 1;
    a <= 5;
    b <= 3;
    op <= 2'b00; // Addition: 5 + 3 = 8 (flag = 1)
    #15;

    a <= 0;
    b <= 0;
    op <= 2'b00; // Addition: 0 + 0 = 0 (flag = 0)
    #10;

    a <= 10;
    b <= 7;
    op <= 2'b01; // OR_XOR_AND: (10 | 7) ^ (10 & 7) = 15 ^ 2 = 13 (flag = 1)
    #20;

    reset <= 1;
    #30;

    $finish();
end

endmodule