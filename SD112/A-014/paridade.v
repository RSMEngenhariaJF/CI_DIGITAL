module paridade (
    output  parity_out, //  8 bit data in
    input [7:0] data_in //  1 bit parity out
);

function parity;
  input [31:0] data; 
  begin
    parity = ^data_in; /*(data_in[0] ^ data_in[1]) ^  
              (data_in[2] ^ data_in[3]) ^ 
              (data_in[4] ^ data_in[5]) ^  
              (data_in[6] ^ data_in[7]);*/
  end 
endfunction 
 
      
assign parity_out = parity(data_in);

endmodule