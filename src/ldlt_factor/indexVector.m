function [p] = indexVector(n)
  % mengembalikan vektor p, dimana p(i) = i
  % n merupakan bilangan bulat positif
  % p merupakan vektor n x 1
  p = zeros(n,1);
  
  for i=1:n
    p(i) = i;
  end
end