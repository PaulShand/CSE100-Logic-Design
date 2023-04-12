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
    input go,
    input clk,
    output [3:0]n
    );
    wire [59:0]sec;

    
   
    
    assign n[0] = sec[3] ^ sec[7] ^ sec[11] ^ sec[15] ^ sec[19] ^ sec[23] ^ sec[27] ^ sec[31] ^ sec[35] ^ sec[39] ^ sec[43] ^ sec[47] ^ sec[51] ^ sec[55] ^ sec[59];
    assign n[1] = sec[7] ^ sec[15] ^ sec[23] ^ sec[31] ^ sec[39] ^ sec[47] ^ sec[55];
    
    assign n[2] = sec[15] ^ sec[31] ^ sec[47];
    assign n[3] = sec[31];
    
    FDRE #(.INIT(1'b0)) sec0 (.C(clk), .CE(qsec), .D(go), .Q(sec[0]));
    FDRE #(.INIT(1'b0)) sec1 (.C(clk), .CE(qsec), .D((sec[0] & go)), .Q(sec[1]));
    FDRE #(.INIT(1'b0)) sec2 (.C(clk), .CE(qsec), .D((sec[1] & go)), .Q(sec[2]));
    FDRE #(.INIT(1'b0)) sec3 (.C(clk), .CE(qsec), .D((sec[2]&go)), .Q(sec[3]));
    //1
    FDRE #(.INIT(1'b0)) sec4 (.C(clk), .CE(qsec), .D((sec[3]&go)), .Q(sec[4]));
    FDRE #(.INIT(1'b0)) sec5 (.C(clk), .CE(qsec), .D((sec[4]&go)), .Q(sec[5]));
    FDRE #(.INIT(1'b0)) sec6 (.C(clk), .CE(qsec), .D((sec[5]&go)), .Q(sec[6]));
    FDRE #(.INIT(1'b0)) sec7 (.C(clk), .CE(qsec), .D((sec[6]&go)), .Q(sec[7]));
    //2
    FDRE #(.INIT(1'b0)) sec8 (.C(clk), .CE(qsec), .D((sec[7]&go)), .Q(sec[8]));
    FDRE #(.INIT(1'b0)) sec9 (.C(clk), .CE(qsec), .D(sec[8]&go), .Q(sec[9]));
    FDRE #(.INIT(1'b0)) sec10 (.C(clk), .CE(qsec), .D(sec[9]&go), .Q(sec[10]));
    FDRE #(.INIT(1'b0)) sec11 (.C(clk), .CE(qsec), .D(sec[10]&go), .Q(sec[11]));
    //3
    FDRE #(.INIT(1'b0)) sec12 (.C(clk), .CE(qsec), .D(sec[11]&go), .Q(sec[12]));
    FDRE #(.INIT(1'b0)) sec13 (.C(clk), .CE(qsec), .D(sec[12]&go), .Q(sec[13]));
    FDRE #(.INIT(1'b0)) sec14 (.C(clk), .CE(qsec), .D(sec[13]&go), .Q(sec[14]));
    FDRE #(.INIT(1'b0)) sec15 (.C(clk), .CE(qsec), .D(sec[14]&go), .Q(sec[15]));
    //4
    FDRE #(.INIT(1'b0)) sec16 (.C(clk), .CE(qsec), .D(sec[15]&go), .Q(sec[16]));
    FDRE #(.INIT(1'b0)) sec17 (.C(clk), .CE(qsec), .D(sec[16]&go), .Q(sec[17]));
    FDRE #(.INIT(1'b0)) sec18 (.C(clk), .CE(qsec), .D(sec[17]&go), .Q(sec[18]));
    FDRE #(.INIT(1'b0)) sec19 (.C(clk), .CE(qsec), .D(sec[18]&go), .Q(sec[19]));
    //5
    FDRE #(.INIT(1'b0)) sec20 (.C(clk), .CE(qsec), .D(sec[19]&go), .Q(sec[20]));
    FDRE #(.INIT(1'b0)) sec21 (.C(clk), .CE(qsec), .D(sec[20]&go), .Q(sec[21]));
    FDRE #(.INIT(1'b0)) sec22 (.C(clk), .CE(qsec), .D(sec[21]&go), .Q(sec[22]));
    FDRE #(.INIT(1'b0)) sec23 (.C(clk), .CE(qsec), .D(sec[22]&go), .Q(sec[23]));
    //6
    FDRE #(.INIT(1'b0)) sec24 (.C(clk), .CE(qsec), .D(sec[23]&go), .Q(sec[24]));
    FDRE #(.INIT(1'b0)) sec25 (.C(clk), .CE(qsec), .D(sec[24]&go), .Q(sec[25]));
    FDRE #(.INIT(1'b0)) sec26 (.C(clk), .CE(qsec), .D(sec[25]&go), .Q(sec[26]));
    FDRE #(.INIT(1'b0)) sec27 (.C(clk), .CE(qsec), .D(sec[26]&go), .Q(sec[27]));
    //7
    FDRE #(.INIT(1'b0)) sec28 (.C(clk), .CE(qsec), .D(sec[27]&go), .Q(sec[28]));
    FDRE #(.INIT(1'b0)) sec29 (.C(clk), .CE(qsec), .D(sec[28]&go), .Q(sec[29]));
    FDRE #(.INIT(1'b0)) sec30 (.C(clk), .CE(qsec), .D(sec[29]&go), .Q(sec[30]));
    FDRE #(.INIT(1'b0)) sec31 (.C(clk), .CE(qsec), .D(sec[30]&go), .Q(sec[31]));
    //8
    FDRE #(.INIT(1'b0)) sec32 (.C(clk), .CE(qsec), .D(sec[31]&go), .Q(sec[32]));
    FDRE #(.INIT(1'b0)) sec33 (.C(clk), .CE(qsec), .D(sec[32]&go), .Q(sec[33]));
    FDRE #(.INIT(1'b0)) sec34 (.C(clk), .CE(qsec), .D(sec[33]&go), .Q(sec[34]));
    FDRE #(.INIT(1'b0)) sec35 (.C(clk), .CE(qsec), .D(sec[34]&go), .Q(sec[35]));
    //9
    FDRE #(.INIT(1'b0)) sec36 (.C(clk), .CE(qsec), .D(sec[35]&go), .Q(sec[36]));
    FDRE #(.INIT(1'b0)) sec37 (.C(clk), .CE(qsec), .D(sec[36]&go), .Q(sec[37]));
    FDRE #(.INIT(1'b0)) sec38 (.C(clk), .CE(qsec), .D(sec[37]&go), .Q(sec[38]));
    FDRE #(.INIT(1'b0)) sec39 (.C(clk), .CE(qsec), .D(sec[38]&go), .Q(sec[39]));
    //10
    FDRE #(.INIT(1'b0)) sec40 (.C(clk), .CE(qsec), .D(sec[39]&go), .Q(sec[40]));
    FDRE #(.INIT(1'b0)) sec41 (.C(clk), .CE(qsec), .D(sec[40]&go), .Q(sec[41]));
    FDRE #(.INIT(1'b0)) sec42 (.C(clk), .CE(qsec), .D(sec[41]&go), .Q(sec[42]));
    FDRE #(.INIT(1'b0)) sec43 (.C(clk), .CE(qsec), .D(sec[42]&go), .Q(sec[43]));
    //11
    FDRE #(.INIT(1'b0)) sec44 (.C(clk), .CE(qsec), .D(sec[43]&go), .Q(sec[44]));
    FDRE #(.INIT(1'b0)) sec45 (.C(clk), .CE(qsec), .D(sec[44]&go), .Q(sec[45]));
    FDRE #(.INIT(1'b0)) sec46 (.C(clk), .CE(qsec), .D(sec[45]&go), .Q(sec[46]));
    FDRE #(.INIT(1'b0)) sec47 (.C(clk), .CE(qsec), .D(sec[46]&go), .Q(sec[47]));
    //12
    FDRE #(.INIT(1'b0)) sec48 (.C(clk), .CE(qsec), .D(sec[47]&go), .Q(sec[48]));
    FDRE #(.INIT(1'b0)) sec49 (.C(clk), .CE(qsec), .D(sec[48]&go), .Q(sec[49]));
    FDRE #(.INIT(1'b0)) sec50 (.C(clk), .CE(qsec), .D(sec[49]&go), .Q(sec[50]));
    FDRE #(.INIT(1'b0)) sec51 (.C(clk), .CE(qsec), .D(sec[50]&go), .Q(sec[51]));
    //13
    FDRE #(.INIT(1'b0)) sec52 (.C(clk), .CE(qsec), .D(sec[51]&go), .Q(sec[52]));
    FDRE #(.INIT(1'b0)) sec53 (.C(clk), .CE(qsec), .D(sec[52]&go), .Q(sec[53]));
    FDRE #(.INIT(1'b0)) sec54 (.C(clk), .CE(qsec), .D(sec[53]&go), .Q(sec[54]));
    FDRE #(.INIT(1'b0)) sec55 (.C(clk), .CE(qsec), .D(sec[54]&go), .Q(sec[55]));
    //14
    FDRE #(.INIT(1'b0)) sec56 (.C(clk), .CE(qsec), .D(sec[55]&go), .Q(sec[56]));
    FDRE #(.INIT(1'b0)) sec57 (.C(clk), .CE(qsec), .D(sec[56]&go), .Q(sec[57]));
    FDRE #(.INIT(1'b0)) sec58 (.C(clk), .CE(qsec), .D(sec[57]&go), .Q(sec[58]));
    FDRE #(.INIT(1'b0)) sec59 (.C(clk), .CE(qsec), .D(sec[58]&go), .Q(sec[59]));
    //15

    
    
    

endmodule
