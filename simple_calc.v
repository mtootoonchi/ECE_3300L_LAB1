`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2021 05:03:09 PM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] SW_X, SW_Y,
    input [1:0] SW_op_sel,
    output [7:0] LED_output_result,
    output LED_carry_out, LED_overflow
    );
    
    wire [7:0] g0, g1; // Wires to connect to MUX from adder/subtractor and multplier 
    
    wire [3:0] g2;
    assign g0 = {4'b0, g2}; // Converts 4 bit adder/subtractor output to 8 bit with 4'b0 for MSB's
    
    adder_subtractor #(.n(4)) ADD_SUB(
            .x(SW_X),
            .y(SW_Y),
            .add_n(SW_op_sel[0]),
            .s(g2),
            .c_out(LED_carry_out),
            .overflow(LED_overflow)
    );
    
    mux_2x1_nbit #(.n(8)) MUX(
            .x(g0),
            //.y(g1),
            .y(8'b0),
            .s(SW_op_sel[1]),
            .m(LED_output_result)
    );
    
endmodule
