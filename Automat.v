`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 05:37:34 PM
// Design Name: 
// Module Name: Automat
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


module Automat(clk, reset, LEU1, LEI5, LEI10, REST1, REST5, ELIBSTICLA);

input clk, reset, LEU1, LEI5, LEI10;
output reg REST5, ELIBSTICLA;
output reg REST1;

reg [2:0] state, nextstate;

parameter s0 = 3'b000;  //stare initiala
parameter s1 = 3'b001;  //stare in care se ajunge din s0, dupa ce se baga un leu
parameter s2 = 3'b010;  //stare in care se ajunge din s1, dupa ce se mai baga 1 leu
parameter s3 = 3'b011;  //stare in care se ajunge din starea initiala, dupa ce se baga 5 lei
parameter s4 = 3'b100;  //stare in care se ajunge din starea initiala, dupa ce se baga 10 lei
parameter s5 = 3'b101;  //stare in care trebuie sa se mai dea rest 1 leu 
parameter s6 = 3'b110;  //stare in care trebuie sa se mai dea rest 2 lei
parameter s7 = 3'b111;

always @(posedge clk)
begin
    if (reset)
        state <= 3'b000;
    else
        state <= nextstate;
end

/*always @(negedge clk)
begin
    ELIBSTICLA = 0;
    REST1 = 0;
    REST5 = 0;
end*/

always @(state, LEU1, LEI5, LEI10)
begin
   REST1 = 0; REST5 = 0; ELIBSTICLA = 0;
   case (state)
   s0: begin
        if(LEU1)
            begin nextstate <= s1; REST1 = 0; REST5 = 0; ELIBSTICLA = 0; end
        if(LEI5)
            begin nextstate <= s4; REST1 = 1; REST5 = 0; ELIBSTICLA = 0; end
        if(LEI10)
            begin nextstate <= s3; REST1 = 0; REST5 = 1; ELIBSTICLA = 0; end
        end
   s1: begin
        if(LEU1)
            begin nextstate <= s2; REST1 = 0; REST5 = 0; ELIBSTICLA = 0; end
       end
   s2: begin
        if(LEU1)
            begin nextstate <= s5; REST1 = 0; REST5 = 0; ELIBSTICLA = 0; end
        end
   s3: begin nextstate <= s4; REST1 = 1; REST5 = 0; ELIBSTICLA = 0; end
   s4: begin nextstate <= s5; REST1 = 1; REST5 = 0; ELIBSTICLA = 0; end
   s5: begin nextstate <= s0; REST1 = 0; REST5 = 0; ELIBSTICLA = 1; end
   default: begin nextstate <= s0; REST1 = 0; REST5 = 0; ELIBSTICLA = 0; end 
   endcase
end
endmodule
