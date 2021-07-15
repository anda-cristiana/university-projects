%% Filtre FIR de ordinul 2
clc; clear all; close all;

%% Subpunctul a)
theta = pi/4;

r1 = 0;
r2 = 0.25;
r3 = 0.5;
r4 = 0.75;
r5 = 1;
w = -pi: 0.01:pi;

b1 = [1 (-2)*r1*cos(theta) r1*r1];
H1 = freqz(b1,1,w);

b2 = [1 (-2)*r2*cos(theta) r2*r2];
H2 = freqz(b2,1,w);

b3 = [1 (-2)*r3*cos(theta) r3*r3];
H3 = freqz(b3,1,w);

b4 = [1 (-2)*r4*cos(theta) r4*r4];
H4 = freqz(b4,1,w);

b5 = [1 (-2)*r5*cos(theta) r5*r5];
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
xlabel('Frecventa')
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
xlabel('Frecventa')
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
xlabel('Frecventa')
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

% In cazul FIR de ord. 2 se observa 2 atenuari considerabile care se produc 
% in jurul lui omega = -theta si theta; ca urmare a celor doi coeficienti
% ai functiei ce depind de r. Cu cat r creste, atenuarea este mai
% observabila(ca si in cazul FIR de ord.1)

%% Subpunctul b)
theta1 = 5*pi/6;
w1 = -pi: 0.01: pi;

b1_1 = [1 (-2)*r1*cos(theta1) r1*r1];
H1_1 = freqz(b1_1,1,w1);

b2_1 = [1 (-2)*r2*cos(theta1) r2*r2];
H2_1 = freqz(b2_1,1,w1);

b3_1 = [1 (-2)*r3*cos(theta1) r3*r3];
H3_1 = freqz(b3_1,1,w1);

b4_1 = [1 (-2)*r4*cos(theta1) r4*r4];
H4_1 = freqz(b4_1,1,w1);

b5_1 = [1 (-2)*r5*cos(theta1) r5*r5];
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
xlabel('Frecventa')
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
xlabel('Frecventa')
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
xlabel('Frecventa')
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

% Analog Temei 1, figurile obtinute sunt similare, diferenta sta in
% punctele in care se produc cele 2 atenuari considerabile(in noul theta 
% considerat)



