function [x] = lowTriSol(L,b)
	% L merupakan matriks segitiga bawah
	% b merupakan matriks dengan dimensi n x 1
  % x merupakan solusi dari Lx = b
	n = size(b);
	x = zeros(n,1);
	
	x(1) = b(1)/L(1,1);
	for i = 2:n		
		x(i) = (b(i) - L(i,1:i-1) * x(1:i-1)) / L(i,i);
	end
end