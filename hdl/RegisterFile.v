// Author: Grayson Kippes
// Date: 10/31/2024

`timescale 1ns / 1ps

module RegisterFile(
    input clk,
    input opcode, // 0 if reading, 1 if writing
    input [3:0] select, // Selects one out of 16 registers
    input [15:0] dataIn,
    output [15:0] dataOut
    );
    
    reg [15:0] registers [0:15];
    
    always @ (posedge clk) begin
        if (opcode == 1'b0) begin // Read
            dataOut = registers[select];
        end else begin // Write
            registers[select] = dataIn;
        end
    end
endmodule
