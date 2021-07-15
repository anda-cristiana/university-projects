%% Filtre IIR autoregresive
clc; clear all; close all;

%% Subpunctul a)
%Theta fixat, r ia valori in intervalul [0,1]
theta = pi/3;

r1 = 0;
r2 = 0.25;
r3 = 0.5;
r4 = 0.75;
r5 = 1;
w = -pi: 0.01: pi;

a1 = [1 (-2)*r1*cos(theta) r1*r1];
a2 = [1 (-2)*r2*cos(theta) r2*r2];
a3 = [1 (-2)*r3*cos(theta) r3*r3];
a4 = [1 (-2)*r4*cos(theta) r4*r4];
a5 = [1 (-2)*r5*cos(theta) r5*r5];

G1 = freqz(1,a1,w);
G2 = freqz(1,a2,w);
G3 = freqz(1,a3,w);
G4 = freqz(1,a4,w);
G5 = freqz(1,a5,w);

w = w/pi;
figure(1)
subplot(3,1,1)
plot(w,abs(G1),'b')
hold on
plot(w,abs(G2),'r')
hold on
plot(w,abs(G3),'g')
hold on
plot(w,abs(G4),'m')
hold on
plot(w,abs(G5),'c')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,2)
plot(w,20*log10(abs(G1)),'b')
hold on
plot(w,20*log10(abs(G2)),'r')
hold on
plot(w,20*log10(abs(G3)),'g')
hold on
plot(w,20*log10(abs(G4)),'m')
hold on
plot(w,20*log10(abs(G5)),'k')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine(dB)')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,3)
plot(w,phase(G1),'b')
hold on
plot(w,phase(G2),'r')
hold on
plot(w,phase(G3),'g')
hold on
plot(w,phase(G4),'m')
hold on
plot(w,phase(G5),'k')
xlabel('Frecventa Normalizata')
ylabel('Faza')
legend('r1','r2','r3','r4')
hold off

figure(2)
zplane(1,a1)
hold on
zplane(1,a2)
hold on
zplane(1,a3)
hold on
zplane(1,a4)
hold on
zplane(1,a5)
title("Diagrama poli-zerouri")
xlim([-2 2])
ylim([-2 2])
hold off 

%Petru un nou theta:
theta1 = 5*pi/6;

a1_1 = [1 (-2)*r1*cos(theta1) r1*r1];
a2_1 = [1 (-2)*r2*cos(theta1) r2*r2];
a3_1 = [1 (-2)*r3*cos(theta1) r3*r3];
a4_1 = [1 (-2)*r4*cos(theta1) r4*r4];
a5_1 = [1 (-2)*r5*cos(theta1) r5*r5];

w1 = -pi: 0.01:pi;

G1_1 = freqz(1,a1_1,w1);
G2_1 = freqz(1,a2_1,w1);
G3_1 = freqz(1,a3_1,w1);
G4_1 = freqz(1,a4_1,w1);
G5_1 = freqz(1,a5_1,w1);

w1 = w1/pi;
figure(3)
subplot(3,1,1)
plot(w1,abs(G1_1),'b')
hold on
plot(w1,abs(G2_1),'r')
hold on
plot(w1,abs(G3_1),'g')
hold on
plot(w1,abs(G4_1),'m')
hold on
plot(w1,abs(G5_1),'c')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,2)
plot(w1,20*log10(abs(G1_1)),'b')
hold on
plot(w1,20*log10(abs(G2_1)),'r')
hold on
plot(w1,20*log10(abs(G3_1)),'g')
hold on
plot(w1,20*log10(abs(G4_1)),'m')
hold on
plot(w1,20*log10(abs(G5_1)),'k')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine(dB)')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,3)
plot(w1,phase(G1_1),'b')
hold on
plot(w1,phase(G2_1),'r')
hold on
plot(w1,phase(G3_1),'g')
hold on
plot(w1,phase(G4_1),'m')
hold on
plot(w1,phase(G5_1),'k')
xlabel('Frecventa Normalizata')
ylabel('Faza')
legend('r1','r2','r3','r4')
hold off

figure(4)
zplane(1,a1_1)
hold on
zplane(1,a2_1)
hold on
zplane(1,a3_1)
hold on
zplane(1,a4_1)
hold on
zplane(1,a5_1)
title("Diagrama poli-zerouri")
xlim([-2 2])
ylim([-2 2])
hold off 

% Graficele se obtin prin oglindirea graficelor petru FIR de ord. 2 fata de
% abcisa. Acest rezultat este unul intuitiv, considerand forma functiei de
% transfer 1/ functia de transfer a FIR ord.2

%% Subpunctul b)
w2 = -pi: 0.01:pi;

norm1 = 1 - 2*r1*cos(theta) + r1*r1;
norm2 = 1 - 2*r2*cos(theta) + r2*r2;
norm3 = 1 - 2*r3*cos(theta) + r3*r3;
norm4 = 1 - 2*r4*cos(theta) + r4*r4;
norm5 = 1 - 2*r5*cos(theta) + r5*r5;

G_star1 = freqz(norm1, a1, w2);
G_star2 = freqz(norm2, a2, w2);
G_star3 = freqz(norm3, a3, w2);
G_star4 = freqz(norm4, a4, w2);
G_star5 = freqz(norm5, a5, w2);

w2 = w2/pi;
figure(5)
subplot(3,1,1)
plot(w2,abs(G_star1),'b')
hold on
plot(w2,abs(G_star2),'r')
hold on
plot(w2,abs(G_star3),'g')
hold on
plot(w2,abs(G_star4),'m')
hold on
plot(w2,abs(G_star5),'c')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,2)
plot(w2,20*log10(abs(G_star1)),'b')
hold on
plot(w2,20*log10(abs(G_star2)),'r')
hold on
plot(w2,20*log10(abs(G_star3)),'g')
hold on
plot(w2,20*log10(abs(G_star4)),'m')
hold on
plot(w2,20*log10(abs(G_star5)),'k')
xlabel('Frecventa Normalizata')
ylabel('Amplitudine(dB)')
legend('r1','r2','r3','r4')
hold off

subplot(3,1,3)
plot(w2,phase(G_star1),'b')
hold on
plot(w2,phase(G_star2),'r')
hold on
plot(w2,phase(G_star3),'g')
hold on
plot(w2,phase(G_star4),'m')
hold on
plot(w2,phase(G_star5),'k')
xlabel('Frecventa Normalizata')
ylabel('Faza')
legend('r1','r2','r3','r4')
hold off

figure(6)
zplane(norm1,a1)
hold on
zplane(norm2,a2)
hold on
zplane(norm3,a3)
hold on
zplane(norm4,a4)
hold on
zplane(norm5,a5)
title("Diagrama poli-zerouri")
xlim([-2 2])
ylim([-2 2])
hold off 

%Se observa ca in cazul normarii toate liniile se suprapun spectrale se
%suprapun in w0 = 0;