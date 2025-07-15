module OR_XOR_AND_Nbit 
(
    input wire [5:0] A,B,
    output wire [5:0] R
);

    assign R = ((A|B)^(A&B)); 

endmodule