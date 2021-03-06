`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:08 11/23/2020 
// Design Name: 
// Module Name:    ceasar_decryption 
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
module caesar_decryption#(
				parameter D_WIDTH = 8,
				parameter KEY_WIDTH = 16
			)(
			// Clock and reset interface
			input clk,
			input rst_n,
			
			// Input interface
			input[D_WIDTH - 1:0] data_i,
			input valid_i,
			
			// Decryption Key
			input[KEY_WIDTH - 1 : 0] key,
			
			// Output interface
			output reg[D_WIDTH - 1:0] data_o,
			output reg valid_o,
			output reg busy
    );

	always @(posedge clk)
	begin
		busy <= 0; // semnalul busy este 0 pe tot parcursul procesului
		valid_o <= 0; // valid_o ia valoarea zero cat timp valid_i = 1
		data_o <= 0;
		
		//Daca se primesc date pe intrare, atunci pe iesire se trimit datele decriptate
		// scazand din data de intrare, cheia de decriptare
		if(data_i != 0) 
		begin
			data_o <= data_i - key; 
			valid_o <= 1;	//cat timp datele sunt decriptate, semnalul valid_i ia valoarea 1	
		end
		
	end				
endmodule
