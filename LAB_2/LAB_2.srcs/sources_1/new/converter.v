`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2021 01:21:07 AM
// Design Name: 
// Module Name: converter
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


module converter(
    input a,
	input b,
    input c,
    input d,
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,
    output DP,
    output  ANz,
    output  ANo,
    output  ANtw,
    output  ANth
    );

    assign A = ~((a|b|c|~d)&(a|~b|c|d)&(~a|b|~c|~d)&(~a|~b|c|~d));
    assign B = ~((a|~b|c|~d)&(a|~b|~c|d)&(~a|b|~c|~d)&(~a|~b|c|d)&(~a|~b|~c|d)&(~a|~b|~c|~d));
    assign C = ~((a|b|~c|d)&(~a|~b|c|d)&(~a|~b|~c|d)&(~a|~b|~c|~d));
    assign D = ~((a|b|c|~d)&(a|~b|c|d)&(a|~b|~c|~d)&(~a|b|c|~d)&(~a|b|~c|d)&(~a|~b|~c|~d));
    assign E = ~((a|b|c|~d)&(a|b|~c|~d)&(a|~b|c|d)&(a|~b|c|~d)&(a|~b|~c|~d)&(~a|b|c|~d));
    assign F = ~((a|b|c|~d)&(a|b|~c|d)&(a|b|~c|~d)&(a|~b|~c|~d)&(~a|~b|c|~d));
    assign G = ~((a|b|c|d)&(a|b|c|~d)&(a|~b|~c|~d)&(~a|~b|c|d));
    assign DP = 1;
    assign ANz = 0;
    assign ANo = 1;
    assign ANtw = 1;
    assign ANth = 1;

endmodule
