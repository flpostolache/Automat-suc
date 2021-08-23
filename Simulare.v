`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 09:18:03 PM
// Design Name: 
// Module Name: Simulare
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


module Simulare();
reg clk, reset, LEU1, LEI5, LEI10;
wire REST1, REST5, PLEACA_STICLA;
Automat da( clk, reset, LEU1, LEI5, LEI10, REST1, REST5, PLEACA_STICLA);

always #5 clk = ~clk;

initial
begin
clk = 0;
reset = 1;
LEU1 = 0;
LEI5 = 0;
LEI10 = 0;
#10 reset = 0;
#5 LEU1 = 1; LEI5 = 0; LEI10 = 0;
//#25 LEU1 = 0; LEI5 = 1; LEI10 = 0; 
//#5 LEI5 = 0;
#25 LEU1 = 0;

#35 LEI5 = 1;
#10 LEI5 = 0;
#40 LEI10 = 1;
#10 LEI10 = 0;
#40 $finish;
end

endmodule
