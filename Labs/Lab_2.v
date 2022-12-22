
module Lab_2(a,b,c,d,out,e,f,g,h,i);

	input a, b, c, d;        //a = LEDR[0]
									 //b = LEDR[1]
									 //c = LEDR[2]
									 //d = LEDR[3]
									 
	output out,e,f,g,h,i;    //out = LEDR[9]

	
	assign e=a;              //assigning switches e,f,g,h
	assign f=b;              //to leds a,b,c,d to show the      
	assign g=c;              // code running on the board
	assign h=d;
	assign i=out;

	
	assign out = (a & b & c & ~d); //boolean expression of the circuit


endmodule




module Lab_2(a,b,c,d,out,e,f,g,h,key,key_state,LED_5);

	input a, b, c, d, key; //inputs of leds and pushbutton
									 
	output reg e, f, g, h; //regesiters outputs of leds
	output reg out;		  //regesiters outputs of output
	output reg key_state;  //regesiters outputs of pushbutton 
	output reg LED_5;      //regesiters outputs of LED[5]
		
	always @*
	begin
		if (key_state == 0)	//when the pushbutton is not pressed, run the code	
			begin
				e=a;           //assign switches to leds
				f=b;
				g=c;
				h=d;
				LED_5 = 0;     //led off shows that pushbutton is not pressed
				out = (a & b & c & ~d); //display output on board
			end
		else if (key_state == 1) //when the pushbutton is pressed, clear board
			begin
				out = 0;    //clear output from board
				e = 0;      //clear leds from board
				f = 0;
				g = 0;
				h = 0;
				LED_5 = 1;  //led on shows that pushbutton is pressed
			end
	end
			
	
	always @(negedge key)       					//restart loop inverts the pushbutton state
	begin                       					//displays the output if it was off
		if (key_state == 0) key_state = 1;
		else if (key_state == 1) key_state = 0;
	end
	
endmodule


/*
module Lab_2(a,b,c,d,out);
 
	input a, b, c, d;
	output out;

	assign out = (a & b & c & ~d); //boolean expression of the circuit

endmodule
*/


