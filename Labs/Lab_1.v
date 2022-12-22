
/*

Lab_1

COURSE: 		ECE 2220, A01
INSTRUCTOR: Douglas Thomson
ASSIGNMENT: Lab 1	
AUTHOR:		Ohm Patel
VERSION:		September 23, 2022

PURPOSE: To learn the basics of using Verilog in Quartus II software to create, 
			simulate and implement some simple logic circuits on the DE10 standard board.
			
*/

/*
//part b

module Lab_1(x, y, f_and, f_or, f_xor);

	input x, y;
	output f_and, f_or, f_xor;

	
	and (f_and, x, y);
	or (f_or, x, y);
	xor (f_xor, x, y);
	
endmodule
*/


/*
//part e

module Lab_1( a, b, cin, sum , cout );

	input a, b, cin;
	output sum, cout;

	wire w0,w1,w2;

	xor u0(w0,a,b);
	xor u1(sum,w0,cin);
	and u2(w1,cin,w0);
	and u3(w2,a,b);
	or u4(cout,w1,w2);

endmodule
*/



///*
module Lab_1(a, b, cin, sum, cout, ssd);

	input a, b, cin;
	output sum, cout;
	output reg [0:6]ssd;
	
	wire w0,w1,w2;

	xor u0(w0,a,b);
	xor u1(sum,w0,cin);
	and u2(w1,cin,w0);
	and u3(w2,a,b);
	or u4(cout,w1,w2);

	always @*
	
	begin
		if (sum==0 && cout==0)
			ssd = 7'b0000001;		//0
	
		else if (sum==1 && cout==0)
			ssd = 7'b1001111;		//1
		
		else if (sum==0 && cout==1)
			ssd = 7'b0010010;	   //2
	
		else if (sum==1 && cout==1)
			ssd = 7'b0000110;		//3
	end
	
endmodule
//*/
