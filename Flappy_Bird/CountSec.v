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
    output timer
    );
    wire [119:0]sec;
    wire send;
    wire [1:0]check;
    
    FDRE #(.INIT(1'b0)) check1 (.C(clk), .CE(qsec), .D(go), .Q(check[0]));
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
    FDRE #(.INIT(1'b0)) sec18 (.C(clk), .CE(qsec), .D(sec[16]), .Q(sec[17]));
    FDRE #(.INIT(1'b0)) sec19 (.C(clk), .CE(qsec), .D(sec[17]), .Q(sec[18]));
    FDRE #(.INIT(1'b0)) sec20 (.C(clk), .CE(qsec), .D(sec[18]), .Q(sec[19]));
    FDRE #(.INIT(1'b0)) sec21 (.C(clk), .CE(qsec), .D(sec[19]), .Q(sec[20]));
    FDRE #(.INIT(1'b0)) sec22 (.C(clk), .CE(qsec), .D(sec[20]), .Q(sec[21]));
    FDRE #(.INIT(1'b0)) sec23 (.C(clk), .CE(qsec), .D(sec[21]), .Q(sec[22]));
    FDRE #(.INIT(1'b0)) sec24 (.C(clk), .CE(qsec), .D(sec[22]), .Q(sec[23]));
    FDRE #(.INIT(1'b0)) sec25 (.C(clk), .CE(qsec), .D(sec[23]), .Q(sec[24]));
    FDRE #(.INIT(1'b0)) sec26 (.C(clk), .CE(qsec), .D(sec[24]), .Q(sec[25]));
    FDRE #(.INIT(1'b0)) sec27 (.C(clk), .CE(qsec), .D(sec[25]), .Q(sec[26]));
    FDRE #(.INIT(1'b0)) sec28 (.C(clk), .CE(qsec), .D(sec[26]), .Q(sec[27]));
    FDRE #(.INIT(1'b0)) sec29 (.C(clk), .CE(qsec), .D(sec[27]), .Q(sec[28]));
    FDRE #(.INIT(1'b0)) sec30 (.C(clk), .CE(qsec), .D(sec[28]), .Q(sec[29]));
    FDRE #(.INIT(1'b0)) sec31 (.C(clk), .CE(qsec), .D(sec[29]), .Q(sec[30]));
    FDRE #(.INIT(1'b0)) sec32 (.C(clk), .CE(qsec), .D(sec[30]), .Q(sec[31]));
    FDRE #(.INIT(1'b0)) sec33 (.C(clk), .CE(qsec), .D(sec[31]), .Q(sec[32]));
    FDRE #(.INIT(1'b0)) sec34 (.C(clk), .CE(qsec), .D(sec[32]), .Q(sec[33]));
    FDRE #(.INIT(1'b0)) sec35 (.C(clk), .CE(qsec), .D(sec[33]), .Q(sec[34]));
    FDRE #(.INIT(1'b0)) sec36 (.C(clk), .CE(qsec), .D(sec[34]), .Q(sec[35]));
    FDRE #(.INIT(1'b0)) sec37 (.C(clk), .CE(qsec), .D(sec[35]), .Q(sec[36]));
    FDRE #(.INIT(1'b0)) sec38 (.C(clk), .CE(qsec), .D(sec[36]), .Q(sec[37]));
    FDRE #(.INIT(1'b0)) sec39 (.C(clk), .CE(qsec), .D(sec[37]), .Q(sec[38]));
    FDRE #(.INIT(1'b0)) sec40 (.C(clk), .CE(qsec), .D(sec[38]), .Q(sec[39]));
    FDRE #(.INIT(1'b0)) sec41 (.C(clk), .CE(qsec), .D(sec[39]), .Q(sec[40]));
    FDRE #(.INIT(1'b0)) sec42 (.C(clk), .CE(qsec), .D(sec[40]), .Q(sec[41]));
    FDRE #(.INIT(1'b0)) sec43 (.C(clk), .CE(qsec), .D(sec[41]), .Q(sec[42]));
    FDRE #(.INIT(1'b0)) sec44 (.C(clk), .CE(qsec), .D(sec[42]), .Q(sec[43]));
    FDRE #(.INIT(1'b0)) sec45 (.C(clk), .CE(qsec), .D(sec[43]), .Q(sec[44]));
    FDRE #(.INIT(1'b0)) sec46 (.C(clk), .CE(qsec), .D(sec[44]), .Q(sec[45]));
    FDRE #(.INIT(1'b0)) sec47 (.C(clk), .CE(qsec), .D(sec[45]), .Q(sec[46]));
    FDRE #(.INIT(1'b0)) sec48 (.C(clk), .CE(qsec), .D(sec[46]), .Q(sec[47]));
    FDRE #(.INIT(1'b0)) sec49 (.C(clk), .CE(qsec), .D(sec[47]), .Q(sec[48]));
    FDRE #(.INIT(1'b0)) sec50 (.C(clk), .CE(qsec), .D(sec[48]), .Q(sec[49]));
    FDRE #(.INIT(1'b0)) sec51 (.C(clk), .CE(qsec), .D(sec[49]), .Q(sec[50]));
    FDRE #(.INIT(1'b0)) sec52 (.C(clk), .CE(qsec), .D(sec[50]), .Q(sec[51]));
    FDRE #(.INIT(1'b0)) sec53 (.C(clk), .CE(qsec), .D(sec[51]), .Q(sec[52]));
    FDRE #(.INIT(1'b0)) sec54 (.C(clk), .CE(qsec), .D(sec[52]), .Q(sec[53]));
    FDRE #(.INIT(1'b0)) sec55 (.C(clk), .CE(qsec), .D(sec[53]), .Q(sec[54]));
    FDRE #(.INIT(1'b0)) sec56 (.C(clk), .CE(qsec), .D(sec[54]), .Q(sec[55]));
    FDRE #(.INIT(1'b0)) sec57 (.C(clk), .CE(qsec), .D(sec[55]), .Q(sec[56]));
    FDRE #(.INIT(1'b0)) sec58 (.C(clk), .CE(qsec), .D(sec[56]), .Q(sec[57]));
    FDRE #(.INIT(1'b0)) sec59 (.C(clk), .CE(qsec), .D(sec[57]), .Q(sec[58]));
    FDRE #(.INIT(1'b0)) sec60 (.C(clk), .CE(qsec), .D(sec[58]), .Q(sec[59]));
    FDRE #(.INIT(1'b0)) sec61 (.C(clk), .CE(qsec), .D(sec[59]), .Q(sec[60]));
    FDRE #(.INIT(1'b0)) sec62 (.C(clk), .CE(qsec), .D(sec[60]), .Q(sec[61]));
    FDRE #(.INIT(1'b0)) sec63 (.C(clk), .CE(qsec), .D(sec[61]), .Q(sec[62]));
    FDRE #(.INIT(1'b0)) sec64 (.C(clk), .CE(qsec), .D(sec[62]), .Q(sec[63]));
    FDRE #(.INIT(1'b0)) sec65 (.C(clk), .CE(qsec), .D(sec[63]), .Q(sec[64]));
    FDRE #(.INIT(1'b0)) sec66 (.C(clk), .CE(qsec), .D(sec[64]), .Q(sec[65]));
    FDRE #(.INIT(1'b0)) sec67 (.C(clk), .CE(qsec), .D(sec[65]), .Q(sec[66]));
    FDRE #(.INIT(1'b0)) sec68 (.C(clk), .CE(qsec), .D(sec[66]), .Q(sec[67]));
    FDRE #(.INIT(1'b0)) sec69 (.C(clk), .CE(qsec), .D(sec[67]), .Q(sec[68]));
    FDRE #(.INIT(1'b0)) sec70 (.C(clk), .CE(qsec), .D(sec[68]), .Q(sec[69]));
    FDRE #(.INIT(1'b0)) sec71 (.C(clk), .CE(qsec), .D(sec[69]), .Q(sec[70]));
    FDRE #(.INIT(1'b0)) sec72 (.C(clk), .CE(qsec), .D(sec[70]), .Q(sec[71]));
    FDRE #(.INIT(1'b0)) sec73 (.C(clk), .CE(qsec), .D(sec[71]), .Q(sec[72]));
    FDRE #(.INIT(1'b0)) sec74 (.C(clk), .CE(qsec), .D(sec[72]), .Q(sec[73]));
    FDRE #(.INIT(1'b0)) sec75 (.C(clk), .CE(qsec), .D(sec[73]), .Q(sec[74]));
    FDRE #(.INIT(1'b0)) sec76 (.C(clk), .CE(qsec), .D(sec[74]), .Q(sec[75]));
    FDRE #(.INIT(1'b0)) sec77 (.C(clk), .CE(qsec), .D(sec[75]), .Q(sec[76]));
    FDRE #(.INIT(1'b0)) sec78 (.C(clk), .CE(qsec), .D(sec[76]), .Q(sec[77]));
    FDRE #(.INIT(1'b0)) sec79 (.C(clk), .CE(qsec), .D(sec[77]), .Q(sec[78]));
    FDRE #(.INIT(1'b0)) sec80 (.C(clk), .CE(qsec), .D(sec[78]), .Q(sec[79]));
    FDRE #(.INIT(1'b0)) sec81 (.C(clk), .CE(qsec), .D(sec[79]), .Q(sec[80]));
    FDRE #(.INIT(1'b0)) sec82 (.C(clk), .CE(qsec), .D(sec[80]), .Q(sec[81]));
    FDRE #(.INIT(1'b0)) sec83 (.C(clk), .CE(qsec), .D(sec[81]), .Q(sec[82]));
    FDRE #(.INIT(1'b0)) sec84 (.C(clk), .CE(qsec), .D(sec[82]), .Q(sec[83]));
    FDRE #(.INIT(1'b0)) sec85 (.C(clk), .CE(qsec), .D(sec[83]), .Q(sec[84]));
    FDRE #(.INIT(1'b0)) sec86 (.C(clk), .CE(qsec), .D(sec[84]), .Q(sec[85]));
    FDRE #(.INIT(1'b0)) sec87 (.C(clk), .CE(qsec), .D(sec[85]), .Q(sec[86]));
    FDRE #(.INIT(1'b0)) sec88 (.C(clk), .CE(qsec), .D(sec[86]), .Q(sec[87]));
    FDRE #(.INIT(1'b0)) sec89 (.C(clk), .CE(qsec), .D(sec[87]), .Q(sec[88]));
    FDRE #(.INIT(1'b0)) sec90 (.C(clk), .CE(qsec), .D(sec[88]), .Q(sec[89]));
    FDRE #(.INIT(1'b0)) sec91 (.C(clk), .CE(qsec), .D(sec[89]), .Q(sec[90]));
    FDRE #(.INIT(1'b0)) sec92 (.C(clk), .CE(qsec), .D(sec[90]), .Q(sec[91]));
    FDRE #(.INIT(1'b0)) sec93 (.C(clk), .CE(qsec), .D(sec[91]), .Q(sec[92]));
    FDRE #(.INIT(1'b0)) sec94 (.C(clk), .CE(qsec), .D(sec[92]), .Q(sec[93]));
    FDRE #(.INIT(1'b0)) sec95 (.C(clk), .CE(qsec), .D(sec[93]), .Q(sec[94]));
    FDRE #(.INIT(1'b0)) sec96 (.C(clk), .CE(qsec), .D(sec[94]), .Q(sec[95]));
    FDRE #(.INIT(1'b0)) sec97 (.C(clk), .CE(qsec), .D(sec[95]), .Q(sec[96]));
    FDRE #(.INIT(1'b0)) sec98 (.C(clk), .CE(qsec), .D(sec[96]), .Q(sec[97]));
    FDRE #(.INIT(1'b0)) sec99 (.C(clk), .CE(qsec), .D(sec[97]), .Q(sec[98]));
    FDRE #(.INIT(1'b0)) sec100 (.C(clk), .CE(qsec), .D(sec[98]), .Q(sec[99]));
    FDRE #(.INIT(1'b0)) sec101 (.C(clk), .CE(qsec), .D(sec[99]), .Q(sec[100]));
    FDRE #(.INIT(1'b0)) sec102 (.C(clk), .CE(qsec), .D(sec[100]), .Q(sec[101]));
    FDRE #(.INIT(1'b0)) sec103 (.C(clk), .CE(qsec), .D(sec[101]), .Q(sec[102]));
    FDRE #(.INIT(1'b0)) sec104 (.C(clk), .CE(qsec), .D(sec[102]), .Q(sec[103]));
    FDRE #(.INIT(1'b0)) sec105 (.C(clk), .CE(qsec), .D(sec[103]), .Q(sec[104]));
    FDRE #(.INIT(1'b0)) sec106 (.C(clk), .CE(qsec), .D(sec[104]), .Q(sec[105]));
    FDRE #(.INIT(1'b0)) sec107 (.C(clk), .CE(qsec), .D(sec[105]), .Q(sec[106]));
    FDRE #(.INIT(1'b0)) sec108 (.C(clk), .CE(qsec), .D(sec[106]), .Q(sec[107]));
    FDRE #(.INIT(1'b0)) sec109 (.C(clk), .CE(qsec), .D(sec[107]), .Q(sec[108]));
    FDRE #(.INIT(1'b0)) sec110 (.C(clk), .CE(qsec), .D(sec[108]), .Q(sec[109]));
    FDRE #(.INIT(1'b0)) sec111 (.C(clk), .CE(qsec), .D(sec[109]), .Q(sec[110]));
    FDRE #(.INIT(1'b0)) sec112 (.C(clk), .CE(qsec), .D(sec[110]), .Q(sec[111]));
    FDRE #(.INIT(1'b0)) sec113 (.C(clk), .CE(qsec), .D(sec[111]), .Q(sec[112]));
    FDRE #(.INIT(1'b0)) sec114 (.C(clk), .CE(qsec), .D(sec[112]), .Q(sec[113]));
    FDRE #(.INIT(1'b0)) sec115 (.C(clk), .CE(qsec), .D(sec[113]), .Q(sec[114]));
    FDRE #(.INIT(1'b0)) sec116 (.C(clk), .CE(qsec), .D(sec[114]), .Q(sec[115]));
    FDRE #(.INIT(1'b0)) sec117 (.C(clk), .CE(qsec), .D(sec[115]), .Q(sec[116]));
    FDRE #(.INIT(1'b0)) sec118 (.C(clk), .CE(qsec), .D(sec[116]), .Q(sec[117]));
    FDRE #(.INIT(1'b0)) sec119 (.C(clk), .CE(qsec), .D(sec[117]), .Q(sec[118]));
    FDRE #(.INIT(1'b0)) sec120 (.C(clk), .CE(qsec), .D(sec[118]), .Q(sec[119]));
    
    assign timer = sec[119];

endmodule
