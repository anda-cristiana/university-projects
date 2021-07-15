clc; clear all; close all;

%a)
w0 = pi/23;
N = 400;
e = randn(1,N);
w = -pi: 0.01:pi;

n = 0:N-1;
x = cos(w0*n) + e;

figure(1)
stem(n,x)
title('Graficul semnalului x')
%Greu de estimat peridicitatea semnalului, esatioanele au dimensiuni
%diferire si sunt dispuse foarte apropiat,aproape se suprapun

%b)
 x1 = cos(w0*n);
 X_cos = freqz(x1,1,w);
 rx = xcorr(e,'biased');
 X_e = freqz(rx,1,w);
 X_x = X_cos + X_e;

X_x_1 = freqz(x,1,w);
dens = periodograma(X_x_1,N);
dens1 = periodograma(X_x,N);

figure(2)
plot(w,20*log10(dens))
title('Densitatea spectrala de putere a semnalului x')
xlabel('w')
ylabel('Fi_x')

figure(3)
plot(w,dens1)
title('Densitatea spectrala de putere a semnalului x(suma de TF)')
xlabel('w')
ylabel('Fi_x')

%c)
a = 5;
%Din ce am observat, pt a>5 semnalul se scufunda in zgomot 
x_a = cos(w0*n) + a*e;

rx_ae = xcorr(a*e,'biased');
X_rx_ae = freqz(rx_ae, 1, w);
X_a = X_cos + X_rx_ae;

figure(4)
plot(w, 1/N * abs(X_a).^2)
title ('Graficul densitatii spectrale de putere a semnalului ')
figure(6)
stem(n,x_a)

%d)
j = 1;
L = 100;

for i = 0.01:0.1: a
    rx_s = xcorr(cos(w0*n) + a*e,L,'biased');
    rv_e = xcorr(i*e,L,'biased');
    rx_0 = rx_s(101);
    rv_0 = rv_e(101);
    v_rv(j) = rv_0;
    v_rx(j) = rx_0;
    j = j+1;
end


for k = 1: length(v_rv)
    SNR(k) = v_rx(k)/v_rv(k);
end

figure(5)
plot(20*log10(SNR))
%raportul scade exponential cu cresterea amplitudinii


