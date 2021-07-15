load sunet_a.mat
load sunet_i.mat
load sunet_s.mat
load xilo.mat

[a,Fe_a] = audioread('sunet_a.au');
[i,Fe_i] = audioread('sunet_i.au');
[s,Fe_s] = audioread('sunet_s.au');
[x,Fe_x] = audioread('xilo.wav');


%a)Durata semnalelor sonore

info_a = audioinfo('sunet_a.au');
%Duration 'a': 0.0626 s
info_i = audioinfo('sunet_i.au');
%Duration 'i': 0.0876 s
info_s = audioinfo('sunet_s.au');
%Duration 's': 0.1126 s
info_x = audioinfo('xilo.wav');
%Duration 'xilo': 0.2927 s


%b)
t = 0:0.01:10;
omega = 1;
x_a = sin(omega*t);

figure(1)
plot(t,x_a)
title('Semnal sinusoidal continual')
xlabel('t')
ylabel('sin(t)')
grid on

M = 10 ; %lungimea suportului semnalului
%Fs = 8000;
Ts = 1; %perioada de esantionare
x = esantionare(omega,Ts,M);
num = 0: M-1; %suportul semnalului discret obtinut mai sus

figure(2)
stem(num,x)
title('Semnal sinusoidal esantionat')
xlabel('num')
ylabel('sin(num)')
grid on


%c)
t1 = 0:0.1:12;
%omega1 = pi/3;
omega1 = pi/3;
M1 = 13;
n = 0:(M1-1);
Ts1 = 1;

sin_cont = sin(omega1 * t1);
sin_discret = esantionare(omega1,Ts,M1);

figure(3)
grafic(t1,sin_cont,n,sin_discret)
title('Grafic sinusoida continua si sinusoida discretizata')
xlabel('t, respectiv n')
ylabel('sin((pi/3)*t), respectiv sin((pi/3)*n)')
grid on