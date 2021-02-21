`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2021 01:45:28 AM
// Design Name: 
// Module Name: simple_calc_tb2
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


module simple_calc_tb2(

    );
    
    reg [3:0] SW_X, SW_Y;
    reg [1:0] SW_op_sel;
    wire [7:0] LED_output_result;
    wire LED_carry_out, LED_overflow;
    
    simple_calc uut (
            .SW_X(SW_X),
            .SW_Y(SW_Y),
            .SW_op_sel(SW_op_sel),
            .LED_output_result(LED_output_result),
            .LED_carry_out(LED_carry_out),
            .LED_overflow(LED_overflow)
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial
    begin
        SW_X = 4'b0101;
        SW_Y = 4'b0101;
        SW_op_sel = 2'b10;
    end
endmodule
