`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:30 11/26/2020 
// Design Name: 
// Module Name:    mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux #(
		parameter D_WIDTH = 8
	)(
		// Clock and reset interface
		input clk,
		input rst_n,
		
		//Select interface
		input[1:0] select,
		
		// Output interface
		output reg[D_WIDTH - 1 : 0] data_o,
		output reg						 valid_o,
				
		//output interfaces
		input [D_WIDTH - 1 : 0] 	data0_i,
		input   							valid0_i,
		
		input [D_WIDTH - 1 : 0] 	data1_i,
		input   							valid1_i,
		
		input [D_WIDTH - 1 : 0] 	data2_i,
		input     						valid2_i
    );
	
	always @(posedge clk)
	begin
	// In functie de valoarea lui select outputul sistemului va primi o valoare specifica si se va activa semnalul de valid out marcand primirea datelor
	data_o <= 0;
	valid_o <= 0;
		case(select)
			0: begin	// daca select == 0 atunci outputul sistemului primeste datele decriptate de la modulul caesar(data0_i)
				if(valid0_i != 0)
				begin
					data_o <= data0_i; 
					valid_o <= 1;
				end
				else
				begin
					data_o <= 0;
					valid_o <= 0;
				end
				end
				
			1: begin
				if(valid1_i != 0)
				begin
					data_o <= data1_i;
					valid_o <= 1;
				end
				else
				begin
					data_o <= 0;
					valid_o <= 0;
				end
				end
			2:
				begin
				if(valid2_i != 0)
				begin
					data_o <= data2_i;
					valid_o <= 1;
				end
				else
				begin
					data_o <= 0;
					valid_o <= 0;
				end
				end
		endcase
	end
endmodule
