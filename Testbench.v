`timescale 1ns / 1ps

module ALU_bit_8_tb;

    reg [7:0] InputA;
    reg [7:0] InputB;
    reg [2:0] OpCode;
    wire [15:0] OutALU;

    ALU_bit_8 uut (
        .InputA(InputA),
        .InputB(InputB),
        .OpCode(OpCode),
        .OutALU(OutALU)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);

        // Test cases
        InputA = 8'h0F;  // 15
        InputB = 8'h03;  // 3

        OpCode = 3'b000; #10;  // Addition
        OpCode = 3'b001; #10;  // Subtraction
        OpCode = 3'b010; #10;  // Multiplication
        OpCode = 3'b011; #10;  // Left Shift
        OpCode = 3'b100; #10;  // Right Shift
        OpCode = 3'b101; #10;  // Bitwise AND
        OpCode = 3'b110; #10;  // Bitwise OR
        OpCode = 3'b111; #10;  // Bitwise XOR

        $finish;
    end

endmodule
