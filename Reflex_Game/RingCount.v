`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 01:25:50 PM
// Design Name: 
// Module Name: RingCount
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


module RingCount(
    input clk,
    input Advance,
    output [3:0] ring
    );
    
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(Advance), .D(ring[1]), .Q(ring[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(Advance), .D(ring[2]), .Q(ring[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(Advance), .D(ring[3]), .Q(ring[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(Advance), .D(ring[0]), .Q(ring[3]));
endmodule
