`timescale 1ns / 1ps

//Primul modul creat: sensors_input in cadrul caruia se verifica cati senzori sunt activi, dupa care se realizeaza suma temperaturilor
//indicate de acesti senzori 


module sensors_input( temp_sum_o, nr_active_sensors_o,sensors_data_i,sensors_en_i);
	
	parameter width = 5; 
	
	output reg[15:0] temp_sum_o;
	output	reg[7:0] nr_active_sensors_o;
	input [8*width - 1:0] sensors_data_i; //initializare variabile cu ajutorul parametrului astfel incat structura lor sa fie reconfigurabila
	input [width - 1:0] sensors_en_i;
	
	integer i; 
	always @(*)begin
		i = 0;  
		temp_sum_o = 0; //Cele 2 variabile care vor retine suma temperaturilor, respectiv cati senzori sunt activi, sunt initializate cu 0
		nr_active_sensors_o = 0;
		
		for(i = 0; i < width ; i = i+1) //parcurgem bitii  variabilei sensors_en_i
		begin
			if(sensors_en_i[i] == 1)
			begin
			nr_active_sensors_o = nr_active_sensors_o + sensors_en_i[i];
			temp_sum_o = temp_sum_o + sensors_data_i[8*i +: 8]; // in suma se adauga valoarea temperaturii senzorului activ, pentru a selecta cei 8 biti aferenti senzorului activ 
			end																//	se foloseste operatorul +: care permite selectarea bitilor pornind de la o anumita valoare initiala (8*i) si ajungand la ultimul bit selectat
																				// datorita precizarii lungimii sirului de biti pe care ne dorim sa-l selectam.(8)
		end
	end		
endmodule
