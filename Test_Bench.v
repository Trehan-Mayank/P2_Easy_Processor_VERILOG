`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 16.04.2023 16:50:35
// Design Name: 
// Module Name: TEST
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

module TEST();

reg clk;
reg rst;
reg Enable_Data_Read;


PROCESSOR DUT(clk,rst,Enable_Data_Read);

always #5 clk = ~clk;

initial begin
clk=0;
rst=0;
Enable_Data_Read=0;

#10

Enable_Data_Read=1;
#2000
$stop;
end
endmodule
