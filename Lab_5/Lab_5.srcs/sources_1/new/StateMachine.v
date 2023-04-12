`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 05:33:31 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
    input Go,
    input stop,
    input Foursecs,
    input TwoSecs,
    input Match,
    input clk,
    output ShowNum,
    output ResetTimer,
    output RunGame,
    output Scored,
    output FlashBoth,
    output FlashAlt
    );
    //0001 = start
    //0010 = rand num gen
    //0100 = score
    //1000 = miss
    wire [4:0]state;
    wire [4:0]D;
    
    assign D[0] = (state[0] & ~state[1] & ~state[2] & ~state[3] & ~state[4] & Go) | (state[1] & ~state[2]);
    assign D[1] = (~state[0] & state[1] & ~state[2] & ~state[3] & ~state[4] & TwoSecs) | (state[2] & (~state[3] & ~state[4]));
    assign D[2] = (~state[0] & ~state[1] & state[2] & ~state[3] & ~state[4] & stop & Match) | (state[3] & ~state[0]);
    assign D[3] = (~state[0] & ~state[1] & state[2] & ~state[3] & ~state[4] & stop & ~Match) | (state[4] & ~state[0]);
    assign D[4] = (~state[0] & ~state[1] & ~state[2] & ((~state[3] & state[4])|(state[3] & ~state[4])) & Foursecs) | (state[0] & ~state[1]);
    
    FDRE #(.INIT(1'b1) ) start (.C(clk), .CE(1'b1), .D(D[4]), .Q(state[0]));
    FDRE #(.INIT(1'b0) ) rand  (.C(clk), .CE(1'b1), .D(D[0]), .Q(state[1]));
    FDRE #(.INIT(1'b0) ) count (.C(clk), .CE(1'b1), .D(D[1]), .Q(state[2]));
    FDRE #(.INIT(1'b0) ) score (.C(clk), .CE(1'b1), .D(D[2]), .Q(state[3]));
    FDRE #(.INIT(1'b0) ) miss  (.C(clk), .CE(1'b1), .D(D[3]), .Q(state[4]));
    
    assign ShowNum = state[0];
    assign ResetTimer = state[1];
    assign RunGame = state[2];
    assign Scored = state[3];
    assign FlashBoth = state[3];
    assign FlashAlt = state[4];
    
    
endmodule
