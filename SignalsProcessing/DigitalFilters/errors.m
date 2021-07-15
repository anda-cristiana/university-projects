function [delta_pr, delta_sr] = errors(h,w_p,w_s)
% functie care determina abaterile maxime din banda de trecere, respectiv
% banda de stopare pe baza filtrului primit si a frecventelor de stopare,
% respectiv de trecere
% eroare in banda de trecere
grila_frecv_p = 0: w_p/1000: w_p;
H = freqz(h,1,grila_frecv_p);
delta_pr = max(abs(1-abs(H)));

% eroare in banda de stopare
grila_frecv_s = w_s :w_s/1000: pi;
H = freqz(h,1,grila_frecv_s);
delta_sr = max(abs(H));
end

