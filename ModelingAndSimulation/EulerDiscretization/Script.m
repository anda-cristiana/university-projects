% ALEXANDRESCU Anda Cristiana
% 334AB
clc; close all; clear all

%% Cerinta a)
% Parametrii problema
Te=0.1;
s= tf('s');
H = (s-4)/((s+4)*(s*s+3.2*s+16));

%% Discretizare cu Euler explicit
z=tf('z', Te);
s=(z-1)/Te;
Hd1_eex = (s-4)/((s+4)*(s*s+3.2*s+16));

%% Raspunsul la intrarea data
% Simulare Simulink
T = 150; 
load_system('response'); 
set_param('response','StopTime',num2str(T));

t = linspace(0,T,1e3).';
f = @(t) 3.*cos(3.*t) + 2.*sin(6.*t);

u = timeseries(f(t),t);
out = sim('response');

% Prin apelarea functiei lsim
sys1 = tf([1 -4],[1 7.2 28.8 64]);
sys2 = tf([0.0001 - 0.00014],[0.01 -0.0228 0.01848 -0.00504]);

timp = linspace(0,5,1000);
u1 = (3.*cos(3.*timp) + 2.*sin(6.*timp));

y1 = lsim(sys1,u1,timp);
y2 = lsim(sys2,u1,timp);

figure(1)
subplot(2,1,1)
plot(out.y1.Time,out.y1.Data)
title('Raspunsul la intrarea u a sistemului continuu, H')
ylabel('out.y1.Data')
xlabel('out.y1.Time')
hold on
subplot(2,1,2)
plot(out.y2.Time,out.y2.Data)
title('Raspunsul la intrarea u a sistemului discretizat, Hd - Euler explicit')
ylabel('out.y2.Data')
xlabel('out.y2.Time')

figure(2)
subplot(2,1,1)
plot(timp,y1)
title('Raspunsul la intrarea u a sistemului continuu, H')
ylabel('y1')
xlabel('timp')
hold on
subplot(2,1,2)
plot(timp,y2)
title('Raspunsul la intrarea u a sistemului discretizat, Hd - Euler explicit')
ylabel('y2')
xlabel('timp')

%% Cerinta b)
% den(Hd1_eex) = 0.01*z^(3) - 0.0228*z^(2) + 0.01848*z^(1) - 0.00504;
% num(Hd1_eex) = - 0.00014 + 0.0001 * z ^ (1);

% => Impartim la z^3 si conform teoremei de intarziere 
% Ec cu diferente:
% 0.01*y[k] - 0.228*y[k-1] + 0.01848*[k-2] - 0.00504*y[k-3] = 0.0001*u[k-2]- 0.0014*u[k-3];
% y[k] = 0.228/0.01 *y[k-1] - 0.01848/0.01 *y[k-2] + 0.00504/0.01 *y[k-3] + 0.0001/0.01 *u[k-2]- 0.00014/0.01 *u[k-3]

u_sys = (3.*cos(3.*timp) + 2.*sin(6.*timp));
y1 = 0;
y2 = 0;
y3 = 0;
u0 = 0;
u1 = 0;
u2 = 0;
u3 = 0;

for k = 1:length(timp)
    u0 = u_sys(k);
    y(k) =  (0.0228/0.01)*y1  - (0.01848/0.01)*y2 + (0.00504/0.01)*y3 +(0.0001/0.01)*u2 - (0.00014/0.01)*u3;
    u3 = u2;
    u2 = u1;
    u1 = u0;
    y3 = y2;
    y3 = y2;
    y2 = y1;
    y1 = y(k);
end

figure(3)
title('Raspunsul la intrarea pentru ecuatia cu diferente')
plot(timp,y)
xlabel('timp')
ylabel('y')
