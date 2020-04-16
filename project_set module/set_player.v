`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 21:01:31
// Design Name: 
// Module Name: set_player
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


module set_player(
input en,//en = 1则可以设置
input rst,//rst = 0则初始化
input confirm,//comfirm = 1表示确认该模块设置完成

input clk,
input add,
input sub,

output reg [2:0] out_player
    );
    
    
    parameter S0 = 3'b010, S1 = 3'b011, S2 = 3'b100;
    reg [2:0] next_player = S0;
    
    always @(posedge clk)
        begin
            if(!rst)
                out_player <= S0;
            else if(en & !confirm)
                out_player <= next_player;
            
        end
    
    always @(add, sub) 
        begin
        case(out_player)
        S0: if(add & !sub) next_player = S1; 
            else if(!add & sub) next_player = S2;
            else if((add & sub) | (!add & !sub)) next_player = S0;
        
        S1: if(add & !sub) next_player = S2; 
            else if(!add & sub) next_player = S0;
            else if((add & sub) | (!add & !sub)) next_player = S1;
        
        S2: if(add & !sub) next_player = S0; 
            else if(!add & sub) next_player = S1;
            else if((add & sub) | (!add & !sub)) next_player = S2;
        endcase
    end
    
endmodule
