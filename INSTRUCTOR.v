`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mayank Trehan
// 
// Create Date: 15.04.2023 20:59:28
// Design Name: 
// Module Name: Instructor
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


module INSTRUCTOR(
                 //////////////////////////////////////////////////
                 input clk,
                 input Data_pulse,
                 input Set_Data_clk,
                 input State_clk,
                 input rst,
                 input Enable_Data_Read,
                 input [15:0] Data_In_M_I,
                 input [31:0] Data_In_Program_RAM,
                 ///////////////////////////////////////////////////
                 output reg [7:0] Address_To_Memory,
                 output reg [15:0] Data_Out,
                 ///////////////////////////////////////////////////
                 output reg Program_RAM_read_enable=1, 
                 output reg Program_RAM_write_enable=0,
                 ///////////////////////////////////////////////////
                 output reg Memory_read_enable=0, 
                 output reg Memory_write_enable=0
                 /////////////////////////////////////////////////// 
                 );
parameter   IDLE=0,
            S_add=1,
            S_sub=2,
            S_mul=3,
            S_div=4,
            S_acc_to_mem=5;
parameter   S_add_from_address=6,
            S_sub_from_address=7,
            S_mul_from_address=8,
            S_div_from_address=9;
parameter   S_add_from_address_SS1=10,
            S_sub_from_address_SS1=11,
            S_mul_from_address_SS1=12,
            S_div_from_address_SS1=13;

reg [7:0] Present_State, Next_State;                 
///////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////                  ;
reg [7:0] get_instruction;
reg [15:0] accumulator=0;
integer block_cycle=0;
reg block_pulse=0;
reg [2:0] Data_Hold_Counter = 0;
reg Data_Out_pulse = 0;
/////////////////////////////////////////////////////////////////////////////////////                 
/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
reg [2:0] Memory_write_hold=0;
reg [2:0] Memory_read_hold=0;
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
    begin 
        if(rst)begin
            get_instruction = 0;
            accumulator = 0;
            Present_State=IDLE;
            end
        else
            begin
            accumulator = accumulator;
            Present_State = Next_State;
			end
    end
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////// 
always @(*)
begin
get_instruction = Data_In_Program_RAM[31:24];
Address_To_Memory = Data_In_Program_RAM[7:0];
end
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////     
always@(posedge clk)
   begin 
       if (Memory_write_enable == 1 && Memory_write_hold < 5) begin
            Memory_write_hold = Memory_write_hold + 1;
            Memory_write_enable = 1;
            end
       else 
            begin 
            Memory_write_hold = 0;
            Memory_write_enable = 0;
            
            end
   end
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////    
always@(posedge clk)
   begin 
       if (Memory_read_enable == 1 && Memory_read_hold < 5) begin
            Memory_read_hold = Memory_read_hold + 1;
            Memory_read_enable=1;
            end
       else 
            begin 
            Memory_read_hold = 0;
            Memory_read_enable = 0;
            
            end
   end   
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////     
/////////////////////////////////////////////////////////////////////////////////////  
////////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///always@(posedge clk) 
 //   begin
 //       if (block_cycle > 0)
 //           block_pulse = ~block_pulse;
 //       else
  //          block_pulse = 0;                                                    
  //  end
//////////////////////////////////////////////////////////////////////////////////////   
//////////////////////////////////////////////////////////////////////////////////////   
//////////////////////////////////////////////////////////////////////////////////////   
//////////////////////////////////////////////////////////////////////////////////////                       
/////////////////////////////////////////////////////////////////////////////////////   
/////////////////////////////////////////////////////////////////////////////////////
always@(posedge Set_Data_clk)
begin
    /////////////////////////////////////////////////////////////
    casex(Present_State)
    IDLE: 
    begin
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    S_add:
    begin 
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    S_sub:
    begin
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    S_mul:
    begin
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    S_div:
    begin 
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    S_acc_to_mem:
    begin
        if (get_instruction ==0)
        begin
            Next_State = IDLE;
        end
        else if (get_instruction ==1)
        begin
            Next_State = S_add;
        end
        else if (get_instruction ==2)
        begin
            Next_State = S_sub;
        end
        else if (get_instruction ==3 )
        begin
            Next_State = S_mul;    
        end 
        else if (get_instruction ==4)
        begin
            Next_State = S_div;
        end
        else if (get_instruction ==5)
        begin
            Next_State = S_acc_to_mem;
        end    
        else if (get_instruction ==6)
        begin
            Next_State = S_add_from_address;
        end
        else if (get_instruction ==7)
        begin
            Next_State = S_sub_from_address;
        end
        else if (get_instruction ==8)
        begin
            Next_State = S_mul_from_address;
        end
        else if (get_instruction ==9)
        begin
            Next_State = S_div_from_address;
        end
        else 
        begin
            Next_State = IDLE;
        end
    end
    /////////////////////////////////////////////////////
    S_add_from_address:
    begin
        Next_State = S_add_from_address_SS1;
    end
                        S_add_from_address_SS1:
                        begin
                            Next_State = S_add;
                        end
/////////////////////////////////////////////////////
    S_sub_from_address:
    begin
        Next_State = S_sub_from_address_SS1;
    end
                        S_sub_from_address_SS1:
                        begin
                            Next_State = S_sub;        
                        end
/////////////////////////////////////////////////////
    S_mul_from_address:
    begin
 
        Next_State = S_mul_from_address_SS1;

    end
                        S_mul_from_address_SS1:
                        begin
                            Next_State = S_mul;
         
                        end
/////////////////////////////////////////////////////
    S_div_from_address:
    begin 
        Next_State = S_div_from_address_SS1;
    end
                        S_div_from_address_SS1:
                        begin
                            Next_State = S_div;        
                        end
/////////////////////////////////////////////////////
    endcase
    end
/////////////////////////////////////////////////////////////////////////////////////
always@(posedge State_clk)
begin
    /////////////////////////////////////////////////////////////
    case(Present_State)
    IDLE: 
    begin
        Program_RAM_read_enable=1;
        accumulator = accumulator;
    end
    S_add:
    begin
        accumulator = accumulator + Data_In_Program_RAM [23:8]; 
        Program_RAM_read_enable=1;
    end
    S_sub:
    begin
        accumulator = accumulator - Data_In_Program_RAM [23:8]; 
        Program_RAM_read_enable=1;
    end
    S_mul:
    begin
        accumulator = accumulator * Data_In_Program_RAM [23:8]; 
        Program_RAM_read_enable=1;
    end
    S_div:
    begin
        accumulator = accumulator / Data_In_Program_RAM [23:8]; 
        Program_RAM_read_enable=1;
    end
    S_acc_to_mem:
    begin
        Memory_write_enable=1;
        Address_To_Memory = Data_In_Program_RAM [7:0];
        Data_Out = accumulator; 
        Program_RAM_read_enable=1;
    end
    /////////////////////////////////////////////////////
    S_add_from_address:
    begin
        Memory_read_enable=1; 
        Program_RAM_read_enable=0;
    end
                        S_add_from_address_SS1:
                        begin
                            accumulator = Data_In_M_I;
                            Program_RAM_read_enable=0;         
                        end
/////////////////////////////////////////////////////
    S_sub_from_address:
    begin
        Memory_read_enable=1; 
        Program_RAM_read_enable=0;
    end
                        S_sub_from_address_SS1:
                        begin
                            accumulator = Data_In_M_I;
                            Program_RAM_read_enable=0;         
                        end
/////////////////////////////////////////////////////
    S_mul_from_address:
    begin
        Memory_read_enable=1; 
        Program_RAM_read_enable=0;
    end
                        S_mul_from_address_SS1:
                        begin
                            accumulator = Data_In_M_I;
                            Program_RAM_read_enable=0;         
                        end
/////////////////////////////////////////////////////
    S_div_from_address:
    begin
        Memory_read_enable=1; 
        Program_RAM_read_enable=0;
    end
                        S_div_from_address_SS1:
                        begin
                            accumulator = Data_In_M_I;
                            Program_RAM_read_enable=0;         
                        end
/////////////////////////////////////////////////////
    endcase
end       

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
endmodule
