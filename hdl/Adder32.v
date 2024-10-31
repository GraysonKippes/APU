// Author: Grayson Kippes
// Date: 10/30/2024

`timescale 1ns / 1ps

// Implements a 32-bit adder with four 8-bit ripple adders.
module Adder32(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output carryOut
    );
    
    // Carry-wires in between ripple adder blocks.
    // Only need N-1 intermediary wires, where N is the number of sub-blocks.
    wire tmpCarry [0:2];
    
    RippleAdder8 add0(a[7:0], b[7:0], 1'b0, sum[7:0], tmpCarry[0]);
    RippleAdder8 add1(a[15:8], b[15:8], tmpCarry[0], sum[15:8], tmpCarry[1]);
    RippleAdder8 add2(a[23:16], b[23:16], tmpCarry[1], sum[23:16], tmpCarry[2]);
    RippleAdder8 add3(a[31:24], b[31:24], tmpCarry[2], sum[31:24], carryOut);
endmodule
