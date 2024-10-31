// Author: Grayson Kippes
// Date: 10/30/2024

`timescale 1ns / 1ps

// Array of full adders for the array multiplier.
// This functionality is done with structural modeling
//  to show the gate-level model of an array multiplier.
module MultiAdd15(
    input [14:0] a,
    input [14:0] b,
    input [14:0] carryIn,
    output [14:0] sum,
    output [14:0] carryOut
    );
    
    FullAdder fa0(a[0], b[0], carryIn[0], sum[0], carryOut[0]); // Entry-point
    FullAdder fa1(a[1], b[1], carryIn[1], sum[1], carryOut[1]);
    FullAdder fa2(a[2], b[2], carryIn[2], sum[2], carryOut[2]);
    FullAdder fa3(a[3], b[3], carryIn[3], sum[3], carryOut[3]);
    FullAdder fa4(a[4], b[4], carryIn[4], sum[4], carryOut[4]);
    FullAdder fa5(a[5], b[5], carryIn[5], sum[5], carryOut[5]);
    FullAdder fa6(a[6], b[6], carryIn[6], sum[6], carryOut[6]);
    FullAdder fa7(a[7], b[7], carryIn[7], sum[7], carryOut[7]);
    FullAdder fa8(a[8], b[8], carryIn[8], sum[8], carryOut[8]);
    FullAdder fa9(a[9], b[9], carryIn[9], sum[9], carryOut[9]);
    FullAdder fa10(a[10], b[10], carryIn[10], sum[10], carryOut[10]);
    FullAdder fa11(a[11], b[11], carryIn[11], sum[11], carryOut[11]);
    FullAdder fa12(a[12], b[12], carryIn[12], sum[12], carryOut[12]);
    FullAdder fa13(a[13], b[13], carryIn[13], sum[13], carryOut[13]);
    FullAdder fa14(a[14], b[14], carryIn[14], sum[14], carryOut[14]);
endmodule
