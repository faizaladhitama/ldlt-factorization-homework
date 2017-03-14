function [x] = upTriSol(U,b)
	% U merupakan matriks dimensi n x 1
	% U merupakan matriks representasi dari matriks segitiga atas
	% dengan semua elemen dari diagonal utama bernilai 1
	% b merupakan matriks dengan dimensi n x 1
	% x merupakan solusi dari Ux = b
	[n,unused] = size(b);
  [len, unused] = size(U);
	x = zeros(n,1);
	x(n) = b(n);
	p1 = len;
	for i = 2:n		
    diff = n - 2;
    sum = 0;
    p2 = p1;
    for j = 1:i-1
      sum = sum + U(p2)*x(n-j+1);
      p2 = p2 - diff;
      diff = diff - 1;
    end
		p1 = p1 - 1;
		x(n-i+1) = b(n-i+1) - sum;
	end
end