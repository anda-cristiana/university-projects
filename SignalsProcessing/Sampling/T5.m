N = 20; 
x = randn(1,N);

xi = -4:0.01:4;
sigma = sqrt(var(x));
miu = mean(x);
%calcul densitate de probabilitate conform formula(1.19)
dens = 1/ (sqrt(2*pi)*sigma) * exp(-((xi-miu).^2)/2*sigma.^2);

figure(1)
hist(x)
hold on
plot(xi,dens*N,'r')
grid on

%Am pornit de la N=20 adaugand de fiecare data cate un zero la finalul
%numarului si am observat apropierea dintre cele 2 grafice pe parcurs ce N
%creste 