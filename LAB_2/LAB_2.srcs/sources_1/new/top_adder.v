`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 10:27:01 AM
// Design Name: 
// Module Name: top_adder
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


module top_adder(
    input b2,
    input b1,
    input b0,
    input a2,
    input a1,
    input a0,
    input cin,
    input cout,
    input s,
    
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,
    output DP,
    output  ANz,
    output  ANo,
    output  ANtw,
    output  ANth
    );
    
    wire t0, t1, t2, t3, c0, c1;
    
    Adders m1 (.b(b0), .a(a0), .cin(cin), .cout(c0), .s(t0));
    Adders m2 (.b(b1), .a(a1), .cin(c0), .cout(c1), .s(t1));
    Adders m3 (.b(b2), .a(a2), .cin(c1), .cout(t3), .s(t2));
    converter m4 (.a(t3), .b(t2), .c(t1), .d(t0), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .DP(DP), .ANz(ANz), .ANo(ANo), .ANtw(ANtw), .ANth(ANth));
    
endmodule
