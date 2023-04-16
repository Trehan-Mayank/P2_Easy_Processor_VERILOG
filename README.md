# P2_Easy_Processor_VERILOG
The Instructor accept 10 Different Functions and Perform tasks just like a Processor, using a Program RAM and Memory RAM 

Basic outline of different modules is given below
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
![Outline](https://user-images.githubusercontent.com/129321675/232329128-e26debea-39da-4629-8655-9431d26614a9.png)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

32 BIT DATA specification:

D31----D24 = Operation Selection

D23----D8  = DATA we Input

D7-----D0  = Address Specified


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

To perform operations use PROGRAM_FILE.mem

The Operation Selection available in this Design are:

(1)   00  //// Go to Idle State

(2)   01  //// Add 1010 (4112) to accumulator

(3)   02  //// Subtract (Value) to accumulator

(4)   03  //// Multiply (Value) to accumulator

(5)   04  //// Divide (Value) to accumulator

(6)   05  //// Move Accumulator Data to Address specified

(7)   06  //// Add content of Memory [Address] with (Data Input) and Store in Accumulator

(8)   07  //// Subtract content of Memory [Address] with (Data Input) and Store in Accumulator

(9)   08  //// Multiply content of Memory [Address] with (Data Input) and Store in Accumulator

(10)  09  //// Divide content of Memory [Address] with (Data Input) and Store in Accumulator



---------------------------------------------------------------------------------------------------------------------------------------------------------------------



Example of Program Sequence used in the VERILOG Program:

00_1010_00  //// Goes to Idle State

01_1010_01  //// Add 1010 (4112) to accumulator

05_0000_02  //// Move Accumulator Data to Address 2 of Memory

05_0000_03  //// Move Accumulator Data to Address 3 of Memory

06_1010_03  //// Add content of Memory [3] with (16'h1010 -> 16'd4112) and Store in Accumulator

07_0001_02  //// Subtract content of Memory [2] with (16'h0001 -> 16'd0001)and Store in Accumulator

09_0003_03  //// Divide content of Memory [3] with (16'h0003 -> 16'd0003) and Store in Accumulator

05_0000_05  //// Move Accumulator Data to Address 5 of Memory

08_0005_03  //// Multiply content of Memory [3] with (16'h0005 -> 16'd0005) and Store in Accumulator

05_0000_04  //// Move Accumulator Data to Address 4 of Memory
