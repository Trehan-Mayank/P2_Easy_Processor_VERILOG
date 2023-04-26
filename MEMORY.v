`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 15.04.2023 20:57:39
// Design Name: 
// Module Name: Memory
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


module MEMORY( input clk, 
            input [7:0] Address_In_Memory,
            input [15:0] Write_Data,
            input read_enable, 
            input write_enable, 
            output reg [15:0] Read_Data);


reg [15:0] Memory[0:255];



always@(posedge clk)
begin
    
    if (read_enable)
        begin 
            Read_Data <= Memory[Address_In_Memory];
        end
    if (write_enable)
        begin 
            Memory[Address_In_Memory] <= Write_Data;
        end
end
endmodule
