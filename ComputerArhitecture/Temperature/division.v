`timescale 1ns / 1ps

//Modulul division are ca scop realizarea impartirii cu rest a doua numere
//Acest modul este necesar pentru realizarea mediei de temperatura (suma temperaturilor impartita la numarul de senzori activi)

//Algoritmul este preluat din sursa Wikipedia, indicata in pdf-ul aferent temei
//Integer division (unsigned) with remainder

module division(
	output reg [15:0] Q,
	output reg [15:0] R,
	input [15:0] N,
	input [15:0] D);
	
	
	reg[4:0] i;
	always @(*) 
	begin
		i = 0;
		Q = 0; //catul si restul se initializeaza cu 0
		R = 0;
		for(i = 16 ; i >= 1; i = i-1) //Spre deosebire de algoritmul de pe Wikipedia, for-ul pleaca de la valoarea 16 egala cu numarul de biti ai lui N,										
		begin									//nu de la n-1 = 15, din cauza conditiilor impuse de declararea variabilei i pe 5 biti si nu de tip integer	
			R = R << 1; //R se shifteaza la stanga  cu 1 bit
			R[0] = N[i-1]; //Bit-ul de tip LSB din R este egalat cu bit-ul i-1 din N  
			if(R >= D)    //Verificam daca Restul este mai mare sau egal decat impartitorul
			begin
				R = R - D; //daca da, noul rest ia valoarea diferentei dintre rest si impartitor
				Q[i-1] = 1; //Bit-ul de pe pozitia i-1 din Q ia valoarea 1
			end
		end
	end		
endmodule
