`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2021 06:00:02 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0] X, Y,
    output [7:0] M
    );
    mq_4bit MQ0(
            .m(X),
            .q(Y[0]),
            .mq(mq0)
    );
    mq_4bit MQ1(
            .m(X),
            .q(Y[1]),
            .mq(mq1)
    );
    mq_4bit MQ2(
            .m(X),
            .q(Y[2]),
            .mq(mq2)
    );
    mq_4bit MQ3(
            .m(X),
            .q(Y[3]),
            .mq(mq3)
    );
    wire [4:0] mq0, mq1, mq2, mq3;
    wire [4:0] g0, g1, g2;
    wire [4:0] carry0, carry1, carry2;
    assign mq0[4] = 1'b0;
    assign mq1[4] = 1'b0;
    assign mq2[4] = 1'b0;
    assign mq3[4] = 1'b0;
    assign g0[4] = carry0[4];
    assign g1[4] = carry1[4];
    assign g2[4] = 0;
    assign carry0[0] = 0;
    assign carry1[0] = 0;
    assign carry2[0] = 0;
    assign M[0] = mq0[0];
    assign M[1] = g0[0];
    assign M[2] = g1[0];
    assign M[3] = g2[0];
    assign M[4] = g2[1];
    assign M[5] = g2[2];
    assign M[6] = g2[3];
    assign M[7] = carry2[4];
    generate
        genvar i;
        for(i = 0; i < 4; i = i + 1)
        begin
            full_adder FA0(
            .x(mq0[i + 1]),
            .y(mq1[i]),
            .c_in(carry0[i]),
            .s(g0[i]),
            .c_out(carry0[i + 1])
            );
        end
    endgenerate
    generate
        genvar j;
        for(j = 0; j < 4; j = j + 1)
        begin
            full_adder FA1(
            .x(g0[j + 1]),
            .y(mq2[j]),
            .c_in(carry1[j]),
            .s(g1[j]),
            .c_out(carry1[j + 1])
            );
        end
    endgenerate
    generate
        genvar k;
        for(k = 0; k < 4; k = k + 1)
        begin
            full_adder FA2(
            .x(g1[k + 1]),
            .y(mq3[k]),
            .c_in(carry2[k]),
            .s(g2[k]),
            .c_out(carry2[k + 1])
            );
        end
    endgenerate
    /*
    full_adder FA0(
            .x(mq0[1]),
            .y(mq1[0]),
            .c_in(1'b0),
            .s(g0[0]),
            .c_out(carry0[0])
    );
    full_adder FA1(
            .x(mq0[2]),
            .y(mq1[1]),
            .c_in(carry0[1]), //error
            .s(g0[1]),
            .c_out(carry0[2])
    );
    full_adder FA2(
            .x(mq0[3]),
            .y(mq1[2]),
            .c_in(carry0[1]),
            .s(g0[2]),
            .c_out(carry0[2])
    );
    full_adder FA3(
            .x(1'b0),
            .y(mq1[3]),
            .c_in(carry0[2]),
            .s(g0[3]),
            .c_out(carry0[3])
    );
    */
    
    /*
    full_adder FA4(
            .x(g0[1]),
            .y(mq2[0]),
            .c_in(1'b0),
            .s(g1[0]),
            .c_out(carry1[0])
    );
    
    full_adder FA5(
            .x(g0[2]),
            .y(mq2[1]),
            .c_in(carry1[0]),
            .s(g1[1]),
            .c_out(carry1[1])
    );
    full_adder FA6(
            .x(g0[3]),
            .y(mq2[2]),
            .c_in(carry1[1]),
            .s(g1[2]),
            .c_out(carry1[2])
    );
    full_adder FA7(
            .x(carry0[3]),
            .y(mq2[3]),
            .c_in(carry1[2]),
            .s(g1[3]),
            .c_out(carry1[3])
    );
    */
    
    /*
    full_adder FA8(
            .x(g1[1]),
            .y(mq3[0]),
            .c_in(1'b0),
            .s(M[3]),
            .c_out(carry2[0])
    );
    full_adder FA9(
            .x(g1[2]),
            .y(mq3[1]),
            .c_in(carry2[0]),
            .s(M[4]),
            .c_out(carry2[1])
    );
    full_adder FA10(
            .x(g1[3]),
            .y(mq3[2]),
            .c_in(carry2[1]),
            .s(M[5]),
            .c_out(carry2[2])
    );
    full_adder FA11(
            .x(carry1[3]),
            .y(mq3[3]),
            .c_in(carry2[2]),
            .s(M[6]),
            .c_out(M[7])
    );
    */
    
    /*
    assign g0[4] = 0;
    assign g1[4] = 0;
    assign g2[4] = 0;
    assign g3[4] = 0;
    assign M[0] = g0[0];
    generate
        wire [3:0] c;
        assign c[0] = 0;
        wire [3:0] s;
        wire carry_bit;
        assign carrr_bit = 0;
        genvar k;
        genvar j;
        for(k = 0; k < 4; j = j + 1)
        begin
            for(j = 0; k < 4; k = k + 1)
            begin
                full_adder FA (
                    .x(g0[j + 1]),
                    .y(g1[j]),
                    .c_in(c[j]),
                    .s(s[j]),
                    .c_out(c[j + 1])
                );
            end
        end
    endgenerate
    */
    
    
endmodule
