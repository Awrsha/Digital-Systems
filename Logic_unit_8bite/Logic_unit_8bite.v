// LOGIC UNIT 8bit

module Logic(x,y,sel1,sel0,f);
input x,y,sel1,sel0;
output f;

or(w1,x,y);
and(w2,x,y);
xor(w3,x,y);
not(w4,x);

Mux4to1 mux0(.i3(w4) , .i2(w3) , .i1(w2) , .i0(w1) , .sel1(sel1) , .sel0(sel0) , .f(f) );

endmodule

// mux2to1
module Mux2to1(i1,i0,sel,f);
input i1,i0,sel;
output f;
not(nsel,sel);
and(w1,nsel,i0);
and(w2,sel,i1);
or(f,w1,w2);
endmodule

//-------------mux4to1-------------

module Mux4to1(i3,i2,i1,i0,sel1,sel0,f);
input i3,i2,i1,i0,sel1,sel0;
output f;
Mux2to1 mux0( .i1(i1) , .i0(i0) , .sel(sel0) , .f(w1) );
Mux2to1 mux1( .i1(i3) , .i0(i2) , .sel(sel0) , .f(w2) );
Mux2to1 mux2( .i1(w2) , .i0(w1) , .sel(sel1) , .f(f) );
endmodule

// Logic 8bit
module Logic_8bit(x,y,sel1,sel0,f);
input [7:0] x,y;
input sel1,sel0;
output [7:0] f;

Logic L1( .x(x[0]) , .y(y[0]) , .sel1(sel1) , .sel0 (sel0) , .f(f[0]) );
Logic L2( .x(x[1]) , .y(y[1]) , .sel1(sel1) , .sel0 (sel0) , .f(f[1]) );
Logic L3( .x(x[2]) , .y(y[2]) , .sel1(sel1) , .sel0 (sel0) , .f(f[2]) );
Logic L4( .x(x[3]) , .y(y[3]) , .sel1(sel1) , .sel0 (sel0) , .f(f[3]) );

Logic L5( .x(x[4]) , .y(y[4]) , .sel1(sel1) , .sel0 (sel0) , .f(f[4]) );
Logic L6( .x(x[5]) , .y(y[5]) , .sel1(sel1) , .sel0 (sel0) , .f(f[5]) );
Logic L7( .x(x[6]) , .y(y[6]) , .sel1(sel1) , .sel0 (sel0) , .f(f[6]) );
Logic L8( .x(x[7]) , .y(y[7]) , .sel1(sel1) , .sel0 (sel0) , .f(f[7]) );

endmodule

// ----------TEST------------
module Test_mux4to1;
reg [7:0] a,b;
reg e,f;
wire [7:0] x;

Logic_8bit L1( .x(a) , .y(b) , .sel1(e) , .sel0 (f) , .f(x));

initial begin 
$monitor("x= %b y= %b || sel1= %b sel0= %b ==> f = %b",a,b,e,f,x);
    a = 8'b00010001; b = 8'b00100010; e = 1'b0; f = 1'b0; //00
    #5
    a = 8'b01110000; b = 8'b10001111; e = 1'b0; f = 1'b1; //01
    #5
    a = 8'b10100001; b = 8'b00001111; e = 1'b1; f = 1'b0; //10
    #5
    a = 8'b11000011; b = 8'b11110000; e = 1'b1; f = 1'b1; //11

end
endmodule