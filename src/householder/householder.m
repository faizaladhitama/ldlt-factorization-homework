function [R, Bt] = householder(A,b)
[m,n] = size(A);
C =[A b];
for k = 1:(n-1)
    vw = C(k:m,k) + sign(C(k,k)) * norm(C(k:m,k))*[1;zeros(m-k,1)];
    alfa = 2/(vw'*vw);
    for j=k:n+1
        C(k:m,j) = C(k:m,j) - alfa*vw'*C(k:m,j)*vw;
    end
end

C