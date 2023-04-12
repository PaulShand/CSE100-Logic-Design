`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 03:12:14 AM
// Design Name: 
// Module Name: Top_Level
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


module Top_Level(
    input [7:0] sw,
    input btnL,
    input btnC,
    input btnR,
    input clkin,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire [7:0]i;
    wire [6:0]u;
    wire [6:0]l;
    wire dig_sel;
    
    lab3_digsel dig (.clkin(clkin), .greset(btnR), .digsel(dig_sel));
    Incrementer increment (.a(sw), .b({btnL, btnC}), .s(i));
    hex7seg lower (.n(i[3:0]), .seg(l));
    hex7seg upper (.n(i[7:4]), .seg(u));
    m2_1x8 combine (.in0({1'b0,l}),.in1({1'b0,u}),.sel(dig_sel),.o(seg));
    //m2_1x8 combine (.in0(l),.in1(u),.sel(0),.o(seg));
    assign an[0] = dig_sel;
    assign an[1] = ~dig_sel;
    assign an[2] = 1'b1;
    assign an[3] = 1'b1;
    assign dp = 1'b1;
    
    
endmodule
