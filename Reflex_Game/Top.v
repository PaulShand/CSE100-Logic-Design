`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 02:13:40 PM
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
    input clkin, //check
    input btnR, //check
    input btnU, //check
    input btnC, //check
    output [15:0] led, //check
    output [3:0] an, //check
    output dp, //check
    output [6:0] seg //check
    );
    wire clk, digsel, qsec;
    wire sGo;
    wire sstop;
    wire [7:0]rnd;
    wire score;
    wire [3:0]sel;
    wire [3:0]num;
    wire ResetTimer;
    wire [15:0]N;
    wire Run;
    wire show;
    wire match;
    wire two,four;
    wire miss;
    wire hit;

    assign dp = 1'b1;
    assign match = ~(N[15] ^ N[7]) & ~(N[14] ^ N[6]) & ~(N[13] ^ N[5]) & ~(N[12] ^ N[4]) & ~(N[11] ^ N[3]) & ~(N[10] ^ N[2]) & ~(N[9] ^ N[1]) & ~(N[8] ^ N[0]);
    FDRE #(.INIT(1'b0)) synGo (.C(clk), .CE(1'b1), .D(btnC), .Q(sGo));
    FDRE #(.INIT(1'b0)) synstop (.C(clk), .CE(1'b1), .D(btnU), .Q(sstop));
    
    CountSec secc (.qsec(qsec), .got(ResetTimer), .gof(hit | miss), .clk(clk),.two(two),.four(four));
    
    StateMachine state (.Go(sGo),.stop(sstop),.Foursecs(four),.TwoSecs(two),.Match(match),.clk(clk),.ShowNum(show),.ResetTimer(ResetTimer),.RunGame(Run),.Scored(score),.FlashBoth(hit),.FlashAlt(miss));
    lab5_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec)); //done
    LFSR random (.clk(clk), .rnd(rnd)); //done
    LED_Shifter shift (.In(score), .clk(clk), .led(led)); //done
    RingCount ring (.clk(clk), .Advance(digsel), .ring(sel)); //done
    Selector select (.sel(sel),.N(N),.H(num)); //done
    hex7seg segment(.n(num),.seg(seg)); //done
    
    fatbitcount Game(.clk(clk),.Up(0),.LD(ResetTimer),.Din(rnd),.Q(N[15:8])); //done
    fatbitcount Time(.clk(clk),.Up((qsec&Run)),.LD(ResetTimer),.Din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),.Q(N[7:0])); //done
    
    
    wire flash;
    FDRE #(.INIT(1'b0)) flash1 (.C(clk), .CE((hit | miss) & qsec), .D(~flash), .Q(flash));
    
    
    assign an[0] = ~sel[0] | (miss & flash) | (hit & flash);
    assign an[1] = ~sel[1] | (miss & flash) | (hit & flash);
    assign an[2] = ~sel[2] | show | (miss & ~flash) | (hit & flash);
    assign an[3] = ~sel[3] | show | (miss & ~flash) | (hit & flash);
    
endmodule