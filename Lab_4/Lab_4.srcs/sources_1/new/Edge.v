`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 01:49:22 PM
// Design Name: 
// Module Name: Edge
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


module Edge(
    input B,
    input clk,
    output Edge
    );
    wire [1:0]out;
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(1'b1), .D(B), .Q(out[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(out[0]), .Q(out[1]));
    
    
    assign Edge = out[0] & ~out[1];
    
endmodule
