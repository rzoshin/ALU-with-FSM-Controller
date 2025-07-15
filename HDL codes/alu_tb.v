`timescale 1ns/1ns

module alu_tb;
    reg [5:0] A, B;       
    reg [1:0] OP;          
    wire [5:0] R;          
    wire alu_flag ;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .alu_flag(alu_flag)
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        A = 6'b000100; B = 6'b000011; OP = 2'b00;
        #10;

        A = 6'b000100; B = 6'b000010; OP = 2'b01;
        #10;

        A = 6'b000111; B = 6'b000010; OP = 2'b10;
        #10;

        A = 6'b000110; B = 6'b000001; OP = 2'b11;
        #10;

        A = 6'b000111; B = 6'b000111; OP = 2'b00;
        #10;

        A = 6'b000001; B = 6'b000111; OP = 2'b01;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b alu_flag=%b", $time, A, B, OP, R, alu_flag);
    end

endmodule
