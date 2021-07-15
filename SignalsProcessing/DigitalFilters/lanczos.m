function [w] = lanczos(M,L)
if(L > 3 || L < 0)
    error('Valoarea parametrului L aferet ferestrei Lanczos, este in afara intervalului [0,3] !!!');
    return;
end

n = 0: 1: (M-1);
A =  sin(2*pi.*((2.*n - M + 1)/(2*(M - 1))));
B = 2*pi.*((2.*n - M + 1)/(2*(M - 1)));
w =(A ./ B).^L;
end

