`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:00 11/23/2020 
// Design Name: 
// Module Name:    demux 
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

module demux #(
		parameter MST_DWIDTH = 32,
		parameter SYS_DWIDTH = 8
	)(
		// Clock and reset interface
		input clk_sys,
		input clk_mst,
		input rst_n,
		
		//Select interface
		input[1:0] select,
		
		// Input interface
		input [MST_DWIDTH -1  : 0]	 data_i,
		input 						 	 valid_i,
		
		//output interfaces
		output reg [SYS_DWIDTH - 1 : 0] 	data0_o,
		output reg     						valid0_o,
		
		output reg [SYS_DWIDTH - 1 : 0] 	data1_o,
		output reg     						valid1_o,
		
		output reg [SYS_DWIDTH - 1 : 0] 	data2_o,
		output reg     						valid2_o
    );
	 
	 // data retine valoarea lui data_i; utilizat din motive de sincronizare
	 reg [MST_DWIDTH - 1 : 0] data;
	 reg [2:0] i = 0;
	 reg [2:0] j = 0;
	 //In a, b, c, d se retin cate 8 biti din semnalul data(primii 8 biti in a, urmatorii 8 biti in b s.a.m.d.)
	 reg [7 : 0] a, b, c, d;
	 
	 always @(posedge clk_mst)
	 begin
		//Initializare semnale de valid out aferente celor 3 valori din select
		valid0_o <= 0;	
		valid1_o <= 0;	
		valid2_o <= 0;	

		//Daca data_i primeste valori atunci se activeaza semnalele de valid out care depind de clk_mst
		if(data_i != 0)
		begin
			case(select)
				0: valid0_o <= 1;	
				1: valid1_o <= 1;	
				2: valid2_o <= 1;	
			endcase
		end
	end
	 
	 
	 always @(posedge clk_sys)
	 begin
		//Initializare data out pentru fiecare din cele 3 valori ale lui select
		data0_o <= 0;
		data1_o <= 0;
		data2_o <= 0;
		
		//Daca valid_i e activ, adica se primesc valori pe data_i, vom retine aceste valori in data
		if(valid_i == 1)
			data <= data_i;		
		else 
			data <= 0;
		
	
		if(data != 0 || valid0_o == 1 || valid1_o == 1 || valid2_o == 1)
		begin
			// Cu ajutorul variabilei j, se creeaza un ciclu de 4 ceasuri in care se pun in a,b,c, respectiv d
			// cate 8 biti din valoarea lui data_i deja salvat in data(aceasta etapa intermediara are loc din cauza sincronizarii)
			if(j == 0)
			begin
				a <= data[31 : 24];
				j <= j+1;
			end
			if(j == 1)
			begin
				b <= data[23 : 16];
				j <= j+1;
			end
			if(j == 2)
			begin
				c <= data[15 : 8];
				j <= j+1;
			end
			if(j == 3)
			begin
				d <= data[7 : 0];
				j <= 0;
			end		
		end
		else
		begin
			//Reinitializare variabile
			j <= 0;
			a <= 0;
			b <= 0;
			c <= 0;
			d <= 0;
		end
					
		//Abia dupa ce al doilea grup de 8 biti este "separat", putem scoate valorile salvate pe data_o in functie de valoarea lui select
		if(b != 0 || valid0_o == 1 || valid1_o == 1 || valid2_o == 1 )
		begin
			if(select == 0)
			begin
				//Ca si in cazul lui j, i va crea un ciclu de 4 ceasuri pentru a scoate pe fiecare ceas cate 8 biti
				if(i == 0)
				begin
					data0_o <= a;
					i <= i+1;
				end
				else if(i == 1)
				begin
					data0_o <= b;
					i <= i+1;
				end
				else if(i == 2)
				begin
					data0_o <= c;
					i <= i+1;
				end
				else if(i == 3)
				begin
					data0_o <= d;
					i <= 0;
				end
			end
			if(select == 1)
			begin
				if(i == 0)
				begin
					data1_o <= a;
					i <= i+1;
				end
				else if(i == 1)
				begin
					data1_o <= b;
					i <= i+1;
				end
				else if(i == 2)
				begin
					data1_o <= c;
					i <= i+1;
				end
				else if(i == 3)
				begin
					data1_o <= d;
					i <= 0;
				end
			end
			if(select == 2)
			begin
				if(i == 0)
				begin
					data2_o <= a;
					i <= i+1;
				end
				else if(i == 1)
				begin
					data2_o <= b;
					i <= i+1;
				end
				else if(i == 2)
				begin
					data2_o <= c;
					i <= i+1;
				end
				else if(i == 3)
				begin
					data2_o <= d;
					i <= 0;
				end	
			end
		end
		else i <= 0;	
	end
endmodule
