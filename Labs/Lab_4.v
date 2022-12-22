
//
//  Variable   |   Location  |     PIN
//-------------|-------------|---------------
//     w3      |   LEDR[3]   |   PIN_AD24
//     w2      |   LEDR[2]   |   PIN_AC23
//     w1      |   LEDR[1]   |   PIN_AB23
//     w0      |   LEDR[0]   |   PIN_AA24
//             |             |
//     e       |     SW[3]   |   PIN_AC30
//     f       |     SW[2]   |   PIN_AB28
//     g       |     SW[1]   |   PIN_Y27
//     h       |     SW[0]   |   PIN_AB30
//             |             |
//     s0      |     SW[8]   |   PIN_AC29
//     s1      |     SW[9]   |   PIN_AA30
//             |             |
//     out     |   LEDR[6]   |   PIN_AE24
//             |             |


/*
module Lab_4(s0,s1,w0,w1,w2,w3,out,e,f,g,h);

input s0,s1,w0,w1,w2,w3; //inputs of s0,s1 with the inputs into the AND gates
output out,e,f,g,h;
wire x,y,a,b,c,d; //wires used in the circuit

assign e=w3;    //assign swithces e,f,g,h
assign f=w2;    //to leds w3,w2,w1,w0 to show
assign g=w1;    //the code running on the board
assign h=w0;

not (x,s0),(y,s1); //assiging s0,s1 to NOT variables [!s0=x , !s1=y]
and (a,w0,x,y),(b,w1,s0,y),(c,w2,x,s1),(d,w3,s0,s1); //representing the 4 AND gates
or (out,a,b,c,d);

endmodule
*/



//
//  Variable   |   Location  |     PIN
//-------------|-------------|---------------
//     e       |   LEDR[3]   |   PIN_AD24
//     f       |   LEDR[2]   |   PIN_AC23
//     g       |   LEDR[1]   |   PIN_AB23
//     h       |   LEDR[0]   |   PIN_AA24
//             |             |
//     w3      |     SW[3]   |   PIN_AC30
//     w2      |     SW[2]   |   PIN_AB28
//     w1      |     SW[1]   |   PIN_Y27
//     w0      |     SW[0]   |   PIN_AB30
//             |             |
//     s0      |     SW[8]   |   PIN_AC29 [switched]
//     s1      |     SW[9]   |   PIN_AA30
//             |             |
//     out     |   LEDR[6]   |   PIN_AE24


/*
module Lab_4(s0,s1,w0,w1,w2,w3,out,e,f,g,h);

input wire w0,w1,w2,w3; //input wires to AND gates
input wire s0, s1; 
output reg e,f,g,h;
output reg out; //set out as a register since it is used in always loop


always @(*)
	begin
	e=w3;    //assign swithces e,f,g,h
   f=w2;    //to leds w3,w2,w1,w0 to show
   g=w1;    //the code running on the board
   h=w0;
		case ({s0,s1}) //for the cases of either s0 or s1
		2'b00: out = w0; //when both low
		2'b01: out = w1; //when s0 is high
		2'b10: out = w2; //when s1 is high
		2'b11: out = w3; //when both high
		endcase
	end

endmodule
*/


/*
module Lab_4(out,s,w);

input wire [1:0] s;
input wire [3:0] w;
output wire out;

assign out = w[s];

endmodule
*/



module Lab_4(output out,input [1:0] s,input [3:0] w);

assign out = w[s];

endmodule


