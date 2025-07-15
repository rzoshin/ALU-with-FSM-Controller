module controller 
( 
    input wire clk, reset, start, 
    input wire [5:0] a, b, 
    input wire [1:0] op, 

    input wire [5:0] alu_out, 
    input wire alu_flag, 
    output wire [5:0] alu_in1, alu_in2, 
    output wire [1:0] alu_op, 

    output reg [5:0] result, 
    output reg flag 
); 

reg [2:0] pstate, nstate; 

parameter [2:0] START = 3'b000, 
                ONE = 3'b001, 
                TWO = 3'b010, 
                THREE = 3'b011, 
                FINISH = 3'b100; 

//Memory 
always @(posedge clk, posedge reset) 
begin : PSR 
    if (reset) 
    begin
        pstate <= START; 
    end
    else 
    begin
        pstate <= nstate; 
    end
end 

//Next State Logic 
always @(*) 
begin: NSOL 
    // Monitor output 
    if(pstate == START)
        $monitor("pstate = START -> clk = %b, reset = %b, start = %b, a = %d, b = %d, op = %b, result = %d, flag = %b\n************************************\n", clk, reset, start, a, b, op, result, flag);
    else if(pstate == ONE)
        $monitor("pstate = ONE -> clk = %b, reset = %b, start = %b, a = %d, b = %d, op = %b, result = %d, flag = %b\n************************************\n", clk, reset, start, a, b, op, result, flag);
    else if(pstate == TWO)
        $monitor("pstate = TWO -> clk = %b, reset = %b, start = %b, a = %d, b = %d, op = %b, result = %d, flag = %b\n************************************\n", clk, reset, start, a, b, op, result, flag);
    else if(pstate == THREE)
        $monitor("pstate = THREE -> clk = %b, reset = %b, start = %b, a = %d, b = %d, op = %b, result = %d, flag = %b\n************************************\n", clk, reset, start, a, b, op, result, flag);
    else if(pstate == FINISH)
        $monitor("pstate = FINISH -> clk = %b, reset = %b, start = %b, a = %d, b = %d, op = %b, result = %d, flag = %b\n************************************\n", clk, reset, start, a, b, op, result, flag);

    nstate = pstate;

    // Next State Logic and Output Logic
    begin: NSL
    case (pstate) 
        START: 
        begin 
            if (start) 
                nstate = ONE; 
        end 

        ONE: 
        begin 
            nstate = TWO; 
        end 

        TWO: 
        begin 
            nstate = THREE; 
        end 

        THREE: 
        begin 
            nstate = FINISH; 
        end 

        FINISH: 
        begin 
            nstate = FINISH; 
        end 

        default: 
            nstate = START; 
    endcase 
end
    result = 6'b000000;
    flag = 1'b0;
begin: OL
    case (pstate) 
        START: 
        begin 
            result = 6'b0;
            flag = 0; 
        end 

        ONE: 
        begin 
            result = alu_out; 
            flag = alu_flag;   
        end 

        TWO: 
        begin 
            result = alu_out; 
            flag = alu_flag;  
        end 

        THREE: 
        begin 
            result = alu_out; 
            flag = alu_flag;  
        end 

        FINISH: 
        begin 
            result = alu_out; 
            flag = alu_flag; 
        end 
        default: 
            nstate = START; 
    endcase 
end
end

assign alu_in1 = a;
assign alu_in2 = b;
assign alu_op = op;

endmodule
