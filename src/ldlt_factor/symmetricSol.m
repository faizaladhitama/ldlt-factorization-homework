function [x] = symmetricSol(A,b)
  % A merupakan matriks simetri
  % b merupakan matriks berdimensi n x 1
  % x merupakan solusi dari Ax = b
  
  % bug : mengembalikan solusi dari Ax = b, b setelah dioperasikan
  %       pada ldltFactor() 
	[n,n] = size(A);
	[L,D,b] = ldltFactor(A,b);
	
	y = lowTriSol(L,b);
	w = diagonalSol(D,y);
	x = upTriSol(L',w);
  
end 