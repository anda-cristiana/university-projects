`timescale 1ns / 1ps

//Modulul temperature_top este legatura dintre cele 3 module create

module temperature_top(led_output_o,alert_o,sensors_data_i,sensors_en_i);
	
	
	parameter width_1 = 5; //folosim parameter pentru a genera o structura reconfigurabila a inputului
	
	output [7:0] led_output_o;
	output alert_o;
	input [8* width_1 -1:0] sensors_data_i; 
   input [width_1 -1:0] sensors_en_i;
	
	
	wire [15:0] temp_sum_o;
	wire [7:0] nr_active_sensors_o;
	wire [15:0] Q;
   wire [15:0] R;
	wire [15:0] D;
	
	
	sensors_input #(.width(width_1))S(temp_sum_o, nr_active_sensors_o, sensors_data_i, sensors_en_i); //introducem valorile temperaturilor indicate de senzori si variabila care contorizeaza senzorii activi
																											 // in modulul sensors_input, care va returna suma temperaturilor afisate de senzorii activi, dar si numarul propriu-zis de sezori activi		
	
	assign D = {8'b0,nr_active_sensors_o}; // in modulul sensors_input, variabila nr_active_sensors_o care retine numarul de senzori activi, are dimensiunea de 8 biti 
														//dar pentru a o transmite modulului de division, trebuie sa aiba o dimensiune de 16 biti, astfel la aceasta variabila concatenam un sir de 8 biti de 0 
	
	division D1(Q,R,temp_sum_o,D); //modulul division primeste ca input suma temperaturilor si numarul de senzori activi calculate in modulul sensors_input si realizeaza impartirea cu cat si rest
	
	output_display O(led_output_o,alert_o,Q,R,nr_active_sensors_o); //modulul output_display realizeaza aproximarea mediei calculata in modulul division (catul) si returneaza un raspuns codificat in functie de valoarea acesteia
																						// dar si stadiul alarmei = 1(activ) / 0(inactiv)

endmodule
