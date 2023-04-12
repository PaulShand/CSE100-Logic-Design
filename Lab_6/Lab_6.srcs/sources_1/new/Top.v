`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 03:58:36 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clkin,
    input btnU, //check
    input btnR, //check
    input btnL, //check
    output [6:0] seg,
    output dp, //check
    output [3:0] an, //check
    output [15:0] led //check
    );
    wire goneL, goneR;
    wire clk, digsel, qsec;
    wire [3:0]sel;
    wire [3:0]num;
    wire [15:0]N;
    wire count;
    wire neg;
    wire [15:0]timer;
    wire [3:0]times;
    wire Up,Dw,max,neu;

StateM sta (.clk(clk),.BtnR(btnR),.BtnL(btnL),.CL(goneL),.CR(goneR));
lab6_clks slowit (.clkin(clkin), .greset(btnU), .clk(clk), .digsel(digsel), .qsec(qsec));

RingCount ring (.clk(clk), .Advance(digsel), .ring(sel)); //done
Selector select (.sel(sel),.N(N),.H(num)); //done
hex7seg segment(.n(num),.sheesh(sel[2]),.seg(seg)); //done



CountSec counttimer (.qsec(qsec),.go(count),.clk(clk),.n(times));
assign N[15:12] = times;
assign N[11:8] = 1'b0;


 FDRE #(.INIT(1'b0)) negative (.C(clk), .CE(neu), .D(goneR), .Q(neg));
 
assign Up = ((neu & goneR) | (neu & goneL) | (~neu & ~neg & goneL) | (~neu & neg & goneR)) & ~(N[6] & N[5] & N[4] & N[3] & N[2] & N[1] & N[0]);
assign Dw = (~neu & ~neg & goneR) | (~neu & neg & goneL);

fatbitcount turkeyc (.clk(clk),.Up(Up),.Dw(Dw),.Q(N[6:0]),.UTC(max),.DTC(neu));
assign N[7] = 1'b0;


//deal with neg segment


assign count = btnR | btnL;

assign an[0] = ~sel[0];
assign an[1] = ~sel[1];
assign an[2] = ~sel[2] | ~neg;
assign an[3] = ~sel[3] | ~count;


assign dp = 1'b1;

assign led[0] = 1'b0;
assign led[1] = 1'b0;
assign led[2] = 1'b0;
assign led[3] = 1'b0;
assign led[4] = 1'b0;
assign led[5] = 1'b0;
assign led[6] = 1'b0;
assign led[7] = 1'b0;
assign led[8] = 1'b0;
assign led[9] = ~btnR;
assign led[10] = 1'b0;
assign led[11] = 1'b0;
assign led[12] = 1'b0;
assign led[13] = 1'b0;
assign led[14] = 1'b0;
assign led[15] = ~btnL;
endmodule