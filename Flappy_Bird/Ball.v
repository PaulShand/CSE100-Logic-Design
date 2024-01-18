`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 10:57:10 PM
// Design Name: 
// Module Name: Ball
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


module Ball(
    input [15:0]xpos,
    input [15:0]ypos,
    input [15:0]x,
    input [15:0]y,
    input ready,
    input col,
    input blink,
    output red,
    output green,
    output blue
    );
    
    
    wire [15:0]w, h;
    assign w = xpos + 16'd15;
    assign h = ypos + 16'd15;
    
    assign red = ((x >= xpos) & (x <= w)) & ((y >= ypos) & (y <= h)) & ((~ready & ~col) | (ready & blink) | (col & blink));

    assign green = ((x >= xpos) & (x <= w)) & ((y >= ypos) & (y <= h)) & ((~ready & ~col) | (ready & blink) | (col & blink));

    assign blue = ((x >= xpos) & (x <= w)) & ((y >= ypos) & (y <= h)) & ((~ready & ~col) | (ready & blink) | (col & blink));

    
endmodule
