`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:12 11/27/2020 
// Design Name: 
// Module Name:    scytale_decryption 
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
module scytale_decryption#(
			parameter D_WIDTH = 8, 
			parameter KEY_WIDTH = 8, 
			parameter MAX_NOF_CHARS = 50,
			parameter START_DECRYPTION_TOKEN = 8'hFA
		)(
			// Clock and reset interface
			input clk,
			input rst_n,
			
			// Input interface
			input[D_WIDTH - 1:0] data_i,
			input valid_i,
			
			// Decryption Key
			input[KEY_WIDTH - 1 : 0] key_N,
			input[KEY_WIDTH - 1 : 0] key_M,
			
			// Output interface
			output reg[D_WIDTH - 1:0] data_o,
			output reg valid_o,
			
			output reg busy
    );
	
	//arr - variabila in care se pot retine maxim 50 de caractere a cate 8 biti
	reg [(MAX_NOF_CHARS * D_WIDTH )-1 : 0] arr = 0;
	
	//nr - retine numarul de caractere din data_i
	reg [5 : 0] nr = 0;
	
	//pentru parcurgerea coloanelor matricii: de la 1 la key_M 
	reg [4 : 0] i = 0;
	
	//pentru parcurgerea liniilor matricii: de la 0 la key_N-1
	reg [4 : 0] counter = 0;
	
		
	always @(posedge clk)
	begin
		valid_o <= 0;
		data_o <= 0;
		//Semnalul de busy este ridicat la intalnirea lui data_i = START_DECRYPTION_TOKEN
		busy <= (data_i == START_DECRYPTION_TOKEN)? 1 : 0; 
		
		//Datele de interes sunt primite atata timp cat busy nu este activat iar acestea sunt diferite de 0 sau de 8'hfa
		if(data_i != START_DECRYPTION_TOKEN && busy == 0 && data_i != 0)
		begin
			//De fiecare data cand data_i ia o valoare, arr(care initial este 0) 
			//se shifteaza cu dimensiunea caracterului din data_i(8 biti), la care 
			//se adauga caracterul efectiv primit pe data_i, in final obtinand o concatenare a valorilor de pe data_i in biti
			arr <= (arr << 8) + data_i;  	
			nr <= nr + 1;
			i <= 0;
			counter <= 0;
		end	
		else if(busy == 1)
		begin
			busy <= 1;
			valid_o <= 1;
			
			//Zona de resetare a varibilelor
			//Daca s-au parcurs toate liniile si toate coloanele se reseteaza variabilele
			if((i == key_M) && (counter == key_N-1))
			begin
				busy <= 0;
				valid_o <= 0;
				nr <= 0;
				arr <= 0;
				i <= 0;
				counter <= 0;
				data_o <= 0;
			end
			else
			begin				
				counter <= (i == key_M)? counter+1 : counter; 
				if(counter < key_N )
				begin
					if( i == key_M && counter < key_N-1) 
						data_o <= arr[(8*nr-1) -: 8];			//elementul de pe prima coloana, ce trebuie extras la fiecare cilcu
					else
						data_o <= arr[((8*nr-1)-8*i*key_N) -: 8];		//elementele ce trebuie extrase de la coloana 2 pana la coloana key_M
						i <= (i <= key_M-1)? i+1 : 1; 
				end
				if(i == key_M-1)
				//daca se termina de parcurs o linie, se shifteaza arr cu 8 biti ca elementele de pe linia 2 sa ia pozitia celor de pe linia 1
					arr <= arr << 8;
			end			
		end
	end
endmodule
