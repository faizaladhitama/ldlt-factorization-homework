function [A] = randSymm(n)
  % Menghasilkan matriks simetri acak berdimensi n x n
  A = rand(n,n);
  for i = 1:n
    A(i,:) = A(:,i);
  end
end