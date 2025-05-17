`timescale 1ns / 100ps

module tb_mux_4x1 ();

reg A,B,D0,D1,D2,D3;
wire Y;
reg [3:0] data;
reg [1:0] sel;
mux_4x1 DUT(
        .A(A), 
        .B(B), 
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y(Y) 
);


initial begin
   data = 4'b1111;
   sel=2'b00;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0111;
   sel=2'b00;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1011;
   sel=2'b00;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0001;
   sel=2'b00;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1100;
   sel=2'b01;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0100;
   sel=2'b01;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1010;
   sel=2'b01;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0010;
   sel=2'b01;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1111;
   sel=2'b10;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0101;
   sel=2'b10;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1001;
   sel=2'b10;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0001;
   sel=2'b10;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1110;
   sel=2'b11;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0110;
   sel=2'b11;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b1010;
   sel=2'b11;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;

   data = 4'b0000;
   sel=2'b11;
   {A,B} = sel;
   {D0,D1,D2,D3} = data;
   #5;
   $stop;

end

endmodule