function [x] = symmetricSol(A,b)
  % A merupakan matriks simetri
  % b merupakan matriks berdimensi n x 1
  % x merupakan solusi dari Ax = b
	[n,n] = size(A);
	[L,D,p] = ldltFactor(A);
  vtmp = zeros(n,1);
  
  for i = 1:n
    vtmp(i) = b(p(i));
  end
  
	y = lowTriSol(L,vtmp);
	w = diagonalSol(D,y);
	x = upTriSol(L,w);
  
  for i = 1:n
    if(ne(i,p(i)))
      for j = i+1:n
        if(eq(i,p(j)))   
          tmp = x(i);
          x(i) = x(j);
          x(j) = tmp;
          
          tmp = p(i);
          p(i) = p(j);
          p(j) = tmp;
        end
      end      
    end
  end
  
end 