function [L,D,p] = ldltFactor(A)
  % Mengembalikan L dan D hasil faktorisasi LDL'
  % dan p, dimana baris ke-p(i) ditukar dengan
  % baris ke-i pada matriks A pada operasi pivoting
  % A merupakan matriks simetri
  % L merupakan matriks segitiga bawah
  % D merupakan matriks diagonal
  % p merupakan matriks dengan dimensi n x 1 
  [n,n] = size(A);
  D = zeros(n,1);
  L = eye(n);
  p = indexVector(n);
  for i = 1:n
     % diagonal pivoting
    maxIdx = i;
    for j = i+1:n
      if(abs(A(j,j)) > abs(A(maxIdx, maxIdx)))
        maxIdx = j;
      end
    end
    %swapping
    if(ne(i,maxIdx))
      tmp = A(i,:);
      A(i,:) = A(maxIdx,:);
      A(maxIdx,:) = tmp;
      
      p(i) = maxIdx;
      p(maxIdx) = i;
      
      tmp = A(:,i);
      A(:,i) = A(:,maxIdx);
      A(:,maxIdx) = tmp;
    end
    %swapping end
    %diagonal pivoting end
    D(i) = A(i,i);
    for j=i+1:n
      L(j,i) = A(j,i)/A(i,i);
      A(j,i+1:n) = A(j,i+1:n) - L(j,i)*A(i,i+1:n);
    end
  end
end