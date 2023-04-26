`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 16.04.2023 16:33:35
// Design Name: 
// Module Name: PROCESSOR
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


module PROCESSOR(
                    input clk,
                    input rst,
                    input Enable_Data_Read   
                    );
//////////////////////////////////////////////////////////////////////////
wire Data_Out_pulse,Set_Data_pulse,State_Out_pulse;                    
wire Memory_read_enable,Memory_write_enable;
wire [7:0] Address_To_Memory;
wire [15:0] Data_Out_I_M;
wire [15:0] Data_In_M_I;
wire [31:0] Data_Out_Program_RAM;
wire Program_RAM_read_enable,Program_RAM_write_enable;
//////////////////////////////////////////////////////////////////////////
CLOCKS UNIT_CLOCKS
                (
                clk,
                rst,
                Data_Out_pulse,
                Set_Data_pulse,
                State_Out_pulse
                );
//////////////////////////////////////////////////////////////////////////
Program_RAM UNIT_PROGRAM_RAM 
                ( 
                 Data_Out_pulse,
                 Program_RAM_read_enable, 
                 Program_RAM_write_enable,
                 Data_Out_Program_RAM
                 );                                    
//////////////////////////////////////////////////////////////////////////
INSTRUCTOR UNIT_INSTRUCTOR
                 (
                 clk,
                 Data_Out_pulse,
                 Set_Data_pulse,
                 State_Out_pulse,
                 rst,
                 Enable_Data_Read,
                 Data_In_M_I,
                 Data_Out_Program_RAM,
                 Address_To_Memory,
                 Data_Out_I_M,
                 Program_RAM_read_enable, 
                 Program_RAM_write_enable,
                 Memory_read_enable, 
                 Memory_write_enable
                 );
//////////////////////////////////////////////////////////////////////////                    
MEMORY UNIT_MEMORY
            ( 
            clk, 
            Address_To_Memory,
            Data_Out_I_M,
            Memory_read_enable, 
            Memory_write_enable, 
            Data_In_M_I
            );
                
//////////////////////////////////////////////////////////////////////////                    
endmodule
