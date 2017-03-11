function [x] = upTriSol(U,b)
	% U merupakan matriks segitiga atas
	% b merupakan matriks dengan dimensi n x 1
  % x merupakan solusi dari Ux = b
	[n,n] = size(U);
	x = zeros(n,1);
	
	x(n) = b(n)/U(n,n);
	for i = n-1:-1:1
		x(i) = (b(i) - U(i,n:-1:i+1) * x(n:-1:i+1)) / U(i,i);
	end
end