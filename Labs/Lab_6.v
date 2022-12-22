/*
//2a - using behavioral code
module Lab_6(A,B,C,led);
	
	input wire A,B,C;     //input 3 switches
	output wire [7:0]led; //input 8 leds
	
	//A=In2 , B=In1 , C=In0

	assign led[0] = ~A & ~B & ~C;    //boolean expressions for each led
	assign led[1] = ~A & ~B & C;     //using and and not gates
	assign led[2] = ~A & B & ~C;
	assign led[3] = ~A & B & C;
	assign led[4] = A & ~B & ~C;
	assign led[5] = A & ~B & C;
	assign led[6] = A & B & ~C;
	assign led[7] = A & B & C;
	
endmodule
*/

/*
//2b - using case statements
module Lab_6(A,B,C,led);
	
	input wire A,B,C;     //input 3 swtiches as wires
	output wire [7:0]led; //input 8 leds

	//A=In2 , B=In1 , C=In0
	
	reg [7:0]ssd;        //register since used in always block
	
	assign led = ssd;

	always @(A,B,C)
	begin
		case({A,B,C})
		
		3'b000: ssd = 8'b00000001; //0      //create 8 bit number of the corresponding leds
		3'b001: ssd = 8'b00000010; //1      //for each combination of 3 bit number from
		3'b010: ssd = 8'b00000100; //2      //truth table
		3'b011: ssd = 8'b00001000; //3
		3'b100: ssd = 8'b00010000; //4
		3'b101: ssd = 8'b00100000; //5
		3'b110: ssd = 8'b01000000; //6
		3'b111: ssd = 8'b10000000; //7

		endcase
	
	end

endmodule
*/


/*
//3b - using boolean expressions

module Lab_6(out,led);

	output wire [2:0]out;  //outputs are 3 leds
	input wire [7:0]led;   //inputs are 8 switches
	
	wire l2, l4, l5, l6, l7;  //internal wires for inputs used multiple times
	wire w0, w1, w2, w3, w4;
	
	not m0(l7,led[7]), //intializing wires used multiple times
	    m1(l6,led[6]), 
		 m2(l5,led[5]), 
		 m3(l4,led[4]), 
		 m4(l2,led[2]);
	
	and m5(w0,l6,l4,led[3]), //combing the corressponding inputs for the or gate
	    m6(w1,l5,l4,led[3]), 
		 m7(w2,l5,l4,led[2]), 
		 m8(w3,l6,led[5]), 
		 m9(w4,l6,l4,l2,led[1]);
	
	or  m11(out[2],led[7],led[6],led[5],led[4]), //using the wires and input to create the output
	    m12(out[1],led[7],led[6],w1,w2), 
		 m13(out[0],led[7],w0,w3,w4), 
		 m14(led[0],led[1],led[2],led[3],led[4],led[5],led[6],led[7]);  //input 0 does not affect the display


endmodule
*/



//3b using case statements
module Lab_6(z,out,led);
	
	input z;               //intput z as enable
	input wire [7:0]led;   //input 7 switches
	output wire [2:0]out;  //output 3 leds
	
	
	reg [2:0]ssd;  //assign reg ssd to out to use in always block
	
	assign out = ssd;

	always @(z,led)
	begin
	
		if (z == 1) //when z is high, display nothing
			begin
				ssd = 3'bxxx;
			end
		
		else  //if (z == 0) display the binary output on the 3 leds according to the 8 switches
			begin
				casex({led}) //casex used as it allows for us to enable z
				
				8'b00000001: ssd = 3'b000; //0     //case statments for each 3 bit output on leds
				8'b0000001x: ssd = 3'b001; //1     //depending on the 8 bit switch combination
				8'b000001xx: ssd = 3'b010; //2     //inlcuding the don't care states indicated by x
				8'b00001xxx: ssd = 3'b011; //3
				8'b0001xxxx: ssd = 3'b100; //4
				8'b001xxxxx: ssd = 3'b101; //5
				8'b01xxxxxx: ssd = 3'b110; //6
				8'b1xxxxxxx: ssd = 3'b111; //7		
				endcase
			end
	end

endmodule

