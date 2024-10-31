// Author: Grayson Kippes
// Date: 10/29/2024

`timescale 1ns / 1ps

// 1-bit full adder block
// Implemented with a structural and gate-level design
module FullAdder(
    input a,
    input b,
    input carryIn,
    output sum,
    output carryOut
    );
    
    // Structural design of full adder
    wire ha1Sum, ha1CarryOut, ha2CarryOut;
    HalfAdder halfAdder1(a, b, ha1Sum, ha1CarryOut);
    HalfAdder halfAdder2(ha1Sum, carryIn, sum, ha2CarryOut);
    or(carryOut, ha1CarryOut, ha2CarryOut);
endmodule
