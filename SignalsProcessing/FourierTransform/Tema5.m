clc; clear all; close all;
N1 = 400;
N2 = 500;
N3 = 600;
w = -pi:0.01:pi;


e1 = randn(1,N1);
e2 = randn(1,N2);
e3 = randn(1,N3);

rx1 = xcorr(e1,'biased'); %calculam auto-corelatia semnalului deoarece functia randn genereaza un semnal nedeterminist 
rx2 = xcorr(e2,'biased');
rx3 = xcorr(e3,'biased');

X1 = freqz(rx1,1,w);
X2 = freqz(rx2,1,w);
X3 = freqz(rx3,1,w);


fi_e1 = periodograma(X1,N1);
fi_e2 = periodograma(X2,N2);
fi_e3 = periodograma(X3,N3);

figure(1)
plot(w,fi_e1)
title('Grafic densitatea spectrala de putere pt e1')

figure(2)
plot(w,fi_e2)
title('Grafic densitatea spectrala de putere pt e2')

figure(3)
plot(w,fi_e3)
title('Grafic densitatea spectrala de putere pt e3')

%Se observa ca nicio frecvennta nu este favorizata, acest lucru fiind
%cauzat de slaba calitate a periodogramei