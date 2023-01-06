//   In the name of God
//  ---------------(shift right unit)---------------
module mux4to1(sel0, sel1, i0, i1, i2, i3, f);

    input sel0, sel1, i0, i1, i2, i3;
    output f;

    not(ns0, sel0);
    not(ns1, sel1);
    and(w0, ns1, ns0, i0);
    and(w1, nsl, sel0, i1);
    and(w2, sel1, ns0, i2);
    and(w3, sel1, sel0, i3);
    or(f, w0, w1, w2, w3);

endmodule

//  ---------------(shift right unit 8bit)---------------
module shift_left_unit(sel0, sel1, x, cin, f, cout, overflow);

    input sel0, sel1, cin;
    input [7:0] x;
    output cout, overflow;
    output [7:0] f;
    xor(q,x[6],x[7]);
    mux4to1 mx0(.i0(x[0]), .i1(x[0]), .i2(x[0]), .i3(x[0]), .sel0(sel0), .sel1(sel1), .f(f[1]));
    mux4to1 mx1(.i0(x[1]), .i1(x[1]), .i2(x[1]), .i3(x[1]), .sel0(sel0), .sel1(sel1), .f(f[2]));
    mux4to1 mx2(.i0(x[2]), .i1(x[2]), .i2(x[2]), .i3(x[2]), .sel0(sel0), .sel1(sel1), .f(f[3]));
    mux4to1 mx3(.i0(x[3]), .i1(x[3]), .i2(x[3]), .i3(x[3]), .sel0(sel0), .sel1(sel1), .f(f[4]));
    mux4to1 mx4(.i0(x[4]), .i1(x[4]), .i2(x[4]), .i3(x[4]), .sel0(sel0), .sel1(sel1), .f(f[5]));
    mux4to1 mx5(.i0(x[5]), .i1(x[5]), .i2(x[5]), .i3(x[5]), .sel0(sel0), .sel1(sel1), .f(f[6]));
    mux4to1 mx6(.i0(x[6]), .i1(x[6]), .i2(x[6]), .i3(x[6]), .sel0(sel0), .sel1(sel1), .f(f[7]));
    mux4to1 mx7(.i0(1'b0), .i1(x[7]), .i2(cin), .i3(1'b0), .sel0(sel0), .sel1(sel1), .f(f[0]));
    mux4to1 mx8(.i0(), .i1(), .i2(x[7]), .i3(), .sel0(sel0), .sel1(sel1), .f(cout));
    mux4to1 mx9(.i0(), .i1(), .i2(), .i3(q), .sel0(sel0), .sel1(sel1), .f(overflow));

endmodule

//  ---------------(Test shift right unit 8bit)---------------
module test_shift_left_unit;

    reg ci, s0, s1;
    reg [7:0] a;
    wire co ,ov;
    wire [7:0] f;
    
    shift_left_unit sru(.x(a), .cin(ci), .sel0(s0), .sel1(s1), .f(f), .cout(co), .overflow(ov));

    initial begin
       $monitor("x = %b || cin = %b || sel0 = %b || sel1 = %b  ==>   f = %b || cout = %b  Overflow = %b ", a, ci, s0, s1, f, co, ov);
       
       a = 8'b001; ci = 1'b1;
       #5
       s1 = 1'b0; s0 = 1'b0;
       #5
        s1 = 1'b0; s0 = 1'b1;
       #5
        s1 = 1'b1; s0 = 1'b0;
       #5
        s1 = 1'b1; s0 = 1'b1;
        
    end
endmodule