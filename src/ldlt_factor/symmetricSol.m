function [x] = symmetricSol(A,b)
  % A merupakan matriks simetri
  % b merupakan matriks berdimensi n x 1
  % x merupakan solusi dari Ax = b
	[n,n] = size(A);
	[L,D,b,p] = ldltFactor(A,b);
	
	y = lowTriSol(L,b);
	w = diagonalSol(D,y);
	x = upTriSol(L',w);
  
  for i = 1:n
    if(ne(i,p(i)))
      tmp = x(i);
      x(i) = x(p(i));
      x(p(i)) = tmp;
      
      p(p(i)) = p(i);
      p(i) = i;
      
    end
  end
end 