`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 16.04.2023 13:59:29
// Design Name: 
// Module Name: clk_Data
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


module CLOCKS(
                input clk,
                input rst,
                output reg Data_Out_pulse=0,
                output reg Set_Data_out_pulse=0,
                output reg State_Out_pulse=0
    );
integer Data_Hold_Counter=0, Set_Data_Hold_Counter=0, State_Hold_Counter=0;


///////////////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
    begin 
        if(rst)begin
            Set_Data_out_pulse=0;
            Set_Data_Hold_Counter=0;
            end    
        else
        begin
            if (Set_Data_Hold_Counter < 10)
                Set_Data_Hold_Counter=Set_Data_Hold_Counter+1;
            else
                Set_Data_Hold_Counter=0;
        end
end        
        always@(Set_Data_Hold_Counter)
        begin
            if (Set_Data_Hold_Counter == 4)
                Set_Data_out_pulse=1;
            else
                Set_Data_out_pulse=0;    
        end
////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
    begin 
        if(rst)begin
            Data_Out_pulse=0;
            Data_Hold_Counter=0;
            end    
        else
        begin
            if (Data_Hold_Counter < 10)
                Data_Hold_Counter=Data_Hold_Counter+1;
            else
                Data_Hold_Counter=0;
        end
end        
        always@(Data_Hold_Counter)
        begin
            if (Data_Hold_Counter == 2)
                Data_Out_pulse=1;
            else
                Data_Out_pulse=0;    
        end
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
    begin 
        if(rst)begin
            State_Out_pulse=0;
            State_Hold_Counter=0;
            end    
        else
        begin
            if (State_Hold_Counter < 10)
                State_Hold_Counter=State_Hold_Counter+1;
            else
                State_Hold_Counter=0;
        end
end        
        always@(State_Hold_Counter)
        begin
            if (State_Hold_Counter == 6)
                State_Out_pulse=1;
            else
                State_Out_pulse=0;
        end
////////////////////////////////////////////////////////////////////////////////////
endmodule
