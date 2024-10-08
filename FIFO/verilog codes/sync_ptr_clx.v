`timescale 1 ns/10 ps

module sync_ptr_clx   ( o_ptr_clx                  ,
                        i_ptr                      , 
                        i_clk                      ,
                        i_rst_n 
                      )                            ;

//parameter declaration
parameter  ADDRSIZE = 4                            ;      // length of address

//input declaration
input                   i_clk                      ;      // input clock
input                   i_rst_n                    ;      // active low reset 
input      [ADDRSIZE:0] i_ptr                      ;      // input pointer(gray code)

//output declaration
output reg [ADDRSIZE:0] o_ptr_clx                  ;      // synchronized pointer with respect to other clock domain

//reg declaration
reg        [ADDRSIZE:0] ptr_clx_r                  ;      // read pointer reg needed for flipflop synchronizer


/*--------------------------------------------------------------
*The always block given below will synchronize one pointer into 
*other clock domain using 2 D-Flip Flop. 
---------------------------------------------------------------*/
always @(posedge i_clk or negedge i_rst_n)
begin
   if (!i_rst_n) 
   begin
      o_ptr_clx <= 5'b0                            ;
      ptr_clx_r <= 5'b0                            ;
   end  
   else 
   begin
      ptr_clx_r <= i_ptr                           ;
      o_ptr_clx <= ptr_clx_r                       ;
   end
end

endmodule
