`timescale 1ns / 1ps

// Modulul output_display are ca scop aproximarea mediei si codificarea sa

module output_display(
	output reg[7:0] coded_out_o,
	output reg alert_o,
	input [15:0] temp_Q_i,
	input [15:0] temp_R_i,
	input [7:0] active_sensors_nr);
	
	
	reg[15:0] final_temp; //se ia o variabila auxiliara in care se va retine valoarea dupa aproximare a mediei
	integer i; 

	always @(*)
	begin
	final_temp = 0;
	i = active_sensors_nr - temp_R_i - temp_R_i; 	// in variabila i de tip integer se retine conditia pentru stabilirea conditiei de aproximare
																	// i = numarul de senzori(impartitorul) - 2*restul
	if(temp_Q_i >= 18 && temp_Q_i <= 26)	 //Verificam daca catul ia valori intre [18,26] deci poate fi aproximat in intervalul [19,26]
	begin		
		if(i <= 0)	 // Am observat ca daca valoarea lui i este mai mica sau egala cu 0, adica valoarea restului se afla la jumatate sau depaseste jumatatea intervalului de resturi asociate unui impartitor atunci rezultatul poate fi aproximat superior
		begin
			final_temp = temp_Q_i + 1; 	// in cazul in care conditia de mai sus este indeplinita, valoarea mediei se aproximeaza la limita superioara
		end	
		else begin 
			final_temp = temp_Q_i; 	//in caz contrar, se aproximeaza la limita inferioara
		end
	end
		
	else begin 
		final_temp = temp_Q_i; 	//in cazul in care catul nu se afla in intervalul precizat in prima conditie, valoarea aproximata a mediei este chiar valoarea catului
	end

	if(final_temp < 19)  	// daca valoarea temperaturii medii dupa aproximare este strict mai mica decat 19
	begin 
	alert_o = 1;  	//setam alarma la 1(nu este in intervalul precizat)
	coded_out_o = 1; 	//valoarea codata este egala cu 1
	end
	
	if(final_temp > 26) 	//Analog, daca valoarea dupa aproximare este mai mare decat 26
	begin 
	alert_o = 1;
	coded_out_o = 255;
	end 
				
	case(final_temp) 	//in cadrul case-ului se codifica raspunsul in functie de valoarea temperaturii medii dupa aproximare si se seteaza alarma la 0(inactiv, deoarece se afla in interiorul intervalului cerut)
		
		19: begin
			 coded_out_o = 1;
			 alert_o = 0;	
			 end
			 
		20: begin
			 coded_out_o = 3;
			 alert_o = 0;
			 end
			 
		21: begin
			 coded_out_o = 7;
			 alert_o = 0;
			 end
			 
		22: begin
			 coded_out_o = 15;
			 alert_o = 0;
			 end
			 
		23: begin
			 coded_out_o = 31;
			 alert_o = 0;
			 end
			 
		24: begin
			 coded_out_o = 63;
			 alert_o = 0;
			 end
			 
		25: begin
			 coded_out_o = 127;
			 alert_o = 0;
			 end
			 
		26: begin
			 coded_out_o = 255;
			 alert_o = 0;
			 end
endcase
end

endmodule
