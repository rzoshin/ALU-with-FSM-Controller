`timescale 1ns/1ns

module controller_tb;
    reg clk;
    reg reset;
    reg start;
    reg [5:0] a;
    reg [5:0] b;
    reg [1:0] op;
    reg [5:0] alu_out;
    reg alu_flag;
    wire [5:0] alu_in1;
    wire [5:0] alu_in2;
    wire [1:0] alu_op;
    wire [5:0] result;
    wire flag;

    controller dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a),
        .b(b),
        .op(op),
        .alu_out(alu_out),
        .alu_flag(alu_flag),
        .alu_in1(alu_in1),
        .alu_in2(alu_in2),
        .alu_op(alu_op),
        .result(result),
        .flag(flag)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        
        reset = 0;
        start = 0;
        a = 6'd0;
        b = 6'd0;
        op = 2'b00;
        alu_out = 6'd0;
        alu_flag = 0;

        
        #10;
        reset = 1;

        
        #10;
        reset = 0;
        start = 1;
        a = 6'd5;
        b = 6'd3;
        op = 2'b00;
        alu_out = 6'd8;  // Addition: 5 + 3
        alu_flag = 1;

        
        #15;
        a = 6'd0;
        b = 6'd0;
        op = 2'b00;
        alu_out = 6'd0;  // Addition: 0 + 0
        alu_flag = 0;

        
        #10;
        a = 6'd10;
        b = 6'd7;
        op = 2'b01;
        alu_out = 6'd13; // OR_XOR_AND: (10 | 7) ^ (10 & 7) = 15 ^ 2 = 13
        alu_flag = 1;

        
        #20;
        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | start=%b | a=%d | b=%d | op=%b | alu_out=%d | alu_flag=%b | alu_in1=%d | alu_in2=%d | alu_op=%b | result=%d | flag=%b",
                 $time, clk, reset, start, a, b, op, alu_out, alu_flag, alu_in1, alu_in2, alu_op, result, flag);
    end

    
    initial begin
        $dumpfile("controller_tb.vcd");
        $dumpvars(0, controller_tb);
    end

endmodule