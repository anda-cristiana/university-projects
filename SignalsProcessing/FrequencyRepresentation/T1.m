%% Filtre FIR de ordinul 1
clc; clear all; close all;

%% Subpunctul a)
theta = pi/4;

r1 = 0;
r2 = 0.25;
r3 = 0.5;
r4 = 0.75;
r5 = 1;
w = -pi: 0.01:pi;

b1 = [1 (-r1)*exp(j*theta)];
H1 = freqz(b1,1,w);

b2 = [1 (-r2)*exp(j*theta)];
H2 = freqz(b2,1,w);

b3 = [1 (-r3)*exp(j*theta)];
H3 = freqz(b3,1,w);

b4 = [1 (-r4)*exp(j*theta)];
H4 = freqz(b4,1,w);

b5 = [1 (-r5)*exp(j*theta)];
H5 = freqz(b5,1,w);

w = w/pi;

figure(1)
subplot(3,1,1)
plot(w,abs(H1),'b')
hold on
plot(w,abs(H2),'r')
hold on
plot(w,abs(H3),'g')
hold on
plot(w,abs(H4),'m')
hold on
plot(w,abs(H5),'c')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,2)
plot(w,20*log10(abs(H1)),'b')
hold on
plot(w,20*log10(abs(H2)),'r')
hold on
plot(w,20*log10(abs(H3)),'g')
hold on
plot(w,20*log10(abs(H4)),'m')
hold on
plot(w,20*log10(abs(H5)),'k')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine(dB)')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,3)
plot(w,phase(H1),'b')
hold on
plot(w,phase(H2),'r')
hold on
plot(w,phase(H3),'g')
hold on
plot(w,phase(H4),'m')
hold on
plot(w,phase(H5),'k')
xlabel('Frecventa Normalizata')
ylabel('Faza')
legend('r1','r2','r3','r4')
hold off

figure(2)
zplane(b1,1)
hold on
zplane(b2,1)
hold on
zplane(b3,1)
hold on
zplane(b4,1)
hold on
zplane(b5,1)
title("Diagrama poli-zerouri")
xlim([-2 2])
ylim([-2 2])
hold off 


% Din grafice reiese ca daca valoarea lui r creste, atenuarea
% este din ce in ce mai vizibila; atenuarea cea mai considerabila
% producandu-se in jurul lui theta = pi/4 considerat. Graficul amplitudinii
% in dB, evidentiaza mult mai bine acest fenomen decat garficul la scara
% liniara.

%% Subpunctul b)

theta1 = pi/2;
w1 = -pi:0.01:pi;

b1_1= [1 (-r1)*exp(j*theta1)];
H1_1 = freqz(b1_1,1,w1);

b2_1 = [1 (-r2)*exp(j*theta1)];
H2_1 = freqz(b2_1,1,w1);

b3_1 = [1 (-r3)*exp(j*theta1)];
H3_1 = freqz(b3_1,1,w1);

b4_1 = [1 (-r4)*exp(j*theta1)];
H4_1 = freqz(b4_1,1,w1);

b5_1 = [1 (-r5)*exp(j*theta1)];
H5_1 = freqz(b5_1,1,w1);

w1 = w1/pi;
figure(3)
subplot(3,1,1)
plot(w1,abs(H1_1),'b')
hold on
plot(w1,abs(H2_1),'r')
hold on
plot(w1,abs(H3_1),'g')
hold on
plot(w1,abs(H4_1),'m')
hold on
plot(w1,abs(H5_1),'c')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,2)
plot(w1,20*log10(abs(H1_1)),'b')
hold on
plot(w1,20*log10(abs(H2_1)),'r')
hold on
plot(w1,20*log10(abs(H3_1)),'g')
hold on
plot(w1,20*log10(abs(H4_1)),'m')
hold on
plot(w1,20*log10(abs(H5_1)),'k')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine(dB)')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,3)
plot(w1,phase(H1_1),'b')
hold on
plot(w1,phase(H2_1),'r')
hold on
plot(w1,phase(H3_1),'g')
hold on
plot(w1,phase(H4_1),'m')
hold on
plot(w1,phase(H5_1),'k')
xlabel('Frecventa Normalizata')
ylabel('Faza')
legend('r1','r2','r3','r4')
hold off

figure(4)
zplane(b1_1,1)
hold on
zplane(b2_1,1)
hold on
zplane(b3_1,1)
hold on
zplane(b4_1,1)
hold on
zplane(b5_1,1)
title("Diagrama poli-zerouri")
xlim([-2 2])
ylim([-2 2])
hold off 

% Acest subpunct confirma concluzia initiala, referitoare producerea
% atenuarii puternice in jurul lui theta (de aceasta data fiind egal cu 
% pi/2). Daca comparam cele 2 figuri obtinute, vom observa un cadru
% similar, diferenta fiind produsa la nivelul punctului in care atenuarea
% este cea mai pronuntata ( in 1/4 in primul caz, respectiv 1/2 al doilea 
% caz)

