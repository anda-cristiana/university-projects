%Consideram pentru toate cele 4 subpuncte Ts = 1
Ts = 1;

%Punctul a)
w1 = pi/15;

%Din formula w = (2*k*pi)/N (1.7) putem afla N(perioada semnalului discret)
% N/k = (2*pi) / w => N/k = (2*pi)/ (pi/15) = 30
% Cum N apartine multimii nr naturale\{0} => k=1
N1 = (2*pi)/ w1;
%Perioda semnalului este 30, determinata atat teoretic cat si practic
n1 = 0:89;

sin_disc1 = esantionare(w1,Ts,90);

t1 = 0:0.001:90;
sin_cont1 = sin(w1*t1);

figure(1)
grafic(t1,sin_cont1,n1,sin_disc1)
title('Punctul a)')
xlabel('t1, respectiv n')
ylabel('sin((pi/15)*w), respectiv sin((pi/15)*n)')
grid on
% Se observa ca unei perioade a semnalului continual ii corespunde o
% perioada a semnalului discret(k = 1)


%Punctul b)
w2 = (3*pi) /15;

%Din formula w = (2*k*pi)/N (1.7) putem afla N(perioada semnalului discret)
% N/k = (2*pi) / w => N/k = (2*pi)/ (3*pi/15) = 10
% Cum N apartine multimii nr naturale\{0} => k=1
N2 = (2*pi)/w2;
%Perioda semnalului este 10, determinata atat teoretic cat si practic
n2 = 0:19;

sin_disc2 = esantionare(w2,Ts,20);

t2 = 0:0.01:20;
sin_cont2 = sin(w2*t2);

figure(2)
grafic(t2,sin_cont2,n2,sin_disc2)
title('Punctul b)')
xlabel('t1, respectiv n')
ylabel('sin((pi/15)*w), respectiv sin((pi/15)*n)')
grid on
%Cum k = 1 => unei perioade a semnalului continuu ii corespunde o perioada
%a semnalului dicret


%Voi alege w = 7*pi/2 pentru a obtine o valoare a lui k != 1
%Pt w =7*pi/2 => N/k = 2*pi/ (7*pi/2) = 4/7
%Cum N este un numar natural nenul => k = 7
w21 = 7*pi/2;
k21 = 7;
N21 = (2*k21*pi) / w21;
%Perioada semnalului considerat de mine este N21 = 4
n21 = 0: 15;

sin_disc21 = esantionare(w21,Ts,16);

t21 = 0:0.001:16;
sin_cont21 = sin(w21*t21);

figure(3)
grafic(t21,sin_cont21,n21,sin_disc21)
xlabel('t21, respectiv n21')
ylabel('sin((7*pi/2)*w), respectiv sin((7*pi/2)*n)')
grid on
%Din grafic se observa ca unei perioade a semnalului discret ii corespunde
%k=7 perioade ale semnalului continuu


%c)
% Daca w = 1 => N/k = (2*pi)/ w = 2*pi(Irational, deci semnalul este aperiodic)
w3 = 1;
n3 = 0: 12-1;

sin_disc3 = esantionare(w3,Ts,12);

t3 = 0:0.001:12;
sin_cont3 = sin(w3*t3);

figure(4)
grafic(t3,sin_cont3,n3,sin_disc3)
title('Punctul c)')
xlabel('t, respectiv n')
ylabel('sin(t), respectiv sin(n)')
grid on


%d)
w5 = pi/3; % => perioada semnalului este N = 6 , k = 1
w6 = 2*pi + pi/3; % perioada semnalului este N = 6, k = 7

t56 = 0:0.001:12;
sin_cont5 = sin(w5*t56);
sin_cont6 = sin(w6*t56);

x5 = esantionare(w5,Ts,12);
x6 = esantionare(w6,Ts,12);
n5 = 0:11;

figure(5)
grafic(t56,sin_cont5,n5,x5)
title('Punctul d) w = pi/3')
ylabel('sin((pi/3)*t), respectiv sin((pi/3)*n)')
xlabel('t, respectiv n')
grid on
figure(6)
grafic(t56,sin_cont6,n5,x6)
title('Punctul d) w = 2*pi + pi/3')
ylabel('sin((2*pi + pi/3)*t), respectiv sin((2*pi + pi/3)*n)')
xlabel('t, respectiv n')
grid on
%Chiar daca cele doua sinusoide continue sunt diferite(din cauza w1 si
%w2) semnalele dicrete obtinute prin esantionare sunt identice deoarece
%cele doua semnale au aceeasi perioada (N = 6), dar k difera in cele doua
%cazuri (k=1 in cazul in care w = pi/3, iar k = 7 in cazul w = 2*pi+pi/3)