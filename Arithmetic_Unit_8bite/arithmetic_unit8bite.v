//     In the name of God

module mux4to1 (sel1, sel0, i3, i2, i1, i0, f);
input sel1, sel0, i3, i2, i1, i0;
output f;
not(ns0, sel0);
not(ns1, sel1);
and(w0, ns1, ns0, i0);
and(w1, ns1, sel0, i1);
and(w2, sel1, ns0, i2);
and(w3, sel1, sel0, i3);
or(f, w0, w1, w2, w3);
endmodule

//-------------------------------------
module full_adder (x, y, cin, cout, sum);
    input x, y, cin;
    output cout, sum;
    xor(sum, x, y, cin);
    and(w1, x, y);
    and(w2, x, cin);
    and(w3, y, cin);
    or(cout, w1, w2, w3);
endmodule    
    
//-------------------------------------
module mux2to1(sel, i1, i0, f);
    input sel, i1, i0;
    output f;
    not(nsel, sel);
    and(w1, nsel, i0);
    and(w2, sel, i1);
    or(f, w1, w2);
endmodule

//-------------------------------------
module mux2to1_8bit (sel, i1, i0, f);
    input sel;
    input [7:0] i1, i0;
    output [7:0] f;
    mux2to1 m0(.sel(sel), .i1(i1[0]), .i0(i0[0]), .f(f[0]));
    mux2to1 m1(.sel(sel), .i1(i1[1]), .i0(i0[1]), .f(f[1]));
    mux2to1 m2(.sel(sel), .i1(i1[2]), .i0(i0[2]), .f(f[2]));
    mux2to1 m3(.sel(sel), .i1(i1[3]), .i0(i0[3]), .f(f[3]));
    mux2to1 m4(.sel(sel), .i1(i1[4]), .i0(i0[4]), .f(f[4]));
    mux2to1 m5(.sel(sel), .i1(i1[5]), .i0(i0[5]), .f(f[5]));
    mux2to1 m6(.sel(sel), .i1(i1[6]), .i0(i0[6]), .f(f[6]));
    mux2to1 m7(.sel(sel), .i1(i1[7]), .i0(i0[7]), .f(f[7]));
endmodule   
    
//------------------------------------- 
module full_adder_8bit (x, y, cin, cout, sum);
    input cin;
    input [7:0] x, y;
    output cout;
    output [7:0] sum; 
    full_adder fl0(.x(x[0]), .y(y[0]), .cin(cin), .cout(c0), .sum(sum[0]));
    full_adder fl1(.x(x[1]), .y(y[1]), .cin(c0), .cout(c1), .sum(sum[1]));
    full_adder fl2(.x(x[2]), .y(y[2]), .cin(c1), .cout(c2), .sum(sum[2]));
    full_adder fl3(.x(x[3]), .y(y[3]), .cin(c2), .cout(c3), .sum(sum[3]));
    full_adder fl4(.x(x[4]), .y(y[4]), .cin(c3), .cout(c4), .sum(sum[4]));
    full_adder fl5(.x(x[5]), .y(y[5]), .cin(c4), .cout(c5), .sum(sum[5]));
    full_adder fl6(.x(x[6]), .y(y[6]), .cin(c5), .cout(c6), .sum(sum[6]));
    full_adder fl7(.x(x[7]), .y(y[7]), .cin(c6), .cout(cout), .sum(sum[7]));
endmodule 

//------------------------------------- 
module mux4to1_8bit (sel1, sel0, i3, i2, i1, i0, f);
    input sel1 , sel0;
    input [7:0] i3, i2, i1, i0;
    output [7:0] f; 
    mux4to1 mu0(.sel1(sel1), .sel0(sel0), .i3(i3[0]), .i2(i2[0]), .i1(i1[0]), .i0(i0[0]), .f(f[0]));
    mux4to1 mu1(.sel1(sel1), .sel0(sel0), .i3(i3[1]), .i2(i2[1]), .i1(i1[1]), .i0(i0[1]), .f(f[1]));
    mux4to1 mu2(.sel1(sel1), .sel0(sel0), .i3(i3[2]), .i2(i2[2]), .i1(i1[2]), .i0(i0[2]), .f(f[2]));
    mux4to1 mu3(.sel1(sel1), .sel0(sel0), .i3(i3[3]), .i2(i2[3]), .i1(i1[3]), .i0(i0[3]), .f(f[3]));
    mux4to1 mu4(.sel1(sel1), .sel0(sel0), .i3(i3[4]), .i2(i2[4]), .i1(i1[4]), .i0(i0[4]), .f(f[4]));
    mux4to1 mu5(.sel1(sel1), .sel0(sel0), .i3(i3[5]), .i2(i2[5]), .i1(i1[5]), .i0(i0[5]), .f(f[5]));
    mux4to1 mu6(.sel1(sel1), .sel0(sel0), .i3(i3[6]), .i2(i2[6]), .i1(i1[6]), .i0(i0[6]), .f(f[6]));
    mux4to1 mu7(.sel1(sel1), .sel0(sel0), .i3(i3[7]), .i2(i2[7]), .i1(i1[7]), .i0(i0[7]), .f(f[7]));
endmodule 

//------------------------------------- 
module arithmetic_unit8bit (sel1, sel0, x, y, cin, cout, f);
    input sel1, sel0, cin;
    input [7:0] x, y;
    output cout;
    output [7:0] f;
    wire [7:0] w0, w1, w2, w3, ny, f_mux21;
    not (ny[0], y[0]);
    not (ny[1], y[1]);
    not (ny[2], y[2]);
    not (ny[3], y[3]);
    not (ny[4], y[4]);
    not (ny[5], y[5]);
    not (ny[6], y[6]);
    not (ny[7], y[7]);
    not (ncin, cin);
    full_adder_8bit fl0(.x(x), .y(8'b00000000), .cin(cin), .cout(c0), .sum(w0));
    full_adder_8bit fl1(.x(x), .y(y), .cin(cin), .cout(c1), .sum(w1));
    full_adder_8bit fl2(.x(x), .y(ny), .cin(ncin), .cout(c2), .sum(w2));
    full_adder_8bit fl3(.x(x), .y(8'b11111111), .cin(1'b0), .cout(c3), .sum(w3));
    mux2to1_8bit mu0(.sel(cin), .i1(y), .i0(w3), .f(f_mux21));
    mux4to1_8bit mu1(.sel1(sel1), .sel0(sel0), .i3(f_mux21), .i2(w2), .i1(w1), .i0(w0), .f(f));
    mux4to1 mu2(.sel1(sel1), .sel0(sel0), .i3(c3), .i2(c2), .i1(c1), .i0(c0), .f(cout));
endmodule  

//------------------------------------- 
module test_arithmetic_unit8bit;
    reg s1, s0, ci;
    reg [7:0] a, b;
    wire co;
    wire [7:0] q;
    arithmetic_unit8bit au(.sel1(s1), .sel0(s0), .x(a), .y(b), .cin(ci), .cout(co), .f(q));
    initial begin
    $monitor("Sel = %b | Sel0 = %b | Cin = %b | X = %d | Y = %d =====> Cout = %b | F = %d", s1, s0, ci, a, b, co, q);
    a = 8'd32; b=8'd16;
    s1 = 1'b0;  s0 = 1'b0;  ci = 1'b0;
    #5
    s1 = 1'b0;  s0 = 1'b0;  ci = 1'b1;
    #5
    s1 = 1'b0;  s0 = 1'b1;  ci = 1'b0;
    #5
    s1 = 1'b0;  s0 = 1'b1;  ci = 1'b1;
    #5
    s1 = 1'b1;  s0 = 1'b0;  ci = 1'b0;
    #5
    s1 = 1'b1;  s0 = 1'b0;  ci = 1'b1;
    #5
    s1 = 1'b1;  s0 = 1'b1;  ci = 1'b0;
    #5
    s1 = 1'b1;  s0 = 1'b1;  ci = 1'b1;
    end
endmodule

//Amirhossein Khodabandeh