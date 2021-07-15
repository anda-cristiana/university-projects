%% Utilizarea Metodei ferestrei pentru rezolvarea PPFTI
clc;
clear;
close all;
%% Subpunctul a) si b)
% Initializare data de input
M = 16; %- M considerat initial , Kaiser e valid
% M = 20 - 1; - M considerat pentru care Lanczos e valid 
% M = 23 - 1; - M pentru care Hanning e valid
% M = 25 - 1; - M pentru care Hamming e valid
% M = 30 - 1; - M pentru care F. triunghiulara e valida
% M = 31 - 1; - M pentru care Blackman e valid
% M = 33 - 1; - M pentu care Chebyshev e valid
% M = 36 - 1; - M pentru care Tuckey e valid
% M = 43 - 1; - M pentru fereastra dreptunghiulara
w_p = 0.3*pi;
w_c = 0.4*pi;
w_s = 0.5*pi;

delta_p = 0.05;
delta_s = 0.05;

h_boxcar = FIR(M,w_c,1);
h_triang = FIR(M,w_c,2);
h_Blackman = FIR(M,w_c,3);
h_Cebyshev = FIR(M,w_c,4);
h_Hamming = FIR(M,w_c,5);
h_Hanning = FIR(M,w_c,6);
h_Tukey = FIR(M,w_c,7);
h_Kaiser = FIR(M,w_c,8);
h_Lanczos = FIR(M,w_c,9);

[delta_pr_boxcar, delta_sr_boxcar] = errors(h_boxcar,w_p,w_s);
[delta_pr_triang, delta_sr_triang] = errors(h_triang,w_p,w_s);
[delta_pr_Blackman, delta_sr_Blackman] = errors(h_Blackman,w_p,w_s);
[delta_pr_Cebyshev, delta_sr_Cebyshev] = errors(h_Cebyshev,w_p,w_s);
[delta_pr_Hamming, delta_sr_Hamming] = errors(h_Hamming,w_p,w_s);
[delta_pr_Hanning, delta_sr_Hanning] = errors(h_Hanning,w_p,w_s);
[delta_pr_Tukey, delta_sr_Tukey] = errors(h_Tukey,w_p,w_s);
[delta_pr_Kaiser, delta_sr_Kaiser] = errors(h_Kaiser,w_p,w_s);
[delta_pr_Lanczos, delta_sr_Lanczos] = errors(h_Lanczos,w_p,w_s);

valid_boxcar = test(delta_pr_boxcar, delta_sr_boxcar, delta_p, delta_s);
valid_triang = test(delta_pr_triang, delta_sr_triang, delta_p, delta_s);
valid_Blackman = test(delta_pr_Blackman, delta_sr_Blackman, delta_p, delta_s);
valid_Cebyshev = test(delta_pr_Cebyshev, delta_sr_Cebyshev, delta_p, delta_s);
valid_Hamming = test(delta_pr_Hamming, delta_sr_Hamming, delta_p, delta_s);
valid_Hanning = test(delta_pr_Hanning, delta_sr_Hanning, delta_p, delta_s);
valid_Tukey = test(delta_pr_Tukey, delta_sr_Tukey, delta_p, delta_s);
valid_Kaiser = test(delta_pr_Kaiser, delta_sr_Kaiser, delta_p, delta_s);
valid_Lanczos = test(delta_pr_Lanczos, delta_sr_Lanczos, delta_p, delta_s);


[M_min_box, delta_pr_b, delta_sr_b] = bestOrder(M,w_c,1,w_p,w_s,delta_p,delta_s);
[M_min_triang,delta_pr_t, delta_sr_t] = bestOrder(M,w_c,2,w_p,w_s,delta_p,delta_s);
[M_min_Blackman,delta_pr_B, delta_sr_B]= bestOrder(M,w_c,3,w_p,w_s,delta_p,delta_s);
[M_min_Cebyshev,delta_pr_C, delta_sr_C] = bestOrder(M,w_c,4,w_p,w_s,delta_p,delta_s);
[M_min_Hamming,delta_pr_Hm, delta_sr_Hm] = bestOrder(M,w_c,5,w_p,w_s,delta_p,delta_s);
[M_min_Hanning,delta_pr_Hn, delta_sr_Hn] = bestOrder(M,w_c,6,w_p,w_s,delta_p,delta_s);
[M_min_Tukey,delta_pr_T, delta_sr_T]= bestOrder(M,w_c,7,w_p,w_s,delta_p,delta_s);
[M_min_Kaiser,delta_pr_K, delta_sr_K] = bestOrder(M,w_c,8,w_p,w_s,delta_p,delta_s);