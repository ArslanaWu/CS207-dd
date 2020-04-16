`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 19:46:09
// Design Name: 
// Module Name: set
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


module set(
input rst,//reset
input clk,
input add,//add 1 to something you are setting
input sub,//sub 1 to something you are setting
input confirm,//set up the next module after confirm = 1

output [2:0] out_player,
output [2:0] out_time_tens,
output [3:0] out_time_unit,
output [3:0] out_add_points,
output [3:0] out_sub_points,//output setting result

output reg[31:0] o_data,
output reg[7:0] o_en,
output reg[1:0] o_colon,//format output

output reg finish//signal of finish of setting
    );
    
    parameter
        C0 = 4'h0, C1 = 4'h1, C2 = 4'h2, C3 = 4'h3,
        C4 = 4'h4, C5 = 4'h5, C6 = 4'h6, C7 = 4'h7,
        C8 = 4'h8, C9 = 4'h9, CA = 4'ha, CB = 4'hb,
        CC = 4'hc, CD = 4'hd, CN = 4'he, CE = 4'hf;
    
    reg enter_player = 1'b1, 
    enter_time_tens = 1'b0, enter_time_unit = 1'b0, 
    enter_add = 1'b0, enter_sub = 1'b0;
    //start to set this module if = 1'b1 

    set_player p(enter_player, rst, confirm, 
                 clk, add, sub, 
                 out_player);
                 
    set_time_tens tt(enter_time_tens, rst, confirm,
                     clk, add, sub,
                     out_time_tens);
    
    set_time_unit tu(enter_time_unit, rst, confirm,
                     clk, add, sub,
                     out_time_unit);   

    set_points ap(enter_add, rst, confirm,
                  clk, add, sub,
                  out_add_points);

    set_points sp(enter_sub, rst, confirm,
                  clk, add, sub,
                  out_sub_points);
    //Port binding                     

    always @(posedge confirm, negedge rst)
    if(!rst)
    begin
        enter_player = 1'b1;
        enter_time_tens = 1'b0;
        enter_time_unit = 1'b0;
        enter_add = 1'b0;
        enter_sub = 1'b0;
        finish = 1'b0;
    end
    else
    begin
        if(enter_player == 1'b1)
            begin
                enter_player = 1'b0;
                enter_time_tens = 1'b1;
                enter_time_unit = 1'b0;
                enter_add = 1'b0;
                enter_sub = 1'b0;
                finish = 1'b0;
            end
        else if(enter_time_tens == 1'b1)
            begin
                enter_player = 1'b0;
                enter_time_tens = 1'b0;
                enter_time_unit = 1'b1;
                enter_add = 1'b0;
                enter_sub = 1'b0;
                finish = 1'b0;
            end
        else if(enter_time_unit == 1'b1)
            begin
                enter_player = 1'b0;
                enter_time_tens = 1'b0;
                enter_time_unit = 1'b0;
                enter_add = 1'b1;
                enter_sub = 1'b0;
                finish = 1'b0;
            end
        else if(enter_add == 1'b1)
            begin
                enter_player = 1'b0;
                enter_time_tens = 1'b0;
                enter_time_unit = 1'b0;
                enter_add = 1'b0;
                enter_sub = 1'b1;
                finish = 1'b0;
            end
        else if(enter_sub == 1'b1)
            begin
                enter_player = 1'b0;
                enter_time_tens = 1'b0;
                enter_time_unit = 1'b0;
                enter_add = 1'b0;
                enter_sub = 1'b0;
                finish = 1'b1;
            end
    end
    //choose setting module
    
    //following part is used to format the output
    wire hsec;
    reg cnt;

    halfsec_frequency hsf(clk, rst, hsec);
    always @(posedge hsec)
    if(!rst) cnt <= 0;
    else cnt <= ~cnt;

    always @(posedge clk)
    begin
    casex({enter_player, enter_time_tens, enter_time_unit, enter_add, enter_sub})
            5'b10000:
            begin
                o_data <= {CA, C1, 5'b0, out_player, 16'b0};
                o_en <= {3'b110, cnt, 4'b0000};
                o_colon <= 2'b10;
            end
            5'b01000:
            begin
                o_data <= {CA, C2, 1'b0, out_time_tens, out_time_unit, 16'b0};
                o_en <= {2'b11, cnt, 5'b10000};
                o_colon <= 2'b10;
            end
            5'b00100:
            begin
                o_data <= {CA, C3, 1'b0, out_time_tens, out_time_unit, 16'b0};
                o_en <= {3'b111, cnt, 4'b0000};
                o_colon <= 2'b10;
            end
            5'b00010:
            begin
                o_data <= {CA, C4, 4'b0, out_add_points, 16'b0};
                o_en <= {3'b110, cnt, 4'b0000};
                o_colon <= 2'b10;
            end
            5'b00001:
            begin
                o_data <= {CA, C5, 4'b0, out_sub_points, 16'b0};
                o_en <= {3'b110, cnt, 4'b0000};
                o_colon <= 2'b10;
            end
        endcase
    end
    
endmodule
