function [h] = FIR(M,w_c,w_no)
% Functie care primeste ca parametru ordinul filtrului, frecventa de taiere
% si o constanta ce determina tipul ferestrei folosite
% 1 - Fereastra Dreptunghiulara   4 - Fereastra Chebyshev   7 - Fereastra Tuckey
% 2 - Fereastra Triunghiulara     5 - Fereastra Hamming     8 - Fereastra Kaiser
% 3 - Fereastra Blackman          6 - Fereastra Hanning     9 - Fereastra Lanczos
% Fereastra returneaza secventa pondere
switch(w_no)
    case 1
        w_boxcar = boxcar(M);
        h = fir1(M-1,w_c/pi, w_boxcar);
    case 2
        w_triang = triang(M);
        h = fir1(M-1,w_c/pi, w_triang);
    case 3
        w_Blackman = blackman(M);
        h = fir1(M-1,w_c/pi, w_Blackman);
    case 4
        w_Cebyshev = chebwin(M,90);
        h = fir1(M-1,w_c/pi, w_Cebyshev);
    case 5 
        w_Hamming = hamming(M);
        h = fir1(M-1,w_c/pi, w_Hamming);
    case 6 
        w_Hanning = hanning(M);
        h = fir1(M-1,w_c/pi, w_Hanning);
    case 7
        w_Tukey = tukeywin(M,0.5);
        h = fir1(M-1,w_c/pi, w_Tukey);
    case 8
        w_Kaiser = kaiser(M,2);
        h = fir1(M-1,w_c/pi, w_Kaiser);
    case 9
        w_Lanczos = lanczos(M,0.8);
        h = fir1(M-1, w_c/pi ,w_Lanczos);
end
end

