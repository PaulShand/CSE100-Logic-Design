`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 03:41:17 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
    input clk,
    input Up,
    input LD,
    input [2:0] Din,
    output [2:0] Q,
    output UTC
    );
    wire [2:0] D;
    wire Dw;
    
    
    assign D[0] = ((Q[0]^Up)&~LD)|(LD&Din[0]);
    assign D[1] = (((~Q[1]&Q[0]&Up)|(Q[1]&~Q[0])|(Q[1]&Q[0]&~Up))&~LD)|(LD&Din[1]);
    assign D[2] = (((Q[2]&~Q[1])|(Q[2]&Q[1]&~Q[0])|(Q[2]&Q[1]&Q[0]&~Up)|(~Q[2]&Q[1]&Q[0]&Up))&~LD)|(LD&Din[2]);
    assign UTC = Q[0] & Q[1] & Q[2];
        
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(Up|LD), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(Up|LD), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(Up|LD), .D(D[2]), .Q(Q[2]));
    
endmodule

module fatbitcount(
    input clk,
    input Up,
    input LD,
    input [5:0] Din,
    output [7:0] Q
    );
    wire oUTC;
    wire iUTC;
    wire [1:0]check;
    wire in;
    
    FDRE #(.INIT(1'b0)) check1 (.C(clk), .CE(1'b1), .D(LD), .Q(check[0]));
    FDRE #(.INIT(1'b0)) check2 (.C(clk), .CE(1'b1), .D(check[0]), .Q(check[1]));
    
    assign in = ~check[1] & check[0];
    
    
    countUD4L count1 (.clk(clk), .Up(Up), .LD(in), .Din({Din[2],Din[1],Din[0]}), .Q({Q[2], Q[1], Q[0]}), .UTC(oUTC));
    assign iUTC = oUTC & Up;
    countUD4L count2 (.clk(clk), .Up(iUTC), .LD(in), .Din({Din[5],Din[4],Din[3]}), .Q({Q[5], Q[4], Q[3]}), .UTC());
    
    assign Q[7] = 1'b0;
    assign Q[6] = 1'b0;
    //assign Din[7] = 1'b0;
    //assign Din[6] = 1'b0;
endmodule
    