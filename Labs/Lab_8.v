

module Lab_8(
input clk1, reset, upDown,
output rstLED, udLED, clkLED, 
output reg [3:0] LED,
output reg [3:0] count
);		

assign rstLED = reset; //show if reset on
assign udLED = upDown; //show state

slowClock(clk1,clk);

assign clkLED = clk; //show slow clock state


always @(posedge clk or posedge reset)
	begin
		
		if(reset==1) //reset when high
			count <=0;
		
		else //when reset is low
			if(upDown==1) //count up when high
				if(count==15)
					count<=0; //count up again from 0 when 15 is reached
				else
					count <= count+1; //increment count
			
			else // else if(upDown==0), count down when low
				if(count==0)
					count<=15; //count down from 15 again when 0 is reached
				else 
					count <= count-1; //increment count
		LED[3:0] = count[3:0];
	end

endmodule

module slowClock(
	input clk_in,
	output  reg clk_out
	);

	reg [27:0] period_count = 0;

	always @ (posedge clk_in)
		if (period_count != 50000000 - 1) //50 Mhz DE10 clock
			begin
				period_count <= period_count + 1;
				clk_out <= 0; 
			end  
		else
			begin
				period_count <= 0;
				clk_out <= 1;
			end
 
endmodule
