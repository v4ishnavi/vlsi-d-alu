module alu_verilog(
    input s0,s1,
    input [3:0] A,B,
    output [3:0] SAS,
    output [3:0] a_and_b,
    output CAS,a_greater_b,aeqb,b_greater_a
   );

wire ns0, ns1;
wire d0, d1, d2, d3, d0d1;
wire fa0w1, fa0w2, fa0w3, fa1w1, fa1w2, fa1w3, fa2w1, fa2w2, fa2w3, fa3w1, fa3w2, fa3w3;
wire car0, car1, car2;
wire [3:0] aa, ab, cb;
wire [3:0] ba, eqab, nbb, nba, agrb, bgra, bb;
wire [3:0] da, db;


not selnot0(ns0,s0);
not selnot1(ns1,s1);
and seld0(d0, ns0, ns1);
and seld1(d1, s0, ns1);
and seld2(d2, ns0, s1);
and seld3(d3, s0, s1); 

or addsub(d0d1, d0, d1);

//enable for full adder or subtracter

and enasa0(aa[0], A[0], d0d1);
and enasa1(aa[1], A[1], d0d1);
and enasa2(aa[2], A[2], d0d1);
and enasa3(aa[3], A[3], d0d1);
and enasb0(ab[0], B[0], d0d1);
and enasb1(ab[1], B[1], d0d1);
and enasb2(ab[2], B[2], d0d1);
and enasb3(ab[3], B[3], d0d1);

//complimenting B when d1 = 1

xor compb0(cb[0], ab[0], d1);
xor compb1(cb[1], ab[1], d1);
xor compb2(cb[2], ab[2], d1);
xor compb3(cb[3], ab[3], d1);

//designing the full adders 
//full adder 0
xor ha1xor0(fa0w1, aa[0], cb[0]);
xor ha2xor0(SAS[0], fa0w1, d1);
and and01(fa0w2, fa0w1, d1);
and and02(fa0w3, aa[0], cb[0]);
or fa0or(car0,fa0w2, fa0w3);

//full adder 1
xor ha1xor1(fa1w1, aa[1], cb[1]);
xor ha2xor1(SAS[1], fa1w1, car0);
and and11(fa1w2, fa1w1, car0);
and and12(fa1w3, aa[1], cb[1]);
or fa1or(car1,fa1w2, fa1w3);

//full adder 2
xor ha1xor2(fa2w1, aa[2], cb[2]);
xor ha2xor2(SAS[2], fa2w1, car1);
and and21(fa2w2, fa2w1, car1);
and and22(fa2w3, aa[2], cb[2]);
or fa2or(car2,fa2w2, fa2w3);

//full adder 3 
//enable for comparator 
xor ha1xor3(fa3w1, aa[3], cb[3]);
xor ha2xor3(SAS[3], fa3w1, car2);
and and31(fa3w2, fa3w1, car2);
and and32(fa3w3, aa[3], cb[3]);
or fa3or(CAS,fa3w2, fa3w3);

and enca0(ba[0], A[0], d2);
and enca1(ba[1], A[1], d2);
and enca2(ba[2], A[2], d2);
and enca3(ba[3], A[3], d2);
and encb0(bb[0], B[0], d2);
and encb1(bb[1], B[1], d2);
and encb2(bb[2], B[2], d2);
and encb3(bb[3], B[3], d2);

//defining equal part of comparator 
xnor eq0(eqab[0], ba[0], bb[0]);
xnor eq1(eqab[1], ba[1], bb[1]);
xnor eq2(eqab[2], ba[2], bb[2]);
xnor eq3(eqab[3], ba[3], bb[3]);
and eqand1(aeqb,eqab[0], eqab[1], eqab[2], eqab[3]);

//inverting all inputs for later use in comparator 
not d2notb0(nbb[0], bb[0]);
not d2notb1(nbb[1], bb[1]);
not d2notb2(nbb[2], bb[2]);
not d2notb3(nbb[3], bb[3]);

not d2nota0(nba[0], ba[0]);
not d2nota1(nba[1], ba[1]);
not d2nota2(nba[2], ba[2]);
not d2nota3(nba[3], ba[3]);

//defining a > b part of comparator

and gr_a_b_3(agrb[3], ba[3], nbb[3]);
and gr_a_b_2(agrb[2], ba[2], nbb[2], eqab[3]);
and gr_a_b_1(agrb[1], ba[1], nbb[1], eqab[3], eqab[2]);
and gr_a_b_0(agrb[0], ba[0], nbb[0], eqab[3], eqab[2], eqab[1]);
or gr_a_b_or(a_greater_b, agrb[0], agrb[1], agrb[2], agrb[3]);

//defining b > a part of comparator 
and gr_b_a_3(bgra[3], bb[3], nba[3]);
and gr_b_a_2(bgra[2], bb[2], nba[2], eqab[3]);
and gr_b_a_1(bgra[1], bb[1], nba[1], eqab[3], eqab[2]);
and gr_b_a_0(bgra[0], bb[0], nba[0], eqab[3], eqab[2], eqab[1]);
or gr_b_a_or(b_greater_a, bgra[0], bgra[1], bgra[2], bgra[3]);

// AND enabling 
and enanda0(da[0], A[0], d3);
and enanda1(da[1], A[1], d3);
and enanda2(da[2], A[2], d3);
and enanda3(da[3], A[3], d3);
and enandb0(db[0], B[0], d3);
and enandb1(db[1], B[1], d3);
and enandb2(db[2], B[2], d3);
and enandb3(db[3], B[3], d3);

// AND ing 
and and0(a_and_b[0], da[0], db[0]);
and and1(a_and_b[1], da[1], db[1]);
and and2(a_and_b[2], da[2], db[2]);
and and3(a_and_b[3], da[3], db[3]);
endmodule