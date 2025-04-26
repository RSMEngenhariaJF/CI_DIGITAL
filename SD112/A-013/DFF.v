/*primitive DFF(q,clk,rst,D);
    output q;
    input clk, rst,D;
    

    reg q;
    
    table
        //clk  rst  D     Q_ant   Q_prox
          ?     1   ?  :   ?   :   0;
          ?     0   ?  :   1   :   1;
          ?     0   ?  :   0   :   0;
          (01)  0   0  :   ?   :   0;
          (01)  0   1  :   ?   :   1;
          (1x)  0   ?  :   ?   :   -;
          (x1)  0   ?  :   ?   :   -;
    endtable
endprimitive*/

primitive d_ff (q, clock, reset, d);
  
  output reg q;
  input clock, reset, d;

 
  initial q = 0;
  table
      //clk    rst    d  :  q  :  q_next
        ?       1     ?  :  ?  :  0; // reset condition
        ?      (10)   ?  :  ?  :  -; // ignoring negative transiton of reset
    
      (10)      0     1  :  ?  :  1; // q = data
      (10)      0     0  :  ?  :  0; // q = data

      (1x)      0     ?  :  ?  :  -; // for unknown clock transition, hold previous state of q
    
      (0?)      0     ?  :  ?  :  -; // ignoring positive transiton of clock
      (x1)      0     ?  :  ?  :  -; // ignoring positive transiton of clock
    
       ?        0   (??) :  ?  :  -; // ignoring changes in d for no changes in clock
  endtable
endprimitive