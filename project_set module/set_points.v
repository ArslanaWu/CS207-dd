`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/20 00:13:15
// Design Name: 
// Module Name: set_points
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


module set_points(
input en,//en = 1则可以设置
input rst,//rst = 0则初始化
input confirm,//comfirm = 1表示确认该模块设置完成

input clk,
input add,
input sub,

output reg [3:0] out_points
    );
    
    parameter s0 = 4'b1010, s1 = 4'b0001, s2 = 4'b0010, s3 = 3'b0011, s4 = 4'b0100,
               s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000, s9 = 4'b1001;
    reg [3:0] next_points = s1;
    
    always @(posedge clk)
       begin
           if(!rst)
               out_points <= s1;
           else if(en && !confirm)
               out_points <= next_points;
       end
       
    always @(add, sub)
        begin
            case(out_points)
            s0: if(add & !sub) next_points = s1; 
                else if(!add & sub) next_points = s9;
                else if((add & sub) | (!add & !sub)) next_points = s0;
                
            s1: if(add & !sub) next_points = s2; 
                else if(!add & sub) next_points = s0;
                else if((add & sub) | (!add & !sub)) next_points = s1;
                
            s2: if(add & !sub) next_points = s3; 
                else if(!add & sub) next_points = s1;
                else if((add & sub) | (!add & !sub)) next_points = s2;
                
            s3: if(add & !sub) next_points = s4; 
                else if(!add & sub) next_points = s2;
                else if((add & sub) | (!add & !sub)) next_points = s3;
                
            s4: if(add & !sub) next_points = s5; 
                else if(!add & sub) next_points = s3;
                else if((add & sub) | (!add & !sub)) next_points = s4;
                
            s5: if(add & !sub) next_points = s6; 
                else if(!add & sub) next_points = s4;
                else if((add & sub) | (!add & !sub)) next_points = s5;
                
            s6: if(add & !sub) next_points = s7; 
                else if(!add & sub) next_points = s5;
                else if((add & sub) | (!add & !sub)) next_points = s6;
                
            s7: if(add & !sub) next_points = s8; 
                else if(!add & sub) next_points = s6;
                else if((add & sub) | (!add & !sub)) next_points = s7;
                
            s8: if(add & !sub) next_points = s9; 
                else if(!add & sub) next_points = s7;
                else if((add & sub) | (!add & !sub)) next_points = s8;
                
            s9: if(add & !sub) next_points = s0; 
                else if(!add & sub) next_points = s8;
                else if((add & sub) | (!add & !sub)) next_points = s9;
                
            endcase
        end    
endmodule
