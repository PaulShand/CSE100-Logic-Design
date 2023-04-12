// CSE 100/L Fall 2021
// This is a testbench for the entire Lab 2 Project.
// If the top level module in your Lab 2 project is named "top_lab2"
// and you used the suggested names for its inputs/outputs then
// then it will run without modification.  Otherwise follow the instructions
// in the comments marked "TODO" to modify this testbench to conform to your project.
`timescale 1ns/1ps

module lab2_7Seg_testbench();
   
  reg clkin;
  reg btnU; //check
  reg btnR; //check
  reg btnL; //check
  wire [6:0] seg;
  wire dp; //check
  wire [3:0] an; //check
  wire [15:0] led;
 
 
   
//=======================Start interface your toplevel here =========================   
// TODO: replace "top_lab2" with the name of your top level Lab 2 module.

  Top UUT (
    .clkin(clkin),.btnU(btnU), .btnR(btnR), .btnL(btnL), .seg(seg), .dp(dp), .an(an), .led(led)
  );
// TODO: In the three lines above, make sure the pin names match the names
// used for the inputs/outputs of your top level module.   For example, if you
// used "cin" rather than "sw0" in yout top level module, then replace ".sw0(sw0)" with ".cin(sw0)" 
 
//=======================Stop interface your toplevel here =========================   

        
 
  show_7segDisplay  showit (
    .seg({CG, CF, CE, CD, CC, CB, CA}),
    .DP(DP), .AN0(AN0), .AN1(AN1), .AN2(AN2), .AN3(AN3),
    .D7Seg0(D7Seg0), .D7Seg1(D7Seg1), .D7Seg2(D7Seg2), .D7Seg3(D7Seg3)
  );      

    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
    end
    
  // Start sequential portion
  initial
  begin

   
  btnU = 0; //check
  btnR = 0; //check
  btnL = 0;
  #1000
  btnU = 0; //check
  btnR = 1; //check
  btnL = 0;
  #20000
  btnU = 0; //check
  btnR = 0; //check
  btnL = 0;
  
  

	// TODO: complete this testbentch so that all 16 hex values are generated
  end
endmodule




//==============Do not edit below this line ==========================================
module show_7segDisplay (
  input [6:0] seg,
  input DP,AN0,AN1,AN2,AN3,
  output reg [7:0] D7Seg0, D7Seg1, D7Seg2,D7Seg3);
  
  reg [7:0] val;
  
  always @(AN0 or val)
  begin
    if (AN0 == 0) D7Seg0 <= val;
    else if (AN0 == 1) D7Seg1 <= " ";
    else D7Seg0 <= 8'bX;   //  non-blocking assignment 
  end
  
  always @(AN1 or val)
  begin
    if (AN1 == 0) D7Seg1 <= val;
    else if (AN1 == 1) D7Seg1 <= " ";
    else D7Seg1 <= 8'bX;   //  non-blocking assignment 
  end 
  
  always @(AN2 or val)
  begin
    if (AN2 == 0) D7Seg2 <= val;
    else if (AN2 == 1) D7Seg2 <= " ";
    else D7Seg2 <= 8'bX;   //  non-blocking assignment 
  end 
  
  always @(AN3 or val)
  begin
    if (AN3 == 0) D7Seg3 <= val;
    else if (AN3 == 1) D7Seg3 <= " ";
    else D7Seg3 <= 8'bX;   //  non-blocking assignment 
  end     
    
  always @(seg)
  case (seg)
  7'b0111111:
       val = "-";
  7'b1111111:
       val = " ";
  7'b1000000:
       val = "0";
  7'b1111001:
       val = "1";
  7'b0100100:
       val = "2";
  7'b0110000:
       val = "3";
  7'b0011001:
       val = "4";
  7'b0010010:
       val = "5";
  7'b0000010:
       val = "6";
  7'b1111000:
       val = "7";
  7'b0000000:
       val = "8";
  7'b0011000:
       val = "9";
  7'b0001000:
       val = "A";
  7'b0000011:
       val = "B";
  7'b1000110:
       val = "C";
  7'b0100001:
       val = "D";
  7'b0000110:
       val = "E";
  7'b0001110:
       val = "F"; 
  default:
       val = 8'bX;                                    
  endcase
endmodule