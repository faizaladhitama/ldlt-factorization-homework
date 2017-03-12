function [x] = diagonalSol(D,b)
  % D merupakan matriks dimensi n x 1
  % D merupakan representasi dari matriks diagonal n x n
	% b merupakan matriks dengan dimensi n x 1
  % x merupakan solusi dari Dx = b
  [n,unused] = size(D);
  x = zeros(n,1);
  for i = 1:n
    x(i) = b(i)/D(i);
  end
end