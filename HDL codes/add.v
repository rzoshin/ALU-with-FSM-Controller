module ALU_ADD_SUB_Nbit 
(
    input wire [5:0] A,B,  
    output wire [5:0] R,    
    output wire CF
);

    assign {CF, R} = A + B;


endmodule