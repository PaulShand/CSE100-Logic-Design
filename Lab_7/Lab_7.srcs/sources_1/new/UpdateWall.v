`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 11:23:23 PM
// Design Name: 
// Module Name: UpdateWall
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


module UpdateWall(
    input clk,
    input draw,
    input ready,
    input run,
    input frame,
    input colision,
    input [15:0]startx,
    input [15:0] prevy,
    input [15:0]starty,
    output [15:0] Nxpos,
    output [15:0] Nypos
    );
    wire [15:0]shift;
    wire [15:0]yshiftup;
    wire [15:0]yshiftdw;
    wire [15:0]yshift;
    wire [15:0]Cxpos;
    wire [15:0]Cypos;
    wire [6:0]rnd;
    wire [6:0]scoopoop;
    assign shift = Cxpos - 16'd2;
    
    FDRE #(.INIT(1'b0)) C1 (.C(clk),.CE(frame),.D(((draw|ready)& startx[0])|(run & shift[0])|(colision&Cxpos[0])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[0]));
    FDRE #(.INIT(1'b0)) C2 (.C(clk),.CE(frame),.D(((draw|ready)& startx[1])|(run&shift[1])|(colision&Cxpos[1])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[1]));
    FDRE #(.INIT(1'b0)) C3 (.C(clk),.CE(frame),.D(((draw|ready)& startx[2])|(run&shift[2])|(colision&Cxpos[2])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[2]));
    FDRE #(.INIT(1'b0)) C4 (.C(clk),.CE(frame),.D(((draw|ready)& startx[3])|(run&shift[3])|(colision&Cxpos[3])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[3]));
    FDRE #(.INIT(1'b0)) C5 (.C(clk),.CE(frame),.D(((draw|ready)& startx[4])|(run&shift[4])|(colision&Cxpos[4])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[4]));
    FDRE #(.INIT(1'b0)) C6 (.C(clk),.CE(frame),.D(((draw|ready)& startx[5])|(run&shift[5])|(colision&Cxpos[5])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[5]));
    FDRE #(.INIT(1'b0)) C7 (.C(clk),.CE(frame),.D(((draw|ready)& startx[6])|(run&shift[6])|(colision&Cxpos[6])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[6]));
    FDRE #(.INIT(1'b0)) C8 (.C(clk),.CE(frame),.D(((draw|ready)& startx[7])|(run&shift[7])|(colision&Cxpos[7])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[7]));
    FDRE #(.INIT(1'b0)) C9 (.C(clk),.CE(frame),.D(((draw|ready)& startx[8])|(run&shift[8])|(colision&Cxpos[8])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[8]));
    FDRE #(.INIT(1'b0)) C10 (.C(clk),.CE(frame),.D(((draw|ready)& startx[9])|(run&shift[9])|(colision&Cxpos[9])|((Cxpos <= 16'd4) & 1'b1)), .Q(Cxpos[9]));
    FDRE #(.INIT(1'b0)) C11 (.C(clk),.CE(frame),.D(((draw|ready)& startx[10])|(run&shift[10])|(colision&Cxpos[10])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[10]));
    FDRE #(.INIT(1'b0)) C12 (.C(clk),.CE(frame),.D(((draw|ready)& startx[11])|(run&shift[11])|(colision&Cxpos[11])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[11]));
    FDRE #(.INIT(1'b0)) C13 (.C(clk),.CE(frame),.D(((draw|ready)& startx[12])|(run&shift[12])|(colision&Cxpos[12])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[12]));
    FDRE #(.INIT(1'b0)) C14 (.C(clk),.CE(frame),.D(((draw|ready)& startx[13])|(run&shift[13])|(colision&Cxpos[13])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[13]));
    FDRE #(.INIT(1'b0)) C15 (.C(clk),.CE(frame),.D(((draw|ready)& startx[14])|(run&shift[14])|(colision&Cxpos[14])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[14]));
    FDRE #(.INIT(1'b0)) C16 (.C(clk),.CE(frame),.D(((draw|ready)& startx[15])|(run&shift[15])|(colision&Cxpos[15])|((Cxpos <= 16'd4) & 1'b0)), .Q(Cxpos[15]));
    assign Nxpos = Cxpos;
    
    LFSR rng(.clk(clk),.rnd(rnd));
    assign scoopoop[6:4] = rnd[6:4];
    assign scoopoop[3:0] = 4'b0;
    assign yshiftup = prevy + scoopoop;
    assign yshiftdw = prevy - scoopoop;
    
    assign yshift[0] = ((prevy < 16'd132) & yshiftup[0]) | ((prevy >= 16'd132) & yshiftdw[0]);
    assign yshift[1] = ((prevy < 16'd132) & yshiftup[1]) | ((prevy >= 16'd132) & yshiftdw[1]);
    assign yshift[2] = ((prevy < 16'd132) & yshiftup[2]) | ((prevy >= 16'd132) & yshiftdw[2]);
    assign yshift[3] = ((prevy < 16'd132) & yshiftup[3]) | ((prevy >= 16'd132) & yshiftdw[3]);
    assign yshift[4] = ((prevy < 16'd132) & yshiftup[4]) | ((prevy >= 16'd132) & yshiftdw[4]);
    assign yshift[5] = ((prevy < 16'd132) & yshiftup[5]) | ((prevy >= 16'd132) & yshiftdw[5]);
    assign yshift[6] = ((prevy < 16'd132) & yshiftup[6]) | ((prevy >= 16'd132) & yshiftdw[6]);
    assign yshift[7] = ((prevy < 16'd132) & yshiftup[7]) | ((prevy >= 16'd132) & yshiftdw[7]);
    assign yshift[8] = ((prevy < 16'd132) & yshiftup[8]) | ((prevy >= 16'd132) & yshiftdw[8]);
    assign yshift[9] = ((prevy < 16'd132) & yshiftup[9]) | ((prevy >= 16'd132) & yshiftdw[9]);
    assign yshift[10] = ((prevy < 16'd132) & yshiftup[10]) | ((prevy >= 16'd132) & yshiftdw[10]);
    assign yshift[11] = ((prevy < 16'd132) & yshiftup[11]) | ((prevy >= 16'd132) & yshiftdw[11]);
    assign yshift[12] = ((prevy < 16'd132) & yshiftup[12]) | ((prevy >= 16'd132) & yshiftdw[12]);
    assign yshift[13] = ((prevy < 16'd132) & yshiftup[13]) | ((prevy >= 16'd132) & yshiftdw[13]);
    assign yshift[14] = ((prevy < 16'd132) & yshiftup[14]) | ((prevy >= 16'd132) & yshiftdw[14]);
    assign yshift[15] = ((prevy < 16'd132) & yshiftup[15]) | ((prevy >= 16'd132) & yshiftdw[15]);
    
    
    
    
    
    FDRE #(.INIT(1'b0)) C1y (.C(clk),.CE(frame),.D(((draw|ready)& starty[0]) | ((Cxpos <= 16'd4) & yshift[0]) | ((Cxpos > 16'd4) & Cypos[0])), .Q(Cypos[0]));
    FDRE #(.INIT(1'b0)) C2y (.C(clk),.CE(frame),.D(((draw|ready)& starty[1]) | ((Cxpos <= 16'd4) & yshift[1]) | ((Cxpos > 16'd4) & Cypos[1])), .Q(Cypos[1]));
    FDRE #(.INIT(1'b0)) C3y (.C(clk),.CE(frame),.D(((draw|ready)& starty[2]) | ((Cxpos <= 16'd4) & yshift[2]) | ((Cxpos > 16'd4) & Cypos[2])), .Q(Cypos[2]));
    FDRE #(.INIT(1'b0)) C4y (.C(clk),.CE(frame),.D(((draw|ready)& starty[3]) | ((Cxpos <= 16'd4) & yshift[3]) | ((Cxpos > 16'd4) & Cypos[3])), .Q(Cypos[3]));
    FDRE #(.INIT(1'b0)) C5y (.C(clk),.CE(frame),.D(((draw|ready)& starty[4]) | ((Cxpos <= 16'd4) & yshift[4]) | ((Cxpos > 16'd4) & Cypos[4])), .Q(Cypos[4]));
    FDRE #(.INIT(1'b0)) C6y (.C(clk),.CE(frame),.D(((draw|ready)& starty[5]) | ((Cxpos <= 16'd4) & yshift[5]) | ((Cxpos > 16'd4) & Cypos[5])), .Q(Cypos[5]));
    FDRE #(.INIT(1'b0)) C7y (.C(clk),.CE(frame),.D(((draw|ready)& starty[6]) | ((Cxpos <= 16'd4) & yshift[6]) | ((Cxpos > 16'd4) & Cypos[6])), .Q(Cypos[6]));
    FDRE #(.INIT(1'b0)) C8y (.C(clk),.CE(frame),.D(((draw|ready)& starty[7]) | ((Cxpos <= 16'd4) & yshift[7]) | ((Cxpos > 16'd4) & Cypos[7])), .Q(Cypos[7]));
    FDRE #(.INIT(1'b0)) C9y (.C(clk),.CE(frame),.D(((draw|ready)& starty[8]) | ((Cxpos <= 16'd4) & yshift[8]) | ((Cxpos > 16'd4) & Cypos[8])), .Q(Cypos[8]));
    FDRE #(.INIT(1'b0)) C10y (.C(clk),.CE(frame),.D(((draw|ready)& starty[9]) | ((Cxpos <= 16'd4) & yshift[9]) | ((Cxpos > 16'd4) & Cypos[9])), .Q(Cypos[9]));
    FDRE #(.INIT(1'b0)) C11y (.C(clk),.CE(frame),.D(((draw|ready)& starty[10]) | ((Cxpos <= 16'd4) & yshift[10]) | ((Cxpos > 16'd4) & Cypos[10])), .Q(Cypos[10]));
    FDRE #(.INIT(1'b0)) C12y (.C(clk),.CE(frame),.D(((draw|ready)& starty[11]) | ((Cxpos <= 16'd4) & yshift[11]) | ((Cxpos > 16'd4) & Cypos[11])), .Q(Cypos[11]));
    FDRE #(.INIT(1'b0)) C13y (.C(clk),.CE(frame),.D(((draw|ready)& starty[12]) | ((Cxpos <= 16'd4) & yshift[12]) | ((Cxpos > 16'd4) & Cypos[12])), .Q(Cypos[12]));
    FDRE #(.INIT(1'b0)) C14y (.C(clk),.CE(frame),.D(((draw|ready)& starty[13]) | ((Cxpos <= 16'd4) & yshift[13]) | ((Cxpos > 16'd4) & Cypos[13])), .Q(Cypos[13]));
    FDRE #(.INIT(1'b0)) C15y (.C(clk),.CE(frame),.D(((draw|ready)& starty[14]) | ((Cxpos <= 16'd4) & yshift[14]) | ((Cxpos > 16'd4) & Cypos[14])), .Q(Cypos[14]));
    FDRE #(.INIT(1'b0)) C16y (.C(clk),.CE(frame),.D(((draw|ready)& starty[15]) | ((Cxpos <= 16'd4) & yshift[15]) | ((Cxpos > 16'd4) & Cypos[15])), .Q(Cypos[15]));
    assign Nypos = Cypos;
    
    
endmodule
