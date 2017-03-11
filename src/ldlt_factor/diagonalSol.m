function [x] = diagonalSol(D,b)
  % D merupakan matriks segitiga bawah
	% b merupakan matriks dengan dimensi n x 1
  % x merupakan solusi dari Dx = b
  [n,n] = size(D);
  x = zeros(n,1);
  
  for i = 1:n
    x(i) = b(i)/D(i,i);
  end
  
end