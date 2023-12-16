module tb_alu_verilog();

reg s0, s1;
reg [3:0]A,B;
wire [3:0]SAS;
wire [3:0]a_and_b;
wire CAS, a_greater_b, aeqb, b_greater_a;

alu_verilog uut(
    .s0(s0),
    .s1(s1),
    .A(A),
    .B(B),
    .SAS(SAS),
    .CAS(CAS),
    .a_greater_b(a_greater_b),
    .aeqb(aeqb),
    .b_greater_a(b_greater_a),
    .a_and_b(a_and_b)
);

initial begin
   $dumpfile("alu_project.vcd");
   $dumpvars(0, tb_alu_verilog);
    
    s0 = 0; s1 = 0;
    A = 4'b0101; 
    B = 4'b1111; 
    #10;
    $display("s0=%b, s1=%b, A=%b, B=%b, SAS=%b, CAS = %b", s0, s1, A, B, SAS,CAS);
    #10 
    // s0 = 0; s1 = 0;
    // A = 4'b0101; 
    // B = 4'b1111;
    // #10;
    //  $display("s0=%b, s1=%b, A=%b, B=%b, SAS=%b, CAS = %b", s0, s1, A, B, SAS,CAS);
    // #10;

    s0 = 1; s1 = 0;
    A = 4'b0101; 
    B = 4'b1111;
    #10;
     $display("s0=%b, s1=%b, A=%b, B=%b, SAS=%b, CAS = %b", s0, s1, A, B, SAS,CAS);
    #10
    // s0 = 1; s1 = 0;
    // A = 4'b0001;
    // B = 4'b0010;
    // #10;
    //  $display("s0=%b, s1=%b, A=%b, B=%b, SAS=%b, CAS = %b", s0, s1, A, B, SAS,CAS);

    s0 = 0; s1 = 1;
    A = 4'b0101; 
    B = 4'b1111;
    #10;
    $display("s0=%b, s1=%b, A=%b, B=%b, a_greater_b=%b, aeqb=%b, b_greater_a=%b", s0, s1, A, B, a_greater_b, aeqb, b_greater_a);
    // #10;
    // s0 = 0; s1 = 1;
    // A = 4'b0001; 
    // B = 4'b0010;
    // #10;
    // $display("s0=%b, s1=%b, A=%b, B=%b, a_greater_b=%b, aeqb=%b, b_greater_a=%b", s0, s1, A, B, a_greater_b, aeqb, b_greater_a);
    // #10;
    // s0 = 0; s1 = 1;
    // A = 4'b0100; 
    // B = 4'b0100;
    // #10;
    // $display("s0=%b, s1=%b, A=%b, B=%b, a_greater_b=%b, aeqb=%b, b_greater_a=%b", s0, s1, A, B, a_greater_b, aeqb, b_greater_a);
    // #10
    s0 = 1; s1 = 1;
    A = 4'b0101; 
    B = 4'b1111;
    #10;
    $display("s0=%b, s1=%b, A=%b, B=%b, a_and_b=%b", s0, s1, A, B, a_and_b); 

    $finish;
  end
endmodule 