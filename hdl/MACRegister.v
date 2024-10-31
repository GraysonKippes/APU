// Author: Grayson Kippes
// Date: 10/31/2024

`timescale 1ns / 1ps

// 32-bit multiply-accumulate register.
module MACRegister(
    input clk,
    input [1:0] opcode,
    input [15:0] a,
    input [15:0] b,
    output [31:0] dataOut
    );
    
    // The stored data of the register.
    reg [31:0] register = 32'd0;
    assign dataOut = register;
    
    // Intermediate outputs of arithmetic blocks.
    wire [31:0] product;
    wire [31:0] sum;
    
    ArrayMultiplier multiplier(a, b, product);
    Adder32 adder(register, product, sum);
    
    always @ (posedge clk) begin
        case (opcode)
            2'd1: // Parallel load
                register <= {a, b};
            2'd2: // MAC operation
                register <= sum;
        endcase
    end
endmodule
