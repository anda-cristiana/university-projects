%% 
clc;
clear;
close all;
%% Concurs de proiectare
%Initializare date de input
M = 20;
%  w_p = 0.1*pi; % M_min = 3
%  w_c = 0.4*pi;
%  w_s = 0.9*pi;
% delta_p = 0.035;
% delta_s = 0.035;

% w_p = 0.1*pi; % M_min = 9
% w_c = 0.3*pi;
% w_s = 0.9*pi;

w_p = 0.2*pi; % M_min = 9
w_c = 0.35*pi;
w_s = 0.5*pi;
 
delta_p = 0.04;
delta_s = 0.04;
 
[M_min_Kaiser,delta_pr_K, delta_sr_K] = bestOrder(M,w_c,8,w_p,w_s,delta_p,delta_s);

w_Kaiser = kaiser(M_min_Kaiser,2);
h_Kaiser = fir1(M_min_Kaiser-1,w_c/pi, w_Kaiser);
w_Kaiser = 0: 0.01: pi;
[H_Kaiser] = freqz(h_Kaiser,1,w_Kaiser);

figure(1)
plot(w_Kaiser/pi, 20*log10(abs(H_Kaiser)))
title("Filtru FTJ obtinut cu fereastra Kaiser")
ylabel("[dB]")
xlabel("\omega")
