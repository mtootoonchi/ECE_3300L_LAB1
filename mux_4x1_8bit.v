`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2021 07:09:31 PM
// Design Name: 
// Module Name: mux_4x1_8bit
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


module mux_4x1_8bit(
    input [7:0] x, y, z, w,
    input [1:0] input_selector,
    output [1:0] output_selector,
    output [7:0] m
    );
    
    wire [7:0] g0;
    wire [7:0] g1;
    
    mux_2x1_8bit MUX_8bit_0(.x(x), .y(y), .s(input_selector[0]), .m(g0));
    mux_2x1_8bit MUX_8bit_1(.x(z), .y(w), .s(input_selector[0]), .m(g1));
    mux_2x1_8bit MUX_8bit_2(.x(g0), .y(g1), .s(input_selector[1]), .m(m));
    
    assign output_selector = input_selector;
endmodule
