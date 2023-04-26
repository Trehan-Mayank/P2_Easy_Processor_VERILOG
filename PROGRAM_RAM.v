`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 15.04.2023 20:58:29
// Design Name: 
// Module Name: Program_RAM
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

module Program_RAM( 
                    input clk,
                    input Program_RAM_read_enable, 
                    input Program_RAM_write_enable,
                    output reg [31:0] Data_Out_Program_RAM
                             );
                    
reg [31:0] Program_RAM[0:1023];
integer i=0;
initial begin
$readmemh("PROGRAM_FILE.mem",Program_RAM);
end 

always@(posedge clk)
begin
    if (Program_RAM_read_enable)
    begin
            Data_Out_Program_RAM = Program_RAM[i];
            i = i+1;
        end    
end

endmodule