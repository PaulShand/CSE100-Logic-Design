`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 02:01:59 AM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    input sheesh,
    output [6:0] seg
    );
    
    //m8_1 A (.in({1'b0, n[0], n[0], 1'b0, 1'b0 ,~n[0], 1'b0, n[0]}), .sel(n[3:1]), .o(seg[0]));
    //m8_1 B (.in({1'b1, ~n[0], n[0], 1'b0, ~n[0], n[0], 1'b0, 1'b0}), .sel(n[3:1]), .o(seg[1]));
    //m8_1 C (.in({1'b1, ~n[0], 1'b0, 1'b0 ,1'b0, 1'b0, ~n[0], 1'b0}), .sel(n[3:1]), .o(seg[2]));
    //m8_1 D (.in({n[0],1'b0,~n[0],n[0],n[0],~n[0],1'b0, n[0]}), .sel(n[3:1]), .o(seg[3]));
    //m8_1 E (.in({1'b0,1'b0,1'b0,n[0],n[0],1'b1,n[0] ,n[0]}), .sel(n[3:1]), .o(seg[4]));
    //m8_1 F (.in({1'b0,n[0],1'b0,1'b0,n[0],1'b0, 1'b1, n[0]}), .sel(n[3:1]), .o(seg[5]));
    //m8_1 G (.in({1'b0,~n[0],1'b0,1'b0,n[0],1'b0, 1'b0,1'b1}), .sel(n[3:1]), .o(seg[6]));
    
    
    
    
    assign seg[0] = (~((n[3]|n[2]|n[1]|~n[0])&(n[3]|~n[2]|n[1]|n[0])&(~n[3]|n[2]|~n[1]|~n[0])&(~n[3]|~n[2]|n[1]|~n[0])) & ~sheesh) | (sheesh);
    assign seg[1] = (~((n[3]|~n[2]|n[1]|~n[0])&(n[3]|~n[2]|~n[1]|n[0])&(~n[3]|n[2]|~n[1]|~n[0])&(~n[3]|~n[2]|n[1]|n[0])&(~n[3]|~n[2]|~n[1]|n[0])&(~n[3]|~n[2]|~n[1]|~n[0]))& ~sheesh) | (sheesh);
    assign seg[2] = (~((n[3]|n[2]|~n[1]|n[0])&(~n[3]|~n[2]|n[1]|n[0])&(~n[3]|~n[2]|~n[1]|n[0])&(~n[3]|~n[2]|~n[1]|~n[0]))& ~sheesh) | (sheesh);
    assign seg[3] = (~((n[3]|n[2]|n[1]|~n[0])&(n[3]|~n[2]|n[1]|n[0])&(n[3]|~n[2]|~n[1]|~n[0])&(~n[3]|n[2]|n[1]|~n[0])&(~n[3]|n[2]|~n[1]|n[0])&(~n[3]|~n[2]|~n[1]|~n[0]))& ~sheesh) | (sheesh);
    assign seg[4] = (~((n[3]|n[2]|n[1]|~n[0])&(n[3]|n[2]|~n[1]|~n[0])&(n[3]|~n[2]|n[1]|n[0])&(n[3]|~n[2]|n[1]|~n[0])&(n[3]|~n[2]|~n[1]|~n[0])&(~n[3]|n[2]|n[1]|~n[0]))& ~sheesh) | (sheesh);
    assign seg[5] = (~((n[3]|n[2]|n[1]|~n[0])&(n[3]|n[2]|~n[1]|n[0])&(n[3]|n[2]|~n[1]|~n[0])&(n[3]|~n[2]|~n[1]|~n[0])&(~n[3]|~n[2]|n[1]|~n[0]))& ~sheesh) | (sheesh);
    assign seg[6] = (~((n[3]|n[2]|n[1]|n[0])&(n[3]|n[2]|n[1]|~n[0])&(n[3]|~n[2]|~n[1]|~n[0])&(~n[3]|~n[2]|n[1]|n[0]))& ~sheesh);
endmodule
