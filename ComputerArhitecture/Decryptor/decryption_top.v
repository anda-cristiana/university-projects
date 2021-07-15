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

module decryption_top#(
			parameter addr_witdth = 8,
			parameter reg_width 	 = 16,
			parameter MST_DWIDTH = 32,
			parameter SYS_DWIDTH = 8
		)(
		// Clock and reset interface
		input clk_sys,
		input clk_mst,
		input rst_n,
		
		// Input interface
		input [MST_DWIDTH -1 : 0] data_i,
		input 						  valid_i,
		output busy,
		
		//output interface
		output [SYS_DWIDTH - 1 : 0] data_o,
		output      					 valid_o,
		
		// Register access interface
		input[addr_witdth - 1:0] addr,
		input read,
		input write,
		input [reg_width - 1 : 0] wdata,
		output[reg_width - 1 : 0] rdata,
		output done,
		output error
		
    );
	 // Firele care conecteaza regfile-ul de restul modulelor implementate
	 wire [reg_width - 1 : 0] select;
	 wire [reg_width - 1 : 0] caesar_key;
	 wire [reg_width - 1 : 0] scytale_key;
	 wire [reg_width - 1 : 0] zigzag_key;
	
	//Fire care conecteaza iesirile DEMUX-ului de modulele de decriptare
	wire [SYS_DWIDTH - 1 : 0] data0_o; //Caesar
	wire [SYS_DWIDTH - 1 : 0] data1_o; //Scytale
	wire [SYS_DWIDTH - 1 : 0] data2_o; //ZigZag
	
	wire valid0_o; 
	wire valid1_o;
	wire valid2_o;
	
	//Fire de legatura dintre output-ul fiecraui modul de decriptare si MUX
	wire [SYS_DWIDTH - 1 : 0] dataC_o;
	wire [SYS_DWIDTH - 1 : 0] dataS_o;
	wire [SYS_DWIDTH - 1 : 0] dataZ_o;
	
	//Semnale de validare specifice fiecarui modul de decriptare
	wire validC_o;
	wire validS_o;
	wire validZ_o;
	
	//Semnalele de busy de la fiecare model de decriptare care sunt trecute printr-o poarta OR pentru a da semnalul de busy al sistemului
	wire busyC;
	wire busyS;
	wire busyZ;
	
	decryption_regfile R(clk_sys, rst_n, addr, read, write, wdata, rdata, done, error, select, caesar_key, scytale_key, zigzag_key);
	demux D(clk_sys, clk_mst, rst_n, select[1 : 0], data_i, valid_i, data0_o, valid0_o, data1_o, valid1_o, data2_o, valid2_o);
	
	caesar_decryption Caesar(clk_sys, rst_n, data0_o, valid0_o, caesar_key, dataC_o, validC_o, busyC);
	scytale_decryption Scytale(clk_sys, rst_n, data1_o, valid1_o, scytale_key[15:8], scytale_key[7:0], dataS_o, validS_o, busyS);
	zigzag_decryption ZigZag(clk_sys, rst_n, data2_o, valid2_o, zigzag_key[7:0], dataZ_o, busyZ, validZ_o);
	
	mux M(clk_sys, rst_n, select[1 : 0], data_o, valid_o, dataC_o, validC_o, dataS_o, validS_o, dataZ_o, validZ_o );
	
	or(busy, busyC, busyS, busyZ);
	
	

endmodule
