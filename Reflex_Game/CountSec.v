`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 04:25:52 PM
// Design Name: 
// Module Name: CountSec
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


module CountSec(
    input qsec,
    input got,
    input gof,
    input clk,
    output two,
    output four
    );
    wire [16:0]sec;
    wire send;
    wire [1:0]check;
    
    FDRE #(.INIT(1'b0)) check1 (.C(clk), .CE(qsec), .D(gof), .Q(check[0]));
    FDRE #(.INIT(1'b0)) check2 (.C(clk), .CE(qsec), .D(check[0]), .Q(check[1]));
    
    assign send = ~check[1] & check[0];
    
    FDRE #(.INIT(1'b0)) sec1 (.C(clk), .CE(qsec), .D(send), .Q(sec[0]));
    FDRE #(.INIT(1'b0)) sec2 (.C(clk), .CE(qsec), .D(sec[0]), .Q(sec[1]));
    FDRE #(.INIT(1'b0)) sec3 (.C(clk), .CE(qsec), .D(sec[1]), .Q(sec[2]));
    FDRE #(.INIT(1'b0)) sec4 (.C(clk), .CE(qsec), .D(sec[2]), .Q(sec[3]));
    FDRE #(.INIT(1'b0)) sec5 (.C(clk), .CE(qsec), .D(sec[3]), .Q(sec[4]));
    FDRE #(.INIT(1'b0)) sec6 (.C(clk), .CE(qsec), .D(sec[4]), .Q(sec[5]));
    FDRE #(.INIT(1'b0)) sec7 (.C(clk), .CE(qsec), .D(sec[5]), .Q(sec[6]));
    FDRE #(.INIT(1'b0)) sec8 (.C(clk), .CE(qsec), .D(sec[6]), .Q(sec[7]));
    FDRE #(.INIT(1'b0)) sec9 (.C(clk), .CE(qsec), .D(sec[7]), .Q(sec[8]));
    FDRE #(.INIT(1'b0)) sec10 (.C(clk), .CE(qsec), .D(sec[8]), .Q(sec[9]));
    FDRE #(.INIT(1'b0)) sec11 (.C(clk), .CE(qsec), .D(sec[9]), .Q(sec[10]));
    FDRE #(.INIT(1'b0)) sec12 (.C(clk), .CE(qsec), .D(sec[10]), .Q(sec[11]));
    FDRE #(.INIT(1'b0)) sec13 (.C(clk), .CE(qsec), .D(sec[11]), .Q(sec[12]));
    FDRE #(.INIT(1'b0)) sec14 (.C(clk), .CE(qsec), .D(sec[12]), .Q(sec[13]));
    FDRE #(.INIT(1'b0)) sec15 (.C(clk), .CE(qsec), .D(sec[13]), .Q(sec[14]));
    FDRE #(.INIT(1'b0)) sec16 (.C(clk), .CE(qsec), .D(sec[14]), .Q(sec[15]));
    FDRE #(.INIT(1'b0)) sec17 (.C(clk), .CE(qsec), .D(sec[15]), .Q(sec[16]));
    
    
    assign four = ~sec[16] & sec[15];

    wire [16:0]sect;
    wire sendt;
    wire [1:0]checkt;
    
    FDRE #(.INIT(1'b0)) checkt1 (.C(clk), .CE(qsec), .D(got), .Q(checkt[0]));
    FDRE #(.INIT(1'b0)) checkt2 (.C(clk), .CE(qsec), .D(checkt[0]), .Q(checkt[1]));
    
    assign sendt = ~checkt[1] & checkt[0];
    
    FDRE #(.INIT(1'b0)) sect1 (.C(clk), .CE(qsec), .D(sendt), .Q(sect[0]));
    FDRE #(.INIT(1'b0)) sect2 (.C(clk), .CE(qsec), .D(sect[0]), .Q(sect[1]));
    FDRE #(.INIT(1'b0)) sect3 (.C(clk), .CE(qsec), .D(sect[1]), .Q(sect[2]));
    FDRE #(.INIT(1'b0)) sect4 (.C(clk), .CE(qsec), .D(sect[2]), .Q(sect[3]));
    FDRE #(.INIT(1'b0)) sect5 (.C(clk), .CE(qsec), .D(sect[3]), .Q(sect[4]));
    FDRE #(.INIT(1'b0)) sect6 (.C(clk), .CE(qsec), .D(sect[4]), .Q(sect[5]));
    FDRE #(.INIT(1'b0)) sect7 (.C(clk), .CE(qsec), .D(sect[5]), .Q(sect[6]));
    FDRE #(.INIT(1'b0)) sect8 (.C(clk), .CE(qsec), .D(sect[6]), .Q(sect[7]));
    FDRE #(.INIT(1'b0)) sect9 (.C(clk), .CE(qsec), .D(sect[7]), .Q(sect[8]));
    
    assign two = ~sect[8] & sect[7];
endmodule
