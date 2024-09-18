module ALU_bit_8(
    input [7:0] InputA,
    input [7:0] InputB,
    input [2:0] OpCode,
    output reg [15:0] OutALU
);
    always @(*) begin
        case(OpCode)
            3'b000: OutALU = InputA + InputB;      // Addition
            3'b001: OutALU = InputA - InputB;      // Subtraction
            3'b010: OutALU = InputA * InputB;      // Multiplication
            3'b011: OutALU = InputA << InputB[2:0]; // Left Shift (only 3 bits used for shifting)
            3'b100: OutALU = InputA >> InputB[2:0]; // Right Shift (only 3 bits used for shifting)
            3'b101: OutALU = InputA & InputB;      // Bitwise AND
            3'b110: OutALU = InputA | InputB;      // Bitwise OR
            3'b111: OutALU = InputA ^ InputB;      // Bitwise XOR
            default: OutALU = 16'b0;               // Default case
        endcase
    end
endmodule
