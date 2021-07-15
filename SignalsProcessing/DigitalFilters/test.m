function [valid] = test(delta_pr,delta_sr,delta_p,delta_s)
if(delta_pr < delta_p && delta_sr < delta_s)
    valid = 1;
else
    valid = 0;
end
end

