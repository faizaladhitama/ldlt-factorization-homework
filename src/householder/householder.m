% A merupakan matriks m x n
% b merupakan matriks n x 1
% C merupakan matriks augmented dari A dan b yang sudah dilakukan householder, 
% dimana A merupakan mastriks segitiga atas
function [R, Bt] = householder(A,b)
[m,n] = size(A);
C =[A b];
for i = 1:(n-1)
    vw = C(i:m,i) + sign(C(i,i)) * norm(C(i:m,i))*[1;zeros(m-i,1)];
    alfa = 2/(vw'*vw);
    for j=i:n+1
        C(i:m,j) = C(i:m,j) - (alfa*vw'*C(i:m,j))*vw;
    end
end
C