clc; clear all; close all;
w1 = pi/8;
w2 = pi/3;
N = 250;
n = 0:(N-1);

x = cos(w1.*n) + cos(w2.*n);

%a)
figure(1)
stem(n,x)
xlabel('n')
ylabel('cos(pi/8*n) + cos(pi/3*n)')
title('Suma a doua sinusoide reale')

%Ne puteam astepta la acest grafic, datorita proprietatii de liniaritate a
%transformatei fourier putem aplica transformata primei sinusoide si apoi
%celei de-a doua, transfomata fourier a sumei celor doua o sa fie egala cu
%suma celor doua transformate aflate mai devreme; deci prin urmare, ne
%asteptam sa avem 4 varfuri pronuntate 2 asociate cu +- w1, iar celelalte
%doua cu +- w2

T1 = (2*pi)/w1;
T2 = (2*pi)/w2;
T_x = lcm(T1,T2);
%Perioada este T = 48

%b)
w = -pi : 0.01 :pi;
X = freqz(x,1,w);

figure(2)
plot(w,abs(X))
xlabel('w')
ylabel('|X(w)|')
title('Spectrul semnalului de la a)')

figure(3)
plot(w,20*log10(abs(X)))

%c)
w3 = pi/3;
w4 = pi/7;
suma = cos(w3.*n ) + 2*cos(w4.*n);

figure(4)
stem(n,suma)
xlabel('n')
ylabel('10*cos(pi/3.*n) + 3*cos(pi/7.*n)')
title('Suma a doua sinusoide cu amplitudini diferite')

T3 = (2*pi)/w3;
T4 = (2*pi)/w4;
T_suma = lcm(T3,T4);
%perioada semnalului este 42;

suma_X = freqz(suma,1,w);

figure(5)
plot(w,abs(suma_X))
xlabel('w')
ylabel('|suma_X(w)|')
title('Spectrul semnalului obtinut din insumarea a doua sinusoide cu amplitudini diferite')

figure(6)
plot(w,20*log10(abs(suma_X)))

%d)
w5 = pi/3;
w6 = pi/3 - 0.01;

suma1 = cos(w5.*n ) + 2*cos(w6.*n );


figure(7)
stem(n,suma1)
xlabel('n')
ylabel('10*cos(w5.*n ) + 3*cos(w6.*n )')
title('Suma a doua sinusoide cu amplitudini diferite')

suma_X1 = freqz(suma1,1,w);
figure(8)
plot(w,abs(suma_X1))
xlabel('w')
ylabel('|sin_X1(w)|')
title('Spectrul semnalului obtinut din insumarea a doua sinusoide cu amplitudini diferite')

figure(9)
plot(w,20*log10(abs(suma_X1)))


%Din suma celor doua sinusoide cu frecvente foarte apropiate rezulta un semnal aperiodic
%Din cauza diferentei infime dintre cele doua frecvente nu vom mai obtine
%4 linii spectrale pronuntate, ci 2 una atribuita lui w5, iar cealalta lui
%w6
