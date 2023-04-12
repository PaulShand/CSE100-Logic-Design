`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 03:57:32 PM
// Design Name: 
// Module Name: UpdateBall
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


module UpdateBall(
    input draw,
    input ready,
    input frame,
    input colision,
    input btnL,
    input clk,
    input run,
    output [15:0] Nypos
    );
    wire [15:0]Dw;
    wire [15:0]Up;
    wire act;
    wire [15:0]Cypos;
    wire send;
    wire [1:0]check;
    wire [15:0]fra;

    
    
    assign Dw = Cypos + 16'd2;
    assign Up = Cypos - 16'd4;
    
    FDRE #(.INIT(1'b1)) buto (.C(clk), .CE(1'b1), .D(btnL & run), .Q(check[0]));
    FDRE #(.INIT(1'b1)) buto2 (.C(clk), .CE(1'b1), .D(check[0]), .Q(check[1]));
    FDRE #(.INIT(1'b0)) sen (.C(clk), .CE(1'b1), .D((check[0] & ~check[1]) | (send & ~fra[0])), .Q(send));
     
    FDRE #(.INIT(1'b1)) C1 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[0])|(run & act & Up[0])|(colision & Cypos[0])), .Q(Cypos[0]));
    FDRE #(.INIT(1'b1)) C2 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[1])|(run & act & Up[1])|(colision & Cypos[1])), .Q(Cypos[1]));
    FDRE #(.INIT(1'b1)) C3 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[2])|(run & act & Up[2])|(colision & Cypos[2])), .Q(Cypos[2]));
    FDRE #(.INIT(1'b1)) C4 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[3])|(run & act & Up[3])|(colision & Cypos[3])), .Q(Cypos[3]));
    FDRE #(.INIT(1'b0)) C5 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[4])|(run & act & Up[4])|(colision & Cypos[4])), .Q(Cypos[4]));
    FDRE #(.INIT(1'b1)) C6 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[5])|(run & act & Up[5])|(colision & Cypos[5])), .Q(Cypos[5]));
    FDRE #(.INIT(1'b1)) C7 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[6])|(run & act & Up[6])|(colision & Cypos[6])), .Q(Cypos[6]));
    FDRE #(.INIT(1'b1)) C8 (.C(clk), .CE(frame), .D(((draw|ready)&1'b1)|(run & ~act & Dw[7])|(run & act & Up[7])|(colision & Cypos[7])), .Q(Cypos[7]));
    FDRE #(.INIT(1'b0)) C9 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[8])|(run & act & Up[8])|(colision & Cypos[8])), .Q(Cypos[8]));
    FDRE #(.INIT(1'b0)) C10 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[9])|(run & act & Up[9])|(colision & Cypos[9])), .Q(Cypos[9]));
    FDRE #(.INIT(1'b0)) C11 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[10])|(run & act & Up[10])|(colision & Cypos[10])), .Q(Cypos[10]));
    FDRE #(.INIT(1'b0)) C12 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[11])|(run & act & Up[11])|(colision & Cypos[11])), .Q(Cypos[11]));
    FDRE #(.INIT(1'b0)) C13 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[12])|(run & act & Up[12])|(colision & Cypos[12])), .Q(Cypos[12]));
    FDRE #(.INIT(1'b0)) C14 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[13])|(run & act & Up[13])|(colision & Cypos[13])), .Q(Cypos[13]));
    FDRE #(.INIT(1'b0)) C15 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[14])|(run & act & Up[14])|(colision & Cypos[14])), .Q(Cypos[14]));
    FDRE #(.INIT(1'b0)) C16 (.C(clk), .CE(frame), .D(((draw|ready)&1'b0)|(run & ~act & Dw[15])|(run & act & Up[15])|(colision & Cypos[15])), .Q(Cypos[15]));
    
    
    FDRE #(.INIT(1'b0)) fra1 (.C(clk), .CE(frame), .D(send & run), .Q(fra[0]));
    FDRE #(.INIT(1'b0)) fra2 (.C(clk), .CE(frame), .D(fra[0]), .Q(fra[1]));
    FDRE #(.INIT(1'b0)) fra3 (.C(clk), .CE(frame), .D(fra[1]), .Q(fra[2]));
    FDRE #(.INIT(1'b0)) fra4 (.C(clk), .CE(frame), .D(fra[2]), .Q(fra[3]));
    FDRE #(.INIT(1'b0)) fra5 (.C(clk), .CE(frame), .D(fra[3]), .Q(fra[4]));
    FDRE #(.INIT(1'b0)) fra6 (.C(clk), .CE(frame), .D(fra[4]), .Q(fra[5]));
    FDRE #(.INIT(1'b0)) fra7 (.C(clk), .CE(frame), .D(fra[5]), .Q(fra[6]));
    FDRE #(.INIT(1'b0)) fra8 (.C(clk), .CE(frame), .D(fra[6]), .Q(fra[7]));
    FDRE #(.INIT(1'b0)) fra9 (.C(clk), .CE(frame), .D(fra[7]), .Q(fra[8]));
    FDRE #(.INIT(1'b0)) fra0 (.C(clk), .CE(frame), .D(fra[8]), .Q(fra[9]));
    FDRE #(.INIT(1'b0)) fra11 (.C(clk), .CE(frame), .D(fra[9]), .Q(fra[10]));
    FDRE #(.INIT(1'b0)) fra12 (.C(clk), .CE(frame), .D(fra[10]), .Q(fra[11]));
    FDRE #(.INIT(1'b0)) fra13 (.C(clk), .CE(frame), .D(fra[11]), .Q(fra[12]));
    FDRE #(.INIT(1'b0)) fra14 (.C(clk), .CE(frame), .D(fra[12]), .Q(fra[13]));
    FDRE #(.INIT(1'b0)) fra15 (.C(clk), .CE(frame), .D(fra[13]), .Q(fra[14]));
    FDRE #(.INIT(1'b0)) fra16 (.C(clk), .CE(frame), .D(fra[14]), .Q(fra[15]));

    assign act = fra[0] | fra[1] | fra[2] | fra[3] | fra[4] | fra[5] | fra[6] | fra[7] | fra[8] | fra[9] | fra[10] | fra[12] | fra[13] | fra[14] | fra[15];

    
    
    assign Nypos = Cypos;
    
   
    
endmodule
