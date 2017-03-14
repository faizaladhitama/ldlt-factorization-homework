function [L,D,p] = ldltFactor(A,b)
  % Mengembalikan L dan D hasil faktorisasi LDL'
  % dan p, dimana baris ke-p(i) ditukar dengan
  % baris ke-i pada matriks A pada operasi pivoting
  % A merupakan matriks simetri
  % L merupakan matriks segitiga bawah
  % D merupakan matriks diagonal
  % p merupakan matriks dengan dimensi n x 1 
  [n,n] = size(A);
  D = zeros(n,1);
  L = zeros(n*(n-1)/2,1);
  p = indexVector(n);

  for i = 1:n
    max = i;
    for j = i+1:n
      if(gt(abs(A(j,j)),abs(A(max,max))))
        max = j;
      end
    end
    if(ne(i,max))
      tmp = A(i,:);
      A(i,:) = A(max,:);
      A(max,:) = tmp;
       
      tmp = A(:,i);
      A(:,i) = A(:,max);
      A(:,max) = tmp;
      
      tmp = p(i);
      p(i) = p(max);
      p(max) = tmp;
    end
  end
  
  for i = 1:n
    D(i) = A(i,i);
    c = i*(i+1)/2;
    for j=i+1:n
      L(c) = A(j,i)/A(i,i);
      A(j,i+1:n) = A(j,i+1:n) - L(c)*A(i,i+1:n);
      c = c + j - 1;
    end
  end
end