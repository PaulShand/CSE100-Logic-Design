`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 12:43:06 AM
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
    input btnL,
    input btnR,
    input clkin,
    output [3:0]vgaRed,
    output [3:0]vgaBlue,
    output [3:0]vgaGreen,
    output Hsync,
    output Vsync,
    output [3:0]an,
    output dp,
    output [6:0]seg
    );
    wire [15:0]x;
    wire [15:0]y;
    wire [3:0]b;
    wire BallCR;
    wire BallCB;
    wire BallCG;
    wire WallCR,WallCR1,WallCR2,WallCR3,WallCR4;
    wire WallCB,WallCB1,WallCB2,WallCB3,WallCB4;
    wire WallCG,WallCG1,WallCG2,WallCG3,WallCG4;
    wire frame;
    wire timer;
    wire [1:0]trig;
    wire run, draw, ready, colision, flash;
    wire [15:0]Ballpos;
    wire [15:0]Wallxpos1, Wallxpos2,Wallxpos3, Wallxpos4;
    wire [15:0]Wallypos1, Wallypos2,Wallypos3, Wallypos4;
    wire hit;
    wire [15:0]score;
    
    
    fatbitcount scor(.clk(clk),.Up(nonono& frame),.Dw(1'b0),.LD(ready),.Din(16'b0),.Q(score),.UTC(),.DTC());
   wire nonono;
   
   assign nonono = ((Wallxpos1 > 16'd157) & (Wallxpos1 <16'd160)) | ((Wallxpos2 > 16'd157) & (Wallxpos2 <16'd160)) | ((Wallxpos3 > 16'd157) & (Wallxpos3 <16'd160)) | ((Wallxpos4 > 16'd157) & (Wallxpos4 <16'd160));
    
    
    FDRE #(.INIT(1'b1)) edgee (.C(clk), .CE(1'b1), .D(Vsync), .Q(trig[0]));
    FDRE #(.INIT(1'b0)) trigger (.C(clk), .CE(1'b1), .D(trig[0]), .Q(trig[1]));
    assign frame = trig[0] & ~trig[1];
    
    assign dp = 1'b1;
    
    fatbitcount Xcount (.clk(clk),.Up(1'b1),.Dw(1'b0),.LD(x>16'd798),.Din(16'b0),.Q(x),.UTC(),.DTC());
    fatbitcount Ycount (.clk(clk),.Up(x>16'd798),.Dw(1'b0),.LD(y>16'd524),.Din(16'b0),.Q(y),.UTC(),.DTC());

    //module update ball position
    UpdateBall UB(.draw(draw),.ready(ready),.frame(frame), .colision(colision),.btnL(btnL),.clk(clk),.run(run),.Nypos(Ballpos));
    
    
    UpdateWall UW1(.clk(clk),.draw(draw),.ready(ready),.run(run),.frame(frame),.colision(colision),.startx(16'd320),.prevy(Wallypos2),.starty(16'd132),.Nxpos(Wallxpos1),.Nypos(Wallypos1));
    UpdateWall UW2(.clk(clk),.draw(draw),.ready(ready),.run(run),.frame(frame),.colision(colision),.startx(16'd480),.prevy(Wallypos3),.starty(16'd100),.Nxpos(Wallxpos2),.Nypos(Wallypos2));
    UpdateWall UW3(.clk(clk),.draw(draw),.ready(ready),.run(run),.frame(frame),.colision(colision),.startx(16'd640),.prevy(Wallypos4),.starty(16'd164),.Nxpos(Wallxpos3),.Nypos(Wallypos3));
    UpdateWall UW4(.clk(clk),.draw(draw),.ready(ready),.run(run),.frame(frame),.colision(colision),.startx(16'd800),.prevy(Wallypos1),.starty(16'd132),.Nxpos(Wallxpos4),.Nypos(Wallypos4));
    
    Ball balldraw (.xpos(16'd159), .ypos(Ballpos), .x(x), .y(y),.ready(ready),.col(colision),.blink(flash), .red(BallCR), .green(BallCG), .blue(BallCB));
    
    
    
    Wall Walldraw1 (.xpos(Wallxpos1), .ypos(Wallypos1), .x(x), .y(y), .red(WallCR1), .green(WallCG1), .blue(WallCB1));
    Wall Walldraw2 (.xpos(Wallxpos2), .ypos(Wallypos2), .x(x), .y(y), .red(WallCR2), .green(WallCG2), .blue(WallCB2));
    Wall Walldraw3 (.xpos(Wallxpos3), .ypos(Wallypos3), .x(x), .y(y), .red(WallCR3), .green(WallCG3), .blue(WallCB3));
    Wall Walldraw4 (.xpos(Wallxpos4), .ypos(Wallypos4), .x(x), .y(y), .red(WallCR4), .green(WallCG4), .blue(WallCB4));
    
    assign WallCR = WallCR1 | WallCR2 | WallCR3 | WallCR4;
    assign WallCG = WallCG1 | WallCG2 | WallCG3 | WallCG4;
    assign WallCB = WallCB1 | WallCB2 | WallCB3 | WallCB4;
    
    assign hit = (Ballpos > 16'd463) | (WallCG & BallCG);// & ((x > 16'd158)&(x < 16'd176)) & ((y < 16'd479)&(y > 16'd0)));
    
    State stateM (.btnL(btnL), .clk(clk),.hit(hit),.timer(timer), .draw(draw), .ready(ready), .run(run), .colision(colision)); //collide
    
    CountSec count (.qsec(frame), .go(ready), .clk(clk), .timer(timer)); //need
    //module update wall position
    hex7seg hex (.n(H),.seg(seg));
    wire [3:0]rin;
    RingCount ring (.clk(clk),.Advance(digsel),.ring(rin));
    wire [3:0]H;
    Selector selec (.sel(rin),.N(score),.H(H));
    
    assign an[0] = ~rin[0] | (colision & ~flash);
    assign an[1] = ~rin[1] | (colision & ~flash);
    assign an[2] = ~rin[2] | (colision & ~flash);
    assign an[3] = ~rin[3] | (colision & ~flash);
    
    //state machine
    //BIG BLINKY
    wire [29:0]BigFlash;
    FDRE #(.INIT(1'b1)) flash1 (.C(clk), .CE(frame), .D(BigFlash[29]), .Q(BigFlash[0]));
    FDRE #(.INIT(1'b0)) flash2 (.C(clk), .CE(frame), .D(BigFlash[0]), .Q(BigFlash[1]));
    FDRE #(.INIT(1'b0)) flash3 (.C(clk), .CE(frame), .D(BigFlash[1]), .Q(BigFlash[2]));
    FDRE #(.INIT(1'b0)) flash4 (.C(clk), .CE(frame), .D(BigFlash[2]), .Q(BigFlash[3]));
    FDRE #(.INIT(1'b0)) flash5 (.C(clk), .CE(frame), .D(BigFlash[3]), .Q(BigFlash[4]));
    FDRE #(.INIT(1'b0)) flash6 (.C(clk), .CE(frame), .D(BigFlash[4]), .Q(BigFlash[5]));
    FDRE #(.INIT(1'b0)) flash7 (.C(clk), .CE(frame), .D(BigFlash[5]), .Q(BigFlash[6]));
    FDRE #(.INIT(1'b0)) flash8 (.C(clk), .CE(frame), .D(BigFlash[6]), .Q(BigFlash[7]));
    FDRE #(.INIT(1'b0)) flash9 (.C(clk), .CE(frame), .D(BigFlash[7]), .Q(BigFlash[8]));
    FDRE #(.INIT(1'b0)) flash10 (.C(clk), .CE(frame), .D(BigFlash[8]), .Q(BigFlash[9]));
    FDRE #(.INIT(1'b0)) flash11 (.C(clk), .CE(frame), .D(BigFlash[9]), .Q(BigFlash[10]));
    FDRE #(.INIT(1'b0)) flash12 (.C(clk), .CE(frame), .D(BigFlash[10]), .Q(BigFlash[11]));
    FDRE #(.INIT(1'b0)) flash13 (.C(clk), .CE(frame), .D(BigFlash[11]), .Q(BigFlash[12]));
    FDRE #(.INIT(1'b0)) flash14 (.C(clk), .CE(frame), .D(BigFlash[12]), .Q(BigFlash[13]));
    FDRE #(.INIT(1'b0)) flash15 (.C(clk), .CE(frame), .D(BigFlash[13]), .Q(BigFlash[14]));
    FDRE #(.INIT(1'b0)) flash16 (.C(clk), .CE(frame), .D(BigFlash[14]), .Q(BigFlash[15]));
    FDRE #(.INIT(1'b0)) flash17 (.C(clk), .CE(frame), .D(BigFlash[15]), .Q(BigFlash[16]));
    FDRE #(.INIT(1'b0)) flash18 (.C(clk), .CE(frame), .D(BigFlash[16]), .Q(BigFlash[17]));
    FDRE #(.INIT(1'b0)) flash19 (.C(clk), .CE(frame), .D(BigFlash[17]), .Q(BigFlash[18]));
    FDRE #(.INIT(1'b0)) flash20 (.C(clk), .CE(frame), .D(BigFlash[18]), .Q(BigFlash[19]));
    FDRE #(.INIT(1'b0)) flash21 (.C(clk), .CE(frame), .D(BigFlash[19]), .Q(BigFlash[20]));
    FDRE #(.INIT(1'b0)) flash22 (.C(clk), .CE(frame), .D(BigFlash[20]), .Q(BigFlash[21]));
    FDRE #(.INIT(1'b0)) flash23 (.C(clk), .CE(frame), .D(BigFlash[21]), .Q(BigFlash[22]));
    FDRE #(.INIT(1'b0)) flash24 (.C(clk), .CE(frame), .D(BigFlash[22]), .Q(BigFlash[23]));
    FDRE #(.INIT(1'b0)) flash25 (.C(clk), .CE(frame), .D(BigFlash[23]), .Q(BigFlash[24]));
    FDRE #(.INIT(1'b0)) flash26 (.C(clk), .CE(frame), .D(BigFlash[24]), .Q(BigFlash[25]));
    FDRE #(.INIT(1'b0)) flash27 (.C(clk), .CE(frame), .D(BigFlash[25]), .Q(BigFlash[26]));
    FDRE #(.INIT(1'b0)) flash28 (.C(clk), .CE(frame), .D(BigFlash[26]), .Q(BigFlash[27]));
    FDRE #(.INIT(1'b0)) flash29 (.C(clk), .CE(frame), .D(BigFlash[27]), .Q(BigFlash[28]));
    FDRE #(.INIT(1'b0)) flash30 (.C(clk), .CE(frame), .D(BigFlash[28]), .Q(BigFlash[29]));
    
    
    
    FDRE #(.INIT(1'b0)) FLIPFLIP (.C(clk), .CE(BigFlash[29] & frame), .D(~flash), .Q(flash));
    
    assign b = 4'd0;
    

    lab7_clks not_so_slow (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));
    
    
    assign vgaRed[0] = (b | BallCR | WallCR) & ((x<16'd640) & (y<16'd479));
    assign vgaRed[1] = (b | BallCR | WallCR) & ((x<16'd640) & (y<16'd479));
    assign vgaRed[2] = (b | BallCR | WallCR) & ((x<16'd640) & (y<16'd479));
    assign vgaRed[3] = (b | BallCR | WallCR) & ((x<16'd640) & (y<16'd479));
    
    
    assign vgaBlue[0] = (b | BallCB | WallCB) & ((x<16'd640) & (y<16'd479));
    assign vgaBlue[1] = (b | BallCB | WallCB) & ((x<16'd640) & (y<16'd479));
    assign vgaBlue[2] = (b | BallCB | WallCB) & ((x<16'd640) & (y<16'd479));
    assign vgaBlue[3] = (b | BallCB | WallCB) & ((x<16'd640) & (y<16'd479));
    
    
    assign vgaGreen[0] = (b | BallCG | WallCG) & ((x<16'd640) & (y<16'd479));
    assign vgaGreen[1] = (b | BallCG | WallCG) & ((x<16'd640) & (y<16'd479));
    assign vgaGreen[2] = (b | BallCG | WallCG) & ((x<16'd640) & (y<16'd479));
    assign vgaGreen[3] = (b | BallCG | WallCG) & ((x<16'd640) & (y<16'd479));
    
    
    assign Hsync = 1'b1 & ((x < 16'd655) | (x > 16'd750));
    assign Vsync = 1'b1 & ((y < 16'd489) | (y > 16'd490));
    
    
    
endmodule
