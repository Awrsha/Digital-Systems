// In the name of God

module Madar_Mantegi(A,B,C,X);
    input A,B,C,Q1,Q2,Q3,Q4;
    output X;
    
    nor(Q1,A,B);
    xor(Q2,A,B);
    nor(Q3,A,C);
    and(Q4,Q1,Q2);
    nor(X,Q4,Q3);
    
    endmodule
    
    //------------------------------
    
    module Test_Madar_Mantegi;
    reg a,b,c;
    wire X;
    
    Madar_Mantegi MM1(.A(a), .B(b), .C(c), .X(x));
    
    initial begin
      $display("   A     B     C         X");
      $display("---------------------------------");
      $monitor("   %b  |  %b  |  %b      |  %b  |",a,b,c,x);
      

            a=1'b0; b=1'b0; c=1'b0;   //000
      #5
      $display("---------------------------------");
            a=1'b0; b=1'b0; c=1'b1;   //001
      #5
      $display("---------------------------------");
            a=1'b0; b=1'b1; c=1'b0;   //010
      #5
      $display("---------------------------------");
            a=1'b0; b=1'b1; c=1'b1;   //011
      #5
      $display("---------------------------------");
            a=1'b1; b=1'b0; c=1'b0;   //100
      #5
      $display("---------------------------------");
            a=1'b1; b=1'b0; c=1'b1;   //101
      #5
      $display("---------------------------------");
            a=1'b1; b=1'b1; c=1'b0;   //110
      #5
      $display("---------------------------------");
            a=1'b1; b=1'b1; c=1'b1;   //111
      #5
      $display("---------------------------------");
      
    end
endmodule