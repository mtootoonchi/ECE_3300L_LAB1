`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2021 07:56:53 PM
// Design Name: 
// Module Name: mux_2x1_nbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_2x1_nbit
    #(parameter n = 8) (
    input [n - 1:0] x, y,
    input s,
    output [n - 1:0] m
    );
    
    // generates a mux_2x1 of nbits
    generate
        genvar k;
        for(k = 0; k < n; k = k + 1)
        begin: stage
            mux_2x1_simple MUX (
                    .x(x[k]),
                    .y(y[k]),
                    .s(s),
                    .m(m[k])
            );
        end
    endgenerate
endmodule
