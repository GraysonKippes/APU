// Author: Grayson Kippes
// Date: 10/30/2024

`timescale 1ns / 1ps

module RippleAdder8(
    input [7:0] a,
    input [7:0] b,
    input carryIn,
    output [7:0] sum,
    output carryOut
    );
    
    // Carry-wires in between adder blocks.
    // Only need N-1 intermediary wires, where N is the bitwidth of the adder.
    wire tmpCarry [0:6];
    
    FullAdder fa0(a[0], b[0], carryIn, sum[0], tmpCarry[0]); // Entry-point
    FullAdder fa1(a[1], b[1], tmpCarry[0], sum[1], tmpCarry[1]);
    FullAdder fa2(a[2], b[2], tmpCarry[1], sum[2], tmpCarry[2]);
    FullAdder fa3(a[3], b[3], tmpCarry[2], sum[3], tmpCarry[3]);
    FullAdder fa4(a[4], b[4], tmpCarry[3], sum[4], tmpCarry[4]);
    FullAdder fa5(a[5], b[5], tmpCarry[4], sum[5], tmpCarry[5]);
    FullAdder fa6(a[6], b[6], tmpCarry[5], sum[6], tmpCarry[6]);
    FullAdder fa7(a[7], b[7], tmpCarry[6], sum[7], carryOut); // Exit-point
endmodule
