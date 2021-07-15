clc; clear all; close all;
N = 90;
n = 0:N-1;
w0 = pi/8;
w = -pi: 0.01: pi;

x = exp(j*n*w0); %semnal sinusoidal complex
X = x * exp(-j*n'*w); %Transformata Fourier a semnalului x 
X_1 = freqz(x,1,w);

figure(1)
stem(n, x)
xlabel('n')
ylabel('x[n]')
title('Reprezentare semnal armonic elementar complex')


%a)
figure(2)
plot(w, abs(X))
xlabel('w')
ylabel('|X(w)|')
title('Grafic spectru')

figure(3)
plot(w, 20*log10(abs(X)))
hold on
plot(0.38841,39.0308,'rs')
xlabel('w')
ylabel('|X(w)|_d_B')
title('Grafic spectru [dB]')
hold off
%Din figura 2 se observa ca punctul de maxim se atinge pentru w = 0.38841
%care este aproximativ egal cu w0 = pi/8 => valoarea maxima se atinge in w0

val_max = max(abs(X)); 
%valoarea maxima, atinsa la w0 

%b)
figure(4)
plot(w, abs(X_1))
hold on
xlabel('w')
ylabel('|X(w)|')
title('Graficul spectrului obtinut cu functia freqz')
%Intr-adevar graficul nu contine doar o linie spectrala cum prevede
%relatia (2.9); acest lucru are loc din cauza fenomenului de scurgere
%spectrala, care determina ca linia spectrala principala sa se raspandeasca
%in semnale mai largi

%c)
plot(w0,max(abs(X_1)),'rs')
hold off

% |H(w0)| = 0.894496 ~= N
%Daca ne raportam la teorema lui Parseval care sustine ca energia se
%conserva pana la o constanta independenta de proces => proprietatea nu
%este una normala
