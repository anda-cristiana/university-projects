function [M_min,delta_pr_min,delta_sr_min] = bestOrder(M,w_c,w_no,w_p,w_s,delta_p,delta_s)
%functie care determina cel mai mic grad pe care il putem obtine pentru un
%filtu cu tolerantele impuse

best_M = 2; %gradul filtrului pe care ni l-am dori:)
M_min = 0; % consideram ca M_min este 0 initial si ii dam valoare pe parcurs

while(best_M <= M) % se evalueaza valorile din stanga ordinului considerat de proiectant
    h = FIR(best_M,w_c,w_no); % se determina secventa pondere
    [delta_pr, delta_sr] = errors(h,w_p,w_s); % se calculeaza abaterile maxime
    valid = test(delta_pr, delta_sr, delta_p, delta_s);  % se testeaza daca filtrul e valid 
    if((valid == 1) && (M_min == 0)) % daca este valid
        M_min = best_M;  % M_min va retine aceasta valoare minima a ordinului
        delta_pr_min = delta_pr;
        delta_sr_min = delta_sr;
    end
    best_M = best_M + 1;
end
if(M_min == 0) % daca nu s-a gasit un filtru valid pentru M_min <= M atunci se cauat pentru un M mai mare decat cel introdus in functie
    while(valid == 0) % cat timp filtrul nu este valid, cautam
        h = FIR(best_M,w_c,w_no); % se repeta procedura de mai sus
        [delta_pr, delta_sr] = errors(h,w_p,w_s);
        valid = test(delta_pr, delta_sr, delta_p, delta_s);
        best_M = best_M + 1;
    end
    M_min = best_M-1; % daca valid = 1 atunci se retine valoarea minima pentru care filtrul e valid
    delta_pr_min = delta_pr;
    delta_sr_min = delta_sr;
end
end

