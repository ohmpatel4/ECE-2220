
module Lab_5(
	input [3:0]x,
	input [3:0]y,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3,               //inputs of all HEX displays
	output [6:0]HEX4,
	output [6:0]HEX5
	);
  
	wire c0,c1,c2,c3,c4,c5;        //wires used in the circuit
	wire cout;
	wire cin;
	wire [4:0]s;                   //array for the 4-dgit sum
	wire [4:0]a,b,q;               //arrays for adding two 4-dgit bin numbers
	wire [3:0]x1,x0,y1,y0,s1,s0;   //arrays for displaying numbers
	
	
	assign cin = 0;
	
	fulladder m1(x,y,cin,s,c3);    //calling fulladder module


	assign s[4]=c3;
	
	assign a = {cin,x};            //adding two 4-dgit bin numbers into one
	assign b = {cin,y};
	assign q = {cout,s};
	
	BINtoBCD (a,x1,x0);            //turning binary number to BCD of tens and ones
	displayOutput(x1,HEX1[6:0]);   //displaying the BCD on the seven segment display
	displayOutput(x0,HEX0[6:0]);
	
	BINtoBCD (b,y1,y0);
	displayOutput(y1,HEX3[6:0]);
	displayOutput(y0,HEX2[6:0]);
	
	BINtoBCD (q,s1,s0);
	displayOutput(s1,HEX5[6:0]);
	displayOutput(s0,HEX4[6:0]);
		
	
endmodule


/////////////////////////////////////////////////


module displayOutput(hexDigit,led);        //module from Lab 3 for displaying seven segment display

	input wire [3:0]hexDigit;
	output wire [6:0]led;

	reg [6:0]ssd;
	
	assign led = ssd;

	always @(hexDigit)
	begin
		case({hexDigit})
		
		4'b0000: ssd = 7'b1000000; //0
		4'b0001: ssd = 7'b1111001; //1
		4'b0010: ssd = 7'b0100100; //2
		4'b0011: ssd = 7'b0110000; //3
		4'b0100: ssd = 7'b0011001; //4
		4'b0101: ssd = 7'b0010010; //5
		4'b0110: ssd = 7'b0000010; //6
		4'b0111: ssd = 7'b1111000; //7
		4'b1000: ssd = 7'b0000000; //8
		4'b1001: ssd = 7'b0010000; //9
		default: ssd = 7'b1111111; //default off
		
		endcase
	
	end

endmodule


/////////////////////////////////////////////////


module BINtoBCD(x,x1,x0);               //module for turning BIN to BCD

input [4:0]x;
output reg [3:0]x0;
output reg [3:0]x1;

always @*
	begin
	if (x>=30)     //If number is great than 30 then the tens is 3 and ones is the last digit
		begin
			x0=x-30;
			x1 = 3;
		end

	else if (x>=20)     //If number is great than 20 then the tens is 3 and ones is the last digit
		begin
			x0=x-20;
			x1 = 2;
		end
		
	else if (x>=10)     //If number is great than 20 then the tens is 3 and ones is the last digit
		begin
			x0=x-10;
			x1 = 1;
		end
		
	else if (x>=0)     //If number is great than 0 then the tens is 0 and ones is the digit
		begin
			x0=x;
			x1=10;       //Given a number greater than 9 to show blank output
		end
	end

endmodule


/////////////////////////////////////////////////


module halfadder( a, b, cin, sum , cout );      //module of a half adder from Lab 3 used in the fulladder module

	input a, b, cin;
	output sum, cout;

	wire w0,w1,w2;

	xor u0(w0,a,b);
	xor u1(sum,w0,cin);
	and u2(w1,cin,w0);
	and u3(w2,a,b);
	or u4(cout,w1,w2);

endmodule

/////////////////////////////////////////////////


module fulladder(                 //module of the full adder to add two numbers togther
	input [3:0]x,y, 
	input cin,
	output [3:0]s, 
	output cout
	);
	
	wire w1,w2,w3;
	
	halfadder h1(x[0],y[0],cin,s[0],w1);
	halfadder h2(x[1],y[1],w1,s[1],w2);
	halfadder h3(x[2],y[2],w2,s[2],w3);
	halfadder h4(x[3],y[3],w3,s[3],cout);
	

endmodule


