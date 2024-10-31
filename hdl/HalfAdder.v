`timescale 1ns / 1ps

// 1-bit half adder block
// Implemented with a gate-level design
module HalfAdder(
    input a, // Operand 1
    input b, // Operand 2
    output f, // Sum
    output carryOut // Exactly what it says on the tin
    );
    
    // Truth table
    // a b | f o
    // 0 0 | 0 0
    // 0 1 | 1 0
    // 1 0 | 1 0
    // 1 1 | 0 1
    
    // f = a'b + ab'
    //   = a xor b
    // o = ab
    
    xor(f, a, b);
    and(carryOut, a, b);
endmodule
