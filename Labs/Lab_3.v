
//
//	  Name  |  Variable  |   Location  |     PIN
//---------|------------|-------------|---------------
//	   s3   |     A      |     SW[3]   |   PIN_AC30
//	   s2   |     B      |     SW[2]   |   PIN_AB28
//	   s1   |     C      |     SW[1]   |   PIN_Y27
//	   s0   |     D      |     SW[0]   |   PIN_AB30
//	   a    |   led[0]   |   HEX0[0]   |   PIN_W17
//	   b    |   led[1]   |   HEX0[1]   |   PIN_V18
//	   c    |   led[2]   |   HEX0[2]   |   PIN_AG17
//	   d    |   led[3]   |   HEX0[3]   |   PIN_AG16
//	   e    |   led[4]   |   HEX0[4]   |   PIN_AH17
//	   f    |   led[5]   |   HEX0[5]   |   PIN_AG18
//	   g    |   led[6]   |   HEX0[6]   |   PIN_AH18
//

/*
//part b
module Lab_3(A,B,C,D,led);

	input wire A,B,C,D;
	output wire [6:0]led;

	//a = A'B'C'D + A'BC'D'
	assign led[0] = ~A&~B&~C&D | ~A&B&~C&~D;
	
	//b = AC + AB + BC'D + BCD'
	assign led[1] = A&C | A&B | B&~C&D | B&C&~D;
	
	//c = AC + AB + B'CD'
	assign led[2] = A&C | A&B | ~B&C&~D;
		
	//d = A'B'C'D + A'BC'D' + A'BCD
	assign led[3] = ~A&~B&~C&D | ~A&B&~C&~D | ~A&B&C&D;
			
	//e = A'D + B'C'D + A'BC'
	assign led[4] = ~A&D | ~B&~C&D | ~A&B&~C;

	//f = A'B'D + A'B'C + A'CD
	assign led[5] = ~A&~B&D | ~A&~B&C | ~A&C&D;

	//g = A'B'C' + A'BCD
	assign led[6] = ~A&~B&~C | ~A&B&C&D;	

endmodule
*/

/*
//part c
module Lab_3(A,B,C,D,led);

	input wire A,B,C,D;
	output wire [6:0]led;

	reg [6:0]ssd;
	
	assign led = ssd;

	always @(A,B,C,D)
	begin
		case({A,B,C,D})
		
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
		4'b1010: ssd = 7'b0000110; //E
		4'b1011: ssd = 7'b0000110; //E
		4'b1100: ssd = 7'b0000110; //E
		4'b1101: ssd = 7'b0000110; //E
		4'b1110: ssd = 7'b0000110; //E
		4'b1111: ssd = 7'b0000110; //E
		
		endcase
	
	end

endmodule
*/


//part d
module Lab_3(A,B,C,D,led);

	input wire A,B,C,D;
	output wire [6:0]led;

	reg [6:0]ssd;
	
	assign led = ssd;

	always @(A,B,C,D)
	begin
		case({A,B,C,D})
		
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
		4'b1010: ssd = 7'b0100000; //A
		4'b1011: ssd = 7'b0000011; //B
		4'b1100: ssd = 7'b1000110; //C
		4'b1101: ssd = 7'b0100001; //D
		4'b1110: ssd = 7'b0000110; //E
		4'b1111: ssd = 7'b0001110; //F
		
		endcase
	
	end

endmodule


