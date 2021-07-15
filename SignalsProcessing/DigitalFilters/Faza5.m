%% 
clc;
clear;
close all;
%% Un filtru nestandard

%Initializare date de input
% caz = 1 daca dorim sa tratam cazul in care frecventa de taiere este mai aproape de 0
% caz = 2 daca dorim sa tratam cazul in care frecventa de taiere este mai aproape de pi
% caz default frecventa de taiere este egala cu pi/2

caz = 2;
switch(caz)
    case 1
        w_p = 0.1*pi;
        w_c = 0.2*pi;
        w_s = 0.3*pi;
    case 2
        w_p = 0.7*pi;
        w_c = 0.8*pi;
        w_s = 0.9*pi;
    otherwise
        w_p = 0.4*pi;
        w_c = 0.5*pi;
        w_s = 0.6*pi;
end

% M_Kaiser = 17; caz = 1
% delta_p = 0.015;
% delta_s = 0.03;

% M_Kaiser = 16  caz = 2
% delta_p = 0.04;
% delta_s = 0.05;

delta_p = 0.05;
delta_s = 0.05;

% M_Kaiser = 15 caz = otherwise
% delta_p = 0.04;
% delta_s = 0.04;

%Calcul raspuns la impuls 
M_Kaiser = 20;
w_Kaiser = kaiser(M_Kaiser+1,2);
h_Kaiser = fir1(M_Kaiser,w_c/pi, w_Kaiser);
w_Kaiser = 0: 0.01: pi;
[H_Kaiser] = freqz(h_Kaiser,1,w_Kaiser);
[delta_pr_K, delta_sr_K] = errors(h_Kaiser,w_p,w_s);
valid_K = test(delta_pr_K, delta_sr_K, delta_p, delta_s);

[M_min_Kaiser,delta_pr_K, delta_sr_K] = bestOrder(M_Kaiser,w_c,8,w_p,w_s,delta_p,delta_s);

figure(1)
plot(w_Kaiser/pi, 20*log10(abs(H_Kaiser)))
title("Filtru FTJ obtinut cu fereastra Kaiser")
ylabel("[dB]")
xlabel("\omega")

% Concluzii:
% - Daca apropiem w_c de 0, banda de trecere este mai ingusta, deci obtinem o banda de stopare mai larga, fenomenul
% Gibbs nu este foarte pronuntat, apar 2 ondulatii inaunte de panta primului lob principal;
% 
% - Daca w_c = pi/2, adica jumatate din intervalul considerat pentru filtru, capatul din dreapta fiind pi, fenomenul
% Gibbs este evident; pe primul lob principal se observa ondulatiile Gibbs;
% 
% - Daca apropiem w_c de pi, banda de trecere devine foarte larga si odata cu aceasta si ondulatiile Gibbs au o prezenta
% mult mai evidenta, sunt in numar mult mai mare decat in cazul precedent;

% Acest fenomen demonstreaza inca o data compromisul dintre calitatea si
% performanta filtrulu dat de principiul de incertitudine.
% Fenomenul Gibbs se produce ca urmare a maririi benzii de trecere, astfel
% ca energia lobilor secundari, se transfera in lobul principal dand
% nastere acestor ondulatii