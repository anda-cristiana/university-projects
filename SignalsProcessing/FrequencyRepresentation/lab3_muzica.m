% Program pentru Laborator 3, Prelucrarea semnalelor - versiunea noua.
% (Versiunea veche a fost redenumita prin LAB3_MUZICA_2010.)
%
% Genereaza semnale "muzicale". 
% Analizati cu atentie functia MUSICAL_TONES.
%
clc; clear all; close all;

instrument = 0;
choose_pole = 1;
pol = -0.95;
zero = 1; %zero = 1 daca filtrul nu prezita zerouri; in caz contrare zero este un vector de forma [1 zero];

switch(choose_pole)
    
    case 1  
       pol = -0.75;
       
    case 2 
       pol = 0.95;
       
    case 3   
       pol = -0.1;
       
    case 4   
       pol = 0.4 + 0.6*j;
end       

[y,n,Y,f,yp] = musical_tones(instrument,zero,pol,1) ;

%% Suplimentar, introducerea unui zero

zero1 = [1 -0.9];
pol2 = -0.95;

[y,n,Y,f,yp] = musical_tones(instrument,zero1,pol2,1) ;
