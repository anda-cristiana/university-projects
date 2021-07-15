%% Raspunsurile la impuls si in frecventa ale ferestrelor uzuale
clc;
clear;
close all;
%% Subpunctul a)
M = 16;

% Fereastra dreptunghiulara
w_boxcar = boxcar(M);

% Fereastra triunghiulara
w_triang = triang(M);

% Fereastra Blackman
w_Blackman = blackman(M);

% Fereastra Cebyshev
% Valori ale atenuarilor in intervalul [80, 100]dB
r1 = 80;
r2 = 90;
r3 = 100;

w_Cebyshev1 = chebwin(M,r1);
w_Cebyshev2 = chebwin(M,r2);
w_Cebyshev3 = chebwin(M,r3);

% Fereastra Hamming
w_Hamming = hamming(M);

% Fereastra Hanning
w_Hanning = hanning(M);

% Fereastra Kaiser
% Valori ale parametrului beta in intervalul [0, 10]dB
beta1 = 0;
beta2 = 3;
beta3 = 5;
beta4 = 8;
beta5 = 10;

w_Kaiser1 = kaiser(M,beta1);
w_Kaiser2 = kaiser(M,beta2);
w_Kaiser3 = kaiser(M,beta3);
w_Kaiser4 = kaiser(M,beta4);
w_Kaiser5 = kaiser(M,beta5);

% Fereastra Tukey
% Valori ale parametrului alpha in intervalul [0, 100]%
alpha1 = 0;
alpha2 = 0.2;
alpha3 = 0.5;
alpha4 = 0.7;
alpha5 = 1;

w_Tukey1 = tukeywin(M,alpha1);
w_Tukey2 = tukeywin(M,alpha2);
w_Tukey3 = tukeywin(M,alpha3);
w_Tukey4 = tukeywin(M,alpha4);
w_Tukey5 = tukeywin(M,alpha5);

%Fereastra Lanczos
% Valori ale parametrului L
L1 = 0;
L2 = 1.5;
L3 = 2;
L4 = 2.5;
L5 = 3;

w_lanczos1 = lanczos(M,L1)';
w_lanczos2 = lanczos(M,L2)';
w_lanczos3 = lanczos(M,L3)';
w_lanczos4 = lanczos(M,L4)';
w_lanczos5 = lanczos(M,L5)';

figure(1)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
stem(w_boxcar)
title("Rectangular")
hold on
subplot(3,3,2)
stem(w_triang)
title("Triangular")
hold on
subplot(3,3,3)
stem(w_Blackman)
title("Blackman")
hold on
subplot(3,3,4)
stem(w_Cebyshev1)
title(["Cebyshev: r=" sprintf("%g",r1)])
hold on
subplot(3,3,5)
stem(w_Hamming)
title("Hamming")
hold on
subplot(3,3,6)
stem(w_Hanning)
title("Hanning")
hold on
subplot(3,3,7)
stem(w_Kaiser1)
title(["Kaiser: \beta=" sprintf("%g",beta1)])
hold on
subplot(3,3,8)
stem(w_lanczos1)
title(["Lanczos: L=" sprintf("%g",L1)])
hold on
subplot(3,3,9)
stem(w_Tukey1)
title(["Tukey: \alpha=" sprintf("%g",alpha1)])
hold off

figure(2)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
stem(w_boxcar)
title("Rectangular")
hold on
subplot(3,3,2)
stem(w_triang)
title("Triangular")
hold on
subplot(3,3,3)
stem(w_Blackman)
title("Blackman")
hold on
subplot(3,3,4)
stem(w_Cebyshev2)
title(["Cebyshev: r=" sprintf("%g",r2)])
hold on
subplot(3,3,5)
stem(w_Hamming)
title("Hamming")
hold on
subplot(3,3,6)
stem(w_Hanning)
title("Hanning")
hold on
subplot(3,3,7)
stem(w_Kaiser2)
title(["Kaiser: \beta=" sprintf("%g",beta2)])
hold on
subplot(3,3,8)
stem(w_lanczos2)
title(["Lanczos: L=" sprintf("%g",L2)])
hold on
subplot(3,3,9)
stem(w_Tukey2)
title(["Tukey: \alpha=" sprintf("%g",alpha2)])
hold off

figure(3)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
stem(w_boxcar)
title("Rectangular")
hold on
subplot(3,3,2)
stem(w_triang)
title("Triangular")
hold on
subplot(3,3,3)
stem(w_Blackman)
title("Blackman")
hold on
subplot(3,3,4)
stem(w_Cebyshev3)
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
stem(w_Hamming)
title("Hamming")
hold on
subplot(3,3,6)
stem(w_Hanning)
title("Hanning")
hold on
subplot(3,3,7)
stem(w_Kaiser3)
title(["Kaiser: \beta=" sprintf("%g",beta3)])
hold on
subplot(3,3,8)
stem(w_lanczos3)
title(["Lanczos: L=" sprintf("%g",L3)])
hold on
subplot(3,3,9)
stem(w_Tukey3)
title(["Tukey: \alpha=" sprintf("%g",alpha3)])
hold off

figure(4)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
stem(w_boxcar)
title("Rectangular")
hold on
subplot(3,3,2)
stem(w_triang)
title("Triangular")
hold on
subplot(3,3,3)
stem(w_Blackman)
title("Blackman")
hold on
subplot(3,3,4)
stem(w_Cebyshev3)
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
stem(w_Hamming)
title("Hamming")
hold on
subplot(3,3,6)
stem(w_Hanning)
title("Hanning")
hold on
subplot(3,3,7)
stem(w_Kaiser4)
title(["Kaiser: \beta=" sprintf("%g",beta4)])
hold on
subplot(3,3,8)
stem(w_lanczos4)
title(["Lanczos: L=" sprintf("%g",L4)])
hold on
subplot(3,3,9)
stem(w_Tukey4)
title(["Tukey: \alpha=" sprintf("%g",alpha4)])
hold off

figure(5)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
stem(w_boxcar)
title("Rectangular")
hold on
subplot(3,3,2)
stem(w_triang)
title("Triangular")
hold on
subplot(3,3,3)
stem(w_Blackman)
title("Blackman")
hold on
subplot(3,3,4)
stem(w_Cebyshev3)
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
stem(w_Hamming)
title("Hamming")
hold on
subplot(3,3,6)
stem(w_Hanning)
title("Hanning")
hold on
subplot(3,3,7)
stem(w_Kaiser5)
title(["Kaiser: \beta=" sprintf("%g",beta5)])
hold on
subplot(3,3,8)
stem(w_lanczos5)
title(["Lanczos: L=" sprintf("%g",L5)])
hold on
subplot(3,3,9)
stem(w_Tukey5)
title(["Tukey: \alpha=" sprintf("%g",alpha5)])
hold off

%% Subpunctul b)
%Fereastra dreptunghiulara
w_boxcar = w_boxcar ./ sum(w_boxcar);
[F_boxcar, om_boxcar] = freqz(w_boxcar);

%Fereastra triunghiulara
w_triang = w_triang ./ sum(w_triang);
[F_triang, om_triang] = freqz(w_triang);

%Fereastra Blackman
w_Blackman = w_Blackman ./ sum(w_Blackman);
[F_Blackman, om_Blackman] = freqz(w_Blackman);

%Fereastra Cebyshev
w_Cebyshev1 = w_Cebyshev1 ./ sum(w_Cebyshev1);
[F_Cebyshev1, om_Cebyshev1] = freqz(w_Cebyshev1);

w_Cebyshev2 = w_Cebyshev2 ./ sum(w_Cebyshev2);
[F_Cebyshev2, om_Cebyshev2] = freqz(w_Cebyshev2);

w_Cebyshev3 = w_Cebyshev3 ./ sum(w_Cebyshev3);
[F_Cebyshev3, om_Cebyshev3] = freqz(w_Cebyshev3);

%Fereastra Hamming
w_Hamming = w_Hamming ./ sum(w_Hamming);
[F_Hamming, om_Hamming] = freqz(w_Hamming);

%Fereastra Hanning
w_Hanning = w_Hanning ./ sum(w_Hanning);
[F_Hanning, om_Hanning] = freqz(w_Hanning);

%Fereastra Kaiser
w_Kaiser1 = w_Kaiser1 ./ sum(w_Kaiser1);
[F_Kaiser1, om_Kaiser1] = freqz(w_Kaiser1);

w_Kaiser12 = w_Kaiser2 ./ sum(w_Kaiser2);
[F_Kaiser2, om_Kaiser2] = freqz(w_Kaiser2);

w_Kaiser3 = w_Kaiser3 ./ sum(w_Kaiser3);
[F_Kaiser3, om_Kaiser3] = freqz(w_Kaiser3);

w_Kaiser4 = w_Kaiser4 ./ sum(w_Kaiser4);
[F_Kaiser4, om_Kaiser4] = freqz(w_Kaiser4);

w_Kaiser5 = w_Kaiser5 ./ sum(w_Kaiser5);
[F_Kaiser5, om_Kaiser5] = freqz(w_Kaiser5);

% Fereastra Tukey
w_Tukey1 = w_Tukey1 ./ sum(w_Tukey1);
[F_Tukey1, om_Tukey1] = freqz(w_Tukey1);

w_Tukey2 = w_Tukey2 ./ sum(w_Tukey2);
[F_Tukey2, om_Tukey2] = freqz(w_Tukey2);

w_Tukey3 = w_Tukey3 ./ sum(w_Tukey3);
[F_Tukey3, om_Tukey3] = freqz(w_Tukey3);

w_Tukey4 = w_Tukey4 ./ sum(w_Tukey4);
[F_Tukey4, om_Tukey4] = freqz(w_Tukey4);

w_Tukey5 = w_Tukey5 ./ sum(w_Tukey5);
[F_Tukey5, om_Tukey5] = freqz(w_Tukey5);

% Fereastra Lanczos
w_lanczos1 = w_lanczos1 ./ sum(w_lanczos1);
[F_lanczos1, om_lanczos1] = freqz(w_lanczos1);

w_lanczos2 = w_lanczos2 ./ sum(w_lanczos2);
[F_lanczos2, om_lanczos2] = freqz(w_lanczos2);

w_lanczos3 = w_lanczos3 ./ sum(w_lanczos3);
[F_lanczos3, om_lanczos3] = freqz(w_lanczos3);

w_lanczos4 = w_lanczos4 ./ sum(w_lanczos4);
[F_lanczos4, om_lanczos4] = freqz(w_lanczos4);

w_lanczos5 = w_lanczos5 ./ sum(w_lanczos5);
[F_lanczos5, om_lanczos5] = freqz(w_lanczos5);

figure(6)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar, 20*log10(abs(F_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang,  20*log10(abs(F_triang)))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman,  20*log10(abs(F_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev1,  20*log10(abs(F_Cebyshev1)))
title(["Cebyshev: r=" sprintf("%g",r1)])
hold on
subplot(3,3,5)
plot(om_Hamming,  20*log10(abs(F_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning,  20*log10(abs(F_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser1,  20*log10(abs(F_Kaiser1)))
title(["Kaiser: \beta=" sprintf("%g",beta1)])
hold on
subplot(3,3,8)
plot(om_lanczos1,  20*log10(abs(F_lanczos1)))
title(["Lanczos: L=" sprintf("%g",L1)])
hold on
subplot(3,3,9)
plot(om_Tukey1,  20*log10(abs(F_Tukey1)))
title(["Tukey: \alpha=" sprintf("%g",alpha1)])
hold off

figure(7)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar,  20*log10(abs(F_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang,  20*log10(abs(F_triang)))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman,  20*log10(abs(F_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev2,  20*log10(abs(F_Cebyshev2)))
title(["Cebyshev: r=" sprintf("%g",r2)])
hold on
subplot(3,3,5)
plot(om_Hamming,  20*log10(abs(F_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning,  20*log10(abs(F_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser2,  20*log10(abs(F_Kaiser2)))
title(["Kaiser: \beta=" sprintf("%g",beta2)])
hold on
subplot(3,3,8)
plot(om_lanczos2,  20*log10(abs(F_lanczos2)))
title(["Lanczos: L=" sprintf("%g",L2)])
hold on
subplot(3,3,9)
plot(om_Tukey2,  20*log10(abs(F_Tukey2)))
title(["Tukey: \alpha=" sprintf("%g",alpha2)])
hold off

figure(8)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar,  20*log10(abs(F_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang,  20*log10(abs(F_triang)))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman,  20*log10(abs(F_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3,  20*log10(abs(F_Cebyshev3)))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming,  20*log10(abs(F_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning,  20*log10(abs(F_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser3,  20*log10(abs(F_Kaiser3)))
title(["Kaiser: \beta=" sprintf("%g",beta3)])
hold on
subplot(3,3,8)
plot(om_lanczos3,  20*log10(abs(F_lanczos3)))
title(["Lanczos: L=" sprintf("%g",L3)])
hold on
subplot(3,3,9)
plot(om_Tukey3,  20*log10(abs(F_Tukey3)))
title(["Tukey: \alpha=" sprintf("%g",alpha3)])
hold off

figure(9)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar,  20*log10(abs(F_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang,  20*log10(abs(F_triang)))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman,  20*log10(abs(F_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3,  20*log10(abs(F_Cebyshev3)))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming,  20*log10(abs(F_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning,  20*log10(abs(F_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser4,  20*log10(abs(F_Kaiser4)))
title(["Kaiser: \beta=" sprintf("%g",beta4)])
hold on
subplot(3,3,8)
plot(om_lanczos4,  20*log10(abs(F_lanczos4)))
title(["Lanczos: L=" sprintf("%g",L4)])
hold on
subplot(3,3,9)
plot(om_Tukey4,  20*log10(abs(F_Tukey4)))
title(["Tukey: \alpha=" sprintf("%g",alpha4)])
hold off

figure(10)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar, 20*log10(abs(F_boxcar)))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, 20*log10(abs(F_triang)))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman, 20*log10(abs(F_Blackman)))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3, 20*log10(abs(F_Cebyshev3)))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming, 20*log10(abs(F_Hamming)))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, 20*log10(abs(F_Hanning)))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser5, 20*log10(abs(F_Kaiser5)))
title(["Kaiser: \beta=" sprintf("%g",beta5)])
hold on
subplot(3,3,8)
plot(om_lanczos5, 20*log10(abs(F_lanczos5)))
title(["Lanczos: L=" sprintf("%g",L5)])
hold on
subplot(3,3,9)
plot(om_Tukey5, 20*log10(abs(F_Tukey5)))
title(["Tukey: \alpha=" sprintf("%g",alpha5)])
hold off

figure(11)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar,abs(F_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, abs(F_triang))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman, abs(F_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev1, abs(F_Cebyshev1))
title(["Cebyshev: r=" sprintf("%g",r1)])
hold on
subplot(3,3,5)
plot(om_Hamming, abs(F_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, abs(F_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser1,abs(F_Kaiser1))
title(["Kaiser: \beta=" sprintf("%g",beta1)])
hold on
subplot(3,3,8)
plot(om_lanczos1,abs(F_lanczos1))
title(["Lanczos: L=" sprintf("%g",L1)])
hold on
subplot(3,3,9)
plot(om_Tukey1, abs(F_Tukey1))
title(["Tukey: \alpha=" sprintf("%g",alpha1)])
hold off

figure(12)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar, abs(F_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, abs(F_triang))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman, abs(F_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev2, abs(F_Cebyshev2))
title(["Cebyshev: r=" sprintf("%g",r2)])
hold on
subplot(3,3,5)
plot(om_Hamming, abs(F_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, abs(F_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser2,abs(F_Kaiser2))
title(["Kaiser: \beta=" sprintf("%g",beta2)])
hold on
subplot(3,3,8)
plot(om_lanczos2,abs(F_lanczos2))
title(["Lanczos: L=" sprintf("%g",L2)])
hold on
subplot(3,3,9)
plot(om_Tukey2,abs(F_Tukey2))
title(["Tukey: \alpha=" sprintf("%g",alpha2)])
hold off

figure(13)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar,abs(F_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, abs(F_triang))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman, abs(F_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3, abs(F_Cebyshev3))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming, abs(F_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, abs(F_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser3, abs(F_Kaiser3))
title(["Kaiser: \beta=" sprintf("%g",beta3)])
hold on
subplot(3,3,8)
plot(om_lanczos3,abs(F_lanczos3))
title(["Lanczos: L=" sprintf("%g",L3)])
hold on
subplot(3,3,9)
plot(om_Tukey3, abs(F_Tukey3))
title(["Tukey: \alpha=" sprintf("%g",alpha3)])
hold off

figure(14)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar, abs(F_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, abs(F_triang))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman,abs(F_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3,abs(F_Cebyshev3))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming, abs(F_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, abs(F_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser4, abs(F_Kaiser4))
title(["Kaiser: \beta=" sprintf("%g",beta4)])
hold on
subplot(3,3,8)
plot(om_lanczos4, abs(F_lanczos4))
title(["Lanczos: L=" sprintf("%g",L4)])
hold on
subplot(3,3,9)
plot(om_Tukey4, abs(F_Tukey4))
title(["Tukey: \alpha=" sprintf("%g",alpha4)])
hold off

figure(15)
title("Raspunsurile la impuls ale celor 9 ferestre")
subplot(3,3,1)
plot(om_boxcar, abs(F_boxcar))
title("Rectangular")
hold on
subplot(3,3,2)
plot(om_triang, abs(F_triang))
title("Triangular")
hold on
subplot(3,3,3)
plot(om_Blackman, abs(F_Blackman))
title("Blackman")
hold on
subplot(3,3,4)
plot(om_Cebyshev3,abs( F_Cebyshev3))
title(["Cebyshev: r=" sprintf("%g",r3)])
hold on
subplot(3,3,5)
plot(om_Hamming, abs(F_Hamming))
title("Hamming")
hold on
subplot(3,3,6)
plot(om_Hanning, abs(F_Hanning))
title("Hanning")
hold on
subplot(3,3,7)
plot(om_Kaiser5, abs(F_Kaiser5))
title(["Kaiser: \beta=" sprintf("%g",beta5)])
hold on
subplot(3,3,8)
plot(om_lanczos5, abs(F_lanczos5))
title(["Lanczos: L=" sprintf("%g",L5)])
hold on
subplot(3,3,9)
plot(om_Tukey5, abs(F_Tukey5))
title(["Tukey: \alpha=" sprintf("%g",alpha5)])
hold off

%% Subpunct c)

% 9 - Fereastra Kaiser :
%         - control asupra lobului principal datorita parametrului beta;
%         - lob principal inalt;se poate obtine o inaltime a lobului principal de 20dB;
%         - atenuarea lobilor secundari este mare intre -50dB si -100dB.
%         
% 8 - Fereastra Cebyshev:
%         - control asupra lobului principal;
%         - amplitudinea primului lob secundar este de -100dB;
%         - atenuare mare a lobilor secundari, intre -100dB si -150dB.
% 
% 7 - Fereastra Blackman:
%         - atenuare mare a lobilor secundari;
%         - amplitudinea primului lob secundar este de -60dB.
%         
% 6 - Fereastra Hamming:
%         - lob principal inalt
%         - amplitudinea primului lob secundar aproximativ egala cu -50dB;
%         - atenuare considerabila a lobilor secundari.
% 
% 5 - Fereastra Lanczos:
%         - control asupra lobului principal;
%         - atenuare a lobilor sencundari considerabila; aproximativ -50dB pentru primul lob secundar.
%         
% 4 - Fereastra Tukey:
%         - control asupra lobului principal;
%         - atenuare buna a lobilor secundari.
% 
% 3 - Fereastra Hanning:
%         - lob principal mai ingust si mai mic;
%         - atenuarea se produce lent;
%         - amplitudinea primului lob secundar de aproximativ -31dB.
% 
% 2 - Fereastra Triunghiulara:
%         - introduce informatii la frecvente inalte din cauza rupturii de
%         derivate de ordin 1
%         - lob principal de amplitudine mica;
%         - lobi secundari cu latime mare;
%         - atenuare slaba a lobilor secundari.
% 
% 1 - Fereastra Dreptunghiulara
%         - introduce informatii la frecvente inalte din cauza rupturii de
%         derivate de ordin 1;
%         - atenuare foarte slaba a lobilor secundari
%         - diferenta mica dintre amplitudinile lobului principal si primului lob secundar