/*
module Lab_7(
	input S,R,clk,
	output Q,Q_not,led0,led1,led9
	);
 
	assign led0 = R;   //R = SW[0], LEDR[0]
	assign led1 = S;   //S = SW[1], LEDR[1]
	assign led9 = clk;

	//norFF(S,R,Q,Q_not);
	//nandFF(S,R,Q,Q_not);
	//latchSR(S,R,clk,Q,Q_not);
	//latchD(S,clk,Q,Q_not,led0);
	//latchJK(R,S,clk,Q,Q_not);
	latchMS(R,S,clk,Q,Q_not);
	
endmodule

//2a
module norFF(
    input wire S, R,
    output wire Q, Q_not
	 );
	 
	 nor n0(Q,R,Q_not);
	 nor n1(Q_not,S,Q);
	 
endmodule

//2a
module nandFF(
    input wire S, R,
    output wire Q, Q_not1
	 );
	 
	 not(Sbar,S);
	 not(Rbar,R);	 
	 nand n0(Q,Sbar,Q_not);
	 nand n1(Q_not,Rbar,Q);
	 
endmodule

//2b
module latchSR(
    input S, R, clk,
    output Q, Q_not
	 );
	
	wire Rint;
	wire Sint;
	
	and n0(Rint,R,clk);
	and n1(Sint,S,clk);
	nor n2(Q,Rint,Q_not);
	nor n3(Q_not,Sint,Q);
	 
endmodule

//2c
module latchD(
	input D, clk,
   output Q, Q_not, led0
	);

   wire Dn;

	assign led0 = ~D;
	
   not(Dn, D);   
	
	latchSR s1(D,Dn,clk,Q,Q_not);
	
endmodule 

//2d
module latchJK(
	input j,k,clk,
	output q,qbar,
	output reg D
	);

	wire n1; 
	wire n2;	
	wire n3;
	
	assign led0 = j;
	assign led1 = k;
	assign led9 = clk;

//	always @(clk)
//		begin
//			D <= (j & ~q)|(q & ~k);
//		end
//	
//	latchSR(D,clk,q,qbar);
	
	and(n1,j,qbar);
	and(n2,q,~k);
	or(n3,n1,n2);
	
	latchD(n3,clk,q,qbar);

endmodule

//2e
module latchMS(
	input j,k,clk,
	output Q,Q_not,
	output reg D
	);
	
	wire n1,n2;
	
	always @(clk)
		begin
			D <= (j & ~Q)|(Q & ~k);

		end
	
	latchD m(D,clk,n1,n2); //master
	latchD s(n1,~clk,Q,Q_not); //slave

	
endmodule
*/

///////////////////////////////////////////////////////////


/*
//2a
//SR NOR FF
//S = SW[1], LEDR[1]
//R = SW[0], LEDR[0]

module Lab_7(
    input wire S, R,
    output wire Q, Q_not, led0, led1
	 );

	 assign led0 = R;   //used to assign led to input switches
	 assign led1 = S;
	 
	 nor n0(Q,R,Q_not); //modelling the gates for the latch
	 nor n1(Q_not,S,Q); //output Q_not becomes an input for the first gate n0
	 
endmodule
*/

/*
//2a
////SR NAND FF
//Sbar = SW[1], LEDR[1]
//Rbar = SW[0], LEDR[0]
module Lab_7(
    input wire S, R,
    output wire Q, Q_not, led0, led1
	 );

	 assign led0 = R;  //used to assign led to input switches
	 assign led1 = S;
	 
	 not(Sbar,S);   //inveriting inputs of S and R
	 not(Rbar,R);	 
	 nand n0(Q,Sbar,Q_not);  //modelling the gates for the latch
	 nand n1(Q_not,Rbar,Q);  //output Q_not becomes an input for the first gate n0
	 
endmodule
*/

/*
module subLab_7(
    input wire S, R, clk,
    output wire Q, Q_not, led0, led1, led9
	 );
	
	wire Rint; //intermeidate wires going into the nor gates
	wire Sint;
	
	assign led0 = R;    //used to assign led to input switches
	assign led1 = S;
	assign led9 = clk;  //led indicating clk on or off
	
	and n0(Rint,R,clk);    //modelling the gates for the latch
	and n1(Sint,S,clk);
	nor n2(Q,Rint,Q_not);
	nor n3(Q_not,Sint,Q);  //output Q_not becomes an input for the first gate n2
	 
endmodule
*/


/*
//2b
module latchSR(
    input S, R, clk,
    output Q, Q_not
	 );
	
	wire Rint;
	wire Sint;
	
	and n0(Rint,R,clk);
	and n1(Sint,S,clk);
	nor n2(Q,Rint,Q_not);
	nor n3(Q_not,Sint,Q);
	 
endmodule
*/

/*
//2c
module latchD(
	input D,
   input clk,
   output Q,
   output Q_not,
	output led0,led1,led9
	);

   wire Dn;

	assign led0 = ~D;   //used to assign led to input switches
	assign led1 = D;
	assign led9 = clk;  //led indicating clk on or off
	
   not(Dn, D);     //inverting the D input going into the SR latch 
	latchSR s1(D,Dn,clk,Q,Q_not); //calling the SR latch with D latch inputs
	
endmodule 
*/


/*
//2d
module latchJK(
	input j,k,clk,
	output q,qbar,led0,led1,led9,
	output reg D
	);

	wire n1; 
	wire n2;	
	wire n3;
	
	assign led0 = j;   //used to assign led to input switches
	assign led1 = k;
	assign led9 = clk; //led indicating clk on or off
 
	always @(clk)
		begin
			D <= (j & ~q)|(q & ~k); //sop from karnough map
		end
	
	latchSR(D,clk,q,qbar); //calling SR latch using J and K inputs for D
	
//	and(n1,j,qbar); //behavioral modelling method for the karnaugh map sop
//	and(n2,q,~k);
//	or(n3,n1,n2);
//	
//	latchD (n3,clk,q,qbar);

endmodule
*/


module Lab_7( //master-slave
	input j,k,clk,
	output q,qbar,led0,led1,led9,
	output reg D
	);
	
	wire mq,mq_not,mr,ms,sr,ss;
	
	assign led0=j;   //used to assign led to input switches
	assign led1=k;
	assign led9=clk; //led indicating clk on or off
	
	always @(clk)
		begin
			D <= (j & ~q)|(q & ~k); //continuous assignment of sop from karnough map
		end
	
	and(mr,~D,clk); //modelling the master and slave latches with behavioral moddeling
	and(ms,D,clk);  //master slave AND gates
	
	nor(mq,mr,mq_not); //ouptuts from master latch NOR gates
	nor(mq_not,ms,mq);
	
	and(sr,mq,~clk);     //outputs from master latch fed into inputs of slave latch
	and(ss,mq_not,~clk);
	
	nor(q,sr,qbar);  //outputs of slave latch is q or qbar
	nor(qbar,ss,q);
	
	// latchD d1(D,clk,n1,n2); //master      //calling latches resaulted problems on the board so 
	// latchD d2(n1,~clk,q,qbar); //slave    //behavioral moddeling was used instead
	
	
endmodule




