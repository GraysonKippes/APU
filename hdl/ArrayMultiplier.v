// Author: Grayson Kippes
// Date: 10/30/2024

`timescale 1ns / 1ps

// 16-bit combinational multiplier
// Implemented with structural modeling
module ArrayMultiplier(
    input [15:0] a,
    input [15:0] b,
    output [31:0] f
    );
    
    // Output of each multi-and step.
    wire [15:0] tmpAnd [0:15];
    
    // Output of each multi-add step.
    wire [14:0] tmpSum [0:14];
    wire [14:0] tmpCarry [0:15];
    
    // Multi-and steps
    MultiAnd16 and0(a, b[0], tmpAnd[0]);
    MultiAnd16 and1(a, b[1], tmpAnd[1]);
    MultiAnd16 and2(a, b[2], tmpAnd[2]);
    MultiAnd16 and3(a, b[3], tmpAnd[3]);
    MultiAnd16 and4(a, b[4], tmpAnd[4]);
    MultiAnd16 and5(a, b[5], tmpAnd[5]);
    MultiAnd16 and6(a, b[6], tmpAnd[6]);
    MultiAnd16 and7(a, b[7], tmpAnd[7]);
    MultiAnd16 and8(a, b[8], tmpAnd[8]);
    MultiAnd16 and9(a, b[9], tmpAnd[9]);
    MultiAnd16 and10(a, b[10], tmpAnd[10]);
    MultiAnd16 and11(a, b[11], tmpAnd[11]);
    MultiAnd16 and12(a, b[12], tmpAnd[12]);
    MultiAnd16 and13(a, b[13], tmpAnd[13]);
    MultiAnd16 and14(a, b[14], tmpAnd[14]);
    MultiAnd16 and15(a, b[15], tmpAnd[15]);
    
    // Multi-add steps
    MultiAdd15 add0(tmpAnd[0][15:1], tmpAnd[1][14:0], 15'd0, tmpSum[0], tmpCarry[0]);
    MultiAdd15 add1({tmpAnd[1][15], tmpSum[0][14:1]}, tmpAnd[2][14:0], tmpCarry[0], tmpSum[1], tmpCarry[1]);
    MultiAdd15 add2({tmpAnd[2][15], tmpSum[1][14:1]}, tmpAnd[3][14:0], tmpCarry[1], tmpSum[2], tmpCarry[2]);
    MultiAdd15 add3({tmpAnd[3][15], tmpSum[2][14:1]}, tmpAnd[4][14:0], tmpCarry[2], tmpSum[3], tmpCarry[3]);
    MultiAdd15 add4({tmpAnd[4][15], tmpSum[3][14:1]}, tmpAnd[5][14:0], tmpCarry[3], tmpSum[4], tmpCarry[4]);
    MultiAdd15 add5({tmpAnd[5][15], tmpSum[4][14:1]}, tmpAnd[6][14:0], tmpCarry[4], tmpSum[5], tmpCarry[5]);
    MultiAdd15 add6({tmpAnd[6][15], tmpSum[5][14:1]}, tmpAnd[7][14:0], tmpCarry[5], tmpSum[6], tmpCarry[6]);
    MultiAdd15 add7({tmpAnd[7][15], tmpSum[6][14:1]}, tmpAnd[8][14:0], tmpCarry[6], tmpSum[7], tmpCarry[7]);
    MultiAdd15 add8({tmpAnd[8][15], tmpSum[7][14:1]}, tmpAnd[9][14:0], tmpCarry[7], tmpSum[8], tmpCarry[8]);
    MultiAdd15 add9({tmpAnd[9][15], tmpSum[8][14:1]}, tmpAnd[10][14:0], tmpCarry[8], tmpSum[9], tmpCarry[9]);
    MultiAdd15 add10({tmpAnd[10][15], tmpSum[9][14:1]}, tmpAnd[11][14:0], tmpCarry[9], tmpSum[10], tmpCarry[10]);
    MultiAdd15 add11({tmpAnd[11][15], tmpSum[10][14:1]}, tmpAnd[12][14:0], tmpCarry[10], tmpSum[11], tmpCarry[11]);
    MultiAdd15 add12({tmpAnd[12][15], tmpSum[11][14:1]}, tmpAnd[13][14:0], tmpCarry[11], tmpSum[12], tmpCarry[12]);
    MultiAdd15 add13({tmpAnd[13][15], tmpSum[12][14:1]}, tmpAnd[14][14:0], tmpCarry[12], tmpSum[13], tmpCarry[13]);
    MultiAdd15 add14({tmpAnd[14][15], tmpSum[13][14:1]}, tmpAnd[15][14:0], tmpCarry[13], tmpSum[14], tmpCarry[14]);
    
    // Last and-step
    FullAdder add15(tmpSum[14][1], tmpCarry[14][0], 1'b0, f[16], tmpCarry[15][0]);
    FullAdder add16(tmpSum[14][2], tmpCarry[14][1], tmpCarry[15][0], f[17], tmpCarry[15][1]);
    FullAdder add17(tmpSum[14][3], tmpCarry[14][2], tmpCarry[15][1], f[18], tmpCarry[15][2]);
    FullAdder add18(tmpSum[14][4], tmpCarry[14][3], tmpCarry[15][2], f[19], tmpCarry[15][3]);
    FullAdder add19(tmpSum[14][5], tmpCarry[14][4], tmpCarry[15][3], f[20], tmpCarry[15][4]);
    FullAdder add20(tmpSum[14][6], tmpCarry[14][5], tmpCarry[15][4], f[21], tmpCarry[15][5]);
    FullAdder add21(tmpSum[14][7], tmpCarry[14][6], tmpCarry[15][5], f[22], tmpCarry[15][6]);
    FullAdder add22(tmpSum[14][8], tmpCarry[14][7], tmpCarry[15][6], f[23], tmpCarry[15][7]);
    FullAdder add23(tmpSum[14][9], tmpCarry[14][8], tmpCarry[15][7], f[24], tmpCarry[15][8]);
    FullAdder add24(tmpSum[14][10], tmpCarry[14][9], tmpCarry[15][8], f[25], tmpCarry[15][9]);
    FullAdder add25(tmpSum[14][11], tmpCarry[14][10], tmpCarry[15][9], f[26], tmpCarry[15][10]);
    FullAdder add26(tmpSum[14][12], tmpCarry[14][11], tmpCarry[15][10], f[27], tmpCarry[15][11]);
    FullAdder add27(tmpSum[14][13], tmpCarry[14][12], tmpCarry[15][11], f[28], tmpCarry[15][12]);
    FullAdder add28(tmpSum[14][14], tmpCarry[14][13], tmpCarry[15][12], f[29], tmpCarry[15][13]);
    FullAdder add29(tmpAnd[15][15], tmpCarry[14][14], tmpCarry[15][13], f[30], f[31]);
    
    // Outputs
    assign f[0] = tmpAnd[0][0];
    assign f[1] = tmpSum[0][0];
    assign f[2] = tmpSum[1][0];
    assign f[3] = tmpSum[2][0];
    assign f[4] = tmpSum[3][0];
    assign f[5] = tmpSum[4][0];
    assign f[6] = tmpSum[5][0];
    assign f[7] = tmpSum[6][0];
    assign f[8] = tmpSum[7][0];
    assign f[9] = tmpSum[8][0];
    assign f[10] = tmpSum[9][0];
    assign f[11] = tmpSum[10][0];
    assign f[12] = tmpSum[11][0];
    assign f[13] = tmpSum[12][0];
    assign f[14] = tmpSum[13][0];
    assign f[15] = tmpCarry[14][14];
    
endmodule
