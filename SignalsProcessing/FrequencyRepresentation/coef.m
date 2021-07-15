function [a] = coef(N,c)
%functie care calculeaza coeficientii polilor sau zerourilor
%inspirata din relatiile lui Viete
switch(N)
    case 2
      a = [1 -(c(1) + c(2)) c(1)*c(2)];
      
    case 3 
      a = [1 -(c(1)+c(2)+c(3)) c(1)*c(2)+c(1)*c(3)+c(3)*c(2) -(c(1)*c(2)*c(3))];
     
    case 4
      a = [1 -(c(1)+c(2)+c(3)+c(4)) c(1)*c(2)+c(1)*c(3)+c(1)*c(4)+c(2)*c(3)+c(2)*c(4)+c(3)*c(4) -(c(1)*c(2)*c(3)+c(1)*c(2)*c(4)+c(1)*c(3)*c(4)+c(2)*c(3)*c(4)) c(1)*c(2)*c(3)*c(4)]; 
end

end

