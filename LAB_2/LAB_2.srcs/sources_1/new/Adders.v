`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 10:17:04 AM
// Design Name: 
// Module Name: Adders
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


module Adders(
    input b,
    input a,
    input cin,
    output cout,
    output s
    );
    
    assign cout = (b & cin) | (a & cin) | (a & b);
    assign s = a ^ ( b ^ cin);
    
endmodule
