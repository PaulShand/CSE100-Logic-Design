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
    input Dw,
    input LD,
    input [3:0] Din,
    output [3:0] Q,
    output UTC,
    output DTC
    );
    wire [3:0] D;
    
    
    assign D[0] = ((Q[0]^(Up^Dw))&~LD)+(LD&Din[0]);
    assign D[1] = (((~Q[1]&~Q[0]&~Up&Dw)+(~Q[1]&Q[0]&Up&~Dw)+(Q[1]&~Q[0]&((Up&~Dw)+~(Up^Dw)))+(Q[1]&Q[0]&((~Up&Dw)+~(Up^Dw))))&~LD)+(LD&Din[1]);
    assign D[2] = (((~Q[2]&~Q[1]&~Q[0]&~Up&Dw)+(~Q[2]&Q[1]&Q[0]&Up&~Dw)+(Q[2]&~Q[1]&~Q[0]&((Up&~Dw)+~(Up^Dw)))+(Q[2]&~Q[1]&Q[0])+(Q[2]&Q[1]&~Q[0])+(Q[2]&Q[1]&Q[0]&((~Up&Dw)+~(Up^Dw))))&~LD)+(LD&Din[2]);
    assign D[3] = (((~Q[3]&~Q[2]&~Q[1]&~Q[0]&~Up&Dw)+(~Q[3]&Q[2]&Q[1]&Q[0]&Up&~Dw)+(Q[3]&~Q[2]&~Q[1]&~Q[0]&((Up&~Dw)+~(Up^Dw)))+(Q[3]&~Q[2]&~Q[1]&Q[0])+(Q[3]&~Q[2]&Q[1]&~Q[0])+(Q[3]&~Q[2]&Q[1]&Q[0])+ (Q[3]&Q[2]&~Q[1]&~Q[0])+(Q[3]&Q[2]&~Q[1]&Q[0])+(Q[3]&Q[2]&Q[1]&~Q[0])+(Q[3]&Q[2]&Q[1]&Q[0]&((~Up&Dw)+~(Up^Dw))))&~LD)+(LD&Din[3]);
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3];
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3];
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE((Up^Dw)|LD), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE((Up^Dw)|LD), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE((Up^Dw)|LD), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE((Up^Dw)|LD), .D(D[3]), .Q(Q[3]));
    
endmodule

module fatbitcount(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [15:0] Din,
    output [15:0] Q,
    output UTC,
    output DTC
    );
    wire [3:0]oUTC;
    wire [3:0]iUTC;
    wire [3:0]oDTC;
    wire [3:0]iDTC;
    
    
    
    
    countUD4L count1 (.clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .Din({Din[3],Din[2],Din[1],Din[0]}), .Q({Q[3], Q[2], Q[1], Q[0]}), .UTC(oUTC[0]), .DTC(oDTC[0]));
    assign iUTC[0] = oUTC[0] & Up;
    assign iDTC[0] = oDTC[0] & Dw;
    countUD4L count2 (.clk(clk), .Up(iUTC[0]), .Dw(iDTC[0]), .LD(LD), .Din({Din[7],Din[6],Din[5],Din[4]}), .Q({Q[7], Q[6], Q[5], Q[4]}), .UTC(oUTC[1]), .DTC(oDTC[1]));
    assign iUTC[1] = oUTC[0] & oUTC[1] & Up;
    assign iDTC[1] = oDTC[0] & oDTC[1] & Dw;
    countUD4L count3 (.clk(clk), .Up(iUTC[1]), .Dw(iDTC[1]), .LD(LD), .Din({Din[11],Din[10],Din[9],Din[8]}), .Q({Q[11], Q[10], Q[9], Q[8]}), .UTC(oUTC[2]), .DTC(oDTC[2]));
    assign iUTC[2] = oUTC[0] & oUTC[1] & oUTC[2] & Up;
    assign iDTC[2] = oDTC[0] & oDTC[1] & oDTC[2] & Dw;
    countUD4L count4 (.clk(clk), .Up(iUTC[2]), .Dw(iDTC[2]), .LD(LD), .Din({Din[15],Din[14],Din[13],Din[12]}), .Q({Q[15], Q[14], Q[13], Q[12]}), .UTC(oUTC[3]), .DTC(oDTC[3]));
    assign UTC = oUTC[0] & oUTC[1] & oUTC[2] & oUTC[3];
    assign DTC = oDTC[0] & oDTC[1] & oDTC[2] & oDTC[3];
endmodule
    