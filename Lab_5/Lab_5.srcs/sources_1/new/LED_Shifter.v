`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 03:00:46 PM
// Design Name: 
// Module Name: LED_Shifter
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


module LED_Shifter(
    input In,
    //input CE,
    //input R,
    input clk,
    output [15:0] led
    );
    wire [1:0]check;
    wire add;
    
    FDRE #(.INIT(1'b0)) change (.C(clk), .CE(1'b1), .D(In), .Q(check[0]));
    FDRE #(.INIT(1'b0)) change2 (.C(clk), .CE(1'b1), .D(check[0]), .Q(check[1]));
    
    assign add = check[0] & ~check[1];
    
    FDRE #(.INIT(1'b0)) LED0 (.C(clk), .CE(add), .D(add), .Q(led[0]));
    FDRE #(.INIT(1'b0)) LED1 (.C(clk), .CE(add), .D(led[0]), .Q(led[1]));
    FDRE #(.INIT(1'b0)) LED2 (.C(clk), .CE(add), .D(led[1]), .Q(led[2]));
    FDRE #(.INIT(1'b0)) LED3 (.C(clk), .CE(add), .D(led[2]), .Q(led[3]));
    FDRE #(.INIT(1'b0)) LED4 (.C(clk), .CE(add), .D(led[3]), .Q(led[4]));
    FDRE #(.INIT(1'b0)) LED5 (.C(clk), .CE(add), .D(led[4]), .Q(led[5]));
    FDRE #(.INIT(1'b0)) LED6 (.C(clk), .CE(add), .D(led[5]), .Q(led[6]));
    FDRE #(.INIT(1'b0)) LED7 (.C(clk), .CE(add), .D(led[6]), .Q(led[7]));
    FDRE #(.INIT(1'b0)) LED8 (.C(clk), .CE(add), .D(led[7]), .Q(led[8]));
    FDRE #(.INIT(1'b0)) LED9 (.C(clk), .CE(add), .D(led[8]), .Q(led[9]));
    FDRE #(.INIT(1'b0)) LED10 (.C(clk), .CE(add), .D(led[9]), .Q(led[10]));
    FDRE #(.INIT(1'b0)) LED11 (.C(clk), .CE(add), .D(led[10]), .Q(led[11]));
    FDRE #(.INIT(1'b0)) LED12 (.C(clk), .CE(add), .D(led[11]), .Q(led[12]));
    FDRE #(.INIT(1'b0)) LED13 (.C(clk), .CE(add), .D(led[12]), .Q(led[13]));
    FDRE #(.INIT(1'b0)) LED14 (.C(clk), .CE(add), .D(led[13]), .Q(led[14]));
    FDRE #(.INIT(1'b0)) LED15 (.C(clk), .CE(add), .D(led[14]), .Q(led[15]));
    
endmodule
