// DetectWinner
// Detects whether either ain or bin has three in a row 
// Inputs:
//   ain, bin - (9-bit) current positions of type a and b
// Out:
//   win_line - (8-bit) if A/B wins, one hot indicates along which row, col or diag
//   win_line(0) = 1 means a win in row 8 7 6 (i.e., either ain or bin has all ones in this row) !
//   win_line(1) = 1 means a win in row 5 4 3 !
//   win_line(2) = 1 means a win in row 2 1 0 !
//   win_line(3) = 1 means a win in col 8 5 2 !
//   win_line(4) = 1 means a win in col 7 4 1 !
//   win_line(5) = 1 means a win in col 6 3 0 !
//   win_line(6) = 1 means a win along the downward diagonal 8 4 0 !
//   win_line(7) = 1 means a win along the upward diagonal 2 4 6

module DetectWinner( input [8:0] ain, bin, output [7:0] win_line );
  // CPEN 211 LAB 3, PART 1: your implementation goes here

   wire [7:0] winx, wino;

   // insantiation of two different modules for wins to determine if an 
   // input wins the game
	wins winain(ain, winx);
	wins winbin(bin, wino);

    // Or the two ouputs together and see if there is a winner for the game
	assign win_line = winx|wino;
endmodule

module wins(input [8:0]in, output reg [7:0] win);
     
	// Whenever the input changes value, check if the input wins the game at
        // a particular position
        // if there is no winner, outpus 8 bits 0s.
	always @(in)begin
		casex(in)
		9'b111xxxxxx: win = 8'b00000001;
		9'bxxx111xxx: win = 8'b00000010;
		9'bxxxxxx111: win = 8'b00000100;
		9'b1xx1xx1xx: win = 8'b00001000;
		9'bx1xx1xx1x: win = 8'b00010000;
		9'bxx1xx1xx1: win = 8'b00100000;
		9'b1xxx1xxx1: win = 8'b01000000;
		9'bxx1x1x1xx: win = 8'b10000000;
	default : win = 8'b00000000;
  endcase
end


endmodule
