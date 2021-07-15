`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:04 11/23/2020 
// Design Name: 
// Module Name:    zigzag_decryption 
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
module zigzag_decryption #(
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
			input[KEY_WIDTH - 1 : 0] key,
			
			// Output interface
			output reg[D_WIDTH - 1:0] data_o,
			output reg busy,
			output reg valid_o
    );
	reg [(MAX_NOF_CHARS * D_WIDTH )-1 : 0] arr = 0;;
	reg [7 : 0] nr = 0;
	reg [7 : 0] mid = 0;
	reg [1:0] carry;
	reg [7 : 0] i = 0;
	reg [7 : 0] j = 0;
	reg [7 : 0] k = 0;
	reg [7 : 0] counter = 0;
	reg ok;

	always @(posedge clk)
	begin
	
		data_o <= 0;
		valid_o <= 0;
		busy <= 0;
		
		if(data_i != START_DECRYPTION_TOKEN && busy == 0 && data_i != 0)
		begin
			arr <= (arr << 8) + data_i;  	
			nr <= nr + 1;
			i <= 0;
			j <= 0;
			k <= 0;
			ok <= 0;
			counter <= 0;
		end
		else if(data_i == START_DECRYPTION_TOKEN)
		begin
			busy <= 1;
			//daca key == 2, mid va memora catul impartirii numarului de caractere la 2,
			//daca key == 3, va memora catul impartirii numarului de caractere la 4
			mid <= (key == 2)? nr >> 1 : nr >> 2; 
			carry <= (nr - 4*mid); // folosit in cazul key == 3 pentru a afla restul impartirii
			end
		else if(busy == 1 && key == 2) // CAZ KEY == 2 
		begin	
			busy <= 1;
			valid_o <= 1;
			
			//Zona de resetare a variabilelor
			if(counter == nr)
			begin
				busy <= 0;
				valid_o <= 0;
				nr <= 0;
				data_o <= 0;
				arr <= 0;
				mid <= 0;
			end
			else 
			begin	
			//Se imparte sirul de caractere in jumatate si se parcurg toate literele
			//Daca sirul contine un numar par de caractere, algoritmul se va opri la counter = 2*mid-1
			//altfel se va opri la counter = 2*mid si va pune si ultimul caracter	
				if( counter <= (2*mid)) 
				begin
					if((counter & 1) == 0) //daca counter este par  
					begin
						data_o <= arr[(8*nr-1) - 8*i -: 8]; // se scoate un element din prima jumatate
						i <= i+1;
					end
					else 
					begin
						data_o <= arr[(8*mid-1) - 8*j -: 8]; // altfel se scoate un element din a doua-a jumatate
						j<= j+1;
					end
					counter <= counter + 1; // counter se incrementeaza de fiecare data cand data_o ia o valoare
				end
			end
		end			
		else if(busy == 1 && key == 3) //CAZ KEY == 3
		begin	
			busy <= 1;
			valid_o <= 1;
			
			// variabila folosita in sincroizare, ia valoarea 0 cand se adauga un element de pe prima linie 
			// si 1 cand se adauga un element de pe a 3 a linie
			ok <= (i - k == 1)? 1:0;
			
			if(counter == nr)
			begin
				busy <= 0;
				valid_o <= 0;
				nr <= 0;
				data_o <= 0;
				arr <= 0;
				carry <= 0;
				mid <= 0;
			end
			else
			begin
				case(carry) // se verifica restul la impartirea cu 4 a numarului de caractere din sir
				
						0:	if(counter < nr)  
							begin
								if((counter & 1)  == 0) // daca counter este par atunci se adauga elemente de pe prima sau ultima linie, altfel de pe a-2a linie
								begin
									if(ok == 0)
									begin
										data_o <= arr[(8*nr - 1) - 8*i -: 8]; // se extrage element de pe prima linie
										i <= i + 1;							
									end
									else
									begin
										data_o <= arr[(8*mid - 1) - 8*k -: 8]; // se extrage element de pe a 3 a linie
										k <= k + 1;
									end
								end							
								else 
								begin
									data_o <= arr[(8*(nr - mid)- 1) - 8*j -: 8]; // se extrag elementele de pe linia 2
									j <= j + 1;
								end
								counter <= counter +1;	
							end
			
						1: if(counter < nr) 
							begin
								if((counter & 1)  == 0)
								begin
									if(ok == 0)
									begin
										data_o <= arr[(8*nr - 1) - 8*i -: 8]; 
										i <= i + 1;							
									end
									else
									begin
										data_o <= arr[(8*mid - 1) - 8*k -: 8];
										k <= k + 1;
									end
								end							
								else 
								begin
									data_o <= arr[(8*(nr - mid - 1)- 1) - 8*j -: 8]; // spre deosebire de cazul in care rest = 0	,		
									j <= j + 1;													//linia a 2-a se decaleaza cu un element deoarece pe prima linie o sa apara un element in plus
								end
								counter <= counter +1;	
							end
			
						2:	if(counter < nr) 
							begin
								if((counter & 1)  == 0)
								begin
									if(ok == 0)
									begin
										data_o <= arr[(8*nr - 1) - 8*i -: 8];
										i <= i + 1;							
									end
									else
									begin
										data_o <= arr[(8*mid - 1) - 8*k -: 8];
										k <= k + 1;
									end
								end							
								else 
								begin
									data_o <= arr[(8*(nr - mid - 1)- 1) - 8*j -: 8];
									j <= j + 1;
								end
								counter <= counter +1;	
							end
			
						3:	if(counter < nr) 
							begin
								if((counter & 1)  == 0)
								begin
									if(ok == 0)
									begin
										data_o <= arr[(8*nr - 1) - 8*i -: 8];
										i <= i + 1;							
									end
									else
									begin
										data_o <= arr[(8*(mid+1) - 1) - 8*k -: 8]; // spre deosebire de cazurile precedente a 3 a linie are un element in plus
										k <= k + 1;											 //deci va incepe cu o pozitie mai devreme	
									end
								end							
								else 
								begin
									data_o <= arr[(8*(nr - mid - 1)- 1) - 8*j -: 8];
									j <= j + 1;
								end
								counter <= counter +1;	
							end 
				endcase
			end
		end
	end	
endmodule
