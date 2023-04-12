`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 03:03:47 PM
// Design Name: 
// Module Name: StateM
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


module StateM(
    input BtnL,
    input BtnR,
    input clk,
    output CR,
    output CL
    );
    wire [2:0]D;
    wire [2:0]Q;
    wire L, R;
    
    assign L = ~BtnL;
    assign R = ~BtnR;
    
    assign D[0] = (~Q[2]&~Q[1]&~Q[0]&~L&R) | (~Q[2]&~Q[1]&Q[0]&~L&R) | (~Q[2]&Q[1]&~Q[0]&~L&R) | (~Q[2]&~Q[1]&~Q[0]&L&~R) | (~Q[2]&Q[1]&Q[0]&L&~R) | (Q[2]&~Q[1]&~Q[0]&L&~R)    | (~Q[2]&~Q[1]&Q[0]&~L&~R) | (~Q[2]&Q[1]&~Q[0]&~L&~R) | (~Q[2]&Q[1]&Q[0]&~L&~R) | (Q[2]&~Q[1]&~Q[0]&~L&~R);
    assign D[1] = (L&~R) | (~Q[2]&Q[1]&Q[0]&~L&~R) | (Q[2]&~Q[1]&~Q[0]&~L&~R);
    assign D[2] = (~Q[2]&Q[1]&Q[0]&~L&R) | (Q[2]&~Q[1]&~Q[0]&~L&R);
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    
    FDRE #(.INIT(1'b0)) CRs (.C(clk), .CE(1'b1), .D(~Q[2]&Q[1]&~Q[0]& L & R), .Q(CR));
    FDRE #(.INIT(1'b0)) CLs (.C(clk), .CE(1'b1), .D(Q[2]&~Q[1]&~Q[0]& L & R), .Q(CL));
    
    
endmodule
