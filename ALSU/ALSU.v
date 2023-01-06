//      In the name of God
//    .اجرا شود(Modelsim SE-64 2020.4) نکته : این کد سورس باید در برنامه 
//  ---------------(Arithmetic Logic Shift Unit)---------------
module ALSU(cin, a, b, s0, s1, s2, s3, f, cout, overflow);
    input [7:0] a , b;
    input cin, s0, s1, s2, s3;
    output [7:0] f;
    output cout, overflow;
    wire [7:0]f1, f2, f3, f4;
    
    arithmetic_unit8bit au( .cin(cin), .x(a), .y(b), .sel0(s0), .sel1(s1),  .f(f1), .cout(co1));
    Logic_8bit L1( .x(a) , .y(b), .sel0(s0), .sel1(s1), .f(f2));
    shift_right_unit sru0(.x(a), .cin(cin), .sel0(s0), .sel1(s1), .f(f3), .cout(co2));
    shift_left_unit sru1(.x(a), .cin(cin), .sel0(s0), .sel1(s1), .f(f4), .cout(co3), .overflow(overflow));
    
    mux4to1 mux0(.sel1(s3), .sel0(s2), .i3(f4), .i2(f3), .i1(f2), .i0(f1), .f(f));
    Mux4to1 mux1(.i3(co3) , .i2(co2) , .i1() , .i0(co1) , .sel1(s3) , .sel0(s2) , .f(cout) );
    
endmodule
    
    //  ---------------(Test Arithmetic Logic Shift Unit)---------------
  module Test_ALSU;
    reg ci, se0, se1, se2, se3; 
    reg [7:0] X, Y;
    wire co ,ov;
    wire [7:0] F;
    ALSU sru(cin(ci), a(X), b(Y), s0(se0), s1(se1), s2(se2), s3(se3), f(F), cout(co), overflow(ov));

    initial begin
       $monitor("Cin = %b || A = %b || B = %b  ==>   F = %b || cout = %b  Overflow = %b ", ci, X, Y, F, co, ov);
       
       X = 8'b00000001; Y = 8'b00000001; ci = 1'b1;
       #5
       X = 8'b00000001; Y = 8'b00000001; ci = 1'b1;
       #5
       X = 8'b00000001; Y = 8'b00000001; ci = 1'b1;
       #5
       X = 8'b00000001; Y = 8'b00000001; ci = 1'b1;
               
    end
endmodule

 //       Amirhossein khodabandeh   