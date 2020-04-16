`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/19 22:04:32
// Design Name: 
// Module Name: sim_set
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


module sim_set(

    );
    
    reg rst, clk, add, sub, confirm;
    
    wire [2:0] out_player;
    wire [2:0] out_time_tens;
    wire [3:0] out_time_unit;
    wire [3:0] out_add_points;
    wire [3:0] out_sub_points;
    wire finish;
    
    set s(rst, clk, add, sub, confirm, 
          out_player, 
          out_time_tens, out_time_unit, 
          out_add_points, out_sub_points, 
          finish);
    
    initial
    begin
        {rst, clk, add, sub, confirm} = 0;
        
        #5 clk = 1'b1;
        #5 clk = 1'b0;
        
        #5 rst = 1;
        
//        repeat(3)
//            begin
//            #5 add = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 add = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
        
//        #5 sub = 1;
//        #5 add = 0;
            
//        repeat(3)
//            begin
//            #5 sub = 1'b0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 sub = 1'b1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
                        
        #5 confirm = 1'b1;
        #5 confirm = 1'b0;
        #5 sub = 0;
        
//        repeat(6)
//            begin
//            #5 add = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 add = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
        
//        #5 sub = 1;
//        #5 add = 0;
            
//        repeat(6)
//            begin
//            #5 sub = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 sub = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end

        #5 confirm = 1'b1;
        #5 confirm = 1'b0;
        #5 sub = 0;
        
//        repeat(10)
//            begin
//            #5 add = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 add = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
        
//        #5 sub = 1;
//        #5 add = 0;
        
//        repeat(10)
//            begin
//            #5 sub = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 sub = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
            
        #5 confirm = 1'b1;
        #5 confirm = 1'b0;
        #5 sub = 0;
        
//        repeat(10)
//            begin
//            #5 add = 0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 add = 1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
        
//        #5 sub = 1;
//        #5 add = 0;
            
//        repeat(10)
//            begin
//            #5 sub = 1'b0;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
            
//            #5 sub = 1'b1;
//            #5 clk = 1'b1;
//            #5 clk = 1'b0;
//            end
                        
        #5 confirm = 1'b1;
        #5 confirm = 1'b0;
        #5 sub = 0;        
        
        repeat(10)
            begin
            #5 add = 0;
            #5 clk = 1'b1;
            #5 clk = 1'b0;
            
            #5 add = 1;
            #5 clk = 1'b1;
            #5 clk = 1'b0;
            end
        
        #5 sub = 1;
        #5 add = 0;
            
        repeat(10)
            begin
            #5 sub = 1'b0;
            #5 clk = 1'b1;
            #5 clk = 1'b0;
            
            #5 sub = 1'b1;
            #5 clk = 1'b1;
            #5 clk = 1'b0;
            end
                                
        #5 confirm = 1'b1;
        #5 confirm = 1'b0;
        #5 sub = 0;        
    end
    
endmodule
