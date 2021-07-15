%a)
L=9;

N0 = 20;
N1 = 200;
N2 = 20000;

x0 = randn(1,N0);
x1 = randn(1,N1);
x2 = randn(1,N2);

media0 = mean(x0);
media1 = mean(x1);
media2 = mean(x2);
%Se poate observa ca media obtinuta este foarte aproape de 0, deci randn
%verifica o prima conditie de generare a unui semnal asemanator zgomotului
%alb(1)

rx0 = xcorr(x0,L,'biased');
rx1 = xcorr(x1,L,'biased');
rx2 = xcorr(x2,L,'biased');

figure(1)
stem(rx0,'g','DisplayName','N0=20')
hold on
stem(rx1,'r','DisplayName','N1=200')
hold on
stem(rx2,'DisplayName','N2=20000')
title('Autocorelatia semnalului')
hold off

lgd = legend;
% Din formula (1.28) => Un zgomot alb de medie nula si dispersie ? este 
% un proces aleator e, pentru care auto-coreltia este egala cu delta0[k],
% adica este 1 cand k = 0 si 0 in rest
% Din grafice putem observa ca in rx[0] valoarea autocorelatiei este
% aproape de 1, iar celelalte valori tind la 0(2)
%Din (1) si (2) => randn genereaza un semnal apropiat de zgomotul alb


%b)
%Perioada este 6
omega0 = pi/3;
Ts = 1;

sin_disc0 = esantionare(omega0,Ts,61);

L1 = 19;
rx0= xcorr(sin_disc0,L1,'biased');  
[max,loc] = findpeaks(rx0);
min = islocalmin(rx0);
%Pozitiile unde se gasesc max: 2  8  14  20  26  32  38
% k = -18 -12 -6 0 6 12 18  vom considera partea pozitiva avand in vedere
% ca rx[k] = rx[-k] => daca facem diferenta a 2 pozitii consecutive ale
% pozitiilor punctelor de maxim local vom observa ca rezultatul este egal
% cu perioada semnalului initial
%Pozitiile unde se gasesc min in vectorul rx0 sunt:
% poz = 5 11 17 23 29 35 => se observa ca si in acest caz diferenta dintre oricare 2 pozitii
% alaturate este egala cu perioada (6)
% Se observa ca perioada semnalului este aceeasi cu perioada semnalului
% obtinut prin autocorelatie

%Perioada este 11
%omega1 = 2*pi/11;
%sin_disc1 = esantionare(omega1,Ts,111);

%rx1= xcorr(sin_disc1,L1,'biased');  
%[max1,loc1] = findpeaks(rx1);
%min1 = islocalmin(rx1);

figure(2)
stem(0:60,sin_disc0)
title('Semnal sinusoidal discret')
grid on

figure(3)
stem(0:38,rx0)
title('Autocorelatie semnal discret')
grid on

%figure(4)
%stem(0:110,sin_disc1)
%title('Semnal sinusoidal discret')
%grid on

%figure(5)
%stem(rx1)
%title('Autocorelatie semnal discret')
%grid on

%c)
load xilo.mat
[xilo,Fe_x] = audioread('xilo.wav');

x_xilo = xilo(8000:10000);
figure(4)
stem(x_xilo)
title('Xilo parte periodica')
grid on

rx_x_xilo = xcorr(x_xilo,100,'biased');
[max_xilo,loc_xilo] = findpeaks(rx_x_xilo);
%punctele de maxim local se gasesc pe pozitiile loc_xilo: 11 41 70 101 132
%161 191 
% Cum L = 100 => rx[0] se afla pe pozitia L + 1 = 101 => trecand pozitiile
% din vectorul rx_x_xilo ale maximelor la pozitiile corespunzatoare in k =>
% k =    -90 -60 -31 0 31 60 90 => analizand ca in cazul anterior,
% diferenta dintre oricare 2 pozitii alaturate vom obtine urmatoarele
% rezultate dif1 = 30; dif2 = 29; dif3 = 31 s.a.m.d => pseudo-perioada
% semnalului este aproximativ 30 (variatiile diferentelor apar intocmai pentru ca semnalul nu este "chiar" periodic  )

figure(5)
stem(rx_x_xilo)
title('Autocorelatia semnal xilo')
grid on

%d)
load sunet_a.mat
load sunet_i.mat
load sunet_s.mat

[a,Fe_a] = audioread('sunet_a.au');
[i,Fe_i] = audioread('sunet_i.au');
[s,Fe_s] = audioread('sunet_s.au');

rx_a = xcorr(a,39,'biased');
rx_s = xcorr(s,39,'biased');
medie_s = mean(s);
%Se poate observa ca media semnalului 's' este foarte aproape de 0 deci ne
%poate duce cu gandul la un semnal de tip zgomot alb; ramane de verificat
%valoarea dispersiei
rx_i = xcorr(i,39,'biased');

[max_a,loc_a] = findpeaks(rx_a);
[max_s,loc_s] = findpeaks(rx_s);
[max_i,loc_i] = findpeaks(rx_i);

figure(6)
plot(a)
title('Grafic sunet a')
grid on
%Cvasi-periodicitatea semnalului se poate observa atat in graficul aferent 
%semnalului, dar mai explicit se poate analiza metoda precedenta
%referitoare la pozitia maximelor in vectorul rx; pt L = 39 => pozitiile
%maximelor sunt : 12 20 28 40 52 60 68 => se poate observa ca diferenta
%dintre aceste pozitii este aproape constanta = 8 

figure(7)
plot(s)
title('Grafic sunet s')
grid on

%Cvasi-periodicitatea semnalului se poate observa atat in graficul aferent 
%semnalului, dar mai explicit se poate analiza metoda precedenta
%referitoare la pozitia maximelor in vectorul rx; pt L = 39 => pozitiile
%maximelor sunt :  2 5 8 11 14 17 20 23 25 28 32 34 36 40 44 46 48 52 55 57 60 63 66 69 72 75 78 => se poate observa ca diferenta
%dintre aceste pozitii este constanta = 3 



figure(8)
plot(i)
title('Grafic sunet i')
grid on

%Cvasi-periodicitatea semnalului se poate observa atat in graficul aferent 
%semnalului, dar mai explicit se poate analiza metoda precedenta
%referitoare la pozitia maximelor in vectorul rx; pt L = 39 => pozitiile
%maximelor sunt :  6 23 40 57 74 => se poate observa ca diferenta
%dintre aceste pozitii este constanta = 17

figure(9)
stem(rx_a)
title('Autocorelatia semnalului a')
grid on

figure(10)
stem(rx_s)
title('Autocorelatia semnalului s')
grid on
%Se poate observa ca intalnim un fenomen asemanator autocorelatiei obtinute
%la semnalul generat cu randn; spike-ul central din rx[0] are o valoare
%unitara, in timp ce restul valorilor tind spre 0, astfel putem spune ca
%sunetul s are caracteristici asemanatoare zgomotului alb, dar totusi, nu
%este un semnal de tip zgomot alb categoric

figure(11)
stem(rx_i)
title('Autocorelatia semnalului i')
grid on


