
lynx;
%a)
load sunspot.dat

figure(1)
stem (sunspot (:, 1), sunspot (:, 2));
xlabel ('Anul');
ylabel ('Numarul de pete solare');
title ('Numarul de pete solare anual');

w = -pi: 0.01:pi;
X = freqz(sunspot(:,2),1,w);

figure(2)
plot(w,20*log10(abs(X)))
xlabel('w')
ylabel('|H(w)|_d_B')
title('Reprezentare in dB a spectrului semnalului')

w_max = 0.56841;
T = 2*pi/w_max;
%T = 11.0540 ~= 11

%primii 50 de ani
figure(3)
stem(sunspot(1:50,1),sunspot(1:50,2))
xlabel ('Anul');
ylabel ('Numarul de pete solare');
title ('Numarul de pete solare primii 50 de ani');

X_50 = freqz(sunspot(1:50,2),1,w);
figure(4)
plot(w,20*log10(abs(X_50)))
xlabel ('w')
ylabel ('|H50(w)|_d_B')
title ('Reprezentarea in dB a spectrului semnalului (primii 50 de ani)')

w_50_max = 0.57841;
T_50 = 2*pi / w_50_max;

%primii 100 de ani
figure(5)
stem(sunspot(1:100,1),sunspot(1:100,2))
xlabel ('Anul');
ylabel ('Numarul de pete solare');
title ('Numarul de pete solare primii 100 de ani');

X_100 = freqz(sunspot(1:100,2),1,w);
figure(6)
plot(w,20*log10(abs(X_100)))
xlabel ('w')
ylabel ('|H100(w)|_d_B')
title ('Reprezentarea in dB a spectrului semnalului (primii 100 de ani)')

w_100_max = 0.60841;
T_100 = 2*pi / w_100_max;

%Scaderea duratei face ca precizia de detereminare a perioadei sa fie mult
%mai mica, se observa ca in cele doua cazuri perioadele sunt diferite de 11
%Scaderea duratei timpului afecteaza numarul si forma liniilor spectrului

% figure(7)
% stem(sunspot(1:200,1),sunspot(1:200,2))
% xlabel ('Anul');
% ylabel ('Numarul de pete solare');
% title ('Numarul de pete solare primii 200 de ani');
% 
% X_200 = freqz(sunspot(1:200,2),1,w);
% figure(4)
% plot(w,20*log10(abs(X_200)),'-o')
% 
% w_200_max = 0.56841;
% T_200 = 2*pi / w_200_max;
% 

%b)
figure(7)
plot(year,lynx_t);
title ('Relatia Prada-Pradator')
xlabel('An:')
ylabel('Numar de rasi vanati:')


X_lynx = freqz(lynx_t,1,w);

figure(8)
plot(w,20*log10(abs(X_lynx)))
title('Spectru: Prada-Pradator')
xlabel('w')
ylabel('|Xlynx(w)|dB')

w_lynx_max = 0.64841;
T_lynx = 2*pi/w_lynx_max;

%primii 50 de ani
X_lynx_50 = freqz(lynx_t(1:50),1,w);
figure(9)
plot(w,20*log10(abs(X_lynx_50)))
title('Spectru: Prada-Pradator primii 50 de ani')
xlabel('w')
ylabel('|Xlynx(w)|dB')

w_lynx_50_max = 0.65841;
T_lynx_50 = 2*pi / w_lynx_50_max;

%primii 100 de  ani
X_lynx_100 = freqz(lynx_t(1:50),1,w);

figure(10)
plot(w,20*log10(abs(X_lynx_100)))
title('Spectru: Prada-Pradator primii 100 de ani')
xlabel('w')
ylabel('|Xlynx(w)|dB')

w_lynx_100_max = 0.65841;
T_lynx_100 = 2*pi / w_lynx_100_max;

%c)
load xilo.mat

[xilo,Fe_x] = audioread('xilo.wav');
x_xilo = xilo(8000:10000);

X_xilo = freqz(x_xilo,1,w);
figure(11)
plot(w,20*log10(abs(X_xilo)))
title('Spectru: Xilo parte periodica')
xlabel('w')
ylabel('|Xxilo(w)|dB')

w_xilo= 0.20159;
T_xilo = 2*pi / w_xilo;

X_xilo_500 = freqz(x_xilo(1:500),1,w);
figure(12)
plot(w,20*log10(abs(X_xilo_500)))
title('Spectru: Xilo parte periodica primele 500 de esantioane')
xlabel('w')
ylabel('|Xxilo(w)|dB')

w_xilo_500= 0.21159;
T_xilo_500 = 2*pi / w_xilo_500;

X_xilo_1000 = freqz(x_xilo(1:1000),1,w);
figure(13)
plot(w,20*log10(abs(X_xilo_1000)))
title('Spectru: Xilo parte periodica primele 1000 esantioane')
xlabel('w')
ylabel('|Xxilo(w)|dB')

w_xilo_1000= 0.21159;
T_xilo_1000 = 2*pi / w_xilo_1000;





