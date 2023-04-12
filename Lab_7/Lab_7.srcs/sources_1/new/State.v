`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 02:33:39 AM
// Design Name: 
// Module Name: State
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


module State(
    input btnL,
    input clk,
    input hit,
    input timer,
    output draw,
    output ready,
    output run,
    output colision
    );
    wire [3:0]D;
    assign D[1] = ((draw & btnL) | (colision & btnL) | (ready & ~timer));
    assign D[2] = (ready & timer) | (run&~hit);
    assign D[3] = (hit & run) | (colision & ~btnL);
    
    
    
    FDRE #(.INIT(1'b1)) drawS (.C(clk), .CE(btnL), .D(1'b0), .Q(draw));
    FDRE #(.INIT(1'b0)) readyS (.C(clk), .CE(1'b1), .D(D[1]), .Q(ready));
    FDRE #(.INIT(1'b0)) runS (.C(clk), .CE(1'b1), .D(D[2]), .Q(run));
    FDRE #(.INIT(1'b0)) colisionS (.C(clk), .CE(1'b1), .D(D[3]), .Q(colision));
    
endmodule
