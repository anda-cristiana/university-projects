function [fi] = periodograma(X,N)
fi = (1/N).* abs(X).*abs(X);
end

