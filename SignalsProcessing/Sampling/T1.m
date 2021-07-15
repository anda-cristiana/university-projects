N = 13;
w = pi/3;
phi = 0;
alpha = 2;


%SEMNALE DETERMINISTE

n = 0:(N-1); %suport de lungime N
imp_unit = eye(1,N); %impuls unitate
tr_unit = ones(1,N); %treapta unitate
e = alpha.^n; %semnal exponential
sin_real = sin(w*n + phi);
j = sqrt(-1);
sin_compl = exp(j*(w*n + phi));

figure(1)
stem(n,imp_unit)
title('Impuls unitar')
grid

figure(2)
stem(n,tr_unit)
title('Treapta unitara')
grid

figure(3)
stem(n,e)
title('Semnal exponential')
grid

figure(4)
stem(n,sin_real)
title('Sin real')
grid

figure(5)
stem(n,sin_compl)
title('Sin compl')
grid

%suma a 2 semnale cu acelasi suport
Suma = imp_unit + tr_unit;

%modulatia in timp
Modulatia = imp_unit.*tr_unit;

%convolutia
Convolutia = conv(imp_unit, tr_unit);

%SEMNALE NEDETERMINISTE
N1 = 10;

%cu distributie uniforma in [0,1]
x = rand(1,N1);

%cu distributie gaussiana de medie nula si dipersie unitara
y = randn(1,N1);

%Media unui semnal aleator
Media = mean(x);

%Auto-corelatia
%a)Nedeviata de lungime 2*N-1
r = xcorr(x,'unbiased');

%b)Deviata de lungime 2*N-1
rx = xcorr(x,'biased');

%Auto-covarianta
%a)Nedeviata de lungime 2*N-1
r1 = xcov(x,'unbiased');

%b)Deviata de lungime 2*N-1
rx2 = xcov(x,'biased');







