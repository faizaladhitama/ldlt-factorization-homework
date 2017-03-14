function [x] = lowTriSol(L,b)
	% L merupakan matriks dimensi n x 1
	% L merupakan matriks representasi dari matriks segitiga bawah
	% dengan semua elemen dari diagonal utama bernilai 1
	% b merupakan matriks dengan dimensi n x 1
	% x merupakan solusi dari Lx = b
	[n,unused] = size(b);
	x = zeros(n,1);
	x(1) = b(1);
	p = 1;
	for i = 2:n		
		sumProduct = 0;
		for j = 1:i-1
			sumProduct = sumProduct + L(p+j-1)*x(j);
		end
		p = p + i - 1;
		x(i) = b(i) - sumProduct;
	end
end