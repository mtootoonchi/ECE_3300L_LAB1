`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2021 07:11:13 PM
// Design Name: 
// Module Name: mux_2x1_8bit
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


module mux_2x1_8bit
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
    /*
    mux_2x1_simple MUX_simple_0 (
    .x(x[0]),
    .y(y[0]),
    .s(s),
    .m(m[0])
    );
    
    mux_2x1_simple MUX_simple_1 (
    .x(x[1]),
    .y(y[1]),
    .s(s),
    .m(m[1])
    );
    
    mux_2x1_simple MUX_simple_2 (
    .x(x[2]),
    .y(y[2]),
    .s(s),
    .m(m[2])
    );
    
    mux_2x1_simple MUX_simple_3 (
    .x(x[3]),
    .y(y[3]),
    .s(s),
    .m(m[3])
    );
    mux_2x1_simple MUX_simple_4 (
    .x(x[4]),
    .y(y[4]),
    .s(s),
    .m(m[4])
    );
    mux_2x1_simple MUX_simple_5 (
    .x(x[5]),
    .y(y[5]),
    .s(s),
    .m(m[5])
    );
    mux_2x1_simple MUX_simple_6 (
    .x(x[6]),
    .y(y[6]),
    .s(s),
    .m(m[6])
    );
    mux_2x1_simple MUX_simple_7 (
    .x(x[7]),
    .y(y[7]),
    .s(s),
    .m(m[7])
    );
   */
endmodule
