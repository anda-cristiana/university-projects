%% Filtre proiectate cu diverse ferestre
clc;
clear;
close all;
%% Subpunctul a)
M = 16;
w_c = 0.4*pi;

w_c_norm = w_c / pi;

r = 95;
beta = 9;
alpha = 0.33;
L = 1;

w_boxcar = boxcar(M);
w_triang = triang(M);
w_Blackman = blackman(M);
w_Cebyshev = chebwin(M,r);
w_Hamming = hamming(M);
w_Hanning = hanning(M);
w_Kaiser = kaiser(M,beta);
w_Tukey = tukeywin(M,alpha);
w_Lanczos = lanczos(M,L)';


fir_boxcar = fir1(M-1,w_c_norm,w_boxcar); 
fir_triang = fir1(M-1,w_c_norm,w_triang); 
fir_Blackman = fir1(M-1,w_c_norm,w_Blackman); 
fir_Cebyshev = fir1(M-1,w_c_norm,w_Cebyshev); 
fir_Hamming = fir1(M-1,w_c_norm,w_Hamming); 
fir_Hanning = fir1(M-1,w_c_norm,w_Hanning); 
fir_Kaiser = fir1(M-1,w_c_norm,w_Kaiser); 
fir_Tukey = fir1(M-1,w_c_norm,w_Tukey);
h_Lanczos = fir1(M-1,w_c_norm,w_Lanczos);

[H_boxcar, w_b] = freqz(fir_boxcar);
[H_triang, w_t] = freqz(fir_triang);
[H_Blackman, w_B] = freqz(fir_Blackman);
[H_Cebyshev, w_C] = freqz(fir_Cebyshev);
[H_Hamming, w_Hm] = freqz(fir_Hamming);
[H_Hanning, w_Hn] = freqz(fir_Hanning);
[H_Kaiser, w_K] = freqz(fir_Kaiser);
[H_Tukey, w_T] = freqz(fir_Tukey);
[H_Lanczos, w_L] = freqz(h_Lanczos);


figure(1)
title("Spectrele filtrelor formate")
subplot(3,3,1)
plot(w_b,20*log10(abs(H_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(w_t,20*log10(abs(H_triang)))
title("Triunghiular")
hold on
subplot(3,3,3)
plot(w_B,20*log10(abs(H_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(w_C, 20*log10(abs(H_Cebyshev)))
title("Cebyshev")
hold on
subplot(3,3,5)
plot(w_Hm, 20*log10(abs(H_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(w_Hn, 20*log10(abs(H_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(w_K, 20*log10(abs(H_Kaiser)))
title("Kaiser")
hold on
subplot(3,3,8)
plot(w_L, 20*log10(abs(H_Lanczos)))
title("Lanczos")
hold on
subplot(3,3,9)
plot(w_T, 20*log10(abs(H_Tukey)))
title("Tukey")
hold off

figure(2)
title("Spectrele filtrelor formate")
subplot(3,3,1)
plot(w_b,phase(H_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(w_t,phase(H_triang))
title("Triunghiular")
hold on
subplot(3,3,3)
plot(w_B,phase(H_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(w_C,phase(H_Cebyshev))
title("Cebyshev")
hold on
subplot(3,3,5)
plot(w_Hm,phase(H_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(w_Hn, phase(H_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(w_K, phase(H_Kaiser))
title("Kaiser")
hold on
subplot(3,3,8)
plot(w_L/pi,phase(H_Lanczos))
title("Lanczos")
hold on
subplot(3,3,9)
plot(w_T, phase(H_Tukey))
title("Tukey")
hold off

% Dupa analiza atenuarii lobilor secundari, amplitudinea primului lob
% secundar si ultimului lob secundar, dar si latimea si inaltimea lobului
% principal, putem constata ca se respecta clasamentul realizat la Faza1 
% Subpunct c); astfel ca printre cele mai bune ferestre pe care le putem
% utiliza se afla Kaiser, Cebyshev, iar printre cele mai slabe sunt
% ferestrele triunghiulare si dreptunghiulare
%% Subpunctul b)
M1 = 24;
M2 = 32;
w_Blackman_24 = blackman(M1+1);
w_Blackman_32 = blackman(M2+1);

fir_Blackman_24 = fir1(M1,w_c_norm,w_Blackman_24);
fir_Blackman_32 = fir1(M2,w_c_norm,w_Blackman_32);

[H_Blackman_24, w_B24] = freqz(fir_Blackman_24);
[H_Blackman_32, w_B32] = freqz(fir_Blackman_32);

figure(3)
subplot(3,1,1)
plot(w_B, 20*log10(abs(H_Blackman)))
title("Spectru filtru fereastra Blackman M = 16")
hold on
subplot(3,1,2)
plot(w_B24, 20*log10(abs(H_Blackman_24)))
title("Spectru filtru fereastra Blackman M = 24")
hold on
subplot(3,1,3)
plot(w_B32, 20*log10(abs(H_Blackman_32)))
title("Spectru filtru fereastra Blackman M = 32")
hold off

figure(4)
subplot(3,1,1)
plot(w_B, phase(H_Blackman))
title("Faza filtru fereastra Blackman M = 16")
hold on
subplot(3,1,2)
plot(w_B24, phase(H_Blackman_24))
title("Faza filtru fereastra Blackman M = 24")
hold on
subplot(3,1,3)
plot(w_B32, phase(H_Blackman_32))
title("Faza filtru fereastra Blackman M = 32")
hold off

% Cresterea lui M aduce o mai buna rezolutie de reprezentare
% Daca M creste - latimea lobului principal scade implicit zona de tranzitie 
% a filtrului, iar suprafata de subv lobii secundari ramane constanta