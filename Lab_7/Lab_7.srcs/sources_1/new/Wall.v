`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 04:25:19 PM
// Design Name: 
// Module Name: Wall
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


module Wall(
    input [15:0] xpos,
    input [15:0] ypos,
    input [15:0] x,
    input [15:0] y,
    output red,
    output green,
    output blue
    );
    
    
    wire [15:0]w, h1, h2, h3;
    
    assign w = xpos + 16'd48;
    assign h1 = ypos +16'd48;
    assign h2 = ypos +16'd168;
    assign h3 = ypos +16'd216;
    
    
    
    
    assign red = ((x >= xpos) & (x <= w)) & (((y >= ypos) & (y <= h1)) | ((y >= h2) & (y<= h3)));
    
    assign green = ((x >= xpos) & (x <= w)) & ((y <= h1) | (y >= h2));
    
    assign blue = ((x >= xpos) & (x <= w)) & ((y <= ypos) | (y >= h3));
endmodule
