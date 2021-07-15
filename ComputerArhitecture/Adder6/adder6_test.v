`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:14:23 10/31/2020
// Design Name:   adder6
// Module Name:   D:/Anul3/AC/Tema/Tema0/adder6_test.v
// Project Name:  Tema0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder6
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder6_test;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [6:0] sum;

	// Instantiate the Unit Under Test (UUT)
	adder6 uut (
		.sum(sum), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 5;
		b = 28;
        
		#100;
		
		a = 30;
		b = 15;
			
			
		// Add stimulus here

	end
      
endmodule

