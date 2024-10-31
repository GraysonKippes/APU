// Author: Grayson Kippes
// Date: 10/30/2024

`timescale 1ns / 1ps

// Performs and operation with a bus and a single bit.
// If b is zero, then all zeros will be driven to c.
// If b is one, then a will be driven to c.
// This functionality is done with structural modeling
//  to show the gate-level model of an array multiplier.
module MultiAnd16(
    input [15:0] a,
    input b,
    output [15:0] c
    );
    
    and(c[0], a[0], b);
    and(c[1], a[1], b);
    and(c[2], a[2], b);
    and(c[3], a[3], b);
    and(c[4], a[4], b);
    and(c[5], a[5], b);
    and(c[6], a[6], b);
    and(c[7], a[7], b);
    and(c[8], a[8], b);
    and(c[9], a[9], b);
    and(c[10], a[10], b);
    and(c[11], a[11], b);
    and(c[12], a[12], b);
    and(c[13], a[13], b);
    and(c[14], a[14], b);
    and(c[15], a[15], b);
endmodule
