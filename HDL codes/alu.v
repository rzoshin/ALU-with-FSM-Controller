module ALU
(
    input wire [5:0] A, B,                   
    input wire [1:0] OP,    
    output wire [5:0] R,     
    output wire alu_flag          
);

    reg [5:0] result;
    wire [5:0] R_ADD, XOR;
    wire CF_ADD;

    // Instantiate modules
    ALU_ADD_SUB_Nbit  ADD_SUB1(A,B,R_ADD,CF_ADD);

    OR_XOR_AND_Nbit OR_XOR_AND1 (A,B,XOR);

    always @(*) 
    begin
        case (OP)
            2'b00: // Addition 
                begin 
                    result = R_ADD; 
                end
            2'b01: // OR_XOR_AND
                begin 
                    result = XOR;
                end
            default: 
                begin
                    result = 6'b000000;  
                end
        endcase
    end
    assign R = result;
    assign alu_flag = (result > 6'b0);
endmodule