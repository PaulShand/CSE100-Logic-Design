`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2021 10:57:49 PM
// Design Name: 
// Module Name: Incrementer
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


module Incrementer(
    input [7:0] a,
    input [1:0] b,
    output [7:0] s
    );
    
    wire [7:0] t;
    
    Full_Adder FA0 (.a(a[0]), .b(b[0]), .cin(1'b0), .cout(t[0]), .s(s[0]));
    Full_Adder FA1 (.a(a[1]), .b(b[1]), .cin(t[0]), .cout(t[1]), .s(s[1]));
    Full_Adder FA2 (.a(a[2]), .b(1'b0), .cin(t[1]), .cout(t[2]), .s(s[2]));
    Full_Adder FA3 (.a(a[3]), .b(1'b0), .cin(t[2]), .cout(t[3]), .s(s[3]));
    Full_Adder FA4 (.a(a[4]), .b(1'b0), .cin(t[3]), .cout(t[4]), .s(s[4]));
    Full_Adder FA5 (.a(a[5]), .b(1'b0), .cin(t[4]), .cout(t[5]), .s(s[5]));
    Full_Adder FA6 (.a(a[6]), .b(1'b0), .cin(t[5]), .cout(t[6]), .s(s[6]));
    Full_Adder FA7 (.a(a[7]), .b(1'b0), .cin(t[6]), .cout(), .s(s[7]));
    
endmodule

module Full_Adder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    m4_1 sum (.in({cin,~cin,~cin,cin}), .sel({a,b}), .o(s));
    m4_1 carry (.in({1'b1,cin,cin,1'b0}), .sel({a,b}), .o(cout));
    
endmodule
