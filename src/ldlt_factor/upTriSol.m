function [x] = upTriSol(U,b)
	% U merupakan matriks dimensi n x 1
	% U merupakan matriks representasi dari matriks segitiga atas
	% dengan semua elemen dari diagonal utama bernilai 1
	% b merupakan matriks dengan dimensi n x 1
	% x merupakan solusi dari Ux = b
	[n,unused] = size(b);
	x = zeros(n,1);
	x(n) = b(n);
	p = n;
	for i = 2:n		
		sumProduct = 0;
		for j = 1:i-1
			sumProduct = sumProduct + U(p-j+1)*x(n-j+1);
		end
		p = p - i + 1;
		x(n-i+1) = b(n-i+1) - sumProduct;
	end
end