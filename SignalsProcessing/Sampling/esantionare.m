function [x] = esantionare(omega,Ts,M)
n = 0:(M-1);
x = sin(omega.*n.*Ts);
%am implementat functia de esantionare in conformitate cu relatia (1.1) din laorator 
end

