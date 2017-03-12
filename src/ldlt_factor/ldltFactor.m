function [L,D,b,p] = ldltFactor(A, b)
  % Mengembalikan L dan D hasil faktorisasi LDL'
  % dan b setelah dioperasikan, dan p, dimana p(i)
  % merupakan posisi b(i) setelah dioperasikan
  % A merupakan matriks simetri
  % L merupakan matriks segitiga bawah
  % D merupakan matriks diagonal
  % b merupakan matriks dengan dimensi n x 1
  % p merupakan matriks dengan dimensi n x 1 
  [n,n] = size(A);
  B = [A];
  D = zeros(n,n);
  L = eye(n);
  p = indexVector(n);
  
  for i = 1:n
     % diagonal pivoting
    maxIdx = i;
    for j = i+1:n
      if(abs(B(j,j)) > abs(B(maxIdx, maxIdx)))
        maxIdx = j;
      end
    end
    %swapping
    if(maxIdx ~= i)
      tmp = B(i,:);
      B(i,:) = B(maxIdx,:);
      B(maxIdx,:) = tmp;
      
      tmp = b(i);
      b(i) = b(maxIdx);
      b(maxIdx) = tmp;
      
      p(i) = maxIdx;
      p(maxIdx) = i;
      
      tmp = B(:,i);
      B(:,i) = B(:,maxIdx);
      B(:,maxIdx) = tmp;
    end
    %swapping end
    %diagonal pivoting end
    D(i,i) = B(i,i);
    for j=i+1:n
      L(j,i) = B(j,i) / B(i,i);
      B(j,i+1:n) = B(j,i+1:n) - L(j,i)*B(i,i+1:n);
    end
  end
end