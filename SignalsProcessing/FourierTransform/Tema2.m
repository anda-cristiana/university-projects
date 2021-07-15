clc; clear all; close all;
phi = pi/3;
N = 100;
n = 0:(N-1);
w0 = pi/8;

x = cos(w0.*n + phi);

%a)
w = -pi: 0.01: pi;
X = freqz(x,1,w);

figure(1)
plot(w,abs(X))
xlabel('w')
ylabel('|X(w)|')
title('Spectrul semnalului x')

figure(2)
plot(w,20*log10(abs(X)))
xlabel('w')
ylabel('|X(w)|_d_B')
title('Spectrul semnalului x in dB')

%Graficul este simetric fata de verticala, cele doua varfuri pronuntate se
%obtin in -w0, respectiv w0, conform proprietatii de simetrie

%b)
x1 = (exp(j*(w0.*n + phi)) + exp((-1)*j*(w0.*n + phi)))/2; %formula lui Euler
X1 = freqz(x1,1,w);

figure(3)
plot(w, abs(X),'b','LineWidth',3)
hold on
plot(w, abs(X1),'r','LineWidth',1)
hold off

%Cele doua grafice se suprapun perfect
% Formula lui Euler este egala cu suma a doua semnale armonice complexe ce
% dispun de acelasi grafic (au perioada identica), singura diferenta sta in
% frecventa normalizata (o armonica are frecventa normalizata pozitiva,
% cealalta negativa), fapt pus in evidenta in cadrul transformatei Fourier




%c)
phi2 = [0; pi/2; pi; 5*pi/4; 7*pi/3];

for i = 1 : 5
    x2 = cos(w0.*n + phi2(i));
    %X2 = freqz(x2,1,w);
    X2 = fft(x2,length(w));
    figure(5)
    plot(w, abs(X2))
    hold on
end 

title("Spectrul semnalului x2 pentru phi diferit" )
xlabel('w')
ylabel('|X2(w)|')
legend('0','pi/2','pi','5*pi/4','7*pi/3')
hold off    
%Spectrul nu este foarte diferit, ceea ce se schimba e diagrama fazei
