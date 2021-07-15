`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:49 11/23/2020 
// Design Name: 
// Module Name:    decryption_regfile 
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
module decryption_regfile #(
			parameter addr_witdth = 8,
			parameter reg_width 	 = 16,
			parameter depth = 4 
		)(
			// Clock and reset interface
			input clk, 
			input rst_n,
			
			// Register access interface
			input[addr_witdth - 1:0] addr, 
			input read, 
			input write, 
			input [reg_width -1 : 0] wdata, 
			output reg [reg_width -1 : 0] rdata, 
			output reg done, 
			output reg error, 
			
			// Output wires
			output reg[reg_width - 1 : 0] select,
			output reg[reg_width - 1 : 0] caesar_key,
			output reg[reg_width - 1 : 0] scytale_key,
			output reg[reg_width - 1 : 0] zigzag_key
    );

	reg [reg_width - 1 : 0] regs[depth-1:0]; 
	//bancului de registre 
	//parametrul depth = numarul de registre (4) (definit in lista de parametrii)
	//parametrul reg_width = capacitatea de stocare a fiecarui registru (16 biti)
	
	reg [2:0] i;
		
	always @(posedge clk or negedge rst_n)	//verificare asincrona a lui rst_n
	begin
		
		// daca rst_n = 0 atunci in cele 4 registre se va retine valoarea de reset specificata
		if(!rst_n)  
		begin
			for(i=0; i<depth; i=i+1)
			begin
				case(i)
					0: regs[i] <= 16'h0; 
					1: regs[i] <= 16'h0;
					2: regs[i] <= 16'hffff;
					3: regs[i] <= 16'h2;
				endcase
			end	
		end
		
		else 
		begin
			// Daca nu se solicita scrierea sau citirea, semnalele done, error, rdata nu sunt activate
			if(write == 0 && read == 0)
			begin
				done <= 0;
				error <= 0;
				rdata <= 0;
			end
			
		// Scrierea in registre;
		//	Scrierea se realizeaza daca se activeaza semnalul write(=1) si read = 0
			//Se verifica daca adresa la care se doreste scrierea exista;
			// Daca DA, atunci in registrul al carei adrese unice a fost specificata, se vor introduce datele(wdata)
			// Daca NU, atunci se ridica semnalul de error
			// Odata cu scrierea datelor in registre, se activeaza semnalul done
			if((write) && (!read))
			begin
				case(addr)
					8'h0: 
						begin
						regs[0] <= wdata;
						done <= 1;
						end
					
					8'h10: 
						begin
						regs[1] <= wdata;
						done <= 1;
						end
					
					8'h12:
						begin
						regs[2] <= wdata;
						done <= 1;
						end
					
					8'h14:
						begin
						regs[3] <= wdata;
						done <= 1;
						end
					
					default:
						begin	
						done  <= 1; // Daca adresa nu exista, done si error se activeaza
						error <= 1;
						end
				endcase
			end
		
			//Citirea din registre;
			//Se permite citirea din registre dodar daca semnalul de read este activat
				// Analog cazului scrierii, se verifica daca adresa de la care se doreste citirea este valida
				// Daca DA, in rdata se retine valoarea din registrul specificat prin adresa si se activeaza semnalul done
			if((!write) && (read))
			begin
				case(addr)
					8'h0: 
						begin
						rdata <= regs[0][1:0]; // din select_register se retin numai bitii [1:0], restul sunt ignorati
						done <= 1;
						end
					8'h10: 
						begin
						rdata <= regs[1];
						done <= 1;
						end
					
					8'h12:
						begin
						rdata <= regs[2];
						done <= 1;
						end
					
					8'h14:
						begin
						rdata <= regs[3];
						done <= 1;
						end
					
					default:
						begin
						done <= 1; //Daca adresa de la care se doreste citirea nu exista, se activeaza semnalele done si error 
						error <= 1;
						end
				endcase
			end
		end
	end
	
	
	// Transmiterea valorilor din registre spre output-urile aferente
	//	Cheile de iesire iau o noua valoare de fiecare data cand semnalele regs[0],regs[1],regs[2],regs[3] se schimba
	always @(regs[0],regs[1],regs[2],regs[3])
	begin
		for(i=0; i<depth; i = i+1)
		begin
		//Pe cheile de iesire se transmit valorile din registre
			case(i)
			0: select = regs[i][1:0];
			1: caesar_key = regs[i];
			2: scytale_key = regs[i];
			3: zigzag_key = regs[i];
			endcase
		end	
	end 
	
endmodule
