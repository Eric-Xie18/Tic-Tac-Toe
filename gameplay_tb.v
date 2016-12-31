module gameplay_tb ();
reg [8:0] computer, human; 
wire [8:0] sim_out;

PlayAdjacentEdge dut(.ain(computer), .bin(human),.out(sim_out));

initial begin
//down diagonal where x plays adjacent edge
	human = 9'b100000001;
        computer = 9'b000010000;
	
#10

$display("Output is %b, we expected %b", sim_out, (9'b000001000));

//up diagonal where x plays adjacent edge
	human = 9'b001000100;
        computer = 9'b000010000;
	
#10

$display("Output is %b, we expected %b", sim_out, (9'b000001000));

//no diagonal
	human = 9'b000000100;
	computer = 9'b000010000;

#10
$display("Output is %b, we expected %b", sim_out, (9'b000000000));


#10
//empty board
	human = 9'b000000000;
	computer = 9'b000000000;

$display("Output is %b, we expected %b", sim_out, (9'b000000000));

#10
$stop;
end
endmodule
