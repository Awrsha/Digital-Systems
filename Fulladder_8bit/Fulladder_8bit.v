//       In the name of God

// -------- (fulladder2-1bit) --------

module Hafadder(x,y,Sum,Cout);
input x,y;
output Sum,Cout;

xor(Sum,x,y);
and(Cout,x,y);

endmodule
// -------- (fulladder1-1bit) ---------

module fulladder1_1b(Cin,X,Y,Sum,Cout);
input Cin,X,Y;
output Sum,Cout;

Hafadder fA0(.x(Cin), .y(X), .Sum(w1), .Cout(w2));
Hafadder fA1(.x(w1), .y(Y), .Sum(Sum), .Cout(w3));
or(Cout,w2,w3);

endmodule

// --------------(fulladder-8bit)--------------------
module fulladder_8bit(cin,x,y,sum,cout);
input cin;
input[7:0] x,y;
output [7:0] sum;
output cout;

fulladder1_1b ful0( .Cin(cin) , .X(x[0]) , .Y(y[0]) , .Sum(sum[0]) , .Cout(cout)); // 0
fulladder1_1b ful1( .Cin(cin) , .X(x[1]) , .Y(y[1]) , .Sum(sum[1]) , .Cout(cout)); // 1
fulladder1_1b ful2( .Cin(cin) , .X(x[2]) , .Y(y[2]) , .Sum(sum[2]) , .Cout(cout)); // 2
fulladder1_1b ful3( .Cin(cin) , .X(x[3]) , .Y(y[3]) , .Sum(sum[3]) , .Cout(cout)); // 3
fulladder1_1b ful4( .Cin(cin) , .X(x[4]) , .Y(y[4]) , .Sum(sum[4]) , .Cout(cout)); // 4
fulladder1_1b ful5( .Cin(cin) , .X(x[5]) , .Y(y[5]) , .Sum(sum[5]) , .Cout(cout)); // 5
fulladder1_1b ful6( .Cin(cin) , .X(x[6]) , .Y(y[6]) , .Sum(sum[6]) , .Cout(cout)); // 6
fulladder1_1b ful7( .Cin(cin) , .X(x[7]) , .Y(y[7]) , .Sum(sum[7]) , .Cout(cout)); // 7
endmodule
// ----------TEST------------
module Test_fulladder_8bit;
reg [7:0] x,y;
reg ci;
wire cu;
wire [7:0] su;

fulladder_8bit F1(.x(x), .y(y), .cin(ci), .sum(su), .cout(cu));

initial begin 
$monitor("X= %d  Y= %d  cin= %b ===> cout= %d  sum= %d",x,y,ci,cu,su);
    x=8'd1; y=8'd8; ci=8'b0;
    #5
    x=8'd2; y=8'd8; ci=8'b0;
    #5
    x=8'd3; y=8'd8; ci=8'b0;
    #5
    x=8'd1; y=8'd8; ci=8'b1;
    #5
    x=8'd2; y=8'd8; ci=8'b1;
end
endmodule