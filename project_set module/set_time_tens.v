`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/19 21:51:54
// Design Name: 
// Module Name: set_time_tens
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


module set_time_tens(
input en,//en = 1则可以设置
input rst,//rst = 0则初始化
input confirm,//comfirm = 1表示确认该模块设置完成

input clk,
input add,
input sub,

output reg [2:0] out_time_tens
    );
    
    
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011,
               s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;
    reg [2:0] next_time_tens = s1;
    
    always @(posedge clk)
       begin
           if(!rst)
               out_time_tens <= s1;
           else if(en && !confirm)
               out_time_tens <= next_time_tens;
       end
       
    always @(add, sub)
        begin
            case(out_time_tens)
            s0: if(add & !sub) next_time_tens = s1; 
                else if(!add & sub) next_time_tens = s6; 
                else if((add & sub) | (!add & !sub)) next_time_tens = s0;
            
            s1: if(add & !sub) next_time_tens = s2; 
                else if(!add & sub) next_time_tens = s0;
                else if((add & sub) | (!add & !sub)) next_time_tens = s1;
            
            s2: if(add & !sub) next_time_tens = s3; 
                else if(!add & sub) next_time_tens = s1;
                else if((add & sub) | (!add & !sub)) next_time_tens = s2;
            
            s3: if(add & !sub) next_time_tens = s4; 
                else if(!add & sub) next_time_tens = s2;
                else if((add & sub) | (!add & !sub)) next_time_tens = s3;
            
            s4: if(add & !sub) next_time_tens = s5; 
                else if(!add & sub) next_time_tens = s3;
                else if((add & sub) | (!add & !sub)) next_time_tens = s4;
            
            s5: if(add & !sub) next_time_tens = s6; 
                else if(!add & sub) next_time_tens = s4;
                else if((add & sub) | (!add & !sub)) next_time_tens = s5;
            
            s6: if(add & !sub) next_time_tens = s0; 
                else if(!add & sub) next_time_tens = s5;
                else if((add & sub) | (!add & !sub)) next_time_tens = s6;
            endcase
        end
        
endmodule
