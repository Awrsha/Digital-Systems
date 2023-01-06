//       In the name of God

// -------- (mux2to1 1bit) --------
module Mux2to1_1b(i1,i0,sel,f);
input i1,i0,sel;
output f;
not(nsel,sel);
and(w1,nsel,i0);
and(w2,sel,i1);
or(f,w1,w2);
endmodule
// -------- (mux4to1 1bit) ---------

module Mux4to1_1b(i3,i2,i1,i0,sel1,sel0,f);
input i3,i2,i1,i0,sel1,sel0;
output f;
Mux2to1_1b mux0( .i1(i1) , .i0(i0) , .sel(sel0) , .f(w1) );
Mux2to1_1b mux1( .i1(i3) , .i0(i2) , .sel(sel0) , .f(w2) );
Mux2to1_1b mux2( .i1(w2) , .i0(w1) , .sel(sel1) , .f(f) );
endmodule

// --------------(mux4to1 8bit)--------------------
module Mux4to1_8bit(i3,i2,i1,i0,sel1,sel0,f);
input sel1,sel0;
input [7:0] i3,i2,i1,i0;
output [7:0] f;
Mux4to1_1b mux0( .i3(i3[0]) , .i2(i2[0]) , .i1(i1[0]) , .i0(i0[0]) , .sel1(sel1) , .sel0(sel0) , .f(f[0]) ); // 0
Mux4to1_1b mux1( .i3(i3[1]) , .i2(i2[1]) , .i1(i1[1]) , .i0(i0[1]) , .sel1(sel1) , .sel0(sel0) , .f(f[1]) ); // 1
Mux4to1_1b mux2( .i3(i3[2]) , .i2(i2[2]) , .i1(i1[2]) , .i0(i0[2]) , .sel1(sel1) , .sel0(sel0) , .f(f[2]) ); // 2
Mux4to1_1b mux3( .i3(i3[3]) , .i2(i2[3]) , .i1(i1[3]) , .i0(i0[3]) , .sel1(sel1) , .sel0(sel0) , .f(f[3]) ); // 3
Mux4to1_1b mux4( .i3(i3[4]) , .i2(i2[4]) , .i1(i1[4]) , .i0(i0[4]) , .sel1(sel1) , .sel0(sel0) , .f(f[4]) ); // 4
Mux4to1_1b mux5( .i3(i3[5]) , .i2(i2[5]) , .i1(i1[5]) , .i0(i0[5]) , .sel1(sel1) , .sel0(sel0) , .f(f[5]) ); // 5
Mux4to1_1b mux6( .i3(i3[6]) , .i2(i2[6]) , .i1(i1[6]) , .i0(i0[6]) , .sel1(sel1) , .sel0(sel0) , .f(f[6]) ); // 6
Mux4to1_1b mux7( .i3(i3[7]) , .i2(i2[7]) , .i1(i1[7]) , .i0(i0[7]) , .sel1(sel1) , .sel0(sel0) , .f(f[7]) ); // 7
endmodule
// ----------TEST------------
module Test_mux4to1_8bit;
reg [7:0] a,b,c,d;
reg e,f;
wire [7:0] x;

Mux4to1_8bit M1( .i3(a) , .i2(b) , .i1(c) , .i0(d) , .sel1(e) , .sel0 (f) , .f(x));

initial begin 
$monitor("i3= %b i2= %b i1= %b i0= %b || sel1= %b sel0= %b ==> f = %b",a,b,c,d,e,f,x);
    a = 8'd2; b = 8'd5; c = 8'd6; d = 8'd7; e = 1'b0; f = 1'b0; //000000
    #5
    a = 8'd2; b = 8'd5; c = 8'd6; d = 8'd7; e = 1'b0; f = 1'b1; //000000
    #5
    a = 8'd2; b = 8'd5; c = 8'd6; d = 8'd7; e = 1'b1; f = 1'b0; //000000
    #5
    a = 8'd2; b = 8'd5; c = 8'd6; d = 8'd7; e = 1'b1; f = 1'b1; //000000

end
endmodule