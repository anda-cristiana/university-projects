%% Legatura dintre poli,zerouri si raspunsul in frecventa
clc; clear all; close all;

%% Subpunctul a)
M = 2; %Numar zerouri; N poate sa ia valori intre 2 si 4
N = 4; %Numar poli;M poate sa ia valori intre 2 si 4

zerouri = [0.75 -0.75];
poli = [ -0.9 -0.7 0.8 0.7];

b = coef(M,zerouri);
a = coef(N,poli);

%Pentru a asigura faptul ca ecuatiile sunt bune cu ajutorul functiei pzmap
%retin valorile polilor in vectorul p, respectiv valorile zerourilor in
%vectorul z
sys = tf(b,a);
[p,z] = pzmap(sys);

w = -pi: 0.01:pi;

figure(1)
freqz(b, a, w);
title('Raspunsul in frecventa al filtrului 1');

figure(2)
zplane(b,a)
title('Diagrama poli-zerouri - Filtru 1')
xlim([-2 2])
ylim([-2 2])

% Distanta de la poli,respectiv zerouri la cercul unitar este cea care explica legatura
% dintre poli, respectiv zerouri si raspunsul in frecventa. Daca un pol
% este mai aproape de conturul cercului, decat un zero, atunci amplitudinea
% este semnificativa, in caz contrar, amplitudinea este "mica".

% In cazul curent, am ales poli si zerouri cu modulul mai mare/egal
% decat/cu 0.7 => atat polii cat si zerourile sunt aproape de conturul
% cercului.

% In graficul amplitudinii putem observa:
% 1) amplitudine initiala considerabila in omega0 = -1, datorita influentei
% celor doi poli foarte aproape de -1;
% 2) urmeaza o zona de scadere pana in w0 = -0.5, din cauza influentei
% zerourilor
% 3) graficul incepe sa creasca deoarece ne apropiem de cei doi poli
% situati pe axa reala pozitiva
% 4) in w0 = 1 ajungem la un nou peak datorat influentei celor doi poli
% foarte apropiati de cercul unitar.
% Avand in vedere ca poli si zerourile sunt dispusi relativ simetric, avand
% valori foarte apropiate, se produce din nou scaderea, urmata de creste
% pana ajungem in w0 = 1

%% Subpunctul b)

M1 = 2;
N1 = 3;

zerouri1 = [ 0.25+0.1429*j 0.25-0.1429*j];
poli1 = [-0.1 0.2 0.1];

b1 = coef(M1,zerouri1);
a1 = coef(N1,poli1);

sys1 = tf(b1,a1);
[p1,z1] = pzmap(sys1);
modul = abs(z1(1));

w1 = -pi:0.01:pi;

figure(3)
freqz(b1, a1, w1);
title('Raspunsul in frecventa al filtrului 2')

figure(4)
zplane(b1,a1)
title("Diagrama poli-zerouri - Filtru 2")
xlim([-2 2])
ylim([-2 2])

% Si in acest caz amplitudinea initiala este pozitiva deoarece cel mai
% apropait punct de cercul unitar este un pol, insa comparand amplitudinea
% observata la punctul a) cu cea observata la punctul b) putem remarca o
% diferenat considerabila; cea de-a doua este mult mai mica, deoarece polul
% este mai aproape de centrul cercului, decat de conturul cercului unitate.
% Amplitudinea scade datorita influentei celor doua zerouri(distanta de la 
% zeroul din cadranul 4 pana la conturul cercului este este mai mica) pana
% in w0 = 0 unde cei doi poli isi recapata influenta, facand ca amplitudinea
% sa creasca pana la w0 = 1;


